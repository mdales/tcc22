cos=math.cos
sin=math.sin
pi=math.pi

t=0
W=240
H=136

function draw1()
  for y=0,H-1 do
    for x=0,W-1 do
      z=10+sin(t/1000)*5
      d=10+cos(t/1000)*5
      c=(sin(sin((x+t)/z))+sin(sin((y+t)/d)))*8
      pix(x,y,c+(t/10))
    end
  end
end

function draw2()
  for j=0,H-1 do
    for i=0,W-1 do
      x=i-(W/2)
      y=j-(H/2)
      d=400/math.sqrt((x*x)+(y*y)+1)
      c=(math.atan2(y,x)+pi)*(16/(2*pi))
      c=c+(sin(t/70)*pi*2)
      d=d+((t/10)%16)
      p=(d//1)~(c//1)
      pix(i,j,(p&11)+8)
    end
  end
end

function BOOT()
end

function TIC()
  cls(0)
  dx=(W/2)+cos(t/10)*(W/2)
  clip(0,0,dx,H)
  draw1()
  clip(dx,0,W-dx+2,H)
  draw2()
 	t=t+1
end

-- <TILES>
-- 001:eccccccccc888888caaaaaaaca888888cacccccccacc0ccccacc0ccccacc0ccc
-- 002:ccccceee8888cceeaaaa0cee888a0ceeccca0ccc0cca0c0c0cca0c0c0cca0c0c
-- 003:eccccccccc888888caaaaaaaca888888cacccccccacccccccacc0ccccacc0ccc
-- 004:ccccceee8888cceeaaaa0cee888a0ceeccca0cccccca0c0c0cca0c0c0cca0c0c
-- 017:cacccccccaaaaaaacaaacaaacaaaaccccaaaaaaac8888888cc000cccecccccec
-- 018:ccca00ccaaaa0ccecaaa0ceeaaaa0ceeaaaa0cee8888ccee000cceeecccceeee
-- 019:cacccccccaaaaaaacaaacaaacaaaaccccaaaaaaac8888888cc000cccecccccec
-- 020:ccca00ccaaaa0ccecaaa0ceeaaaa0ceeaaaa0cee8888ccee000cceeecccceeee
-- </TILES>

-- <WAVES>
-- 000:00000000ffffffff00000000ffffffff
-- 001:0123456789abcdeffedcba9876543210
-- 002:0123456789abcdef0123456789abcdef
-- </WAVES>

-- <SFX>
-- 000:000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000304000000000
-- </SFX>

-- <TRACKS>
-- 000:100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- </TRACKS>

-- <PALETTE>
-- 000:1a1c2c5d275db13e53ef7d57ffcd75a7f07038b76425717929366f3b5dc941a6f673eff7f4f4f494b0c2566c86333c57
-- </PALETTE>

