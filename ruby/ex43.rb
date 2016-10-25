# Basic Object-Oriented Analysis and Design
# Gothons from Planet Percal #25


## Game Scene

class Scene
   def enter()
    abort("This function 'enter' should not be used directly. Please subclass Scene and implement an enter method.")
  end
end

## Game Engine

class Engine
## The initialize function takes a scene_map parameter
  def initialize(scene_map)
    @scene_map = scene_map
  end

  def play()
    ## from the scene map, get the opening scene
    ## as current scene - returns a class
    current_scene = @scene_map.opening_scene()
    ## last scene is when you reach 'win'
    last_scene = @scene_map.next_scene('finished')

    ## While the current scene is not the last scene,
    ## keep playing
    while current_scene != last_scene
      ## call the enter fucntion on the current scene
      ##and store the returned value as the next scene name
      next_scene_name = current_scene.enter()
      ## move to the next scene, the current scene is now
      current_scene = @scene_map.next_scene(next_scene_name)
    end

  end
end

## All classes below are subclasses of Scene

## When the player wins the game
class Win < Scene
  def enter()
    puts "You are a winner!"
    exit(1)
  end
end

## When the player dies
class Death < Scene

  @@quips = [
    "You died.  You kinda suck at this.",
     "Your mom would be proud...if she were smarter.",
     "Such a luser.",
     "I have a small puppy that's better at this."
  ]

  def enter()
    puts @@quips[rand(0..(@@quips.length - 1))]
    exit(1)
  end
end


## This is the starting point  - Gothon is already standing there
## Player must defeat the Gothon with a joke
class CentralCorridor < Scene

  def enter()
    puts "The Gothons of Planet Percal #25 have invaded your ship and destroyed"
    puts "your entire crew.  You are the last surviving member and your last"
    puts "mission is to get the neutron destruct bomb from the Weapons Armory,"
    puts "put it in the bridge, and blow the ship up after getting into an "
    puts "escape pod."
    puts "\n"
    puts "You're running down the central corridor to the Weapons Armory when"
    puts "a Gothon jumps out, red scaly skin, dark grimy teeth, and evil clown costume"
    puts "flowing around his hate filled body.  He's blocking the door to the"
    puts "Armory and about to pull a weapon to blast you."
    print "> "

    action = $stdin.gets.chomp

    if action.include?("shoot") || action.include?("attack")
      puts "Quick on the draw you yank out your blaster and fire it at the Gothon."
      puts "His clown costume is flowing and moving around his body, which throws"
      puts "off your aim.  Your laser hits his costume but misses him entirely.  This"
      puts "completely ruins his brand new costume his mother bought him, which"
      puts "makes him fly into an insane rage and blast you repeatedly in the face until"
      puts "you are dead.  Then he eats you."
      return 'death'

    elsif action.include?("hide") || action.include?("run")
      puts "You scream in terror and look for a place to hide."
      puts "You run back the way you came, trying to open a door, any door."
      puts "Unfortunately the doors are all in lock down mode."
      puts "As you struggle with a door, the Gothon reaches for its space blaster and shoots you."
      return 'death'

    elsif action == "dodge!"
      puts "Like a world class boxer you dodge, weave, slip and slide right"
      puts "as the Gothon's blaster cranks a laser past your head."
      puts "In the middle of your artful dodge your foot slips and you"
      puts "bang your head on the metal wall and pass out."
      puts "You wake up shortly after only to die as the Gothon stomps on"
      puts "your head and eats you."
      return 'death'

    elsif action == "tell a joke"
      puts "Lucky for you they made you learn Gothon insults in the academy."
      puts "You tell the one Gothon joke you know:"
      puts "Lbhe zbgure vf fb sng, jura fur fvgf nebhaq gur ubhfr, fur fvgf nebhaq gur ubhfr."
      puts "The Gothon stops, tries not to laugh, then busts out laughing and can't move."
      puts "While he's laughing you run up and shoot him square in the head"
      puts "putting him down, then jump through the Weapon Armory door."
      return 'laser_weapon_armory'

    else
      puts "DOES NOT COMPUTE!"
      return 'central_corridor'
    end
  end


