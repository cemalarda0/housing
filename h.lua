local players, playing, colored, admin = {}, {}, {}, {
    ["Poklava#0000"] = "0x0004FF"
}
local maps =
    {'<C><P L="4000" H="3500" F="1" DS="m;1547,1200,1239,1043,1898,1201,1287,1201" MEDATA=";;;;-0;0:::1-"/><Z><S><S T="9" X="1116" Y="1199" L="257" H="33" P="0,0,0,0,0,0,0,0"/><S T="12" X="1132" Y="976" L="290" H="180" P="0,0,0,0,0,0,0,0" o="2F1540" c="4"/><S T="0" X="2086" Y="1081" L="10" H="410" P="0,0,0.3,0.2,0,0,0,0"/><S T="0" X="1402" Y="1120" L="10" H="162" P="0,0,0,0.2,-50,0,0,0" c="3"/><S T="12" X="1248" Y="1203" L="10" H="44" P="0,0,0.3,0.2,0,0,0,0" o="A77545" N=""/><S T="0" X="1337" Y="1165" L="10" H="205" P="0,0,0.3,0.2,0,0,0,0" c="4"/><S T="0" X="1431" Y="1144" L="10" H="243" P="0,0,0.3,0.2,-50,0,0,0" c="4"/><S T="0" X="985" Y="1084" L="10" H="408" P="0,0,0.3,0.2,0,0,0,0"/><S T="0" X="1534" Y="881" L="1112" H="10" P="0,0,0.3,0.2,0,0,0,0" N=""/><S T="0" X="1278" Y="942" L="10" H="118" P="0,0,0.3,0.2,0,0,0,0" N=""/><S T="6" X="1536" Y="1250" L="1100" H="71" P="0,0,0.3,0.2,0,0,0,0" N=""/><S T="12" X="1119" Y="1220" L="267" H="10" P="0,0,0.3,0.2,0,0,0,0" o="A77545" N=""/><S T="0" X="1167" Y="1066" L="365" H="14" P="0,0,0.3,0.2,0,0,0,0" N=""/></S><D><P X="2056" Y="1216" T="67" P="0,1"/><P X="2005" Y="1216" T="68" P="1,0"/><P X="1954" Y="1216" T="67" P="0,0"/><P X="1844" Y="1216" T="67" P="0,1"/><P X="1793" Y="1216" T="68" P="1,0"/><P X="1742" Y="1216" T="67" P="0,0"/><P X="1095" Y="1062" T="17" P="1,0"/><P X="1181" Y="1065" T="127" C="784939,A31638" P="1,0"/><P X="1012" Y="1065" T="127" C="784939,A31638" P="1,0"/><P X="1103" Y="1028" T="21" P="0,0"/><P X="1628" Y="1217" T="1" P="0,0"/><P X="1693" Y="1242" T="5" P="0,2"/><P X="1733" Y="1242" T="5" P="0,2"/><P X="1773" Y="1242" T="5" P="0,2"/><P X="1813" Y="1242" T="5" P="0,2"/><P X="1853" Y="1242" T="5" P="0,2"/><P X="1893" Y="1242" T="5" P="0,2"/><P X="1933" Y="1242" T="5" P="0,2"/><P X="1973" Y="1242" T="5" P="0,2"/><P X="2013" Y="1242" T="5" P="0,2"/><P X="2053" Y="1242" T="5" P="0,2"/><P X="1289" Y="1242" T="5" P="0,2"/><P X="1649" Y="1242" T="5" P="0,2"/><P X="1609" Y="1242" T="5" P="0,2"/><P X="1569" Y="1242" T="5" P="0,2"/><P X="1529" Y="1242" T="5" P="0,2"/><P X="1489" Y="1242" T="5" P="0,2"/><P X="1449" Y="1242" T="5" P="0,2"/><P X="1409" Y="1242" T="5" P="0,2"/><P X="1369" Y="1242" T="5" P="0,2"/><P X="1329" Y="1242" T="5" P="0,2"/><P X="2007" Y="1178" T="73" P="0,0"/><P X="1795" Y="1176" T="71" P="0,0"/><P X="1896" Y="1217" T="148" P="0,0"/><P X="1128" Y="918" T="192" P="1,0"/><P X="1099" Y="1024" T="52" P="1,0"/></D><O><O X="1115" Y="1186" C="610" P="0"/><O X="1335" Y="1046" C="612" P="0"/><O X="1421" Y="1201" C="604" P="0"/></O><L/></Z></C>',
     '<C><P L="2700" H="1100" F="0" MEDATA=";;;;-0;0:::1-"/><Z><S/><D/><O/><L/></Z></C>'}
local keys = {69, 81, 32, 0, 2, 1}
local gameStarted, newPlayer = false, false
local time, eTime, murdered, meep, eventLink = 0, 0, false, false, false
local deadText = {
    tr = {" öldü.", " geberdi.", " hayata gözlerini yumdu.", " patladı.", " daha fazla dayanamadı."},
    en = {" died.", " died.", " died.", " exploded.", " could not take any more."}
}
local events = {
    tr = {"Yer çekimi değişiyor!", "Birileri uyumadan önce sütünü içmemiş.", "Bir evin zemini ASİT olacak!",
          "Birinin evi ucuz materyallerden yapılmış.", "Birisi cebinde kartopu buldu.", "Dikkat asit yağmuru!",
          "Birisi AYI gibi yemek yemiş.", "Bir kişiye top hediye edildi.",
          "Birisi dün geceki partiden balon çalmış!", "Birisi seri katille anlaşma yapıyor!",
          "Bir evin zemini silinecek.", "Birisi yükseğe zıplamayı öğrendi.", "Birisi hızlandığını farketti.",
          "Birisi tek seferlik ışınlanabilecek.", "Rastgele bir yere para fırlatılacak.",
          "Tüm oyunculara Meep verilecek.", "Kar fırtınası yaklaşıyor.", "2 oyuncu birbirine bağlanacak.",
          "Bir evin zemini trambolin olacak!"},
    en = {"Gravity is changing!", "Someone didn't drink his milk before going to sleep.",
          "The floor of a house will be ACID!", "Someone's house is made of cheap materials.",
          "Someone found a snowball in his pocket.", "Attention acid rain!", "Someone has eaten like a BEAR.",
          "A ball was gifted to a person.", "Someone stole a balloon from last night's party!",
          "Someone is making a deal with the serial killer!", "The floor of a house will be wiped.",
          "Someone has learned to jump high.", "Someone noticed that it was speeding up.", "Someone can teleport once.",
          "The money will be thrown to a random place.", "Meep will be given to all players.",
          "Snow storm approaching.", "2 players will be linked to each other.",
          "The floor of a house will be a trampoline!"}
}
local eventTrue = {true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true,
                   true, true}
local pigImgs = {"17404198506.png", -- angry
"174042180f2.png", -- crying
"174042d5ba0.png", -- love
"174042eda4f.png", -- blushed
"174043b0085.png", -- clown
"1740455e72a.png", -- glasses
"1740455bd82.png", -- smoking
"17404561700.png", -- glasses blushed
"1745e9316ae.png" -- roasted
}
for _, i in next,
    {'AfkDeath', 'AutoShaman', 'MinimalistMode', 'WatchCommand', 'MortCommand', 'AutoNewGame', 'AutoScore',
     'PhysicalConsumables'} do
    tfm.exec["disable" .. i]()
end
system.disableChatCommandDisplay(nil, true)
tfm.exec.newGame(maps[1])
for name in next, tfm.get.room.playerList do -- Nick döndürür
    tfm.exec.setPlayerScore(name, 0, false)
    players[name] = {
        community = nil,
        playing = false,
        houseLevel = 1,
        coins = 0,
        particle,
        house = {
            x,
            y,
            left = {x, y},
            right = {x, y},
            up = {
                left = {x, y},
                right = {x, y},
                color
            },
            down = {
                x,
                y,
                color
            },
            nameID,
            currentDecoration = {img, x, y}
        },
        houseSetted = false,
        houseFloor = {x, y},
        houseID = {
            left,
            right,
            up = {left, right},
            down
        },
        houseType = {
            left = 0,
            right = 0,
            up = 0,
            wallType = "Tahta",
            down = 6
        },
        houseDynamic = {
            left = false,
            right = false,
            up = false,
            down = false
        },
        events = {
            sizeChanged = false,
            houseDynamicChanged = false,
            floorChanged = false,
            canJump = false,
            canRun = false,
            linked = false,
            tp = {
                started = false,
                id
            },
            balloon = {
                started = false,
                id
            },
            snowball = {
                count = 0,
                started = false,
                cooldown = 0,
                id
            },
            balls = {
                count = 0,
                started = false,
                cooldown = 0,
                ballType = 607,
                id
            },
            murder = {
                name,
                died = false
            }
        },
        interfaces = {
            shopOpened = false,
            shopPage = 1
        },
        inventory = {
            walls = {
                wood = false,
                ice = false,
                choco = false,
                colored = false
            },
            grounds = {
                sand = false,
                yellow = false,
                snow = false,
                pink = false,
                colored = false
            },
            balls = {
                football = false,
                basketball = false,
                hedgehog = false
            },
            decorations = {
                pig = false
            }
        }
    }
    ui.addTextArea(123123,
        "<p align='center'><font color='#FF0000'><a href='event:tr'>[TR]  </a></font><font color='#0000FF'><a href='event:en'>  [EN]</a></font></p>",
        name, 351, 190, 99, 20, 0xffffff, 0x000000, 1, true)
    for i = 1, #keys do
        system.bindKeyboard(name, keys[i], true, true)
    end
    system.bindMouse(name, true)
    local nameID, balloonID, snowballID, ballsID, tpID = 999, 888, 777, 666, 555
    for name in next, players do
        players[name].house.nameID = nameID
        players[name].events.balloon.id = balloonID
        players[name].events.snowball.id = snowballID
        players[name].events.balls.id = ballsID
        players[name].events.tp.id = tpID
        nameID = nameID * 2
        balloonID = balloonID * 2
        snowballID = snowballID * 2
        ballsID = ballsID * 2
        tpID = tpID * 2
    end
