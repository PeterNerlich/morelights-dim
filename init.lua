local S = minetest.get_translator("morelights_dim")

local dim_factor = 3/5

local dim = function(x)
    return math.ceil(x*dim_factor)
end

minetest.register_node("morelights_dim:block", {
    description = S("Dim Modern Light Block"),
    tiles = {"morelights_metal_dark.png^morelights_dim_block.png"},
    paramtype = "light",
    light_source = dim(minetest.LIGHT_MAX),
    groups = {cracky = 2, oddly_breakable_by_hand = 3, handy = 1},
    _mcl_hardness = 0.3,
    sounds = morelights.sounds.glass
})

minetest.register_node("morelights_dim:smallblock", {
    description = S("Dim Modern Light Block (small)"),
    drawtype = "nodebox",
    node_box = {
        type = "fixed",
        fixed = {-1/4, -1/2, -1/4, 1/4, 0, 1/4}
    },
    tiles = {
        "morelights_metal_dark.png^morelights_dim_smallblock.png",
        "morelights_metal_dark.png^morelights_dim_smallblock.png",
        "[combine:16x16:0,0=morelights_metal_dark.png" ..
                ":0,4=morelights_dim_smallblock.png"
    },
    paramtype = "light",
    paramtype2 = "facedir",
    sunlight_propagates = true,
    light_source = dim(12),
    groups = {cracky = 3, oddly_breakable_by_hand = 3, handy = 1},
    _mcl_hardness = 0.2,
    sounds = morelights.sounds.glass,

    on_place = function(itemstack, placer, pointed_thing)
        return morelights.rotate_and_place(itemstack, placer, pointed_thing)
    end
})

morelights.register_variants({
    {
        name = "morelights_dim:post_d",
        description = S("Dim Modern Post Light (@1)", S("dark")),
        tiles = {
            "morelights_metal_dark.png",
            "morelights_metal_dark.png",
            "morelights_metal_dark.png^morelights_dim_post.png"
        }
    },
    {
        name = "morelights_dim:post_l",
        description = S("Dim Modern Post Light (@1)", S("light")),
        tiles = {
            "morelights_metal_light.png",
            "morelights_metal_light.png",
            "morelights_metal_light.png^morelights_dim_post.png"
        }
    }
},
{
    drawtype = "nodebox",
    node_box = {
        type = "fixed",
        fixed = {-1/8, -1/2, -1/8, 1/8, 1/2, 1/8}
    },
    paramtype = "light",
    sunlight_propagates = true,
    light_source = dim(minetest.LIGHT_MAX),
    groups = {cracky = 3, oddly_breakable_by_hand = 3, handy = 1},
    _mcl_hardness = 0.3,
    sounds = morelights.sounds.metal
})

minetest.register_node("morelights_dim:barlight_c", {
    description = S("Dim Ceiling Bar Light (connecting)"),
    drawtype = "nodebox",
    node_box = {
        type = "connected",
        fixed = {-1/8,  3/8, -1/8, 1/8,  1/2, 1/8},
        connect_front = {-1/8, 3/8, -1/2, 1/8,  1/2, -1/8},
        connect_left = {-1/2, 3/8, -1/8, -1/8, 1/2, 1/8},
        connect_back = {-1/8, 3/8, 1/8, 1/8, 1/2, 1/2},
        connect_right = {1/8, 3/8, -1/8, 1/2, 1/2, 1/8},
    },
    connects_to = {
        "morelights_dim:barlight_c",
        "morelights_dim:barlight_s",
        "morelights_modern:barlight_c",
        "morelights_modern:barlight_s",
        "morelights_modern:streetpost_d",
        "morelights_modern:streetpost_l"
    },
    tiles = {
        "morelights_metal_dark.png",
        "morelights_dim_barlight.png",
        "morelights_metal_dark.png"
    },
    paramtype = "light",
    sunlight_propagates = true,
    light_source = dim(minetest.LIGHT_MAX),
    groups = {cracky = 2, oddly_breakable_by_hand = 3, handy = 1, not_blocking_trains = 1},
    _mcl_hardness = 0.15,
    sounds = morelights.sounds.glass
})

