local ctx = require "js".global.document:getElementById("canvas"):getContext("2d")
deg = math.pi / 180
si = 315

function star(xi , yi)
	x = xi + si * 0.01565 * math.cos(54 * deg)
	y = yi - si * 0.01565 * math.sin(54 * deg)
	ctx : beginPath()	ctx : moveTo(x , y)
	for i = 0,9 do
		x = xi + si * 0.01565 * (i % 2 + 1) * math.cos( (i * 36 + 54) * deg)
		y = yi - si * 0.01565 * (i % 2 + 1) * math.sin( (i * 36 + 54) * deg)
		ctx : lineTo(x , y)
	end
	ctx : closePath()
end

function rectangle(yi)
    ctx : beginPath()
        ctx : moveTo(0 , yi)
        ctx : lineTo(si * 1.9 , yi)
        ctx : lineTo(si * 1.9 , yi + si / 13)
        ctx : lineTo(0 , yi + si / 13)
    ctx : closePath()
end

for i = 0,12 do
    if i % 2 == 0 then
        ctx.fillStyle = "rgb(178,34,52)"
    else
        ctx.fillStyle = "rgb(255,255,255)"
    end
    rectangle(i * si / 13)
    ctx : fill()
end

ctx.fillStyle = "rgb(60,59,110)"
ctx : beginPath()
    ctx : moveTo(0 , 0)
    ctx : lineTo(si * 0.76 , 0)
    ctx : lineTo(si * 0.76 , si * 7 / 13)
    ctx : lineTo(0 , si * 7 / 13)
ctx : closePath()
ctx : fill()

for i = 1,9 do
    for ii = 1,11 do
        if (i + ii) % 2 == 0 then
            x = si * ii * 0.76 /12
            y = si * i  * 7 /130
            ctx.fillStyle = "rgb(255,255,255)"
            star(x , y)
            ctx : fill()
        end
    end
end
    