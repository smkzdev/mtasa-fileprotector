function unprotectFile(rsc, path, key)

    local rsc2 = getResourceName(rsc)
	local file = fileOpen(":"..rsc2.."/"..path.."")
	local size = fileGetSize(file)
	local FirstPart = fileRead(file, 65536 + 4)
		fileSetPos(file, 65536 + 4)
	
	local SecondPart = fileRead(file, size - (65536 + 4))
	fileClose(file)

	return decodeString('tea', FirstPart, { key = key })..SecondPart
 
end


