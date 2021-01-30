local hit_effects = require ("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

-- 3.3 pixel shift for std size

circuit_connector = circuit_connector_definitions.create
(
  universal_connector_template,
  {
    {
      variation = 26,
      main_offset = util.by_pixel(9.2, 19.4),
      shadow_offset = util.by_pixel(20.5, 56.5),
      show_shadow = false
    }
  }
)

data:extend(
  {
    {
      type = "roboport",
      name = "roboport-mini",
      icon = "__base__/graphics/icons/roboport.png",
      icon_size = 64, icon_mipmaps = 4,
      flags = {"placeable-player", "player-creation"},
      minable = {mining_time = 0.1, result = "roboport-mini"},
      max_health = 250,
      corpse = "roboport-remnants",
      dying_explosion = "roboport-explosion",
      collision_box = {{-0.85, -0.85}, {0.85, 0.85}},
      selection_box = {{-1, -1}, {1, 1}},
      damaged_trigger_effect = hit_effects.entity(),
      resistances =
      {
        {
          type = "fire",
          percent = 60
        },
        {
          type = "impact",
          percent = 30
        }
      },
      energy_source =
      {
        type = "electric",
        usage_priority = "secondary-input",
        input_flow_limit = "5MW",
        buffer_capacity = "100MJ"
      },
      recharge_minimum = "40MJ",
      energy_usage = "50kW",
      -- per one charge slot
      charging_energy = "1000kW",
      logistics_radius = 12,
      construction_radius = 28,
      charge_approach_distance = 5,
      robot_slots_count = 2,
      material_slots_count = 2,
      stationing_offset = {0, 0},
      charging_offsets =
      {
        {-0.75, 0.25}, {0.75, 0.25}
      },
      base =
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/roboport/roboport-base.png",
            width = 143,
            height = 135,
            shift = util.by_pixel(8.7, 4.5),
            scale = 0.5,
            hr_version =
            {
              filename = "__base__/graphics/entity/roboport/hr-roboport-base.png",
              width = 228,
              height = 277,
              shift = util.by_pixel(1.5, 3.33),
              scale = 0.25
            }
          },
          {
            filename = "__base__/graphics/entity/roboport/roboport-shadow.png",
            width = 147,
            height = 101,
            draw_as_shadow = true,
            shift = util.by_pixel(30, 30),
            scale = 0.5,
            hr_version =
            {
              filename = "__base__/graphics/entity/roboport/hr-roboport-shadow.png",
              width = 294,
              height = 201,
              draw_as_shadow = true,
              force_hr_shadow = true,
              shift = util.by_pixel(13.8, 8.4),
              scale = 0.25
            }
          }
        }
      },
      base_patch =
      {
        filename = "__MiniRoboports__/graphics/roboport-base-patch.png",
        priority = "medium",
        width = 79,
        height = 61,
        frame_count = 1,
        shift = util.by_pixel(2.7, 4.5),
        scale = 0.5,
        hr_version =
        {
          filename = "__MiniRoboports__/graphics/hr-roboport-base-patch.png",
          priority = "medium",
          width = 153,
          height = 123,
          frame_count = 1,
          shift = util.by_pixel(0.61, 3.3),
          scale = 0.25
        }
      },
      base_animation =
      {
        filename = "__base__/graphics/entity/roboport/roboport-base-animation.png",
        priority = "medium",
        width = 42,
        height = 31,
        frame_count = 8,
        animation_speed = 0.5,
        shift = util.by_pixel(-8.4, -33),
        scale = 0.5,
        hr_version =
        {
          filename = "__base__/graphics/entity/roboport/hr-roboport-base-animation.png",
          priority = "medium",
          width = 83,
          height = 59,
          frame_count = 8,
          animation_speed = 0.5,
          shift = util.by_pixel(-8.10, -28.2),
          scale = 0.25
        }
      },
      door_animation_up =
      {
        filename = "__base__/graphics/entity/roboport/roboport-door-up.png",
        priority = "medium",
        width = 52,
        height = 20,
        frame_count = 16,
        shift = util.by_pixel(1.5, -13.7),
        scale = 0.5,
        hr_version =
        {
          filename = "__base__/graphics/entity/roboport/hr-roboport-door-up.png",
          priority = "medium",
          width = 97,
          height = 38,
          frame_count = 16,
          shift = util.by_pixel(0.6, -15.3),
          scale = 0.25
        }
      },
      door_animation_down =
      {
        filename = "__base__/graphics/entity/roboport/roboport-door-down.png",
        priority = "medium",
        width = 52,
        height = 22,
        frame_count = 16,
        shift = util.by_pixel(1.5, -4.2),
        scale = 0.5,
        hr_version =
        {
          filename = "__base__/graphics/entity/roboport/hr-roboport-door-down.png",
          priority = "medium",
          width = 97,
          height = 41,
          frame_count = 16,
          shift = util.by_pixel(0.6, -5.8),
          scale = 0.25
        }
      },
      recharging_animation =
      {
        filename = "__base__/graphics/entity/roboport/roboport-recharging.png",
        priority = "high",
        width = 37,
        height = 35,
        frame_count = 16,
        scale = 0.75,
        animation_speed = 0.5
      },
      vehicle_impact_sound = sounds.generic_impact,
      open_sound = sounds.machine_open,
      close_sound = sounds.machine_close,
      working_sound =
      {
        sound = { filename = "__base__/sound/roboport-working.ogg", volume = 0.4 },
        max_sounds_per_type = 3,
        audible_distance_modifier = 0.75,
        --probability = 1 / (5 * 60) -- average pause between the sound is 5 seconds
      },
      recharging_light = {intensity = 0.2, size = 3, color = {r = 0.5, g = 0.5, b = 1.0}},
      request_to_open_door_timeout = 15,
      spawn_and_station_height = -0.1,

      draw_logistic_radius_visualization = true,
      draw_construction_radius_visualization = true,

      open_door_trigger_effect = sounds.roboport_door_open,
      close_door_trigger_effect = sounds.roboport_door_close,

      circuit_wire_connection_point = circuit_connector.points,
      circuit_connector_sprites = circuit_connector.sprites,
      circuit_wire_max_distance = default_circuit_wire_max_distance,

      default_available_logistic_output_signal = {type = "virtual", name = "signal-X"},
      default_total_logistic_output_signal = {type = "virtual", name = "signal-Y"},
      default_available_construction_output_signal = {type = "virtual", name = "signal-Z"},
      default_total_construction_output_signal = {type = "virtual", name = "signal-T"},

      water_reflection =
      {
        pictures =
        {
          filename = "__base__/graphics/entity/roboport/roboport-reflection.png",
          priority = "extra-high",
          width = 28,
          height = 28,
          shift = util.by_pixel(0, 37.5),
          variation_count = 1,
          scale = 2.5,
        },
        rotate = false,
        orientation_to_variation = false
      }
    },
  }
)
