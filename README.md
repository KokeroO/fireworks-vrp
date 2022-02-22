# Fireworks vRP!
_FivemM Framework vRP Resource_

*Read this in other languages: [Portugues-Brasil](README_ptbr.md).*

:information_source: NOTE: Fireworks vRP is compatible with versions 0.5 and 1.0 (vRPex) of the framework built by ImagicTheCat (https://github.com/vRP-framework/vRP).

## Description
Fireworks vRP is a script that, through the organization of objects, particles and effects, tries to bring the immersion of fireworks to the server.

**Features**
- Fireworks to assemble
   - Rocket sigle shot
   - Case from 10 to 50 shots
   - Battery 20 to 100 shots
   - Cone
- Fireworks in pre-configured locations with time from 10 to 120 seconds.
- Fireworks above the player.
- Fireworks from above.

:information_source: All floor-mounted fireworks take 5-8 seconds to start depending on the artifact. After the executions the artifacts will disappear after 10 seconds with the exception of the Earthshaker that disappears after its cast.

## Documentation

###### **Installation**

1. Move the `vrp_fireworks` folder to the server `resource` folder;
2. Add `ensure vrp_fireworks` to your server configuration file;
3. Start the server;


###### **Usage by command line**

Fireworks vRP can be triggered via the command line:

**Fireworks to assemble:**

   - Rocket:

      Command line: ```fireworks rocket```

      :information_source: A single shot rocket will be mounted on the ground and will fire just after its delay time.

   - Case:
   
      Command line: ```fireworks case 10```

      :information_source: A box with a sequence of colored shots will be mounted on the ground with the second parameter reporting the number of shots (10 - 50) and will fire just after its delay time.
      
   - Battery:
   
      Command line: ```fireworks battery 20```

      :information_source: A box with a rapid fire sequence will be mounted on the ground with the second parameter reporting the number of shots ( 20 - 100 ) and will fire just after its delay time.
      
   - Cone:
   
      Command line: ```fireworks cone```

      :information_source: A cone will be mounted on the floor with a runtime of about 20 seconds and will fire just after its delay time.


**Fireworks in pre-configured locations:**

   - Location pre-configured:
   
      Command line: ```fireworks loc vinewood 120```

      :information_source: A sequence of fires will be started in a pre-configured place. The second parameter indicates the location ( vinewood, observatory, mazebank) and the third parameter indicates the execution time ( 10 - 120).


**Fireworks above the player:**

   - Above the player:
   
      Command line: ```fireworks over```

      :information_source: A sequence of fires will start on the player.

**Fireworks from above:**

   - From above:
   
      Command line: ```fireworks fromabove```


###### **Usage by script**

Fireworks vRP can be accessed directly from any other resource by triggering the correct event. [**Docs FiveM: Triggering events**
](https://docs.fivem.net/docs/scripting-manual/working-with-events/triggering-events/)

Ex: 

- Triggering client events ```TriggerClientEvent("fireworks:case", targetPlayer, numShots)``` or 

- Triggering local events ```TriggerEvent("fireworks:case", numShots)```

**Your imagination is the limit!**


###### **Configuration optional**

Inside the config/config.lua file you can configure your permissions and pre-defined locations for the fireworks.

- Permissions

```
cfg.permissions = {
    'manager.permission',
    'admin.god'
}
```

:information_source: Enter a vector containing the groups with command line permissions.

- Locations

```
['observatory'] = {
        [1] = {['pedx'] = -521.51, ['pedy'] = 1169.52, ['pedz'] = 320.279, ['pedh'] = 216.24, ['shotx'] = -443.00, ['shoty'] = 1030.00, ['shotz'] = 354.00},
        [2] = {['pedx'] = -513.75, ['pedy'] = 1170.72, ['pedz'] = 323.11, ['pedh'] = 205.83, ['shotx'] = -447.00, ['shoty'] = 1096.00, ['shotz'] = 358.00},
        [3] = {['pedx'] = -532.77, ['pedy'] = 1099.74, ['pedz'] = 259.58, ['pedh'] = 57.71, ['shotx'] = -409.00, ['shoty'] = 1093.00, ['shotz'] = 371.00},
        [4] = {['pedx'] = -395.52, ['pedy'] = 1050.20, ['pedz'] = 319.07, ['pedh'] = 102.60, ['shotx'] = -477.00, ['shoty'] = 1016.00, ['shotz'] = 354.00}
    }
```

:information_source: Inform the location of the shot output by the ped location and the detonations by the shot location.

## Credits, contact and comercial
**Do not remove author credits.**

**KokeroO - Discord: Kokero#3996**

## License
  ```
  Fireworks vRP
  Copyright (C) 2022  KokeroO - Discord: Kokero#3996

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU Affero General Public License as published
  by the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU Affero General Public License for more details.

  You should have received a copy of the GNU Affero General Public License
  along with this program.  If not, see <https://www.gnu.org/licenses/>.
  ```