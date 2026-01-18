precision mediump float;

varying vec2 vUv;
varying float vCircle;

uniform sampler2D uTexture;

void main() {

    vec4 tex = texture2D(uTexture, vUv);

    gl_FragColor = vec4(vCircle, 0.0, 0.0, 1.0);
}
