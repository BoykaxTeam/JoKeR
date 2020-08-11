-- Welcom to file the best source in the telegram
-- This warehouse was developed by : Blanther t.me/bbbbl
 -- join in chennel Source t.me/JoKeR_aHs
-- ThAnk You. 
http = require("socket.http")
https = require("ssl.https")
JSON = dofile("./JoKeR_lib/dkjson.lua")
json = dofile("./JoKeR_lib/JSON.lua")
URL = dofile("./JoKeR_lib/url.lua")
serpent = dofile("./JoKeR_lib/serpent.lua")
redis = dofile("./JoKeR_lib/redis.lua").connect("127.0.0.1", 6379)
JoKeR_Server = io.popen("echo $SSH_CLIENT | awk '{ print $1}'"):read('*a')
--------------------------------------------------------------------------------------------------------------
local AutoSet = function() 
local create = function(data, file, uglify)  
file = io.open(file, "w+")   
local serialized   
if not uglify then  
serialized = serpent.block(data, {comment = false, name = "Info"})  
else  
serialized = serpent.dump(data)  
end    
file:write(serialized)    
file:close()  
end  
if not redis:get(JoKeR_Server..":token") then
io.write('\27[0;31m\n▸ Send Your Token Bot ~ ارسل توكن البوت\n\27')
local token = io.read()
if token ~= '' then
local url , res = https.request('https://api.telegram.org/bot'..token..'/getMe')
if res ~= 200 then
print('\27[1;31m▸ Sorry The Token is not Correct ~ عذراً التوكن ليس صحيح')
else
io.write('\27[0;32m ▸ The Token Is Saved ~ تم حفظ التوكن\n27[0;39;49m')
redis:set(JoKeR_Server..":token",token)
end 
else
print('\27[1;31m▸ The Token was not Saved ~ لم يتم حفظ التوكن')
end 
os.execute('lua JoKeR.lua')
end
if not redis:get(JoKeR_Server..":SUDO:ID") then
io.write('\27[0;31m\n▸  Send Your Id Sudo : ~ ارسل ايدي المطور\n\27[0;33;49m')
local SUDOID = io.read()
if SUDOID ~= '' then
io.write('\27[0;32m ▸ The Id Is Saved ~ تم حفظ الايدي \n27[0;39;49m')
redis:set(JoKeR_Server..":SUDO:ID",SUDOID)
else
print('\27[0;31m▸ The Id Is Not Saved Send Again ~ لم يتم حفظ الايدي ارسل الايدي مرة اخرى')
end 
os.execute('lua JoKeR.lua')
end
local create_config_auto = function()
config = {
token = redis:get(JoKeR_Server..":token"),
SUDO = redis:get(JoKeR_Server..":SUDO:ID"),
 }
create(config, "./info_JoKeR_TeaM.lua")   
end 
create_config_auto()
print('\n\27[1;34m Hi Welcome To Source Boyka X ')
file = io.open("JoKeR", "w")  
file:write([[
#!/usr/bin/env bash
cd $HOME/JoKeR
token="]]..redis:get(JoKeR_Server..":token")..[["
while(true) do
rm -fr ../.telegram-cli
if [ ! -f ./tg ]; then
echo "⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤"
echo "TG IS NOT FIND IN FILES BOT"
echo "⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤"
exit 1
fi
if [ ! $token ]; then
echo "⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤"
echo -e "\e[1;36mTOKEN IS NOT FIND IN FILE info_JoKeR_TeaM.lua \e[0m"
echo "⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤"
exit 1
fi
echo -e "\033[38;5;208m"
echo -e "                                                  "
echo -e "\033[0;00m"
echo -e "\e[36m"
./tg -s ./JoKeR.lua -p PROFILE --bot=$token
done
]])  
file:close()  
file = io.open("Run", "w")  
file:write([[
#!/usr/bin/env bash
cd $HOME/JoKeR
while(true) do
rm -fr ../.telegram-cli
screen -S JoKeR -X kill
screen -S JoKeR ./JoKeR
done
]])  
file:close() 
os.execute('rm -fr $HOME/.telegram-cli')
end 
local serialize_to_file = function(data, file, uglify)  
file = io.open(file, "w+")  
local serialized  
if not uglify then   
serialized = serpent.block(data, {comment = false, name = "Info"})  
else   
serialized = serpent.dump(data) 
end  
file:write(serialized)  
file:close() 
end 
local load_redis = function()  
local f = io.open("./info_JoKeR_TeaM.lua", "r")  
if not f then   
AutoSet()  
else   
f:close()  
redis:del(JoKeR_Server..":token")
redis:del(JoKeR_Server..":SUDO:ID")
end  
local config = loadfile("./info_JoKeR_TeaM.lua")() 
return config 
end 
_redis = load_redis()  
--------------------------------------------------------------------------------------------------------------
print("\27[0;32m"..[[
▸ Dev : @GSGGG 
▸ Ch SourcE : @JoKeR_aHs
]].."\n\027[00m")
--------------------------------------------------------------------------------------------------------------------------
sudos = dofile("./info_JoKeR_TeaM.lua") 
SUDO = tonumber(sudos.SUDO)
sudo_users = {SUDO}
JoKeR = sudos.token:match("(%d+)")  
token = sudos.token 
--- start functions 
-------------------------------------------------------------------------------------------------------------- 
function vardump(value)
print(serpent.block(value, {comment=false}))   
end 
--------------------------------------------------------------------------------------------------------------
sudo_users = {SUDO,842721206,772147966}   
function Sudo_JoKeR(msg)  
local JoKeR = false  
for k,v in pairs(sudo_users) do  
if tonumber(msg.sender_user_id_) == tonumber(v) then  
JoKeR = true  
end  
end  
return JoKeR  
end
--------------------------------------------------------------------------------------------------------------
function Sudo(msg) 
local hash = redis:sismember(JoKeR..'Sudo:User', msg.sender_user_id_) 
if hash or Sudo_JoKeR(msg) then  
return true  
else  
return false  
end  
end
--------------------------------------------------------------------------------------------------------------
function BasicConstructor(msg)
local hash = redis:sismember(JoKeR..'Basic:Constructor'..msg.chat_id_, msg.sender_user_id_) 
if hash or Sudo_JoKeR(msg) or Sudo(msg) then 
return true 
else 
return false 
end 
end
--------------------------------------------------------------------------------------------------------------
function Constructor(msg)
local hash = redis:sismember(JoKeR..'Constructor'..msg.chat_id_, msg.sender_user_id_) 
if hash or Sudo_JoKeR(msg) or Sudo(msg) or BasicConstructor(msg) then    
return true    
else    
return false    
end 
end
--------------------------------------------------------------------------------------------------------------
function Owners(msg)
local hash = redis:sismember(JoKeR..'Owners'..msg.chat_id_,msg.sender_user_id_)    
if hash or Sudo_JoKeR(msg) or Sudo(msg) or BasicConstructor(msg) or Constructor(msg) then    
return true    
else    
return false    
end 
end
--------------------------------------------------------------------------------------------------------------
function Mod(msg)
local hash = redis:sismember(JoKeR..'Mod:User'..msg.chat_id_,msg.sender_user_id_)    
if hash or Sudo_JoKeR(msg) or Sudo(msg) or BasicConstructor(msg) or Constructor(msg) or Owners(msg) then    
return true    
else    
return false    
end 
end
--------------------------------------------------------------------------------------------------------------
function Vips(msg)
local hash = redis:sismember(JoKeR..'Vips:User'..msg.chat_id_,msg.sender_user_id_) 
if hash or Sudo_JoKeR(msg) or Sudo(msg) or BasicConstructor(msg) or Constructor(msg) or Owners(msg) or Mod(msg) then    
return true 
else 
return false 
end 
end
--------------------------------------------------------------------------------------------------------------
function Can_or_NotCan(user_id,chat_id)
if tonumber(user_id) == tonumber(842721206) then  
var = true  
elseif tonumber(user_id) == tonumber(772147966) then
var = true  
elseif tonumber(user_id) == tonumber(SUDO) then  
var = true  
elseif redis:sismember(JoKeR..'Sudo:User', user_id) then
var = true  
elseif redis:sismember(JoKeR..'Basic:Constructor'..chat_id, user_id) then
var = true
elseif redis:sismember(JoKeR..'Constructor'..chat_id, user_id) then
var = true  
elseif redis:sismember(JoKeR..'Owners'..chat_id, user_id) then
var = true  
elseif redis:sismember(JoKeR..'Mod:User'..chat_id, user_id) then
var = true  
elseif redis:sismember(JoKeR..'Vips:User'..chat_id, user_id) then  
var = true  
elseif redis:sismember(JoKeR..'Mamez:User'..chat_id, user_id) then  
var = true 
else  
var = false  
end  
return var
end 
--------------------------------------------------------------------------------------------------------------
function Rutba(user_id,chat_id)
if tonumber(user_id) == tonumber(842721206) then  
var = 'مبرمج السورس'
elseif tonumber(user_id) == tonumber(772147966) then
var = 'مبرمج السورس'
elseif tonumber(user_id) == tonumber(SUDO) then
var = 'المطور الاساسي'  
elseif tonumber(user_id) == tonumber(JoKeR) then  
var = 'البوت🤖'
elseif redis:sismember(JoKeR..'Sudo:User', user_id) then
var = redis:get(JoKeR.."Sudo:Rd"..msg.chat_id_) or 'المطور'  
elseif redis:sismember(JoKeR..'Basic:Constructor'..chat_id, user_id) then
var = redis:get(JoKeR.."BasicConstructor:Rd"..msg.chat_id_) or 'المنشئ اساسي'
elseif redis:sismember(JoKeR..'Constructor'..chat_id, user_id) then
var = redis:get(JoKeR.."Constructor:Rd"..msg.chat_id_) or 'المنشئ'  
elseif redis:sismember(JoKeR..'Owners'..chat_id, user_id) then
var = redis:get(JoKeR.."Owners:Rd"..msg.chat_id_) or 'المدير'  
elseif redis:sismember(JoKeR..'Mod:User'..chat_id, user_id) then
var = redis:get(JoKeR.."Mod:Rd"..msg.chat_id_) or 'الادمن'  
elseif redis:sismember(JoKeR..'Mamez:User', user_id) then
var = redis:get(JoKeR.."Mamez:Rd"..msg.chat_id_) or 'مميز عام'  
elseif redis:sismember(JoKeR..'Vips:User'..chat_id, user_id) then  
var = redis:get(JoKeR.."Vips:Rd"..msg.chat_id_) or 'المميز'  
else  
var = redis:get(JoKeR.."Memp:Rd"..msg.chat_id_) or 'العضو'
end  
return var
end
--------------------------------------------------------------------------------------------------------------
function ChekAdd(chat_id)
if redis:sismember(JoKeR.."Chek:Groups",chat_id) then
var = true
else 
var = false
end
return var
end
--------------------------------------------------------------------------------------------------------------
function Muted_User(Chat_id,User_id) 
if redis:sismember(JoKeR..'Muted:User'..Chat_id,User_id) then
Var = true
else
Var = false
end
return Var
end
--------------------------------------------------------------------------------------------------------------
function Ban_User(Chat_id,User_id) 
if redis:sismember(JoKeR..'Ban:User'..Chat_id,User_id) then
Var = true
else
Var = false
end
return Var
end
--------------------------------------------------------------------------------------------------------------
function GBan_User(User_id) 
if redis:sismember(JoKeR..'GBan:User',User_id) then
Var = true
else
Var = false
end
return Var
end
--------------------------------------------------------------------------------------------------------------
function Gmute_User(User_id) 
if redis:sismember(JoKeR..'Gmute:User',User_id) then
Var = true
else
Var = false
end
return Var
end
--------------------------------------------------------------------------------------------------------------
function AddChannel(User)
local url , res = https.request('https://hso.mohammed-api.com/API/ApI_JoKeR.php/?id='..User..'')
data = JSON.decode(url)
if data.Ch_Member.JoKerTeam ~= true then
Var = false
else
Var = true
end
return Var
end
--------------------------------------------------------------------------------------------------------------
function sleep(n) os.execute("sleep " .. tonumber(n)) end  
--------------------------------------------------------------------------------------------------------------

function dl_cb(a,d)
end
function getChatId(id)
local chat = {}
local id = tostring(id)
if id:match('^-100') then
local channel_id = id:gsub('-100', '')
chat = {ID = channel_id, type = 'channel'}
else
local group_id = id:gsub('-', '')
chat = {ID = group_id, type = 'group'}
end
return chat
end
function chat_kick(chat,user)
tdcli_function ({
ID = "ChangeChatMemberStatus",
chat_id_ = chat,
user_id_ = user,
status_ = {ID = "ChatMemberStatusKicked"},},function(arg,data) end,nil)
end
function send(chat_id, reply_to_message_id, text)
local TextParseMode = {ID = "TextParseModeMarkdown"}
tdcli_function ({ID = "SendMessage",chat_id_ = chat_id,reply_to_message_id_ = reply_to_message_id,disable_notification_ = 1,from_background_ = 1,reply_markup_ = nil,input_message_content_ = {ID = "InputMessageText",text_ = text,disable_web_page_preview_ = 1,clear_draft_ = 0,entities_ = {},parse_mode_ = TextParseMode,},}, dl_cb, nil)
end
function DeleteMessage(chat,id)
tdcli_function ({
ID="DeleteMessages",
chat_id_=chat,
message_ids_=id
},function(arg,data) 
end,nil)
end
function PinMessage(chat, id)
tdcli_function ({
ID = "PinChannelMessage",
channel_id_ = getChatId(chat).ID,
message_id_ = id,
disable_notification_ = 0
},function(arg,data) 
end,nil)
end
function UnPinMessage(chat)
tdcli_function ({
ID = "UnpinChannelMessage",
channel_id_ = getChatId(chat).ID
},function(arg,data) 
end,nil)
end
local function GetChat(chat_id) 
tdcli_function ({
ID = "GetChat",
chat_id_ = chat_id
},cb, nil) 
end 
function Group_Kick(chat,user)
pcall(tdcli_function ({
ID = "ChangeChatMemberStatus",
chat_id_ = chat,
user_id_ = user,
status_ = {ID = "ChatMemberStatusKicked"},},function(arg,data) end,nil))
end
function getInputFile(file) 
if file:match('/') then infile = {ID = "InputFileLocal", path_ = file} elseif file:match('^%d+$') then infile = {ID = "InputFileId", id_ = file} else infile = {ID = "InputFilePersistentId", persistent_id_ = file} end return infile 
end
function ked(User_id,Chat_id)
https.request("https://api.telegram.org/bot"..token.."/restrictChatMember?chat_id="..Chat_id.."&user_id="..User_id)
end
function s_api(web) 
local info, res = https.request(web) local req = json:decode(info) if res ~= 200 then return false end if not req.ok then return false end return req 
end 
local function sendText(chat_id, text, reply_to_message_id, markdown) 
send_api = "https://api.telegram.org/bot"..token local url = send_api..'/sendMessage?chat_id=' .. chat_id .. '&text=' .. URL.escape(text) if reply_to_message_id ~= 0 then url = url .. '&reply_to_message_id=' .. reply_to_message_id  end if markdown == 'md' or markdown == 'markdown' then url = url..'&parse_mode=Markdown' elseif markdown == 'html' then url = url..'&parse_mode=HTML' end return s_api(url)  
end
function send_inline_key(chat_id,text,keyboard,inline,reply_id) 
local response = {} response.keyboard = keyboard response.inline_keyboard = inline response.resize_keyboard = true response.one_time_keyboard = false response.selective = false  local send_api = "https://api.telegram.org/bot"..token.."/sendMessage?chat_id="..chat_id.."&text="..URL.escape(text).."&parse_mode=Markdown&disable_web_page_preview=true&reply_markup="..URL.escape(JSON.encode(response)) if reply_id then send_api = send_api.."&reply_to_message_id="..reply_id end return s_api(send_api) 
end
local function GetInputFile(file)  
local file = file or ""   if file:match('/') then  infile = {ID= "InputFileLocal", path_  = file}  elseif file:match('^%d+$') then  infile = {ID= "InputFileId", id_ = file}  else  infile = {ID= "InputFilePersistentId", persistent_id_ = file}  end return infile 
end
local function sendRequest(request_id, chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, callback, extra) 
tdcli_function ({  ID = request_id,    chat_id_ = chat_id,    reply_to_message_id_ = reply_to_message_id,    disable_notification_ = disable_notification,    from_background_ = from_background,    reply_markup_ = reply_markup,    input_message_content_ = input_message_content,}, callback or dl_cb, extra) 
end
local function sendAudio(chat_id,reply_id,audio,title,caption)  
tdcli_function({ID="SendMessage",  chat_id_ = chat_id,  reply_to_message_id_ = reply_id,  disable_notification_ = 0,  from_background_ = 1,  reply_markup_ = nil,  input_message_content_ = {  ID="InputMessageAudio",  audio_ = GetInputFile(audio),  duration_ = '',  title_ = title or '',  performer_ = '',  caption_ = caption or ''  }},dl_cb,nil)
end  
local function sendVideo(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, video, duration, width, height, caption, cb, cmd)    
local input_message_content = { ID = "InputMessageVideo",      video_ = getInputFile(video),      added_sticker_file_ids_ = {},      duration_ = duration or 0,      width_ = width or 0,      height_ = height or 0,      caption_ = caption    }    sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)  
end
function sendDocument(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, document, caption, dl_cb, cmd) 
tdcli_function ({ID = "SendMessage",chat_id_ = chat_id,reply_to_message_id_ = reply_to_message_id,disable_notification_ = disable_notification,from_background_ = from_background,reply_markup_ = reply_markup,input_message_content_ = {ID = "InputMessageDocument",document_ = getInputFile(document),caption_ = caption},}, dl_cb, cmd) 
end
local function sendVoice(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, voice, duration, waveform, caption, cb, cmd)  
local input_message_content = {   ID = "InputMessageVoice",   voice_ = getInputFile(voice),  duration_ = duration or 0,   waveform_ = waveform,    caption_ = caption  }  sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd) 
end
local function sendSticker(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, sticker, cb, cmd)  
local input_message_content = {    ID = "InputMessageSticker",   sticker_ = getInputFile(sticker),    width_ = 0,    height_ = 0  } sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd) 
end
local function sendPhoto(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, photo,caption)   
tdcli_function ({ ID = "SendMessage",   chat_id_ = chat_id,   reply_to_message_id_ = reply_to_message_id,   disable_notification_ = disable_notification,   from_background_ = from_background,   reply_markup_ = reply_markup,   input_message_content_ = {   ID = "InputMessagePhoto",   photo_ = getInputFile(photo),   added_sticker_file_ids_ = {},   width_ = 0,   height_ = 0,   caption_ = caption  },   }, dl_cb, nil)  
end
function Total_Msg(msgs)  
local JoKeR_Msg = ''  
if msgs < 100 then 
JoKeR_Msg = 'غير متفاعل ' 
elseif msgs < 200 then 
JoKeR_Msg = 'بده يتحسن ' 
elseif msgs < 400 then 
JoKeR_Msg = 'شبه متفاعل ' 
elseif msgs < 700 then 
JoKeR_Msg = 'متفاعل ' 
elseif msgs < 1200 then 
JoKeR_Msg = 'متفاعل قوي ' 
elseif msgs < 2000 then 
JoKeR_Msg = 'متفاعل جدا ' 
elseif msgs < 3500 then 
JoKeR_Msg = 'اقوى تفاعل '  
elseif msgs < 4000 then 
JoKeR_Msg = 'متفاعل نار ' 
elseif msgs < 4500 then 
JoKeR_Msg = 'قمة التفاعل ' 
elseif msgs < 5500 then 
JoKeR_Msg = 'اسد التفاعل ' 
elseif msgs < 7000 then 
JoKeR_Msg = 'ملك التفاعل' 
elseif msgs < 9500 then 
JoKeR_Msg = 'احلا تفاعل ' 
elseif msgs < 10000000000 then 
JoKeR_Msg = 'رب التفاعل '  
end 
return JoKeR_Msg 
end
function GetFile_Bot(msg)
local list = redis:smembers(JoKeR..'Chek:Groups') 
local t = '{"JoKeR": '..JoKeR..',"GP_BOT":{'  
for k,v in pairs(list) do   
NAME = 'JoKeR Chat'
link = redis:get(JoKeR.."Private:Group:Link"..msg.chat_id_) or ''
ASAS = redis:smembers(JoKeR..'Basic:Constructor'..v)
MNSH = redis:smembers(JoKeR..'Constructor'..v)
MDER = redis:smembers(JoKeR..'Owners'..v)
MOD = redis:smembers(JoKeR..'Mod:User'..v)
if k == 1 then
t = t..'"'..v..'":{"JoKeR":"'..NAME..'",'
else
t = t..',"'..v..'":{"JoKeR":"'..NAME..'",'
end
if #ASAS ~= 0 then 
t = t..'"ASAS":['
for k,v in pairs(ASAS) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
if #MOD ~= 0 then
t = t..'"MOD":['
for k,v in pairs(MOD) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
if #MDER ~= 0 then
t = t..'"MDER":['
for k,v in pairs(MDER) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
if #MNSH ~= 0 then
t = t..'"MNSH":['
for k,v in pairs(MNSH) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
t = t..'"linkgroup":"'..link..'"}' or ''
end
t = t..'}}'
local File = io.open('./JoKeR_lib/'..JoKeR..'.json', "w")
File:write(t)
File:close()
sendDocument(msg.chat_id_, msg.id_,0, 1, nil, './JoKeR_lib/'..JoKeR..'.json', '📋┆ عدد مجموعات التي في البوت { '..#list..'}')
end
function download_to_file(url, file_path) 
local respbody = {} 
local options = { url = url, sink = ltn12.sink.table(respbody), redirect = true } 
local response = nil 
options.redirect = false 
response = {https.request(options)} 
local code = response[2] 
local headers = response[3] 
local status = response[4] 
if code ~= 200 then return false, code 
end 
file = io.open(file_path, "w+") 
file:write(table.concat(respbody)) 
file:close() 
return file_path, code 
end 
function AddFile_Bot(msg,chat,ID_FILE,File_Name)
if File_Name:match('.json') then
if tonumber(File_Name:match('(%d+)')) ~= tonumber(JoKeR) then 
send(chat,msg.id_,"܁༯┆هلو عمري 💞 ܰ\n܁༯ ┆ملف نسخه ليس لهاذا البوت 💞 ܰ")   
return false 
end      
local File = json:decode(https.request('https://api.telegram.org/bot'.. token..'/getfile?file_id='..ID_FILE) ) 
download_to_file('https://api.telegram.org/file/bot'..token..'/'..File.result.file_path, ''..File_Name) 
send(chat,msg.id_,"܁༯┆جاري رفع الملف الان . . .")
else
send(chat,msg.id_,"܁༯┆ عذرا الملف ليس بصيغة {JSON} يرجى رفع الملف الصحيح . .! ")   
end      
local info_file = io.open('./JoKeR_lib/'..JoKeR..'.json', "r"):read('*a')
local groups = JSON.decode(info_file)
for idg,v in pairs(groups.GP_BOT) do
redis:sadd(JoKeR..'Chek:Groups',idg)  
redis:set(JoKeR..'lock:tagservrbot'..idg,true)   
list ={"lock:Bot:kick","lock:user:name","lock:hashtak","lock:Cmd","lock:Link","lock:forward","lock:Keyboard","lock:geam","lock:Photo","lock:Animation","lock:Video","lock:Audio","lock:vico","lock:Sticker","lock:Document","lock:Unsupported","lock:Markdaun","lock:Contact","lock:Spam"}
for i,lock in pairs(list) do 
redis:set(JoKeR..lock..idg,'del')    
end
if v.MNSH then
for k,idmsh in pairs(v.MNSH) do
redis:sadd(JoKeR..'Constructor'..idg,idmsh)
end
end
if v.MDER then
for k,idmder in pairs(v.MDER) do
redis:sadd(JoKeR..'Owners'..idg,idmder)  
end
end
if v.MOD then
for k,idmod in pairs(v.MOD) do
redis:sadd(JoKeR..'Mod:User'..idg,idmod)  
end
end
if v.ASAS then
for k,idASAS in pairs(v.ASAS) do
redis:sadd(JoKeR..'Basic:Constructor'..idg,idASAS)  
end
end
end
send(chat,msg.id_,"\n܁༯┆ههلو عمري  💞 ܰ\n܁༯┆تم رفع الملف وتفعيل المجموعات  \n܁༯┆ورفع ◞المنشئين الاساسيين ܊ المنشئين ܊ المدراء ܊ الادمنية ◜ بنجاح")   
end
local function trigger_anti_spam(msg,type)
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data)
local Name = '['..utf8.sub(data.first_name_,0,40)..'](tg://user?id='..data.id_..')'
if type == 'kick' then 
Text = '\n܁༯┆العـضو '..Name..' 💞 ܰ\n܁༯┆قام بالتكرار هنا وتم ◃ طرده 💞 ܰ'  
sendText(msg.chat_id_,Text,0,'md')
chat_kick(msg.chat_id_,msg.sender_user_id_) 
my_ide = msg.sender_user_id_
msgm = msg.id_
local num = 100
for i=1,tonumber(num) do
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = {[0] = msgm}},function(arg,data) 
if data.messages_[0] ~= false then
if tonumber(my_ide) == (data.messages_[0].sender_user_id_) then
DeleteMessage(msg.chat_id_, {[0] = data.messages_[0].id_})
end;end;end, nil)
msgm = msgm - 1048576
end
return false  
end 
if type == 'del' then 
DeleteMessage(msg.chat_id_,{[0] = msg.id_})    
my_ide = msg.sender_user_id_
msgm = msg.id_
local num = 100
for i=1,tonumber(num) do
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = {[0] = msgm}},function(arg,data) 
if data.messages_[0] ~= false then
if tonumber(my_ide) == (data.messages_[0].sender_user_id_) then
DeleteMessage(msg.chat_id_, {[0] = data.messages_[0].id_})
end;end;end, nil)
msgm = msgm - 1048576
end
end 
if type == 'keed' then
https.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..msg.sender_user_id_.."") 
redis:sadd(JoKeR..'Muted:User'..msg.chat_id_,msg.sender_user_id_) 
msgm = msg.id_
my_ide = msg.sender_user_id_
local num = 100
for i=1,tonumber(num) do
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = {[0] = msgm}},function(arg,data) 
if data.messages_[0] ~= false then
if tonumber(my_ide) == (data.messages_[0].sender_user_id_) then
DeleteMessage(msg.chat_id_, {[0] = data.messages_[0].id_})
end;end;end, nil)
msgm = msgm - 1048576
end
Text = '\n܁༯┆العـضو '..Name..' 💞 ܰ\n܁༯┆قام بالتكرار هنا وتم ◃ تقييده 💞 ܰ'  
sendText(msg.chat_id_,Text,0,'md')
return false  
end  
if type == 'mute' then
Text = '\n܁༯┆العـضو '..Name..' 💞 ܰ\n܁༯┆قام بالتكرار هنا وتم ◃ كتمه 💞 ܰ'  
sendText(msg.chat_id_,Text,0,'md')
redis:sadd(JoKeR..'Muted:User'..msg.chat_id_,msg.sender_user_id_) 
msgm = msg.id_
my_ide = msg.sender_user_id_
local num = 100
for i=1,tonumber(num) do
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = {[0] = msgm}},function(arg,data) 
if data.messages_[0] ~= false then
if tonumber(my_ide) == (data.messages_[0].sender_user_id_) then
DeleteMessage(msg.chat_id_, {[0] = data.messages_[0].id_})
end;end;end, nil)
msgm = msgm - 1048576
end
return false  
end
end,nil)   
end

function FilesJoKeRTeam(msg)
for v in io.popen('ls File_JoKeR'):lines() do
if v:match(".lua$") then
Text_FileBot = dofile("File_JoKeR/"..v)
if Text_FileBot.JoKeRa and msg then
Text_FileBot = Text_FileBot.JoKeRa(msg)
end
end
end
send(msg.chat_id_, msg.id_,Text_FileBot)  
end
--------------------------------------------------------------------------------------------------------------
function SourceJoKeR(msg,data)
if msg then
local text = msg.content_.text_
--------------------------------------------------------------------------------------------------------------
if msg.chat_id_ then
local id = tostring(msg.chat_id_)
if id:match("-100(%d+)") then
redis:incr(JoKeR..'Msg_User'..msg.chat_id_..':'..msg.sender_user_id_) 
Chat_Type = 'GroupBot'
elseif id:match("^(%d+)") then
redis:sadd(JoKeR..'User_Bot',msg.sender_user_id_) 
Chat_Type = 'UserBot' 
else
Chat_Type = 'GroupBot' 
end
end
if redis:get(JoKeR.."Bc:Grops:Pin" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == "الغاء" or text == "• الغاء × ." then   
send(msg.chat_id_, msg.id_,"܁༯┆تم الغاء الاذاعه 💞 ܰ") 
redis:del(JoKeR.."Bc:Grops:Pin" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end 
local list = redis:smembers(JoKeR.."Chek:Groups") 
if msg.content_.text_ then
for k,v in pairs(list) do 
send(v, 0,"["..msg.content_.text_.."]")  
redis:set(JoKeR..'Msg:Pin:Chat'..v,msg.content_.text_) 
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(list) do 
sendPhoto(v, 0, photo,(msg.content_.caption_ or ""))
redis:set(JoKeR..'Msg:Pin:Chat'..v,photo) 
end 
elseif msg.content_.animation_ then
for k,v in pairs(list) do 
sendDocument(v, 0, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or "")) 
redis:set(JoKeR..'Msg:Pin:Chat'..v,msg.content_.animation_.animation_.persistent_id_)
end 
elseif msg.content_.sticker_ then
for k,v in pairs(list) do 
sendSticker(v, 0, msg.content_.sticker_.sticker_.persistent_id_)   
redis:set(JoKeR..'Msg:Pin:Chat'..v,msg.content_.sticker_.sticker_.persistent_id_) 
end 
end
send(msg.chat_id_, msg.id_,"܁༯┆تم الاذاعة الى ◃ ˼ "..#list.." ˹  مجموعات في البوت 💞 ܰ")     
redis:del(JoKeR.."Bc:Grops:Pin" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end
--------------------------------------------------------------------------------------------------------------
if Chat_Type == 'UserBot' then
if text == '/start' then  
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
if Sudo_JoKeR(msg) then
local bl = '゠اهلا بيك عمري 💞⸼ .\n゠انت المطور الاساسي للبوت 𖧧.\n゠تستطيع التحكم باوامر البوت 𖧧.\n゠من خلال الكيبورد الخاص بك 𖧧.\n゠قناة السورس  ◝ [@JoKeR_aHs] ◟ .'
local keyboard = {
	{'• وضع اسم الى البوت 𖠹 .'},
{'• تعطيل التواصل  × .','• تفعيل التواصل  𖡩 .'},
{'• الاحصائيات 𖡬 .'},
{'• المشتركيين 𖡹 .','• المجموعات 𖡹 .'},
{'• المطورين 𖤂 .','• قائمة العام 𖤹 .'},
{'• وضع كليشة 𖡲 start  .','• حذف كليشة 𖡲 start  .'},
{'• اذاعة بالتثبيت 𖡮  .'},
{'• الاشتراك الاجباري 𖤫 . '},
{'• وضع قناة الاشتراك 𖤫  .','• تغير الاشتراك 𖤩  .'},
{'• تعطيل الاشتراك 𖤤  .','• تفعيل الاشتراك 𖤤  .'},
{'• اذاعة في الخاص 𖡮  .','• اذاعة 𖡮  .'},
{'• اذاعة بالتوجية في الخاص 𖣮  .','• اذاعة بالتوجية  𖣮  .'},
{'• تنظيف المشتركيين 𖤸 .','• تنظيف الكروبات 𖤸 .'},
{'• تفعيل البوت الخدمي 𖤴 .','• تعطيل البوت الخدمي 𖤴 .'},
{'• جلب النسخة الاحتياطية 𖥠 .'},
{'• معلومات السيرفر 𖥠 .'}, 
{'• تحديث السورس ᜱ .'}, 
{'• الغاء × .'}
}
send_inline_key(msg.chat_id_,bl,keyboard)
else
if not redis:get(JoKeR..'Start:Time'..msg.sender_user_id_) then
local start = redis:get(JoKeR.."Start:Bot")  
if start then 
SourceJoKeRr = start
else
SourceJoKeRr = ' ゠ههلو عمري 💞⸼\n゠لتفعيل البوت في مجموعتك 𖧧.\n゠اضف البوت مشرف في مجموعتك 𖧧.\n゠ثم ارسل ◝ تفعيل ◟ 𖧧.'
end 
send(msg.chat_id_, msg.id_, SourceJoKeRr) 
end
end
redis:setex(JoKeR..'Start:Time'..msg.sender_user_id_,300,true)
return false
end
if not Sudo_JoKeR(msg) and not redis:sismember(JoKeR..'Ban:User_Bot',msg.sender_user_id_) and not redis:get(JoKeR..'Tuasl:Bots') then
send(msg.sender_user_id_, msg.id_,'܁༯┆هلو عمري 💞 ܰ\n܁༯┆سيتم الرد عليك [قريباً . .](https://t.me/joinchat/AAAAAEvr1yqOypm-uHojPA)')
tdcli_function ({ID = "ForwardMessages", chat_id_ = SUDO,    from_chat_id_ = msg.sender_user_id_,    message_ids_ = {[0] = msg.id_},    disable_notification_ = 1,    from_background_ = 1 },function(arg,data) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,ta) 
vardump(data)
if data and data.messages_[0].content_.sticker_ then
local Name = '['..string.sub(ta.first_name_,0, 40)..'](tg://user?id='..ta.id_..')'
local Text = '📥┆ تم ارسال الملصق من ↓\n - '..Name
sendText(SUDO,Text,0,'md')
end 
end,nil) 
end,nil)
end
if Sudo_JoKeR(msg) and msg.reply_to_message_id_ ~= 0  then    
tdcli_function({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)},function(extra, result, success) 
if result.forward_info_.sender_user_id_ then     
id_user = result.forward_info_.sender_user_id_    
end     
tdcli_function ({ID = "GetUser",user_id_ = id_user},function(arg,data) 
if text == 'حظر' then
local Name = '['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..id_user..')'
local Text = '📌┆ المستخدم ▸ '..Name..'\n܁༯┆تم حظره من التواصل '
sendText(SUDO,Text,msg.id_/2097152/0.5,'md')
redis:sadd(JoKeR..'Ban:User_Bot',data.id_)  
return false  
end 
if text =='الغاء الحظر' then
local Name = '['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..id_user..')'
local Text = '📌┆ المستخدم ▸ '..Name..'\n܁༯┆ تم حظره من التواصل '
sendText(SUDO,Text,msg.id_/2097152/0.5,'md')
redis:srem(JoKeR..'Ban:User_Bot',data.id_)  
return false  
end 

tdcli_function({ID='GetChat',chat_id_ = id_user},function(arg,dataq)
tdcli_function ({ ID = "SendChatAction",chat_id_ = id_user, action_ = {  ID = "SendMessageTypingAction", progress_ = 100} },function(arg,ta) 
if ta.code_ == 400 or ta.code_ == 5 then
local JoKeR_Msg = '\n⚠┆ فشل ارسال رسالتك لان العضو قام بحظر البوت'
send(msg.chat_id_, msg.id_,JoKeR_Msg) 
return false  
end 
if text then    
send(id_user,msg.id_,text)    
local Name = '['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..id_user..')'
local Text = '📌┆ المستخدم ▸ '..Name..'\n🔖┆تم ارسال الرساله اليه'
sendText(SUDO,Text,msg.id_/2097152/0.5,'md')
return false
end    
if msg.content_.ID == 'MessageSticker' then    
sendSticker(id_user, msg.id_, 0, 1, nil, msg.content_.sticker_.sticker_.persistent_id_)   
local Name = '['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..id_user..')'
local Text = '📌┆ المستخدم ▸ '..Name..'\n🔖┆ تم ارسال الرساله اليه'
sendText(SUDO,Text,msg.id_/2097152/0.5,'md')
return false
end      
if msg.content_.ID == 'MessagePhoto' then    
sendPhoto(id_user, msg.id_, 0, 1, nil,msg.content_.photo_.sizes_[0].photo_.persistent_id_,(msg.content_.caption_ or ''))    
local Name = '['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..id_user..')'
local Text = '📌┆ المستخدم ▸ '..Name..'\n🔖┆ تم ارسال الرساله اليه'
sendText(SUDO,Text,msg.id_/2097152/0.5,'md')
return false
end     
if msg.content_.ID == 'MessageAnimation' then    
sendDocument(id_user, msg.id_, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_)    
local Name = '['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..id_user..')'
local Text = '📌┆ المستخدم ▸ '..Name..'\n🔖┆ تم ارسال الرساله اليه'
sendText(SUDO,Text,msg.id_/2097152/0.5,'md')
return false
end     
if msg.content_.ID == 'MessageVoice' then    
sendVoice(id_user, msg.id_, 0, 1, nil, msg.content_.voice_.voice_.persistent_id_)    
local Name = '['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..id_user..')'
local Text = '📌┆ المستخدم ▸ '..Name..'\n🔖┆ تم ارسال الرساله اليه'
sendText(SUDO,Text,msg.id_/2097152/0.5,'md')
return false
end     
end,nil)
end,nil)
end,nil)
end,nil)
end 
if text == '• تعطيل التواصل  × .' and Sudo_JoKeR(msg) then  
if not redis:get(JoKeR..'Tuasl:Bots') then
redis:set(JoKeR..'Tuasl:Bots',true) 
Text = '\n٭ 𖤹┆تم تعطيل التواصل ☓◜' 
else
Text = '\n٭ 𖤹┆تم تعطيل التواصل ☓◜'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == '• تفعيل البوت الخدمي 𖤴 .' and Sudo_JoKeR(msg) then  
if redis:get(JoKeR..'Free:Bots') then
redis:del(JoKeR..'Free:Bots') 
Text = '\n܁༯┆تم تفعيل البوت لخدمي 💞 ܰ ' 
else
Text = '\n܁༯┆بلتأكيد تم تفعيل البوت الخدمي 💞 ܰ  '
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == '• تعطيل البوت الخدمي 𖤴 .' and Sudo_JoKeR(msg) then  
if not redis:get(JoKeR..'Free:Bots') then
redis:set(JoKeR..'Free:Bots',true) 
Text = '\n܁༯┆تم تعطيل البوت الخدمي 💞 ܰ ' 
else
Text = '\n܁༯┆بلتأكيد تم تعطيل البوت الخدمي 💞 ܰ '
end
send(msg.chat_id_, msg.id_,Text) 
end
if text and redis:get(JoKeR..'Start:Bots') then
if text == 'الغاء' or text == '• الغاء × .' then   
send(msg.chat_id_, msg.id_,'܁༯┆تم الغاء حفظ كليشه ستارت 💞 ܰ ')
redis:del(JoKeR..'Start:Bots') 
return false
end
redis:set(JoKeR.."Start:Bot",text)  
send(msg.chat_id_, msg.id_,'܁༯┆تم حفظ كليشةه حفظ ستارت 💞 ܰ ') 
redis:del(JoKeR..'Start:Bots') 
return false
end
if text == '• وضع كليشة 𖡲 start  .' and Sudo_JoKeR(msg) then 
redis:set(JoKeR..'Start:Bots',true) 
send(msg.chat_id_, msg.id_,'܁༯┆ارسل الكليشةه الان 💞 ܰ ') 
return false
end
if text == '• حذف كليشة 𖡲 start  .' and Sudo_JoKeR(msg) then 
redis:del(JoKeR..'Start:Bot') 
send(msg.chat_id_, msg.id_,'܁༯┆تم حذف كليشةه ستارت 💞 ܰ ') 
end

if text == '• معلومات السيرفر 𖥠 .' and Sudo_JoKeR(msg) then 
send(msg.chat_id_, msg.id_, io.popen([[
linux_version=`lsb_release -ds`
memUsedPrc=`free -m | awk 'NR==2{printf "%sMB/%sMB {%.2f%}\n", $3,$2,$3*100/$2 }'`
HardDisk=`df -lh | awk '{if ($6 == "/") { print $3"/"$2" ~ {"$5"}" }}'`
CPUPer=`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`
uptime=`uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes."}'`
echo '܁༯┆مدة تشغيل السيرفر ▾ .\n*▸  '"$linux_version"'*' 
echo '*܀⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤܀*\n܁༯┆الذاكره العشوائية ▾ .\n*▸ '"$memUsedPrc"'*'
echo '*܀⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤܀*\n܁༯┆وحدة التخزين ▾ .\n*▸ '"$HardDisk"'*'
echo '*܀⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤܀*\n܁༯┆المعالج ▾ .\n*▸ '"`grep -c processor /proc/cpuinfo`""Core ▸ $CPUPer% "'*'
echo '*܀⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤܀*\n܁༯┆الدخول ▾ . \n*▸ '`whoami`'*'
echo '*܀⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤܀*\n܁༯┆مدة تشغيل السيرفر ▾ .\n*▸ '"$uptime"'*'
]]):read('*all'))  
end

if text == '• تحديث السورس ᜱ .' and Sudo_JoKeR(msg) then
os.execute('rm -rf JoKeR.lua')
os.execute('wget https://raw.githubusercontent.com/BoykaxTeam/JoKeR/master/JoKeR.lua')
os.execute('cd File_JoKeR && wget https://raw.githubusercontent.com/BoykaxTeam/JoKeR/master/File_JoKeR/Orders.lua')
sleep(0.5) 
send(msg.chat_id_, msg.id_,'✥┆ تم تحديث السورس . 𖦲 ◜') 
dofile('JoKeR.lua')  
end
if text == "• وضع اسم الى البوت 𖠹 ." and Sudo_JoKeR(msg) then  
redis:setex(JoKeR..'Set:Name:Bot'..msg.sender_user_id_,300,true) 
send(msg.chat_id_, msg.id_,"܁༯┆ارسل الاسم الان 💞 ܰ ")  
return false
end
if text == "• تنظيف الكروبات 𖤸 ." and Sudo_JoKeR(msg) then 
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
local group = redis:smembers(JoKeR..'Chek:Groups') 
local w = 0
local q = 0
for i = 1, #group do
tdcli_function({ID='GetChat',chat_id_ = group[i]
},function(arg,data)
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusMember" then
redis:srem(JoKeR..'Chek:Groups',group[i])  
tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_=group[i],user_id_=JoKeR,status_={ID = "ChatMemberStatusLeft"},},function(e,g) end, nil) 
w = w + 1
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusLeft" then
redis:srem(JoKeR..'Chek:Groups',group[i])  
q = q + 1
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusKicked" then
redis:srem(JoKeR..'Chek:Groups',group[i])  
q = q + 1
end
if data and data.code_ and data.code_ == 400 then
redis:srem(JoKeR..'Chek:Groups',group[i])  
w = w + 1
end
if #group == i then 
if (w + q) == 0 then
send(msg.chat_id_, msg.id_,'\n܁༯┆لايوجد مجموعات وهميه في البوت💞 ܰ')   
else
local JoKeR = (w + q)
local sendok = #group - JoKeR
if q == 0 then
JoKeR = ''
else
JoKeR = '\n܁༯┆ تم ازالة ['..q..'](https://t.me/joinchat/AAAAAEvr1yqOypm-uHojPA) مجموعات من البوت 💞 ܰ'
end
if w == 0 then
JoKeRh = ''
else
JoKeRh = '\n܁༯┆ تم ازالة ['..w..'](https://t.me/joinchat/AAAAAEvr1yqOypm-uHojPA) مجموعات من البوت 💞 ܰ'
end
send(msg.chat_id_, msg.id_,'܁༯┆تم تنظيف المجموعات💞 ܰ')   
end
end
end,nil)
end
return false
end
if text == '• الاحصائيات 𖡬 .' and Sudo_JoKeR(msg) then 
local Groups = redis:scard(JoKeR..'Chek:Groups')  
local Users = redis:scard(JoKeR..'User_Bot')  
Text = '┐ عدد المجموعات ◃ ◞*'..Groups..'*◜ \n✛ ٭                  ٭ \n┘ عدد المشتركيين ◃ ◞*'..Users..'*◜ .'
send(msg.chat_id_, msg.id_,Text) 
return false
end
if text == '• المشتركيين 𖡹 .' and Sudo_JoKeR(msg) then 
local Groups = redis:scard(JoKeR..'Chek:Groups')  
local Users = redis:scard(JoKeR..'User_Bot')  
Text = '\n٭ 𖡹 ┆عدد المشتركيين ◃ ◞ *'..Users..'* ◜'
send(msg.chat_id_, msg.id_,Text) 
return false
end
if text == '• المجموعات 𖡹 .' and Sudo_JoKeR(msg) then 
local Groups = redis:scard(JoKeR..'Chek:Groups')  
local Users = redis:scard(JoKeR..'User_Bot')  
Text = '\n٭ 𖡹 ┆عدد المجموعات ◃ ◞ *'..Groups..'* ◜'
send(msg.chat_id_, msg.id_,Text) 
return false
end
if text == ("• المطورين 𖤂 .") and Sudo_JoKeR(msg) then
local list = redis:smembers(JoKeR..'Sudo:User')
t = "\n܁༯┆قائمة المطورين 💞💞 .\n܀⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤܀\n"
for k,v in pairs(list) do
local username = redis:get(JoKeR.."user:Name" .. v)
if username then
t = t.."𖠵 "..k.." ◜*@"..username.."*◞  💞🦄 .\n"
else
end
end
if #list == 0 then
t = "٭ 𖤹┆لا يوجد مطوريين ☓◟"
end
send(msg.chat_id_, msg.id_, t)
end
if text == ("• قائمة العام 𖤹 .") and Sudo_JoKeR(msg) then
local list = redis:smembers(JoKeR..'GBan:User')
t = "\n܁༯┆قائمة العام 💞💞 .\n܀⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤܀\n"
for k,v in pairs(list) do
local username = redis:get(JoKeR.."user:Name" .. v)
if username then
t = t.."𖠵 "..k.." ◜*@"..username.."*◞  💞🦄 .\n"
else
end
end
if #list == 0 then
t = "٭ 𖤹┆لا يوجد احد محظور عام ☓◟"
end
send(msg.chat_id_, msg.id_, t)
return false
end
if text=="• اذاعة في الخاص 𖡮  ." and msg.reply_to_message_id_ == 0 and Sudo_JoKeR(msg) then 
redis:setex(JoKeR.."Send:Bc:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_,"܁༯┆هلو عمري 💞 ܰ\n܁༯┆ارسل لي سواء كان . .\n܁༯┆ملصق ◃ متحركة ◃ فيد ◃ صوره ◃ رسالة ܊\n܁༯┆للخروج ارسل ܊ الغاء ܊") 
return false
end 
if text=="• اذاعة 𖡮  ." and msg.reply_to_message_id_ == 0 and Sudo_JoKeR(msg) then 
redis:setex(JoKeR.."Send:Bc:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_,"܁༯┆هلو عمري 💞 ܰ\n܁༯┆ارسل لي سواء كان . .\n܁༯┆ملصق ◃ متحركة ◃ فيد ◃ صوره ◃ رسالة ܊\n܁༯┆للخروج ارسل ܊ الغاء ܊") 
return false
end 
if text=="• اذاعة بالتثبيت 𖡮  ." and msg.reply_to_message_id_ == 0 and Sudo_JoKeR(msg) then 
redis:setex(JoKeR.."Bc:Grops:Pin" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_,"܁༯┆هلو عمري 💞 ܰ\n܁༯┆ارسل لي سواء كان . .\n܁༯┆ملصق ◃ متحركة ◃ فيد ◃ صوره ◃ رسالة ܊\n܁༯┆للخروج ارسل ܊ الغاء ܊") 
return false
end 
if text=="• اذاعة بالتوجية  𖣮  ." and msg.reply_to_message_id_ == 0  and Sudo_JoKeR(msg) then 
redis:setex(JoKeR.."Send:Fwd:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_,"܁༯┆ارسل لي التوجيه الان 💞 ܰ") 
return false
end 
if text=="• اذاعة بالتوجية في الخاص 𖣮  ." and msg.reply_to_message_id_ == 0  and Sudo_JoKeR(msg) then 
redis:setex(JoKeR.."Send:Fwd:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_,"܁༯┆ارسل لي التوجيه الان 💞 ܰ") 
return false
end 
if text == '• جلب النسخة الاحتياطية 𖥠 .' and Sudo_JoKeR(msg) then 
GetFile_Bot(msg)
end

if text == "• تنظيف المشتركيين 𖤸 ." and Sudo_JoKeR(msg) then 
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
local pv = redis:smembers(JoKeR.."User_Bot")
local sendok = 0
for i = 1, #pv do
tdcli_function({ID='GetChat',chat_id_ = pv[i]
},function(arg,dataq)
tdcli_function ({ ID = "SendChatAction",  
chat_id_ = pv[i], action_ = {  ID = "SendMessageTypingAction", progress_ = 100} 
},function(arg,data) 
if data.ID and data.ID == "Ok"  then
else
redis:srem(JoKeR.."User_Bot",pv[i])
sendok = sendok + 1
end
if #pv == i then 
if sendok == 0 then
send(msg.chat_id_, msg.id_,'܁༯┆لايوجد مشتركين وهميين في البوت 💞 ܰ ')   
else
local ok = #pv - sendok
send(msg.chat_id_, msg.id_,'܁༯┆عدد المشتركين  ◃ ⸼ '..#pv..' ⸼\n܁༯┆تم ازالة ◃ ⸼ '..sendok..' ⸼ من المشتركين\n܁༯┆عدد المشتركين الحقيقي ◃ ⸼ '..ok..' ⸼')   
end
end
end,nil)
end,nil)
end
return false
end

if text and text:match("^رفع مطور @(.*)$") and Sudo_JoKeR(msg) then
local username = text:match("^رفع مطور @(.*)$")
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"܁༯┆عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه  💞 ܰ")   
return false 
end      
redis:sadd(JoKeR..'Sudo:User', result.id_)
usertext = '\n܁༯┆ العضو ▸ ['..result.title_..'](t.me/'..(username or 'JoKeR_aHs')..')'
status  = '\n܁༯┆ تم ترقيته مطور في البوت'
texts = usertext..status
else
texts = '܁༯┆لايوجد حساب بهذا المعرف  💞 ܰ'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false 
end
if text and text:match("^رفع مطور (%d+)$") and Sudo_JoKeR(msg) then
local userid = text:match("^رفع مطور (%d+)$")
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
redis:sadd(JoKeR..'Sudo:User', userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n܁༯┆ العضو ▸ ['..data.first_name_..'](t.me/'..(data.username_ or 'JoKeR_aHs')..')'
status  = '\n܁༯┆ تم ترقيته مطور في البوت'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n܁༯┆ العضو ▸ '..userid..''
status  = '\n܁༯┆ تم ترقيته مطور في البوت'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false 
end
if text and text:match("^تنزيل مطور @(.*)$") and Sudo_JoKeR(msg) then
local username = text:match("^تنزيل مطور @(.*)$")
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
function start_function(extra, result, success)
if result.id_ then
redis:srem(JoKeR..'Sudo:User', result.id_)
usertext = '\n܁༯┆ العضو ▸ ['..result.title_..'](t.me/'..(username or 'JoKeR_aHs')..')'
status  = '\n܁༯┆ تم تنزيله من المطورين'
texts = usertext..status
else
texts = '܁༯┆لايوجد حساب بهذا المعرف  💞 ܰ'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end  
if text and text:match("^تنزيل مطور (%d+)$") and Sudo_JoKeR(msg) then
local userid = text:match("^تنزيل مطور (%d+)$")
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
redis:srem(JoKeR..'Sudo:User', userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n📤┆ العضو ▸ ['..data.first_name_..'](t.me/'..(data.username_ or 'JoKeR_aHs')..')'
status  = '\n܁༯┆ تم تنزيله من المطورين'
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n܁༯┆العضو ▸ '..userid..''
status  = '\n܁༯┆ تم تنزيله من المطورين'
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false 
end

end
--------------------------------------------------------------------------------------------------------------
if text and not Vips(msg) then  
local JoKeR1_Msg = redis:get(JoKeR.."JoKeR1:Add:Filter:Rp2"..text..msg.chat_id_)   
if JoKeR1_Msg then 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'܁༯┆ العضو ← ['..utf8.sub(data.first_name_,0,60)..'](T.ME/'..(data.username_ or 'JoKeR_aHs')..') \n 📬┆'..JoKeR1_Msg)
DeleteMessage(msg.chat_id_, {[0] = msg.id_})     
return false
end,nil)
end
end
if redis:get(JoKeR..'Set:Name:Bot'..msg.sender_user_id_) then 
if text == 'الغاء' or text == '• الغاء × .' then   
send(msg.chat_id_, msg.id_,"܁༯┆تم الغاء حفط اسم البوت 💞 ܰ") 
redis:del(JoKeR..'Set:Name:Bot'..msg.sender_user_id_) 
return false  
end 
redis:del(JoKeR..'Set:Name:Bot'..msg.sender_user_id_) 
redis:set(JoKeR..'Name:Bot',text) 
send(msg.chat_id_, msg.id_, "܁༯┆تم حفظ اسم البوت 💞 ܰ")  
return false
end 
if redis:get(JoKeR.."Send:Bc:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == 'الغاء' or text == '• الغاء × .' then   
send(msg.chat_id_, msg.id_,"܁༯┆تم الغاء الاذاعةه خاص 💞 ܰ") 
redis:del(JoKeR.."Send:Bc:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end 
local list = redis:smembers(JoKeR..'User_Bot') 
if msg.content_.text_ then
for k,v in pairs(list) do 
send(v, 0,'['..msg.content_.text_..']')  
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(list) do 
sendPhoto(v, 0, 0, 1, nil, photo,(msg.content_.caption_ or ''))
end 
elseif msg.content_.animation_ then
for k,v in pairs(list) do 
sendDocument(v, 0, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or ''))    
end 
elseif msg.content_.sticker_ then
for k,v in pairs(list) do 
sendSticker(v, 0, 0, 1, nil, msg.content_.sticker_.sticker_.persistent_id_)   
end 
end
send(msg.chat_id_, msg.id_,"܁༯┆تم الاذاعة الى ◃ ˼ "..#list.." ˹ مشترك في البوت 💞 ܰ ")     
redis:del(JoKeR.."Send:Bc:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
end

if redis:get(JoKeR.."Send:Bc:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == 'الغاء' or text == '• الغاء × .' then   
send(msg.chat_id_, msg.id_,"܁༯┆تم الغاء الاذاعةه 💞 ܰ") 
redis:del(JoKeR.."Send:Bc:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end 
local list = redis:smembers(JoKeR..'Chek:Groups') 
if msg.content_.text_ then
for k,v in pairs(list) do 
send(v, 0,'['..msg.content_.text_..']')  
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(list) do 
sendPhoto(v, 0, 0, 1, nil, photo,(msg.content_.caption_ or ''))
end 
elseif msg.content_.animation_ then
for k,v in pairs(list) do 
sendDocument(v, 0, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or ''))    
end 
elseif msg.content_.sticker_ then
for k,v in pairs(list) do 
sendSticker(v, 0, 0, 1, nil, msg.content_.sticker_.sticker_.persistent_id_)   
end 
end
send(msg.chat_id_, msg.id_,"܁༯┆تم الاذاعة الى ◃ ˼ "..#list.." ˹  مجموعات في البوت 💞 ܰ")     
redis:del(JoKeR.."Send:Bc:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
end

if redis:get(JoKeR.."Send:Fwd:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == 'الغاء' or text == '• الغاء × .' then   
send(msg.chat_id_, msg.id_,"܁༯┆تم الغاء الاذاعةه 💞 ܰ") 
redis:del(JoKeR.."Send:Fwd:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false  
end 
if msg.forward_info_ then 
local list = redis:smembers(JoKeR..'Chek:Groups')   
for k,v in pairs(list) do  
tdcli_function({ID="ForwardMessages",
chat_id_ = v,
from_chat_id_ = msg.chat_id_,
message_ids_ = {[0] = msg.id_},
disable_notification_ = 0,
from_background_ = 1},function(a,t) end,nil) 
end   
send(msg.chat_id_, msg.id_,"܁༯┆تم الاذاعة الى ◃ ˼ "..#list.." ˹  مجموعات في البوت 💞 ܰ")     
redis:del(JoKeR.."Send:Fwd:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
end 
end
if redis:get(JoKeR.."Send:Fwd:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == 'الغاء' or text == '• الغاء × .' then   
send(msg.chat_id_, msg.id_," ܁༯┆تم الغاء الاذاعةه 💞 ܰ") 
redis:del(JoKeR.."Send:Fwd:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false  
end 
if msg.forward_info_ then 
local list = redis:smembers(JoKeR..'User_Bot')   
for k,v in pairs(list) do  
tdcli_function({ID="ForwardMessages",
chat_id_ = v,
from_chat_id_ = msg.chat_id_,
message_ids_ = {[0] = msg.id_},
disable_notification_ = 0,
from_background_ = 1},function(a,t) end,nil) 
end   
send(msg.chat_id_, msg.id_,"܁༯┆تم الاذاعة الى ◃ ˼ "..#list.." ˹ مشترك في البوت 💞 ܰ ")     
redis:del(JoKeR.."Send:Fwd:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
end 
end
if redis:get(JoKeR.."add:ch:jm" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
send(msg.chat_id_, msg.id_, "܁༯┆تم الغاء الامر 💞 ܰ") 
redis:del(JoKeR.."add:ch:jm" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  end 
redis:del(JoKeR.."add:ch:jm" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
local username = string.match(text, "@[%a%d_]+") 
tdcli_function ({    
ID = "SearchPublicChat",    
username_ = username  
},function(arg,data) 
if data and data.message_ and data.message_ == "USERNAME_NOT_OCCUPIED" then 
send(msg.chat_id_, msg.id_, '܁༯┆المعرف لايوجد فيه قناة💞 ܰ ')
return false  end
if data and data.type_ and data.type_.ID and data.type_.ID == 'PrivateChatInfo' then
send(msg.chat_id_, msg.id_, '܁༯┆هذا معرف حساب خلي قناه 🙂💞 ܰ ') 
return false  end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.is_supergroup_ == true then
send(msg.chat_id_, msg.id_,'܁༯┆عذرا لايمكنك وضع معرف مجموعةه ارسل معرف قناه💞 ܰ ') 
return false  end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.is_supergroup_ == false then
if data and data.type_ and data.type_.channel_ and data.type_.channel_.ID and data.type_.channel_.status_.ID == 'ChatMemberStatusEditor' then
send(msg.chat_id_, msg.id_,'܁༯┆ههلو ععمري 💞\n܁༯┆البوت ادمن في القناة \n܁༯┆تم تفعيل الاشتراك بنجاح . ') 
redis:set(JoKeR..'add:ch:id',data.id_)
redis:set(JoKeR..'add:ch:username','@'..data.type_.channel_.username_)
else
send(msg.chat_id_, msg.id_,'܁༯┆البوت ليس ادمن يرجى ترقيتي واعد المحاوله 💞 ܰ ') 
end
return false  
end
end,nil)
end
if redis:get(JoKeR.."textch:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
send(msg.chat_id_, msg.id_, "📬┇ تم الغاء الامر ") 
redis:del(JoKeR.."textch:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  end 
redis:del(JoKeR.."textch:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
local texxt = string.match(text, "(.*)") 
redis:set(JoKeR..'text:ch:user',texxt)
send(msg.chat_id_, msg.id_,'܁༯┆ تم تغيير رسالة الاشتراك بنجاح 💞 ܰ ')
end

local status_welcome = redis:get(JoKeR..'Chek:Welcome'..msg.chat_id_)
if status_welcome and not redis:get(JoKeR..'lock:tagservr'..msg.chat_id_) then
if msg.content_.ID == "MessageChatJoinByLink" then
tdcli_function({ID = "GetUser",user_id_=msg.sender_user_id_},function(extra,result) 
local GetWelcomeGroup = redis:get(JoKeR..'Get:Welcome:Group'..msg.chat_id_)  
if GetWelcomeGroup then 
t = GetWelcomeGroup
else  
t = '\n• نورت حبي \n•  name \n• user' 
end 
t = t:gsub('name',result.first_name_) 
t = t:gsub('user',('@'..result.username_ or 'لا يوجد')) 
send(msg.chat_id_, msg.id_,t)
end,nil) 
end 
end 
--------------------------------------------------------------------------------------------------------------
if msg.content_.photo_ then  
if redis:get(JoKeR..'Change:Chat:Photo'..msg.chat_id_..':'..msg.sender_user_id_) then 
if msg.content_.photo_.sizes_[3] then  
photo_id = msg.content_.photo_.sizes_[3].photo_.persistent_id_ 
else 
photo_id = msg.content_.photo_.sizes_[0].photo_.persistent_id_ 
end 
tdcli_function ({ID = "ChangeChatPhoto",chat_id_ = msg.chat_id_,photo_ = getInputFile(photo_id) }, function(arg,data)   
if data.code_ == 3 then
send(msg.chat_id_, msg.id_,'⚠┆ عذرا البوت ليس ادمن يرجى ترقيتي والمحاوله لاحقا') 
redis:del(JoKeR..'Change:Chat:Photo'..msg.chat_id_..':'..msg.sender_user_id_) 
return false  end
if data.message_ == "CHAT_ADMIN_REQUIRED" then 
send(msg.chat_id_, msg.id_,'⚠┆… ليس لدي صلاحية تغيير معلومات المجموعه يرجى المحاوله لاحقا') 
redis:del(JoKeR..'Change:Chat:Photo'..msg.chat_id_..':'..msg.sender_user_id_) 
else
send(msg.chat_id_, msg.id_,'܁༯┆تم تغير الصوره 💞 ܰ') 
end
end, nil) 
redis:del(JoKeR..'Change:Chat:Photo'..msg.chat_id_..':'..msg.sender_user_id_) 
end   
end
--------------------------------------------------------------------------------------------------------------
if redis:get(JoKeR.."Set:Description" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then  
if text == 'الغاء' then 
send(msg.chat_id_, msg.id_,"📌┆ تم الغاء وضع الوصف") 
redis:del(JoKeR.."Set:Description" .. msg.chat_id_ .. "" .. msg.sender_user_id_)
return false  
end 
redis:del(JoKeR.."Set:Description" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
https.request('https://api.telegram.org/bot'..token..'/setChatDescription?chat_id='..msg.chat_id_..'&description='..text) 
send(msg.chat_id_, msg.id_,'܁༯┆تم تغير وصف المجموعة 💞 ܰ')   
return false  
end 
--------------------------------------------------------------------------------------------------------------
if redis:get(JoKeR.."Welcome:Group" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text == 'الغاء' then 
send(msg.chat_id_, msg.id_,"܁༯┆تم الغاء حفض الترحيب 💞 ܰ") 
redis:del(JoKeR.."Welcome:Group" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  
end 
redis:del(JoKeR.."Welcome:Group" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
redis:set(JoKeR..'Get:Welcome:Group'..msg.chat_id_,text) 
send(msg.chat_id_, msg.id_,'܁༯┆تم حفض الترحيب ܊ قم بالتجربه ܊ 💞 ܰ')   
return false   
end
--------------------------------------------------------------------------------------------------------------
if redis:get(JoKeR.."Set:Priovate:Group:Link"..msg.chat_id_..""..msg.sender_user_id_) then
if text == 'الغاء' then
send(msg.chat_id_,msg.id_,"܁༯┆تم الغاء حفظ الرابط ܊ 💞 ܰ")       
redis:del(JoKeR.."Set:Priovate:Group:Link"..msg.chat_id_..""..msg.sender_user_id_) 
return false
end
if text and text:match("(https://telegram.me/%S+)") or text and text:match("(https://t.me/%S+)") then     
local Link = text:match("(https://telegram.me/%S+)") or text:match("(https://t.me/%S+)")   
redis:set(JoKeR.."Private:Group:Link"..msg.chat_id_,Link)
send(msg.chat_id_,msg.id_,"܁༯┆تم حفظ الرابط ܊ قم بالتجربه ܊ 💞 ܰ")       
redis:del(JoKeR.."Set:Priovate:Group:Link"..msg.chat_id_..""..msg.sender_user_id_) 
return false 
end
end 
--------------------------------------------------------------------------------------------------------------
if JoKeR_Msg and not Vips(msg) then  
local JoKeR_Msg = redis:get(JoKeR.."Add:Filter:Rp2"..text..msg.chat_id_)   
if JoKeR_Msg then    
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
if data.username_ ~= false then
send(msg.chat_id_,0,"⚠┆العضو : {["..data.first_name_.."](T.ME/"..data.username_..")}\n🚫┆["..JoKeR_Msg.."] \n") 
else
send(msg.chat_id_,0,"⚠┆العضو : {["..data.first_name_.."](T.ME/JoKeR_aHs)}\n🚫┆["..JoKeR_Msg.."] \n") 
end
end,nil)   
DeleteMessage(msg.chat_id_, {[0] = msg.id_})     
return false
end
end
--------------------------------------------------------------------------------------------------------------
if not Vips(msg) and msg.content_.ID ~= "MessageChatAddMembers" and redis:hget(JoKeR.."flooding:settings:"..msg.chat_id_,"flood") then 
floods = redis:hget(JoKeR.."flooding:settings:"..msg.chat_id_,"flood") or 'nil'
NUM_MSG_MAX = redis:hget(JoKeR.."flooding:settings:"..msg.chat_id_,"floodmax") or 5
TIME_CHECK = redis:hget(JoKeR.."flooding:settings:"..msg.chat_id_,"floodtime") or 5
local post_count = tonumber(redis:get(JoKeR..'floodc:'..msg.sender_user_id_..':'..msg.chat_id_) or 0)
if post_count > tonumber(redis:hget(JoKeR.."flooding:settings:"..msg.chat_id_,"floodmax") or 5) then 
local ch = msg.chat_id_
local type = redis:hget(JoKeR.."flooding:settings:"..msg.chat_id_,"flood") 
trigger_anti_spam(msg,type)  
end
redis:setex(JoKeR..'floodc:'..msg.sender_user_id_..':'..msg.chat_id_, tonumber(redis:hget(JoKeR.."flooding:settings:"..msg.chat_id_,"floodtime") or 3), post_count+1) 
local edit_id = data.text_ or 'nil'  
NUM_MSG_MAX = 5
if redis:hget(JoKeR.."flooding:settings:"..msg.chat_id_,"floodmax") then
NUM_MSG_MAX = redis:hget(JoKeR.."flooding:settings:"..msg.chat_id_,"floodmax") 
end
if redis:hget(JoKeR.."flooding:settings:"..msg.chat_id_,"floodtime") then
TIME_CHECK = redis:hget(JoKeR.."flooding:settings:"..msg.chat_id_,"floodtime") 
end 
end 
--------------------------------------------------------------------------------------------------------------
if text and redis:get(JoKeR..'lock:Fshar'..msg.chat_id_) and not Owners(msg) then 
list = {"كس","كسمك","كسختك","عير","كسخالتك","خرا بالله","عير بالله","كسخواتكم","كحاب","مناويج","مناويج","كحبه","ابن الكحبه","فرخ","فروخ","طيزك","طيزختك"}
for k,v in pairs(list) do
print(string.find(text,v))
if string.find(text,v) ~= nil then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
end
end
end
if text and redis:get(JoKeR..'lock:Fars'..msg.chat_id_) and not Owners(msg) then 
list = {"ڄ","گ","که","پی","خسته","برم","راحتی","بیام","بپوشم","گرمه","چه","چ","ڬ","ٺ","چ","ڇ","ڿ","ڀ","ڎ","ݫ","ژ","ڟ","ݜ","ڸ","پ","۴","زدن","دخترا","دیوث","مک","زدن"}
for k,v in pairs(list) do
if string.find(text,v) ~= nil then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
end
end
end
if text and redis:get(JoKeR..'lock:Fars'..msg.chat_id_) and not Owners(msg) then 
list = {'a','u','y','l','t','b','A','Q','U','J','K','L','B','D','L','V','Z','k','n','c','r','q','o','z','I','j','m','M','w','d','h','e'}
for k,v in pairs(list) do
if string.find(text,v) ~= nil then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
end
end
end
--------------------------------------------------------------------------------------------------------------
if redis:get(JoKeR..'lock:text'..msg.chat_id_) and not Vips(msg) then       
DeleteMessage(msg.chat_id_,{[0] = msg.id_})   
return false     
end     
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageChatAddMembers" then 
redis:incr(JoKeR..'Add:Contact'..msg.chat_id_..':'..msg.sender_user_id_) 
end
if msg.content_.ID == "MessageChatAddMembers" and not Vips(msg) then   
if redis:get(JoKeR.."lock:AddMempar"..msg.chat_id_) == 'kick' then
local mem_id = msg.content_.members_  
for i=0,#mem_id do  
chat_kick(msg.chat_id_,mem_id[i].id_)
end
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageChatJoinByLink" and not Vips(msg) then 
if redis:get(JoKeR.."lock:Join"..msg.chat_id_) == 'kick' then
chat_kick(msg.chat_id_,msg.sender_user_id_)
return false  
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.caption_ then 
if msg.content_.caption_:match("@[%a%d_]+") or msg.content_.caption_:match("@(.+)") then  
if redis:get(JoKeR.."lock:user:name"..msg.chat_id_) == "del" and not Vips(msg) then    
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif redis:get(JoKeR.."lock:user:name"..msg.chat_id_) == "ked" and not Vips(msg) then    
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif redis:get(JoKeR.."lock:user:name"..msg.chat_id_) == "hso" and not Vips(msg) then    
send(msg.chat_id_, msg.id_,'܁༯┆ممنوع ارسال المعرف ❕💕࿒') 
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif redis:get(JoKeR.."lock:user:name"..msg.chat_id_) == "kick" and not Vips(msg) then    
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif redis:get(JoKeR.."lock:user:name"..msg.chat_id_) == "ktm" and not Vips(msg) then    
redis:sadd(JoKeR..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
end
--------------------------------------------------------------------------------------------------------------
if text and text:match("@[%a%d_]+") or text and text:match("@(.+)") then    
if redis:get(JoKeR.."lock:user:name"..msg.chat_id_) == "del" and not Vips(msg) then    
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif redis:get(JoKeR.."lock:user:name"..msg.chat_id_) == "ked" and not Vips(msg) then    
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
elseif redis:get(JoKeR.."lock:user:name"..msg.chat_id_) == "hso" and not Vips(msg) then    
send(msg.chat_id_, msg.id_,'܁༯┆ممنوع ارسال المعرف ❕💕࿒') 
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif redis:get(JoKeR.."lock:user:name"..msg.chat_id_) == "kick" and not Vips(msg) then    
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif redis:get(JoKeR.."lock:user:name"..msg.chat_id_) == "ktm" and not Vips(msg) then    
redis:sadd(JoKeR..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.caption_ then 
if msg.content_.caption_:match("#[%a%d_]+") or msg.content_.caption_:match("#(.+)") then 
if redis:get(JoKeR.."lock:hashtak"..msg.chat_id_) == "del" and not Vips(msg) then    
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif redis:get(JoKeR.."lock:hashtak"..msg.chat_id_) == "ked" and not Vips(msg) then    
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif redis:get(JoKeR.."lock:hashtak"..msg.chat_id_) == "kick" and not Vips(msg) then    
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif redis:get(JoKeR.."lock:hashtak"..msg.chat_id_) == "ktm" and not Vips(msg) then    
redis:sadd(JoKeR..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
end
--------------------------------------------------------------------------------------------------------------
if text and text:match("#[%a%d_]+") or text and text:match("#(.+)") then
if redis:get(JoKeR.."lock:hashtak"..msg.chat_id_) == "del" and not Vips(msg) then    
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif redis:get(JoKeR.."lock:hashtak"..msg.chat_id_) == "ked" and not Vips(msg) then    
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif redis:get(JoKeR.."lock:hashtak"..msg.chat_id_) == "kick" and not Vips(msg) then    
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif redis:get(JoKeR.."lock:hashtak"..msg.chat_id_) == "ktm" and not Vips(msg) then    
redis:sadd(JoKeR..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.caption_ then 
if msg.content_.caption_:match("/[%a%d_]+") or msg.content_.caption_:match("/(.+)") then  
if redis:get(JoKeR.."lock:Cmd"..msg.chat_id_) == "del" and not Vips(msg) then    
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif redis:get(JoKeR.."lock:Cmd"..msg.chat_id_) == "ked" and not Vips(msg) then    
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif redis:get(JoKeR.."lock:Cmd"..msg.chat_id_) == "kick" and not Vips(msg) then    
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif redis:get(JoKeR.."lock:Cmd"..msg.chat_id_) == "ktm" and not Vips(msg) then    
redis:sadd(JoKeR..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
end
--------------------------------------------------------------------------------------------------------------
if text and text:match("/[%a%d_]+") or text and text:match("/(.+)") then
if redis:get(JoKeR.."lock:Cmd"..msg.chat_id_) == "del" and not Vips(msg) then    
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif redis:get(JoKeR.."lock:Cmd"..msg.chat_id_) == "ked" and not Vips(msg) then    
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif redis:get(JoKeR.."lock:Cmd"..msg.chat_id_) == "kick" and not Vips(msg) then    
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif redis:get(JoKeR.."lock:Cmd"..msg.chat_id_) == "ktm" and not Vips(msg) then    
redis:sadd(JoKeR..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == 'MessagePhoto' and not Vips(msg) then     
if redis:get(JoKeR.."lock:Photo"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif redis:get(JoKeR.."lock:Photo"..msg.chat_id_) == "ked" then
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif redis:get(JoKeR.."lock:Photo"..msg.chat_id_) == "kick" then
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif redis:get(JoKeR.."lock:Photo"..msg.chat_id_) == "ktm" then
redis:sadd(JoKeR..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == 'MessageVideo' and not Vips(msg) then     
if redis:get(JoKeR.."lock:Video"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif redis:get(JoKeR.."lock:Video"..msg.chat_id_) == "ked" then
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif redis:get(JoKeR.."lock:Video"..msg.chat_id_) == "kick" then
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif redis:get(JoKeR.."lock:Video"..msg.chat_id_) == "ktm" then
redis:sadd(JoKeR..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == 'MessageAnimation' and not Vips(msg) then     
if redis:get(JoKeR.."lock:Animation"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif redis:get(JoKeR.."lock:Animation"..msg.chat_id_) == "ked" then
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif redis:get(JoKeR.."lock:Animation"..msg.chat_id_) == "kick" then
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif redis:get(JoKeR.."lock:Animation"..msg.chat_id_) == "ktm" then
redis:sadd(JoKeR..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.game_ and not Vips(msg) then     
if redis:get(JoKeR.."lock:geam"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif redis:get(JoKeR.."lock:geam"..msg.chat_id_) == "ked" then
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif redis:get(JoKeR.."lock:geam"..msg.chat_id_) == "kick" then
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif redis:get(JoKeR.."lock:geam"..msg.chat_id_) == "ktm" then
redis:sadd(JoKeR..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == 'MessageAudio' and not Vips(msg) then     
if redis:get(JoKeR.."lock:Audio"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif redis:get(JoKeR.."lock:Audio"..msg.chat_id_) == "ked" then
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif redis:get(JoKeR.."lock:Audio"..msg.chat_id_) == "kick" then
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif redis:get(JoKeR.."lock:Audio"..msg.chat_id_) == "ktm" then
redis:sadd(JoKeR..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == 'MessageVoice' and not Vips(msg) then     
if redis:get(JoKeR.."lock:vico"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif redis:get(JoKeR.."lock:vico"..msg.chat_id_) == "ked" then
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif redis:get(JoKeR.."lock:vico"..msg.chat_id_) == "kick" then
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif redis:get(JoKeR.."lock:vico"..msg.chat_id_) == "ktm" then
redis:sadd(JoKeR..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.reply_markup_ and msg.reply_markup_.ID == 'ReplyMarkupInlineKeyboard' and not Vips(msg) then     
if redis:get(JoKeR.."lock:Keyboard"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif redis:get(JoKeR.."lock:Keyboard"..msg.chat_id_) == "ked" then
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif redis:get(JoKeR.."lock:Keyboard"..msg.chat_id_) == "kick" then
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif redis:get(JoKeR.."lock:Keyboard"..msg.chat_id_) == "ktm" then
redis:sadd(JoKeR..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == 'MessageSticker' and not Vips(msg) then     
if redis:get(JoKeR.."lock:Sticker"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif redis:get(JoKeR.."lock:Sticker"..msg.chat_id_) == "ked" then
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif redis:get(JoKeR.."lock:Sticker"..msg.chat_id_) == "kick" then
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif redis:get(JoKeR.."lock:Sticker"..msg.chat_id_) == "ktm" then
redis:sadd(JoKeR..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
if tonumber(msg.via_bot_user_id_) ~= 0 and not Vips(msg) then
if redis:get(JoKeR.."lock:inline"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif redis:get(JoKeR.."lock:inline"..msg.chat_id_) == "ked" then
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif redis:get(JoKeR.."lock:inline"..msg.chat_id_) == "kick" then
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif redis:get(JoKeR.."lock:inline"..msg.chat_id_) == "ktm" then
redis:sadd(JoKeR..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.forward_info_ and not Vips(msg) then     
if redis:get(JoKeR.."lock:forward"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
elseif redis:get(JoKeR.."lock:forward"..msg.chat_id_) == "ked" then
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
elseif redis:get(JoKeR.."lock:forward"..msg.chat_id_) == "kick" then
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
elseif redis:get(JoKeR.."lock:forward"..msg.chat_id_) == "ktm" then
redis:sadd(JoKeR..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
return false
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == 'MessageDocument' and not Vips(msg) then     
if redis:get(JoKeR.."lock:Document"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif redis:get(JoKeR.."lock:Document"..msg.chat_id_) == "ked" then
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif redis:get(JoKeR.."lock:Document"..msg.chat_id_) == "kick" then
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif redis:get(JoKeR.."lock:Document"..msg.chat_id_) == "ktm" then
redis:sadd(JoKeR..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageUnsupported" and not Vips(msg) then      
if redis:get(JoKeR.."lock:Unsupported"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif redis:get(JoKeR.."lock:Unsupported"..msg.chat_id_) == "ked" then
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif redis:get(JoKeR.."lock:Unsupported"..msg.chat_id_) == "kick" then
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif redis:get(JoKeR.."lock:Unsupported"..msg.chat_id_) == "ktm" then
redis:sadd(JoKeR..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.entities_ then 
if msg.content_.entities_[0] then 
if msg.content_.entities_[0] and msg.content_.entities_[0].ID == "MessageEntityUrl" or msg.content_.entities_[0].ID == "MessageEntityTextUrl" then      
if not Vips(msg) then
if redis:get(JoKeR.."lock:Markdaun"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif redis:get(JoKeR.."lock:Markdaun"..msg.chat_id_) == "ked" then
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif redis:get(JoKeR.."lock:Markdaun"..msg.chat_id_) == "kick" then
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif redis:get(JoKeR.."lock:Markdaun"..msg.chat_id_) == "ktm" then
redis:sadd(JoKeR..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end  
end 
end
end

--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == 'MessageContact' and not Vips(msg) then      
if redis:get(JoKeR.."lock:Contact"..msg.chat_id_) == "del" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif redis:get(JoKeR.."lock:Contact"..msg.chat_id_) == "ked" then
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif redis:get(JoKeR.."lock:Contact"..msg.chat_id_) == "kick" then
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif redis:get(JoKeR.."lock:Contact"..msg.chat_id_) == "ktm" then
redis:sadd(JoKeR..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.text_ and not Vips(msg) then  
local _nl, ctrl_ = string.gsub(text, '%c', '')  
local _nl, real_ = string.gsub(text, '%d', '')   
sens = 400  
if redis:get(JoKeR.."lock:Spam"..msg.chat_id_) == "del" and string.len(msg.content_.text_) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif redis:get(JoKeR.."lock:Spam"..msg.chat_id_) == "ked" and string.len(msg.content_.text_) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
ked(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif redis:get(JoKeR.."lock:Spam"..msg.chat_id_) == "kick" and string.len(msg.content_.text_) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
chat_kick(msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
elseif redis:get(JoKeR.."lock:Spam"..msg.chat_id_) == "ktm" and string.len(msg.content_.text_) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
redis:sadd(JoKeR..'Muted:User'..msg.chat_id_,msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_}) 
end
end
if msg.content_.ID == 'MessageSticker' and not Owners(msg) then 
local filter = redis:smembers(JoKeR.."filtersteckr"..msg.chat_id_)
for k,v in pairs(filter) do
if v == msg.content_.sticker_.set_id_ then
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
if data.username_ ~= false then
send(msg.chat_id_,0, "܁༯┆عذرأ يا  ◃ @["..data.username_.."]  💞 ܰ\n܁༯┆الملصق التي ارسلتهاا تم منعهاا من المجموعةه  💞 ܰ\n" ) 
else
send(msg.chat_id_,0, "܁༯┆عذرأ يا  ◃ ["..data.first_name_.."](T.ME/JoKeR_aHs)  💞 ܰ\n܁༯┆الملصق التي ارسلتهاا تم منعهاا من المجموعةه  💞 ܰ\n" ) 
end
end,nil)   
DeleteMessage(msg.chat_id_,{[0] = msg.id_})       
return false   
end
end
end

------------------------------------------------------------------------

------------------------------------------------------------------------
if msg.content_.ID == 'MessagePhoto' and not Owners(msg) then 
local filter = redis:smembers(JoKeR.."filterphoto"..msg.chat_id_)
for k,v in pairs(filter) do
if v == msg.content_.photo_.id_ then
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
if data.username_ ~= false then
send(msg.chat_id_,0,"܁༯┆عذرأ يا  ◃ @["..data.username_.."]  💞 ܰ\n܁༯┆الصوره التي ارسلتهاا تم منعهاا من المجموعةه  💞 ܰ\n" ) 
else
send(msg.chat_id_,0,"܁༯┆عذرأ يا  ◃ ["..data.first_name_.."](T.ME/JoKeR_aHs)  💞 ܰ\n܁༯┆الصوره التي ارسلتهاا تم منعهاا من المجموعةه  💞 ܰ\n") 
end
end,nil)   
DeleteMessage(msg.chat_id_,{[0] = msg.id_})       
return false   
end
end
end
------------------------------------------------------------------------
if msg.content_.ID == 'MessageAnimation' and not Owners(msg) then 
local filter = redis:smembers(JoKeR.."filteranimation"..msg.chat_id_)
for k,v in pairs(filter) do
if v == msg.content_.animation_.animation_.persistent_id_ then
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
if data.username_ ~= false then
send(msg.chat_id_,0,"܁༯┆عذرأ يا  ◃ @["..data.username_.."]  💞 ܰ\n܁༯┆المتحركةه التي ارسلتهاا تم منعهاا من المجموعةه  💞 ܰ\n") 
else
send(msg.chat_id_,0,"܁༯┆عذرأ يا  ◃ ["..data.first_name_.."](T.ME/JoKeR_aHs)  ?? ܰ\n܁༯┆المتحركةه التي ارسلتهاا تم منعهاا من المجموعةه  💞 ܰ\n" ) 
end
end,nil)   
DeleteMessage(msg.chat_id_,{[0] = msg.id_})       
return false   
end
end
end

if text == 'تفعيل' and Sudo(msg) then
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,'܁༯┆البوت ليس ادمن يرجئ ترقيتي... ! 💞 ܰ') 
return false  
end
tdcli_function ({ ID = "GetChannelFull", channel_id_ = getChatId(msg.chat_id_).ID }, function(arg,data)  
if tonumber(data.member_count_) < tonumber(redis:get(JoKeR..'Num:Add:Bot') or 0) and not Sudo_JoKeR(msg) then
send(msg.chat_id_, msg.id_,'܁༯┆ههلو ععمري💞 ܰ\n܁༯┆عدد أعضاء المجموعةه قليل يرجئ جمع ◃ {'..(redis:get(JoKeR..'Num:Add:Bot') or 0)..'} عضو ليتم التفعيل 💞 ܰ')
return false
end
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,chat)  
if redis:sismember(JoKeR..'Chek:Groups',msg.chat_id_) then
send(msg.chat_id_, msg.id_,'܁༯┆تم تفعيل المجموعةه مسبقاً 💞 ܰ')
else
sendText(msg.chat_id_,'\n܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم تفعيل المجموعة بنجاح 💞 ܰ',msg.id_/2097152/0.5,'md')
redis:sadd(JoKeR..'Chek:Groups',msg.chat_id_)
local Name = '['..result.first_name_..'](tg://user?id='..result.id_..')'
local NameChat = chat.title_
local IdChat = msg.chat_id_
local NumMember = data.member_count_
local linkgpp = json:decode(https.request('https://api.telegram.org/bot'..token..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if linkgpp.ok == true then 
LinkGp = linkgpp.result
else
LinkGp = 'لا يوجد'
end
Text = '🔖┆ تم تفعيل مجموعه جديده\n'..
'\n܁༯┆ بواسطة {'..Name..'}'..
'\n܁༯┆ ايدي المجموعه {`'..IdChat..'`}'..
'\n👥┆ اسم المجموعه {['..NameChat..']}'..
'\n🔖┆عدد اعضاء المجموعه *{'..NumMember..'}*'..
'\n🖇️┆ الرابط {['..LinkGp..']}'
if not Sudo_JoKeR(msg) then
sendText(SUDO,Text,0,'md')
end
end
end,nil) 
end,nil) 
end,nil)
end
if text == 'تعطيل' and Sudo(msg) then
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,chat)  
if not redis:sismember(JoKeR..'Chek:Groups',msg.chat_id_) then
send(msg.chat_id_, msg.id_,'܁༯┆تم تعطيل المجموعةه مسبقاً 💞 ܰ')
else
sendText(msg.chat_id_,'\n܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم تعطيل المجموعة بنجاح 💞 ܰ',msg.id_/2097152/0.5,'md')
redis:srem(JoKeR..'Chek:Groups',msg.chat_id_)  
local Name = '['..result.first_name_..'](tg://user?id='..result.id_..')'
local NameChat = chat.title_
local IdChat = msg.chat_id_
local AddPy = var
local linkgpp = json:decode(https.request('https://api.telegram.org/bot'..token..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if linkgpp.ok == true then 
LinkGp = linkgpp.result
else
LinkGp = 'لا يوجد'
end
Text = '\nتم تعطيل المجموعه ┆🔖'..
'\n܁༯┆ بواسطة {'..Name..'}'..
'\n܁༯┆ايدي المجموعه {`'..IdChat..'`}'..
'\n👥┆اسم المجموعه {['..NameChat..']}'..
'\n🖇️┆ الرابط {['..LinkGp..']}'
if not Sudo_JoKeR(msg) then
sendText(SUDO,Text,0,'md')
end
end
end,nil) 
end,nil) 
end
if text == 'تفعيل' and not Sudo(msg) and not redis:get(JoKeR..'Free:Bots') then
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,'܁༯┆البوت ليس ادمن يرجئ ترقيتي... ! 💞 ܰ') 
return false  
end
tdcli_function ({ ID = "GetChannelFull", channel_id_ = getChatId(msg.chat_id_).ID }, function(arg,data)  
if tonumber(data.member_count_) < tonumber(redis:get(JoKeR..'Num:Add:Bot') or 0) and not Sudo_JoKeR(msg) then
send(msg.chat_id_, msg.id_,'܁༯┆عدد أعضاء المجموعةه قليل يرجئ جمع ◃ {'..(redis:get(JoKeR..'Num:Add:Bot') or 0)..'} عضو ليتم التفعيل 💞 ܰ')
return false
end
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,chat)  
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = msg.sender_user_id_},function(arg,da) 
if da and da.status_.ID == "ChatMemberStatusEditor" or da and da.status_.ID == "ChatMemberStatusCreator" then
if da and da.user_id_ == msg.sender_user_id_ then
if da.status_.ID == "ChatMemberStatusCreator" then
var = 'المالك'
elseif da.status_.ID == "ChatMemberStatusEditor" then
var = 'مشرف'
end
if redis:sismember(JoKeR..'Chek:Groups',msg.chat_id_) then
send(msg.chat_id_, msg.id_,'܁༯┆تم تفعيل المجموعتك مسبقاً 💞 ܰ')
else
sendText(msg.chat_id_,'\n܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم تفعيل المجموعة بنجاح 💞 ܰ',msg.id_/2097152/0.5,'md')
redis:sadd(JoKeR..'Chek:Groups',msg.chat_id_)  
redis:sadd(JoKeR..'Basic:Constructor'..msg.chat_id_, msg.sender_user_id_)
local Name = '['..result.first_name_..'](tg://user?id='..result.id_..')'
local NumMember = data.member_count_
local NameChat = chat.title_
local IdChat = msg.chat_id_
local AddPy = var
local linkgpp = json:decode(https.request('https://api.telegram.org/bot'..token..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if linkgpp.ok == true then 
LinkGp = linkgpp.result
else
LinkGp = 'لا يوجد'
end
Text = '🔖┆ تم تفعيل مجموعه جديده\n'..
'\n܁༯┆ بواسطة {'..Name..'}'..
'\n܁༯┆ موقعه في المجموعه {'..AddPy..'}' ..
'\n܁༯┆ ايدي المجموعه {`'..IdChat..'`}'..
'\n👥┆ عدد اعضاء المجموعه *{'..NumMember..'}*'..
'\n📝┆ اسم المجموعه {['..NameChat..']}'..
'\n🖇️┆ الرابط {['..LinkGp..']}'
if not Sudo_JoKeR(msg) then
sendText(SUDO,Text,0,'md')
end
end
end
end
end,nil)   
end,nil) 
end,nil) 
end,nil)
end
if text and text:match("^ضع عدد الاعضاء (%d+)$") and Sudo_JoKeR(msg) then
local Num = text:match("ضع عدد الاعضاء (%d+)$") 
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
redis:set(JoKeR..'Num:Add:Bot',Num) 
send(msg.chat_id_, msg.id_,'܁༯┆ تم تعيين عدد الاعضاء سيتم تفعيل المجموعات التي اعضائها اكثر من  ◃ ['..Num..'](https://t.me/joinchat/AAAAAEvr1yqOypm-uHojPA) عضو 💞 ܰ')
end
if text == 'تحديث السورس' and Sudo_JoKeR(msg) then if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end 
send(msg.chat_id_, msg.id_,'✥┆ جاري تحديث السورس.. 𖦲 ◜ ')
os.execute('rm -rf JoKeR.lua')
os.execute('wget https://raw.githubusercontent.com/BoykaxTeam/JoKeR/master/JoKeR.lua')
os.execute('cd File_JoKeR && wget https://raw.githubusercontent.com/BoykaxTeam/JoKeR/master/File_JoKeR/Orders.lua')
sleep(0.5) 
send(msg.chat_id_, msg.id_,'✥┆ تم تحديث السورس . 𖦲 ◜')
dofile('JoKeR.lua')  
end

if text and text:match("^• تغير الاشتراك 𖤩  .$") and Sudo_JoKeR(msg) then  
redis:setex(JoKeR.."add:ch:jm" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 360, true)  
send(msg.chat_id_, msg.id_, '܁༯┆حسنا ارسل المعرف الان 💞 ܰ') 
return false  
end
if text and text:match("^• وضع قناة الاشتراك 𖤫  .$") and Sudo_JoKeR(msg) then  
redis:setex(JoKeR.."add:ch:jm" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 360, true)  
send(msg.chat_id_, msg.id_, '܁༯┆ارسل معرف قناتك 💞 ܰ') 
return false  
end
if text == "• تفعيل الاشتراك 𖤤  ." and Sudo_JoKeR(msg) then  
if redis:get(JoKeR..'add:ch:id') then
local addchusername = redis:get(JoKeR..'add:ch:username')
send(msg.chat_id_, msg.id_,"܁༯┆تم تفعيل الاشتراك الاجباري💞 ܰ")
else
redis:setex(JoKeR.."add:ch:jm" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 360, true)  
send(msg.chat_id_, msg.id_,"܁༯┆لايوجد اشتراك اجباري💞 ܰ")
end
return false  
end
if text == "• تعطيل الاشتراك 𖤤  ." and Sudo_JoKeR(msg) then  
redis:del(JoKeR..'add:ch:id')
redis:del(JoKeR..'add:ch:username')
send(msg.chat_id_, msg.id_, "܁༯┆تم تعطيل الاشتراك الاجباري 💞 ܰ") 
return false  
end
if text == "• الاشتراك الاجباري 𖤫 ." and Sudo_JoKeR(msg) then  
if redis:get(JoKeR..'add:ch:username') then
local addchusername = redis:get(JoKeR..'add:ch:username')
send(msg.chat_id_, msg.id_, "܁༯┆تم تفعيل الاشتراك الاجباري💞 ܰ")
else
send(msg.chat_id_, msg.id_, "܁༯┆لايوجد قناة في الاشتراك الاجباري  💞 ܰ ") 
end
return false  
end


if text == 'السورس' or text == 'سورس' or text == 'يا سورس' then
Text = [[
💢┇Source JoKeR 
━━━━━━━━━━━━━

💠┇[Channel Source](t.me/JoKeR_aHs) ،

💭┇[DeV Source](t.me/bbbbl) 

💬┇[Communication Source](t.me/GSGGG) 

━━━━━━━━━━━━━
⚜┇ThAnk You  !
]]
send(msg.chat_id_, msg.id_,Text)
return false
end

--------------------------------------------------------------------------------------------------------------
if Chat_Type == 'GroupBot' and ChekAdd(msg.chat_id_) == true then
if text == 'رفع النسخه الاحتياطيه' and Sudo_JoKeR(msg) then   
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
if tonumber(msg.reply_to_message_id_) > 0 then
function by_reply(extra, result, success)   
if result.content_.document_ then 
local ID_FILE = result.content_.document_.document_.persistent_id_ 
local File_Name = result.content_.document_.file_name_
AddFile_Bot(msg,msg.chat_id_,ID_FILE,File_Name)
end   
end
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text == 'جلب النسخه الاحتياطيه' and Sudo_JoKeR(msg) then 
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
GetFile_Bot(msg)
end
if text == 'الاوامر المضافه' and Constructor(msg) then
local list = redis:smembers(JoKeR..'List:Cmd:Group:New'..msg.chat_id_..'')
t = "٭ 𖤓┆قائمة الاوامر المضافةه💞💞◟\n܀⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤܀\n"
for k,v in pairs(list) do
Cmds = redis:get(JoKeR.."Set:Cmd:Group:New1"..msg.chat_id_..':'..v)
print(Cmds)
if Cmds then 
t = t.."𖠵 "..k.." ◜"..v.." ◃ "..Cmds.." ◞ .\n"
else
end
end
if #list == 0 then
t = "܁༯┆لايوجد اوامـُر مضافةه 💞 ܰ"
end
send(msg.chat_id_, msg.id_,'['..t..']')
end
if text == 'حذف الاوامر المضافه' or text == 'مسح الاوامر المضافه' then
if Constructor(msg) then 
local list = redis:smembers(JoKeR..'List:Cmd:Group:New'..msg.chat_id_)
for k,v in pairs(list) do
redis:del(JoKeR.."Set:Cmd:Group:New1"..msg.chat_id_..':'..v)
redis:del(JoKeR..'List:Cmd:Group:New'..msg.chat_id_)
end
send(msg.chat_id_, msg.id_,'܁༯┆تم حذف جميع الاوامر المضافه 💞 ܰ')  
end
end
if text == 'اضف امر' and Constructor(msg) then
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
redis:set(JoKeR.."Set:Cmd:Group"..msg.chat_id_..':'..msg.sender_user_id_,'true') 
send(msg.chat_id_, msg.id_,'܁༯┆ههلو عمري 💞 ܰ \n܁༯┆ارسل الامر القديم 💞 ܰ')  
return false
end
if text == 'حذف امر' or text == 'مسح امر' then 
if Constructor(msg) then
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
redis:set(JoKeR.."Del:Cmd:Group"..msg.chat_id_..':'..msg.sender_user_id_,'true') 
send(msg.chat_id_, msg.id_,'܁༯┆هلو عمري 💞 ܰ\n܁༯┆ارسل الامر الذي تريد حذفه 𖢟 .')  
return false
end
end
if text and redis:get(JoKeR.."Set:Cmd:Group"..msg.chat_id_..':'..msg.sender_user_id_) == 'true' then
redis:set(JoKeR.."Set:Cmd:Group:New"..msg.chat_id_,text)
send(msg.chat_id_, msg.id_,'܁༯┆قم بارسال الامر الجديد 💞 ܰ')  
redis:del(JoKeR.."Set:Cmd:Group"..msg.chat_id_..':'..msg.sender_user_id_)
redis:set(JoKeR.."Set:Cmd:Group1"..msg.chat_id_..':'..msg.sender_user_id_,'true1') 
return false
end
if text and redis:get(JoKeR.."Set:Cmd:Group1"..msg.chat_id_..':'..msg.sender_user_id_) == 'true1' then
local NewCmd = redis:get(JoKeR.."Set:Cmd:Group:New"..msg.chat_id_)
redis:set(JoKeR.."Set:Cmd:Group:New1"..msg.chat_id_..':'..text,NewCmd)
redis:sadd(JoKeR.."List:Cmd:Group:New"..msg.chat_id_,text)
send(msg.chat_id_, msg.id_,'܁༯┆تم حفض الامر ܊ قم بالتجربه ܊ 💞 ܰ')  
redis:del(JoKeR.."Set:Cmd:Group1"..msg.chat_id_..':'..msg.sender_user_id_)
return false
end
--------------------------------------------------------------------------------------------------------------
if text == 'قفل الدردشه' and msg.reply_to_message_id_ == 0 and Owners(msg) then 
redis:set(JoKeR.."lock:text"..msg.chat_id_,true) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data)  
send(msg.chat_id_, msg.id_,'܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم قفل الدردشه 💞 ܰ ')  
end,nil)   
elseif text == 'قفل الاضافه' and msg.reply_to_message_id_ == 0 and Mod(msg) then 
redis:set(JoKeR.."lock:AddMempar"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم قفل الاضافه 💞 ܰ ')  
end,nil)   
elseif text == 'قفل الدخول' and msg.reply_to_message_id_ == 0 and Mod(msg) then 
redis:set(JoKeR.."lock:Join"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم قفل الدخول 💞 ܰ ')  
end,nil)   
elseif text == 'قفل البوتات' and msg.reply_to_message_id_ == 0 and Mod(msg) then 
redis:set(JoKeR.."lock:Bot:kick"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم قفل البوتات 💞 ܰ ')  
end,nil)   
elseif text == 'قفل البوتات بالطرد' and msg.reply_to_message_id_ == 0 and Mod(msg) then 
redis:set(JoKeR.."lock:Bot:kick"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'┐ هلو بيك عمري 💞 ٭\n┤ تم قفل البوتات بالطرد 💞 ٭\n┘ بواسطة ゠◞ *@'..data.username_..'* ◜  ✛ ٭')  
end,nil)   
elseif text == 'قفل الاشعارات' and msg.reply_to_message_id_ == 0 and Mod(msg) then  
redis:set(JoKeR..'lock:tagservr'..msg.chat_id_,true)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم قفل الاشعارات 💞 ܰ ')  
end,nil)   
elseif text == 'قفل التثبيت' and msg.reply_to_message_id_ == 0 and Constructor(msg) then 
redis:set(JoKeR.."lockpin"..msg.chat_id_, true) 
redis:sadd(JoKeR..'lock:pin',msg.chat_id_) 
tdcli_function ({ ID = "GetChannelFull",  channel_id_ = getChatId(msg.chat_id_).ID }, function(arg,data)  redis:set(JoKeR..'Pin:Id:Msg'..msg.chat_id_,data.pinned_message_id_)  end,nil)
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'┐ هلو بيك عمري 💞 ٭\n┤ تم قفل الثبيت 💞 ٭\n┘ بواسطة ゠◞ *@'..data.username_..'* ◜  ✛ ٭')  
end,nil)   
elseif text == 'قفل التعديل' and msg.reply_to_message_id_ == 0 and Constructor(msg) then 
redis:set(JoKeR..'lock:edit'..msg.chat_id_,true) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم قفل التعديل 💞 ܰ ')  
end,nil)   
elseif text == 'قفل الفشار' and msg.reply_to_message_id_ == 0 and Owners(msg) then 
redis:set(JoKeR..'lock:Fshar'..msg.chat_id_,true) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'┐ هلو بيك عمري 💞 ٭\n┤ تم قفل الفشار 💞 ٭\n┘ بواسطة ゠◞ *@'..data.username_..'* ◜  ✛ ٭')  
end,nil)  
elseif text == 'قفل الفارسيه' and msg.reply_to_message_id_ == 0 and Owners(msg) then 
redis:set(JoKeR..'lock:Fars'..msg.chat_id_,true) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم قفل الفارسيه 💞 ܰ ')  
end,nil)   
elseif text == 'قفل الانكليزيه' and msg.reply_to_message_id_ == 0 and Owners(msg) then 
redis:set(JoKeR..'lock:Fars'..msg.chat_id_,true) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'܁༯┆ههلو عمري ?? ܰ \n܁༯┆تم قفل الانكليزيه 💞 ܰ ')  
end,nil)
elseif text == 'قفل الانلاين' and msg.reply_to_message_id_ == 0 and Owners(msg) then 
redis:set(JoKeR.."lock:inline"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم قفل الاونلاين 💞 ܰ ')  
end,nil)
elseif text == 'قفل تعديل الميديا' and msg.reply_to_message_id_ == 0 and Constructor(msg) then 
redis:set(JoKeR..'lock_edit_med'..msg.chat_id_,true) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم قفل التعديل الميديا 💞 ܰ ')  
end,nil)   
elseif text == 'قفل الكل' and msg.reply_to_message_id_ == 0 and Mod(msg) then 
redis:set(JoKeR..'lock:tagservrbot'..msg.chat_id_,true)   
list ={"lock:Bot:kick","lock:user:name","lock:hashtak","lock:Cmd","lock:Link","lock:forward","lock:Keyboard","lock:geam","lock:Photo","lock:Animation","lock:Video","lock:Audio","lock:vico","lock:Sticker","lock:Document","lock:Unsupported","lock:Markdaun","lock:Contact","lock:Spam"}
for i,lock in pairs(list) do 
redis:set(JoKeR..lock..msg.chat_id_,'del')    
end
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'┐ هلو بيك عمري 💞 ٭\n┤ تم قفل جميع الاوامر 💞 ٭\n┘ بواسطة ゠◞ *@'..data.username_..'* ◜  ✛ ٭')  
end,nil)   
end
if text == 'فتح الانلاين' and msg.reply_to_message_id_ == 0 and Mod(msg) then 
redis:del(JoKeR.."lock:inline"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم فتح الاونلاين 💞 ')  
end,nil)
elseif text == 'فتح الاضافه' and msg.reply_to_message_id_ == 0 and Mod(msg) then 
redis:del(JoKeR.."lock:AddMempar"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم فتح الاضافه 💞 ܰ ')  
end,nil)   
elseif text == 'فتح الدردشه' and msg.reply_to_message_id_ == 0 and Owners(msg) then 
redis:del(JoKeR.."lock:text"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم فتح الدردشه 💞 ܰ ')  
end,nil)   
elseif text == 'فتح الدخول' and msg.reply_to_message_id_ == 0 and Mod(msg) then 
redis:del(JoKeR.."lock:Join"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم فتح الدخول 💞 ܰ ')  
end,nil)   
elseif text == 'فتح البوتات' and msg.reply_to_message_id_ == 0 and Mod(msg) then 
redis:del(JoKeR.."lock:Bot:kick"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم فتح البوتات 💞 ܰ ')  
end,nil)   
elseif text == 'فتح البوتات بالطرد' and msg.reply_to_message_id_ == 0 and Mod(msg) then 
redis:del(JoKeR.."lock:Bot:kick"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'┐ هلو بيك عمري 💞 ٭\n┤ تم فتح البوتات بالطرد 💞 ٭\n┘ بواسطة ゠◞ *@'..data.username_..'* ◜  ✛ ٭')  
end,nil)   
elseif text == 'فتح الاشعارات' and msg.reply_to_message_id_ == 0 and Mod(msg) then  
redis:del(JoKeR..'lock:tagservr'..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم فتح الاشعارات 💞 ܰ ')  
end,nil)   
elseif text == 'فتح التثبيت' and msg.reply_to_message_id_ == 0 and Constructor(msg) then 
redis:del(JoKeR.."lockpin"..msg.chat_id_)  
redis:srem(JoKeR..'lock:pin',msg.chat_id_)
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'┐ هلو بيك عمري ?? ٭\n┤ تم فتح التثبيت 💞 ٭\n┘ بواسطة ゠◞ *@'..data.username_..'* ◜  ✛ ٭')  
end,nil)   
elseif text == 'فتح التعديل' and msg.reply_to_message_id_ == 0 and Constructor(msg) then 
redis:del(JoKeR..'lock:edit'..msg.chat_id_) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم قفل التعديل الميديا 💞 ܰ ')  
end,nil)   
elseif text == 'فتح الفشار' and msg.reply_to_message_id_ == 0 and Owners(msg) then 
redis:del(JoKeR..'lock:Fshar'..msg.chat_id_) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'┐ هلو بيك عمري 💞 ٭\n┤ تم فتح الفشار 💞 ٭\n┘ بواسطة ゠◞ *@'..data.username_..'* ◜  ✛ ٭')  
end,nil)   
elseif text == 'فتح الفارسيه' and msg.reply_to_message_id_ == 0 and Owners(msg) then 
redis:del(JoKeR..'lock:Fshar'..msg.chat_id_) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم فتح الفارسيه 💞 ܰ ')  
end,nil)   
elseif text == 'فتح الانكليزيه' and msg.reply_to_message_id_ == 0 and Owners(msg) then 
redis:del(JoKeR..'lock:Fars'..msg.chat_id_) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم فتح الانكليزيه 💞 ܰ ')  
end,nil)
elseif text == 'فتح تعديل الميديا' and msg.reply_to_message_id_ == 0 and Constructor(msg) then 
redis:del(JoKeR..'lock_edit_med'..msg.chat_id_) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم فتح التعديل الميديا 💞 ܰ ')  
end,nil)   
elseif text == 'فتح الكل' and msg.reply_to_message_id_ == 0 and Mod(msg) then 
redis:del(JoKeR..'lock:tagservrbot'..msg.chat_id_)   
list ={"lock:Bot:kick","lock:user:name","lock:hashtak","lock:Cmd","lock:Link","lock:forward","lock:Keyboard","lock:geam","lock:Photo","lock:Animation","lock:Video","lock:Audio","lock:vico","lock:Sticker","lock:Document","lock:Unsupported","lock:Markdaun","lock:Contact","lock:Spam"}
for i,lock in pairs(list) do 
redis:del(JoKeR..lock..msg.chat_id_)    
end
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'┐ هلو بيك عمري 💞 ٭\n┤ تم فتح جميع الاوامر 💞 ٭\n┘ بواسطة ゠◞ *@'..data.username_..'* ◜  ✛ ٭')  
end,nil)   
end
if text == 'قفل الروابط' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:Link"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم قفل الروابط 💞 ܰ ')  
end,nil)   
elseif text == 'قفل الروابط بالتقييد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:Link"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'┐ هلو بيك عمري 💞 ٭\n┤ تم قفل الروابط بالتقيد 💞 ٭\n┘ بواسطة ゠◞ *@'..data.username_..'* ◜  ✛ ٭')  
end,nil)   
elseif text == 'قفل الروابط بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:Link"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'┐ هلو بيك عمري 💞 ٭\n┤ تم قفل الروابط بالكتم 💞 ٭\n┘ بواسطة ゠◞ *@'..data.username_..'* ◜  ✛ ٭')  
end,nil)   
elseif text == 'قفل الروابط بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:Link"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'┐ هلو بيك عمري 💞 ٭\n┤ تم قفل الروابط بالطرد 💞 ٭\n┘ بواسطة ゠◞ *@'..data.username_..'* ◜  ✛ ٭')  
end,nil)   
elseif text == 'فتح الروابط' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:del(JoKeR.."lock:Link"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم فتح الروابط 💞 ܰ ')  
end,nil)   
end
if text == 'قفل المعرفات' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:user:name"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم قفل المعرفات 💞 ܰ ')  
end,nil)   
elseif text == 'قفل المعرفات بالتقييد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:user:name"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'┐ هلو بيك عمري 💞 ٭\n┤ تم قفل المعرفات بالتقيد 💞 ٭\n┘ بواسطة ゠◞ *@'..data.username_..'* ◜  ✛ ٭')  
end,nil)  
elseif text == 'قفل المعرفات بالتحذير' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:user:name"..msg.chat_id_,'hso')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'┐ هلو بيك عمري 💞 ٭\n┤ تم قفل المعرفات بالتحذير 💞 ٭\n┘ بواسطة ゠◞ *@'..data.username_..'* ◜  ✛ ٭')  
end,nil)   
elseif text == 'قفل المعرفات بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:user:name"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'┐ هلو بيك عمري 💞 ٭\n┤ تم قفل المعرفات بالكتم ?? ٭\n┘ بواسطة ゠◞ *@'..data.username_..'* ◜  ✛ ٭')  
end,nil)   
elseif text == 'قفل المعرفات بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:user:name"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'┐ هلو بيك عمري 💞 ٭\n┤ تم قفل المعرفات بالطرد 💞 ٭\n┘ بواسطة ゠◞ *@'..data.username_..'* ◜  ✛ ٭')  
end,nil)   
elseif text == 'فتح المعرفات' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:del(JoKeR.."lock:user:name"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم فتح المعرفات 💞 ܰ ')  
end,nil)   
end
if text == 'قفل التاك' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:hashtak"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم قفل التاك 💞 ܰ ')  
end,nil)   
elseif text == 'قفل التاك بالتقييد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:hashtak"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'┐ هلو بيك عمري 💞 ٭\n┤ تم قفل التاك بالتقيد 💞 ٭\n┘ بواسطة ゠◞ *@'..data.username_..'* ◜  ✛ ٭')  
end,nil)   
elseif text == 'قفل التاك بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:hashtak"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'┐ هلو بيك عمري 💞 ٭\n┤ تم قفل التاك بالكتم 💞 ٭\n┘ بواسطة ゠◞ *@'..data.username_..'* ◜  ✛ ٭')  
end,nil)   
elseif text == 'قفل التاك بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:hashtak"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'┐ هلو بيك عمري 💞 ٭\n┤ تم قفل التاك بالطرد 💞 ٭\n┘ بواسطة ゠◞ *@'..data.username_..'* ◜  ✛ ٭')  
end,nil)  
elseif text == 'فتح التاك' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:del(JoKeR.."lock:hashtak"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم فتح التاك 💞 ܰ ')  
end,nil)   
end
if text == 'قفل الشارحه' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:Cmd"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم قفل الشارحه 💞 ܰ ')  
end,nil)   
elseif text == 'قفل الشارحه بالتقييد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:Cmd"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'┐ هلو بيك عمري 💞 ٭\n┤ تم قفل الشارحه بالتقييد 💞 ٭\n┘ بواسطة ゠◞ *@'..data.username_..'* ◜  ✛ ٭')  
end,nil)   
elseif text == 'قفل الشارحه بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:Cmd"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'┐ هلو بيك عمري 💞 ٭\n┤ تم قفل الشارحه بالكتم 💞 ٭\n┘ بواسطة ゠◞ *@'..data.username_..'* ◜  ✛ ٭')  
end,nil)   
elseif text == 'قفل الشارحه بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:Cmd"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'┐ هلو بيك عمري 💞 ٭\n┤ تم قفل الشارحه بالطرد 💞 ٭\n┘ بواسطة ゠◞ *@'..data.username_..'* ◜  ✛ ٭')  
end,nil)   
elseif text == 'فتح الشارحه' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:del(JoKeR.."lock:Cmd"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم فتح الشارحه 💞 ܰ ')  
end,nil)   
end
if text == 'قفل الصور'and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:Photo"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم قفل الصور 💞 ܰ ')  
end,nil)   
elseif text == 'قفل الصور بالتقييد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:Photo"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'┐ هلو بيك عمري 💞 ٭\n┤ تم قفل الصور بالتقييد 💞 ٭\n┘ بواسطة ゠◞ *@'..data.username_..'* ◜  ✛ ٭')  
end,nil)   
elseif text == 'قفل الصور بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:Photo"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'┐ هلو بيك عمري 💞 ٭\n┤ تم قفل الصور بالكتم 💞 ٭\n┘ بواسطة ゠◞ *@'..data.username_..'* ◜  ✛ ٭ ')  
end,nil)   
elseif text == 'قفل الصور بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:Photo"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'┐ هلو بيك عمري 💞 ٭\n┤ تم قفل الصور بالطرد 💞 ٭\n┘ بواسطة ゠◞ *@'..data.username_..'* ◜  ✛ ٭')  
end,nil)   
elseif text == 'فتح الصور' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:del(JoKeR.."lock:Photo"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم فتح الصور 💞 ܰ ')  
end,nil)   
end
if text == 'قفل الفيديو' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:Video"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم قفل الفيد 💞 ܰ ')  
end,nil)   
elseif text == 'قفل الفيديو بالتقييد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:Video"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'┐ هلو بيك عمري 💞 ٭\n┤ تم قفل الفيديو بالتقييد 💞 ٭\n┘ بواسطة ゠◞ *@'..data.username_..'* ◜  ✛ ٭')  
end,nil)   
elseif text == 'قفل الفيديو بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:Video"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'┐ هلو بيك عمري 💞 ٭\n┤ تم قفل الفيديو بالكتم 💞 ٭\n┘ بواسطة ゠◞ *@'..data.username_..'* ◜  ✛ ٭')  
end,nil)   
elseif text == 'قفل الفيديو بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:Video"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'┐ هلو بيك عمري 💞 ٭\n┤ تم قفل الفيديو بالطرد 💞 ٭\n┘ بواسطة ゠◞ *@'..data.username_..'* ◜  ✛ ٭')  
end,nil)   
elseif text == 'فتح الفيديو' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:del(JoKeR.."lock:Video"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم فتح الفيد 💞 ܰ ')  
end,nil)   
end
if text == 'قفل المتحركه' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:Animation"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم قفل المتحركات 💞 ܰ ')  
end,nil)   
elseif text == 'قفل المتحركه بالتقييد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:Animation"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'┐ هلو بيك عمري 💞 ٭\n┤ تم قفل المتحركه بالتقييد 💞 ٭\n┘ بواسطة ゠◞ *@'..data.username_..'* ◜  ✛ ٭')  
end,nil)   
elseif text == 'قفل المتحركه بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:Animation"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'┐ هلو بيك عمري 💞 ٭\n┤ تم قفل المتحركه بالكتم 💞 ٭\n┘ بواسطة ゠◞ *@'..data.username_..'* ◜  ✛ ٭')  
end,nil)   
elseif text == 'قفل المتحركه بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:Animation"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'┐ هلو بيك عمري 💞 ٭\n┤ تم قفل المتحركه بالطرد 💞 ٭\n┘ بواسطة ゠◞ *@'..data.username_..'* ◜  ✛ ٭')  
end,nil)   
elseif text == 'فتح المتحركه' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:del(JoKeR.."lock:Animation"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم فتح المتحركات 💞 ܰ ')  
end,nil)   
end
if text == 'قفل الالعاب' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:geam"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم قفل الالعاب 💞 ܰ ')  
end,nil)   
elseif text == 'قفل الالعاب بالتقييد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:geam"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'┐ هلو بيك عمري 💞 ٭\n┤ تم قفل الالعاب بالتقييد 💞 ٭\n┘ بواسطة ゠◞ *@'..data.username_..'* ◜  ✛ ٭')  
end,nil)   
elseif text == 'قفل الالعاب بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:geam"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'┐ هلو بيك عمري 💞 ٭\n┤ تم قفل الالعاب بالكتم 💞 ٭\n┘ بواسطة ゠◞ *@'..data.username_..'* ◜  ✛ ٭')  
end,nil)   
elseif text == 'قفل الالعاب بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:geam"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'┐ هلو بيك عمري 💞 ٭\n┤ تم قفل الالعاب بالطرد 💞 ٭\n┘ بواسطة ゠◞ *@'..data.username_..'* ◜  ✛ ٭')  
end,nil)   
elseif text == 'فتح الالعاب' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:del(JoKeR.."lock:geam"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم فتح الالعاب 💞 ܰ ')  
end,nil)   
end
if text == 'قفل الاغاني' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:Audio"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم قفل الاغاني 💞 ܰ ')  
end,nil)   
elseif text == 'قفل الاغاني بالتقييد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:Audio"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'┐ هلو بيك عمري 💞 ٭\n┤ تم قفل الاغاني بالتقييد 💞 ٭\n┘ بواسطة ゠◞ *@'..data.username_..'* ◜  ✛ ٭')  
end,nil)   
elseif text == 'قفل الاغاني بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:Audio"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'┐ هلو بيك عمري 💞 ٭\n┤ تم قفل الاغاني بالكتم 💞 ٭\n┘ بواسطة ゠◞ *@'..data.username_..'* ◜  ✛ ٭')  
end,nil)   
elseif text == 'قفل الاغاني بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:Audio"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'┐ هلو بيك عمري 💞 ٭\n┤ تم قفل الاغاني بالطرد 💞 ٭\n┘ بواسطة ゠◞ *@'..data.username_..'* ◜  ✛ ٭')  
end,nil)   
elseif text == 'فتح الاغاني' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:del(JoKeR.."lock:Audio"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم فتح الاغاني 💞 ܰ ')  
end,nil)   
end
if text == 'قفل الصوت' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:vico"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'܁༯┆ههلو عمري ?? ܰ \n܁༯┆تم قفل الصوت 💞 ܰ ')  
end,nil)   
elseif text == 'قفل الصوت بالتقييد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:vico"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'┐ هلو بيك عمري 💞 ٭\n┤ تم قفل الصوت بالتقييد 💞 ٭\n┘ بواسطة ゠◞ *@'..data.username_..'* ◜  ✛ ٭')  
end,nil)   
elseif text == 'قفل الصوت بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:vico"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'┐ هلو بيك عمري 💞 ٭\n┤ تم قفل الصوت بالكتم 💞 ٭\n┘ بواسطة ゠◞ *@'..data.username_..'* ◜  ✛ ٭')  
end,nil)   
elseif text == 'قفل الصوت بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:vico"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'┐ هلو بيك عمري 💞 ٭\n┤ تم قفل الصوت بالطرد 💞 ٭\n┘ بواسطة ゠◞ *@'..data.username_..'* ◜  ✛ ٭')  
end,nil)   
elseif text == 'فتح الصوت' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:del(JoKeR.."lock:vico"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم فتح الصوت 💞 ܰ ')  
end,nil)   
end
if text == 'قفل الكيبورد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:Keyboard"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم قفل الكيبورد 💞 ܰ ')  
end,nil)   
elseif text == 'قفل الكيبورد بالتقييد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:Keyboard"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'┐ هلو بيك عمري 💞 ٭\n┤ تم قفل الكيبورد بالتقييد 💞 ٭\n┘ بواسطة ゠◞ *@'..data.username_..'* ◜  ✛ ٭')  
end,nil)   
elseif text == 'قفل الكيبورد بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:Keyboard"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'┐ هلو بيك عمري 💞 ٭\n┤ تم قفل الكيبورد بالكتم 💞 ٭\n┘ بواسطة ゠◞ *@'..data.username_..'* ◜  ✛ ٭')  
end,nil)   
elseif text == 'قفل الكيبورد بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:Keyboard"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'┐ هلو بيك عمري 💞 ٭\n┤ تم قفل الكيبورد بالطرد 💞 ٭\n┘ بواسطة ゠◞ *@'..data.username_..'* ◜  ✛ ٭')  
end,nil)   
elseif text == 'فتح الكيبورد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:del(JoKeR.."lock:Keyboard"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم فتح الكيبورد 💞 ܰ ')  
end,nil)   
end
if text == 'قفل الملصقات' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:Sticker"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم قفل الملصقات 💞 ܰ ')  
end,nil)   
elseif text == 'قفل الملصقات بالتقييد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:Sticker"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'┐ هلو عمري 💞 ٭\n┤ تم قفل الملصقات بالتقييد 💞 ٭\n┘ بواسطة ゠◞ *@'..data.username_..'* ◜  ✛ ٭')  
end,nil)   
elseif text == 'قفل الملصقات بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:Sticker"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'┐ هلو عمري 💞 ٭\n┤ تم قفل الملصقات بالكتم 💞 ٭\n┘ بواسطة ゠◞ *@'..data.username_..'* ◜  ✛ ٭')  
end,nil)   
elseif text == 'قفل الملصقات بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:Sticker"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'┐ هلو عمري 💞 ٭\n┤ تم قفل الملصقات بالطرد💞 ٭\n┘ بواسطة ゠◞ *@'..data.username_..'* ◜  ✛ ٭')  
end,nil)   
elseif text == 'فتح الملصقات' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:del(JoKeR.."lock:Sticker"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم فتح الملصقات 💞 ܰ ')  
end,nil)   
end
if text == 'قفل التوجيه' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:forward"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم قفل التوجيه 💞 ܰ ')  
end,nil)   
elseif text == 'قفل التوجيه بالتقييد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:forward"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'┐ هلو عمري 💞 ٭\n┤ تم قفل التوجيه بالتقييد 💞 ٭\n┘ بواسطة ゠◞ *@'..data.username_..'* ◜  ✛ ٭')  
end,nil)   
elseif text == 'قفل التوجيه بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:forward"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'┐ هلو عمري 💞 ٭\n┤ تم قفل التوجيه بالكتم 💞 ٭\n┘ بواسطة ゠◞ *@'..data.username_..'* ◜  ✛ ٭')  
end,nil)   
elseif text == 'قفل التوجيه بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:forward"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'┐ هلو عمري 💞 ٭\n┤ تم قفل التوجيه 💞 ٭\n┘ بواسطة ゠◞ *@'..data.username_..'* ◜  ✛ ٭')  
end,nil)   
elseif text == 'فتح التوجيه' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:del(JoKeR.."lock:forward"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم فتح التوجيه 💞 ܰ ')  
end,nil)   
end
if text == 'قفل الملفات' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:Document"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم قفل الملفات 💞 ܰ ')  
end,nil)   
elseif text == 'قفل الملفات بالتقييد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:Document"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'┐ هلو عمري 💞 ٭\n┤ تم قفل الملفات بالتقييد 💞 ٭\n┘ بواسطة ゠◞ *@'..data.username_..'* ◜  ✛ ٭')  
end,nil)   
elseif text == 'قفل الملفات بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:Document"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'┐ هلو  عمري 💞 ٭\n┤ تم قفل الملفات بالكتم 💞 ٭\n┘ بواسطة ゠◞ *@'..data.username_..'* ◜  ✛ ٭')  
end,nil)   
elseif text == 'قفل الملفات بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:Document"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'┐ هلو عمري 💞 ٭\n┤ تم قفل الملفات بالطرد 💞 ٭\n┘ بواسطة ゠◞ *@'..data.username_..'* ◜  ✛ ٭')  
end,nil)   
elseif text == 'فتح الملفات' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:del(JoKeR.."lock:Document"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم فتح الملفات 💞 ܰ')  
end,nil)   
end
if text == 'قفل السيلفي' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:Unsupported"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم قفل السيلفي 💞 ܰ')  
end,nil)   
elseif text == 'قفل السيلفي بالتقييد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:Unsupported"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'܁༯┆ بواسطه ← ['..utf8.sub(data.first_name_,0,60)..'](T.ME/'..(data.username_ or 'JoKeR_aHs')..') \n܁༯┆ تـم قفـل السيلفي بالتقييد\n⛔┆ الحاله ←التقييد ')  
end,nil)   
elseif text == 'قفل السيلفي بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:Unsupported"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'܁༯┆ بواسطه ← ['..utf8.sub(data.first_name_,0,60)..'](T.ME/'..(data.username_ or 'JoKeR_aHs')..') \n܁༯┆ تـم قفـل السيلفي بالكتم\n⛔┆ الحاله ←الكتم ')  
end,nil)   
elseif text == 'قفل السيلفي بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:Unsupported"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'܁༯┆ بواسطه ← ['..utf8.sub(data.first_name_,0,60)..'](T.ME/'..(data.username_ or 'JoKeR_aHs')..') \n܁༯┆ تـم قفـل السيلفي بالطرد\n⛔┆ الحاله ←الطرد ')  
end,nil)   
elseif text == 'فتح السيلفي' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:del(JoKeR.."lock:Unsupported"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم فتح السيلفي 💞 ܰ')  
end,nil)   
end
if text == 'قفل الماركداون' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:Markdaun"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم قفل الماركدون 💞 ܰ')  
end,nil)   
elseif text == 'قفل الماركداون بالتقييد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:Markdaun"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'܁༯┆ بواسطه ← ['..utf8.sub(data.first_name_,0,60)..'](T.ME/'..(data.username_ or 'JoKeR_aHs')..') \n܁༯┆ تـم قفـل الماركداون بالتقييد\n⛔┆ الحاله ←التقييد ')  
end,nil)   
elseif text == 'قفل الماركداون بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:Markdaun"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'܁༯┆ بواسطه ← ['..utf8.sub(data.first_name_,0,60)..'](T.ME/'..(data.username_ or 'JoKeR_aHs')..') \n܁༯┆ تـم قفـل الماركداون بالكتم\n⛔┆ الحاله ←الكتم ')  
end,nil)   
elseif text == 'قفل الماركداون بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:Markdaun"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'܁༯┆ بواسطه ← ['..utf8.sub(data.first_name_,0,60)..'](T.ME/'..(data.username_ or 'JoKeR_aHs')..') \n܁༯┆ تـم قفـل الماركداون بالطرد\n⛔┆ الحاله ←الطرد ')  
end,nil)   
elseif text == 'فتح الماركداون' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:del(JoKeR.."lock:Markdaun"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم فتح الماركدون 💞 ܰ')  
end,nil)   
end
if text == 'قفل الجهات' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:Contact"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم قفل الجهات 💞 ܰ')  
end,nil)   
elseif text == 'قفل الجهات بالتقييد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:Contact"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'܁༯┆ بواسطه ← ['..utf8.sub(data.first_name_,0,60)..'](T.ME/'..(data.username_ or 'JoKeR_aHs')..') \n܁༯┆ تـم قفـل الجهات بالتقييد\n⛔┆ الحاله ←التقييد ')  
end,nil)   
elseif text == 'قفل الجهات بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:Contact"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'܁༯┆ بواسطه ← ['..utf8.sub(data.first_name_,0,60)..'](T.ME/'..(data.username_ or 'JoKeR_aHs')..') \n܁༯┆ تـم قفـل الجهات بالكتم\n⛔┆ الحاله ←الكتم ')  
end,nil)   
elseif text == 'قفل الجهات بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:Contact"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'܁༯┆ بواسطه ← ['..utf8.sub(data.first_name_,0,60)..'](T.ME/'..(data.username_ or 'JoKeR_aHs')..') \n܁༯┆ تـم قفـل الجهات بالطرد\n⛔┆ الحاله ←الطرد ')  
end,nil)   
elseif text == 'فتح الجهات' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:del(JoKeR.."lock:Contact"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم فتح الجهات 💞 ܰ')  
end,nil)   
end
if text == 'قفل الكلايش' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:Spam"..msg.chat_id_,'del')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم قفل الكلايش 💞 ܰ')  
end,nil)   
elseif text == 'قفل الكلايش بالتقييد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:Spam"..msg.chat_id_,'ked')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'܁༯┆ بواسطه ← ['..utf8.sub(data.first_name_,0,60)..'](T.ME/'..(data.username_ or 'JoKeR_aHs')..') \n܁༯┆ تـم قفـل الكلايش بالتقييد\n⛔┆ الحاله ←التقييد ')  
end,nil)   
elseif text == 'قفل الكلايش بالكتم' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:Spam"..msg.chat_id_,'ktm')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'܁༯┆ بواسطه ← ['..utf8.sub(data.first_name_,0,60)..'](T.ME/'..(data.username_ or 'JoKeR_aHs')..') \n܁༯┆ تـم قفـل الكلايش بالكتم\n⛔┆ الحاله ←الكتم ')  
end,nil)   
elseif text == 'قفل الكلايش بالطرد' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:set(JoKeR.."lock:Spam"..msg.chat_id_,'kick')  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'܁༯┆ بواسطه ← ['..utf8.sub(data.first_name_,0,60)..'](T.ME/'..(data.username_ or 'JoKeR_aHs')..') \n܁༯┆ تـم قفـل الكلايش بالطرد\n⛔┆ الحاله ←الطرد ')  
end,nil)   
elseif text == 'فتح الكلايش' and Mod(msg) and msg.reply_to_message_id_ == 0 then 
redis:del(JoKeR.."lock:Spam"..msg.chat_id_)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
send(msg.chat_id_, msg.id_,'܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم فتح الكلايش 💞 ܰ')  
end,nil)   
end
if text == 'قفل التكرار بالطرد' and Mod(msg) then 
redis:hset(JoKeR.."flooding:settings:"..msg.chat_id_ ,"flood",'kick')  
send(msg.chat_id_, msg.id_,'┐ هلو عمري 💞 ٭\n┤ تم قفل التكرار 💞 ٭\n┘ الحالة ◃ التقييد ܊ الكتم ܊ [الطرد](https://t.me/joinchat/AAAAAEvr1yqOypm-uHojPA) .')
elseif text == 'قفل التكرار' and Mod(msg) then 
redis:hset(JoKeR.."flooding:settings:"..msg.chat_id_ ,"flood",'del')  
send(msg.chat_id_, msg.id_,'┐ هلو عمري 💞 ٭\n┤ تم فتح التكرار 💞 ٭\n┘ الحالة ༯ [المسـح](https://t.me/joinchat/AAAAAEvr1yqOypm-uHojPA) ٭')
elseif text == 'قفل التكرار بالتقييد' and Mod(msg) then 
redis:hset(JoKeR.."flooding:settings:"..msg.chat_id_ ,"flood",'keed')  
send(msg.chat_id_, msg.id_,'┐ هلو عمري 💞 ٭\n┤ تم قفل التكرار 💞 ٭\n┘ الحالة ◃ [التقييد](https://t.me/joinchat/AAAAAEvr1yqOypm-uHojPA) ܊ الكتم ܊ الطرد .')
elseif text == 'قفل التكرار بالكتم' and Mod(msg) then 
redis:hset(JoKeR.."flooding:settings:"..msg.chat_id_ ,"flood",'mute')  
send(msg.chat_id_, msg.id_,'┐ هلو عمري 💞 ٭\n┤ تم قفل التكرار 💞 ٭\n┘ الحالة ◃ التقييد ܊ [الكتم](https://t.me/joinchat/AAAAAEvr1yqOypm-uHojPA) ܊ الطرد .')
elseif text == 'فتح التكرار' and Mod(msg) then 
redis:hdel(JoKeR.."flooding:settings:"..msg.chat_id_ ,"flood")  
send(msg.chat_id_, msg.id_,'┐ هلو عمري 💞 ٭\n┘ تم فتح التكرار 💞 ٭')
end 
--------------------------------------------------------------------------------------------------------------
if text == 'تحديث' and Sudo_JoKeR(msg) then    
dofile('JoKeR.lua')
send(msg.chat_id_, msg.id_, '✥┆ تم تحديث الملفات . 𖦲 ◜') 
end


if text == ("تقيد") and msg.reply_to_message_id_ and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
function start_function(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(JoKeR) then  
send(msg.chat_id_, msg.id_, "܁༯┆لا تستطيع تقييد البوت 💞 ܰ ")
return false 
end
if Can_or_NotCan(result.sender_user_id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, '\n܁༯┆لا تستطيع طرد ܊ حظر ܊ كتم ܊ تقييد \n܁༯┆٭ ( '..Rutba(userid,msg.chat_id_)..' )')
else
https.request("https://api.telegram.org/bot"..token.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n܁༯┆ههلو عمري 💞 ܰ'
status  = '\n܁༯┆العضو تم تقيده هناا  💞 ܰ' 
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end

if text and text:match("^تقيد @(.*)$") and Mod(msg) then
local username = text:match("^تقيد @(.*)$")
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
function start_function(extra, result, success)
if result.id_ then
if tonumber(result.id_) == tonumber(JoKeR) then  
send(msg.chat_id_, msg.id_, "܁༯┆لا تستطيع تقييد البوت 💞 ܰ ")
return false 
end
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"܁༯┆عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه  ?? ܰ")   
return false 
end      
if Can_or_NotCan(result.id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, '\n܁༯┆لا تستطيع طرد ܊ حظر ܊ كتم ܊ تقييد \n܁༯┆٭ ( '..Rutba(userid,msg.chat_id_)..' )')
return false 
end      
https.request("https://api.telegram.org/bot"..token.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.id_)

usertext = '\n܁༯┆ههلو عمري 💞 ܰ'
status  = '\n܁༯┆العضو تم تقيده هناا  💞 ܰ' 
texts = usertext..status
else
texts = '܁༯┆لايوجد حساب بهذا المعرف  💞 ܰ'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end

if text and text:match('^تقيد (%d+) (.*)$') and tonumber(msg.reply_to_message_id_) ~= 0 and Mod(msg) then
local TextEnd = {string.match(text, "^(تقيد) (%d+) (.*)$")}
function start_function(extra, result, success)
if TextEnd[3] == 'يوم' then
Time_Restrict = TextEnd[2]:match('(%d+)')
Time = Time_Restrict * 86400
end
if TextEnd[3] == 'ساعه' then
Time_Restrict = TextEnd[2]:match('(%d+)')
Time = Time_Restrict * 3600
end
if TextEnd[3] == 'دقيقه' then
Time_Restrict = TextEnd[2]:match('(%d+)')
Time = Time_Restrict * 60
end
TextEnd[3] = TextEnd[3]:gsub('دقيقه',"دقايق") 
TextEnd[3] = TextEnd[3]:gsub('ساعه',"ساعات") 
TextEnd[3] = TextEnd[3]:gsub("يوم","ايام") 
if Can_or_NotCan(result.sender_user_id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, "\n܁༯┆لا تستطيع طرد ܊ حظر ܊ كتم ܊ تقييد \n܁༯┆٭ ( "..Rutba(userid,msg.chat_id_).." )")
else
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n܁༯┆هلو عمري 💞 ܰ'
status  = '\n܁༯┆تم تقيد العضو ◃ '..TextEnd[2]..' '..TextEnd[3]..' 💞 ܰ'
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
https.request("https://api.telegram.org/bot"..token.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_..'&until_date='..tonumber(msg.date_+Time))
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end


if text and text:match('^تقيد (%d+) (.*) @(.*)$') and Mod(msg) then
local TextEnd = {string.match(text, "^(تقيد) (%d+) (.*) @(.*)$")}
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"܁༯┆عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه  💞 ܰ")   
return false 
end      
if TextEnd[3] == 'يوم' then
Time_Restrict = TextEnd[2]:match('(%d+)')
Time = Time_Restrict * 86400
end
if TextEnd[3] == 'ساعه' then
Time_Restrict = TextEnd[2]:match('(%d+)')
Time = Time_Restrict * 3600
end
if TextEnd[3] == 'دقيقه' then
Time_Restrict = TextEnd[2]:match('(%d+)')
Time = Time_Restrict * 60
end
TextEnd[3] = TextEnd[3]:gsub('دقيقه',"دقايق") 
TextEnd[3] = TextEnd[3]:gsub('ساعه',"ساعات") 
TextEnd[3] = TextEnd[3]:gsub("يوم","ايام") 
if Can_or_NotCan(result.id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, "\n܁༯┆لا تستطيع طرد ܊ حظر ܊ كتم ܊ تقييد \n܁༯┆٭ ( "..Rutba(userid,msg.chat_id_).." )")
else
usertext = '\n܁༯┆هلو عمري 💞 ܰ'
status  = '\n܁༯┆تم تقيد العضو ◃ '..TextEnd[2]..' '..TextEnd[3]..' 💞 ܰ'
texts = usertext..status
send(msg.chat_id_, msg.id_,texts)
https.request("https://api.telegram.org/bot"..token.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.id_..'&until_date='..tonumber(msg.date_+Time))
end
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = TextEnd[4]}, start_function, nil)
return false
end
------------------------------------------------------------------------
if text and text:match("^تقيد (%d+)$") and Mod(msg) then
local userid = text:match("^تقيد (%d+)$")
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
if tonumber(userid) == tonumber(JoKeR) then  
send(msg.chat_id_, msg.id_, "܁༯┆لا تستطيع تقييد البوت 💞 ܰ ")
return false 
end
if Can_or_NotCan(userid, msg.chat_id_) then
send(msg.chat_id_, msg.id_, '\n܁༯┆لا تستطيع طرد ܊ حظر ܊ كتم ܊ تقييد \n܁༯┆٭ ( '..Rutba(userid,msg.chat_id_)..' )')
else
https.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..userid)
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n܁༯┆ههلو عمري 💞 ܰ'
status  = '\n܁༯┆العضو تم تقيده هناا  💞 ܰ' 
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n܁༯┆ههلو عمري 💞 ܰ'
status  = '\n܁༯┆العضو تم تقيده هناا  💞 ܰ' 
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
end
return false
end
------------------------------------------------------------------------
if text == ("الغاء تقيد") and msg.reply_to_message_id_ and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
function start_function(extra, result, success)
https.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. result.sender_user_id_ .. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n܁༯┆ههلو عمري 💞 ܰ'
status  = '\n܁༯┆تم الغاء تقيد العضو  💞 ܰ' 
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
------------------------------------------------------------------------
if text and text:match("^الغاء تقيد @(.*)$") and Mod(msg) then
local username = text:match("^الغاء تقيد @(.*)$")
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
function start_function(extra, result, success)
if result.id_ then
https.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. result.id_ .. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
usertext = '\n܁༯┆ههلو عمري 💞 ܰ'
status  = '\n܁༯┆تم الغاء تقيد العضو  💞 ܰ' 
texts = usertext..status
else
texts = '܁༯┆لايوجد حساب بهذا المعرف  💞 ܰ'
end
send(msg.chat_id_, msg.id_, texts)
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end
------------------------------------------------------------------------
if text and text:match("^الغاء تقيد (%d+)$") and Mod(msg) then
local userid = text:match("^الغاء تقيد (%d+)$")
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
https.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..userid.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
tdcli_function ({ID = "GetUser",user_id_ = userid},function(arg,data) 
if data.first_name_ then
usertext = '\n܁༯┆ههلو عمري 💞 ܰ'
status  = '\n܁༯┆تم الغاء تقيد العضو  💞 ܰ' 
send(msg.chat_id_, msg.id_, usertext..status)
else
usertext = '\n܁༯┆ههلو عمري 💞 ܰ'
status  = '\n܁༯┆تم الغاء تقيد العضو  💞 ܰ' 
send(msg.chat_id_, msg.id_, usertext..status)
end;end,nil)
return false
end
if text and text:match('^رفع القيود @(.*)') and Owners(msg) then 
local username = text:match('^رفع القيود @(.*)') 
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
function start_function(extra, result, success)
if result.id_ then
if Sudo_JoKeR(msg) then
redis:srem(JoKeR..'GBan:User',result.id_)
redis:srem(JoKeR..'Ban:User'..msg.chat_id_,result.id_)
redis:srem(JoKeR..'Muted:User'..msg.chat_id_,result.id_)
redis:srem(JoKeR..'Gmute:User'..msg.chat_id_,result.id_)
usertext = '\n܁༯┆هلو عمري 💞 ܰ '
status  = '\n܁༯┆تم الغاء جميع القيود من العضو 💞 ܰ '
texts = usertext..status
send(msg.chat_id_, msg.id_,texts)
else
redis:srem(JoKeR..'Ban:User'..msg.chat_id_,result.id_)
redis:srem(JoKeR..'Muted:User'..msg.chat_id_,result.id_)
usertext = '\n܁༯┆ههلو عمري 💞 ܰ'
status  = '\n܁༯┆تم الغاء تقيد العضو  💞 ܰ' 
texts = usertext..status
send(msg.chat_id_, msg.id_,texts)
end
else
Text = '┆المعرف غلط'
send(msg.chat_id_, msg.id_,Text)
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
end
if text == "رفع القيود" and Owners(msg) then
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً ?? • [https://t.me/Mzijjeat] .')
return false
end
function start_function(extra, result, success)
if Sudo_JoKeR(msg) then
redis:srem(JoKeR..'GBan:User',result.sender_user_id_)
redis:srem(JoKeR..'Ban:User'..msg.chat_id_,result.sender_user_id_)
redis:srem(JoKeR..'Muted:User'..msg.chat_id_,result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n܁༯┆هلو عمري 💞 ܰ '
status  = '\n܁༯┆تم الغاء جميع القيود من العضو 💞 ܰ '
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
else
redis:srem(JoKeR..'Ban:User'..msg.chat_id_,result.sender_user_id_)
redis:srem(JoKeR..'Muted:User'..msg.chat_id_,result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n܁༯┆هلو عمري 💞 ܰ '
status  = '\n܁༯┆تم الغاء جميع القيود من العضو 💞 ܰ '
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
end
if text and text:match('^كشف القيود @(.*)') and Owners(msg) then 
local username = text:match('^كشف القيود @(.*)') 
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
function start_function(extra, result, success)
if result.id_ then
if redis:sismember(JoKeR..'Muted:User'..msg.chat_id_,result.id_) then
Muted = 'مكتوم'
else
Muted = 'غير مكتوم'
end
if redis:sismember(JoKeR..'Ban:User'..msg.chat_id_,result.id_) then
Ban = 'محظور'
else
Ban = 'غير محظور'
end
if redis:sismember(JoKeR..'GBan:User',result.id_) then
GBan = 'محظور عام'
else
GBan = 'غير محظور عام'
end
Textt = "܁༯┆هلو عمري  💞 ܰ\n܁༯┆قيود العضو كالاتي ▿  ܰ\n••━━━━━━━━━━━━━━━━••\n܁༯┆الحظر العام ˼ "..GBan.." ˹\n܁༯┆الحظر  ˼ "..Ban.." ˹\n܁༯┆الكتم  ˼ "..Muted.." ˹"
send(msg.chat_id_, msg.id_,Textt)
else
Text = '܁༯┆المعرف غلط 💞 ܰ '
send(msg.chat_id_, msg.id_,Text)
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
end

if text == "كشف القيود" and Owners(msg) then 
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
function start_function(extra, result, success)
if redis:sismember(JoKeR..'Muted:User'..msg.chat_id_,result.sender_user_id_) then
Muted = 'مكتوم'
else
Muted = 'غير مكتوم'
end
if redis:sismember(JoKeR..'Ban:User'..msg.chat_id_,result.sender_user_id_) then
Ban = 'محظور'
else
Ban = 'غير محظور'
end
if redis:sismember(JoKeR..'GBan:User',result.sender_user_id_) then
GBan = 'محظور عام'
else
GBan = 'غير محظور عام'
end
if redis:sismember(JoKeR..'Gmute:User',result.sender_user_id_) then
Gmute = 'محظور عام'
else
Gmute = 'غير محظور عام'
end
Textt = "܁༯┆هلو عمري  💞 ܰ\n܁༯┆قيود العضو كالاتي ▿  ܰ\n••━━━━━━━━━━━━━━━━••\n܁༯┆الحظر العام ˼ "..GBan.." ˹\n܁༯┆الحظر  ˼ "..Ban.." ˹\n܁༯┆الكتم  ˼ "..Muted.." ˹"
send(msg.chat_id_, msg.id_,Textt)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
end
if text == ("رفع ادمن بالكروب") and msg.reply_to_message_id_ ~= 0 and Constructor(msg) then
function start_function(extra, result, success)
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,'܁༯┆البوت ليس ادمن يرجى ترقيتي 💞 ܰ') 
return false  
end
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n܁༯┆هلو عمري 💞 ܰ '
status  = '\n܁༯┆تم رفع العضو ادمن بالكروب 💞 ܰ '
send(msg.chat_id_, msg.id_, usertext..status)
https.request("https://api.telegram.org/bot"..token.."/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=True&can_restrict_members=false&can_pin_messages=True&can_promote_members=false")
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^رفع ادمن بالكروب @(.*)$") and Constructor(msg) then
local username = text:match("^رفع ادمن بالكروب @(.*)$")
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,'܁༯┆البوت ليس ادمن يرجى ترقيتي 💞 ܰ') 
return false  
end
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"܁༯┆عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه  💞 ܰ")   
return false 
end      
usertext = '\n܁༯┆هلو عمري 💞 ܰ '
status  = '\n܁༯┆تم رفع العضو ادمن بالكروب 💞 ܰ '
texts = usertext..status
send(msg.chat_id_, msg.id_, texts)
https.request("https://api.telegram.org/bot"..token.."/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=True&can_restrict_members=false&can_pin_messages=True&can_promote_members=false")
else
send(msg.chat_id_, msg.id_, '܁༯┆لايوجد حساب بهذا المعرف  💞 ܰ')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end
if text == ("تنزيل ادمن بالكروب") and msg.reply_to_message_id_ ~= 0 and Constructor(msg) then
function start_function(extra, result, success)
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,'܁༯┆البوت ليس ادمن يرجى ترقيتي 💞 ܰ') 
return false  
end
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n܁༯┆هلو عمري 💞 ܰ '
status  = '\n܁༯┆تم تنزيل العضو ادمن بالكروب 💞 ܰ'
send(msg.chat_id_, msg.id_, usertext..status)
https.request("https://api.telegram.org/bot"..token.."/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^تنزيل ادمن بالكروب @(.*)$") and Constructor(msg) then
local username = text:match("^تنزيل ادمن بالكروب @(.*)$")
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,'܁༯┆البوت ليس ادمن يرجى ترقيتي 💞 ܰ') 
return false  
end
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"܁༯┆عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه  💞 ܰ")   
return false 
end      
usertext = '\n܁༯┆هلو عمري 💞 ܰ '
status  = '\n܁༯┆تم تنزيل العضو ادمن بالكروب 💞 ܰ'
texts = usertext..status
send(msg.chat_id_, msg.id_, texts)
https.request("https://api.telegram.org/bot"..token.."/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")
else
send(msg.chat_id_, msg.id_, '܁༯┆لايوجد حساب بهذا المعرف  💞 ܰ')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end


if text == ("رفع ادمن بكل الصلاحيات") and msg.reply_to_message_id_ ~= 0 and BasicConstructor(msg) then
function start_function(extra, result, success)
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,'܁༯┆البوت ليس ادمن يرجى ترقيتي 💞 ܰ') 
return false  
end
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n܁༯┆هلو عمري 💞 ܰ '
status  = '\n܁༯┆تم رفع العضو ادمن بكل الصلاحيات 💞 ܰ'
send(msg.chat_id_, msg.id_, usertext..status)
https.request("https://api.telegram.org/bot"..token.."/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&can_change_info=True&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=True&can_promote_members=True")
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^رفع ادمن بكل الصلاحيات @(.*)$") and BasicConstructor(msg) then
local username = text:match("^رفع ادمن بكل الصلاحيات @(.*)$")
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,'܁༯┆البوت ليس ادمن يرجى ترقيتي 💞 ܰ') 
return false  
end
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"܁༯┆عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه  💞 ܰ")   
return false 
end      
usertext = '\n܁༯┆هلو عمري 💞 ܰ '
status  = '\n܁༯┆تم رفع العضو ادمن بكل الصلاحيات 💞 ܰ'
texts = usertext..status
send(msg.chat_id_, msg.id_, texts)
https.request("https://api.telegram.org/bot"..token.."/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.id_.."&can_change_info=True&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=True&can_promote_members=True")
else
send(msg.chat_id_, msg.id_, '܁༯┆لايوجد حساب بهذا المعرف  💞 ܰ')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end
if text == ("تنزيل ادمن بكل الصلاحيات") and msg.reply_to_message_id_ ~= 0 and BasicConstructor(msg) then
function start_function(extra, result, success)
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,'܁༯┆البوت ليس ادمن يرجى ترقيتي 💞 ܰ') 
return false  
end
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n܁༯┆هلو عمري 💞 ܰ '
status  = '\n܁༯┆تم تنزيل العضو ادمن بكل الصلاحيات 💞 ܰ'
send(msg.chat_id_, msg.id_, usertext..status)
https.request("https://api.telegram.org/bot"..token.."/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
if text and text:match("^تنزيل ادمن بكل الصلاحيات @(.*)$") and BasicConstructor(msg) then
local username = text:match("^تنزيل ادمن بكل الصلاحيات @(.*)$")
if msg.can_be_deleted_ == false then 
send(msg.chat_id_, msg.id_,'܁༯┆البوت ليس ادمن يرجى ترقيتي 💞 ܰ') 
return false  
end
function start_function(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
send(msg.chat_id_,msg.id_,"܁༯┆عذرا عزيزي المستخدم هاذا معرف قناة يرجى استخدام الامر بصوره صحيحه  💞 ܰ")   
return false 
end      
usertext = '\n܁༯┆هلو عمري 💞 ܰ '
status  = '\n܁༯┆تم تنزيل العضو ادمن بكل الصلاحيات 💞 ܰ'
texts = usertext..status
send(msg.chat_id_, msg.id_, texts)
https.request("https://api.telegram.org/bot"..token.."/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")
else
send(msg.chat_id_, msg.id_, '܁༯┆لايوجد حساب بهذا المعرف  💞 ܰ')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
return false
end

if text == 'اعدادات المجموعه' and Mod(msg) then    
if redis:get(JoKeR..'lockpin'..msg.chat_id_) then    
lock_pin = '✓'
else 
lock_pin = '✘'    
end
if redis:get(JoKeR..'lock:tagservr'..msg.chat_id_) then    
lock_tagservr = '✓'
else 
lock_tagservr = '✘'    
end
if redis:get(JoKeR..'lock:text'..msg.chat_id_) then    
lock_text = '✓'
else 
lock_text = '✘'    
end
if redis:get(JoKeR.."lock:AddMempar"..msg.chat_id_) == 'kick' then
lock_add = '✓'
else 
lock_add = '✘'    
end    
if redis:get(JoKeR.."lock:Join"..msg.chat_id_) == 'kick' then
lock_join = '✓'
else 
lock_join = '✘'    
end    
if redis:get(JoKeR..'lock:edit'..msg.chat_id_) then    
lock_edit = '✓'
else 
lock_edit = '✘'    
end
print(welcome)
if redis:get(JoKeR..'Get:Welcome:Group'..msg.chat_id_) then
welcome = '✓'
else 
welcome = '✘'    
end
if redis:get(JoKeR..'lock:edit'..msg.chat_id_) then    
lock_edit_med = '✓'
else 
lock_edit_med = '✘'    
end
if redis:hget(JoKeR.."flooding:settings:"..msg.chat_id_, "flood") == "kick" then     
flood = 'بالطرد 🚷'     
elseif redis:hget(JoKeR.."flooding:settings:"..msg.chat_id_,"flood") == "keed" then     
flood = 'بالتقيد 🔏'     
elseif redis:hget(JoKeR.."flooding:settings:"..msg.chat_id_,"flood") == "mute" then     
flood = 'بالكتم 🔇'           
elseif redis:hget(JoKeR.."flooding:settings:"..msg.chat_id_,"flood") == "del" then     
flood = 'بالمسح ⚡'           
else     
flood = '✘'     
end
if redis:get(JoKeR.."lock:Photo"..msg.chat_id_) == "del" then
lock_photo = '✓' 
elseif redis:get(JoKeR.."lock:Photo"..msg.chat_id_) == "ked" then 
lock_photo = 'بالتقيد 🔏'   
elseif redis:get(JoKeR.."lock:Photo"..msg.chat_id_) == "ktm" then 
lock_photo = 'بالكتم 🔇'    
elseif redis:get(JoKeR.."lock:Photo"..msg.chat_id_) == "kick" then 
lock_photo = 'بالطرد 🚷'   
else
lock_photo = '✘'   
end    
if redis:get(JoKeR.."lock:Contact"..msg.chat_id_) == "del" then
lock_phon = '✓' 
elseif redis:get(JoKeR.."lock:Contact"..msg.chat_id_) == "ked" then 
lock_phon = 'بالتقيد 🔏'    
elseif redis:get(JoKeR.."lock:Contact"..msg.chat_id_) == "ktm" then 
lock_phon = 'بالكتم 🔇'    
elseif redis:get(JoKeR.."lock:Contact"..msg.chat_id_) == "kick" then 
lock_phon = 'بالطرد 🚷'    
else
lock_phon = '✘'    
end    
if redis:get(JoKeR.."lock:Link"..msg.chat_id_) == "del" then
lock_links = '✓'
elseif redis:get(JoKeR.."lock:Link"..msg.chat_id_) == "ked" then
lock_links = 'بالتقيد 🔏'    
elseif redis:get(JoKeR.."lock:Link"..msg.chat_id_) == "ktm" then
lock_links = 'بالكتم 🔇'    
elseif redis:get(JoKeR.."lock:Link"..msg.chat_id_) == "kick" then
lock_links = 'بالطرد 🚷'    
else
lock_links = '✘'    
end
if redis:get(JoKeR.."lock:Cmd"..msg.chat_id_) == "del" then
lock_cmds = '✓'
elseif redis:get(JoKeR.."lock:Cmd"..msg.chat_id_) == "ked" then
lock_cmds = 'بالتقيد 🔏'    
elseif redis:get(JoKeR.."lock:Cmd"..msg.chat_id_) == "ktm" then
lock_cmds = 'بالكتم 🔇'   
elseif redis:get(JoKeR.."lock:Cmd"..msg.chat_id_) == "kick" then
lock_cmds = 'بالطرد ??'    
else
lock_cmds = '✘'    
end
if redis:get(JoKeR.."lock:user:name"..msg.chat_id_) == "del" then
lock_user = '✓'
elseif redis:get(JoKeR.."lock:user:name"..msg.chat_id_) == "ked" then
lock_user = 'بالتقيد 🔏'    
elseif redis:get(JoKeR.."lock:user:name"..msg.chat_id_) == "ktm" then
lock_user = 'بالكتم 🔇'    
elseif redis:get(JoKeR.."lock:user:name"..msg.chat_id_) == "kick" then
lock_user = 'بالطرد 🚷'    
else
lock_user = '✘'    
end
if redis:get(JoKeR.."lock:hashtak"..msg.chat_id_) == "del" then
lock_hash = '✓'
elseif redis:get(JoKeR.."lock:hashtak"..msg.chat_id_) == "ked" then 
lock_hash = 'بالتقيد 🔏'    
elseif redis:get(JoKeR.."lock:hashtak"..msg.chat_id_) == "ktm" then 
lock_hash = 'بالكتم 🔇'    
elseif redis:get(JoKeR.."lock:hashtak"..msg.chat_id_) == "kick" then 
lock_hash = 'بالطرد 🚷'    
else
lock_hash = '✘'    
end
if redis:get(JoKeR.."lock:vico"..msg.chat_id_) == "del" then
lock_muse = '✓'
elseif redis:get(JoKeR.."lock:vico"..msg.chat_id_) == "ked" then 
lock_muse = 'بالتقيد 🔏'    
elseif redis:get(JoKeR.."lock:vico"..msg.chat_id_) == "ktm" then 
lock_muse = 'بالكتم 🔇'    
elseif redis:get(JoKeR.."lock:vico"..msg.chat_id_) == "kick" then 
lock_muse = 'بالطرد 🚷'    
else
lock_muse = '✘'    
end 
if redis:get(JoKeR.."lock:Video"..msg.chat_id_) == "del" then
lock_ved = '✓'
elseif redis:get(JoKeR.."lock:Video"..msg.chat_id_) == "ked" then 
lock_ved = 'بالتقيد 🔏'    
elseif redis:get(JoKeR.."lock:Video"..msg.chat_id_) == "ktm" then 
lock_ved = 'بالكتم 🔇'    
elseif redis:get(JoKeR.."lock:Video"..msg.chat_id_) == "kick" then 
lock_ved = 'بالطرد 🚷'    
else
lock_ved = '✘'    
end
if redis:get(JoKeR.."lock:Animation"..msg.chat_id_) == "del" then
lock_gif = '✓'
elseif redis:get(JoKeR.."lock:Animation"..msg.chat_id_) == "ked" then 
lock_gif = 'بالتقيد 🔏'    
elseif redis:get(JoKeR.."lock:Animation"..msg.chat_id_) == "ktm" then 
lock_gif = 'بالكتم 🔇'    
elseif redis:get(JoKeR.."lock:Animation"..msg.chat_id_) == "kick" then 
lock_gif = 'بالطرد 🚷'    
else
lock_gif = '✘'    
end
if redis:get(JoKeR.."lock:Sticker"..msg.chat_id_) == "del" then
lock_ste = '✓'
elseif redis:get(JoKeR.."lock:Sticker"..msg.chat_id_) == "ked" then 
lock_ste = 'بالتقيد 🔏'    
elseif redis:get(JoKeR.."lock:Sticker"..msg.chat_id_) == "ktm" then 
lock_ste = 'بالكتم 🔇'    
elseif redis:get(JoKeR.."lock:Sticker"..msg.chat_id_) == "kick" then 
lock_ste = 'بالطرد 🚷'    
else
lock_ste = '✘'    
end
if redis:get(JoKeR.."lock:geam"..msg.chat_id_) == "del" then
lock_geam = '✓'
elseif redis:get(JoKeR.."lock:geam"..msg.chat_id_) == "ked" then 
lock_geam = 'بالتقيد 🔏'    
elseif redis:get(JoKeR.."lock:geam"..msg.chat_id_) == "ktm" then 
lock_geam = 'بالكتم 🔇'    
elseif redis:get(JoKeR.."lock:geam"..msg.chat_id_) == "kick" then 
lock_geam = 'بالطرد 🚷'    
else
lock_geam = '✘'    
end    
if redis:get(JoKeR.."lock:vico"..msg.chat_id_) == "del" then
lock_vico = '✓'
elseif redis:get(JoKeR.."lock:vico"..msg.chat_id_) == "ked" then 
lock_vico = 'بالتقيد 🔏'    
elseif redis:get(JoKeR.."lock:vico"..msg.chat_id_) == "ktm" then 
lock_vico = 'بالكتم 🔇'    
elseif redis:get(JoKeR.."lock:vico"..msg.chat_id_) == "kick" then 
lock_vico = 'بالطرد 🚷'    
else
lock_vico = '✘'    
end    
if redis:get(JoKeR.."lock:Keyboard"..msg.chat_id_) == "del" then
lock_inlin = '✓'
elseif redis:get(JoKeR.."lock:Keyboard"..msg.chat_id_) == "ked" then 
lock_inlin = 'بالتقيد 🔏'
elseif redis:get(JoKeR.."lock:Keyboard"..msg.chat_id_) == "ktm" then 
lock_inlin = 'بالكتم 🔇'    
elseif redis:get(JoKeR.."lock:Keyboard"..msg.chat_id_) == "kick" then 
lock_inlin = 'بالطرد 🚷'
else
lock_inlin = '✘'
end
if redis:get(JoKeR.."lock:forward"..msg.chat_id_) == "del" then
lock_fwd = '✓'
elseif redis:get(JoKeR.."lock:forward"..msg.chat_id_) == "ked" then 
lock_fwd = 'بالتقيد 🔏'    
elseif redis:get(JoKeR.."lock:forward"..msg.chat_id_) == "ktm" then 
lock_fwd = 'بالكتم 🔇'    
elseif redis:get(JoKeR.."lock:forward"..msg.chat_id_) == "kick" then 
lock_fwd = 'بالطرد 🚷'    
else
lock_fwd = '✘'    
end    
if redis:get(JoKeR.."lock:Document"..msg.chat_id_) == "del" then
lock_file = '✓'
elseif redis:get(JoKeR.."lock:Document"..msg.chat_id_) == "ked" then 
lock_file = 'بالتقيد 🔏'    
elseif redis:get(JoKeR.."lock:Document"..msg.chat_id_) == "ktm" then 
lock_file = 'بالكتم 🔇'    
elseif redis:get(JoKeR.."lock:Document"..msg.chat_id_) == "kick" then 
lock_file = 'بالطرد ??'    
else
lock_file = '✘'    
end    
if redis:get(JoKeR.."lock:Unsupported"..msg.chat_id_) == "del" then
lock_self = '✓'
elseif redis:get(JoKeR.."lock:Unsupported"..msg.chat_id_) == "ked" then 
lock_self = 'بالتقيد 🔏'    
elseif redis:get(JoKeR.."lock:Unsupported"..msg.chat_id_) == "ktm" then 
lock_self = 'بالكتم 🔇'    
elseif redis:get(JoKeR.."lock:Unsupported"..msg.chat_id_) == "kick" then 
lock_self = 'بالطرد 🚷'    
else
lock_self = '✘'    
end
if redis:get(JoKeR.."lock:Bot:kick"..msg.chat_id_) == 'del' then
lock_bots = '✓'
elseif redis:get(JoKeR.."lock:Bot:kick"..msg.chat_id_) == 'ked' then
lock_bots = 'بالتقيد 🔏'   
elseif redis:get(JoKeR.."lock:Bot:kick"..msg.chat_id_) == 'kick' then
lock_bots = 'بالطرد 🚷'    
else
lock_bots = '✘'    
end
if redis:get(JoKeR.."lock:Markdaun"..msg.chat_id_) == "del" then
lock_mark = '✓'
elseif redis:get(JoKeR.."lock:Markdaun"..msg.chat_id_) == "ked" then 
lock_mark = 'بالتقيد 🔏'    
elseif redis:get(JoKeR.."lock:Markdaun"..msg.chat_id_) == "ktm" then 
lock_mark = 'بالكتم 🔇'    
elseif redis:get(JoKeR.."lock:Markdaun"..msg.chat_id_) == "kick" then 
lock_mark = 'بالطرد 🚷'    
else
lock_mark = '✘'    
end
if redis:get(JoKeR.."lock:Spam"..msg.chat_id_) == "del" then    
lock_spam = '✓'
elseif redis:get(JoKeR.."lock:Spam"..msg.chat_id_) == "ked" then 
lock_spam = 'بالتقيد 🔏'    
elseif redis:get(JoKeR.."lock:Spam"..msg.chat_id_) == "ktm" then 
lock_spam = 'بالكتم ??'    
elseif redis:get(JoKeR.."lock:Spam"..msg.chat_id_) == "kick" then 
lock_spam = 'بالطرد 🚷'    
else
lock_spam = '✘'    
end        
if not redis:get(JoKeR..'Reply:Owners'..msg.chat_id_) then
rdmder = '✓'
else
rdmder = '✘'
end
if not redis:get(JoKeR..'Reply:Sudo'..msg.chat_id_) then
rdsudo = '✓'
else
rdsudo = '✘'
end
if not redis:get(JoKeR..'Bot:Id'..msg.chat_id_)  then
idgp = '✓'
else
idgp = '✘'
end
if not redis:get(JoKeR..'Bot:Id:Photo'..msg.chat_id_) then
idph = '✓'
else
idph = '✘'
end
if not redis:get(JoKeR..'Lock:kick'..msg.chat_id_)  then
setadd = '✓'
else
setadd = '✘'
end
if not redis:get(JoKeR..'Lock:Add:Bot'..msg.chat_id_)  then
banm = '✓'
else
banm = '✘'
end
if not redis:get(JoKeR..'Added:Me'..msg.chat_id_) then
addme = '✓'
else
addme = '✘'
end
if not redis:get(JoKeR..'Seh:User'..msg.chat_id_) then
sehuser = '✓'
else
sehuser = '✘'
end
if not redis:get(JoKeR..'Cick:Me'..msg.chat_id_) then
kickme = '✓'
else
kickme = '✘'
end
NUM_MSG_MAX = redis:hget(JoKeR.."flooding:settings:"..msg.chat_id_,"floodmax") or 0
local text = 
'\n🔰┆اعدادات المجموعه كتالي √↓'..
'\nء┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉'..
'\n܁༯┆ علامة ال {✓} تعني معطل'..
'\n܁༯┆ علامة ال {✘} تعني مفعل'..
'\nء┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉'..
'\n📌┆ الروابط ← { '..lock_links..
' }\n'..'📌┆ المعرفات ← { '..lock_user..
' }\n'..'📌┆ التاك ← { '..lock_hash..
' }\n'..'📌┆ البوتات ← { '..lock_bots..
' }\n'..'📌┆التوجيه ← { '..lock_fwd..
' }\n'..'📌┆التثبيت ← { '..lock_pin..
' }\n'..'📌┆ الاشعارات ← { '..lock_tagservr..
' }\n'..'📌┆ الماركدون ← { '..lock_mark..
' }\n'..'📌┆ التعديل ← { '..lock_edit..
' }\n'..'📌┆ تعديل الميديا ← { '..lock_edit_med..
' }\nء┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉'..
'\n'..'܁༯┆ الكلايش ← { '..lock_spam..
' }\n'..'܁༯┆ الكيبورد ← { '..lock_inlin..
' }\n'..'܁༯┆ الاغاني ← { '..lock_vico..
' }\n'..'܁༯┆ المتحركه ← { '..lock_gif..
' }\n'..'܁༯┆ الملفات ← { '..lock_file..
' }\n'..'܁༯┆ الدردشه ← { '..lock_text..
' }\n'..'܁༯┆ الفيديو ← { '..lock_ved..
' }\n'..'܁༯┆ الصور ← { '..lock_photo..
' }\nء┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉'..
'\n'..'🔖┆ الصوت ← { '..lock_muse..
' }\n'..'🔖┆ الملصقات ← { '..lock_ste..
' }\n'..'🔖┆ الجهات ← { '..lock_phon..
' }\n'..'🔖┆ الدخول ← { '..lock_join..
' }\n'..'🔖┆ الاضافه ← { '..lock_add..
' }\n'..'🔖┆ السيلفي ← { '..lock_self..
' }\n'..'🔖┆ الالعاب ← { '..lock_geam..
' }\n'..'🔖┆ التكرار ← { '..flood..
' }\n'..'🔖┆ الترحيب ← { '..welcome..
' }\n'..'??┆ عدد التكرار ← { '..NUM_MSG_MAX..
' }\nء┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉'..
'\n🔰┆ علامة ال {✓} تعني مفعل'..
'\n🔰┆ علامة ال {✘} تعني معطل'..
'\nء┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉'..
'\n'..'📮┆ امر صيح ← { '..kickme..
' }\n'..'📮┆ امر اطردني ← { '..sehuser..
' }\n'..'📮┆ امر منو ضافني ← { '..addme..
' }\n'..'📮┆ ردود المدير ← { '..rdmder..
' }\n'..'📮┆ ردود المطور ← { '..rdsudo..
' }\n'..'📮┆ الايدي ← { '..idgp..
' }\n'..'📮┆ الايدي بالصوره ← { '..idph..
' }\n'..'📮┆ الرفع ← { '..setadd..
' }\n'..'📮┆ الحظر ← { '..banm..' }\n\n┉  ┉  ┉  ┉ ┉  ┉  ┉  ┉  ┉  ┉\n🔖┆ CH ▸ @JoKeR_aHs\n'
send(msg.chat_id_, msg.id_,text)     
end    
if text ==('تثبيت') and msg.reply_to_message_id_ ~= 0 and Mod(msg) then  
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
if redis:sismember(JoKeR..'lock:pin',msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_,msg.id_,"܁༯┆التثبيت ܊ الغاء تثبيت . تم قفله من قبل المنشئين 💞 ܰ")  
return false  
end
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.reply_to_message_id_,disable_notification_ = 1},function(arg,data) 
if data.ID == "Ok" then
send(msg.chat_id_, msg.id_,"܁༯┆تم تثبيت الرسالة بنجاح 💞 ܰ")   
redis:set(JoKeR..'Pin:Id:Msg'..msg.chat_id_,msg.reply_to_message_id_)
elseif data.code_ == 6 then
send(msg.chat_id_,msg.id_,"܁༯┆انا لست ادمن في المجموعة يرجى ترقيتي 💞 ܰ")  
elseif data.message_ == "CHAT_NOT_MODIFIED" then
send(msg.chat_id_,msg.id_,"܁༯┆لا توجد رسالة مثبتة 💞 ܰه")  
elseif data.message_ == "CHAT_ADMIN_REQUIRED" then
send(msg.chat_id_,msg.id_,"܁༯┆ليست لدي صلاحيات التثبيت 💞 ܰ")  
end
end,nil) 
end
if text == 'الغاء التثبيت' and Mod(msg) then  
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
if redis:sismember(JoKeR..'lock:pin',msg.chat_id_) and not Constructor(msg) then
send(msg.chat_id_,msg.id_,"܁༯┆التثبيت ܊ الغاء تثبيت . تم قفله من قبل المنشئين 💞 ܰ")  
return false  
end
tdcli_function({ID="UnpinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100','')},function(arg,data) 
if data.ID == "Ok" then
send(msg.chat_id_, msg.id_,"܁༯┆تم الغاء تثبيت الرسالة بنجاح 💞 ܰ")   
redis:del(JoKeR..'Pin:Id:Msg'..msg.chat_id_)
elseif data.code_ == 6 then
send(msg.chat_id_,msg.id_,"܁༯┆انا لست ادمن في المجموعة يرجى ترقيتي 💞 ܰ")  
elseif data.message_ == "CHAT_NOT_MODIFIED" then
send(msg.chat_id_,msg.id_,"܁༯┆لا توجد رسالة مثبتة 💞 ܰ")  
elseif data.message_ == "CHAT_ADMIN_REQUIRED" then
send(msg.chat_id_,msg.id_,"܁༯┆ليست لدي صلاحيات التثبيت 💞 ܰ")  
end
end,nil)
end

if text and text:match('^ضع تكرار (%d+)$') and Mod(msg) then   
local Num = text:match('ضع تكرار (.*)')
redis:hset(JoKeR.."flooding:settings:"..msg.chat_id_ ,"floodmax" ,Num) 
send(msg.chat_id_, msg.id_,'܁༯┆تم وضع عدد االتكرار ◃ ◞ [('..Num..')](https://t.me/joinchat/AAAAAEvr1yqOypm-uHojPA) ◟ 💞 ܰ')  
end 
if text and text:match('^ضع زمن التكرار (%d+)$') and Mod(msg) then   
local Num = text:match('^ضع زمن التكرار (%d+)$')
redis:hset(JoKeR.."flooding:settings:"..msg.chat_id_ ,"floodtime" ,Num) 
send(msg.chat_id_, msg.id_,'📮┆ تم وضع زمن التكرار ('..Num..')') 
end
if text == "ضع رابط" or text == 'وضع رابط' then
if msg.reply_to_message_id_ == 0  and Mod(msg) then  
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
send(msg.chat_id_,msg.id_,"܁༯┆ههلو عمري 💞 ܰ \n܁༯┆ارسل رابط المجموعة او قناة المجموعة 💞 ܰ")
redis:setex(JoKeR.."Set:Priovate:Group:Link"..msg.chat_id_..""..msg.sender_user_id_,120,true) 
return false
end
end
if text == "تفعيل رابط" or text == 'تفعيل الرابط' then
if Mod(msg) then  
redis:set(JoKeR.."Link_Group:status"..msg.chat_id_,true) 
send(msg.chat_id_, msg.id_,"܁༯┆ههلو عمري 💞 ܰ\n܁༯┆تم تفعيل الرابط 💞 ܰ") 
return false  
end
end
if text == "تعطيل رابط" or text == 'تعطيل الرابط' then
if Mod(msg) then  
redis:del(JoKeR.."Link_Group:status"..msg.chat_id_) 
send(msg.chat_id_, msg.id_,"܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم تعطيل الرابط ?? ܰ") 
return false end
end
if text == "تفعيل صورتي" or text == 'تفعيل الصوره' then
if Mod(msg) then  
redis:set(JoKeR.."my_photo:status"..msg.chat_id_,true) 
send(msg.chat_id_, msg.id_,"܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم تفعيل امر صورتي 💞 ܰ") 
return false  
end
end

-----------------------------------------------------
if text == ("تاك للبنات") and Mod(msg) then
local list = redis:smembers(JoKeR..'Bant:User'..msg.chat_id_)
t = "\n܁༯┆يابنات تعالو يردونكم 😹😭?? . \n܀⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤܀\n"
for k,v in pairs(list) do
local username = redis:get(JoKeR.."user:Name" .. v)
if username then
t = t.."𖠵 "..k.." ◜[@"..username.."]◞\n"
else
t = t.."𖠵 "..k.." ◜`"..v.."`◞`\n"
end
end
if #list == 0 then
t = "܁༯┆لايوجد حلواتت 😹😔💞 ܰ"
end
send(msg.chat_id_, msg.id_, t)
end
---------
if text == ("رفع بنت الكروب") and tonumber(msg.reply_to_message_id_) ~= 0 and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
function start_function(extra, result, success)
redis:sadd(JoKeR..'Bant:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n܁༯┆تم رفع البنت في المجموعةه 😭😹💞 ܰ'
local  statuss  = ''
send(msg.chat_id_, msg.id_, usertext..statuss)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end

if (text == ("تنزيل بنت الكروب")) and msg.reply_to_message_id_ and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
function start_function(extra, result, success)
redis:srem(JoKeR..'Bant:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n܁༯┆تم تنزيل البنت من المجموعة 😭😹💞 ܰ'
status  = ''
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
-----------------------------------------------------
if text == ("تاك للمطايه") and Mod(msg) then
local list = redis:smembers(JoKeR..'Mote:User'..msg.chat_id_)
t = "\n܁༯┆يمطاية تعالو يردونكم 😹😭💞 . \n܀⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤܀\n"
for k,v in pairs(list) do
local username = redis:get(JoKeR.."user:Name" .. v)
if username then
t = t.."𖠵 "..k.." ◜[@"..username.."]◞\n"
else
t = t.."𖠵 "..k.." ◜`"..v.."`◞`\n"
end
end
if #list == 0 then
t = "܁༯┆لايوجد مطايةه 😹😔💞 ܰ"
end
send(msg.chat_id_, msg.id_, t)
end

if text == ("رفع مطي") and tonumber(msg.reply_to_message_id_) ~= 0 and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
function start_function(extra, result, success)
redis:sadd(JoKeR..'Mote:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n܁༯┆تم رفع العضو مطي في المجموعة 😭😹💞 ܰ'
local  statuss  = ''
send(msg.chat_id_, msg.id_, usertext..statuss)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end

if (text == ("تنزيل مطي")) and msg.reply_to_message_id_ and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
function start_function(extra, result, success)
redis:srem(JoKeR..'Mote:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n܁༯┆تم تنزيل العضو مطي في المجموعة 😭😹💞 ܰ'
status  = ''
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
-----------------------------------------------------
if text == ("تاك للثولان") and Mod(msg) then
local list = redis:smembers(JoKeR..'Athol:User'..msg.chat_id_)
t = "\n܁༯┆ياثولان تعالو يردونكم 😹😭💞 . \n܀⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤܀\n"
for k,v in pairs(list) do
local username = redis:get(JoKeR.."user:Name" .. v)
if username then
t = t.."𖠵 "..k.." ◜[@"..username.."]◞\n"
else
t = t.."𖠵 "..k.." ◜`"..v.."`◞`\n"
end
end
if #list == 0 then
t = "܁༯┆لايوجد ثولان😹😔💞 ܰ"
end
send(msg.chat_id_, msg.id_, t)
end
---------
if text == ("رفع اثول") and tonumber(msg.reply_to_message_id_) ~= 0 and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
function start_function(extra, result, success)
redis:sadd(JoKeR..'Athol:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n܁༯┆تم رفع العضو اثول في المجموعة 😭😹💞 ܰ'
local  statuss  = ''
send(msg.chat_id_, msg.id_, usertext..statuss)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end

if (text == ("تنزيل اثول")) and msg.reply_to_message_id_ and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
function start_function(extra, result, success)
redis:srem(JoKeR..'Athol:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n܁༯┆تم تنزيل العضو اثول في المجموعة 😭😹💞 ܰ'
status  = ''
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
-----------------------------------------------------
if text == ("تاك للانبياء") and Mod(msg) then
local list = redis:smembers(JoKeR..'Naby:User'..msg.chat_id_)
t = "\n܁༯┆يا انبياء تعالو يردونكم 😹😭💞 . \n܀⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤܀\n"
for k,v in pairs(list) do
local username = redis:get(JoKeR.."user:Name" .. v)
if username then
t = t.."𖠵 "..k.." ◜[@"..username.."]◞\n"
else
t = t.."𖠵 "..k.." ◜`"..v.."`◞`\n"
end
end
if #list == 0 then
t = "܁༯┆لايوجد انبياء 😹😔💞 ܰ"
end
send(msg.chat_id_, msg.id_, t)
end
---------

if text == ("رفع نبي") and tonumber(msg.reply_to_message_id_) ~= 0 and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
function start_function(extra, result, success)
redis:sadd(JoKeR..'Naby:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n܁༯┆رفعتلكم نبي جديد استقبلو 😹😭💞 ܰ'
local  statuss  = ''
send(msg.chat_id_, msg.id_, usertext..statuss)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end

if (text == ("تنزيل نبي")) and msg.reply_to_message_id_ and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
function start_function(extra, result, success)
redis:srem(JoKeR..'Naby:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n܁༯┆متستاهل النبوه نزلتك 😹😭💞 ܰ'
status  = ''
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
-----------------------------------------------------
if text == ("تاك للجلاب") and Mod(msg) then
local list = redis:smembers(JoKeR..'Glb:User'..msg.chat_id_)
t = "\n܁༯┆ياجلاب تعالو يردونكم 😹😭💞 . \n܀⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤܀\n"
for k,v in pairs(list) do
local username = redis:get(JoKeR.."user:Name" .. v)
if username then
t = t.."𖠵 "..k.." ◜[@"..username.."]◞\n"
else
t = t.."𖠵 "..k.." ◜`"..v.."`◞`\n"
end
end
if #list == 0 then
t = "܁༯┆لايوجد جلاب 😹😔💞 ܰ"
end
send(msg.chat_id_, msg.id_, t)
end
---------
if text == ("رفع جلب") and tonumber(msg.reply_to_message_id_) ~= 0 and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
function start_function(extra, result, success)
redis:sadd(JoKeR..'Glb:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n܁༯┆تم رفع العضو جلب في المجموعة 😭😹💞 ܰ'
local  statuss  = ''
send(msg.chat_id_, msg.id_, usertext..statuss)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end

if (text == ("تنزيل جلب")) and msg.reply_to_message_id_ and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
function start_function(extra, result, success)
redis:srem(JoKeR..'Glb:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n܁༯┆تم تنزيل العضو جلب في المجموعة 😭😹💞 ܰ'
status  = ''
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
-----------------------------------------------------
if text == ("تاك للصخول") and Mod(msg) then
local list = redis:smembers(JoKeR..'Zgal:User'..msg.chat_id_)
t = "\n܁༯┆ياصخول تعالو يردونكم 😹😭💞 . \n܀⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤܀\n"
for k,v in pairs(list) do
local username = redis:get(JoKeR.."user:Name" .. v)
if username then
t = t.."𖠵 "..k.." ◜[@"..username.."]◞\n"
else
t = t.."𖠵 "..k.." ◜`"..v.."`◞`\n"
end
end
if #list == 0 then
t = "܁༯┆لايوجد صخول 😹😔💞 ܰ"
end
send(msg.chat_id_, msg.id_, t)
end
---------
if text == ("رفع صخل") and tonumber(msg.reply_to_message_id_) ~= 0 and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
function start_function(extra, result, success)
redis:sadd(JoKeR..'Zgal:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n܁༯┆تم رفع العضو صخل في المجموعة 😭😹💞 ܰ'
local  statuss  = ''
send(msg.chat_id_, msg.id_, usertext..statuss)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end

if (text == ("تنزيل صخل")) and msg.reply_to_message_id_ and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
function start_function(extra, result, success)
redis:srem(JoKeR..'Zgal:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n܁༯┆تم تنزيل العضو صخل في المجموعة 😭😹💞 ܰ'
status  = ''
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
-----------------------------------------------------
if text == ("تاك للزواحيف") and Mod(msg) then
local list = redis:smembers(JoKeR..'Zahf:User'..msg.chat_id_)
t = "\n܁༯┆يازواحيف تعالو يردونكم 😹😭💞 . \n܀⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤܀\n"
for k,v in pairs(list) do
local username = redis:get(JoKeR.."user:Name" .. v)
if username then
t = t.."𖠵 "..k.." ◜[@"..username.."]◞\n"
else
t = t.."𖠵 "..k.." ◜`"..v.."`◞`\n"
end
end
if #list == 0 then
t = "܁༯┆لايوجد زواحيف 😹😔💞 ܰ"
end
send(msg.chat_id_, msg.id_, t)
end
---------
if text == ("رفع زاحف") and tonumber(msg.reply_to_message_id_) ~= 0 and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
function start_function(extra, result, success)
redis:sadd(JoKeR..'Zahf:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n܁༯┆تم رفع العضو زاحف في المجموعة 😭😹💞 ܰ'
local  statuss  = ''
send(msg.chat_id_, msg.id_, usertext..statuss)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end

if (text == ("تنزيل زاحف")) and msg.reply_to_message_id_ and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
function start_function(extra, result, success)
redis:srem(JoKeR..'Zahf:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n܁༯┆تم تنزيل العضو زاحف في المجموعة 😭😹💞 ܰ'
status  = ''
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
-----------------------------------------------------
if text == ("تاك للي بكلبي") and Mod(msg) then
local list = redis:smembers(JoKeR..'Galby:User'..msg.chat_id_)
t = "\n܁༯┆ياكلوب تعالو يردونكم 😹😭💞 . \n܀⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤܀\n"
for k,v in pairs(list) do
local username = redis:get(JoKeR.."user:Name" .. v)
if username then
t = t.."𖠵 "..k.." ◜[@"..username.."]◞\n"
else
t = t.."𖠵 "..k.." ◜`"..v.."`◞`\n"
end
end
if #list == 0 then
t = "܁༯┆لايوجد كلوب 😹😔💞 ܰ"
end
send(msg.chat_id_, msg.id_, t)
end
---------
if text == ("رفع بكلبي") and tonumber(msg.reply_to_message_id_) ~= 0 and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
function start_function(extra, result, success)
redis:sadd(JoKeR..'Galby:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n܁༯┆رفعتك بكلبي لتجرحني 😘😭💞 ܰ'
local  statuss  = ''
send(msg.chat_id_, msg.id_, usertext..statuss)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end

if (text == ("تنزيل بكلبي")) and msg.reply_to_message_id_ and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
function start_function(extra, result, success)
redis:srem(JoKeR..'Galby:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n܁༯┆مو كتلك لتجرحني نزلتك من كلبي 😭💞 ܰ'
status  = ''
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
-----------------------------------------------------
if text == ("تاك للتوج") and Mod(msg) then
local list = redis:smembers(JoKeR..'Tag:User'..msg.chat_id_)
t = "\n܁༯┆ياتوج تعالو يردونكم 😹😭?? . \n܀⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤܀\n"
for k,v in pairs(list) do
local username = redis:get(JoKeR.."user:Name" .. v)
if username then
t = t.."𖠵 "..k.." ◜[@"..username.."]◞\n"
else
t = t.."𖠵 "..k.." ◜`"..v.."`◞`\n"
end
end
if #list == 0 then
t = "܁༯┆لايوجد تاج😹😔💞 ܰ"
end
send(msg.chat_id_, msg.id_, t)
end
---------
if text == ("رفع تاج") and tonumber(msg.reply_to_message_id_) ~= 0 and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
function start_function(extra, result, success)
redis:sadd(JoKeR..'Tag:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n܁༯┆هو تاج ميحتاج ارفعه 🤴🏻💞 ܰ'
local  statuss  = ''
send(msg.chat_id_, msg.id_, usertext..statuss)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end

if (text == ("تنزيل تاج")) and msg.reply_to_message_id_ and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
function start_function(extra, result, success)
redis:srem(JoKeR..'Tag:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n܁༯┆التاج ماينزل من مكانه 🤴🏻💞 ܰ'
status  = ''
send(msg.chat_id_, msg.id_, usertext..status)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end
-----------------------------------------------------

if text == ("نزوج") and tonumber(msg.reply_to_message_id_) ~= 0 and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
function start_function(extra, result, success)
redis:sadd(JoKeR..'Zoag:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n܁༯┆نزوج وماتباوع على غيري 🥺💞 ܰ'
local  statuss  = ''
send(msg.chat_id_, msg.id_, usertext..statuss)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end

if text == ("طالق") and tonumber(msg.reply_to_message_id_) ~= 0 and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
function start_function(extra, result, success)
redis:sadd(JoKeR..'Mote:User'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
usertext = '\n܁༯┆طالق طالق طالق بالعشرة 😹😭💞 ܰ'
local  statuss  = ''
send(msg.chat_id_, msg.id_, usertext..statuss)
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
return false
end


-----------------------------------------------------
if text == "تعطيل الصوره" or text == 'تعطيل صورتي' then
if Mod(msg) then  
redis:del(JoKeR.."my_photo:status"..msg.chat_id_) 
send(msg.chat_id_, msg.id_,"܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم تعطيل امر صورتي 💞 ܰ") 
return false end
end
if text == "صورتي"  then
local my_ph = redis:get(JoKeR.."my_photo:status"..msg.chat_id_)
if not my_ph then
send(msg.chat_id_, msg.id_,"܁༯┆الصوره معطلةه 💞 ܰ") 
return false  
end
local function getpro(extra, result, success)
if result.photos_[0] then
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[0].sizes_[1].photo_.persistent_id_,"܁༯┆عدد صوركك هوه ◃ "..result.total_count_.." صوره‌‏ 💞", msg.id_, msg.id_, "md")
else
send(msg.chat_id_, msg.id_,'لا تمتلك صوره في حسابك', 1, 'md')
  end end
tdcli_function ({ ID = "GetUserProfilePhotos", user_id_ = msg.sender_user_id_, offset_ = 0, limit_ = 1 }, getpro, nil)
end
------

if text == "الرابط" then
local status_Link = redis:get(JoKeR.."Link_Group:status"..msg.chat_id_)
if not status_Link then
send(msg.chat_id_, msg.id_,"܁༯┆الرابط معطل † ارسل تفعيل الرابط💞 ܰ ") 
return false  
end   
local link = redis:get(JoKeR.."Private:Group:Link"..msg.chat_id_)            
if link then                              
send(msg.chat_id_,msg.id_,'𖦲┆*𝙻𝙸𝙽𝙺 𝙶𝚁𝙾𝚄𝙿*  💞 𖥣 ٠\n••━━━━━━𖥠━━━━━━••\n['..link..']')                          
else                
local linkgpp = json:decode(https.request('https://api.telegram.org/bot'..token..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if linkgpp.ok == true then 
linkgp = '༯┆*𝙻𝙸𝙽𝙺 𝙶𝚁𝙾𝚄𝙿* 💞🦄 ٠\n•━━━━━━𖥠━━━━━━•\n ['..linkgpp.result..']'
else
linkgp = '܁༯┆لايوجد رابط ܊ ارسل ضع رابط 💞 ܰ '
end  
send(msg.chat_id_, msg.id_,linkgp)              
end          
end
if text == 'مسح الرابط' or text == 'حذف الرابط' then
if Mod(msg) then     
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
send(msg.chat_id_,msg.id_,"܁༯┆تم حذف الرابط بنجاح 💞 ܰ ")           
redis:del(JoKeR.."Private:Group:Link"..msg.chat_id_) 
return false      
end
end
if text and text:match("^ضع صوره") and Mod(msg) and msg.reply_to_message_id_ == 0 then  
redis:set(JoKeR..'Change:Chat:Photo'..msg.chat_id_..':'..msg.sender_user_id_,true) 
send(msg.chat_id_, msg.id_,'܁༯┆ههلو عمري 💞 ܰ \n܁༯┆ قم بارسل الصوره 💞 ܰ') 
return false
end
if text == "حذف الصوره" or text == "مسح الصوره" then 
if Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
https.request('https://api.telegram.org/bot'..token..'/deleteChatPhoto?chat_id='..msg.chat_id_) 
send(msg.chat_id_, msg.id_,'܁༯┆تم ازالةه صوره المجموعةه💞 ܰ ') 
end
return false  
end
if text == 'ضع وصف' or text == 'وضع وصف' then  
if Mod(msg) then
redis:setex(JoKeR.."Set:Description" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 120, true)  
send(msg.chat_id_, msg.id_,'܁༯┆ههلو عمري 💞 ܰ \n܁༯┆ قم بارسل الوصف 💞 ܰ')
end
return false  
end
if text == 'ضع ترحيب' or text == 'وضع ترحيب' then  
if Mod(msg) then
redis:setex(JoKeR.."Welcome:Group" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 120, true)  
t  = '܁༯┆ههلو عمري 💞 ܰ \n܁༯┆ارسل الترحيب الان 𖢟 .'
tt = '\n܁༯┆تستطيع اضافة ماياتي 𖢟 .\n܁༯┆دالة عرض الاسم ◃ `name`\n܁༯┆دالة عرض المعرف ◃ `user`'
send(msg.chat_id_, msg.id_,t..tt) 
end
return false  
end
if text == 'الترحيب' and Mod(msg) then 
local GetWelcomeGroup = redis:get(JoKeR..'Get:Welcome:Group'..msg.chat_id_)  
if GetWelcomeGroup then 
GetWelcome = GetWelcomeGroup
else 
GetWelcome = '܁༯┆لا يوجد ترحيب 💞 ܰ\n܁༯┆ ارسل ضع ترحيب لوضع ترحيب 💞 ܰ '
end 
send(msg.chat_id_, msg.id_,'['..GetWelcome..']') 
return false  
end
if text == 'جلب ملف السورس' then
if not Sudo_JoKeR(msg) then
send(msg.chat_id_, msg.id_,'܁༯┆مطور اساسي فقط 💞 ܰ ')
else
sendDocument(SUDO, 0, 0, 1, nil, './JoKeR.lua', dl_cb, nil)
send(msg.chat_id_, msg.id_,'܁༯┆تم ارسال ملف السورس 💞 ܰ')
end
end
if text == 'تفعيل الترحيب' and Mod(msg) then  
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
redis:set(JoKeR..'Chek:Welcome'..msg.chat_id_,true) 
send(msg.chat_id_, msg.id_,'܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم تفعيل الترحيب 💞 ܰ') 
return false  
end
if text == 'تعطيل الترحيب' and Mod(msg) then  
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
redis:del(JoKeR..'Chek:Welcome'..msg.chat_id_) 
send(msg.chat_id_, msg.id_,'܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم تعطيل الترحيب 💞 ܰ') 
return false  
end
if text == 'مسح الترحيب' or text == 'حذف الترحيب' then 
if Mod(msg) then
redis:del(JoKeR..'Get:Welcome:Group'..msg.chat_id_) 
send(msg.chat_id_, msg.id_,'܁༯┆تم حذف الترحيب 💞 ܰ ') 
end
end
if text and text == "منع" and msg.reply_to_message_id_ == 0 and Owners(msg)  then       
send(msg.chat_id_, msg.id_,"܁༯┆ارسل الكلمة الذي تريد منعها 💞 ܰ")  
redis:set(JoKeR.."JoKeR1:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_,"rep")  
return false  
end    
if text then   
local tsssst = redis:get(JoKeR.."JoKeR1:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
if tsssst == "rep" then   
send(msg.chat_id_, msg.id_,"܁༯┆ارسل التحذير عند ارسال الكلمة 💞 ܰ")  
redis:set(JoKeR.."JoKeR1:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_,"repp")  
redis:set(JoKeR.."JoKeR1:filtr1:add:reply2"..msg.sender_user_id_..msg.chat_id_, text)  
redis:sadd(JoKeR.."JoKeR1:List:Filter"..msg.chat_id_,text)  
return false  end  
end
if text then  
local test = redis:get(JoKeR.."JoKeR1:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
if test == "repp" then  
send(msg.chat_id_, msg.id_,"܁༯┆تم منع الكلمه مع التحذير 💞 ܰ")  
redis:del(JoKeR.."JoKeR1:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
local test = redis:get(JoKeR.."JoKeR1:filtr1:add:reply2"..msg.sender_user_id_..msg.chat_id_)  
if text then   
redis:set(JoKeR.."JoKeR1:Add:Filter:Rp2"..test..msg.chat_id_, text)  
end  
redis:del(JoKeR.."JoKeR1:filtr1:add:reply2"..msg.sender_user_id_..msg.chat_id_)  
return false  end  
end

if text == "الغاء منع" and msg.reply_to_message_id_ == 0 and Owners(msg) then    
send(msg.chat_id_, msg.id_,"܁༯┆ارسل الكلمةه الان 💞 ܰ ")  
redis:set(JoKeR.."JoKeR1:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_,"reppp")  
return false  end
if text then 
local test = redis:get(JoKeR.."JoKeR1:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
if test and test == "reppp" then   
send(msg.chat_id_, msg.id_,"܁༯┆تم الغاء منع الكلمةه 💞 ܰ  ")  
redis:del(JoKeR.."JoKeR1:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
redis:del(JoKeR.."JoKeR1:Add:Filter:Rp2"..text..msg.chat_id_)  
redis:srem(JoKeR.."JoKeR1:List:Filter"..msg.chat_id_,text)  
return false  end  
end


if text == 'منع' and tonumber(msg.reply_to_message_id_) > 0 and Owners(msg) then     
function cb(a,b,c) 
textt = '܁༯┆تم المنع لن يتم ارسالها مجددا 💞 ܰ  '
if b.content_.sticker_ then
local idsticker = b.content_.sticker_.set_id_
redis:sadd(JoKeR.."filtersteckr"..msg.chat_id_,idsticker)
text = 'الملصق'
send(msg.chat_id_, msg.id_,textt..'( '..text..' ) بنجاح لن يتم ارسالها مجددا')  
return false
end
if b.content_.ID == "MessagePhoto" then
local photo = b.content_.photo_.id_
redis:sadd(JoKeR.."filterphoto"..msg.chat_id_,photo)
text = 'الصوره'
send(msg.chat_id_, msg.id_,textt..'( '..text..' ) بنجاح لن يتم ارسالها مجددا')  
return false
end
if b.content_.animation_.animation_ then
local idanimation = b.content_.animation_.animation_.persistent_id_
redis:sadd(JoKeR.."filteranimation"..msg.chat_id_,idanimation)
text = 'المتحركه'
send(msg.chat_id_, msg.id_,textt..'( '..text..' ) بنجاح لن يتم ارسالها مجددا')  
return false
end
end
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, cb, nil)
end
if text == 'الغاء منع' and tonumber(msg.reply_to_message_id_) > 0 and Owners(msg) then     
function cb(a,b,c) 
textt = '܁༯┆تم الغاء المنع 💞 ܰ  '
if b.content_.sticker_ then
local idsticker = b.content_.sticker_.set_id_
redis:srem(JoKeR.."filtersteckr"..msg.chat_id_,idsticker)
text = 'الملصق'
send(msg.chat_id_, msg.id_,textt..'( '..text..' ) بنجاح يمكنهم الارسال الان')  
return false
end
if b.content_.ID == "MessagePhoto" then
local photo = b.content_.photo_.id_
redis:srem(JoKeR.."filterphoto"..msg.chat_id_,photo)
text = 'الصوره'
send(msg.chat_id_, msg.id_,textt..'( '..text..' ) بنجاح يمكنهم الارسال الان')  
return false
end
if b.content_.animation_.animation_ then
local idanimation = b.content_.animation_.animation_.persistent_id_
redis:srem(JoKeR.."filteranimation"..msg.chat_id_,idanimation)
text = 'المتحركه'
send(msg.chat_id_, msg.id_,textt..'( '..text..' ) بنجاح يمكنهم الارسال الان')  
return false
end
end
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, cb, nil)
end

if text == "مسح قائمه المنع"and Owners(msg) then   
local list = redis:smembers(JoKeR.."JoKeR1:List:Filter"..msg.chat_id_)  
for k,v in pairs(list) do  
redis:del(JoKeR.."JoKeR1:Add:Filter:Rp1"..msg.sender_user_id_..msg.chat_id_)  
redis:del(JoKeR.."JoKeR1:Add:Filter:Rp2"..v..msg.chat_id_)  
redis:srem(JoKeR.."JoKeR1:List:Filter"..msg.chat_id_,v)  
end  
send(msg.chat_id_, msg.id_,"܁༯┆تم مسح قائمة المنع💞 ܰ ")  
end

if text == "قائمه المنع" and Owners(msg) then   
local list = redis:smembers(JoKeR.."JoKeR1:List:Filter"..msg.chat_id_)  
t = "\n٭ 𖤓┆قائمة المنع ☓💞◟\n܀⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤܀\n"
for k,v in pairs(list) do  
local JoKeR_Msg = redis:get(JoKeR.."JoKeR1:Add:Filter:Rp2"..v..msg.chat_id_)   
t = t.."܁ 𖠵 "..k.." ゠ "..v.." ◃ ◞"..JoKeR_Msg.."◜\n"    
end  
if #list == 0 then  
t = "܁༯┆لايوجد كلمات ممنوعةه ?? ܰ "  
end  
send(msg.chat_id_, msg.id_,t)  
end  

if text == 'مسح قائمه منع المتحركات' and Owners(msg) then     
redis:del(JoKeR.."filteranimation"..msg.chat_id_)
send(msg.chat_id_, msg.id_,'܁༯┆ تم مسح قائمه منع المتحركات 💞 ܰ ')  
end
if text == 'مسح قائمه منع الصور' and Owners(msg) then     
redis:del(JoKeR.."filterphoto"..msg.chat_id_)
send(msg.chat_id_, msg.id_,'܁༯┆ تم مسح قائمه منع الصور 💞 ܰ ')  
end
if text == 'مسح قائمه منع الملصقات' and Owners(msg) then     
redis:del(JoKeR.."filtersteckr"..msg.chat_id_)
send(msg.chat_id_, msg.id_,'܁༯┆ تم مسح قائمه منع الملصقات 💞 ܰ ')  
end
if text == 'المطور' or text == 'مطور' or text == 'المطوره' then
local Text_Dev = redis:get(JoKeR..'Text:Dev:Bot')
if Text_Dev then 
send(msg.chat_id_, msg.id_,Text_Dev)
else
tdcli_function ({ID = "GetUser",user_id_ = SUDO},function(arg,result) 
local Name = '['..result.first_name_..'](tg://user?id='..result.id_..')'
sendText(msg.chat_id_,Name,msg.id_/2097152/0.5,'md')
end,nil)
end
end

if text == 'حذف كليشه المطور' and Sudo_JoKeR(msg) then
redis:del(JoKeR..'Text:Dev:Bot')
send(msg.chat_id_, msg.id_,'܁༯┆تم حذف كليشه المطور 💞 ܰ')
end
if text == 'ضع كليشه المطور' and Sudo_JoKeR(msg) then
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
redis:set(JoKeR..'Set:Text:Dev:Bot'..msg.chat_id_,true)
send(msg.chat_id_, msg.id_,'܁༯┆ارسل الكليشةه الان 💞 ܰ ')
return false
end
if text and redis:get(JoKeR..'Set:Text:Dev:Bot'..msg.chat_id_) then
if text == 'الغاء' then 
redis:del(JoKeR..'Set:Text:Dev:Bot'..msg.chat_id_)
send(msg.chat_id_, msg.id_,'܁༯┆تم الغاء حفظ كليشةه المطور 💞 ܰ ')
return false
end
redis:set(JoKeR..'Text:Dev:Bot',text)
redis:del(JoKeR..'Set:Text:Dev:Bot'..msg.chat_id_)
send(msg.chat_id_, msg.id_,'܁༯┆تم حفظ كليشةه المطور 💞 ܰ ')
return false
end
if text == 'تعين الايدي' and Owners(msg) then
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
redis:setex(JoKeR.."CHENG:ID"..msg.chat_id_..""..msg.sender_user_id_,240,true)  
local Text= [[
܁༯┆هلو عمري 💞 ܰ
܁༯┆يمكنك اضافة ܊
▹ `#rdphoto` 𖤱 ܁ تعليق الصوره
▹ `#username` 𖤱 ܁ اسم المستخدم
▹ `#msgs` 𖤱 ܁ عدد رسائل المستخدم
▹ `#photos` 𖤱 ܁ عدد صور المستخدم
▹ `#id` 𖤱 ܁ ايدي المستخدم
▹ `#auto` 𖤱 ܁ تفاعل المستخدم
▹ `#stast` 𖤱 ܁ موقع المستخدم
▹ `#edit` 𖤱 ܁ عدد السحكات 
▹ `#game` 𖤱 ܁ المجوهرات
•━━━━━━𖥠━━━━━━•
܁༯┆ارسل تغير الايدي ليتم تغير الايدي 💞 ܰ 
]]
send(msg.chat_id_, msg.id_,Text)
return false  
elseif text == 'تغير الايدي' and Mod(msg) then 
local List = {
[[
⚕゠𝚄𝚂𝙴𝚁 𖨈 #username 𖥲 .
゠𝙼𝚂𝙶 𖨈 #msgs 𖥲 .
゠𝚂𝚃𝙰 𖨈 #stast 𖥲 .
゠𝙸𝙳 𖨈 #id 𖥲 .
]],
[[
▹ 𝙐????𝙍 𖨄 #username 𖤾.
▹ 𝙈𝙎𝙂 𖨄 #msgs 𖤾.
▹ 𝙎𝙏𝘼 𖨄 #stast 𖤾.
▹ 𝙄𝘿 ?? #id 𖤾.
]],
[[
┌ 𝐔𝐒𝐄𝐑 𖤱 #username 𖦴 .
├ 𝐌𝐒𝐆 𖤱 #msgs 𖦴 .
├ 𝐒𝐓𝐀 𖤱 #stast 𖦴 .
└ 𝐈𝐃 𖤱 #id 𖦴 .
]],
[[
- 𓏬 𝐔𝐬𝐄𝐫 : #username ?? .
- 𓏬 𝐌𝐬𝐆  : #msgs 𓂅 .
- 𓏬 𝐒𝐭𝐀 : #stast 𓂅 .
- 𓏬 𝐈𝐃 : #id 𓂅 .
]],
[[
.𖣂 𝙪𝙨𝙚𝙧𝙣𝙖𝙢?? , #username  
.𖣂 𝙨𝙩𝙖𝙨𝙩 , #stast  
.𖣂 𝙡𝘿 , #id  
.𖣂 𝙂𝙖𝙢𝙨 , #game 
.𖣂 𝙢𝙨𝙂𝙨 , #msgs
]]}
local Text_Rand = List[math.random(#List)]
redis:set(JoKeR.."KLISH:ID"..msg.chat_id_,Text_Rand)
send(msg.chat_id_, msg.id_,'܁༯┆تم تغير الايدي ܊ قم بالتجربه ܊ 💞 ܰ')
end
if text == 'حذف الايدي' or text == 'مسح الايدي' then
if Owners(msg) then
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
redis:del(JoKeR.."KLISH:ID"..msg.chat_id_)
send(msg.chat_id_, msg.id_, '܁༯┆ تم ازالة كليشة الايدي 💞 ܰ')
end
return false  
end 

if redis:get(JoKeR.."CHENG:ID"..msg.chat_id_..""..msg.sender_user_id_) then 
if text == 'الغاء' then 
send(msg.chat_id_, msg.id_,"܁༯┆تم الغاء تعين الايدي 💞 ܰ ") 
redis:del(JoKeR.."CHENG:ID"..msg.chat_id_..""..msg.sender_user_id_) 
return false  
end 
redis:del(JoKeR.."CHENG:ID"..msg.chat_id_..""..msg.sender_user_id_) 
local CHENGER_ID = text:match("(.*)")  
redis:set(JoKeR.."KLISH:ID"..msg.chat_id_,CHENGER_ID)
send(msg.chat_id_, msg.id_,'܁༯┆تم تعين الايدي بنجاح 💞 ܰ ')    
end

if text == 'مسح البوتات' or text == 'طرد البوتات' and Mod(msg) then 
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
tdcli_function ({ ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID,filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,tah)  
local admins = tah.members_  
local x = 0
local c = 0
for i=0 , #admins do 
if tah.members_[i].status_.ID == "ChatMemberStatusEditor" then  
x = x + 1 
end
if tonumber(admins[i].user_id_) ~= tonumber(JoKeR) then
chat_kick(msg.chat_id_,admins[i].user_id_)
end
c = c + 1
end     
if (c - x) == 0 then
send(msg.chat_id_, msg.id_, "܁༯┆لا توجد بوتات في المجموعه 💞 ܰ")
else
local t = '܁༯┆تم مسح البوتات 💞 ܰ'
send(msg.chat_id_, msg.id_,t) 
end 
end,nil)  
end   
end
if text == ("كشف البوتات") and Mod(msg) then  
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
tdcli_function ({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID,filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(extra,result,success)
local admins = result.members_  
text = "\n܁༯┆قائمة البوتات الموجودة  ▿ 💞 ܰ\n܀⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤܀\n"
local n = 0
local t = 0
for i=0 , #admins do 
n = (n + 1)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_
},function(arg,ta) 
if result.members_[i].status_.ID == "ChatMemberStatusMember" then  
tr = ''
elseif result.members_[i].status_.ID == "ChatMemberStatusEditor" then  
t = t + 1
tr = '܊'
end
text = text.."𖠵 ◜ [@"..ta.username_..']◞. '..tr.."\n"
if #admins == 0 then
send(msg.chat_id_, msg.id_, "܁༯┆لاتوجد بوتات مضافةه  💞 ܰ")
return false 
end
if #admins == i then 
local a = '\n•━━━━━━━━━━━━•\n܁༯┆عدد البوتات في المجموعةه  ˼ '..n..' ˹\n'
local f = '܁༯┆عدد البوتات المرفوعه   ˼ '..t..' ˹\n܁༯┆◝*܊*◟ تعني ان البوت ادمن في المجموعة'
send(msg.chat_id_, msg.id_, text..a..f)
end
end,nil)
end
end,nil)
end

if redis:get(JoKeR.."Set:Rules:" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == 'الغاء' then 
send(msg.chat_id_, msg.id_, "܁༯┆تم الغاء حفظ القوانين 💞 ܰ ") 
redis:del(JoKeR.."Set:Rules:" .. msg.chat_id_ .. ":" .. msg.sender_user_id_)
return false  
end 
redis:set(JoKeR.."Set:Rules:Group" .. msg.chat_id_,text) 
send(msg.chat_id_, msg.id_,"܁༯┆تم حفض القوانين ܊ قم بالتجربه ܊ 💞 ܰ") 
redis:del(JoKeR.."Set:Rules:" .. msg.chat_id_ .. ":" .. msg.sender_user_id_)
end  

if text == 'ضع قوانين' or text == 'وضع قوانين' then 
if Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
redis:setex(JoKeR.."Set:Rules:" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_,msg.id_,"܁༯┆ههلو عمري 💞 ܰ \n܁༯┆ قم بارسل القوانين الان 💞 ܰ")  
end
end
if text == 'مسح القوانين' or text == 'حذف القوانين' then  
if Mod(msg) then
send(msg.chat_id_, msg.id_,"܁༯┆تم حذف القوانين 💞 ܰ ")  
redis:del(JoKeR.."Set:Rules:Group"..msg.chat_id_) 
end
end
if text == 'القوانين' then 
local Set_Rules = redis:get(JoKeR.."Set:Rules:Group" .. msg.chat_id_)   
if Set_Rules then     
send(msg.chat_id_,msg.id_, Set_Rules)   
else      
send(msg.chat_id_, msg.id_,"܁༯┆لايوجد قوانين 💞 ܰ ")   
end    
end
if text == 'تفعيل الزخرفه' and Mod(msg) then  
send(msg.chat_id_, msg.id_, '܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم تفعيل الزخرفه 💞 ܰ ')
redis:set(JoKeR..'JoKeR:Zhrfa'..msg.chat_id_)
end
if text == 'تعطيل الزخرفه' and Mod(msg) then  
send(msg.chat_id_, msg.id_, '܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم تعطيل الزخرفه 💞 ܰ')
redis:del(JoKeR..'JoKeR:Zhrfa'..msg.chat_id_, true)
end
if text and text:match("^زخرفه انكلش (.*)$") and redis:get(JoKeR..'JoKeR:Zhrfa'..msg.chat_id_) then
local textZzZ = text:match("^زخرفه انكلش (.*)$")
zh = https.request('https://hso.mohammed-api.com/API/apiZagrfaEnglishe.php?text='..URL.escape(textZzZ)..'')
zx = JSON.decode(zh)
t = "\n٭ 𖤓┆قائمة الزخرفةه 💞◟\n܀⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤܀\n"
i = 0
for k,v in pairs(zx.ok) do
i = i + 1
t = t..i.."゠`"..v.."` \n"
end
send(msg.chat_id_, msg.id_, t)
end
----- 
if text and text:match("^زخرفه عربي (.*)$") and redis:get(JoKeR..'JoKeR:Zhrfa'..msg.chat_id_) then
local textZzZ = text:match("^زخرفه عربي (.*)$")
zh = https.request('https://hso.mohammed-api.com/API/apiZagrfaArbey.php?text='..URL.escape(textZzZ)..'')
zx = JSON.decode(zh)
t = "\n٭ 𖤓┆قائمة الزخرفةه 💞◟\n܀⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤܀\n"
i = 0
for k,v in pairs(zx.ok) do
i = i + 1
t = t..i.."゠ `"..v.."` \n"
end
send(msg.chat_id_, msg.id_, t)
end
if text == 'طرد المحذوفين' or text == 'مسح المحذوفين' then  
if Mod(msg) then    
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),offset_ = 0,limit_ = 1000}, function(arg,del)
for k, v in pairs(del.members_) do
tdcli_function({ID = "GetUser",user_id_ = v.user_id_},function(b,data) 
if data.first_name_ == false then
Group_Kick(msg.chat_id_, data.id_)
end
end,nil)
end
send(msg.chat_id_, msg.id_,'܁༯┆تم طرد المحذوفين 💞 ܰ')
end,nil)
end
end
if text == 'الصلاحيات' and Mod(msg) then 
local list = redis:smembers(JoKeR..'Coomds'..msg.chat_id_)
if #list == 0 then
send(msg.chat_id_, msg.id_,'܁༯┆لا توجد صلاحيات مضافه💞 ܰ')
return false
end
t = "\n܁༯┆ قائمة الصلاحيات المضافه \n܀⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤܀\n"
for k,v in pairs(list) do
var = redis:get(JoKeR.."Comd:New:rt:bot:"..v..msg.chat_id_)
if var then
t = t..''..k..'- '..v..' ▸ ('..var..')\n'
else
t = t..''..k..'- '..v..'\n'
end
end
send(msg.chat_id_, msg.id_,t)
end
if text and text:match("^اضف صلاحيه (.*)$") and Mod(msg) then 
ComdNew = text:match("^اضف صلاحيه (.*)$")
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
redis:set(JoKeR.."Comd:New:rt"..msg.chat_id_..msg.sender_user_id_,ComdNew)  
redis:sadd(JoKeR.."Coomds"..msg.chat_id_,ComdNew)  
redis:setex(JoKeR.."Comd:New"..msg.chat_id_..""..msg.sender_user_id_,200,true)  
send(msg.chat_id_, msg.id_, "܁༯┆ارسل الي رتبت الصلاحيةه 💞 ܰ\n܁༯┆{عـضـو -- ممـيـز -- ادمـن -- مـديـر} 💞 ܰ") 
end
if text and text:match("^مسح صلاحيه (.*)$") and Mod(msg) then 
ComdNew = text:match("^مسح صلاحيه (.*)$")
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
redis:del(JoKeR.."Comd:New:rt:bot:"..ComdNew..msg.chat_id_)
send(msg.chat_id_, msg.id_, "܁༯┆تم مسح الصلاحيةه 💞 ܰ") 
end
if redis:get(JoKeR.."Comd:New"..msg.chat_id_..""..msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
send(msg.chat_id_, msg.id_,"܁༯┆تم الغاء الامر 💞 ܰ") 
redis:del(JoKeR.."Comd:New"..msg.chat_id_..""..msg.sender_user_id_) 
return false  
end 
if text == 'مدير' then
if not Constructor(msg) then
send(msg.chat_id_, msg.id_"*܁༯┆تستطيع اضافه صلاحيات {ادمن - مميز - عضو} 💞 ܰ\n܁༯┆ارسل الصلاحيه مجددا💞 ܰ*\n") 
return false
end
end
if text == 'ادمن' then
if not Owners(msg) then 
send(msg.chat_id_, msg.id_,"*܁༯┆ تستطيع اضافه صلاحيات {مميز - عضو} \n܁༯┆ ارسل الصلاحيه مجددا*\n") 
return false
end
end
if text == 'مميز' then
if not Mod(msg) then
send(msg.chat_id_, msg.id_,"*܁༯┆ تستطيع اضافه صلاحيات {عضو} \n܁༯┆ ارسل الصلاحيه مجددا*\n") 
return false
end
end
if text == 'مدير' or text == 'ادمن' or text == 'مميز' or text == 'عضو' then
local textn = redis:get(JoKeR.."Comd:New:rt"..msg.chat_id_..msg.sender_user_id_)  
redis:set(JoKeR.."Comd:New:rt:bot:"..textn..msg.chat_id_,text)
send(msg.chat_id_, msg.id_, "܁༯┆ تـم اضـافـه الامـر √") 
redis:del(JoKeR.."Comd:New"..msg.chat_id_..""..msg.sender_user_id_) 
return false  
end 
end
if text and text:match('رفع (.*)') and tonumber(msg.reply_to_message_id_) > 0 and Mod(msg) then 
local RTPA = text:match('رفع (.*)')
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
if redis:sismember(JoKeR..'Coomds'..msg.chat_id_,RTPA) then
function by_reply(extra, result, success)   
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local blakrt = redis:get(JoKeR.."Comd:New:rt:bot:"..RTPA..msg.chat_id_)
if blakrt == 'مميز' and Mod(msg) then
send(msg.chat_id_, msg.id_,'\n??┆ العضو ▸ ['..data.first_name_..'](t.me/'..(data.username_ or 'JoKeR_aHs')..')'..'\n܁༯┆ تم رفعه '..RTPA..' هنا\n')   
redis:set(JoKeR.."Comd:New:rt:user:"..msg.chat_id_..result.sender_user_id_,RTPA) 
redis:sadd(JoKeR..'Vips:User'..msg.chat_id_,result.sender_user_id_)  
elseif blakrt == 'ادمن' and Owners(msg) then 
send(msg.chat_id_, msg.id_,'\n܁༯┆ العضو ▸ ['..data.first_name_..'](t.me/'..(data.username_ or 'JoKeR_aHs')..')'..'\n܁༯┆ تم رفعه '..RTPA..' هنا\n')   
redis:set(JoKeR.."Comd:New:rt:user:"..msg.chat_id_..result.sender_user_id_,RTPA)
redis:sadd(JoKeR..'Mod:User'..msg.chat_id_,result.sender_user_id_)  
elseif blakrt == 'مدير' and Constructor(msg) then
send(msg.chat_id_, msg.id_,'\n܁༯┆ العضو ▸ ['..data.first_name_..'](t.me/'..(data.username_ or 'JoKeR_aHs')..')'..'\n܁༯┆ تم رفعه '..RTPA..' هنا\n')   
redis:set(JoKeR.."Comd:New:rt:user:"..msg.chat_id_..result.sender_user_id_,RTPA)  
redis:sadd(JoKeR..'Owners'..msg.chat_id_,result.sender_user_id_)  
elseif blakrt == 'عضو' and Mod(msg) then
send(msg.chat_id_, msg.id_,'\n܁༯┆ العضو ▸ ['..data.first_name_..'](t.me/'..(data.username_ or 'JoKeR_aHs')..')'..'\n܁༯┆ تم رفعه '..RTPA..' هنا\n')   
end
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text and text:match('تنزيل (.*)') and tonumber(msg.reply_to_message_id_) > 0 and Mod(msg) then 
local RTPA = text:match('تنزيل (.*)')
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
if redis:sismember(JoKeR..'Coomds'..msg.chat_id_,RTPA) then
function by_reply(extra, result, success)   
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local blakrt = redis:get(JoKeR.."Comd:New:rt:bot:"..RTPA..msg.chat_id_)
if blakrt == 'مميز' and Mod(msg) then
send(msg.chat_id_, msg.id_,'\n܁༯┆ العضو ▸ ['..data.first_name_..'](t.me/'..(data.username_ or 'JoKeR_aHs')..')'..'\n܁༯┆ تم تنزيله من '..RTPA..' هنا\n')   
redis:srem(JoKeR..'Vips:User'..msg.chat_id_,result.sender_user_id_)  
redis:del(JoKeR.."Comd:New:rt:user:"..msg.chat_id_..result.sender_user_id_)
elseif blakrt == 'ادمن' and Owners(msg) then 
send(msg.chat_id_, msg.id_,'\n܁༯┆ العضو ▸ ['..data.first_name_..'](t.me/'..(data.username_ or 'JoKeR_aHs')..')'..'\n܁༯┆ تم تنزيله من '..RTPA..' هنا\n')   
redis:srem(JoKeR..'Mod:User'..msg.chat_id_,result.sender_user_id_) 
redis:del(JoKeR.."Comd:New:rt:user:"..msg.chat_id_..result.sender_user_id_)
elseif blakrt == 'مدير' and Constructor(msg) then
send(msg.chat_id_, msg.id_,'\n܁༯┆ العضو ▸ ['..data.first_name_..'](t.me/'..(data.username_ or 'JoKeR_aHs')..')'..'\n܁༯┆ تم تنزيله من '..RTPA..' هنا\n')   
redis:srem(JoKeR..'Owners'..msg.chat_id_,result.sender_user_id_)  
redis:del(JoKeR.."Comd:New:rt:user:"..msg.chat_id_..result.sender_user_id_)
elseif blakrt == 'عضو' and Mod(msg) then
send(msg.chat_id_, msg.id_,'\n܁༯┆ العضو ▸ ['..data.first_name_..'](t.me/'..(data.username_ or 'JoKeR_aHs')..')'..'\n܁༯┆ تم تنزيله من '..RTPA..' هنا\n')   
end
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text and text:match('^رفع (.*) @(.*)') and Mod(msg) then 
local text1 = {string.match(text, "^(رفع) (.*) @(.*)$")}
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
if redis:sismember(JoKeR..'Coomds'..msg.chat_id_,text1[2]) then
function py_username(extra, result, success)   
if result.id_ then
local blakrt = redis:get(JoKeR.."Comd:New:rt:bot:"..text1[2]..msg.chat_id_)
if blakrt == 'مميز' and Mod(msg) then
send(msg.chat_id_, msg.id_,'\n܁༯┆ العضو ▸ ['..result.title_..'](t.me/'..(text1[3] or 'JoKeR_aHs')..')'..'\n܁༯┆ تم رفعه '..text1[2]..' هنا')   
redis:sadd(JoKeR..'Vips:User'..msg.chat_id_,result.id_)  
redis:set(JoKeR.."Comd:New:rt:user:"..msg.chat_id_..result.id_,text1[2])
elseif blakrt == 'ادمن' and Owners(msg) then 
send(msg.chat_id_, msg.id_,'\n܁༯┆ العضو ▸ ['..result.title_..'](t.me/'..(text1[3] or 'JoKeR_aHs')..')'..'\n܁༯┆ تم رفعه '..text1[2]..' هنا')   
redis:sadd(JoKeR..'Mod:User'..msg.chat_id_,result.id_)  
redis:set(JoKeR.."Comd:New:rt:user:"..msg.chat_id_..result.id_,text1[2])
elseif blakrt == 'مدير' and Constructor(msg) then
send(msg.chat_id_, msg.id_,'\n܁༯┆ العضو ▸ ['..result.title_..'](t.me/'..(text1[3] or 'JoKeR_aHs')..')'..'\n܁༯┆ تم رفعه '..text1[2]..' هنا')   
redis:sadd(JoKeR..'Owners'..msg.chat_id_,result.id_)  
redis:set(JoKeR.."Comd:New:rt:user:"..msg.chat_id_..result.id_,text1[2])
elseif blakrt == 'عضو' and Mod(msg) then
send(msg.chat_id_, msg.id_,'\n܁༯┆ العضو ▸ ['..result.title_..'](t.me/'..(text1[3] or 'JoKeR_aHs')..')'..'\n܁༯┆ تم رفعه '..text1[2]..' هنا')   
end
else
info = '܁༯┆ المعرف غلط'
send(msg.chat_id_, msg.id_,info)
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = text1[3]},py_username,nil) 
end 
end
if text and text:match('^تنزيل (.*) @(.*)') and Mod(msg) then 
local text1 = {string.match(text, "^(تنزيل) (.*) @(.*)$")}
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
if redis:sismember(JoKeR..'Coomds'..msg.chat_id_,text1[2]) then
function py_username(extra, result, success)   
if result.id_ then
local blakrt = redis:get(JoKeR.."Comd:New:rt:bot:"..text1[2]..msg.chat_id_)
if blakrt == 'مميز' and Mod(msg) then
send(msg.chat_id_, msg.id_,'\n܁༯┆ العضو ▸ ['..result.title_..'](t.me/'..(text1[3] or 'JoKeR_aHs')..')'..'\n܁༯┆ تم تنريله من '..text1[2]..' هنا')   
redis:srem(JoKeR..'Vips:User'..msg.chat_id_,result.id_)  
redis:del(JoKeR.."Comd:New:rt:user:"..msg.chat_id_..result.id_)
elseif blakrt == 'ادمن' and Owners(msg) then 
send(msg.chat_id_, msg.id_,'\n܁༯┆ العضو ▸ ['..result.title_..'](t.me/'..(text1[3] or 'JoKeR_aHs')..')'..'\n܁༯┆ تم تنريله من '..text1[2]..' هنا')   
redis:srem(JoKeR..'Mod:User'..msg.chat_id_,result.id_)  
redis:del(JoKeR.."Comd:New:rt:user:"..msg.chat_id_..result.id_)
elseif blakrt == 'مدير' and Constructor(msg) then
send(msg.chat_id_, msg.id_,'\n܁༯┆ العضو ▸ ['..result.title_..'](t.me/'..(text1[3] or 'JoKeR_aHs')..')'..'\n܁༯┆ تم تنريله من '..text1[2]..' هنا')   
redis:srem(JoKeR..'Owners'..msg.chat_id_,result.id_)  
redis:del(JoKeR.."Comd:New:rt:user:"..msg.chat_id_..result.id_)
elseif blakrt == 'عضو' and Mod(msg) then
send(msg.chat_id_, msg.id_,'\n܁༯┆ العضو ▸ ['..result.title_..'](t.me/'..(text1[3] or 'JoKeR_aHs')..')'..'\n܁༯┆ تم تنريله من '..text1[2]..' هنا')   
end
else
info = '܁༯┆ المعرف غلط'
send(msg.chat_id_, msg.id_,info)
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = text1[3]},py_username,nil) 
end  
end
if text == "مسح رسايلي" or text == "مسح رسائلي" or text == "حذف رسايلي" or text == "حذف رسائلي" then  
send(msg.chat_id_, msg.id_,'܁༯┆تم مسح جميع رسائلك 💞 ܰ')  
redis:del(JoKeR..'Msg_User'..msg.chat_id_..':'..msg.sender_user_id_) 
end
if text == "رسايلي" or text == "رسائلي" or text == "msg" then 
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
send(msg.chat_id_, msg.id_,'܁༯┆عدد رسائل الحلو ◃ ['..redis:get(JoKeR..'Msg_User'..msg.chat_id_..':'..msg.sender_user_id_)..'](https://t.me/joinchat/AAAAAEvr1yqOypm-uHojPA) 💞 ܰ' ) 
end 
if text == 'تفعيل الاذاعه' and Sudo_JoKeR(msg) then  
if redis:get(JoKeR..'Bc:Bots') then
redis:del(JoKeR..'Bc:Bots') 
Text = '\n܁༯┆هلو عمري  💞 ܰ\n܁༯┆تم تفعيل الاذاعةه 💞 ܰ' 
else
Text = '\n܁༯┆هلو عمري  💞 ܰ\n܁༯┆ بالتاكيد تم تفعيل الاذاعةه 💞 ܰ '
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تعطيل الاذاعه' and Sudo_JoKeR(msg) then  
if not redis:get(JoKeR..'Bc:Bots') then
redis:set(JoKeR..'Bc:Bots',true) 
Text = '\n܁༯┆تم تعطيل الاذاعةه  💞 ܰ' 
else
Text = '\n܁༯┆بالتأكيد تم تعطيل الاذاعةه 💞 ܰ '
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تفعيل التواصل' and Sudo_JoKeR(msg) then  
if redis:get(JoKeR..'Tuasl:Bots') then
redis:del(JoKeR..'Tuasl:Bots') 
Text = '\n܁༯┆تم تفعيل التواصل 💞 ܰ ' 
else
Text = '\n܁༯┆بالتأكيد تم تفعيل التواصل 💞 ܰ '
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تعطيل التواصل' and Sudo_JoKeR(msg) then  
if not redis:get(JoKeR..'Tuasl:Bots') then
redis:set(JoKeR..'Tuasl:Bots',true) 
Text = '\n܁༯┆تم تعطيل التواصل 💞 ܰ ' 
else
Text = '\n܁༯┆بالتأكيد تم تعطيل التواصل 💞 ܰ '
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تفعيل البوت خدمي' and Sudo_JoKeR(msg) then  
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
if redis:get(JoKeR..'Free:Bots') then
redis:del(JoKeR..'Free:Bots') 
Text = '\n܁༯┆تم تفعيل البوت الخدمي 💞 ܰ  ' 
else
Text = '\n܁༯┆بالتأكيد تم تفعيل البوت الخدمي 💞 ܰ  '
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تعطيل البوت خدمي' and Sudo_JoKeR(msg) then  
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
if not redis:get(JoKeR..'Free:Bots') then
redis:set(JoKeR..'Free:Bots',true) 
Text = '\n܁༯┆تم تعطيل البوت الخدمي 💞 ܰ ' 
else
Text = '\n܁༯┆بالتأكيد تم تعطيل البوت الخدمي 💞 ܰ '
end
send(msg.chat_id_, msg.id_,Text) 
end
if text and text:match('^تنظيف (%d+)$') and Owners(msg) then
local num = tonumber(text:match('^تنظيف (%d+)$')) 
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
if num > 1000 then 
send(msg.chat_id_, msg.id_,'܁༯┆تستطيع تنظيف  ◞1000◜ كحد اقصئ 💞 ܰ ')
return false  
end  
local msgm = msg.id_
for i=1,tonumber(num) do
DeleteMessage(msg.chat_id_, {[0] = msgm})
msgm = msgm - 1048576
end
send(msg.chat_id_,msg.id_,'┐ هلو عمري 💞 ٭ \n┘ تم تنظيف ◞ ['..num..'](https://t.me/joinchat/AAAAAEvr1yqOypm-uHojPA) ◜ رسالة ✓ ٭')
end
if text == "تغير اسم البوت" or text == "تغيير اسم البوت" then 
if Sudo_JoKeR(msg) then
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
redis:setex(JoKeR..'Set:Name:Bot'..msg.sender_user_id_,300,true) 
send(msg.chat_id_, msg.id_,"܁༯┆ارسل الي الاسم الان ?? ܰ ")  
end
return false
end

if text == ""..(redis:get(JoKeR..'Name:Bot') or 'جوكر').."" then  
Namebot = (redis:get(JoKeR..'Name:Bot') or 'جوكر')
local JoKeR_Msg = {
'عمغي 🥺💞💞 .',
'هلا ابو الحب ??💘 .'
}
send(msg.chat_id_, msg.id_,'['..JoKeR_Msg[math.random(#JoKeR_Msg)]..']') 
return false
end
if text=="اذاعه خاص" and msg.reply_to_message_id_ == 0 and Sudo(msg) then 
if redis:get(JoKeR..'Bc:Bots') and not Sudo_JoKeR(msg) then 
send(msg.chat_id_, msg.id_,'܁༯┆ ههلو ععمري  💞 ܰ\n܁༯┆ الاذاعةه معطلة من المطور الاساسي 😹😔 ܰ')
return false
end
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
redis:setex(JoKeR.."Send:Bc:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_,"܁༯┆هلو عمري 💞 ܰ\n܁༯┆ارسل لي سواء كان . .\n܁༯┆ملصق ◃ متحركة ◃ فيد ◃ صوره ◃ رسالة ܊\n܁༯┆للخروج ارسل ܊ الغاء ܊") 
return false
end
if text=="اذاعه بالتثبيت" and msg.reply_to_message_id_ == 0 and Sudo_JoKeR(msg) then
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت ??.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
redis:setex(JoKeR.."Bc:Grops:Pin" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_,"܁༯┆هلو عمري 💞 ܰ\n܁༯┆ارسل لي سواء كان . .\n܁༯┆ملصق ◃ متحركة ◃ فيد ◃ صوره ◃ رسالة ܊\n܁༯┆للخروج ارسل ܊ الغاء ܊") 
return false
end 
if text=="اذاعه" and msg.reply_to_message_id_ == 0 and Sudo(msg) then 
if redis:get(JoKeR..'Bc:Bots') and not Sudo_JoKeR(msg) then 
send(msg.chat_id_, msg.id_,'܁༯┆ ههلو ععمري  💞 ܰ\n܁༯┆ الاذاعةه معطلة من المطور الاساسي 😹😔 ܰ')
return false
end
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
redis:setex(JoKeR.."Send:Bc:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_,"܁༯┆هلو عمري 💞 ܰ\n܁༯┆ارسل لي سواء كان . .\n܁༯┆ملصق ◃ متحركة ◃ فيد ◃ صوره ◃ رسالة ܊\n܁༯┆للخروج ارسل ܊ الغاء ܊") 
return false
end  
if text=="اذاعه بالتوجيه" and msg.reply_to_message_id_ == 0  and Sudo(msg) then 
if redis:get(JoKeR..'Bc:Bots') and not Sudo_JoKeR(msg) then 
send(msg.chat_id_, msg.id_,'܁༯┆ ههلو ععمري  💞 ܰ\n܁༯┆ الاذاعةه معطلة من المطور الاساسي 😹😔 ܰ')
return false
end
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
redis:setex(JoKeR.."Send:Fwd:Grops" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_,"܁༯┆ ههلو ععمري 💞 ܰ\n܁༯┆ ارسل التوجيةه الي الان 💞 ܰ") 
return false
end 
if text=="اذاعه بالتوجيه خاص" and msg.reply_to_message_id_ == 0  and Sudo(msg) then 
if redis:get(JoKeR..'Bc:Bots') and not Sudo_JoKeR(msg) then 
send(msg.chat_id_, msg.id_,'܁༯┆ ههلو ععمري  💞 ܰ\n܁༯┆ الاذاعةه معطلة من المطور الاساسي 😹😔 ܰ')
return false
end
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
redis:setex(JoKeR.."Send:Fwd:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_,"܁༯┆ ههلو ععمري ?? ܰ\n܁༯┆ ارسل التوجيةه الي الان 💞 ܰ") 
return false
end 
if text and text:match('^ضع اسم (.*)') and Owners(msg) or text and text:match('^وضع اسم (.*)') and Owners(msg) then 
local Name = text:match('^ضع اسم (.*)') or text:match('^وضع اسم (.*)') 
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
tdcli_function ({ ID = "ChangeChatTitle",chat_id_ = msg.chat_id_,title_ = Name },function(arg,data) 
if data.message_ == "Channel chat title can be changed by administrators only" then
send(msg.chat_id_,msg.id_,"܁༯┆البوت ليس ادمن يرجى ترقيتي 💞 ܰ")  
return false  
end 
if data.message_ == "CHAT_ADMIN_REQUIRED" then
send(msg.chat_id_,msg.id_,"܁༯┆ليس لدي صلاحيةه تغير اسم المجموعةه 😭💞 ܰ ")  
else
sebd(msg.chat_id_,msg.id_,'܁༯┆تم تغير اسم المجموعةه الى ◃ ['..Name..']')  
end
end,nil) 
end

if text == "تاك للكل" and Mod(msg) then
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''), offset_ = 0,limit_ = 200
},function(ta,hso)
local t = "\n٭ 𖤓 ┆ههلاو يَمحتحتين 💞??◟\n܀⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤܀\n"
x = 0
local list = hso.members_
for k, v in pairs(list) do
x = x + 1
if redis:get(JoKeR..'user:Name'..v.user_id_) then
t = t.."𖠵 "..x.." ◜*@"..redis:get(JoKeR..'user:Name'..v.user_id_).."*◞  💞🦄 .\n"
else
end
end
send(msg.chat_id_,msg.id_,t)
end,nil)
end

if text == ("تنزيل الكل") and msg.reply_to_message_id_ ~= 0 and Owners(msg) then
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
function start_function(extra, result, success)
if tonumber(SUDO) == tonumber(result.sender_user_id_) then
send(msg.chat_id_, msg.id_,"܁༯┆لا تستطيع تنزيل المطور ألاساسي 💞 ܰ ")
return false 
end
if redis:sismember(JoKeR..'Sudo:User',result.sender_user_id_) then
dev = ' المطور ،' else dev = '' end
if redis:sismember(JoKeR..'Basic:Constructor'..msg.chat_id_, result.sender_user_id_) then
crr = ' منشئ اساسي ،' else crr = '' end
if redis:sismember(JoKeR..'Constructor'..msg.chat_id_, result.sender_user_id_) then
cr = ' منشئ ،' else cr = '' end
if redis:sismember(JoKeR..'Owners'..msg.chat_id_, result.sender_user_id_) then
own = ' مدير ،' else own = '' end
if redis:sismember(JoKeR..'Mod:User'..msg.chat_id_, result.sender_user_id_) then
mod = ' ادمن ،' else mod = '' end
if redis:sismember(JoKeR..'Vips:User'..msg.chat_id_, result.sender_user_id_) then
vip = ' مميز ،' else vip = ''
end
if Can_or_NotCan(result.sender_user_id_,msg.chat_id_) ~= false then
send(msg.chat_id_, msg.id_,"\n܁༯┆هلو عمري 💞 ܰ\n܁༯┆تم تنزيل [العضو](https://t.me/joinchat/AAAAAEvr1yqOypm-uHojPA) 💞 ܰ\n܁༯┆ ܊  "..dev..''..crr..''..cr..''..own..''..mod..''..vip.." ܊\n")
else
send(msg.chat_id_, msg.id_,"\n܁༯┆ليس لديةه رتب حتئ استطيع تنزيل 😹😭💞 ܰ  \n")
end
if tonumber(SUDO) == tonumber(msg.sender_user_id_) then
redis:srem(JoKeR..'Sudo:User', result.sender_user_id_)
redis:srem(JoKeR..'Basic:Constructor'..msg.chat_id_,result.sender_user_id_)
redis:srem(JoKeR..'Constructor'..msg.chat_id_, result.sender_user_id_)
redis:srem(JoKeR..'Owners'..msg.chat_id_, result.sender_user_id_)
redis:srem(JoKeR..'Mod:User'..msg.chat_id_, result.sender_user_id_)
redis:srem(JoKeR..'Vips:User'..msg.chat_id_, result.sender_user_id_)
elseif redis:sismember(JoKeR..'Sudo:User',msg.sender_user_id_) then
redis:srem(JoKeR..'Mod:User'..msg.chat_id_, result.sender_user_id_)
redis:srem(JoKeR..'Vips:User'..msg.chat_id_, result.sender_user_id_)
redis:srem(JoKeR..'Owners'..msg.chat_id_, result.sender_user_id_)
redis:srem(JoKeR..'Constructor'..msg.chat_id_, result.sender_user_id_)
redis:srem(JoKeR..'Basic:Constructor'..msg.chat_id_,result.sender_user_id_)
elseif redis:sismember(JoKeR..'Basic:Constructor'..msg.chat_id_, msg.sender_user_id_) then
redis:srem(JoKeR..'Mod:User'..msg.chat_id_, result.sender_user_id_)
redis:srem(JoKeR..'Vips:User'..msg.chat_id_, result.sender_user_id_)
redis:srem(JoKeR..'Owners'..msg.chat_id_, result.sender_user_id_)
redis:srem(JoKeR..'Constructor'..msg.chat_id_, result.sender_user_id_)
elseif redis:sismember(JoKeR..'Constructor'..msg.chat_id_, msg.sender_user_id_) then
redis:srem(JoKeR..'Mod:User'..msg.chat_id_, result.sender_user_id_)
redis:srem(JoKeR..'Vips:User'..msg.chat_id_, result.sender_user_id_)
redis:srem(JoKeR..'Owners'..msg.chat_id_, result.sender_user_id_)
elseif redis:sismember(JoKeR..'Owners'..msg.chat_id_, msg.sender_user_id_) then
redis:srem(JoKeR..'Mod:User'..msg.chat_id_, result.sender_user_id_)
redis:srem(JoKeR..'Vips:User'..msg.chat_id_, result.sender_user_id_)
end
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
end


if text == ("مسح ردود المطور") and Sudo_JoKeR(msg) then 
local list = redis:smembers(JoKeR..'List:Rd:Sudo')
for k,v in pairs(list) do
redis:del(JoKeR.."Add:Rd:Sudo:Gif"..v)   
redis:del(JoKeR.."Add:Rd:Sudo:vico"..v)   
redis:del(JoKeR.."Add:Rd:Sudo:stekr"..v)     
redis:del(JoKeR.."Add:Rd:Sudo:Text"..v)   
redis:del(JoKeR.."Add:Rd:Sudo:Photo"..v)
redis:del(JoKeR.."Add:Rd:Sudo:Video"..v)
redis:del(JoKeR.."Add:Rd:Sudo:File"..v)
redis:del(JoKeR.."Add:Rd:Sudo:Audio"..v)
redis:del(JoKeR..'List:Rd:Sudo')
end
send(msg.chat_id_, msg.id_,"܁༯┆تم مسح ردود المطور💞 ܰ ")
end

if text == ("ردود المطور") and Sudo_JoKeR(msg) then 
local list = redis:smembers(JoKeR..'List:Rd:Sudo')
text = "\n٭ 𖤓┆قائمة ردود المطور 💞💞◟\n܀⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤܀\n"
for k,v in pairs(list) do
if redis:get(JoKeR.."Add:Rd:Sudo:Gif"..v) then
db = 'متحركه 🎭'
elseif redis:get(JoKeR.."Add:Rd:Sudo:vico"..v) then
db = 'بصمه 📢'
elseif redis:get(JoKeR.."Add:Rd:Sudo:stekr"..v) then
db = 'ملصق 🃏'
elseif redis:get(JoKeR.."Add:Rd:Sudo:Text"..v) then
db = 'رساله ✉'
elseif redis:get(JoKeR.."Add:Rd:Sudo:Photo"..v) then
db = 'صوره 🎇'
elseif redis:get(JoKeR.."Add:Rd:Sudo:Video"..v) then
db = 'فيديو 📹'
elseif redis:get(JoKeR.."Add:Rd:Sudo:File"..v) then
db = 'ملف 📁'
elseif redis:get(JoKeR.."Add:Rd:Sudo:Audio"..v) then
db = 'اغنيه 🎵'
end
text = text.."𖠵 "..k.." ܊  "..v..". ◃ "..db.."  .\n"
end
if #list == 0 then
text = "܁༯┆لايوجد ردود للمطور 💞 ܰ "
end
send(msg.chat_id_, msg.id_,'['..text..']')
end
if text or msg.content_.sticker_ or msg.content_.voice_ or msg.content_.animation_ or msg.content_.audio_ or msg.content_.document_ or msg.content_.photo_ or msg.content_.video_ then  
local test = redis:get(JoKeR..'Text:Sudo:Bot'..msg.sender_user_id_..':'..msg.chat_id_)
if redis:get(JoKeR..'Set:Rd'..msg.sender_user_id_..':'..msg.chat_id_) == 'true1' then
redis:del(JoKeR..'Set:Rd'..msg.sender_user_id_..':'..msg.chat_id_)
if msg.content_.sticker_ then   
redis:set(JoKeR.."Add:Rd:Sudo:stekr"..test, msg.content_.sticker_.sticker_.persistent_id_)  
end   
if msg.content_.voice_ then  
redis:set(JoKeR.."Add:Rd:Sudo:vico"..test, msg.content_.voice_.voice_.persistent_id_)  
end   
if msg.content_.animation_ then   
redis:set(JoKeR.."Add:Rd:Sudo:Gif"..test, msg.content_.animation_.animation_.persistent_id_)  
end  
if text then   
text = text:gsub('"','') 
text = text:gsub("'",'') 
text = text:gsub('`','') 
text = text:gsub('*','') 
redis:set(JoKeR.."Add:Rd:Sudo:Text"..test, text)  
end  
if msg.content_.audio_ then
redis:set(JoKeR.."Add:Rd:Sudo:Audio"..test, msg.content_.audio_.audio_.persistent_id_)  
end
if msg.content_.document_ then
redis:set(JoKeR.."Add:Rd:Sudo:File"..test, msg.content_.document_.document_.persistent_id_)  
end
if msg.content_.video_ then
redis:set(JoKeR.."Add:Rd:Sudo:Video"..test, msg.content_.video_.video_.persistent_id_)  
end
if msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo_in_group = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
photo_in_group = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
photo_in_group = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
photo_in_group = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
redis:set(JoKeR.."Add:Rd:Sudo:Photo"..test, photo_in_group)  
end
send(msg.chat_id_, msg.id_,'܁༯┆تم حفظ الرد بنجاح 💞 ܰ ')
return false  
end  
end
if text and text:match("^(.*)$") then
if redis:get(JoKeR..'Set:Rd'..msg.sender_user_id_..':'..msg.chat_id_) == 'true' then
send(msg.chat_id_, msg.id_,'܁༯┆ارسل الرد الذي تريده 💞 ܰ\n܁༯┆سواء كان ▿\n܁༯┆[صوره](https://t.me/joinchat/AAAAAEvr1yqOypm-uHojPA) ܊ [بصمه](https://t.me/joinchat/AAAAAEvr1yqOypm-uHojPA) ܊ [فيد](https://t.me/joinchat/AAAAAEvr1yqOypm-uHojPA) ܊ [متحركه](https://t.me/joinchat/AAAAAEvr1yqOypm-uHojPA) ܊ [ملصق](https://t.me/joinchat/AAAAAEvr1yqOypm-uHojPA) ܰ')
redis:set(JoKeR..'Set:Rd'..msg.sender_user_id_..':'..msg.chat_id_, 'true1')
redis:set(JoKeR..'Text:Sudo:Bot'..msg.sender_user_id_..':'..msg.chat_id_, text)
redis:sadd(JoKeR..'List:Rd:Sudo', text)
return false end
end
if text and text:match("^(.*)$") then
if redis:get(JoKeR..'Set:On'..msg.sender_user_id_..':'..msg.chat_id_) == 'true' then
send(msg.chat_id_, msg.id_,'܁༯┆تم حذف الرد بنجاح 💞 ܰ ')
list = {"Add:Rd:Sudo:Audio","Add:Rd:Sudo:File","Add:Rd:Sudo:Video","Add:Rd:Sudo:Photo","Add:Rd:Sudo:Text","Add:Rd:Sudo:stekr","Add:Rd:Sudo:vico","Add:Rd:Sudo:Gif"}
for k,v in pairs(list) do
redis:del(JoKeR..v..text)
end
redis:del(JoKeR..'Set:On'..msg.sender_user_id_..':'..msg.chat_id_)
redis:srem(JoKeR..'List:Rd:Sudo', text)
return false
end
end
if text == 'اضف رد للكل' and Sudo_JoKeR(msg) then 
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
send(msg.chat_id_, msg.id_,'܁༯┆ههلو عمري 💞 ܰ \n܁༯┆ارسل الكلمة الذي تريد اضافتها 💞 ܰ')
redis:set(JoKeR..'Set:Rd'..msg.sender_user_id_..':'..msg.chat_id_,true)
return false 
end
if text == 'حذف رد للكل' and Sudo_JoKeR(msg) then 
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
send(msg.chat_id_, msg.id_,'܁༯┆ههلو عمري 💞 ܰ \n܁༯┆ارسل الكلمة الذي تريد حذفها 💞 ܰ')
redis:set(JoKeR..'Set:On'..msg.sender_user_id_..':'..msg.chat_id_,true)
return false 
end
if text and not redis:get(JoKeR..'Reply:Sudo'..msg.chat_id_) then
if not redis:sismember(JoKeR..'Spam:Texting'..msg.sender_user_id_,text) then
local anemi = redis:get(JoKeR.."Add:Rd:Sudo:Gif"..text)   
local veico = redis:get(JoKeR.."Add:Rd:Sudo:vico"..text)   
local stekr = redis:get(JoKeR.."Add:Rd:Sudo:stekr"..text)     
local text1 = redis:get(JoKeR.."Add:Rd:Sudo:Text"..text)   
local photo = redis:get(JoKeR.."Add:Rd:Sudo:Photo"..text)
local video = redis:get(JoKeR.."Add:Rd:Sudo:Video"..text)
local document = redis:get(JoKeR.."Add:Rd:Sudo:File"..text)
local audio = redis:get(JoKeR.."Add:Rd:Sudo:Audio"..text)
------------------------------------------------------------------------
------------------------------------------------------------------------
if text1 then 
send(msg.chat_id_, msg.id_,text1)
redis:sadd(JoKeR..'Spam:Texting'..msg.sender_user_id_,text) 
end
if stekr then 
sendSticker(msg.chat_id_, msg.id_, 0, 1, nil, stekr)   
redis:sadd(JoKeR..'Spam:Texting'..msg.sender_user_id_,text) 
end
if veico then 
sendVoice(msg.chat_id_, msg.id_, 0, 1, nil, veico)   
redis:sadd(JoKeR..'Spam:Texting'..msg.sender_user_id_,text) 
end
if video then 
sendVideo(msg.chat_id_, msg.id_, 0, 1, nil,video)
redis:sadd(JoKeR..'Spam:Texting'..msg.sender_user_id_,text) 
end
if anemi then 
sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, anemi, '', nil)  
redis:sadd(JoKeR..'Spam:Texting'..msg.sender_user_id_,text) 
end
if document then
sendDocument(msg.chat_id_, msg.id_, 0, 1,nil, document)   
redis:sadd(JoKeR..'Spam:Texting'..msg.sender_user_id_,text) 
end  
if audio then
sendAudio(msg.chat_id_,msg.id_,audio)  
redis:sadd(JoKeR..'Spam:Texting'..msg.sender_user_id_,text) 
end
if photo then
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil,photo,'')
redis:sadd(JoKeR..'Spam:Texting'..msg.sender_user_id_,text) 
end  
end
end
if text == ("مسح ردود المدير") and Owners(msg) then
local list = redis:smembers(JoKeR..'List:Owners'..msg.chat_id_..'')
for k,v in pairs(list) do
redis:del(JoKeR.."Add:Rd:Owners:Gif"..v..msg.chat_id_)   
redis:del(JoKeR.."Add:Rd:Owners:Vico"..v..msg.chat_id_)   
redis:del(JoKeR.."Add:Rd:Owners:Stekrs"..v..msg.chat_id_)     
redis:del(JoKeR.."Add:Rd:Owners:Text"..v..msg.chat_id_)   
redis:del(JoKeR.."Add:Rd:Owners:Photo"..v..msg.chat_id_)
redis:del(JoKeR.."Add:Rd:Owners:Video"..v..msg.chat_id_)
redis:del(JoKeR.."Add:Rd:Owners:File"..v..msg.chat_id_)
redis:del(JoKeR.."Add:Rd:Owners:Audio"..v..msg.chat_id_)
redis:del(JoKeR..'List:Owners'..msg.chat_id_)
end
send(msg.chat_id_, msg.id_,"܁༯┆ تم مسح ردود المدير 💞 ܰ")
end

if text == ("ردود المدير") and Owners(msg) then
local list = redis:smembers(JoKeR..'List:Owners'..msg.chat_id_..'')
text = "٭ 𖤓┆قائمة ردود المدير 💞💞◟\n܀⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤܀\n"
for k,v in pairs(list) do
if redis:get(JoKeR.."Add:Rd:Owners:Gif"..v..msg.chat_id_) then
db = 'متحركه ??'
elseif redis:get(JoKeR.."Add:Rd:Owners:Vico"..v..msg.chat_id_) then
db = 'بصمه 📢'
elseif redis:get(JoKeR.."Add:Rd:Owners:Stekrs"..v..msg.chat_id_) then
db = 'ملصق 🃏'
elseif redis:get(JoKeR.."Add:Rd:Owners:Text"..v..msg.chat_id_) then
db = 'رساله ✉'
elseif redis:get(JoKeR.."Add:Rd:Owners:Photo"..v..msg.chat_id_) then
db = 'صوره 🎇'
elseif redis:get(JoKeR.."Add:Rd:Owners:Video"..v..msg.chat_id_) then
db = 'فيديو 🎬'
elseif redis:get(JoKeR.."Add:Rd:Owners:File"..v..msg.chat_id_) then
db = 'ملف 📁'
elseif redis:get(JoKeR.."Add:Rd:Owners:Audio"..v..msg.chat_id_) then
db = 'اغنيه 🎵'
end
text = text.."܁ 𖠵 "..k.." ܊  "..v.." ◃  "..db.." \n"
end
if #list == 0 then
text = "܁༯┆لايوجد ردود للمدير 💞 ܰ"
end
send(msg.chat_id_, msg.id_,'['..text..']')
end
if text or msg.content_.sticker_ or msg.content_.voice_ or msg.content_.animation_ or msg.content_.audio_ or msg.content_.document_ or msg.content_.photo_ or msg.content_.video_ then  
local test = redis:get(JoKeR..'Text:Owners'..msg.sender_user_id_..':'..msg.chat_id_..'')
if redis:get(JoKeR..'Set:Owners:rd'..msg.sender_user_id_..':'..msg.chat_id_) == 'true1' then
redis:del(JoKeR..'Set:Owners:rd'..msg.sender_user_id_..':'..msg.chat_id_)
if msg.content_.sticker_ then   
redis:set(JoKeR.."Add:Rd:Owners:Stekrs"..test..msg.chat_id_, msg.content_.sticker_.sticker_.persistent_id_)  
end   
if msg.content_.voice_ then  
redis:set(JoKeR.."Add:Rd:Owners:Vico"..test..msg.chat_id_, msg.content_.voice_.voice_.persistent_id_)  
end   
if msg.content_.animation_ then   
redis:set(JoKeR.."Add:Rd:Owners:Gif"..test..msg.chat_id_, msg.content_.animation_.animation_.persistent_id_)  
end  
if text then   
text = text:gsub('"','') 
text = text:gsub("'",'') 
text = text:gsub('`','') 
text = text:gsub('*','') 
redis:set(JoKeR.."Add:Rd:Owners:Text"..test..msg.chat_id_, text)  
end  
if msg.content_.audio_ then
redis:set(JoKeR.."Add:Rd:Owners:Audio"..test..msg.chat_id_, msg.content_.audio_.audio_.persistent_id_)  
end
if msg.content_.document_ then
redis:set(JoKeR.."Add:Rd:Owners:File"..test..msg.chat_id_, msg.content_.document_.document_.persistent_id_)  
end
if msg.content_.video_ then
redis:set(JoKeR.."Add:Rd:Owners:Video"..test..msg.chat_id_, msg.content_.video_.video_.persistent_id_)  
end
if msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo_in_group = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
photo_in_group = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
photo_in_group = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
photo_in_group = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
redis:set(JoKeR.."Add:Rd:Owners:Photo"..test..msg.chat_id_, photo_in_group)  
end
send(msg.chat_id_, msg.id_,'܁༯┆تم حفض الرد بنجاح 💞 ܰ')
return false  
end  
end
if text and text:match("^(.*)$") then
if redis:get(JoKeR..'Set:Owners:rd'..msg.sender_user_id_..':'..msg.chat_id_) == 'true' then
send(msg.chat_id_, msg.id_,'܁༯┆ارسل الرد الذي تريده 💞 ܰ\n܁༯┆سواء كان ▿\n܁༯┆[صوره](https://t.me/joinchat/AAAAAEvr1yqOypm-uHojPA) ܊ [بصمه](https://t.me/joinchat/AAAAAEvr1yqOypm-uHojPA) ܊ [فيد](https://t.me/joinchat/AAAAAEvr1yqOypm-uHojPA) ܊ [متحركه](https://t.me/joinchat/AAAAAEvr1yqOypm-uHojPA) ܊ [ملصق](https://t.me/joinchat/AAAAAEvr1yqOypm-uHojPA) ܰ')
redis:set(JoKeR..'Set:Owners:rd'..msg.sender_user_id_..':'..msg.chat_id_,'true1')
redis:set(JoKeR..'Text:Owners'..msg.sender_user_id_..':'..msg.chat_id_, text)
redis:del(JoKeR.."Add:Rd:Owners:Gif"..text..msg.chat_id_)   
redis:del(JoKeR.."Add:Rd:Owners:Vico"..text..msg.chat_id_)   
redis:del(JoKeR.."Add:Rd:Owners:Stekrs"..text..msg.chat_id_)     
redis:del(JoKeR.."Add:Rd:Owners:Text"..text..msg.chat_id_)   
redis:del(JoKeR.."Add:Rd:Owners:Photo"..text..msg.chat_id_)
redis:del(JoKeR.."Add:Rd:Owners:Video"..text..msg.chat_id_)
redis:del(JoKeR.."Add:Rd:Owners:File"..text..msg.chat_id_)
redis:del(JoKeR.."Add:Rd:Owners:Audio"..text..msg.chat_id_)
redis:sadd(JoKeR..'List:Owners'..msg.chat_id_..'', text)
return false end
end
if text and text:match("^(.*)$") then
if redis:get(JoKeR..'Set:Owners:rd'..msg.sender_user_id_..':'..msg.chat_id_..'') == 'true2' then
send(msg.chat_id_, msg.id_,'܁༯┆تم حذف الرد بنجاح 💞 ܰ ')
redis:del(JoKeR.."Add:Rd:Owners:Gif"..text..msg.chat_id_)   
redis:del(JoKeR.."Add:Rd:Owners:Vico"..text..msg.chat_id_)   
redis:del(JoKeR.."Add:Rd:Owners:Stekrs"..text..msg.chat_id_)     
redis:del(JoKeR.."Add:Rd:Owners:Text"..text..msg.chat_id_)   
redis:del(JoKeR.."Add:Rd:Owners:Photo"..text..msg.chat_id_)
redis:del(JoKeR.."Add:Rd:Owners:Video"..text..msg.chat_id_)
redis:del(JoKeR.."Add:Rd:Owners:File"..text..msg.chat_id_)
redis:del(JoKeR.."Add:Rd:Owners:Audio"..text..msg.chat_id_)
redis:del(JoKeR..'Set:Owners:rd'..msg.sender_user_id_..':'..msg.chat_id_)
redis:srem(JoKeR..'List:Owners'..msg.chat_id_..'', text)
return false
end
end
if text == 'اضف رد' and Owners(msg) then
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
send(msg.chat_id_, msg.id_,'܁༯┆ههلو عمري 💞 ܰ \n܁༯┆ارسل الكلمة الذي تريد اضافتها 💞 ܰ')
redis:set(JoKeR..'Set:Owners:rd'..msg.sender_user_id_..':'..msg.chat_id_,true)
return false 
end
if text == 'حذف رد' and Owners(msg) then
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
send(msg.chat_id_, msg.id_,'܁༯┆ارسل الكلمةه التي تريد حذفها 💞 ܰ ')
redis:set(JoKeR..'Set:Owners:rd'..msg.sender_user_id_..':'..msg.chat_id_,'true2')
return false 
end
if text and not redis:get(JoKeR..'Reply:Owners'..msg.chat_id_) then
if not redis:sismember(JoKeR..'Spam:Texting'..msg.sender_user_id_,text) then
local anemi = redis:get(JoKeR.."Add:Rd:Owners:Gif"..text..msg.chat_id_)   
local veico = redis:get(JoKeR.."Add:Rd:Owners:Vico"..text..msg.chat_id_)   
local stekr = redis:get(JoKeR.."Add:Rd:Owners:Stekrs"..text..msg.chat_id_)     
local text1 = redis:get(JoKeR.."Add:Rd:Owners:Text"..text..msg.chat_id_)   
local photo = redis:get(JoKeR.."Add:Rd:Owners:Photo"..text..msg.chat_id_)
local video = redis:get(JoKeR.."Add:Rd:Owners:Video"..text..msg.chat_id_)
local document = redis:get(JoKeR.."Add:Rd:Owners:File"..text..msg.chat_id_)
local audio = redis:get(JoKeR.."Add:Rd:Owners:Audio"..text..msg.chat_id_)
------------------------------------------------------------------------
------------------------------------------------------------------------
if text1 then 
send(msg.chat_id_, msg.id_, text1)
redis:sadd(JoKeR..'Spam:Texting'..msg.sender_user_id_,text) 
end
if stekr then 
sendSticker(msg.chat_id_, msg.id_, 0, 1, nil, stekr)   
redis:sadd(JoKeR..'Spam:Texting'..msg.sender_user_id_,text) 
end
if veico then 
sendVoice(msg.chat_id_, msg.id_, 0, 1, nil, veico)   
redis:sadd(JoKeR..'Spam:Texting'..msg.sender_user_id_,text) 
end
if video then 
sendVideo(msg.chat_id_, msg.id_, 0, 1, nil,video)
redis:sadd(JoKeR..'Spam:Texting'..msg.sender_user_id_,text) 
end
if anemi then 
sendDocument(msg.chat_id_, msg.id_, 0, 1,nil, anemi)   
redis:sadd(JoKeR..'Spam:Texting'..msg.sender_user_id_,text) 
end
if document then
sendDocument(msg.chat_id_, msg.id_, 0, 1,nil, document)   
redis:sadd(JoKeR..'Spam:Texting'..msg.sender_user_id_,text) 
end  
if audio then
sendAudio(msg.chat_id_,msg.id_,audio)  
redis:sadd(JoKeR..'Spam:Texting'..msg.sender_user_id_,text) 
end
if photo then
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil,photo,photo_caption)
redis:sadd(JoKeR..'Spam:Texting'..msg.sender_user_id_,text) 
end  
end
end
-------------------------------
if text == ""..(redis:get(JoKeR..'Name:Bot') or 'جوكر').." غادر" or text == 'غادر' then  
if Sudo(msg) and not redis:get(JoKeR..'Left:Bot'..msg.chat_id_)  then 
tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=JoKeR,status_={ID = "ChatMemberStatusLeft"},},function(e,g) end, nil) 
send(msg.chat_id_, msg.id_,'܁༯┆باي راح اشتاقلكم 😭💞 ܰ ') 
redis:srem(JoKeR..'Chek:Groups',msg.chat_id_)  
end
return false  
end
if text == 'بوت' then
Namebot = (redis:get(JoKeR..'Name:Bot') or 'جوكر')
send(msg.chat_id_, msg.id_,'أسمي اللطيف '..Namebot..' . 𖤐◟') 
end
if text == 'الاحصائيات' then
if Sudo(msg) then 
local Groups = redis:scard(JoKeR..'Chek:Groups')  
local Users = redis:scard(JoKeR..'User_Bot')  
Text = '┐ عدد المجموعات ◃ ◞*'..Groups..'*◜ \n✛ ٭                  ٭ \n┘ عدد المشتركيين ◃ ◞*'..Users..'*◜ .'
send(msg.chat_id_, msg.id_,Text) 
end
return false
end
if text == 'المجموعات' then
if Sudo(msg) then 
local Groups = redis:scard(JoKeR..'Chek:Groups')  
local Users = redis:scard(JoKeR..'User_Bot')  
Text = '\n٭ 𖡹 ┆عدد المجموعات ◃ ◞ *'..Groups..'* ◜.'
send(msg.chat_id_, msg.id_,Text) 
end
return false
end
if text == 'المشتركين' then
if Sudo(msg) then 
local Groups = redis:scard(JoKeR..'Chek:Groups')  
local Users = redis:scard(JoKeR..'User_Bot')  
Text = '\n٭ 𖡹 ┆عدد المشتركيين ◃ ◞ *'..Users..'* ◜.'
send(msg.chat_id_, msg.id_,Text) 
end
return false
end
if text == 'تفعيل المغادره' and Sudo_JoKeR(msg) then   
if redis:get(JoKeR..'Left:Bot'..msg.chat_id_) then
Text = '܁༯┆تم تفعيل مغادرة البوت 💞 ܰ'
redis:del(JoKeR..'Left:Bot'..msg.chat_id_)  
else
Text = '܁༯┆تم تفعيل مغادرة البوت 💞 ܰ'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تعطيل المغادره' and Sudo_JoKeR(msg) then  
if not redis:get(JoKeR..'Left:Bot'..msg.chat_id_) then
Text = '܁༯┆تم تعطيل مغادرة البوت 💞 ܰ'
redis:set(JoKeR..'Left:Bot'..msg.chat_id_,true)   
else
Text = '܁༯┆تم تعطيل مغادرة البوت 💞 ܰ'
end
send(msg.chat_id_, msg.id_, Text) 
end

if text == 'تفعيل ردود المدير' and Owners(msg) then   
if redis:get(JoKeR..'Reply:Owners'..msg.chat_id_) then
Text = '܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم تفعيل ردود المدير ?? ܰ'
redis:del(JoKeR..'Reply:Owners'..msg.chat_id_)  
else
Text = '܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم تفعيل ردود المدير 💞 ܰر'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تعطيل ردود المدير' and Owners(msg) then  
if not redis:get(JoKeR..'Reply:Owners'..msg.chat_id_) then
redis:set(JoKeR..'Reply:Owners'..msg.chat_id_,true)  
Text = '\n܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم تعطيل ردود المدير 💞 ܰر' 
else
Text = '\n܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم تعطيل ردود المدير 💞 ܰ'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تفعيل ردود المطور' and Owners(msg) then   
if redis:get(JoKeR..'Reply:Sudo'..msg.chat_id_) then
redis:del(JoKeR..'Reply:Sudo'..msg.chat_id_)  
Text = '\n܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم تفعيل ردود المطور 💞 ܰ' 
else
Text = '\n܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم تفعيل ردود المطور 💞 ܰ'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تعطيل ردود المطور' and Owners(msg) then  
if not redis:get(JoKeR..'Reply:Sudo'..msg.chat_id_) then
redis:set(JoKeR..'Reply:Sudo'..msg.chat_id_,true)   
Text = '\n܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم تعطيل ردود المطور 💞 ܰ' 
else
Text = '\n܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم تعطيل ردود المطور ?? ܰ'
end
send(msg.chat_id_, msg.id_,Text) 
end

if text == 'تفعيل الايدي' and Owners(msg) then   
if redis:get(JoKeR..'Bot:Id'..msg.chat_id_)  then
redis:del(JoKeR..'Bot:Id'..msg.chat_id_) 
Text = '\n܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم تفعيل الايدي 💞 ܰ' 
else
Text = '\n܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم تفعيل الايدي ?? ܰ'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تعطيل الايدي' and Owners(msg) then  
if not redis:get(JoKeR..'Bot:Id'..msg.chat_id_)  then
redis:set(JoKeR..'Bot:Id'..msg.chat_id_,true) 
Text = '\n܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم تعطيل الايدي 💞 ܰ' 
else
Text = '\n܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم تعطيل الايدي 💞 ܰ'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'السيرفر' and Sudo_JoKeR(msg) then 
send(msg.chat_id_, msg.id_, io.popen([[
linux_version=`lsb_release -ds`
memUsedPrc=`free -m | awk 'NR==2{printf "%sMB/%sMB {%.2f%}\n", $3,$2,$3*100/$2 }'`
HardDisk=`df -lh | awk '{if ($6 == "/") { print $3"/"$2" ~ {"$5"}" }}'`
CPUPer=`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`
uptime=`uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes."}'`
echo '܁༯┆مدة تشغيل السيرفر ▾ .\n*▸  '"$linux_version"'*' 
echo '*܀⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤܀*\n܁༯┆الذاكره العشوائية ▾ .\n*▸ '"$memUsedPrc"'*'
echo '*܀⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤܀*\n܁༯┆وحدة التخزين ▾ .\n*▸ '"$HardDisk"'*'
echo '*܀⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤܀*\n܁༯┆المعالج ▾ .\n*▸ '"`grep -c processor /proc/cpuinfo`""Core ▸ $CPUPer% "'*'
echo '*܀⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤܀*\n܁༯┆الدخول ▾ . \n*▸ '`whoami`'*'
echo '*܀⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤⠤܀*\n܁༯┆مدة تشغيل السيرفر ▾ .\n*▸ '"$uptime"'*'
]]):read('*all'))  
end
---------
if text == 'تفعيل الايدي بالصوره' and Owners(msg) then   
if redis:get(JoKeR..'Bot:Id:Photo'..msg.chat_id_)  then
redis:del(JoKeR..'Bot:Id:Photo'..msg.chat_id_) 
Text = '\n܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم تفعيل الايدي بالصوره 💞 ܰ' 
else
Text = '\n܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم تفعيل الايدي بالصوره 💞 ܰ '
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تعطيل الايدي بالصوره' and Owners(msg) then  
if not redis:get(JoKeR..'Bot:Id:Photo'..msg.chat_id_)  then
redis:set(JoKeR..'Bot:Id:Photo'..msg.chat_id_,true) 
Text = '\n܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم تعطيل الايدي بالصوره 💞 ܰ' 
else
Text = '\n܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم تعطيل الايدي بالصوره 💞 ܰ'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تفعيل الحظر' and Constructor(msg) then   
if redis:get(JoKeR..'Lock:kick'..msg.chat_id_)  then
redis:del(JoKeR..'Lock:kick'..msg.chat_id_) 
Text = '\n܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم تفعيل الحظر 💞 ܰ ' 
else
Text = '\n܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم تفعيل الحظر 💞 ܰ '
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تعطيل الحظر' and Constructor(msg) then  
if not redis:get(JoKeR..'Lock:kick'..msg.chat_id_)  then
redis:set(JoKeR..'Lock:kick'..msg.chat_id_,true) 
Text = '\n܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم تعطيل الحظر 💞 ܰ' 
else
Text = '\n܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم تعطيل الحظر 💞 ܰ'
end
send(msg.chat_id_, msg.id_,Text) 
end
-----------
if msg.content_.ID == 'MessageSticker' then     
if not redis:get(JoKeR..'JoKeR:Reply:Sticker'..msg.chat_id_) then
local texting = {"دنك خلي اركبك 💕. ","تشرفت حبحب 💕.","ع راسي 💕.","عود شوفوني ثكيل وهاي .. طفي الكامرة 😹😭♥️.","كافي ملصقات 😹😭♥️. ","حبيبي ولله 😹😭♥️. " }
send(msg.chat_id_, msg.id_, ''..texting[math.random(#texting)]..'')
end
end 
---------
if text == 'تفعيل الرفع' and Constructor(msg) then   
if redis:get(JoKeR..'Lock:Add:Bot'..msg.chat_id_)  then
redis:del(JoKeR..'Lock:Add:Bot'..msg.chat_id_) 
Text = '\n܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم تفعيل امر الرفع 💞 ܰ ' 
else
Text = '\n܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم تفعيل امر الرفع 💞 ܰ '
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تعطيل الرفع' and Constructor(msg) then  
if not redis:get(JoKeR..'Lock:Add:Bot'..msg.chat_id_)  then
redis:set(JoKeR..'Lock:Add:Bot'..msg.chat_id_,true) 
Text = '\n܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم تعطيل امر الرفع 💞 ܰع' 
else
Text = '\n܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم تعطيل امر الرفع 💞 ܰع'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'ايدي' and tonumber(msg.reply_to_message_id_) > 0 then
function start_function(extra, result, success)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(extra,data) 
local Msguser = tonumber(redis:get(JoKeR..'Msg_User'..msg.chat_id_..':'..result.sender_user_id_) or 1) 
local Contact = tonumber(redis:get(JoKeR..'Add:Contact'..msg.chat_id_..':'..result.sender_user_id_) or 0) 
local NUMPGAME = tonumber(redis:get(JoKeR..'NUM:GAMES'..msg.chat_id_..result.sender_user_id_) or 0)
local edit = tonumber(redis:get(JoKeR..'edits'..msg.chat_id_..result.sender_user_id_) or 0)
local rtp = Rutba(result.sender_user_id_,msg.chat_id_)
local username = ('[@'..data.username_..']' or 'لا يوجد')
local iduser = result.sender_user_id_
send(msg.chat_id_, msg.id_,'܁༯┆ايدي العضو ◃ `'..iduser..'`܊\n܁༯┆معرف العضو ◃ '..username..' ܊ \n܁༯┆رتبة العضو ◃ '..rtp..' ܊\n܁༯┆رسائل العضو ◃ '..Msguser..'܊\n܁༯┆مجوهرات العضو ◃ '..NUMPGAME..' ܊\n܁༯┆جهات العضو ◃ '..Contact..' ܊')
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
end
if text and text:match("^ايدي @(.*)$") then
local username = text:match("^ايدي @(.*)$")
function start_function(extra, result, success)
if result.id_ then
tdcli_function ({ID = "GetUser",user_id_ = result.id_},function(extra,data) 
local Msguser = tonumber(redis:get(JoKeR..'Msg_User'..msg.chat_id_..':'..result.id_) or 1) 
local Contact = tonumber(redis:get(JoKeR..'Add:Contact'..msg.chat_id_..':'..result.id_) or 0) 
local NUMPGAME = tonumber(redis:get(JoKeR..'NUM:GAMES'..msg.chat_id_..result.id_) or 0)
local edit = tonumber(redis:get(JoKeR..'edits'..msg.chat_id_..result.id_) or 0)
local rtp = Rutba(result.id_,msg.chat_id_)
local username = ('[@'..data.username_..']' or 'لا يوجد')
local iduser = result.id_
send(msg.chat_id_, msg.id_,'܁༯┆ايدي العضو ◃ `'..iduser..'`܊\n܁༯┆معرف العضو ◃ '..username..' ܊ \n܁༯┆رتبة العضو ◃ '..rtp..' ܊\n܁༯┆رسائل العضو ◃ '..Msguser..'܊\n܁༯┆مجوهرات العضو ◃ '..NUMPGAME..' ܊\n܁༯┆جهات العضو ◃ '..Contact..' ܊')
end,nil)
else
send(msg.chat_id_, msg.id_,'༯┆ المعرف غير صحيح ')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
end
if text == 'رتبتي' then
local rtp = Rutba(msg.sender_user_id_,msg.chat_id_)
send(msg.chat_id_, msg.id_,'܁༯┆رتبتك في البوت ◃ '..rtp)
end
if text == "اسمي"  then 
tdcli_function({ID="GetUser",user_id_=msg.sender_user_id_},function(extra,result,success)
if result.first_name_  then
first_name = ' ܁༯┆اسمك اللطيف ◃ `'..(result.first_name_)..'` 💞 ܰ'
else
first_name = ''
end   
if result.last_name_ then 
last_name = ' ܁༯┆اسمك اللطيف ◃ `'..result.last_name_..'` 💞 ܰ' 
else
last_name = ''
end      
send(msg.chat_id_, msg.id_,first_name..'\n'..last_name) 
end,nil)
end 
if text == 'ايديي' then
send(msg.chat_id_, msg.id_,'܁༯┆الايدي تبعك ◃ '..msg.sender_user_id_)
end
if text == 'الرتبه' and tonumber(msg.reply_to_message_id_) > 0 then
function start_function(extra, result, success)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(extra,data) 
local rtp = Rutba(result.sender_user_id_,msg.chat_id_)
local username = ('@'..data.username_..'' or 'لا يوجد')
local iduser = result.sender_user_id_
send(msg.chat_id_, msg.id_,'܁༯┆هلو عمري 💞 ܰ\n܁༯┆ايدي العضو  ◃ *'..iduser..'* 💞 ܰ\n܁༯┆معرف  العضو ◃ ˼ *'..username..'* ˹\n܁༯┆رتبة العضو ◃ *'..rtp..'* 💞 ܰ\n')
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
end
---------
if text and text:match("^الرتبه @(.*)$") then
local username = text:match("^الرتبه @(.*)$")
function start_function(extra, result, success)
if result.id_ then
tdcli_function ({ID = "GetUser",user_id_ = result.id_},function(extra,data) 
local rtp = Rutba(result.id_,msg.chat_id_)
local username = ('[@'..data.username_..']' or 'لا يوجد')
local iduser = result.id_
send(msg.chat_id_, msg.id_,'܁༯┆هلو عمري 💞 ܰ\n܁༯┆ايدي العضو  ◃ *'..iduser..'* 💞 ܰ\n܁༯┆معرف  العضو ◃ *'..username..'* 💞 ܰ\n܁༯┆رتبة العضو ◃ *'..rtp..'* 💞 ܰ\n')
end,nil)
else
send(msg.chat_id_, msg.id_,'܁༯┆المعرف غلط 💞 ܰ ')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
end
---------
if text == 'كشف' and tonumber(msg.reply_to_message_id_) > 0 then
function start_function(extra, result, success)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(extra,data) 
local rtp = Rutba(result.sender_user_id_,msg.chat_id_)
if result.username_ then
local username = '@'..result.username_ 
else
local username = 'لا يوجد '
end
local iduser = result.sender_user_id_
send(msg.chat_id_, msg.id_,'܁༯┆هلو عمري 💞 ܰ\n܁༯┆ايدي العضو  ◃ *'..iduser..'* 💞 ܰ\n܁༯┆معرف  العضو ◃ ['..username..'] 💞 ܰ\n܁༯┆رتبة العضو ◃ *'..rtp..'* 💞 ܰ')
end,nil)
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, start_function, nil)
end
---------
if text and text:match("^كشف @(.*)$") then
local username = text:match("^كشف @(.*)$")
function start_function(extra, result, success)
if result.id_ then
tdcli_function ({ID = "GetUser",user_id_ = result.id_},function(extra,data) 
local rtp = Rutba(result.id_,msg.chat_id_)
local iduser = result.id_
send(msg.chat_id_, msg.id_,'܁༯┆هلو عمري 💞 ܰ\n܁༯┆ايدي العضو  ◃ *'..iduser..'* 💞 ܰ\n܁༯┆معرف  العضو ◃ ['..username..'] 💞 ܰ\n܁༯┆رتبة العضو ◃ *'..rtp..'* 💞 ܰ')
end,nil)
else
send(msg.chat_id_, msg.id_,'༯┆المعرف غير صحيح ')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
end
if text==('عدد الكروب') and Mod(msg) then  
if msg.can_be_deleted_ == false then 
send(msg.chat_id_,msg.id_,"༯┆البوت ليس ادمن هنا \n") 
return false  
end 
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,ta) 
tdcli_function({ID="GetChannelFull",channel_id_ = msg.chat_id_:gsub('-100','')},function(arg,data) 
local taha = '܁༯┆عدد الادمنية 𖢟 ◃  '..data.administrator_count_..
'\n\n܁༯┆عدد المطرودين 𖢟 ◃  '..data.kicked_count_..
'\n\n܁༯┆عدد الاعضاء 𖢟 ◃  '..data.member_count_..
'\n\n܁༯┆عدد رسائل الكروب 𖢟 ◃ '..(msg.id_/2097152/0.5)..
'\n\n܁༯┆اسم المجموعه 𖢟 ◃ ['..ta.title_..']'
send(msg.chat_id_, msg.id_, taha) 
end,nil)
end,nil)
end 

if text and text:match("^صيح (.*)$") then
local username = text:match("^صيح (.*)$") 
if not redis:get(JoKeR..'Seh:User'..msg.chat_id_) then
function start_function(extra, result, success)
if result and result.message_ and result.message_ == "USERNAME_NOT_OCCUPIED" then 
send(msg.chat_id_, msg.id_,'܁༯┆المعرف غلط 💞 ܰ ') 
return false  
end
if result and result.type_ and result.type_.channel_ and result.type_.channel_.ID == "Channel" then
send(msg.chat_id_, msg.id_,'܁༯┆لا استطيع صيح القنوات 💞 ܰ ') 
return false  
end
if result.type_.user_.type_.ID == "UserTypeBot" then
send(msg.chat_id_, msg.id_,'܁༯┆لا استطيع صيح البوتات 💞 ܰ ') 
return false  
end
if result and result.type_ and result.type_.channel_ and result.type_.channel_.is_supergroup_ == true then
send(msg.chat_id_, msg.id_,'܁༯┆لا استطيع صيح الكروبات 💞 ܰ ') 
return false  
end
if result.id_ then
send(msg.chat_id_, msg.id_,'܁༯┆تعع عمري يردوك\n◞[@'..username..']◜ 💞 ܰ') 
return false
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = username}, start_function, nil)
else
send(msg.chat_id_, msg.id_,'܁༯┆امر صيح تم تعطيله من قبل المدراء 💞 ܰ  ') 
end
return false
end

if text == 'منو ضافني' then
if not redis:get(JoKeR..'Added:Me'..msg.chat_id_) then
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = msg.sender_user_id_},function(arg,da) 
if da and da.status_.ID == "ChatMemberStatusCreator" then
send(msg.chat_id_, msg.id_,'܁༯┆انت منشئ المجموعةه 💞 ܰ  ') 
return false
end
local Added_Me = redis:get(JoKeR.."Who:Added:Me"..msg.chat_id_..':'..msg.sender_user_id_)
if Added_Me then 
tdcli_function ({ID = "GetUser",user_id_ = Added_Me},function(extra,result,success)
local Name = '['..result.first_name_..'](tg://user?id='..result.id_..')'
Text = '܁༯┆الذي قام باضافتك ◃ '..Name
sendText(msg.chat_id_,Text,msg.id_/2097152/0.5,'md')
end,nil)
else
send(msg.chat_id_, msg.id_,'܁༯┆ انت دخلت عبر الرابط لتلح 💞 ܰ ') 
end
end,nil)
else
send(msg.chat_id_, msg.id_,'܁༯┆امر منو ضافني تم تعطيله من قبل المدراء 💞 ܰ  ') 
end
end

if text == 'تفعيل ضافني' and Owners(msg) then   
if redis:get(JoKeR..'Added:Me'..msg.chat_id_) then
Text = '܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم تفعيل امر منو ضافني 💞 ܰ'
redis:del(JoKeR..'Added:Me'..msg.chat_id_)  
else
Text = '܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم تفعيل امر منو ضافني 💞 ܰ'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تعطيل ضافني' and Owners(msg) then  
if not redis:get(JoKeR..'Added:Me'..msg.chat_id_) then
redis:set(JoKeR..'Added:Me'..msg.chat_id_,true)  
Text = '\n܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم تعطيل امر منو ضافني 💞 ܰ'
else
Text = '\n܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم تعطيل امر منو ضافني 💞 ܰ'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تفعيل صيح' and Owners(msg) then   
if redis:get(JoKeR..'Seh:User'..msg.chat_id_) then
Text = '܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم تفعيل امر صيح 💞 ܰ'
redis:del(JoKeR..'Seh:User'..msg.chat_id_)  
else
Text = '܁༯┆ههلو عمري ?? ܰ \n܁༯┆تم تفعيل امر صيح 💞 ܰ'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تنزيل جميع الرتب' then
if not BasicConstructor(msg) then
send(msg.chat_id_, msg.id_,'܁༯┆منشئ اساسي فقط لتكمز 😹😭💞 ') 
return false
end
redis:del(JoKeR..'Constructor'..msg.chat_id_)
redis:del(JoKeR..'Owners'..msg.chat_id_)
redis:del(JoKeR..'Mod:User'..msg.chat_id_)
redis:del(JoKeR..'Vips:User'..msg.chat_id_)
send(msg.chat_id_, msg.id_, '\n܁༯┆هلو عمري 💞 ܰ\n܁༯┆تم تنزيل العضو من ▾\n܁༯┆◝ المنشئين ٬ المدراء ٬ الادمنيه ٬ المميزين◟\n')
end
if text == 'تعطيل صيح' and Owners(msg) then  
if not redis:get(JoKeR..'Seh:User'..msg.chat_id_) then
redis:set(JoKeR..'Seh:User'..msg.chat_id_,true)  
Text = '\n܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم تعطيل امر صيح 💞 ܰ'
else
Text = '\n܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم تعطيل امر صيح 💞 ܰ'
end
send(msg.chat_id_, msg.id_,Text) 
end

if text == 'تفعيل اطردني' and Owners(msg) then   
if redis:get(JoKeR..'Cick:Me'..msg.chat_id_) then
Text = '܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم تفعيل امر اطردني 💞 ܰ'
redis:del(JoKeR..'Cick:Me'..msg.chat_id_)  
else
Text = '܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم تفعيل امر اطردني 💞 ܰ'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == 'تعطيل اطردني' and Owners(msg) then  
if not redis:get(JoKeR..'Cick:Me'..msg.chat_id_) then
redis:set(JoKeR..'Cick:Me'..msg.chat_id_,true)  
Text = '\n܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم تعطيل امر اطردني 💞 ܰ'
else
Text = '\n܁༯┆ههلو عمري 💞 ܰ \n܁༯┆تم تعطيل امر اطردني 💞 ܰ'
end
send(msg.chat_id_, msg.id_,Text) 
end


if text == ("ايدي") and msg.reply_to_message_id_ == 0 and not redis:get(JoKeR..'Bot:Id'..msg.chat_id_) then      
if not redis:sismember(JoKeR..'Spam:Texting'..msg.sender_user_id_,text) then
redis:sadd(JoKeR..'Spam:Texting'..msg.sender_user_id_,text) 
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = msg.sender_user_id_},function(arg,da)  tdcli_function ({ ID = "SendChatAction",  chat_id_ = msg.sender_user_id_, action_ = {  ID = "SendMessageTypingAction", progress_ = 100}  },function(arg,ta)  tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)  tdcli_function ({ID = "GetUserProfilePhotos",user_id_ = msg.sender_user_id_,offset_ = 0,limit_ = 1},function(extra,taha,success) 
if da.status_.ID == "ChatMemberStatusCreator" then 
rtpa = 'المالك'
elseif da.status_.ID == "ChatMemberStatusEditor" then 
rtpa = 'مشرف' 
elseif da.status_.ID == "ChatMemberStatusMember" then 
rtpa = 'عضو'
end
local Msguser = tonumber(redis:get(JoKeR..'Msg_User'..msg.chat_id_..':'..msg.sender_user_id_) or 1) 
local nummsggp = tonumber(msg.id_/2097152/0.5)
local nspatfa = tonumber(Msguser / nummsggp * 100)
local Contact = tonumber(redis:get(JoKeR..'Add:Contact'..msg.chat_id_..':'..msg.sender_user_id_) or 0) 
local NUMPGAME = tonumber(redis:get(JoKeR..'NUM:GAMES'..msg.chat_id_..msg.sender_user_id_) or 0)
local rtp = Rutba(msg.sender_user_id_,msg.chat_id_)
if result.username_ then
username = '@'..result.username_ 
else
username = 'لا يوجد '
end
local iduser = msg.sender_user_id_
local edit = tonumber(redis:get(JoKeR..'edits'..msg.chat_id_..msg.sender_user_id_) or 0)
local photps = (taha.total_count_ or 0)
local interaction = Total_Msg(Msguser)
local rtpg = rtpa
local tahaa = {
"كشخه برب 😉💘",
"ئمنور يلكمر 🌛",
"الوك الزينه👩‍🚒",
"آف تخليني ♥️",
"شهل الگيمر 🌜💘",
"اتخبل برب 😉💘",
}
local rdphoto = tahaa[math.random(#tahaa)]
if not redis:get(JoKeR..'Bot:Id:Photo'..msg.chat_id_) then      
local get_id_text = redis:get(JoKeR.."KLISH:ID"..msg.chat_id_)
if get_id_text then
if result.username_ then
username = '@'..result.username_ 
else
username = 'لا يوجد '
end
get_id_text = get_id_text:gsub('#rdphoto',rdphoto) 
get_id_text = get_id_text:gsub('#id',iduser) 
get_id_text = get_id_text:gsub('#username',username) 
get_id_text = get_id_text:gsub('#msgs',Msguser) 
get_id_text = get_id_text:gsub('#edit',edit) 
get_id_text = get_id_text:gsub('#stast',rtp) 
get_id_text = get_id_text:gsub('#auto',interaction) 
get_id_text = get_id_text:gsub('#game',NUMPGAME) 
get_id_text = get_id_text:gsub('#photos',photps) 
if result.status_.ID == "UserStatusRecently" and result.profile_photo_ ~= false then   
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, taha.photos_[0].sizes_[1].photo_.persistent_id_,get_id_text)       
else 
if result.status_.ID == "UserStatusEmpty" and result.profile_photo_ == false then
send(msg.chat_id_, msg.id_,'['..get_id_text..']')   
else
send(msg.chat_id_, msg.id_, '\n ليس لديك صور في حسابك \n['..get_id_text..']')      
end 
end
else
if result.username_ then
username = '@'..result.username_ 
else
username = 'لا يوجد '
end
if result.status_.ID == "UserStatusRecently" and result.profile_photo_ ~= false then
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, taha.photos_[0].sizes_[1].photo_.persistent_id_,'\n˹ 𖢊 𝑈𝑠𝑒𝑅 𖡻 '..username..' ま .\n˹ 𖢊 𝑖𝐷 𖡻 '..msg.sender_user_id_..' ま .\n˹ 𖢊 𝑆𝑡𝑎𝑆 𖡻 '..Rutba(msg.sender_user_id_,msg.chat_id_)..' ま .\n˹ 𖢊 𝐴𝑢??𝑂 𖡻 '..Total_Msg(Msguser)..' ま .\n˹ 𖢊 𝑀𝑎𝑠𝐺 𖡻 '..Msguser..' ま .\n˹ 𖢊 𝐸𝑑𝑖𝑇 𖡻 '..edit..' ま .\n˹ 𖢊 𝐺𝑎𝑚𝐸 𖡻 '..NUMPGAME..' ま .\n')   
else 
if result.status_.ID == "UserStatusEmpty" and result.profile_photo_ == false then
send(msg.chat_id_, msg.id_,'[\n˹ 𖢊 𝑈𝑠𝑒𝑅 𖡻 '..username..' ま .\n˹ 𖢊 𝑖𝐷 𖡻 '..msg.sender_user_id_..' ま .\n˹ 𖢊 𝑆𝑡𝑎𝑆 𖡻 '..Rutba(msg.sender_user_id_,msg.chat_id_)..' ま .\n˹ 𖢊 𝐴𝑢𝑡𝑂 𖡻 '..Total_Msg(Msguser)..' ま .\n˹ 𖢊 𝑀𝑎𝑠𝐺 𖡻 '..Msguser..' ま .\n˹ 𖢊 𝐸𝑑𝑖𝑇 𖡻 '..edit..' ま .\n˹ 𖢊 𝐺𝑎𝑚𝐸 𖡻 '..NUMPGAME..' ま .]\n')   
else
send(msg.chat_id_, msg.id_, '\n˹ 𖢊 𝑈𝑠𝑒𝑅 𖡻 '..username..' ま .\n˹ 𖢊 𝑖𝐷 𖡻 '..msg.sender_user_id_..' ま .\n˹ 𖢊 𝑆𝑡𝑎𝑆 𖡻 '..Rutba(msg.sender_user_id_,msg.chat_id_)..' ま .\n˹ 𖢊 𝐴𝑢𝑡𝑂 𖡻 '..Total_Msg(Msguser)..' ま .\n˹ 𖢊 𝑀𝑎𝑠𝐺 𖡻 '..Msguser..' ま .\n˹ 𖢊 𝐸𝑑𝑖𝑇 𖡻 '..edit..' ま .\n˹ 𖢊 𝐺𝑎𝑚𝐸 𖡻 '..NUMPGAME..' ま .]\n')   
end 
end
end
else
local get_id_text = redis:get(JoKeR.."KLISH:ID"..msg.chat_id_)
if get_id_text then
get_id_text = get_id_text:gsub('#rdphoto',rdphoto) 
get_id_text = get_id_text:gsub('#id',iduser) 
get_id_text = get_id_text:gsub('#username',username) 
get_id_text = get_id_text:gsub('#msgs',Msguser) 
get_id_text = get_id_text:gsub('#edit',edit) 
get_id_text = get_id_text:gsub('#stast',rtp) 
get_id_text = get_id_text:gsub('#auto',interaction) 
get_id_text = get_id_text:gsub('#game',NUMPGAME) 
get_id_text = get_id_text:gsub('#photos',photps) 
send(msg.chat_id_, msg.id_,'['..get_id_text..']')   
else
send(msg.chat_id_, msg.id_,'[\n˹ 𖢊 𝑈𝑠𝑒𝑅 𖡻 '..username..' ま .\n˹ 𖢊 𝑖𝐷 𖡻 '..msg.sender_user_id_..' ま .\n˹ 𖢊 𝑆𝑡𝑎𝑆 𖡻 '..Rutba(msg.sender_user_id_,msg.chat_id_)..' ま .\n˹ 𖢊 𝐴𝑢𝑡𝑂 𖡻 '..Total_Msg(Msguser)..' ま .\n˹ 𖢊 𝑀𝑎𝑠𝐺 𖡻 '..Msguser..' ま .\n˹ 𖢊 𝐸𝑑𝑖𝑇 𖡻 '..edit..' ま .\n˹ 𖢊 𝐺𝑎𝑚𝐸 𖡻 '..NUMPGAME..' ま .]\n')   
end
end

end,nil)
end,nil)
end,nil)
end,nil)
end
end

if text == 'سحكاتي' or text == 'تعديلاتي' then 
local Num = tonumber(redis:get(JoKeR..'edits'..msg.chat_id_..msg.sender_user_id_) or 0)
if Num == 0 then 
Text = '٭ 𖢔┆ليس لديك أي سحكات ▵ ◜'
else
Text = '٭ 𖢔┆عدد سحكاتك ◃ ◞ *'..Num..'* ◜'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == "مسح سحكاتي" or text == "حذف سحكاتي" then  
send(msg.chat_id_, msg.id_,'٭ 𖢔┆تم حذف جميع سحكاتك ▵ ◜'  )  
redis:del(JoKeR..'edits'..msg.chat_id_..msg.sender_user_id_)
end
if text == "مسح جهاتي" or text == "حذف جهاتي" then  
send(msg.chat_id_, msg.id_,'٭ 𖢔┆تم حذف جميع جهاتك ▵ ◜'  )  
redis:del(JoKeR..'Add:Contact'..msg.chat_id_..':'..msg.sender_user_id_)
end
if text == 'جهاتي' or text == 'شكد ضفت' then 
local Num = tonumber(redis:get(JoKeR..'Add:Contact'..msg.chat_id_..':'..msg.sender_user_id_) or 0) 
if Num == 0 then 
Text = '܁༯┆ماعدكك جهات 😹😔💞'
else
Text = '܁༯┆عدد جهاتك المضافة ˼ ['..Num..'](https://t.me/joinchat/AAAAAEvr1yqOypm-uHojPA) ˹'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text == "تنظيف المشتركين" and Sudo_JoKeR(msg) then 
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
local pv = redis:smembers(JoKeR.."User_Bot")
local sendok = 0
for i = 1, #pv do
tdcli_function({ID='GetChat',chat_id_ = pv[i]
},function(arg,dataq)
tdcli_function ({ ID = "SendChatAction",  
chat_id_ = pv[i], action_ = {  ID = "SendMessageTypingAction", progress_ = 100} 
},function(arg,data) 
if data.ID and data.ID == "Ok"  then
else
redis:srem(JoKeR.."User_Bot",pv[i])
sendok = sendok + 1
end
if #pv == i then 
if sendok == 0 then
send(msg.chat_id_, msg.id_,'܁༯┆لا يوجد مشتركين وهميين في البوت 💞 ܰ  \n')   
else
local ok = #pv - sendok
send(msg.chat_id_, msg.id_,'܁༯┆ عدد المشتركين ◃ ['..#pv..'](https://t.me/joinchat/AAAAAEvr1yqOypm-uHojPA) ܰ\n܁༯┆تم ازالة ◃ ['..sendok..'](https://t.me/joinchat/AAAAAEvr1yqOypm-uHojPA) " من المشتركين  \n܁༯┆عدد المشتركين الحقيقي ◃ ['..ok..'](https://t.me/joinchat/AAAAAEvr1yqOypm-uHojPA) " مشترك\n')   
end
end
end,nil)
end,nil)
end
return false
end
if text == "تنظيف الكروبات" and Sudo_JoKeR(msg) then 
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
local group = redis:smembers(JoKeR..'Chek:Groups') 
local w = 0
local q = 0
for i = 1, #group do
tdcli_function({ID='GetChat',chat_id_ = group[i]
},function(arg,data)
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusMember" then
redis:srem(JoKeR..'Chek:Groups',group[i])  
tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_=group[i],user_id_=JoKeR,status_={ID = "ChatMemberStatusLeft"},},function(e,g) end, nil) 
w = w + 1
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusLeft" then
redis:srem(JoKeR..'Chek:Groups',group[i])  
q = q + 1
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusKicked" then
redis:srem(JoKeR..'Chek:Groups',group[i])  
q = q + 1
end
if data and data.code_ and data.code_ == 400 then
redis:srem(JoKeR..'Chek:Groups',group[i])  
w = w + 1
end
if #group == i then 
if (w + q) == 0 then
send(msg.chat_id_, msg.id_,'\n܁༯┆لايوجد مجموعات وهميه في البوت💞 ܰ')   
else
local JoKeR = (w + q)
local sendok = #group - JoKeR
if q == 0 then
JoKeR = ''
else
JoKeR = '\n܁༯┆ تم ازالة ['..q..'](https://t.me/joinchat/AAAAAEvr1yqOypm-uHojPA) مجموعات من البوت 💞 ܰ'
end
if w == 0 then
JoKeRh = ''
else
JoKeRh = '\n܁༯┆ تم ازالة ['..w..'](https://t.me/joinchat/AAAAAEvr1yqOypm-uHojPA) مجموعات من البوت 💞 ܰ'
end
send(msg.chat_id_, msg.id_,'܁༯┆تم تنظيف المجموعات💞 ܰ')   
end
end
end,nil)
end
return false
end
-----------
if text ==("مسح") and Mod(msg) and tonumber(msg.reply_to_message_id_) > 0 then
DeleteMessage(msg.chat_id_,{[0] = tonumber(msg.reply_to_message_id_),msg.id_})   
end   
if redis:get(JoKeR.."numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
redis:del(JoKeR..'id:user'..msg.chat_id_)  
send(msg.chat_id_, msg.id_, "܁༯┆تم الالغاء ?? ܰ ") 
redis:del(JoKeR.."numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  
end 
redis:del(JoKeR.."numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
local numadded = string.match(text, "(%d+)") 
local iduserr = redis:get(JoKeR..'id:user'..msg.chat_id_)  
redis:del(JoKeR..'Msg_User'..msg.chat_id_..':'..msg.sender_user_id_) 
redis:incrby(JoKeR..'Msg_User'..msg.chat_id_..':'..iduserr,numadded)  
send(msg.chat_id_, msg.id_,"\n٭ 𖤓┆تم اضافة ◞ ["..numadded..'](https://t.me/joinchat/AAAAAEvr1yqOypm-uHojPA) ◜ من الرسائل 💞 ٭')  
end
------------------------------------------------------------------------
if redis:get(JoKeR.."gemadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
redis:del(JoKeR..'idgem:user'..msg.chat_id_)  
send(msg.chat_id_, msg.id_, "༯┆تم الالغاء 💞 ܰ  ") 
redis:del(JoKeR.."gemadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  
end 
redis:del(JoKeR.."gemadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
local numadded = string.match(text, "(%d+)") 
local iduserr = redis:get(JoKeR..'idgem:user'..msg.chat_id_)  
redis:incrby(JoKeR..'NUM:GAMES'..msg.chat_id_..iduserr,numadded)  
send(msg.chat_id_, msg.id_,  1, "💞┆ تم اضافة له {"..numadded..'} من المجوهراتي', 1 , 'md')  
end
------------------------------------------------------------
if text and text:match("^اضف رسائل (%d+)$") and msg.reply_to_message_id_ == 0 and Constructor(msg) then    
taha = text:match("^اضف رسائل (%d+)$")
redis:set(JoKeR..'id:user'..msg.chat_id_,taha)  
redis:setex(JoKeR.."numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 120, true)  
send(msg.chat_id_, msg.id_, '┐ هلو عمري 💞 ٭ \n┘ ارسل الي عدد الرسائل ٭') 
return false
end
------------------------------------------------------------------------
if text and text:match("^اضف مجوهراتي (%d+)$") and msg.reply_to_message_id_ == 0 and Constructor(msg) then  
taha = text:match("^اضف مجوهراتي (%d+)$")
redis:set(JoKeR..'idgem:user'..msg.chat_id_,taha)  
redis:setex(JoKeR.."gemadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 120, true)  
send(msg.chat_id_, msg.id_, '┐ هلو عمري 💞 ٭ \n┘ ارسل الي عدد المجوهرات الان') 
return false
end
------------------------------------------------------------------------
if text and text:match("^اضف مجوهرات (%d+)$") and msg.reply_to_message_id_ ~= 0 and Constructor(msg) then
local Num = text:match("^اضف مجوهرات (%d+)$")
function reply(extra, result, success)
redis:incrby(JoKeR..'NUM:GAMES'..msg.chat_id_..result.sender_user_id_,Num)  
send(msg.chat_id_, msg.id_,"┐ هلو عمري 💞 ٭ \n┘ تم اضافة ◞ ["..Num..'](https://t.me/joinchat/AAAAAEvr1yqOypm-uHojPA) ◜ مجوهرات ✓ ٭')  
end
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},reply, nil)
return false
end
------------------------------------------------------------------------
if text and text:match("^البلوره (.*)$") and redis:get(JoKeR..'Lock:Games'..msg.chat_id_) then
local textage = text:match("^البلوره (.*)$")
local hso = {
"نعم",
"لا",
}
local rdtext = hso[math.random(#hso)]
send(msg.chat_id_, msg.id_, 'سؤالك هو '..textage..' والجواب '..rdtext..' 👋🏻♥️.') 
end
if text and text:match("^اضف رسائل (%d+)$") and msg.reply_to_message_id_ ~= 0 and Constructor(msg) then
local Num = text:match("^اضف رسائل (%d+)$")
function reply(extra, result, success)
redis:del(JoKeR..'Msg_User'..msg.chat_id_..':'..result.sender_user_id_) 
redis:incrby(JoKeR..'Msg_User'..msg.chat_id_..':'..result.sender_user_id_,Num)  
send(msg.chat_id_, msg.id_, "\n٭ 𖤓┆تم اضافة ◞ ["..num..'](https://t.me/joinchat/AAAAAEvr1yqOypm-uHojPA) ◜ من الرسائل 💞 ٭')  
end
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},reply, nil)
return false
end
if text == 'مجوهراتي' or text == 'مجوهراتي' then 
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
local Num = redis:get(JoKeR..'NUM:GAMES'..msg.chat_id_..msg.sender_user_id_) or 0
if Num == 0 then 
Text = '٭ 𖤓┆لم تلعب اي لعبة للحصول على المجوهرات ☓◜'
else
Text = '٭ 𖤓┆عدد مجوهراتك ◃ ◞ ['..Num..'](https://t.me/joinchat/AAAAAEvr1yqOypm-uHojPA) ◜.'
end
send(msg.chat_id_, msg.id_,Text) 
end
if text and text:match("^بيع مجوهراتي (%d+)$") or text and text:match("^بيع مجوهراتي (%d+)$") then
local NUMPY = text:match("^بيع مجوهراتي (%d+)$") or text:match("^بيع مجوهراتي (%d+)$") 
if AddChannel(msg.sender_user_id_) == false then
send(msg.chat_id_, msg.id_,'- هلو حب ، لايمكنك استخدام البوت 💕.\n- ﭑشترك اولاً 💕 • [https://t.me/Mzijjeat] .')
return false
end
if tonumber(NUMPY) == tonumber(0) then
send(msg.chat_id_,msg.id_,"\n✥┆لا تستطيع البيع اقل من ◞[1](https://t.me/joinchat/AAAAAEvr1yqOypm-uHojPA)◜ ◃") 
return false 
end
if tonumber(redis:get(JoKeR..'NUM:GAMES'..msg.chat_id_..msg.sender_user_id_)) == tonumber(0) then
send(msg.chat_id_,msg.id_,'\n┐ ليس لديك مجوهرات 𖥣 ٭\n┤ لكسب المجوهرات  𖥣 ٭\n┘ ارسل الالعاب وابدأ اللعب  𖥣 ٭') 
else
local NUM_GAMES = redis:get(JoKeR..'NUM:GAMES'..msg.chat_id_..msg.sender_user_id_)
if tonumber(NUMPY) > tonumber(NUM_GAMES) then
send(msg.chat_id_,msg.id_,'\n┐ ليس لديك مجوهرات 𖥣 ٭\n┤ لكسب المجوهرات  𖥣 ٭\n┘ ارسل الالعاب وابدأ اللعب  𖥣 ٭') 
return false 
end
local NUMNKO = (NUMPY * 50)
redis:decrby(JoKeR..'NUM:GAMES'..msg.chat_id_..msg.sender_user_id_,NUMPY)  
redis:incrby(JoKeR..'Msg_User'..msg.chat_id_..':'..msg.sender_user_id_,NUMNKO)  
send(msg.chat_id_,msg.id_,'┐ تم خصم ◞['..NUMPY..'](https://t.me/joinchat/AAAAAEvr1yqOypm-uHojPA)◜ من مجوهراتك ✓ ٭\n┘ تم اضافة ◞['..(NUMPY * 50)..'](https://t.me/joinchat/AAAAAEvr1yqOypm-uHojPA)◜ رسالة الى رسائلك ✓ ٭')
end 
return false 
end
if text == 'فحص البوت' and Owners(msg) then
local Chek_Info = https.request('https://api.telegram.org/bot'..token..'/getChatMember?chat_id='.. msg.chat_id_ ..'&user_id='.. JoKeR..'')
local Json_Info = JSON.decode(Chek_Info)
if Json_Info.ok == true then
if Json_Info.result.status == "administrator" then
if Json_Info.result.can_change_info == true then
info = 'ꪜ' else info = '✘' end
if Json_Info.result.can_delete_messages == true then
delete = 'ꪜ' else delete = '✘' end
if Json_Info.result.can_invite_users == true then
invite = 'ꪜ' else invite = '✘' end
if Json_Info.result.can_pin_messages == true then
pin = 'ꪜ' else pin = '✘' end
if Json_Info.result.can_restrict_members == true then
restrict = 'ꪜ' else restrict = '✘' end
if Json_Info.result.can_promote_members == true then
promote = 'ꪜ' else promote = '✘' end 
send(msg.chat_id_,msg.id_,'\n܁༯┆هلو عمري  💞'..'\n܁༯┆صلاحيات البوت هي ▿  ܰ'..'\n••━━━━━━━━━━━━━━━━•'..'\n܁༯┆تغير معلومات المجموعة ˼ '..info..' ˹'..'\n܁༯┆حذف الرسائل  ˼ '..delete..' ˹'..'\n܁༯┆حظر المستخدمين  ˼ '..restrict..' ˹'..'\n܁༯┆دعوة المستخدمين  ˼ '..invite..' ˹'..'\n܁༯┆ثتبيت الرسالة  ˼ '..pin..' ˹'..'\n܁༯┆اضافة مشرفين جدد  ˼ '..promote..' ˹')   
end
end
end
if text and text:match("^كول (.*)$") then
local txt = {string.match(text, "^(كول) (.*)$")}
send(msg.chat_id_, 0, txt[2], "md")
end

if text ==("مسح") and Mod(msg) and tonumber(msg.reply_to_message_id_) > 0 then
DeleteMessage(msg.chat_id_,{[0] = tonumber(msg.reply_to_message_id_),msg.id_})   
end   
if redis:get(JoKeR.."numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
redis:del(JoKeR..'id:user'..msg.chat_id_)  
send(msg.chat_id_, msg.id_, "܁༯┆تم الغاء الامر ") 
redis:del(JoKeR.."numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  
end 
redis:del(JoKeR.."numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
local numadded = string.match(text, "(%d+)") 
local iduserr = redis:get(JoKeR..'id:user'..msg.chat_id_)  
redis:del(JoKeR..'Msg_User'..msg.chat_id_..':'..msg.sender_user_id_) 
redis:incrby(JoKeR..'Msg_User'..msg.chat_id_..':'..iduserr,numadded)  
send(msg.chat_id_, msg.id_,"܁༯┆ تم اضافة لهہ‌‏ {"..numadded..'} من الرسائل')  
end
------------------------------------------------------------------------
if redis:get(JoKeR.."gemadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
redis:del(JoKeR..'idgem:user'..msg.chat_id_)  
send(msg.chat_id_, msg.id_, "܁༯┆ تم الغاء الامر ") 
redis:del(JoKeR.."gemadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  
end 
redis:del(JoKeR.."gemadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
local numadded = string.match(text, "(%d+)") 
local iduserr = redis:get(JoKeR..'idgem:user'..msg.chat_id_)  
redis:incrby(JoKeR..'NUM:GAMES'..msg.chat_id_..iduserr,numadded)  
send(msg.chat_id_, msg.id_,  1, "܁༯┆تم اضافة لهہ‌‏ {"..numadded..'} من النقاط', 1, 'md')  
end
------------------------------------------------------------
if text and text:match('^الحساب (%d+)$') then
local id = text:match('^الحساب (%d+)$')
local text = '܁༯┆اضغط هنا لمشاهدة العضو 💞 ܰ'
tdcli_function ({ID="SendMessage", chat_id_=msg.chat_id_, reply_to_message_id_=msg.id_, disable_notification_=0, from_background_=1, reply_markup_=nil, input_message_content_={ID="InputMessageText", text_=text, disable_web_page_preview_=1, clear_draft_=0, entities_={[0] = {ID="MessageEntityMentionName", offset_=0, length_=19, user_id_=id}}}}, dl_cb, nil)
end
if text == "شنو رئيك بهذا" or text == "شنو رئيك بهذ" then
if not redis:get(JoKeR..'lock:add'..msg.chat_id_) then
local texting = {"܁༯┆كلش حباب وهاي 🦄💞 ܰ","܁༯┆الكياته تبعه تقرا 1000 🥺💞 ܰ","܁༯┆اطلق شخص شحبه 🥺💞 ܰ","زغبا 😹💞.","܁༯┆يوتيوبر رب المعيدي 😹💞 ܰ"}
send(msg.chat_id_, msg.id_, ''..texting[math.random(#texting)]..'')
end
end
if text == "هينه" or text == "رزله" then
if not redis:get(JoKeR..'lock:add'..msg.chat_id_) then
local texting = {"مااهين حيوانات اني 😹😭💘."," ماا وخر ماسوي شي 😭💘 ."}
send(msg.chat_id_, msg.id_, ''..texting[math.random(#texting)]..'')
end
end
if text == "مصه" or text == "بوسه" then
if not redis:get(JoKeR..'lock:add'..msg.chat_id_) then
local texting = {"ما ما ما اخجل شني 😭😭💞","ماا وخر مابوسك 😭💞💞"," ما ما ما اخجل شني 😭😭💞"}
send(msg.chat_id_, msg.id_, ''..texting[math.random(#texting)]..'')
end
end

if text == 'رابط الحذف' or text == 'رابط حذف' then
t =[[
┐ ههلو عمري حنشتاقلك 💞 .
┤ رابط حذف حسابك في مواقع التواصل 💞 .
┤ ╌╌╌╌╌╌╌╌╌╌ ܁
┤ رابط حذف  [Telegram](https://my.telegram.org/auth?to=delete) ܊ ܁
┤ رابط حذف [instagram](https://www.instagram.com/accounts/login/?next=/accounts/remove/request/permanent/) ܊ ܁
┤ رابط حذف [Facebook](https://www.facebook.com/help/deleteaccount) ܊ ܁
┘ رابط حذف [Snspchat](https://accounts.snapchat.com/accounts/login?continue=https%3A%2F%2Faccounts.snapchat.com%2Faccounts%2Fdeleteaccount) ܊ ܁
]]
send(msg.chat_id_, msg.id_,t) 
return false
end


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
end -- Chat_Type = 'GroupBot' 
end -- end msg
--------------------------------------------------------------------------------------------------------------
function tdcli_update_callback(data)  -- clback
if data.ID == "UpdateChannel" then 
if data.channel_.status_.ID == "ChatMemberStatusKicked" then 
redis:srem(JoKeR..'Chek:Groups','-100'..data.channel_.id_)  
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,chat)  
local NameChat = chat.title_
local IdChat = msg.chat_id_
Text = ' '..
'\n'..
'\n'..
'\n'
sendText(SUDO,Text,0,'md')


end,nil) 
end
end

if data.ID == "UpdateNewMessage" then  -- new msg
msg = data.message_
text = msg.content_.text_
--------------------------------------------------------------------------------------------------------------
if msg.date_ and msg.date_ < tonumber(os.time() - 15) then
print('OLD MESSAGE')
return false
end
if tonumber(msg.sender_user_id_) == tonumber(JoKeR) then
return false
end
--------------------------------------------------------------------------------------------------------------
if text and not redis:sismember(JoKeR..'Spam:Texting'..msg.sender_user_id_,text) then
redis:del(JoKeR..'Spam:Texting'..msg.sender_user_id_) 
end
--------------------------------------------------------------------------------------------------------------
if text and redis:get(JoKeR.."Del:Cmd:Group"..msg.chat_id_..':'..msg.sender_user_id_) == 'true' then
local NewCmmd = redis:get(JoKeR.."Set:Cmd:Group:New1"..msg.chat_id_..':'..text)
if NewCmmd then
redis:del(JoKeR.."Set:Cmd:Group:New1"..msg.chat_id_..':'..text)
redis:del(JoKeR.."Set:Cmd:Group:New"..msg.chat_id_)
redis:srem(JoKeR.."List:Cmd:Group:New"..msg.chat_id_,text)
send(msg.chat_id_, msg.id_,'܁༯┆تم حذف الامر بنجاح 💞 ܰ')  
else
send(msg.chat_id_, msg.id_,'܁༯┆لايوجد امر بهذا الاسم 💞 ܰ')  
end
redis:del(JoKeR.."Del:Cmd:Group"..msg.chat_id_..':'..msg.sender_user_id_)
return false
end 
-------------------------------------------------------------------------------------------------------------- 
if data.message_.content_.text_ then
local NewCmmd = redis:get(JoKeR.."Set:Cmd:Group:New1"..msg.chat_id_..':'..data.message_.content_.text_)
if NewCmmd then
data.message_.content_.text_ = (NewCmmd or data.message_.content_.text_)
end
end
if (text and text == "ttttggguuu") then 
send(msg.chat_id_, msg.id_, 'kedhs')
redis:set(JoKeR.."Fun_Bots:"..msg.chat_id_,"true")
end
if (text and text == "Useuwkq ") then 
send(msg.chat_id_, msg.id_, ' ked uwiq')
redis:del(JoKeR.."Fun_Bots:"..msg.chat_id_)
end
local Name_Bot = (redis:get(JoKeR..'Name:Bot') or 'جوكر')
if not redis:get(JoKeR.."Fun_Bots:"..msg.chat_id_) then
if text ==  ""..Name_Bot..' شنو رئيبهاذا' and tonumber(msg.reply_to_message_id_) > 0 then     
function FunBot(extra, result, success) 
local Fun = {'لوكي وزاحف من ساع زحفلي وحضرته 😒','خوش ولد و ورده مال الله 💋🙄','يلعب ع البنات 🙄', 'ولد زايعته الكاع 😶??','صاك يخبل ومعضل ','محلو وشواربه جنها مكناسه 😂🤷🏼‍♀️','اموت عليه 🌝','هوه غير الحب مال اني 🤓❤️','مو خوش ولد صراحه ☹️','ادبسز وميحترم البنات  ', 'فد واحد قذر 🙄😒','ماطيقه كل ما اكمشه ريحته جنها بخاخ بف باف مال حشرات 😂🤷‍♀️','مو خوش ولد 🤓' } 
send(msg.chat_id_, result.id_,''..Fun[math.random(#Fun)]..'')   
end   
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, FunBot, nil)
return false
end  
if text == ""..Name_Bot..' تحب ه' and tonumber(msg.reply_to_message_id_) > 0 then    
function FunBot(extra, result, success) 
local Fun = {'الكبد مال اني ','يولي ماحبه ',' لٱ ايع ','بس لو الكفها اله اعضها 💔','ماخب مطايه اسف','اكلك ۿذﭑ يكلي احبكك لولا ﭑݩٺ شتكول  ','ئووووووووف اموت ع ربه ','ايععععععععع','بلعباس اعشكك','ماحب مخابيل','احبب ميدو وبس','لٱ ماحبه','بله هاي جهره تكلي تحبهه ؟ ','بربك ئنته والله فارغ وبطران وماعدك شي تسوي جاي تسئلني احبهم لولا','افبس حبيبي هذا' } 
send(msg.chat_id_,result.id_,''..Fun[math.random(#Fun)]..'') 
end  
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, FunBot, nil)
return false
end    
end
if text and text:match('^'..Name_Bot..' ') then
data.message_.content_.text_ = data.message_.content_.text_:gsub('^'..Name_Bot..' ','')
end
--------------------------------------------------------------------------------------------------------------
if msg.sender_user_id_ and Muted_User(msg.chat_id_,msg.sender_user_id_) then 
DeleteMessage(msg.chat_id_, {[0] = msg.id_})  
return false  
end
--------------------------------------------------------------------------------------------------------------
if msg.sender_user_id_ and Ban_User(msg.chat_id_,msg.sender_user_id_) then 
chat_kick(msg.chat_id_,msg.sender_user_id_) 
DeleteMessage(msg.chat_id_, {[0] = msg.id_}) 
return false  
end
--------------------------------------------------------------------------------------------------------------
if msg.content_ and msg.content_.members_ and msg.content_.members_[0] and msg.content_.members_[0].id_ and Ban_User(msg.chat_id_,msg.content_.members_[0].id_) then 
chat_kick(msg.chat_id_,msg.content_.members_[0].id_) 
DeleteMessage(msg.chat_id_, {[0] = msg.id_}) 
return false
end
--------------------------------------------------------------------------------------------------------------
if msg.sender_user_id_ and GBan_User(msg.sender_user_id_) then 
chat_kick(msg.chat_id_,msg.sender_user_id_) 
DeleteMessage(msg.chat_id_, {[0] = msg.id_}) 
return false 
end
--------------------------------------------------------------------------------------------------------------
if msg.sender_user_id_ and Gmute_User(msg.sender_user_id_) then 
DeleteMessage(msg.chat_id_, {[0] = msg.id_}) 
return false 
end
--------------------------------------------------------------------------------------------------------------
if msg.content_ and msg.content_.members_ and msg.content_.members_[0] and msg.content_.members_[0].id_ and GBan_User(msg.content_.members_[0].id_) then 
chat_kick(msg.chat_id_,msg.content_.members_[0].id_) 
DeleteMessage(msg.chat_id_, {[0] = msg.id_})  
end 
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageChatAddMembers" then  
redis:set(JoKeR.."Who:Added:Me"..msg.chat_id_..':'..msg.content_.members_[0].id_,msg.sender_user_id_)
local mem_id = msg.content_.members_  
local Bots = redis:get(JoKeR.."lock:Bot:kick"..msg.chat_id_) 
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and not Mod(msg) and Bots == "kick" then   
https.request("https://api.telegram.org/bot"..token.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..msg.sender_user_id_)
JoKeR = https.request("https://api.telegram.org/bot"..token.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..mem_id[i].id_)
local Json_Info = JSON.decode(JoKeR)
if Json_Info.ok == true and #mem_id == i then
local Msgs = {}
Msgs[0] = msg.id_
msgs_id = msg.id_-1048576
for i=1 ,(150) do 
msgs_id = msgs_id+1048576
table.insert(Msgs,msgs_id)
end
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Msgs},function(arg,data);MsgsDel = {};for i=0 ,data.total_count_ do;if not data.messages_[i] then;if not MsgsDel[0] then;MsgsDel[0] = Msgs[i];end;table.insert(MsgsDel,Msgs[i]);end;end;if MsgsDel[0] then;tdcli_function({ID="DeleteMessages",chat_id_ = arg.chat_id_,message_ids_=MsgsDel},function(arg,data)end,nil);end;end,{chat_id_=msg.chat_id_})
tdcli_function({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID,filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,tah) local admins = tah.members_ for i=0 , #admins do if tah.members_[i].status_.ID ~= "ChatMemberStatusEditor" and not is_mod(msg) then tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_ = msg.chat_id_,user_id_ = admins[i].user_id_,status_ = {ID = "ChatMemberStatusKicked"},}, function(arg,f) end, nil) end end end,nil)  
end
end     
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageChatAddMembers" then  
local mem_id = msg.content_.members_  
local Bots = redis:get(JoKeR.."lock:Bot:kick"..msg.chat_id_) 
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and not Mod(msg) and Bots == "del" then   
JoKeR = https.request("https://api.telegram.org/bot"..token.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..mem_id[i].id_)
local Json_Info = JSON.decode(JoKeR)
if Json_Info.ok == true and #mem_id == i then
local Msgs = {}
Msgs[0] = msg.id_
msgs_id = msg.id_-1048576
for i=1 ,(150) do 
msgs_id = msgs_id+1048576
table.insert(Msgs,msgs_id)
end
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Msgs},function(arg,data);MsgsDel = {};for i=0 ,data.total_count_ do;if not data.messages_[i] then;if not MsgsDel[0] then;MsgsDel[0] = Msgs[i];end;table.insert(MsgsDel,Msgs[i]);end;end;if MsgsDel[0] then;tdcli_function({ID="DeleteMessages",chat_id_ = arg.chat_id_,message_ids_=MsgsDel},function(arg,data)end,nil);end;end,{chat_id_=msg.chat_id_})
tdcli_function({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID,filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,tah) local admins = tah.members_ for i=0 , #admins do if tah.members_[i].status_.ID ~= "ChatMemberStatusEditor" and not is_mod(msg) then tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_ = msg.chat_id_,user_id_ = admins[i].user_id_,status_ = {ID = "ChatMemberStatusKicked"},}, function(arg,f) end, nil) end end end,nil)  
end
end     
end
end
if msg.content_.ID == 'MessagePinMessage' then
if Constructor(msg) then 
redis:set(JoKeR..'Pin:Id:Msg'..msg.chat_id_,msg.content_.message_id_)
else
local Msg_Pin = redis:get(JoKeR..'Pin:Id:Msg'..msg.chat_id_)
if Msg_Pin and redis:get(JoKeR.."lockpin"..msg.chat_id_) then
PinMessage(msg.chat_id_,Msg_Pin)
end
end
end
--------------------------------------------------------------------------------------------------------------
if msg.content_.ID == "MessageChatDeletePhoto" or msg.content_.ID == "MessageChatChangePhoto" or msg.content_.ID == 'MessagePinMessage' or msg.content_.ID == "MessageChatJoinByLink" or msg.content_.ID == "MessageChatAddMembers" or msg.content_.ID == 'MessageChatChangeTitle' or msg.content_.ID == "MessageChatDeleteMember" then   
if redis:get(JoKeR..'lock:tagservr'..msg.chat_id_) then  
DeleteMessage(msg.chat_id_,{[0] = msg.id_})       
return false
end    
end   
--------------------------------------------------------------------------------------------------------------
SourceJoKeR(data.message_,data)
FilesJoKeRTeam(data.message_)
--------------------------------------------------------------------------------------------------------------
if Chat_Type == 'GroupBot' and ChekAdd(msg.chat_id_) == true then
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
if data.username_ then
redis:set(JoKeR..'user:Name'..msg.sender_user_id_,(data.username_))
end
--------------------------------------------------------------------------------------------------------------
if tonumber(data.id_) == tonumber(JoKeR) then
return false
end
local Getredis = redis:get(JoKeR.."Chen:Photo"..msg.sender_user_id_)
if data.profile_photo_ then  
if Getredis and Getredis ~= data.profile_photo_.id_ then 
send(msg.chat_id_,msg.id_,' ')
redis:set(JoKeR.."C:Photo"..msg.sender_user_id_, data.profile_photo_.id_) 
return false
end
end
end,nil)   
end
elseif (data.ID == "UpdateMessageEdited") then
local msg = data
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.message_id_)},function(extra, result, success)
redis:incr(JoKeR..'edits'..result.chat_id_..result.sender_user_id_)
local Text = result.content_.text_
if redis:get(JoKeR.."lock_edit_med"..msg.chat_id_) and not Text and not BasicConstructor(result) then
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local username = data.username_
local name = data.first_name_
local iduser = data.id_
local users = ('[@'..data.username_..']' or iduser)
local list = redis:smembers(JoKeR..'Mod:User'..msg.chat_id_)
t = "\n🚫┇ عضو ما يحاول تعديل الميديا \n"
for k,v in pairs(list) do
local username = redis:get(JoKeR.."user:Name" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "☑️┇ لا يوجد ادمن"
end
send(msg.chat_id_,0,''..t..'\n┉  ┉  ┉  ┉  ┉  ┉  ┉  ┉ٴ\n⚠️┇ تم التعديل على الميديا\n📌┇ العضو الي قام بالتعديل\n📮┇ ايدي العضو ← `'..result.sender_user_id_..'`\n⛔┇ معرف العضو←{ '..users..' }') 
end,nil)
DeleteMessage(msg.chat_id_,{[0] = msg.message_id_}) 
end
local text = result.content_.text_
if not Mod(result) then
------------------------------------------------------------------------
if text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text:match("[Tt].[Mm][Ee]") or text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text:match("[Tt][Ee][Ll][Ee][Ss][Cc][Oo].[Pp][Ee]") then
if redis:get(JoKeR.."lock:Link"..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = data.message_id_}) 
return false
end 
end
------------------------------------------------------------------------
if text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text:match("[Tt].[Mm][Ee]") or text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text:match("[Tt][Ee][Ll][Ee][Ss][Cc][Oo].[Pp][Ee]") then
if redis:get(JoKeR.."lock:Link"..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = data.message_id_}) 
return false
end  
end
------------------------------------------------------------------------
if text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text:match("[Tt].[Mm][Ee]") or text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text:match("[Tt][Ee][Ll][Ee][Ss][Cc][Oo].[Pp][Ee]") then
if redis:get(JoKeR.."lock:Link"..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = data.message_id_}) 
return false
end  
end 
------------------------------------------------------------------------
if text:match("[hH][tT][tT][pP][sT]") or text:match("[tT][eE][lL][eE][gG][rR][aA].[Pp][Hh]") or text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa].[Pp][Hh]") then
if redis:get(JoKeR.."lock:Link"..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = data.message_id_}) 
return false
end  
end
------------------------------------------------------------------------
if text:match("[Hh][Tt][Tt][Pp]://[Ww][Ww][Ww].[Ii][Nn][Ss][Tt][Aa][Gg][Rr][Aa][Mm].[Cc][Oo][Mm]")  then
if redis:get(JoKeR.."lock:Link"..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = data.message_id_}) 
return false
end 
end
------------------------------------------------------------------------
if text:match("(.*)(@)(.*)") then
if redis:get(JoKeR.."lock:user:name"..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = data.message_id_}) 
return false
end  
end
------------------------------------------------------------------------
if text:match("@") then
if redis:get(JoKeR.."lock:user:name"..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = data.message_id_}) 
return false
end  
end 
------------------------------------------------------------------------
if text:match("(.*)(#)(.*)") then
if redis:get(JoKeR.."lock:hashtak"..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = data.message_id_}) 
return false
end  
end 
------------------------------------------------------------------------
if text:match("#") then
if redis:get(JoKeR.."lock:user:name"..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = data.message_id_}) 
return false
end  
end 
------------------------------------------------------------------------
local JoKeRAbot = redis:get(JoKeR.."JoKeR1:Add:Filter:Rp2"..text..result.chat_id_)   
if JoKeRAbot then    
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
if data.username_ ~= false then
send(msg.chat_id_,0,"⚠┇العضو : {["..data.first_name_.."](T.ME/"..data.username_..")}\n🚫┇["..JoKeRAbot.."] \n") 
else
send(msg.chat_id_,0,"⚠┇العضو : {["..data.first_name_.."](T.ME/JoKeR_aHs)}\n🚫┇["..JoKeRAbot.."] \n") 
end
end,nil)   
DeleteMessage(msg.chat_id_,{[0] = data.message_id_}) 
return false
end
------------------------------------------------------------------------
if text:match("/") then
if redis:get(JoKeR.."lock:Cmd"..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = data.message_id_}) 
return false
end 
end 
if text:match("(.*)(/)(.*)") then
if redis:get(JoKeR.."lock:Cmd"..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = data.message_id_}) 
return false
end 
end
------------------------------------------------------------------------
if text then
local JoKeR1_Msg = redis:get(JoKeR.."JoKeR1:Add:Filter:Rp2"..text..result.chat_id_)   
if JoKeR1_Msg then    
send(msg.chat_id_, msg.id_,"🔖┇"..JoKeR1_Msg)
DeleteMessage(result.chat_id_, {[0] = data.message_id_})     
return false
end
end
end
end,nil)
------------------------------------------------------------------------

elseif (data.ID == "UpdateOption" and data.name_ == "my_id") then 
local list = redis:smembers(JoKeR.."User_Bot") 
for k,v in pairs(list) do 
tdcli_function({ID='GetChat',chat_id_ = v},function(arg,data) end,nil) 
end         
local list = redis:smembers(JoKeR..'Chek:Groups') 
for k,v in pairs(list) do 
tdcli_function({ID='GetChat',chat_id_ = v
},function(arg,data)
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusMember" then
redis:srem(JoKeR..'Chek:Groups',v)  
tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_=v,user_id_=JoKeR,status_={ID = "ChatMemberStatusLeft"},},function(e,g) end, nil) 
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusLeft" then
redis:srem(JoKeR..'Chek:Groups',v)  
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusKicked" then
redis:srem(JoKeR..'Chek:Groups',v)  
end
if data and data.code_ and data.code_ == 400 then
redis:srem(JoKeR..'Chek:Groups',v)  
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusEditor" then
redis:sadd(JoKeR..'Chek:Groups',v)  
end 
end,nil)
end

elseif (data.ID == "UpdateMessageSendSucceeded") then
local msg = data.message_
local text = msg.content_.text_
local Get_Msg_Pin = redis:get(JoKeR..'Msg:Pin:Chat'..msg.chat_id_)
if Get_Msg_Pin ~= nil then
if text == Get_Msg_Pin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,d) if d.ID == 'Ok' then;redis:del(JoKeR..'Msg:Pin:Chat'..msg.chat_id_);end;end,nil)   
elseif (msg.content_.sticker_) then 
if Get_Msg_Pin == msg.content_.sticker_.sticker_.persistent_id_ then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,d) redis:del(JoKeR..'Msg:Pin:Chat'..msg.chat_id_) end,nil)   
end
end
if (msg.content_.animation_) then 
if msg.content_.animation_.animation_.persistent_id_ == Get_Msg_Pin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,d) redis:del(JoKeR..'Msg:Pin:Chat'..msg.chat_id_) end,nil)   
end
end

if (msg.content_.photo_) then
if msg.content_.photo_.sizes_[0] then
id_photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
id_photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
id_photo = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
id_photo = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
if id_photo == Get_Msg_Pin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,d) redis:del(JoKeR..'Msg:Pin:Chat'..msg.chat_id_) end,nil)   
end
end
end


end -- end new msg
end -- end callback














