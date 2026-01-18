uniform float time;
uniform vec2 uMouse;
uniform float uEnter;
uniform vec2 aspect;

varying vec2 vUv;
varying float vCircle;

void main() {
    vUv = uv;

    vec3 pos = position;

    vec2 aspectCorrectedMouse = vec2(
        uMouse.x * aspect.x / aspect.y,
        uMouse.y
    );

    vec2 aspectCorrectedUv = vec2(
        uv.x * aspect.x / aspect.y,
        uv.y
    );

    float dist = distance(aspectCorrectedMouse, aspectCorrectedUv);
    float radious = 0.5;
    float circle = smoothstep(radious,0.5, 0.0, dist);

    float wave = sin(dist * 20. - time*2.) * 10.0;

    pos.z += wave * circle;
    vCircle = wave * circle;

    gl_Position = projectionMatrix * modelViewMatrix * vec4(pos, 1.0);
}