-- TODO: Determine orientation of bar lights from nearby nodes.
minetest.register_node("morelights_dim:barlight_s", {
    description = S("Dim Ceiling Bar Light (straight)"),
    drawtype = "nodebox",
    node_box = {
        type = "fixed",
        fixed = {-1/2, 3/8, -1/8, 1/2, 1/2, 1/8},
    },
    tiles = {
        "morelights_metal_dark.png",
        "morelights_dim_barlight.png",
        "morelights_metal_dark.png"
    },
    paramtype = "light",
    paramtype2 = "facedir",
    sunlight_propagates = true,
    light_source = dim(minetest.LIGHT_MAX),
    groups = {cracky = 2, oddly_breakable_by_hand = 3, handy = 1, not_blocking_trains = 1},
    _mcl_hardness = 0.15,
    sounds = morelights.sounds.glass
})

minetest.register_node("morelights_dim:lightdot", {
    description = S("Dim Modern Light Dot"),
    drawtype = "nodebox",
    node_box = {
        type = "fixed",
        fixed = {-1/8,  7/16, -1/8, 1/8,  1/2, 1/8}
    },
    tiles = {
        "morelights_metal_dark.png",
        "morelights_metal_dark.png",
        "morelights_dim_lightdot.png"
    },
    paramtype = "light",
    paramtype2 = "facedir",
    sunlight_propagates = true,
    light_source = dim(minetest.LIGHT_MAX),
    groups = {cracky = 3, oddly_breakable_by_hand = 3, handy = 1, not_blocking_trains = 1},
    _mcl_hardness = 0.2,
    sounds = morelights.sounds.glass,

    on_place = function(itemstack, placer, pointed_thing)
        return morelights.rotate_and_place(itemstack, placer, pointed_thing,
            {[0] = 0, 20, 12, 16, 4, 8})
    end
})

morelights.register_variants({
    {
        name = "morelights_dim:canlight_d",
        description = S("Dim Modern Can Light (@1)", S("dark")),
        tiles = {"morelights_metal_dark.png^morelights_dim_canlight.png"}
    },
    {
        name = "morelights_dim:canlight_l",
        description = S("Dim Modern Can Light (@1)", S("light")),
        tiles = {"morelights_metal_light.png^morelights_dim_canlight.png"}
    },
},
{
    drawtype = "mesh",
    mesh = "morelights_modern_canlight.obj",
    collision_box = {
        type = "fixed",
        fixed = {-1/8, 0, -1/8, 1/8, 1/2, 1/8}
    },
    selection_box = {
        type = "fixed",
        fixed = {-1/8, 0, -1/8, 1/8, 1/2, 1/8}
    },
    paramtype = "light",
    sunlight_propagates = true,
    light_source = dim(12),
    groups = {cracky = 2, oddly_breakable_by_hand = 3, handy = 1},
    _mcl_hardness = 0.2,
    sounds = morelights.sounds.metal
})

minetest.register_node("morelights_dim:walllamp", {
    description = S("Dim Modern Wall Lamp"),
    drawtype = "mesh",
    mesh = "morelights_modern_walllamp.obj",
    collision_box = {
        type = "fixed",
        fixed = {-1/8, -3/8, 1/8, 1/8, 1/4, 1/2}
    },
    selection_box = {
        type = "fixed",
        fixed = {-1/8, -3/8, 1/8, 1/8, 1/4, 1/2}
    },
    tiles = {"morelights_metal_dark_32.png^morelights_dim_walllamp.png"},
    paramtype = "light",
    paramtype2 = "facedir",
    sunlight_propagates = true,
    light_source = dim(12),
    groups = {cracky = 2, oddly_breakable_by_hand = 3, handy = 1},
    _mcl_hardness = 0.2,
    sounds = morelights.sounds.glass,

    on_place = function(itemstack, placer, pointed_thing)
        return morelights.rotate_and_place(itemstack, placer, pointed_thing,
            {[0] = 6, 4, 1, 3, 0, 2})
    end
})

