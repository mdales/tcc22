sin=math.sin
cos=math.cos

t=0
W=240
H=136

p={}
msg="[insert eurobeats here]"
m=1600

function BOOT()
  cls()
  for z=-24,24,3 do
    for y=-24,24,3 do
      for x=-24,24,3 do
        local t={
          x=x,
          y=y,
          z=z,
        }
        table.insert(p,t)
      end
    end
  end
end

function rotatex(p,a)
  return {
    x=p.x,
    y=p.y*cos(a)-p.z*sin(a),
    z=p.y*sin(a)+p.z*cos(a)
  }
end

function rotatey(p,a)
  return {
    x=p.x*cos(a)-p.z*sin(a),
    y=p.y,
    z=p.x*sin(a)+p.z*cos(a)
  }
end

function rotatez(p,a)
  return {
    x=p.x*cos(a)-p.y*sin(a),
    y=p.x*sin(a)+p.y*cos(a),
    z=p.z
  }
end

function TIC()
  local cc=8+(t/20)%8
  cls(cc)
  poke(0x3FF8*2,cc,4)
  for i=1,#p do
    p[i]=rotatey(p[i],0.02)
    p[i]=rotatex(p[i],0.01)
    p[i]=rotatez(p[i],0.005)
  end
  local m=1000+cos(t/30)*600
 
  table.sort(p, 
    function(a,b) return a.z>b.z end
  )
  z=10+sin(t/1000)*5
  d=10+cos(t/1000)*5
  for i=1,#p do
    local e=p[i]
    local c=(sin(sin((e.x+t)/z))+
       sin(sin((e.y+t)/d))+
       sin(sin((e.z+t)/z)))*8
		  circ((W/2)+m*e.x/(e.z+400), 
		    (H/2)+m*e.y/(e.z+400),
		    (m//200),c)
		end
		
  print(msg, 251-(t%520), 101, 3, 0, 2)
		print(msg, 250-(t%520), 100, 4, 0, 2)
  
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