end

function eventNewPlayer(name)
    ui.addTextArea(123123,
        "<p align='center'><font color='#FF0000'><a href='event:tr'>[TR]  </a></font><font color='#0000FF'><a href='event:en'>  [EN]</a></font></p>",
        name, 351, 190, 99, 20, 0xffffff, 0x000000, 1, true)
    if not players[name] then
        players[name] = {
            community = nil,
            playing = false,
            houseLevel = 1,
            coins = 0,
            particle,
            house = {
                x,
                y,
                left = {x, y},
                right = {x, y},
                up = {
                    left = {x, y},
                    right = {x, y},
                    color
                },
                down = {
                    x,
                    y,
                    color
                },
                nameID,
                currentDecoration = {img, x, y}
            },
            houseSetted = false,
            houseFloor = {x, y},
            houseID = {
                left,
                right,
                up = {left, right},
                down
            },
            houseType = {
                left = 0,
                right = 0,
                wallType = "Tahta",
                up = 0,
                down = 6
            },
            houseDynamic = {
                left = false,
                right = false,
                up = false,
                down = false
            },
            events = {
                sizeChanged = false,
                houseDynamicChanged = false,
                floorChanged = false,
                canJump = false,
                canRun = false,
                linked = false,
                tp = {
                    started = false,
                    id
                },
                balloon = {
                    started = false,
                    id
                },
                snowball = {
                    count = 0,
                    started = false,
                    cooldown = 0,
                    id
                },
                balls = {
                    count = 0,
                    started = false,
                    cooldown = 0,
                    ballType = 607,
                    id
                },
                murder = {name, died}
            },
            interfaces = {
                shopOpened = false,
                shopPage = 1
            },
            inventory = {
                walls = {
                    wood = false,
                    ice = false,
                    choco = false,
                    colored = false
                },
                grounds = {
                    sand = false,
                    yellow = false,
                    snow = false,
                    pink = false,
                    colored = false
                },
                balls = {
                    football = false,
                    basketball = false,
                    hedgehog = false
                },
                decorations = {
                    pig = false
                }
            }
        }
        for i in next, keys do
            system.bindKeyboard(name, keys[i], true, true)
        end
        system.bindMouse(name, true)
    else
        tfm.exec.setPlayerScore(name, players[name].coin, false)
    end
    if not gameStarted then
        tfm.exec.respawnPlayer(name)
        tfm.exec.setNameColor(name, 0xffffff)
        local nameID, balloonID, snowballID, ballsID, tpID = 999, 888, 777, 666, 555
        for name in next, players do
            players[name].house.nameID = nameID
            players[name].events.balloon.id = balloonID
            players[name].events.snowball.id = snowballID
            players[name].events.balls.id = ballsID
            players[name].events.tp.id = tpID
            nameID = nameID * 2
            balloonID = balloonID * 2
            snowballID = snowballID * 2
            ballsID = ballsID * 2
            tpID = tpID * 2
        end
    else
        newPlayer = true
    end
end

function eventPlayerLeft(name)
    players[name].playing = false
end

function eventNewGame()
    if gameStarted then
        ui.removeTextArea(10)
        ui.removeTextArea(600)
        tfm.exec.newGame(maps[2])
        for name in next, tfm.get.room.playerList do
            tfm.exec.setNameColor(name, admin[name] and admin[name] or colored[name] and colored[name] or 0xff0000)
            if players[name].interfaces.shopOpened then
                for _, i in next, {123, 124, 125, 126} do
                    ui.removeTextArea(i, name)
                end
                players[name].interfaces.shopOpened = false
            end
        end
        for name in next, tfm.get.room.playerList do
            if players[name].community == "tr" then
                ui.addTextArea(1, "Hayatta Olan Fareler : " .. getAliveMice(), name, 10, 375, 150, 20, 0x000000,
                    0xff0000, nil, true)
            elseif players[name].community == "en" then
                ui.addTextArea(1, "<p align='center'>Mice Alive : " .. getAliveMice() .. "</p>", name, 10, 375, 150, 20,
                    0x000000, 0xff0000, nil, true)
            end
        end
    else
        tfm.exec.newGame(maps[1])
        for name in next, tfm.get.room.playerList do
            if admin[name] then
                ui.addTextArea(600,
                    "\n<font color='#FF0000'><p align='center'>[ADMİN KOMUTLARI]</p><p align='left'></font>\n<font color='#000000'>!basla</font><font color='#ffffff'> : </font><font color='#000000'>Oyunu başlatır.</font>\n\n<font color='#000000'>!lobi</font><font color='#ffffff'> : </font><font color='#000000'>Oyunu bitirir.</font>\n\n<font color='#000000'>!rich [oyuncuAdı] [miktar]</font><font color='#ffffff'> : </font><font color='#000000'>Oyuncuya para ekler.</font>\n\n<font color='#000000'>!kill [oyuncuAdı]</font><font color='#ffffff'> : \n</font><font color='#000000'>Oyuncuyu öldürür.</font>\n\n<font color='#000000'>!r [oyuncuAdı]</font><font color='#ffffff'> : \n</font><font color='#000000'>Oyuncuyu canlandırır.</font>\n\n<font color='#000000'>!afk [oyuncuAdı]</font><font color='#ffffff'> : \n</font><font color='#000000'>Oyuncuyu AFK mod'a alır.</font>\n\n<font color='#000000'>!community [oyuncuAdı] [TR-EN]</font><font color='#ffffff'> : </font><font color='#000000'>Oyuncunun oyun dilini değiştirir.</font>\n\n<font color='#000000'>!color [oyuncuAdı] [kod]</font><font color='#ffffff'> : </font><font color='#000000'>Oyuncunun isim rengini değiştirir.</p></font>",
                    name, -202, 26, 202, 330, 0xa1a1a1, 0x000000, 1, true)
            end
            tfm.exec.setNameColor(name, 0xffffff)
        end
        if newPlayer then
            local nameID, balloonID, snowballID, ballsID, tpID = 999, 888, 777, 666, 555
            for name in next, players do
                players[name].house.nameID = nameID
                players[name].events.balloon.id = balloonID
                players[name].events.snowball.id = snowballID
                players[name].events.balls.id = ballsID
                players[name].events.tp.id = tpID
                nameID = nameID * 2
                balloonID = balloonID * 2
                snowballID = snowballID * 2
                ballsID = ballsID * 2
                tpID = tpID * 2
            end
        end
    end
end

