import qbs

CppApplication {
    consoleApplication: true
    files: [
        "aabb.h",
        "box.h",
        "bvh_node.h",
        "camera.h",
        "constant_medium.h",
        "hitable.h",
        "hitable_list.h",
        "isotropic.h",
        "main.cpp",
        "material.h",
        "moving_sphere.h",
        "perlin.h",
        "ray.h",
        "rotate_y.h",
        "sphere.h",
        "stb_image.h",
        "texture.h",
        "translate.h",
        "vec3.h",
    ]

    Group {     // Properties for the produced executable
        fileTagsFilter: product.type
        qbs.install: true
    }
}
