function fileProtection(path, key)
	local file = fileOpen(path)
	local size = fileGetSize(file)
	local FirstPart = fileRead(file, 65536)
	fileSetPos(file, 65536)
	local SecondPart = fileRead(file, size - 65536)
	fileClose(file)

    if USE_MD5 == true then
        path = md5(path)
    else
        path = path
    end

    file = fileCreate(path)
    fileWrite(file, encodeString('tea', FirstPart, { key = key })..SecondPart)
    fileClose(file)

    outputChatBox ( "#FFFFFF[#5f27cdFile Protector#FFFFFF] #1dd1a1[SUCCESS] #ffffffFile protected as: "..path.."", root, 255, 255, 255, true)
	return true
end

function protectFile(player, commandName, arquivo, senha)
    if not arquivo or not senha then outputChatBox ( "#FFFFFF[#5f27cdFile Protector#FFFFFF] #ff6b6b[ERROR] #ffffffYou didn't provide a file and/or password, example: /protect file.txt password123.", root, 255, 255, 255, true ) return false end
    if not fileExists (arquivo) then outputChatBox ( "#FFFFFF[#5f27cdFile Protector#FFFFFF] #ff6b6b[ERROR] #ffffffThe file provided does not exist.", root, 255, 255, 255, true) return false  end
    FileProtection(arquivo, senha)
end
addCommandHandler("protect", protectFile)