morelights.register_variants({
    {
        name = "morelights_dim:tablelamp_d",
        description = S("Dim Modern Table Lamp (@1)", S("dark")),
        tiles = {
            "morelights_metal_light_32.png^morelights_dim_tablelamp_o.png",
            "morelights_dim_tablelamp_d.png"
        }
    },
    {
        name = "morelights_dim:tablelamp_l",
        description = S("Dim Modern Table Lamp (@1)", S("light")),
        tiles = {
            "morelights_metal_dark_32.png^morelights_dim_tablelamp_o.png",
            "morelights_dim_tablelamp_l.png"
        }
    },
},
{
    drawtype = "mesh",
    mesh = "morelights_modern_tablelamp.obj",
    collision_box = {
        type = "fixed",
        fixed = {-1/4, -1/2, -1/4, 1/4, 7/16, 1/4}
    },
    selection_box = {
        type = "fixed",
        fixed = {-1/4, -1/2, -1/4, 1/4, 7/16, 1/4}
    },
    paramtype = "light",
    sunlight_propagates = true,
    light_source = dim(10),
    groups = {choppy = 2, oddly_breakable_by_hand = 3, handy = 1},
    _mcl_hardness = 0.2,
    sounds = morelights.sounds.default
})

morelights.register_variants({
    {
        name = "morelights_dim:pathlight_d",
        description = S("Dim Modern Path Light (@1)", S("dark")),
        tiles = {
            "morelights_metal_dark_32.png^morelights_dim_pathlight.png"
        }
    },
    {
        name = "morelights_dim:pathlight_l",
        description = S("Dim Modern Path Light (@1)", S("light")),
        tiles = {
            "morelights_metal_light_32.png^morelights_dim_pathlight.png"
        }
    }
},
{
    drawtype = "nodebox",
    node_box = {
        type = "fixed",
        fixed = {
            {-1/32, -8/16, -1/32, 1/32, 1/8, 1/32},
            {-1/16, 1/8, -1/16, 1/16, 5/16, 1/16},
            {-1/8, 5/16, -1/8, 1/8, 3/8, 1/8}
        }
    },
    selection_box = {
        type = "fixed",
        fixed = {-1/8, -1/2, -1/8, 1/8, 3/8, 1/8}
    },
    paramtype = "light",
    sunlight_propagates = true,
    light_source = dim(8),
    groups = {cracky = 3, oddly_breakable_by_hand = 3, handy = 1},
    _mcl_hardness = 0.2,
    sounds = morelights.sounds.metal
})

--
-- Craft recipes
--

local a = morelights.craft_items

minetest.register_craft({
    output = "morelights_dim:block",
    recipe = {
        {a.tin, a.steel, a.tin},
        {a.glass_pane, "morelights:bulb", a.glass_pane},
        {"", a.steel, ""}
    }
})
minetest.register_craft({
    output = "morelights_dim:block",
    type = "shapeless",
    recipe = {a.tin, "morelights_modern:block"}
})

minetest.register_craft({
    output = "morelights_dim:smallblock",
    recipe = {
        {a.tin, a.glass_pane, ""},
        {a.steel, "morelights:bulb", a.steel}
    }
})
minetest.register_craft({
    output = "morelights_dim:smallblock",
    type = "shapeless",
    recipe = {a.tin, "morelights_modern:smallblock", ""}
})

minetest.register_craft({
    output = "morelights_dim:post_d",
    recipe = {
        {a.dye_dark, a.steel, ""},
        {a.tin, "morelights:bulb", ""},
        {"", a.steel, ""}
    }
})
minetest.register_craft({
    output = "morelights_dim:post_d",
    type = "shapeless",
    recipe = {a.tin, "morelights_modern:post_d", ""}
})

minetest.register_craft({
    output = "morelights_dim:post_l",
    recipe = {
        {a.dye_light, a.steel, ""},
        {a.tin, "morelights:bulb", ""},
        {"", a.steel, ""}
    }
})
minetest.register_craft({
    output = "morelights_dim:post_l",
    type = "shapeless",
    recipe = {a.tin, "morelights_modern:post_l", ""}
})

