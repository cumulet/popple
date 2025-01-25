vec3 linear_to_srgb(vec3 color) {
	// If going to srgb, clamp from 0 to 1.
	color = clamp(color, vec3(0.0), vec3(1.0));
	const vec3 a = vec3(0.055f);
	return mix(
		(vec3(1.0f) + a) * pow(color.rgb, vec3(1.0f / 2.4f)) - a,
		12.92f * color.rgb,
		lessThan(color.rgb, vec3(0.0031308f))
	);
}

vec3 srgb_to_linear(vec3 color) {
	return mix(
		pow((color.rgb + vec3(0.055)) * (1.0 / (1.0 + 0.055)), vec3(2.4)),
		color.rgb * (1.0 / 12.92),
		lessThan(color.rgb, vec3(0.04045))
	);
}

vec3 rotate_about_axis( vec3 position, vec3 axis, float angle ){
	float s = sin(angle);
	float c = cos(angle);
	float one_minus_c = 1.0 - c;

	axis = normalize(axis);
	
	mat3 rot_mat = mat3(
		vec3( one_minus_c * axis.x * axis.x + c, one_minus_c * axis.x * axis.y - axis.z * s, one_minus_c * axis.z * axis.x + axis.y * s ),
	    vec3( one_minus_c * axis.x * axis.y + axis.z * s, one_minus_c * axis.y * axis.y + c, one_minus_c * axis.y * axis.z - axis.x * s),
	    vec3( one_minus_c * axis.z * axis.x - axis.y * s, one_minus_c * axis.y * axis.z + axis.x * s, one_minus_c * axis.z * axis.z + c)
	);
	
	return rot_mat * position;
}

vec4 remap(vec4 In, vec2 InMinMax, vec2 OutMinMax){
    return OutMinMax.x + (In - InMinMax.x) * (OutMinMax.y - OutMinMax.x) / (InMinMax.y - InMinMax.x);
}

float random (vec2 uv) {
    return fract(sin(dot(uv.xy,
        vec2(12.9898,78.233))) * 43758.5453123);
}
