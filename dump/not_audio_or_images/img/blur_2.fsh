#ifdef GL_ES
precision mediump float;
#endif

varying vec4 v_fragmentColor;
varying vec2 v_texCoord;

vec4 blur();

vec4 get(vec2, float);

void main(void)
{
    vec4 col = blur(); //* v_fragmentColor.rgb;
    gl_FragColor = vec4(col) * v_fragmentColor;
}

vec4 get(vec2 p, float weight){
    return texture2D(CC_Texture0, v_texCoord + p) * weight;
}

vec4 blur()
{
    float r = (1.0 / 720.0) * 1.25;
    vec4 col = vec4(0);

    float blurUnit = 1.0 / 16.0;

    col += get(vec2(-(r * 1.0), -(r * 1.0)), blurUnit * 1.0);
    col += get(vec2((r * 0.0),  -(r * 1.0)), blurUnit * 2.0);
    col += get(vec2((r * 1.0),  -(r * 1.0)), blurUnit * 1.0);

    col += get(vec2(-(r * 1.0), (r * 0.0)), blurUnit * 2.0);
    col += get(vec2((r * 0.0),  (r * 0.0)), blurUnit * 4.0);
    col += get(vec2((r * 1.0),  (r * 0.0)), blurUnit * 2.0);

    col += get(vec2(-(r * 1.0), (r * 1.0)), blurUnit * 1.0);
    col += get(vec2((r * 0.0),  (r * 1.0)), blurUnit * 2.0);
    col += get(vec2((r * 1.0),  (r * 1.0)), blurUnit * 1.0);

    return col;
}