## This is where the player gets a neutron bomb to blow up the ship.
## There is a keypad where the player has to guess the number.
  class LaserWeaponArmory < Scene

  def enter()
    puts "You do a dive roll into the Weapon Armory, crouch and scan the room"
    puts "for more Gothons that might be hiding.  It's dead quiet, too quiet."
    puts "You stand up and run to the far side of the room and find the"
    puts "neutron bomb in its container.  There's a keypad lock on the box"
    puts "and you need the code to get the bomb out.  If you get the code"
    puts "wrong 10 times then the lock closes forever and you can't"
    puts "get the bomb.  The code is 3 digits."
    code = "#{rand(1..9)}#{rand(1..9)}#{rand(1..9)}"
    print "[Enter passcode]> "


    guess = $stdin.gets.chomp
    password = "8#{rand(9)}7"
    guess = password if guess == "cheat"
    try = 1

    while guess != password && try < 5
      puts "BZZZZEDDD!"
      try += 1
      print "[Enter passcode]> "
      guess = $stdin.gets.chomp
    end

    if guess == password
        puts "The container clicks open and the seal breaks, letting gas out."
        puts "You grab the neutron bomb and run as fast as you can to the"
        puts "bridge where you must place it in the right spot."
        return 'the_bridge'
    else
        puts "The lock buzzes one last time and then you hear a sickening"
        puts "melting sound as the mechanism is fused together."
        puts "You decide to sit there, and finally the Gothons blow up the"
        puts "ship from their ship and you die."
        return 'death'
    end
  end
end

## This is where the player battles a Gothon and places the bomb.
class TheBridge < Scene

  def enter()
    puts "You burst onto the Bridge with the netron destruct bomb"
    puts "under your arm and surprise 5 Gothons who are trying to"
    puts "take control of the ship.  Each of them has an even uglier"
    puts "clown costume than the last.  They haven't pulled their"
    puts "weapons out yet, as they see the active bomb under your"
    puts "arm and don't want to set it off."
    print "Do you throw the bomb at them? > "

    throw_bomb = $stdin.gets.chomp.downcase

    if throw_bomb == "yes" || throw_bomb == "y"
      puts "You throw the bomb towards the Gothons in a panic and run for the door."
      puts "As soon as you throw the bomb, one of the Gothons shoots a laser jet at you."
      puts "As you fall, you feel your life slip away as you see the Gothons rush to disassemble the bomb."
      puts "Your last comfort is knowing they will probably join you when the bomb detonates."
      return 'death'
    elsif throw_bomb == "no" || throw_bomb == "n"
      puts "You lift the bomb threateningly and back toward the door."
      puts "The Gothons circle you slowly getting closer but you place the bomb quickly."
      puts "You jump back through the door and lock it, shooting the lock to smithereens so they can't get out."
      puts "Now, you have to get out of here! Run for the escape pod!"
      return 'escape_pod'
    else
      puts "DOES NOT COMPUTE!"
      return "the_bridge"
    end
  end
end

## This is where the player excapes, but only after guessing the right escape pod.
class EscapePod < Scene

  def enter()
    puts "You rush through the ship desperately trying to make it to"
    puts "the escape pod before the whole ship explodes.  It seems like"
    puts "hardly any Gothons are on the ship, so your run is clear of"
    puts "interference.  You get to the chamber with the escape pods, and"
    puts "now need to pick one to take.  Some of them could be damaged"
    puts "but you don't have time to look.  There's 5 pods, which one"
    puts "do you take?"

    good_pod = rand(1..5)

    print "[pod #]> "

    guess = $stdin.gets.chomp
    guess = good_pod if guess == "cheat"

    if guess.to_i == good_pod
      puts "You jump into pod %s and hit the eject button." %guess
      puts "The pod escapes into space, and heads back to planet Earth."
      puts "You look back and see the spaceship explode in a celebration of colors."
      puts "You did it!"
      return 'win'
    else
      puts "You jump into pod %s and hit the eject button." %guess
      puts "The pod escapes out into space, then implodes as the hull ruptures."
      puts "You are crushed into space jam."
      return 'death'
    end
  end
end

## Game map
class Map
  @@scenes = {
    "central_corridor" => CentralCorridor.new(),
    "laser_armory" => LaserWeaponArmory.new(),
    "the_bridge" => TheBridge.new(),
    'escape_pod' =>EscapePod.new(),
    "death" => Death.new(),
    "win" => Win.new()
  }

  def initialize(start_scene)
    @start_scene = start_scene
  end

  ## next_scene takes a scene_name parameter,
  ## and returns an instance of the next scene
  def next_scene(scene_name)
    return @@scenes[scene_name]
  end

  ## opening scene calls the next_scene function
  ## with a parameter of @start_scene
  def opening_scene()
    return next_scene(@start_scene)
  end
end

a_map = Map.new('central_corridor')
an_engine = Engine.new(a_map)
an_engine.play()