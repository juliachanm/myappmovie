import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../../environments/environment'; // <-- Importar environment

export interface Movie {
  id?: number;
  title: string;
  director?: string;
  synopsis?: string;
  cover?: string;
  cover_url?: string;
  year?: number;
  trailer_url?: string;
}

@Injectable({
  providedIn: 'root'
})
export class MoviesService {

  // 🔹 Usar la URL desde environment
  private apiUrl = environment.apiUrl;

  constructor(private http: HttpClient) {}

  getMovies(): Observable<Movie[]> {
    return this.http.get<Movie[]>(this.apiUrl);
  }

  getMovie(id: number): Observable<Movie> {
    return this.http.get<Movie>(`${this.apiUrl}/${id}`);
  }

  addMovie(movie: Movie): Observable<Movie> {
    return this.http.post<Movie>(this.apiUrl, movie);
  }

  updateMovie(id: number, movie: Movie): Observable<Movie> {
    return this.http.put<Movie>(`${this.apiUrl}/${id}`, movie);
  }

  deleteMovie(id: number): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/${id}`);
  }

  // 🔹 FormData para enviar imagen
  addMovieFormData(formData: FormData): Observable<Movie> {
    return this.http.post<Movie>(this.apiUrl, formData);
  }

  updateMovieFormData(id: number, formData: FormData): Observable<Movie> {
    formData.append('_method', 'PUT');
    return this.http.post<Movie>(`${this.apiUrl}/${id}`, formData);
  }

  // ✔ Aquí generamos la URL correcta que apunta a Railway
  getCoverUrl(cover?: string): string {
    if (!cover) return '';
    return `${environment.assetsUrl}/${cover}`;
  }
}