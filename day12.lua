sin=math.sin
cos=math.cos
pi=math.pi

t=0
W=240
H=136

msg="Thank you TCC! See you again next year!"

function rotatey(p,a)
  return {
    x=p.x*cos(a)-p.z*sin(a),
    y=p.y,
    z=p.x*sin(a)+p.z*cos(a),
    c=p.c,
    r=p.r,
  }
end

p={}

function BOOT()
  local c=3
  local r=6
  for i=1,10 do
    for j=1,i do
      if i>1 then
		      r=1.5
								c=5
								if math.random()<0.12 then 
		        r=2.3
		        c=4 
		      end
						end
      table.insert(p, {
        x=(i-1)*sin((j/i)*2*pi)*10,
        y=(i*20)-120,
        z=(i-1)*cos((j/i)*2*pi)*10,
        c=c,
        r=r,
      })
    end
  end
end

function TIC()
  cls(8)
  poke(0x3FF8*2,8,4)
  
  for i=1,#msg do
    s=string.sub(msg,i,i)
    local h=(H-t*2+i*20)%920
    local w=(sin((h+t)/50)*20)+(170*(((H-t*2+i*20)%1840)//920))
    print(s, 31+w, h+1, 14, 0, 2)
		  print(s, 30+w, h, 12, 0, 2)
  end
  
  for i=1,#p do
    p[i]=rotatey(p[i],0.03)
  end
  
  local m=200
  for i=1,#p do  
    local e=p[i]
    local c=e.c
    if c==4 then
      c=1+((i+t//10)%4)
    end
		  circ((W/2)+m*e.x/(e.z+400), 
		    (H/2)+m*e.y/(e.z+400),
		    --1+e.r/((e.z+10)//10),
						((10-(e.z))//9)*(e.r/2),
						c)
		end
		

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

