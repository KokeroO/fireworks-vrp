# Fireworks vRP!
_FivemM Framework vRP Resource_

*Leia em outra língua: [English](README.md).*

:information_source: NOTE: Fireworks vRP é compatível com as versões 0.5 e 1.0 (vRPex) do framework escrito por ImagicTheCat (https://github.com/vRP-framework/vRP).

## Description
Fireworks vRP é um script que através, de organização de objetos, partículas e efeitos, traz a imersão de fogos de artifícios ao servidor.

**Recursos**
- Fogos de artifícios para montar
   - Treme-terra
   - Caixa de 10 a 50 tiros
   - Bateria de 20 a 100 tiros
   - Cone
- Fogos de artifícios com localizações pré-configuradas com tempos de 10 a 120 segundos.
- Fogos de artifícios sobre o jogador.
- Fogos de artifícios de cima para baixo.

:information_source: Todos os fogos de artifícios de montar ao chão levam tempos de 5 a 8 segundos para serem iniciados dependendo do artefato. Após as execuções os artefatos desaparecerão após 10 segundos com exceção ao Treme-terra que desaparece após seu lançamento.

## Documentação

###### **Instalação**

1. Mova a pasta `vrp_fireworks` para a pasta `resource` do servidor;
2. Adicione `ensure vrp_fireworks` ao arquivo de configuração do servidor;
3. Inicie o servidor;


###### **Uso com linha de comando**

Via linha de comando Fireworks vRP pode ser acionado:

**Fogos de artifícios para montar:**

   - Treme-terra:

      Command line: ```fireworks rocket```

      :information_source: Um foguete será montado no chão e será acionado logo após seu tempo de atraso.

   - Caixa:

      Command line: ```fireworks case 10```

      :information_source: Uma caixa com uma sequência de tiros coloridos será montada no chão com o segundo parâmetro informando o número de tiros ( 10 - 50 ) e será acionado logo após seu tempo de atraso.

   - Bateria:

      Command line: ```fireworks battery 20```

      :information_source: Uma caixa com uma sequência de tiros rápidos será montada no chão com o segundo parâmetro informando o número de tiros ( 20 - 100 ) e será acionado logo após seu tempo de atraso.

   - Cone:

      Command line: ```fireworks cone```

      :information_source: O cone será montado no chão com um tempo de execução de cerca de 20 segundos e será acionado logo após seu tempo de atraso.


**Fogos de artifícios com localizações pré-configuradas:**

   - Localização pré-configurada:

      Command line: ```fireworks loc vinewood 120```

      :information_source: Uma sequência de fogos será iniciada em uma localização pré-configurada. O segundo parâmetro indica o local ( vinewood, observatory, mazebank) e o terceiro parâmetro indica o tempo de execução ( 10 - 120).


**Fogos de artifícios sobre o jogador:**

   - Sobre o jogador:

      Command line: ```fireworks over```

      :information_source: Uma sequência de fogos é iniciada em cima do jogador.

**Fogos de artifícios de cima para baixo:**

   - De cima para baixo:

      Command line: ```fireworks fromabove```


###### **Uso por scripts**

Fireworks vRP pode ser acessado por outra resource através do acionamento correto do evento. [**Docs FiveM: Triggering events**
](https://docs.fivem.net/docs/scripting-manual/working-with-events/triggering-events/)

Ex:

- Triggering client events ```TriggerClientEvent("fireworks:case", targetPlayer, numShots)``` ou

- Triggering local events ```TriggerEvent("fireworks:case", numShots)```

**Sua imaginação é o limite!**


###### **Configuração opcional**

No arquivo config/config.lua você pode configurar as permissões por grupo e predefinir locais de fogos de artifícios.

- Permissões

```
cfg.permissions = {
   'manager.permissao',
   'admin.god'
}
```

:information_source: Informe um vetor contendo os grupos com acesso à linha de comando.

- Localizações

```
['observatory'] = {
   [1] = {['pedx'] = -521.51, ['pedy'] = 1169.52, ['pedz'] = 320.279, ['pedh'] = 216.24, ['shotx'] = -443.00, ['shoty'] = 1030.00, ['shotz'] = 354.00},
   [2] = {['pedx'] = -513.75, ['pedy'] = 1170.72, ['pedz'] = 323.11, ['pedh'] = 205.83, ['shotx'] = -447.00, ['shoty'] = 1096.00, ['shotz'] = 358.00},
   [3] = {['pedx'] = -532.77, ['pedy'] = 1099.74, ['pedz'] = 259.58, ['pedh'] = 57.71, ['shotx'] = -409.00, ['shoty'] = 1093.00, ['shotz'] = 371.00},
   [4] = {['pedx'] = -395.52, ['pedy'] = 1050.20, ['pedz'] = 319.07, ['pedh'] = 102.60, ['shotx'] = -477.00, ['shoty'] = 1016.00, ['shotz'] = 354.00}
}
```

:information_source: Informe a localização em `ped` para a saída inicial do tiro e em `shot` para o local da detonação.

## Créditos, contato e comercial
**Não remova os créditos do autor.**

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