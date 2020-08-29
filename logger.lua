local file_ffi = require "file"

local _M = {}

local function write_file( data, file_path )

    local flag = bit.bor(file_ffi.O_CREAT, file_ffi.O_WRONLY, file_ffi.O_APPEND)
    local mode = bit.bor(file_ffi.S_IRUSR, file_ffi.S_IWUSR, file_ffi.S_IRGRP, file_ffi.S_IROTH)

    local f, err_code, err_msg = file_ffi:open(file_path, flag, mode)
    if err_code ~= nil then
        return nil, err_code, err_msg
    end

    local _, err_w_code, err_w_msg = f:write(data)
    if err_w_code ~= nil then
        return nil, err_w_code, err_w_msg
    end

    return nil, nil, nil
end


function _M.send(msg, file_path )
    assert(file_path ~= nil)

    local _, err_code, err_msg = write_file( msg, file_path )
    if err_code ~= nil then
        ngx.log(ngx.ERR, 'logger failed! err_code: ', err_code, ' err_msg: ', err_msg)
    end

end

return _M


