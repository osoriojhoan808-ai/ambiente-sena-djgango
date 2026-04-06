import os
import uuid

from django.core.serializers import serialize
from django.http import HttpResponse

from django.db import DatabaseError
from django.shortcuts import redirect, render
from django.contrib import messages
from django.core.files.storage import FileSystemStorage

from AmbienteSena import settings
from AmbienteSena.Models.ambiente import Ambiente
from AmbienteSena.Models.elemento import Elemento


def RegistrarElemento(request):
    ambientes = Ambiente.objects.all().order_by('NombreAmbiente')
    if request.method == 'POST':
        # Verificamos que todos los campos lleguen en el POST
        if request.POST.get('nombre') and request.POST.get('tipo') and request.FILES.get('foto') and request.POST.get('observaciones') and request.POST.get('ambiente'):
            try:
                ambiente = Ambiente.objects.get(id=request.POST.get('ambiente'))
                elemento = Elemento()
                elemento.Nombre = request.POST.get('nombre')
                elemento.Tipo = request.POST.get('tipo')
                elemento.Observaciones = request.POST.get('observaciones')
                elemento.ambiente = ambiente
                
                # Manejo de archivos e imágenes
                foto = request.FILES.get('foto')
                imagen_storage = FileSystemStorage(location='AmbienteSena/Public/Img/elementos')
                
                # CORRECCIÓN: splitext (con 't')
                extension = os.path.splitext(foto.name)[1]
                nombre_aleatorio = str(uuid.uuid4()) + extension
                
                imagen_storage.save(nombre_aleatorio, foto)
                elemento.Foto = nombre_aleatorio

                elemento.save()
                messages.success(request, 'Elemento Registrado Correctamente')
                return redirect('/Elementos/ListarElementos')
            
            except DatabaseError as e:
                messages.error(request, f'Ocurrio un error en el sistema {e}')
                return render(request, 'Elementos/RegistrarElemento.html', {'ambientes': ambientes})
        else:
            messages.error(request, 'Todos los campos son obligatorios')
            return render(request, 'Elementos/RegistrarElemento.html', {'ambientes': ambientes})
    
    # Si el método es GET
    return render(request, 'Elementos/RegistrarElemento.html', {'ambientes': ambientes})


def ListarElementos(request):
    try:
        listadoelementos = Elemento.objects.all().order_by('-id')
        listadoambientes = Ambiente.objects.all().order_by('NombreAmbiente')
        return render(request, 'Elementos/ListarElementos.html', {
            'listadoelementos': listadoelementos,
            'ambientes': listadoambientes
        })
    except DatabaseError as e:
        messages.error(request, f'Ocurrio un error en el sistema {e}')
        # CORRECCIÓN: Siempre debe haber un return HttpResponse o redirect
        return redirect('/') 


def APIConsultarElemento(request, idelemento):
    elemento = Elemento.objects.filter(id=idelemento)
    elementoJson = serialize('json', elemento)
    return HttpResponse(elementoJson, content_type='application/json')


def ActualizarElemento(request):
    if request.method == 'POST':
        try:
            if request.POST.get('nombre') and request.POST.get('tipo') and request.POST.get('observaciones') and request.POST.get('ambiente'):
                # Buscamos el elemento existente para actualizarlo
                id_elemento = request.POST.get('idelemento')
                elemento = Elemento.objects.get(id=id_elemento)
                
                elemento.Nombre = request.POST.get('nombre')
                elemento.Tipo = request.POST.get('tipo')
                elemento.Observaciones = request.POST.get('observaciones')
                elemento.ambiente = Ambiente.objects.get(id=request.POST.get('ambiente'))

                if request.FILES.get('foto'):
                    # Si sube una foto nueva, la procesamos
                    nueva_foto = request.FILES.get('foto')
                    imagen_storage = FileSystemStorage(location='AmbienteSena/Public/Img/elementos')
                    
                    extension = os.path.splitext(nueva_foto.name)[1]
                    nombre_aleatorio = str(uuid.uuid4()) + extension
                    
                    imagen_storage.save(nombre_aleatorio, nueva_foto)
                    
                    # Opcional: Borrar la foto vieja si existe
                    foto_vieja = request.POST.get('nombre-foto')
                    if foto_vieja:
                        try:
                            os.remove(os.path.join('AmbienteSena/Public/Img/elementos', foto_vieja))
                        except:
                            pass
                            
                    elemento.Foto = nombre_aleatorio
                else:
                    # Si no sube foto nueva, mantenemos la que ya tenía
                    elemento.Foto = request.POST.get('nombre-foto')

                elemento.save()
                messages.success(request, 'Elemento actualizado correctamente')
                return redirect('/Elementos/ListarElementos')
            else:
                messages.error(request, 'ERROR: FALTAN DATOS EN EL FORMULARIO')
                return redirect('/Elementos/ListarElementos')
        
        except (DatabaseError, Elemento.DoesNotExist) as e:
            messages.error(request, f'OCURRIO UN ERROR EN EL SISTEMA {e}')
            return redirect('/Elementos/ListarElementos')
            
    # Si no es POST, redirigir
    return redirect('/Elementos/ListarElementos')


def EliminarElemento(request):
    if request.method == 'POST':
        id_eliminar = request.POST.get('id')
        if id_eliminar:
            try:
                elemento = Elemento.objects.get(id=id_eliminar)
                # Intentar borrar el archivo físico
                if elemento.Foto:
                    ruta_imagen = settings.RUTA_IMAGENES_ELEMENTOS / str(elemento.Foto)
                    if ruta_imagen.exists():
                        os.remove(ruta_imagen)
                
                elemento.delete()
                messages.success(request, 'Elemento eliminado correctamente')
            except (DatabaseError, Elemento.DoesNotExist) as e:
                messages.error(request, f'Ocurrio un error en el sistema {e}')
            
            return redirect('/Elementos/ListarElementos')
        else:
            messages.error(request, 'El id del elemento no existe')
            return redirect('/Elementos/ListarElementos')
            
    return redirect('/Elementos/ListarElementos')