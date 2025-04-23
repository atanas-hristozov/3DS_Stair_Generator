-- Create a stair based on the user-defined height
rollout stairRollout "Stair Generator" width:200
(
    -- Spinner for user to input height, constrained between 1 and 10,000
    spinner stairHeightSpinner "Enter stair height:" range:[1, 10000, 300] type:#float
    -- Spinner for user to input step width, constrained between 1 and 1000, default is 100
    spinner stepWidthSpinner "Enter step width:" range:[1, 1000, 100] type:#float
    button generateButton "Generate Stair" width:100

    -- A variable to store the generated steps
    local stairObjects = #()

    -- Function to create the stairs
    fn createStairs height stepWidth =
    (
        -- Fixed step depth
        local stepDepth = 30    -- Depth of each step

        -- Initial number of steps based on the user height
        local numSteps = ceil(height / 15.0)  -- Starting with a lower bound (15.0) for stepHeight
        
        -- Calculate stepHeight based on number of steps
        local stepHeight = height / numSteps

        -- Ensure that the stepHeight is within the desired range (15.0 to 17.0)
        if stepHeight < 15.0 then
        (
            -- Increase the number of steps to fit within the range
            numSteps = ceil(height / 15.0)
            stepHeight = height / numSteps
        )
        else
        (
            if stepHeight > 17.0 then
            (
                -- Decrease the number of steps to fit within the range
                numSteps = ceil(height / 17.0)
                stepHeight = height / numSteps
            )
        )

        -- Create the steps without deleting the old ones
        for i = 0 to numSteps - 1 do
        (
            -- Create a box for each step with user-defined width and fixed depth
            local step = box width:stepWidth length:stepDepth height:stepHeight
            -- Position each step according to its index
            step.position = [0, i * stepDepth, i * stepHeight]
            -- Add the created step to the stairObjects array
            append stairObjects step
        )
        
        -- Output the chosen step height and total number of steps to the listener
        format "Chosen Step Height: %\nTotal Steps: %\n" stepHeight numSteps
    )

    -- When the button is pressed, generate the stairs
    on generateButton pressed do
    (
        -- Get the height value from the spinner
        local height = stairHeightSpinner.value
        -- Get the width value from the stepWidth spinner (default 100)
        local stepWidth = stepWidthSpinner.value
        -- Call the createStairs function with the user-defined height and width
        createStairs height stepWidth
    )
)

-- Create the rollout UI window
trye
    createDialog stairRollout
catch
    messageBox "There was an error creating the UI." title:"Error"
