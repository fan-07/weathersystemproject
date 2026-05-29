# weathersystemproject
a repository to semiautomate a weather system consisting of 3 weathers: rain,fog,snow (4 if you consider the default atmosphere a weather) through the use of image/text buttons


|| IMPORTANT ||

1) Your Starter GUI hierarchy should be:

StarterGUI
└── ScreenGui
      └── MainFrame (Frame)
           ├── RainButton (TextButton) or image buttons
           ├── FogButton (TextButton)
           └── SnowButton (TextButton)

[You can customize them however you want]

   2) add a localscript inside ScreenGUI and extract the code from weatherlocalscript.lua provided

   3) Create a RemoteEvent named WeatherEvent inside ReplicatedStorage. (so the client communicates with the server through the button click)

  4) (optional kinda) you can have your player enable a weather and have them stuck with any one weather type for the rest of their play, or you can have a clear weather button. Insert a ClearButton text        button under MainFrame and extract the code from optionalclearbutton.lua script provided. you dont have to change any parts of the code as they already have been included
  
   for the actual weather info, refer to the code comments
