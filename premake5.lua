project "glew"
	kind "StaticLib"
	language "C"
	
	configmap 
	{
		["ReleaseWithInfo"] = "Release",
		["ReleaseNoImGui"] = "Release"
	}

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("obj/" .. outputdir .. "/%{prj.name}")

	files
	{
		"include/GL/glew.h",
		"src/glew.c"
	}

	includedirs
	{
		"include"
	}

	filter "system:windows"
		staticruntime "On"
		systemversion "latest"
		defines
		{
			"GLEW_STATIC",
			"_CRT_SECURE_NO_WARNINGS"
		}

	filter "system:linux"
		systemversion "latest"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "On"

	filter "configurations:Release"
		runtime "Release"
		optimize "On"
