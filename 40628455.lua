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
function star(radius, xc, yc, n, fs, ss, fors)
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
    ctx.fillStyle = fs
    ctx.strokeStyle = ss
    xi = xc + radius*math.cos((360/n)*deg+180*deg)
    yi = yc - radius*math.sin((360/n)*deg+180*deg)
    ctx:beginPath()
    ctx:moveTo(xi,yi)
    for i = 2, n+1 do
        x = xc + radius*math.cos((360/n)*deg*i+180*deg)
        y = yc - radius*math.sin((360/n)*deg*i+180*deg)
        ctx:lineTo(x,y)
    end
    ctx:closePath()
    if fors == "fill" then
        ctx:fill()
    else
        ctx:stroke()
    end
end


star(200, 300, 300, 6, "rgb(100,100,0)", "rgb(100,100,0)", "stroke")
star(140, 300, 300, 6, "rgb(100,100,0)", "rgb(100,100,0)", "stroke")
star(50, 300, 300, 30, "rgb(100,100,0)", "rgb(100,100,0)", "stroke")
ctx:closePath()
ctx:fill()
    