function eventPlayerDied(name)
    local i = {}
    if not gameStarted then
        tfm.exec.respawnPlayer(name)
        tfm.exec.setNameColor(name, 0xffffff)
    else
        i = math.random(#deadText.tr)
        playing[name] = false
        players[name].playing = false
        for name in next, tfm.get.room.playerList do
            if players[name].community == "tr" then
                ui.addTextArea(1, "Hayatta Olan Fareler : " .. getAliveMice(), name, 10, 375, 150, 20, 0x000000,
                    0xff0000, nil, true)
            elseif players[name].community == "en" then
                ui.addTextArea(1, "<p align='center'>Mice Alive : " .. getAliveMice() .. "</p>", name, 10, 375, 150, 20,
                    0x000000, 0xff0000, nil, true)
            end
        end
        if not players[name].events.murder.died and players[name].houseSetted then
            for iname in next, tfm.get.room.playerList do
                if players[iname].community == "tr" then
                    ui.addTextArea(150, "<p align='center'><font color='#ff0000'>" .. name .. deadText.tr[i], iname,
                        500, 85, 297, 20, 0x000000, 0xff0000, 0, true)
                else
                    ui.addTextArea(150, "<p align='center'><font color='#ff0000'>" .. name .. deadText.en[i], iname,
                        500, 85, 297, 20, 0x000000, 0xff0000, 0, true)
                end
            end
        elseif players[name].events.murder.died and players[name].houseSetted then
            for iname in next, tfm.get.room.playerList do
                if players[iname].community == "tr" then
                    ui.addTextArea(150, "<p align='center'><font color='#ff0000'>" .. name ..
                        " katil tarafından öldürüldü.</font></p>", iname, 500, 85, 297, 20, 0x000000, 0xff0000, 0,
                        true)
                else
                    ui.addTextArea(150, "<p align='center'><font color='#ff0000'>" .. name ..
                        " killed by murder.</font></p>", iname, 500, 85, 297, 20, 0x000000, 0xff0000, 0, true)
                end
            end
        end
        if getPlaying() <= 1 and gameStarted then
            stopGame()
        end
    end
end

function eventChatCommand(name, cmd)
    local arg = {}
    for nick in cmd:gmatch("[^%s]+") do
        arg[#arg + 1] = nick
    end
    for numbers in cmd:gmatch("^%s%d$") do
        arg[#arg + 1] = numbers
    end
    for string in cmd:gmatch("^%s.+") do
        arg[#arg + 1] = string
    end
    for color in cmd:gmatch("^.$") do
        arg[#arg + 1] = "0x" .. color
    end
    arg[1] = string.lower(arg[1])
    if admin[name] then
        if arg[1] == "lobi" then
            stopGame()
        elseif arg[1] == "basla" then
            gameStarted = true
            eventNewGame()
            print("Oyun Başladı !")
            for name in next, tfm.get.room.playerList do
                if not tfm.get.room.playerList[name].isDead and players[name].community ~= nil then
                    table.insert(playing, name)
                    playing[name] = true
                    players[name].playing = true
                end
            end
            createHouse(200, 450)
        elseif arg[1] == "kill" and players[arg[2]] then
            tfm.exec.killPlayer(arg[2])
        elseif arg[1] == "r" and players[arg[2]].houseSetted then
            tfm.exec.respawnPlayer(arg[2])
            tfm.exec.setNameColor(arg[2],
                admin[arg[2]] and admin[arg[2]] or colored[arg[2]] and colored[arg[2]] or 0xff0000)
            tfm.exec.movePlayer(arg[2], players[arg[2]].house.x, players[arg[2]].house.y - 80, false)
            players[arg[2]].playing = true
            for name in next, tfm.get.room.playerList do
                if players[name].community == "tr" then
                    ui.addTextArea(1, "Hayatta Olan Fareler : " .. getAliveMice(), name, 10, 375, 150, 20, 0x000000,
                        0xff0000, nil, true)
                elseif players[name].community == "en" then
                    ui.addTextArea(1, "<p align='center'>Mice Alive : " .. getAliveMice() .. "</p>", name, 10, 375, 150,
                        20, 0x000000, 0xff0000, nil, true)
                end
            end
        elseif arg[1] == "rich" and players[arg[2]] and arg[3] then
            decreaseCoin(arg[2], -(arg[3]))
            tfm.exec.setPlayerScore(arg[2], players[arg[2]].coins, false)
            if players[arg[2]].interfaces.shopOpened then
                if players[name].community == "tr" then
                    ui.addTextArea(124, "<p align='center'><font size='30'><font color='#ffff00'>Para : " ..
                        players[arg[2]].coins .. "</font></font></p>", arg[2], 250, 35, 300, 50, 0x000000, 0xff0000,
                        0.9, true)
                elseif players[arg[2]].community == "en" then
                    ui.addTextArea(124, "<p align='center'><font size='30'><font color='#ffff00'>Money : " ..
                        players[name].coins .. "</font></font></p>", arg[2], 250, 35, 300, 50, 0x000000, 0xff0000, 0.9,
                        true)
                end
            end
        elseif arg[1] == "afk" and players[arg[2]] then
            players[arg[2]].community = nil
            ui.addTextArea(123123,
                "<p align='center'><font color='#FF0000'><a href='event:tr'>[TR]  </a></font><font color='#0000FF'><a href='event:en'>  [EN]</a></font></p>",
                arg[2], 351, 190, 99, 20, 0xffffff, 0x000000, 1, true)
        elseif arg[1] == "community" and players[arg[2]] and arg[3] then
            players[arg[2]].community = arg[3]
            print(players[arg[2]].community)
        elseif arg[1] == "color" and players[arg[2]] and arg[3] then
            if admin[arg[2]] then
                admin[arg[2]] = arg[3]
            else
                colored[arg[2]] = arg[3]
            end
        elseif arg[1] == "admin" and players[arg[2]] and not admin[arg[2]] then
            admin[arg[2]] = arg[3] and arg[3] or true
        elseif arg[1] == "unadmin" and players[arg[2]] and admin[arg[2]] then
            if arg[2] ~= "Poklava#0000" or arg[2] ~= "Soulfly#5904" then
                admin[arg[2]] = false
            end
        end
    end
    if arg[1] == "lang" then
        ui.addTextArea(123123,
            "<p align='center'><font color='#FF0000'><a href='event:tr'>[TR]  </a></font><font color='#0000FF'><a href='event:en'>  [EN]</a></font></p>",
            name, 351, 190, 99, 20, 0xffffff, 0x000000, 1, true)
    end
end

function eventTextAreaCallback(id, name, event)
    if not gameStarted then
        if event == "shop" and not players[name].playing and not players[name].interfaces.shopOpened then
            players[name].interfaces.shopOpened = true
        elseif event == "shopClose" then
            for _, i in next, {123, 124, 125, 126} do
                ui.removeTextArea(i, name)
            end
            players[name].interfaces.shopOpened = false
        elseif event == "duvarTahta" and players[name].coins >= 15 and players[name].houseType.wallType ~= "Tahta" then
            players[name].houseType.left = 0
            players[name].houseType.right = 0
            players[name].houseType.up = 0
            players[name].houseType.wallType = "Tahta"
            decreaseCoin(name, 15)
        elseif event == "duvarBuz" and players[name].coins >= 15 and players[name].houseType.wallType ~= "Buz" then
            players[name].houseType.left = 1
            players[name].houseType.right = 1
            players[name].houseType.up = 1
            players[name].houseType.wallType = "Buz"
            decreaseCoin(name, 15)
        elseif event == "duvarCiko" and players[name].coins >= 15 and players[name].houseType.wallType ~= "Çiko" then
            players[name].houseType.left = 4
            players[name].houseType.right = 4
            players[name].houseType.up = 4
            players[name].houseType.wallType = "Çiko"
            decreaseCoin(name, 15)
        elseif event == "duvarRenkli" then
            if players[name].coins >= 15 and players[name].houseType.wallType ~= "Renkli" then
                players[name].houseType.left = 12
                players[name].houseType.right = 12
                players[name].houseType.up = 12
                players[name].houseType.wallType = "Renkli"
                players[name].inventory.walls.colored = true
                decreaseCoin(name, 15)
            elseif players[name].inventory.walls.colored then
                ui.showColorPicker(123, name, players[name].house.up.color)
                for _, i in next, {123, 124, 125, 126} do
                    ui.removeTextArea(i, name)
                end
                players[name].interfaces.shopOpened = false
            end
        elseif event == "topFutbol" and players[name].coins >= 10 and players[name].events.balls.ballType ~= 604 then
            players[name].events.balls.ballType = 604
            decreaseCoin(name, 10)
        elseif event == "topBasketbol" and players[name].coins >= 10 and players[name].events.balls.ballType ~= 612 then
            players[name].events.balls.ballType = 612
            decreaseCoin(name, 10)
        elseif event == "topKirpi" and players[name].coins >= 10 and players[name].events.balls.ballType ~= 610 then
            players[name].events.balls.ballType = 610
            decreaseCoin(name, 10)
        elseif event == "topTimsah" then

        elseif event == "zeminKum" and players[name].coins >= 30 and players[name].houseType.down ~= 7 then
            players[name].houseType.down = 7
            decreaseCoin(name, 30)
        elseif event == "zeminSarı" and players[name].coins >= 30 and players[name].houseType.down ~= 17 then
            players[name].houseType.down = 17
            decreaseCoin(name, 30)
        elseif event == "zeminKar" and players[name].coins >= 30 and players[name].houseType.down ~= 11 then
            players[name].houseType.down = 11
            decreaseCoin(name, 30)
        elseif event == "zeminPembe" and players[name].coins >= 30 and players[name].houseType.down ~= 18 then
            players[name].houseType.down = 18
            decreaseCoin(name, 30)
        elseif event == "zeminRenkli" then
            if players[name].coins >= 30 and players[name].houseType.down ~= 12 then
                players[name].houseType.down = 12
                players[name].inventory.grounds.colored = true
                decreaseCoin(name, 30)
            elseif players[name].inventory.grounds.colored then
                ui.showColorPicker(1234, name, players[name].house.down.color)
                for _, i in next, {123, 124, 125, 126} do
                    ui.removeTextArea(i, name)
                end
                players[name].interfaces.shopOpened = false
            end
        elseif event == "sandalye" and players[name].coins >= 40 and players[name].house.currentDecoration.img ~=
            "1745a765105.png" then
            players[name].house.currentDecoration.img = "1745a765105.png"
            players[name].house.currentDecoration.x = -55
            players[name].house.currentDecoration.y = 15
            decreaseCoin(name, 40)
        elseif event == "domuz" and players[name].coins >= 40 then
            if not players[name].inventory.decorations.pig then
                players[name].house.currentDecoration.img = pigImgs[math.random(#pigImgs)]
                players[name].house.currentDecoration.x = -55
                players[name].house.currentDecoration.y = 40
                players[name].inventory.decorations.pig = true
                decreaseCoin(name, 40)
            else
                players[name].house.currentDecoration.img = pigImgs[math.random(#pigImgs)]
                players[name].house.currentDecoration.x = -55
                players[name].house.currentDecoration.y = 40
            end
        elseif event == "peynir" and players[name].coins >= 40 and players[name].house.currentDecoration.img ~=
            "168c3845081.png" then
            players[name].house.currentDecoration.img = "168c3845081.png"
            players[name].house.currentDecoration.x = 0
            players[name].house.currentDecoration.y = 50
            decreaseCoin(name, 40)
        elseif event == "ev" and players[name].coins >= 40 and players[name].house.currentDecoration.img ~=
            "17123822449.png" then
            players[name].house.currentDecoration.img = "17123822449.png"
            players[name].house.currentDecoration.x = 0
            players[name].house.currentDecoration.y = 26
            decreaseCoin(name, 40)
        elseif event == "hediyeKutusu" and players[name].coins >= 40 and players[name].house.currentDecoration.img ~=
            "16f1a0c1c4e.png" then
            players[name].house.currentDecoration.img = "16f1a0c1c4e.png"
            players[name].house.currentDecoration.x = -15
            players[name].house.currentDecoration.y = 38
            decreaseCoin(name, 40)
        elseif event == "hayalet" and players[name].coins >= 40 and players[name].house.currentDecoration.img ~=
            "16ddff86413.png" then
            players[name].house.currentDecoration.img = "16ddff86413.png"
            players[name].house.currentDecoration.x = -17
            players[name].house.currentDecoration.y = -60
            decreaseCoin(name, 40)
        elseif event == "melek" and players[name].coins >= 40 and players[name].house.currentDecoration.img ~=
            "16896d06614.png" then
            players[name].house.currentDecoration.img = "16896d06614.png"
            players[name].house.currentDecoration.x = -25
            players[name].house.currentDecoration.y = -60
            decreaseCoin(name, 40)
        elseif event == "kardanAdam" and players[name].coins >= 40 and players[name].house.currentDecoration.img ~=
            "16f019287fc.png" then
            players[name].house.currentDecoration.img = "16f019287fc.png"
            players[name].house.currentDecoration.x = -60
            players[name].house.currentDecoration.y = 7
            decreaseCoin(name, 40)
        elseif event == "cadi" and players[name].coins >= 40 and players[name].house.currentDecoration.img ~=
            "16d3ef68d7e.png" then
            players[name].house.currentDecoration.img = "16d3ef68d7e.png"
            players[name].house.currentDecoration.x = -40
            players[name].house.currentDecoration.y = -55
            decreaseCoin(name, 40)
        elseif event == "tr" then
            players[name].community = "tr"
            ui.removeTextArea(123123, name)
            ui.addTextArea(99, "<a href='event:shop'><font size='15'><font color='#ff0000'>MARKET</font></font></a>",
                name, 697, 364, 90, 24, 0xffffff, 0x000000, 1, true) -- CECB1A
            shopID = tfm.exec.addImage("166e9893b89.png", "&100", 760, 360, name)
        elseif event == "en" then
            players[name].community = "en"
            ui.removeTextArea(123123, name)
            ui.addTextArea(99, "<a href='event:shop'><font size='15'><font color='#ff0000'>  SHOP</font></font></a>",
                name, 697, 364, 90, 24, 0xffffff, 0x000000, 1, true)
            shopID = tfm.exec.addImage("166e9893b89.png", "&100", 760, 360, name)
        elseif event == "leftArrow" and players[name].interfaces.shopPage > 1 then
            players[name].interfaces.shopPage = players[name].interfaces.shopPage - 1
        elseif event == "rightArrow" and players[name].interfaces.shopPage < 2 then
            players[name].interfaces.shopPage = players[name].interfaces.shopPage + 1
        end
        if players[name].interfaces.shopOpened then
            ui.addTextArea(125, "<p align='center'><font size='35'><a href='event:leftArrow'>←</a></font></p>", name,
                45, 210, 50, 50, 0x000000, 0xff0000, 0.9, true)
            ui.addTextArea(126, "<p align='center'><font size='35'><a href='event:rightArrow'>→</a></font></p>", name,
                705, 210, 50, 50, 0x000000, 0xff0000, 0.9, true)
            if players[name].community == "tr" then
                ui.addTextArea(124, "<p align='center'><font size='30'><font color='#ffff00'>Para : " ..
                    players[name].coins .. "</font></font></p>", name, 250, 35, 300, 50, 0x000000, 0xff0000, 0.9, true)
                if players[name].interfaces.shopPage == 1 then
                    ui.addTextArea(123,
                        "<p align='center'><br><br><br><br><font size='15'><font color='#ff7f00'>EV DUVARLARI<font color='#ff0000'> [15]</font></font></font><br><br><a href='event:duvarTahta'>[TAHTA DUVAR] </a><a href='event:duvarBuz'>  [BUZ DUVAR]  </a><a href='event:duvarCiko'> [ÇİKO DUVAR] </a><a href='event:duvarRenkli'>  [RENKLİ DUVAR]</a><br><br><br><font size='15'><font color='#ff7f00'>ZEMİN ÇEŞİTLERİ</font><font color='#ff0000'> [30]</font></font></font><br><br><a href='event:zeminKum'>[KUM ZEMİN] </a><a href='event:zeminSarı'> [SARI ZEMİN] </a><a href='event:zeminKar'> [KAR ZEMİN] </a><a href='event:zeminPembe'> [PEMBE ZEMİN] </a><a href='event:zeminRenkli'> [RENKLİ ZEMİN]</a><br><br><br><font size='15'><font color='#ff7f00'>TOP ÇEŞİTLERİ</font><font color='#ff0000'> [10]</font></font><br><br><a href='event:topFutbol'>[FUTBOL TOPU] </a><a href='event:topBasketbol'>  [BASKETBOL TOPU]  </a><a href='event:topKirpi'> [KİRPİ TOP]</a><br><br><br><font size='15'><a href='event:shopClose'><font color='#ff0000'>[KAPAT]</font></a></p>",
                        name, 100, 85, 600, 300, 0x000000, 0xff0000, 0.9, true)
                elseif players[name].interfaces.shopPage == 2 then
                    ui.addTextArea(123,
                        "<p align='center'><br><br><br><br><font size='15'><font color='#ff7f00'>DEKORASYON<font color='#ff0000'> [40]</font></font></font><br><br><a href='event:sandalye'>[SANDALYE] </a><a href='event:domuz'>  [DOMUZCUK]  </a><a href='event:peynir'> [PEYNİR] </a><a href='event:ev'>  [OYUNCAK EV]  </a><a href='event:hediyeKutusu'> [HEDİYE KUTUSU] </a><a href='event:hayalet'>  [HAYALET]  </a><a href='event:melek'> [MELEK] </a><br><br><a href='event:kardanAdam'>[KARDAN ADAM] </a><a href='event:cadi'>  [CADI]</a><br><br><br><br><br><br><br><br><br><br><br><font size='15'><a href='event:shopClose'><font color='#ff0000'>[KAPAT]</font></a></p>",
                        name, 100, 85, 600, 300, 0x000000, 0xff0000, 0.9, true)
                end
            elseif players[name].community == "en" then
                ui.addTextArea(124, "<p align='center'><font size='30'><font color='#ffff00'>Money : " ..
                    players[name].coins .. "</font></font></p>", name, 250, 35, 300, 50, 0x000000, 0xff0000, 0.9, true)
                if players[name].interfaces.shopPage == 1 then
                    ui.addTextArea(123,
                        "<p align='center'><br><br><br><br><font size='15'><font color='#ff7f00'>HOUSE WALLS<font color='#ff0000'> [15]</font></font></font><br><br><a href='event:duvarTahta'>[WOODEN WALL] </a><a href='event:duvarBuz'>  [ICE WALL]  </a><a href='event:duvarCiko'> [CHOCO WALL] </a><a href='event:duvarRenkli'>  [COLORED WALL]</a><br><br><br><font size='15'><font color='#ff7f00'>GROUND TYPES</font><font color='#ff0000'> [30]</font></font></font><br><br><a href='event:zeminKum'>[SAND GROUND] </a><a href='event:zeminSarı'> [YELLOW GROUND] </a><a href='event:zeminKar'> [SNOWY GROUND] </a><a href='event:zeminPembe'> [PINK GROUND] </a><a href='event:zeminRenkli'> [COLORED GROUND]</a><br><br><br><font size='15'><font color='#ff7f00'>BALL TYPES</font><font color='#ff0000'> [10]</font></font><br><br><a href='event:topFutbol'>[SOCCER BALL] </a><a href='event:topBasketbol'>  [BASKETBALL BALL]  </a><a href='event:topKirpi'> [HEDGEHOG BALL]</a><br><br><font size='15'><a href='event:shopClose'><font color='#ff0000'>[CLOSE]</font></a></p>",
                        name, 100, 85, 600, 300, 0x000000, 0xff0000, 0.9, true)
                elseif players[name].interfaces.shopPage == 2 then
                    ui.addTextArea(123,
                        "<p align='center'><br><br><br><br><font size='15'><font color='#ff7f00'>DECORATIONS<font color='#ff0000'> [40]</font></font></font><br><br><a href='event:sandalye'>[CHAIR] </a><a href='event:domuz'>  [PIG]  </a><a href='event:peynir'> [CHEESE] </a><a href='event:ev'>  [TOY HOUSE]  </a><a href='event:hediyeKutusu'> [GIFT BOX] </a><a href='event:hayalet'>  [GHOST]  </a><a href='event:melek'> [ANGLE] </a><br><br><a href='event:kardanAdam'>[SNOWMAN] </a><a href='event:cadi'>  [WITCH]</a><br><br><br><br><br><br><br><br><br><br><br><font size='15'><a href='event:shopClose'><font color='#ff0000'>[KAPAT]</font></a></p>",
                        name, 100, 85, 600, 300, 0x000000, 0xff0000, 0.9, true)
                end
            end
        end
    end
end

function eventColorPicked(id, name, color)
    if color ~= nil then
        if id == 123 then
            players[name].house.up.color = color
        elseif id == 1234 then
            players[name].house.down.color = color
        end
    else
        if id == 123 then
            players[name].house.up.color = "0x000000"
        elseif id == 1234 then
            players[name].house.down.color = "0x000000"
        end
    end
end

--  EVENTS  --
function eventLoop(ct, rt)
    if gameStarted then
        for name in next, players do
            if players[name].playing then
                if tfm.get.room.playerList[name].y <= 0 then
                    tfm.exec.movePlayer(name, tfm.get.room.playerList[name].x, 5, false)
                end
            end
        end
        time = time + 1
        eTime = eTime + 1
        -- print("etime " .. eTime .. "   time " .. time)

        if eTime <= 10 then
            -- repeat
            event = math.random(#events.tr)
            -- until (eventTrue[event])
        end

        if time == 10 then
            ui.addTextArea(3, "", nil, 150, 30, 500, 45, 0xffffff, 0x000000, nil, true) -- Event
            print(event)
            if event == 1 or event == 6 or event == 15 or event == 17 then
                for name in next, players do
                    if players[name].community == "tr" then
                        ui.updateTextArea(3, "<p align='center'><font size='22'><font color='#000000'>" ..
                            events.tr[event] .. "</font></font></p>", name, 150, 30, 500, 70, 0xffffff, 0x000000, nil,
                            true)
                    elseif players[name].community == "en" then
                        ui.updateTextArea(3, "<p align='center'><font size='22'><font color='#000000'>" ..
                            events.en[event] .. "</font></font></p>", name, 150, 30, 500, 70, 0xffffff, 0x000000, nil,
                            true)
                    end
                end
            elseif event == 2 and getCanChangeSize() >= 1 then
                for name in next, players do
                    if players[name].community == "tr" then
                        ui.updateTextArea(3, "<p align='center'><font size='22'><font color='#000000'>" ..
                            events.tr[event] .. "</font></font></p>", name, 150, 30, 500, 70, 0xffffff, 0x000000, nil,
                            true)
                    elseif players[name].community == "en" then
                        ui.updateTextArea(3, "<p align='center'><font size='18'><font color='#000000'>" ..
                            events.en[event] .. "</font></font></p>", name, 150, 30, 500, 70, 0xffffff, 0x000000, nil,
                            true)
                    end
                end
            elseif event == 3 and getCanChangeFloor() >= 1 then
                for name in next, players do
                    if players[name].community == "tr" then
                        ui.updateTextArea(3, "<p align='center'><font size='25'><font color='#000000'>" ..
                            events.tr[event] .. "</font></font></p>", name, 150, 30, 500, 70, 0xffffff, 0x000000, nil,
                            true)
                    elseif players[name].community == "en" then
                        ui.updateTextArea(3, "<p align='center'><font size='25'><font color='#000000'>" ..
                            events.en[event] .. "</font></font></p>", name, 150, 30, 500, 70, 0xffffff, 0x000000, nil,
                            true)
                    end
                end
            elseif event == 4 and getCanChangeHouseDynamic() >= 1 then
                for name in next, players do
                    if players[name].community == "tr" then
                        ui.updateTextArea(3, "<p align='center'><font size='20'><font color='#000000'>" ..
                            events.tr[event] .. "</font></font></p>", name, 150, 30, 500, 70, 0xffffff, 0x000000, nil,
                            true)
                    elseif players[name].community == "en" then
                        ui.updateTextArea(3, "<p align='center'><font size='20'><font color='#000000'>" ..
                            events.en[event] .. "</font></font></p>", name, 150, 30, 500, 70, 0xffffff, 0x000000, nil,
                            true)
                    end
                end
            elseif event == 5 and getCanGetSnowball() >= 1 then
                for name in next, players do
                    if players[name].community == "tr" then
                        ui.updateTextArea(3, "<p align='center'><font size='25'><font color='#000000'>" ..
                            events.tr[event] .. "</font></font></p>", name, 150, 30, 500, 70, 0xffffff, 0x000000, nil,
                            true)
                    elseif players[name].community == "en" then
                        ui.updateTextArea(3, "<p align='center'><font size='23'><font color='#000000'>" ..
                            events.en[event] .. "</font></font></p>", name, 150, 30, 500, 70, 0xffffff, 0x000000, nil,
                            true)
                    end
                end
            elseif event == 7 and getCanChangeSize() >= 1 then
                for name in next, players do
                    if players[name].community == "tr" then
                        ui.updateTextArea(3, "<p align='center'><font size='25'><font color='#000000'>" ..
                            events.tr[event] .. "</font></font></p>", name, 150, 30, 500, 70, 0xffffff, 0x000000, nil,
                            true)
                    elseif players[name].community == "en" then
                        ui.updateTextArea(3, "<p align='center'><font size='25'><font color='#000000'>" ..
                            events.en[event] .. "</font></font></p>", name, 150, 30, 500, 70, 0xffffff, 0x000000, nil,
                            true)
                    end
                end
            elseif event == 8 and getCanGetBalls() >= 1 then
                for name in next, players do
                    if players[name].community == "tr" then
                        ui.updateTextArea(3, "<p align='center'><font size='25'><font color='#000000'>" ..
                            events.tr[event] .. "</font></font></p>", name, 150, 30, 500, 70, 0xffffff, 0x000000, nil,
                            true)
                    elseif players[name].community == "en" then
                        ui.updateTextArea(3, "<p align='center'><font size='25'><font color='#000000'>" ..
                            events.en[event] .. "</font></font></p>", name, 150, 30, 500, 70, 0xffffff, 0x000000, nil,
                            true)
                    end
                end
            elseif event == 9 and getCanGetBalloon() >= 1 then
                for name in next, players do
                    if players[name].community == "tr" then
                        ui.updateTextArea(3, "<p align='center'><font size='25'><font color='#000000'>" ..
                            events.tr[event] .. "</font></font></p>", name, 150, 30, 500, 70, 0xffffff, 0x000000, nil,
                            true)
                    elseif players[name].community == "en" then
                        ui.updateTextArea(3, "<p align='center'><font size='19'><font color='#000000'>" ..
                            events.en[event] .. "</font></font></p>", name, 150, 30, 500, 70, 0xffffff, 0x000000, nil,
                            true)
                    end
                end
            elseif event == 10 and getCanDealWithMurder() >= 2 and getPlaying() > 2 and not murdered then
                for name in next, players do
                    if players[name].community == "tr" then
                        ui.updateTextArea(3, "<p align='center'><font size='25'><font color='#000000'>" ..
                            events.tr[event] .. "</font></font></p>", name, 150, 30, 500, 70, 0xffffff, 0x000000, nil,
                            true)
                    elseif players[name].community == "en" then
                        ui.updateTextArea(3, "<p align='center'><font size='20'><font color='#000000'>" ..
                            events.en[event] .. "</font></font></p>", name, 150, 30, 500, 70, 0xffffff, 0x000000, nil,
                            true)
                    end
                end
            elseif event == 11 and getCanChangeFloor() >= 1 then
                for name in next, players do
                    if players[name].community == "tr" then
                        ui.updateTextArea(3, "<p align='center'><font size='25'><font color='#000000'>" ..
                            events.tr[event] .. "</font></font></p>", name, 150, 30, 500, 70, 0xffffff, 0x000000, nil,
                            true)
                    elseif players[name].community == "en" then
                        ui.updateTextArea(3, "<p align='center'><font size='25'><font color='#000000'>" ..
                            events.en[event] .. "</font></font></p>", name, 150, 30, 500, 70, 0xffffff, 0x000000, nil,
                            true)
                    end
                end
            elseif event == 12 and getCanJump() >= 1 then
                for name in next, players do
                    if players[name].community == "tr" then
                        ui.updateTextArea(3, "<p align='center'><font size='25'><font color='#000000'>" ..
                            events.tr[event] .. "</font></font></p>", name, 150, 30, 500, 70, 0xffffff, 0x000000, nil,
                            true)
                    elseif players[name].community == "en" then
                        ui.updateTextArea(3, "<p align='center'><font size='25'><font color='#000000'>" ..
                            events.en[event] .. "</font></font></p>", name, 150, 30, 500, 70, 0xffffff, 0x000000, nil,
                            true)
                    end
                end
            elseif event == 13 and getCanRun() >= 1 then
                for name in next, players do
                    if players[name].community == "tr" then
                        ui.updateTextArea(3, "<p align='center'><font size='25'><font color='#000000'>" ..
                            events.tr[event] .. "</font></font></p>", name, 150, 30, 500, 70, 0xffffff, 0x000000, nil,
                            true)
                    elseif players[name].community == "en" then
                        ui.updateTextArea(3, "<p align='center'><font size='22'><font color='#000000'>" ..
                            events.en[event] .. "</font></font></p>", name, 150, 30, 500, 70, 0xffffff, 0x000000, nil,
                            true)
                    end
                end
            elseif event == 14 and getCanTP() >= 1 then
                for name in next, players do
                    if players[name].community == "tr" then
                        ui.updateTextArea(3, "<p align='center'><font size='25'><font color='#000000'>" ..
                            events.tr[event] .. "</font></font></p>", name, 150, 30, 500, 70, 0xffffff, 0x000000, nil,
                            true)
                    elseif players[name].community == "en" then
                        ui.updateTextArea(3, "<p align='center'><font size='25'><font color='#000000'>" ..
                            events.en[event] .. "</font></font></p>", name, 150, 30, 500, 70, 0xffffff, 0x000000, nil,
                            true)
                    end
                end
            elseif event == 16 and getPlaying() <= 3 and not meep then
                for name in next, players do
                    if players[name].community == "tr" then
                        ui.updateTextArea(3, "<p align='center'><font size='25'><font color='#000000'>" ..
                            events.tr[event] .. "</font></font></p>", name, 150, 30, 500, 70, 0xffffff, 0x000000, nil,
                            true)
                    elseif players[name].community == "en" then
                        ui.updateTextArea(3, "<p align='center'><font size='25'><font color='#000000'>" ..
                            events.en[event] .. "</font></font></p>", name, 150, 30, 500, 70, 0xffffff, 0x000000, nil,
                            true)
                    end
                end
            elseif event == 18 and not eventLink and getCanChangeSize() > 1 then
                for name in next, players do
                    if players[name].community == "tr" then
                        ui.updateTextArea(3, "<p align='center'><font size='25'><font color='#000000'>" ..
                            events.tr[event] .. "</font></font></p>", name, 150, 30, 500, 70, 0xffffff, 0x000000, nil,
                            true)
                    elseif players[name].community == "en" then
                        ui.updateTextArea(3, "<p align='center'><font size='25'><font color='#000000'>" ..
                            events.en[event] .. "</font></font></p>", name, 150, 30, 500, 70, 0xffffff, 0x000000, nil,
                            true)
                    end
                end
            elseif event == 19 and getCanChangeFloor() >= 1 then
                for name in next, players do
                    if players[name].community == "tr" then
                        ui.updateTextArea(3, "<p align='center'><font size='25'><font color='#000000'>" ..
                            events.tr[event] .. "</font></font></p>", name, 150, 30, 500, 70, 0xffffff, 0x000000, nil,
                            true)
                    elseif players[name].community == "en" then
                        ui.updateTextArea(3, "<p align='center'><font size='20'><font color='#000000'>" ..
                            events.en[event] .. "</font></font></p>", name, 150, 30, 500, 70, 0xffffff, 0x000000, nil,
                            true)
                    end
                end
            end
        end

        if eTime == 15 then
            if event == 1 then
                tfm.exec.setWorldGravity(0, math.random(3, 17))
            elseif event == 2 and getCanChangeSize() >= 1 then
                local i = {}
                repeat
                    i = math.random(#playing)
                until (not players[playing[i]].events.sizeChanged and players[playing[i]].playing == true)
                players[playing[i]].events.sizeChanged = true
                tfm.exec.changePlayerSize(playing[i], 0.5)
            elseif event == 3 and getCanChangeFloor() >= 1 then
                local i = {}
                repeat
                    i = math.random(#playing)
                until (not players[playing[i]].events.floorChanged)
                players[playing[i]].events.floorChanged = true
                tfm.exec.addPhysicObject(players[playing[i]].houseID.down, players[playing[i]].houseFloor.x,
                    players[playing[i]].houseFloor.y, {
                        type = 19,
                        width = 200,
                        height = 50,
                        friction = 0.1,
                        dynamic = players[playing[i]].houseDynamic.down
                    })
                i = {}
            elseif event == 4 and getCanChangeHouseDynamic() >= 1 then
                local i = {}
                repeat
                    i = math.random(#playing)
                until (not players[playing[i]].events.houseDynamicChanged and players[playing[i]].community ~= nil)

                players[playing[i]].houseDynamic.left = true
                players[playing[i]].houseDynamic.right = true
                players[playing[i]].houseDynamic.up = true
                players[playing[i]].events.houseDynamicChanged = true

                tfm.exec.addPhysicObject(players[playing[i]].houseID.left, players[playing[i]].house.left.x,
                    players[playing[i]].house.left.y, {
                        type = players[playing[i]].houseType.left,
                        width = 10,
                        height = 75,
                        color = players[playing[i]].houseType.up == 12 and players[playing[i]].house.up.color or 0,
                        friction = 0.1,
                        dynamic = players[playing[i]].houseDynamic.left
                    })

                tfm.exec.addPhysicObject(players[playing[i]].houseID.right, players[playing[i]].house.right.x,
                    players[playing[i]].house.right.y, {
                        type = players[playing[i]].houseType.right,
                        width = 10,
                        height = 75,
                        color = players[playing[i]].houseType.up == 12 and players[playing[i]].house.up.color or 0,
                        friction = 0.1,
                        dynamic = players[playing[i]].houseDynamic.right
                    })

                tfm.exec.addPhysicObject(players[playing[i]].houseID.up.left, players[playing[i]].house.up.left.x,
                    players[playing[i]].house.up.left.y, {
                        type = players[playing[i]].houseType.up,
                        width = 110,
                        height = 10,
                        color = players[playing[i]].houseType.up == 12 and players[playing[i]].house.up.color or 0,
                        friction = 0.1,
                        angle = -25,
                        dynamic = players[playing[i]].houseDynamic.up
                    })

                tfm.exec.addPhysicObject(players[playing[i]].houseID.up.right, players[playing[i]].house.up.right.x,
                    players[playing[i]].house.up.right.y, {
                        type = players[playing[i]].houseType.up,
                        width = 110,
                        height = 10,
                        color = players[playing[i]].houseType.up == 12 and players[playing[i]].house.up.color or 0,
                        friction = 0.1,
                        angle = 25,
                        dynamic = players[playing[i]].houseDynamic.up
                    })
                i = {}
            elseif event == 5 and getCanGetSnowball() >= 1 then
                local i = 0
                repeat
                    i = math.random(#playing)
                until (players[playing[i]].playing and not players[playing[i]].events.snowball.started)
                players[playing[i]].events.snowball.count = 10
                if players[playing[i]].community == "tr" then
                    ui.addTextArea(players[playing[i]].events.snowball.id,
                        "Kartopu: " .. players[playing[i]].events.snowball.count, playing[i], 350, 375, 90, 20,
                        0xff0000, 0x000000, 1, true)
                elseif players[playing[i]].community == "en" then
                    ui.addTextArea(players[playing[i]].events.snowball.id,
                        "Snowball: " .. players[playing[i]].events.snowball.count, playing[i], 350, 375, 90, 20,
                        0xff0000, 0x000000, 1, true)
                end
                players[playing[i]].events.snowball.started = true
            elseif event == 6 then
                for i = 100, 150 do
                    tfm.exec.addPhysicObject(i, math.random(0, 2700), math.random(-300, -100), {
                        type = 19,
                        dynamic = true,
                        color = 0x62E409,
                        restitution = 0.25,
                        angle = math.random(0, 90)
                    })
                end
            elseif event == 7 and getCanChangeSize() >= 1 then
                local i = {}
                repeat
                    i = math.random(#playing)
                until (not players[playing[i]].events.sizeChanged and players[playing[i]].playing == true)
                players[playing[i]].events.sizeChanged = true
                tfm.exec.changePlayerSize(playing[i], 1.25)
            elseif event == 8 and getCanGetBalls() >= 1 then
                local i = 0
                repeat
                    i = math.random(#playing)
                until (players[playing[i]].playing and not players[playing[i]].events.balls.started)
                players[playing[i]].events.balls.count = 2
                if players[playing[i]].community == "tr" then
                    ui.addTextArea(players[playing[i]].events.balls.id,
                        "Top : " .. players[playing[i]].events.balls.count, playing[i], 450, 375, 80, 20, 0xff0000,
                        0x000000, 1, true)
                elseif players[playing[i]].community == "en" then
                    ui.addTextArea(players[playing[i]].events.balls.id,
                        "Ball : " .. players[playing[i]].events.balls.count, playing[i], 450, 375, 80, 20, 0xff0000,
                        0x000000, 1, true)
                end
                players[playing[i]].events.balls.started = true
            elseif event == 9 and getCanGetBalloon() >= 1 then
                local i = 0
                repeat
                    i = math.random(#playing)
                until (players[playing[i]].playing and not players[playing[i]].events.balloon.started)
                ui.addTextArea(players[playing[i]].events.balloon.id,
                    players[playing[i]].community == "tr" and "Balon" or players[playing[i]].community == "en" and
                        "Balloon", playing[i], 540, 375, 50, 20, 0xff0000, 0x000000, 1, true)
                players[playing[i]].events.balloon.started = true
            elseif event == 10 and getCanDealWithMurder() >= 2 and getPlaying() > 2 and not murdered then
                local i, j = 0, 0
                repeat
                    i = math.random(#playing)
                    j = math.random(#playing)
                until (players[playing[i]].playing and players[playing[j]].playing and players[playing[i]].coins >= 15 and
                    i ~= j)
                players[playing[i]].events.murder.name = playing[j]
                if players[playing[i]].community == "tr" then
                    ui.addPopup(1, 1,
                        "<br><font color='#f0f000'>SERİ KATİL :</font><br><br><font color='#affa500'>" .. playing[j] ..
                            "</font> kişisini öldürmemi istersin?<br><br>Ücret = 15 para", playing[i], 275, 200,
                        250, true)
                elseif players[playing[i]].community == "en" then
                    ui.addPopup(1, 1,
                        "<br><font color='#f0f000'>MURDER :</font><br><br>Do you want me to kill <font color='#affa500'>" ..
                            playing[j] .. "</font> ?" ..
                            "<br><br>Payment = 15 Money<br><br><font color='#ffff00'>[YES]-[NO]</font>", playing[i],
                        275, 200, 250, true)
                end
                eventTrue[10] = false
            elseif event == 11 and getCanChangeFloor() >= 1 then
                local i = {}
                repeat
                    i = math.random(#playing)
                until (not players[playing[i]].events.floorChanged and players[playing[i]].houseSetted)
                players[playing[i]].events.floorChanged = true
                tfm.exec.removePhysicObject(players[playing[i]].houseID.down)
            elseif event == 12 and getCanJump() >= 1 then
                local i = {}
                repeat
                    i = math.random(#playing)
                until (not players[playing[i]].events.canJump and players[playing[i]].playing)
                players[playing[i]].events.canJump = true
                players[playing[i]].events.linked = true
            elseif event == 13 and getCanRun() >= 1 then
                local i = {}
                repeat
                    i = math.random(#playing)
                until (not players[playing[i]].events.canRun and players[playing[i]].playing)
                players[playing[i]].events.canRun = true
            elseif event == 14 and getCanTP() >= 1 then
                local i = {}
                repeat
                    i = math.random(#playing)
                until (not players[playing[i]].events.tp.started and players[playing[i]].playing)
                players[playing[i]].events.tp.started = true
                ui.addTextArea(players[playing[i]].events.tp.id,
                    players[playing[i]].community == "tr" and "<p aling='center'>Işınlan</p>" or
                        players[playing[i]].community == "en" and "Teleport", playing[i], 600, 375, 55, 20, 0xff0000,
                    0x000000, 1, true)
            elseif event == 15 then
                local x, y = math.random(players[playing[1]].house.x - 50, players[playing[#playing]].house.x + 50),
                    math.random(players[playing[1]].house.y - 120, players[playing[#playing]].house.y + 20)
                tfm.exec.removeBonus(1)
                tfm.exec.addBonus(0, x, y, 1, 0, true, nil)
            elseif event == 16 and getPlaying() <= 3 and not meep then
                for name in next, players do
                    if players[name].playing then
                        tfm.exec.giveMeep(name, true)
                    end
                end
                meep = true
                eventTrue[16] = false
            elseif event == 17 then
                tfm.exec.snow(20, 15)
            elseif event == 18 and not eventLink and getCanChangeSize() > 1 then
                local i, j = {}, {}
                repeat
                    i = math.random(#playing)
                    j = math.random(#playing)
                until (not players[playing[i]].events.linked and players[playing[i]].playing and
                    players[playing[j]].playing and i ~= j)
                tfm.exec.linkMice(playing[i], playing[j])
                players[playing[i]].events.linked = true
                players[playing[i]].events.sizeChanged = true
                players[playing[j]].events.linked = true
                players[playing[j]].events.sizeChanged = true
                eventLink = true
                eventTrue[18] = false
            elseif event == 19 and getCanChangeFloor() >= 1 then
                local i = {}
                repeat
                    i = math.random(#playing)
                until (not players[playing[i]].events.floorChanged)
                players[playing[i]].events.floorChanged = true
                tfm.exec.addPhysicObject(players[playing[i]].houseID.down, players[playing[i]].houseFloor.x,
                    players[playing[i]].houseFloor.y, {
                        type = 2,
                        width = 200,
                        height = 50,
                        friction = 0.1,
                        restitution = 0.75,
                        dynamic = players[playing[i]].houseDynamic.down
                    })
                i = {}
            end

            time = 0
            eTime = 0
            ui.updateTextArea(3, "", nil, 0xffffff, 0x000000, 1, true)
        end
        for name in next, players do
            if players[name].events.snowball.cooldown > 0 then
                players[name].events.snowball.cooldown = players[name].events.snowball.cooldown - 1
            elseif players[name].events.balls.cooldown > 0 then
                players[name].events.balls.cooldown = players[name].events.balls.cooldown - 1
            end
        end
    else
        time = 0
        eTime = 0
    end
    -- EVENT CHOOSING LOGIC --
    if getCanChangeSize() == 0 then
        eventTrue[2] = false
        eventTrue[7] = false
    else
        eventTrue[2] = true
        eventTrue[7] = true
    end
    if getCanGetSnowball() == 0 then
        eventTrue[5] = false
    else
        eventTrue[5] = true
    end
    if getCanGetBalls() == 0 then
        eventTrue[8] = false
    else
        eventTrue[8] = true
    end
    if getCanGetBalloon() == 0 then
        eventTrue[9] = false
    else
        eventTrue[9] = true
    end
    if getCanChangeHouseDynamic() == 0 then
        eventTrue[4] = false
    else
        eventTrue[4] = true
    end
    if getCanChangeFloor() == 0 then
        eventTrue[3] = false
        eventTrue[11] = false
        eventTrue[19] = false
    else
        eventTrue[3] = true
        eventTrue[11] = true
        eventTrue[19] = true
    end
    if getCanDealWithMurder() < 2 then
        eventTrue[10] = false
    else
        eventTrue[10] = true
    end
    if getCanJump() == 0 then
        eventTrue[12] = false
    else
        eventTrue[12] = true
    end
    if getCanRun() == 0 then
        eventTrue[13] = false
    else
        eventTrue[13] = true
    end
    if getCanTP() == 0 then
        eventTrue[14] = false
    else
        eventTrue[14] = true
    end
    if getCanLink() == 0 then
        eventTrue[18] = false
    else
        eventTrue[18] = true
    end
    --------------------------
end

function eventKeyboard(name, key, down, x, y)
    if key == 0 or key == 2 then
        players[name][1] = key
        if players[name].events.canRun then
            tfm.exec.movePlayer(name, 0, 0, false, players[name][1] == 0 and -25 or players[name][1] == 2 and 25, false)
        end
    elseif key == 1 then
        if not tfm.get.room.playerList[name].isJumping and players[name].events.canJump then
            tfm.exec.movePlayer(name, 0, 0, false, nil, -75, false)
        end
    elseif key == 32 then
        if players[name].events.balloon.started and players[name].playing then
            tfm.exec.addShamanObject(math.random(2800, 2810),
                players[name][1] == 0 and x - 15 or players[name][1] == 2 and x + 15, y + 35)
            players[name].events.balloon.started = false
            ui.removeTextArea(players[name].events.balloon.id)
        end
    elseif key == 69 then
        if players[name].events.snowball.count >= 1 and players[name].playing and players[name].events.snowball.cooldown ==
            0 then
            tfm.exec.addShamanObject(34, players[name][1] == 0 and x - 20 or players[name][1] == 2 and x + 20, y - 5, 0,
                players[name][1] == 0 and -20 or players[name][1] == 2 and 20, 0)
            tfm.exec.addShamanObject(34, players[name][1] == 0 and x - 15 or players[name][1] == 2 and x + 15, y - 5, 0,
                players[name][1] == 0 and -20 or players[name][1] == 2 and 20, 0)
            players[name].events.snowball.count = players[name].events.snowball.count - 2
            players[name].events.snowball.cooldown = 2
            if players[name].community == "tr" then
                ui.addTextArea(players[name].events.snowball.id, "Kartopu: " .. players[name].events.snowball.count,
                    name, 350, 375, 90, 20, 0xff0000, 0x000000, 1, true)
            elseif players[name].community == "en" then
                ui.addTextArea(players[name].events.snowball.id, "Snowball: " .. players[name].events.snowball.count,
                    name, 350, 375, 90, 20, 0xff0000, 0x000000, 1, true)
            end
            if players[name].events.snowball.count == 0 then
                ui.removeTextArea(players[name].events.snowball.id)
                players[name].events.snowball.started = false
            end
        end
    elseif key == 81 then
        if players[name].events.balls.count >= 1 and players[name].playing and players[name].events.balls.cooldown == 0 then
            tfm.exec.addShamanObject(players[name].events.balls.ballType,
                players[name][1] == 0 and x - 15 or players[name][1] == 2 and x + 15, y - 10, 0,
                players[name][1] == 0 and -35 or players[name][1] == 2 and 35, 0)
            players[name].events.balls.count = players[name].events.balls.count - 1
            players[name].events.balls.cooldown = 2
            if players[name].community == "tr" then
                ui.addTextArea(players[name].events.balls.id, "Top : " .. players[name].events.balls.count, name, 450,
                    375, 80, 20, 0xff0000, 0x000000, 1, true)
            elseif players[name].community == "en" then
                ui.addTextArea(players[name].events.balls.id, "Ball : " .. players[name].events.balls.count, name, 450,
                    375, 80, 20, 0xff0000, 0x000000, 1, true)
            end
            if players[name].events.balls.count == 0 then
                ui.removeTextArea(players[name].events.balls.id)
                players[name].events.balls.started = false
            end
        end
    end
end

function eventMouse(name, x, y)
    if players[name].events.tp.started and players[name].playing then
        tfm.exec.displayParticle(36, tfm.get.room.playerList[name].x, tfm.get.room.playerList[name].y)
        tfm.exec.movePlayer(name, x, y, false)
        tfm.exec.displayParticle(36, x, y)
        players[name].events.tp.started = false
        ui.removeTextArea(players[name].events.tp.id)
    end
    if not gameStarted then
        if players[name].interfaces.shopOpened then
            print(x, y)
        end
    end
end

function eventPlayerBonusGrabbed(name, id)
    if id == 1 then
        tfm.exec.removeBonus(id)
        decreaseCoin(name, -(math.random(1, 5)))
        tfm.exec.setPlayerScore(name, players[name].coin, false)
    end
end

function eventPopupAnswer(id, name, answer)
    if players[name].playing then
        if answer == "yes" then
            tfm.exec.killPlayer(players[name].events.murder.name)
            players[players[name].events.murder.name].events.murder.died = true
            decreaseCoin(name, 15)
            murdered = true
        end
    end
end

-------------

-- FUNCTIONS --
function getAliveMice()
    local i = 0
    for name in next, tfm.get.room.playerList do
        if not tfm.get.room.playerList[name].isDead then
            i = i + 1
        end
    end
    return i
end

function getPlaying()
    local playingCount = 0
    for name in next, tfm.get.room.playerList do
        if players[name].playing then
            playingCount = playingCount + 1
        end
    end
    return playingCount
end

function getCanChangeSize()
    local i = 0
    for name in next, tfm.get.room.playerList do
        if not players[name].events.sizeChanged and players[name].playing then
            i = i + 1
        end
    end
    return i
end

function getCanGetSnowball()
    local i = 0
    for name in next, tfm.get.room.playerList do
        if not players[name].events.snowball.started and players[name].playing then
            i = i + 1
        end
    end
    return i
end

function getCanGetBalls()
    local i = 0
    for name in next, tfm.get.room.playerList do
        if not players[name].events.balls.started and players[name].playing then
            i = i + 1
        end
    end
    return i
end

function getCanGetBalloon()
    local i = 0
    for name in next, tfm.get.room.playerList do
        if not players[name].events.balloon.started and players[name].playing then
            i = i + 1
        end
    end
    return i
end

function getCanChangeHouseDynamic()
    local i = 0
    for name in next, tfm.get.room.playerList do
        if not players[name].events.houseDynamicChanged then
            i = i + 1
        end
    end
    return i
end

function getCanChangeFloor()
    local i = 0
    for name in next, tfm.get.room.playerList do
        if not players[name].events.floorChanged then
            i = i + 1
        end
    end
    return i
end

function getCanDealWithMurder()
    local i = 0
    for name in next, tfm.get.room.playerList do
        if players[name].coins >= 20 and players[name].playing then
            i = i + 1
        end
    end
    return i
end

function getCanJump()
    local i = 0
    for name in next, tfm.get.room.playerList do
        if not players[name].events.canJump and players[name].playing then
            i = i + 1
        end
    end
    return i
end

function getCanRun()
    local i = 0
    for name in next, tfm.get.room.playerList do
        if not players[name].events.canRun and players[name].playing then
            i = i + 1
        end
    end
    return i
end

function getCanTP()
    local i = 0
    for name in next, tfm.get.room.playerList do
        if not players[name].events.tp.started and players[name].playing then
            i = i + 1
        end
    end
    return i
end

function getCanLink()
    local i = 0
    for name in next, tfm.get.room.playerList do
        if not players[name].events.linked and not players[name].sizeChanged and players[name].playing then
            i = i + 1
        end
    end
    return i
end

function decreaseCoin(name, decreaseValue)
    players[name].coins = tfm.get.room.playerList[name].score - decreaseValue
    tfm.exec.setPlayerScore(name, players[name].coins, false)
end

function stopGame()
    gameStarted = false
    murdered = false
    meep = false
    eventLink = false
    for i = 1, #eventTrue do
        eventTrue[i] = true
    end
    for name in next, tfm.get.room.playerList do
        tfm.exec.killPlayer(name)
        tfm.exec.changePlayerSize(name, 1)
        ui.removeTextArea(players[name].events.snowball.id)
        ui.removeTextArea(players[name].events.balls.id)
        ui.removeTextArea(players[name].events.balloon.id)
        ui.removeTextArea(players[name].events.tp.id)
        ui.removeTextArea(players[name].house.nameID)
        ui.removeTextArea(150)
        if players[name].events.linked then
            for iname in next, players do
                tfm.exec.linkMice(name, iname, false)
            end
        end

        if players[name].playing and getPlaying() == 1 then
            players[name].coins = tfm.get.room.playerList[name].score + 20
            tfm.exec.setPlayerScore(name, players[name].coins, false)
            for iname in next, tfm.get.room.playerList do
                if players[iname].community == "tr" then
                    ui.addTextArea(10,
                        "<p align='center'><font size='22'><font color='#FFFFFF'>Kazanan </font><font color='#FF0000'>" ..
                            name .. "</font><font color='#FFFFFF'> !</font></font></p>", iname, 0, 30, 800, 45, nil,
                        nil, 0, true)
                elseif players[iname].community == "en" then
                    ui.addTextArea(10, "<p align='center'><font size='22'><font color='#FF0000'>" .. name ..
                        "</font><font color='#FFFFFF'> Won !</font></font></p>", iname, 0, 30, 800, 45, nil, nil, 0,
                        true)
                end
            end
        end
    end
    for i = 1, getAliveMice() * 4 do
        tfm.exec.removePhysicObject(i)
    end
    ui.removeTextArea(1)
    ui.removeTextArea(3)
    playing = {}
    for name in next, tfm.get.room.playerList do
        players[name] = {
            community = players[name].community,
            playing = false,
            houseLevel = 1,
            coins = players[name].coins,
            particle,
            house = {
                x,
                y,
                left = {x, y},
                right = {x, y},
                up = {
                    left = {x, y},
                    right = {x, y},
                    color = players[name].house.up.color
                },
                down = {
                    x,
                    y,
                    color = players[name].house.down.color
                },
                nameID = players[name].house.nameID,
                currentDecoration = {
                    img = players[name].house.currentDecoration.img,
                    x = players[name].house.currentDecoration.x,
                    y = players[name].house.currentDecoration.y
                }
            },
            houseSetted = false,
            houseFloor = {x, y},
            houseID = {
                left,
                right,
                up = {left, right},
                down
            },
            houseType = {
                left = players[name].houseType.left,
                right = players[name].houseType.right,
                up = players[name].houseType.up,
                wallType = players[name].houseType.wallType,
                down = players[name].houseType.down
            },
            houseDynamic = {
                left = false,
                right = false,
                up = false,
                down = false
            },
            events = {
                sizeChanged = false,
                houseDynamicChanged = false,
                floorChanged = false,
                canJump = false,
                canRun = false,
                linked = false,
                tp = {
                    started = false,
                    id = players[name].events.tp.id
                },
                balloon = {
                    started = false,
                    id = players[name].events.balloon.id
                },
                snowball = {
                    count = 0,
                    started = false,
                    cooldown = 0,
                    id = players[name].events.snowball.id
                },
                balls = {
                    count = 0,
                    started = false,
                    cooldown = 0,
                    ballType = players[name].events.balls.ballType,
                    id = players[name].events.balls.id
                },
                murder = {
                    name,
                    died = false
                }
            },
            interfaces = {
                shopOpened = false,
                shopPage = players[name].interfaces.shopPage
            },
            inventory = {
                walls = {
                    wood = players[name].inventory.walls.wood,
                    ice = players[name].inventory.walls.ice,
                    choco = players[name].inventory.walls.choco,
                    colored = players[name].inventory.walls.colored
                },
                grounds = {
                    sand = players[name].inventory.grounds.sand,
                    yellow = players[name].inventory.grounds.yellow,
                    snow = players[name].inventory.grounds.snow,
                    pink = players[name].inventory.grounds.pink,
                    colored = players[name].inventory.grounds.colored
                },
                balls = {
                    football = players[name].inventory.balls.football,
                    basketball = players[name].inventory.balls.basketball,
                    hedgehog = players[name].inventory.balls.hedgehog
                },
                decorations = {
                    pig = players[name].inventory.decorations.pig
                }
            }
        }
    end
    eventNewGame()
end

function createHouse(x, y)
    local objID = 1
    local i = 0
    local particles = {1, 2, 5, 9, 11, 13, 21, 22, 23, 24, 29, 30, 31, 32, 38, 39, 40}
    for name, player in pairs(tfm.get.room.playerList) do -- Nick döndürür
        if players[name].playing then
            if players[name].houseLevel == 1 then -- houseLevel
                tfm.exec.addPhysicObject(objID, x - 75, y, -- Sol Duvar
                {
                    type = players[name].houseType.left,
                    width = 10,
                    height = 75,
                    color = players[name].houseType.up == 12 and players[name].house.up.color or 0,
                    friction = players[name].houseType.wallType == "Çiko" and 20 or players[name].houseType.wallType ==
                        "Buz" and 0.05 or 0.1,
                    dynamic = players[name].houseDynamic.left
                })
                players[name].houseID.left = objID
                players[name].house.left.x = x - 75
                players[name].house.left.y = y

                tfm.exec.addPhysicObject(objID + 1, x + 75, y, -- Sağ Duvar
                {
                    type = players[name].houseType.right,
                    width = 10,
                    height = 75,
                    color = players[name].houseType.up == 12 and players[name].house.up.color or 0,
                    friction = players[name].houseType.wallType == "Çiko" and 20 or players[name].houseType.wallType ==
                        "Buz" and 0.05 or 0.1,
                    dynamic = players[name].houseDynamic.right
                })
                players[name].houseID.right = objID + 1
                players[name].house.right.x = x + 75
                players[name].house.right.y = y

                tfm.exec.addPhysicObject(objID + 2, x - 46, y - 50, -- Üst Sol
                {
                    type = players[name].houseType.up,
                    width = 110,
                    height = 10,
                    color = players[name].houseType.up == 12 and players[name].house.up.color or 0,
                    friction = players[name].houseType.wallType == "Çiko" and 20 or players[name].houseType.wallType ==
                        "Buz" and 0.05 or 0.1,
                    angle = -25,
                    dynamic = players[name].houseDynamic.up
                })
                players[name].houseID.up.left = objID + 2
                players[name].house.up.left.x = x - 46
                players[name].house.up.left.y = y - 50

                tfm.exec.addPhysicObject(objID + 3, x + 46, y - 50, -- Üst Sağ
                {
                    type = players[name].houseType.up,
                    width = 110,
                    height = 10,
                    color = players[name].houseType.up == 12 and players[name].house.up.color or 0,
                    friction = players[name].houseType.wallType == "Çiko" and 20 or players[name].houseType.wallType ==
                        "Buz" and 0.05 or 0.1,
                    angle = 25,
                    dynamic = players[name].houseDynamic.up
                })
                players[name].houseID.up.right = objID + 3
                players[name].house.up.right.x = x + 46
                players[name].house.up.right.y = y - 50

                tfm.exec.addPhysicObject(objID + 4, x, y + 100, -- Zemin
                {
                    type = players[name].houseType.down,
                    width = 200,
                    height = 50,
                    color = players[name].houseType.down == 12 and players[name].house.down.color or 0,
                    friction = 0.1,
                    dynamic = players[name].houseDynamic.down
                })
                players[name].houseID.down = objID + 4
                players[name].house.down.x = x
                players[name].house.down.y = y + 100
                players[name].house.x = x
                players[name].house.y = y
                players[name].houseFloor.x = x
                players[name].houseFloor.y = y + 100
                players[name].houseSetted = true
                tfm.exec.addImage("1689ae9ffcb.png", "?1", x - math.random(0, 150), y - math.random(150, 275))
                players[name].particle = particles[math.random(#particles)]
                tfm.exec.movePlayer(name, players[name].house.x, players[name].house.y + 60)
                objID = objID + 5
                if getPlaying() > 8 then
                    if i == 1 then
                        x = x + 325
                        y = y - 210
                        i = 0
                    elseif i == 0 then
                        y = y + 210
                        i = 1
                    end
                else
                    x = x + 325
                end
            end
            for i = 1, 50 do
                tfm.exec.displayParticle(players[name].particle, players[name].house.x, players[name].house.y + 45,
                    math.random(-3, 3), math.random(-3, 3))
            end
            ui.addTextArea(players[name].house.nameID,
                "<p align='center'><font color='#000000'>" .. name .. "</font></p>", nil, players[name].house.x - 50,
                players[name].house.y - 20, 100, 20,
                players[name].inventory.walls.colored and players[name].house.up.color or 0xff0000, nil, 0.10, false)
            if players[name].house.currentDecoration.img then
                tfm.exec.addImage(players[name].house.currentDecoration.img, "?1",
                    players[name].house.x + players[name].house.currentDecoration.x,
                    players[name].house.y + players[name].house.currentDecoration.y, nil)
            end
        end
        if not players[name].playing then
            tfm.exec.killPlayer(name)
        end
    end
end
