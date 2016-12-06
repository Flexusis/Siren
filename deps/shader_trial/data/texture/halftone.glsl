#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_TEXTURE_SHADER

varying vec4 vertTexCoord;
uniform sampler2D texture;

uniform int pixelsPerRow;

uniform vec2 mask_c;
uniform vec2 mask_d;

void main(void) {
  if(vertTexCoord.s > mask_c.s &&
	 vertTexCoord.s < mask_c.s + mask_d.s &&
	 vertTexCoord.t > mask_c.t &&
	 vertTexCoord.t < mask_c.t + mask_d.t){
	vec2 p = vertTexCoord.st;
	float pixelSize = 1.0 / float(pixelsPerRow);
	
	float dx = mod(p.x, pixelSize) - pixelSize*0.5;
	float dy = mod(p.y, pixelSize) - pixelSize*0.5;
	
	p.x -= dx;
	p.y -= dy;
	vec3 col = texture2D(texture, p).rgb;
	float bright = 0.3333*(col.r+col.g+col.b);
	
	float dist = sqrt(dx*dx + dy*dy);
	float rad = bright * pixelSize * 0.8;
	float m = step(dist, rad);

	vec3 col2 = mix(vec3(0.0), vec3(1.0), m);
	gl_FragColor = vec4(col2, texture2D(texture, vertTexCoord.st).a);
  }
  else{
	gl_FragColor = texture2D(texture, vertTexCoord.st);
  }
}
