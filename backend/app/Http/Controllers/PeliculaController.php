<?php

namespace App\Http\Controllers;

use App\Models\Movie;
use Illuminate\Http\Request;

class PeliculaController extends Controller
{
    // Mostrar todas las películas
    public function index()
    {
        $movies = Movie::all();

        // Ajustar ruta de portada para producción
        foreach ($movies as $movie) {
            if ($movie->cover) {
                $movie->cover = '/assets/' . basename($movie->cover);
            }
        }

        return response()->json($movies);
    }

    // Mostrar una película específica
    public function show($id)
    {
        $movie = Movie::find($id);
        if ($movie && $movie->cover) {
            $movie->cover = '/assets/' . basename($movie->cover);
        }
        return response()->json($movie);
    }

    // Almacenar una nueva película
    public function store(Request $request)
    {
        // Validación
        $request->validate([
            'title' => 'required|string|max:255',
            'director' => 'nullable|string|max:255',
            'synopsis' => 'nullable|string',
            'cover' => 'nullable|file|mimes:jpg,jpeg,png,gif|max:2048',
            'year' => 'nullable|integer',
            'trailer_url' => 'nullable|url',
        ]);

        // Crear la película
        $movie = Movie::create($request->all());

        // Subida de archivo opcional
        if ($request->hasFile('cover')) {
            $file = $request->file('cover');
            $filename = time() . '_' . $file->getClientOriginalName();
            $file->move(public_path('assets'), $filename); // Guardar en public/assets
            $movie->cover = '/assets/' . $filename;        // Ruta relativa para Angular
            $movie->save();
        }

        return response()->json($movie, 201);
    }

    // Actualizar una película existente
    public function update(Request $request, $id)
    {
        $movie = Movie::findOrFail($id);

        // Validación
        $request->validate([
            'title' => 'required|string|max:255',
            'director' => 'nullable|string|max:255',
            'synopsis' => 'nullable|string',
            'cover' => 'nullable|file|mimes:jpg,jpeg,png,gif|max:2048',
            'year' => 'nullable|integer',
            'trailer_url' => 'nullable|url',
        ]);

        // Actualizar campos
        $movie->title = $request->title;
        $movie->director = $request->director;
        $movie->synopsis = $request->synopsis;
        $movie->year = $request->year;
        $movie->trailer_url = $request->trailer_url;

        // Subida de archivo opcional
        if ($request->hasFile('cover')) {
            $file = $request->file('cover');
            $filename = time() . '_' . $file->getClientOriginalName();
            $file->move(public_path('assets'), $filename);
            $movie->cover = '/assets/' . $filename;
        }

        $movie->save();

        return response()->json($movie, 200);
    }

    // Eliminar una película
    public function destroy($id)
    {
        Movie::destroy($id);
        return response()->json(null, 204);
    }
}
