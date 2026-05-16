-- RestApiBeispiele SDK error

local RestApiBeispieleError = {}
RestApiBeispieleError.__index = RestApiBeispieleError


function RestApiBeispieleError.new(code, msg, ctx)
  local self = setmetatable({}, RestApiBeispieleError)
  self.is_sdk_error = true
  self.sdk = "RestApiBeispiele"
  self.code = code or ""
  self.msg = msg or ""
  self.ctx = ctx
  self.result = nil
  self.spec = nil
  return self
end


function RestApiBeispieleError:error()
  return self.msg
end


function RestApiBeispieleError:__tostring()
  return self.msg
end


return RestApiBeispieleError
