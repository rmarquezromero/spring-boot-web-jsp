package com.wbs;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class JSONUtil {

	static Gson gson = new Gson();

	/**
	 * Convierte el fichero JSON en un JsonObject
	 * 
	 * @param fileName
	 * @return JsonObject
	 */
	public static JsonObject convertFileToJSONObject(String filePath, boolean isDev) {

		// Read from File to String
		JsonObject jsonObject = new JsonObject();

		try {
			JsonParser parser = new JsonParser();
			JsonElement jsonElement = null;

			if (isDev) {
				// estamos en desarrollo
				ClassLoader classLoader = WebController.class.getClassLoader();
				URL url = classLoader.getResource(filePath);
				jsonElement = parser.parse(new FileReader(url.getFile()));
			} else {
				// estamos en pro
				jsonElement = parser.parse(new FileReader(filePath));
			}

			jsonObject = jsonElement.getAsJsonObject();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return jsonObject;
	}

	/**
	 * Convierte un archivo json en una lista de objetos de la clase pasada por
	 * parametro.
	 * 
	 * @param clazz
	 * @param url
	 * @param param
	 * @return List<T>
	 */
	public static <T> List<T> convertJSONFileToList(Class<T> clazz, String url, String param, boolean isDev) {

		List<T> list = null;

		try {
			JsonObject jsonObject = convertFileToJSONObject(url, isDev);
			JsonArray jsonArray = (JsonArray) jsonObject.get(param);

			list = new ArrayList<T>();

			for (JsonElement je : jsonArray) {
				list.add(gson.fromJson(je, clazz));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

}