minetest.register_craft({
    output = "morelights_dim:barlight_c 4",
    recipe = {
        {a.steel, a.steel, a.steel},
        {a.copper, a.glass, a.copper},
        {"", a.tin, ""}
    }
})

minetest.register_craft({
    output = "morelights_dim:barlight_c",
    type = "shapeless",
    recipe = {"morelights_dim:barlight_s"}
})

minetest.register_craft({
    output = "morelights_dim:barlight_c",
    type = "shapeless",
    recipe = {"morelights_modern:barlight_c", a.tin}
})

minetest.register_craft({
    output = "morelights_dim:barlight_s",
    type = "shapeless",
    recipe = {"morelights_dim:barlight_c"}
})

minetest.register_craft({
    output = "morelights_dim:barlight_s",
    type = "shapeless",
    recipe = {"morelights_modern:barlight_s", a.tin}
})

minetest.register_craft({
    output = "morelights_dim:lightdot 4",
    recipe = {
        {a.tin, "morelights:bulb", a.steel},
    }
})

minetest.register_craft({
    output = "morelights_dim:canlight_d",
    recipe = {
        {a.dye_dark, a.steel, a.tin},
        {a.steel, "morelights:bulb", a.steel},
    }
})

minetest.register_craft({
    output = "morelights_dim:canlight_d",
    type = "shapeless",
    recipe = {"morelights_modern:canlight_d", a.tin}
})

minetest.register_craft({
    output = "morelights_dim:canlight_l",
    recipe = {
        {a.dye_light, a.steel, a.tin},
        {a.steel, "morelights:bulb", a.steel},
    }
})

minetest.register_craft({
    output = "morelights_dim:canlight_l",
    type = "shapeless",
    recipe = {"morelights_modern:canlight_l", a.tin}
})

minetest.register_craft({
    output = "morelights_dim:walllamp",
    recipe = {
        {a.tin, a.glass_pane, a.tin},
        {a.glass_pane, "morelights:bulb", a.steel},
        {"", a.dye_dark, a.steel}
    }
})

minetest.register_craft({
    output = "morelights_dim:walllamp",
    type = "shapeless",
    recipe = {"morelights_modern:walllamp", a.tin}
})

minetest.register_craft({
    output = "morelights_dim:tablelamp_d",
    recipe = {
        {a.tin, a.steel, ""},
        {a.wool_dark, "morelights:bulb", a.wool_dark},
        {"", a.steel, ""}
    }
})

minetest.register_craft({
    output = "morelights_dim:tablelamp_d",
    type = "shapeless",
    recipe = {"morelights_modern:tablelamp_d", a.tin}
})

minetest.register_craft({
    output = "morelights_dim:tablelamp_l",
    recipe = {
        {a.tin, a.steel, ""},
        {a.wool_light, "morelights:bulb", a.wool_light},
        {"", a.steel, ""}
    }
})

minetest.register_craft({
    output = "morelights_dim:tablelamp_l",
    type = "shapeless",
    recipe = {"morelights_modern:tablelamp_l", a.tin}
})

minetest.register_craft({
    output = "morelights_dim:pathlight_d",
    recipe = {
        {a.dye_dark, "morelights:bulb", ""},
        {a.tin, a.steel, ""},
        {"", a.steel, ""}
    }
})

minetest.register_craft({
    output = "morelights_dim:pathlight_d",
    type = "shapeless",
    recipe = {"morelights_modern:pathlight_d", a.tin}
})

minetest.register_craft({
    output = "morelights_dim:pathlight_l",
    recipe = {
        {a.dye_light, "morelights:bulb", ""},
        {a.tin, a.steel, ""},
        {"", a.steel, ""}
    }
})

minetest.register_craft({
    output = "morelights_dim:pathlight_l",
    type = "shapeless",
    recipe = {"morelights_modern:pathlight_l", a.tin}
})
