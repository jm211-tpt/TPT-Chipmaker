-- v[CONFIG TOOL]v
function MaticzplChipmaker.ConfigTool.EnableConfigMode()
    cMaker.ConfigTool.inConfigMode = true
    cMaker.StackTool.DisableStackMode()  
    cMaker.StackEdit.DisableStackEditMode()
end

function MaticzplChipmaker.ConfigTool.DisableConfigMode()
    cMaker.ConfigTool.inConfigMode = false                
end


local function ConfigToolInit()
    event.register(event.keypress, 
        function (key,scan,_repeat,shift,ctrl,alt)
            if key == 99 and not shift and not ctrl and not alt and not _repeat  then   -- C
                cMaker.ConfigTool.EnableConfigMode()
                return false    
            end            
        end
    )

    event.register(event.mouseup,
        function(x,y,button,reason)
            if cMaker.ConfigTool.inConfigMode and button == 1 then        
                cMaker.ConfigTool.target = sim.partID(x,y)
                return false
            end
        end
    )
end

ConfigToolInit()
-- ^[CONFIG TOOL]^


