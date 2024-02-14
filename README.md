
# File Protector MTA:SA

Project developed with the purpose of protecting server files that are models, textures, images.


## Supported file types
It is compatible with various file types, however, I haven't tested all of them. Those marked with ⚠️ indicate uncertainty.
| Extension   | Status  |
| :---------- | :--------- | 
| `TXD` | ✅ | 
| `DFF` | ✅ | 
| `COL` | ✅ | 
| `PNG` | ✅ | 
| `JPG/JPEG` | ✅ | 
| `SOUNDS FILES` | ⚠️ | 


## Environment Variables
Available settings in the config.lua file
| Variable   | Description  |
| :---------- | :--------- | 
| `MD5` | Set to true if you want the file to be renamed as MD5 | 

## Usage

To protect the files is simple, just start the resource, place the file you want to protect in the same folder as the resource, and type a command in the game, /protect {file} {password}, for example: /protect test.txd 123

Note: You don't need to add the files you want to protect in the meta.xml.


To use a protected file within your resource, you need to use a different method:
```lua
-- Usage
-- exports["{RESOURCE NAME}"]:unprotectFile(getThisResource(),'{FILE NAME}', '{FILE PASSWORD}')

-- Usage example
exports["fileprotector"]:unprotectFile(getThisResource(),'example.txd', '123')
```

