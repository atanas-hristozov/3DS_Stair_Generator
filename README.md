Sure! Here's a polished GitHub `README.md` for your MaxScript-based stair generator:

---

# 🪜 Stair Generator for 3ds Max

A simple MaxScript tool for generating 3D staircases based on user-defined parameters. Ideal for architectural modeling, visualization, or game level prototyping within Autodesk 3ds Max.

## 📦 Features

- Interactive UI built with rollouts
- User-defined **total stair height**
- Adjustable **step width**
- Automatically calculated number of steps to keep step height between **15.0 to 17.0 units**
- Real-time stair generation with preview

## 🎮 Getting Started

### 🔧 Requirements

- Autodesk 3ds Max (any version supporting MaxScript)
- Basic familiarity with MaxScript rollout usage

### 🚀 Installation

1. Open 3ds Max.
2. Open the **Scripting > New Script** window.
3. Paste the script into the editor.
4. Run the script.
5. The "Stair Generator" UI will appear.

## 🖥️ Usage

1. **Enter stair height**: This is the total vertical height of the staircase (1 to 10,000 units).
2. **Enter step width**: The width of each stair step (1 to 1,000 units).
3. Click **"Generate Stair"** to create a staircase based on the input.

Steps will be created as box primitives, stacked appropriately in 3D space.

## ⚙️ How It Works

- The script calculates the **optimal number of steps** so that each step’s height is between `15.0` and `17.0` units.
- It fixes the **step depth** at `30` units for a consistent appearance.
- All steps are created without deleting previously generated stairs, allowing for iterative design.

## 📝 Code Highlights

```maxscript
local numSteps = ceil(height / 15.0)
local stepHeight = height / numSteps

if stepHeight < 15.0 then
    numSteps = ceil(height / 15.0)
else if stepHeight > 17.0 then
    numSteps = ceil(height / 17.0)

-- Each step:
step = box width:stepWidth length:stepDepth height:stepHeight
step.position = [0, i * stepDepth, i * stepHeight]
```

## ❗ Notes

- The script does not delete previously created steps. Clear your scene if needed before regenerating.
- Error handling is included for UI creation.

## 🧑‍💻 Author

Script by [Your Name Here] — feel free to fork and enhance!

## 📜 License

This project is open-source under the [MIT License](LICENSE).

---

Let me know if you want this tailored for a company or with custom branding!
