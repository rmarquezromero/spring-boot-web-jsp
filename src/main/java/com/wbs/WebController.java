package com.wbs;

import java.io.FileWriter;
import java.io.Writer;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Comparator;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.wbs.entities.DataResponse;
import com.wbs.entities.Film;

@Controller
public class WebController {

	// constants
	private final static String ENVIRONMENT_DEVELOPMENT = "DEV";
	private final static String FILEPATH_JSON_FILMS_DEV = "static/json/films.json";
	private final static String FILEPATH_JSON_FILMS_PRO = System.getProperty("user.dir") + "\\films.json";

	// attributes from application.properties
	@Value("${main.title}")
	private String title;
	@Value("${main.author}")
	private String author;
	@Value("${main.job}")
	private String job;
	@Value("${main.year}")
	private String year;

	@Value("${app.environment}")
	private String appEnvironment;

	// filepath json films
	private String filepathJsonFilms;

	@RequestMapping("/")
	public String welcome(Map<String, Object> model) {
		model.put("title", this.title);
		model.put("author", this.author);
		model.put("job", this.job);
		model.put("year", this.year);

		return "main";
	}

	@RequestMapping("/about")
	public String about(Map<String, Object> model) {
		model.put("author", this.author);
		model.put("job", this.job);
		model.put("year", this.year);

		return "about";
	}

	/**
	 * Obtiene la lista de peliculas y la devuelve a la vista.
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("/films")
	public String getFilms(Map<String, Object> model) {

		List<Film> films = null;

		try {
			films = getFilmsFromJSON();
		} catch (Exception e) {
			e.printStackTrace();
		}

		model.put("films", films);
		return "films";
	}

	/**
	 * Devuelve la lista de peliculas del json
	 * 
	 * @return
	 */
	private List<Film> getFilmsFromJSON() {
		List<Film> films = null;

		try {
			films = JSONUtil.convertJSONFileToList(Film.class, getFilepathJsonFilms(), "films", isDev());
		} catch (Exception e) {
			e.printStackTrace();
		}

		return films;
	}

	/**
	 * Añade una pelicula al json y devuelve la lista a la vista.
	 * 
	 * @param film
	 * @param result
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/addFilm", method = RequestMethod.POST)
	public String addFilm(@Valid @ModelAttribute("film") Film film, BindingResult result, ModelMap model) {
		if (result.hasErrors()) {
			return "error";
		}
		List<Film> films = null;

		try {
			// Obtenemos las peliculas existentes
			films = getFilmsFromJSON();

			if (!isNullOrEmpty(films)) {

				// Ordenamos por la key
				films.sort(Comparator.comparing(Film::getKey));

				// Seteamos key a la nueva pelicula
				film.setKey(films.get(films.size() - 1).getKey() + 1);

			} else {

				// Es la primera pelicula
				films = new ArrayList<Film>();
				film.setKey(1);
			}

			// Añadimos la nueva
			films.add(film);

			// Escribimos json
			overwriteJSONFile(films);

		} catch (Exception e) {
			e.printStackTrace();
		}

		model.put("films", films);
		return "films";
	}

	/**
	 * Borra una pelicula de la lista de peliculas
	 * 
	 * @param key
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/removeFilm", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody String removeFilm(@RequestParam("key") Integer key, ModelMap model) {
		// request.getParameterMap()
		List<Film> films = null;

		try {
			films = JSONUtil.convertJSONFileToList(Film.class, getFilepathJsonFilms(), "films", isDev());

			if (key != null) {
				films.removeIf(Film -> Film.getKey() == key);
			}

			// Escribimos json
			overwriteJSONFile(films);

		} catch (Exception e) {
			e.printStackTrace();
		}
		model.put("films", films);
		return "films";
	}

	/**
	 * Sobrescribe el fichero json de peliculas
	 * 
	 * @param films
	 * @throws Exception
	 */
	private void overwriteJSONFile(List<Film> films) throws Exception {
		// Creamos el data response
		DataResponse dr = new DataResponse();
		dr.setFilms(films);

		// Escribimos en el fichero
		ClassLoader classLoader = WebController.class.getClassLoader();
		String nameFile = "";

		if (isDev()) {
			URL url = classLoader.getResource(FILEPATH_JSON_FILMS_DEV);
			nameFile = url.getFile();
		} else {
			nameFile = FILEPATH_JSON_FILMS_PRO;
		}

		try (Writer writer = new FileWriter(nameFile)) {
			Gson gson = new GsonBuilder().create();
			gson.toJson(dr, writer);
		}
	}

	/**
	 * Devuelve true si una lista es null o vacia
	 * 
	 * @param list
	 * @return
	 */
	public static <T> boolean isNullOrEmpty(Collection<T> list) {
		return list == null || list.isEmpty();
	}

	/**
	 * Devuelve true si el entorno es de desarrollo.
	 * 
	 * @return
	 */
	public boolean isDev() {
		boolean isDev = false;

		if (appEnvironment.equalsIgnoreCase(ENVIRONMENT_DEVELOPMENT)) {
			isDev = true;
		}

		return isDev;
	}

	public String getFilepathJsonFilms() {

		if (isDev()) {
			filepathJsonFilms = FILEPATH_JSON_FILMS_DEV;
		} else {
			filepathJsonFilms = FILEPATH_JSON_FILMS_PRO;
		}

		return filepathJsonFilms;
	}

	public void setFilepathJsonFilms(String filepathJsonFilms) {
		this.filepathJsonFilms = filepathJsonFilms;
	}

}