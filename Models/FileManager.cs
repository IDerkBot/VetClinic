﻿using System;
using System.IO;
using Newtonsoft.Json;

namespace VetClinic.Models
{
	internal class FileManager
	{
		public static Config GetConfig() { return JsonConvert.DeserializeObject<Config>(File.ReadAllText(GetPathConfig())); }
		public static void SetConfig(Config settings) { File.WriteAllText(GetPathConfig(), JsonConvert.SerializeObject(settings)); }
		public static string GetPathConfig()
		{
			var path = $@"{GetFolderAppData()}{Data.CurrentConfigFile}.{Data.CurrentConfigExtension}";
			if (File.Exists(path)) return path;
			File.Create(path).Dispose();
			var settings = new Config();
			File.WriteAllText(path, JsonConvert.SerializeObject(settings));
			return path;
		}
		public static string GetFolderAppData()
		{
			var appDataPath = Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData);
			var path = $@"{appDataPath}\{Data.CurrentDirectory}\";
			if (!Directory.Exists(path))
				Directory.CreateDirectory($@"{appDataPath}\{Data.CurrentDirectory}\");
			return path;
		}
	}
}