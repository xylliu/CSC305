layout(location = SCENE_POSITION_ATTRIB_LOCATION)
in vec4 Position;

layout(location = SCENE_TEXCOORD_ATTRIB_LOCATION)
in vec2 TexCoord;

layout(location = SCENE_NORMAL_ATTRIB_LOCATION)
in vec3 Normal;

out vec2 fTexCoord;
out vec3 normalInterp;
out vec3 vertPos;
out vec4 shadowMapCoord;

uniform mat4 ModelWorld;
uniform mat4 ModelViewProjection;
uniform mat3 Normal_ModelWorld;
uniform mat4 lightMatrix;


void main()
{
    // TODO: Set to MVP * P
    //gl_Position = vec4(0,0,0,1);
    gl_Position = ModelViewProjection * Position;
    vec4 vertPos4 = ModelWorld * Position;
    vertPos = vec3(vertPos4) / vertPos4.w;
    normalInterp = normalize(Normal_ModelWorld * Normal);
    shadowMapCoord = lightMatrix * Position;
    // TODO: Pass vertex attributes to fragment shader
    //fragment_color = vec3(1,1,1);
    fTexCoord = TexCoord;
}
