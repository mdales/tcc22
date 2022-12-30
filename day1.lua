-- title:   game title
-- author:  game developer, email, etc.
-- desc:    short description
-- site:    website link
-- license: MIT License (change this to your license of choice)
-- version: 0.1
-- script:  lua

w=240
h=136

b=120
t=0

snow_count=100
snow={}

function BOOT()

  for i=1,snow_count do
    snow[i]={math.random() * w, 
      math.random() * b}
  end

end

function TIC()

		-- world
  cls(8)
  rect(0, b, w, h-b, 12)
  
  
  -- pot
  tri((w/2)+20, b-20, (w/2)-10, b, 
  	 (w/2)-20, b-20, 2)
  tri((w/2)-10, b, (w/2)+10, b, 
  	 (w/2)+20, b-20, 2)
    
  -- trunk
  rect((w/2)-5, b-50, 10, 30, 3) 
  
  -- leaves
  for i=0, 4 do
   d = ((i + 2) * 5) + (i * 10)
   r = (i + 1) * 7
  	tri((w/2), d, (w/2)-r, d+20,
     (w/2)+r, d+20, 7)
  end
  
  -- star
  tri((w/2), 5, (w/2)-7, 15, 
  	 (w/2)+7, 15, 3 + ((t/20)%2))
  tri((w/2), 20, (w/2)-7, 10,
    (w/2)+7, 10, 3 + ((t/20)%2))

  -- snow 
  
  -- stars
  for i = 1, snow_count do
    x=snow[i][1]
    y=snow[i][2]
    pix(x, y, 12)
    y = (y + 1) % b
    if y<1 then
      -- if we hit the ground,
      -- make a new flake
      x = math.random() * w
      snow[i][1] = x
    end 
    snow[i][2] = y
  end


  t = t + 1
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

