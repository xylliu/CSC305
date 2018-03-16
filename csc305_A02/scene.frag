uniform vec3 CameraPos;

uniform vec3 Ambient;
uniform vec3 Diffuse;
uniform vec3 Specular;
uniform float Shininess;

uniform int HasDiffuseMap;
uniform sampler2D DiffuseMap;
uniform int mode;

in vec2 fTexCoord;
in vec3 fragment_color;
out vec4 FragColor;

in vec3 normalInterp;
in vec3 vertPos;
in vec4 shadowMapCoord;
uniform sampler2DShadow ShadowMap;

const vec3 ambientColor = vec3(0.1, 0.1, 0.1);
void main()
{
    float visibility = textureProj(ShadowMap, shadowMapCoord)+1;
    // TODO: Replace with Phong shading
    //FragColor = vec4(1,1,1,1);
    vec3 normal = normalize(normalInterp);
    vec3 lightDir = normalize(CameraPos - vertPos);
    float lambertian = max(dot(lightDir,normal), 0.0);
    float specular = 0.0;
    vec3 viewDir = normalize(-vertPos);

        // this is blinn phong
        vec3 halfDir = normalize(lightDir + viewDir);
        float specAngle = max(dot(halfDir, normal), 0.0);
        specular = pow(specAngle, Shininess);

    vec3 diffuseMap = Diffuse;
    if (HasDiffuseMap != 0){
        diffuseMap = texture(DiffuseMap, fTexCoord).rgb;
        //diffuseMap = texture(DiffuseMap, fTexCoord).rgb;
    }else{
        diffuseMap = Diffuse;
    }
   vec3 color = vec3(0.0f) + lambertian * diffuseMap + specular * Specular;

      //FragColor = vec4(color, 1.0);
   FragColor = vec4(color * visibility, 1.0);
}
