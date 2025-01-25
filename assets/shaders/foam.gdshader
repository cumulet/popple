shader_type spatial;

uniform vec4 albedo : source_color = vec4(1.0);
uniform sampler2D texture_albedo : source_color, filter_linear_mipmap, repeat_enable;
uniform sampler2D texture_normal : source_color, filter_linear_mipmap, repeat_enable;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec4 albedo_tex = texture(texture_albedo, UV);
	vec4 normal_tex = texture(texture_normal, UV);
	ALBEDO = albedo.rgb * albedo_tex.rgb;
	NORMAL = normal_tex;
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
