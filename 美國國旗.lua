-- 導入 "js" 模組
local js = require "js"
-- global 就是 javascript 的 window
local global = js.global
local document = global.document
-- html 檔案中 canvas　id 設為 "canvas"
-- 準備繪圖畫布
local canvas = document:getElementById("canvas")
-- 將 ctx 設為 canvas 2d 繪圖畫布變數
local ctx = canvas:getContext("2d")

----------------------------------------------------------star
-- 準備在 canvas 中繪圖
function draw_line(x1, y1, x2, y2, color)
    color = color or "red"
    ctx:beginPath()
    ctx:moveTo(x1, y1)
    ctx:lineTo(x2, y2)
    ctx.strokeStyle = color
    ctx:stroke()
end

-- x, y 為中心,  r 為半徑, angle 旋轉角,  solid 空心或實心,  color 顏色
function star(x, y, r, angle, solid, color)
    angle = angle or 0
    solid = solid or false
    color = color or "#f00"
    -- 以 x, y 為圓心, 計算五個外點
    local deg = math.pi/180
    -- 圓心到水平線距離
    local a = r*math.cos(72*deg)
    -- a 頂點向右到內點距離
    local b = (r*math.cos(72*deg)/math.cos(36*deg))*math.sin(36*deg)
    -- 利用畢氏定理求內點半徑
    rin = math.sqrt(a*a + b*b)
    -- 查驗 a, b 與 rin
    --print(a, b, rin)
    if (solid) then
        ctx:beginPath()
    end
    for i = 0, 4 do
        xout = (x + r*math.sin((360/5)*deg*i+angle*deg))
        yout = (y + r*math.cos((360/5)*deg*i+angle*deg))
        -- 外點增量 + 1
        xout2 = x + r*math.sin((360/5)*deg*(i+1)+angle*deg)
        yout2 = y + r*math.cos((360/5)*deg*(i+1)+angle*deg)
        xin = x + rin*math.sin((360/5)*deg*i+36*deg+angle*deg)
        yin = y + rin*math.cos((360/5)*deg*i+36*deg+angle*deg)
        -- 查驗外點與內點座標
        --print(xout, yout, xin, yin)
        if (solid) then
            -- 填色
            if (i==0) then
                ctx:moveTo(xout, yout)
                ctx:lineTo(xin, yin)
                ctx:lineTo(xout2, yout2)
            else
                ctx:lineTo(xin, yin)
                ctx:lineTo(xout2, yout2)
            end
        else
            -- 空心
            draw_line(xout, yout, xin, yin, color)
            -- 畫空心五芒星, 無關畫線次序, 若實心則與畫線次序有關
            draw_line(xout2, yout2, xin, yin, color)
        end
    end
    
    if (solid) then
        ctx.fillStyle = color
        ctx:fill()
    end
end


B = 600
A = 600 / 1.9
C = A * 0.5385
D = A * 0.76
E = A * 0.0538
F = A * 0.0538
G = A * 0.0633
H = A * 0.0633
K = A * 0.0616
L = A * 0.0769
-- 標準


-- 先畫滿地紅
ctx.fillStyle='rgb(252, 0, 0)'
ctx:fillRect(0, 0, B, A)

-- 再畫聯邦區域
ctx.fillStyle='rgb(0, 0, 145)'
ctx:fillRect(0, 0, D, C)

-- 畫白色區域 (1) 短的部份
for i = 0, 3 do
    ctx.fillStyle='rgb(255, 255, 255)'
    ctx:fillRect(D, L + 2 * L * i, 600 - D, L)
end

-- 畫白色區域 (2) 長的部份
for i = 0, 3 do
    ctx.fillStyle='rgb(255, 255, 255)'
    ctx:fillRect(0, C + 2 * L * i, 600, L)
end

-- 畫星星的部份 (1) 六顆星
for j = 0, 4 do 
    for i = 0, 5 do 
        star(G + 2 * H * i, E + 2 * F * j, K/2, 180, true, "#fff")
    end
end
-- 畫星星的部份 (2) 五顆星
for j = 0, 3.5 do 
    for i = 0, 4 do 
        star(2 * G + 2 * H * i, 2 * E + 2 * F * j, K/2, 180, true, "#fff")
    end
end