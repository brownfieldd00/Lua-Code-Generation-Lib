local lib = {}
lib.__index = lib
lib.variables = {}

function lib:createVariable(name, value)
    value = value or nil
    self.variables[name] = value
    return self.variables[name]
end
function lib:resolvePath(path)
    local function resolve(x)
        if x == 'game' then return game end
        if x == 'workspace' then return workspace end
        if x == game then return x:GetService(x) end
        return x:FindFirstChild(x)
    end
    local instance = resolve(path)
    if instance then return instance end
    return nil
end
function lib:resolveVariable(name)
    if self.variables[name] then return self.variables[name] end
    return nil
end
return lib