data:extend
(
  {
    {
      type = "technology",
      name = "roboport-mini",
      icon = "__base__/graphics/technology/logistic-robotics.png",
      icon_size = 128,
      effects =
      {
        {
          type = "unlock-recipe",
          recipe = "roboport-mini"
        },
      },
      prerequisites = { "construction-robotics", "logistic-robotics" },
      unit =
      {
        count = 250,
        ingredients =
        {
          {"automation-science-pack", 1},
          {"logistic-science-pack", 1},
          {"chemical-science-pack", 1},
        },
        time = 30
      },
      order = "c-k-d",
    },
  }
)
