-- 導入 "js" 模組
local js = require "js"
-- global 就是 javascript 的 window
local global = js.global
local document = global.document
-- html 檔案中 canvas　id 設為 "canvas"
local canvas = document:getElementById("canvas")
-- 將 ctx 設為 canvas 2d 繪圖畫布變數
local ctx = canvas:getContext("2d")

-- 乘上 deg 可轉為徑度單位
deg = math.pi / 180

-- 建立多邊形定點位置畫線函式
function star(radius, xc, yc, n, fs, ss, fors,aa)
radius = radius or 50
xc = xc or 100
yc = yc or 100
n = n or 5
-- 屬性呼叫使用 . 而方法呼叫使用 :
-- 填色屬性
fs = fs or "rgb(200,0,0)"
-- 畫筆顏色屬性
ss = ss or "rgb(0,0,200)"
-- 內定為填色
fors = fors or "fill"
aa=aa or 0
ctx.fillStyle = fs
ctx.strokeStyle = ss
xi = xc + radius*math.cos((360/n)*deg+(90+aa)*deg)
yi = yc - radius*math.sin((360/n)*deg+(90+aa)*deg)
ctx:beginPath()
ctx:moveTo(xi,yi)
for i = 2, n+1 do
x = xc + radius*math.cos((360/n)*deg*i+(90+aa)*deg)
y = yc - radius*math.sin((360/n)*deg*i+(90+aa)*deg)
ctx:lineTo(x,y)
end
ctx:closePath()
if fors == "fill" then
ctx:fill()
else
ctx:stroke()
end
end

--畫圓及圓內白線
star(200, 300, 300, 6, "rgb(0,77,153)", "rgb(100,100,0)", "fill",-90)
star(125, 300, 300, 6, "rgb(255,255,255)", "rgb(100,100,0)", "fill",-90)
star(210, 300, 60, 4, "rgb(255,255,255)", "rgb(100,100,0)", "fill",45)
star(50, 300, 300,36, "rgb(0,77,153)", "rgb(100,100,0)", "fill",45)
star(21, 270, 260, 4, "rgb(255,255,255)", "rgb(100,100,0)", "fill",85)
star(21, 288, 281, 4, "rgb(255,255,255)", "rgb(100,100,0)", "fill",85)
star(21, 304, 300,4, "rgb(999,999,999)", "rgb(100,100,0)", "fill",85)
star(21, 319, 318, 4, "rgb(255,255,255)", "rgb(100,100,0)", "fill",85)
star(21, 334, 336, 4, "rgb(255,255,255)", "rgb(100,100,0)", "fill",85)