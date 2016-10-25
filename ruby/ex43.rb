# Alternative to Exercise 43: Basic Object-Oriented Analysis and Design


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
    ## as the current_scene, note that this returns an instance of a Class
    current_scene = @scene_map.opening_scene()
    ## the end scene is when you reach 'win'
    last_scene = @scene_map.next_scene('win')


    ## While the current scene is not the last scene, keep playing.
    while current_scene != last_scene
      ## call the enter function on the current_scene
      ## and store the returned value as the next_scene_name
      next_scene_name = current_scene.enter()
      ## move to the next scene, the current scene is now
      ## an instance of the 'next' scene
      current_scene = @scene_map.next_scene(next_scene_name)
    end

    # be sure to print out the last scene
    current_scene.enter()
  end
end

## All classes below are subclasses of Scene

## This is when the player wins the game
class Win < Scene
  def enter()
    puts "Woohoo! You are a winner!"
    exit(1)
  end
end


## This is when the player dies
class Death < Scene

  @@quips = [
    "You died.",
    "Wow, you died! You might not be good at this.",
    "Dead. Maybe consider a different hobby.",
  ]

  def enter()
    puts @@quips[rand(0..(@@quips.length - 1))]
    exit(1)
  end
end

## This is the starting point - player must enter the castle to begin
class CastleEntrance < Scene
  def enter()
    puts "You stand outside of the doors of a massive castle."
    puts "A princess has been kidnapped and she is in there."
    puts "The evil elder god and his cultists have taken her for the last time."
    puts "Enter the castle to save the princess?"
    print "> "

    response = $stdin.gets.chomp

    if response.include?("Yes") || response.include?("Y") || response.include?("yes") || response.include?("y")
      puts "You pull the large wooden doors open."
      puts "You enter the main lobby of the castle."
      return 'castle_lobby'

    elsif response.include?("No") || response.include?("no") || response.include?("N") || response.include?("n")
      puts "You have decided to not save the princess"
      puts "Some may consider you a coward."
      puts "While walking away from the castle, you trip and impale yourself on a sharp rock."
      return 'death'

    else
      puts "Does not compute!"
      return 'castle_entrance'
    end
  end
end

## This is the first battle the player will undergo - player must dodge in order to survive and move to the next level.
class CastleLobby < Scene
  def enter()
    puts "Standing at the far end of the room is a figure dressed in red robes."
    puts "A cultist."
    puts "The cultist notices you and begins to charge at you."
    puts "What do you do?: attack, dodge, or panic"
    print "> "

    action = $stdin.gets.chomp

    if action.include?("Attack") || action.include?("attack")
      puts "You start running at the charging cultist."
      puts "You begin to scream and raise your fist."
      puts "Before you are able to swing at the cultist, you lose your balance and trip."
      puts "The cultist takes advantage of your stumble and pulls out a knife and stabs you through the eye."
      puts "You are dead. The cultist begins to eat your face."
      return 'death'

    elsif action.include?("Dodge") || action.include?("dodge")
      puts "You stand your ground until the cultist gets close enough."
      puts "As the cultists swings his fists at your face, you dodge like a world class boxer."
      puts "You take the opportunity to folow the dodge by punching the cultist in the stomach."
      puts "The cultist is winded."
      puts "You ready yourself for a final blow."
      puts "You punch the cultist right in the face."
      puts "His head explodes."
      puts "You make your way up the stairs to the first floor."
      return 'first_floor'

    elsif action.include?("Panic") || action.include?("panic")
      puts "You panic and begin to cry."
      puts "You curl up into a ball on the floor."
      puts "The cultist reaches you and pulls out a knife."
      puts "The cultist stabs you repeatedly."
      puts "You died a coward."
      return 'death'

    else
      puts "Does not computer!"
      return 'castle_lobby'
    end
  end
end


## This is where the player gets the golden AK47
## There is a keypad where the player has to guess the correct numbers
class FirstFloor < Scene
  def enter()
    puts "You do a dive roll into the entrance of the first floor."
    puts "Crouching, you scan the room for more cultists. It's dead quiet, too quiet."
    puts "You stand up and run to the far side of the room and find a safe."
    puts "There is a keypad lock on the safe. If you get the code wrong 5 times then the lock closes forever."
    puts "The code is 3 digits"
    print "[Please enter the code.]> "


    guess = $stdin.gets.chomp
    code = "966"
    guess = code if guess == "cheat"
    try = 1

    while guess != code && try < 5
      puts "BZZZZZEDD!"
      try += 1
      print "[Please enter the code.]> "
      guess = $stdin.gets.chomp
    end

    if guess == code
      puts "The safe clicks open and the seal breaks."
      puts "Inside sits a golden AK47."
      puts "You grab the golden weapon and begin to make your way up the stairs to the second floor."
      return 'second_floor'

    else
      puts "The lock buzzes one last time and then you hear a ticking sound."
      puts "The safe has been wired to explode if the incorrect code has been enter too many times."
      puts "You sit down, close your eyes, and allow the expolosion to engulf while you are at peace."
      return 'death'
    end
  end
end

## This is where the player encounters a group of cultists.
## Player must tell them to scram in order to get to the last level.
class SecondFloor < Scene
  def enter()
    puts "You burst into the second floor with the golden AK47 under your arm."
    puts "You suprise five cultists standing in a circle praying."
    puts "They haven't pulled their weapons out yet, as they see you have a very powerful gun."
    puts "What do you do? : attack, charge, or tell them to scram"
    print "> "

    action = $stdin.gets.chomp

    if action.include?("Attack") || action.include?("attack")
      puts "You begin firing at the cultists."
      puts "You are able to take down the two on the left before the golden AK47 jams."
      puts "Scrambling to unlock the gun, a the remaining cultists charge you."
      puts "The cultists unsheath their knives and begin to stab you."
      return 'death'

    elsif action.include?("Charge") || action.include?("charge")
      puts "You begin to run at the cultists."
      puts "As you approach the circle of cultists, you realize that they weren't praying, but summoning."
      puts "The cultists take a step back and a red horned demon appears."
      puts "Terrified, you stand there shaking, looking up at the demon."
      puts "The demons begins to laugh."
      puts "It reaches down and picks you up with a single swoop. It brings you towards it mouth."
      puts "You have been eaten by a demon."
      return 'death'

    elsif action.include?("Scram") || action.include?("scram")
      puts "You point your gun at the cultists and begin to shout at them."
      puts "The cultists are terrified."
      puts "You tell them to scram."
      puts "The cultists run away in a panic."
      puts "You begin to make your way up to the last floor of the castle, the Battle Room."
      return 'battle_room'

    else
      puts "Does not compute!"
      return 'second_floor'
    end
  end
end

## This is where the player is to face the elder god.
## The player must attack in rder to win.
class BattleRoom < Scene
  def enter()
    puts "You enter the final floor of the castle. The Battle Room."
    puts "In the center of the room, standing at an alter is the elder god."
    puts "On the alter lies the princess. She is unconscious."
    puts "The elder god begins to laugh."
    puts "'You think you can save her?' he shrieks."
    puts "'You are but a weak mortal.'. He begins to laugh."
    puts "What do you do? : attack, run, or threaten"
    print "> "

    response = $stdin.gets.chomp

    if response.include?("Attack") || response.include?("attack")
      puts "You pull up the golden AK47."
      puts "The elder god has a sheer look of fright on his face."
      puts "You take aim and pull the trigger."
      puts "The gun fires a golden bullet which goes straight between the the elder gods eyes."
      puts "The elder god gasps, staggers, and falls to the floor."
      puts "With a single bullet, you were able to kill the evil elder god and save the princess."
      return 'win'

    elsif response.include?("Run") || response.include?("run")
      puts "Terrified, you turn to the stairs and run towards the exit."
      puts "The elder god's laugh begins to grow louder. So loud that you crumble to your knees while covering your ears."
      puts "The laughter continues to get louder."
      puts "You ears begin to bleed, and then your nose."
      puts "There is an external pressure building in your head. It is becoming too much."
      puts "Your head explodes."
      return 'death'

    elsif response.include?("Threaten") || response.include?("threaten")
      puts "You stand your ground and begin to make wise remarks about the elder god's mother."
      puts "Unimpressed, the elder god looks at you and snaps his fingers."
      puts "You disappear. You are a in a black void."
      puts "There is nothing, yet everything surrounding you."
      puts "You begin to scream but there is no sound."
      puts "You try to move your arms but your body does not respond."
      puts "Panic begins to overtake you."
      puts "Was it all worth it?"
      return 'death'

    else
      puts "Does not compute!"
      return 'battle_room'
    end
  end
end


## Game Map
class Map
  @@scenes = {
    "castle_entrance" => CastleEntrance.new(),
    "castle_lobby" => CastleLobby.new(),
    "first_floor" => FirstFloor.new(),
    "second_floor" => SecondFloor.new(),
    "battle_room" => BattleRoom.new(),
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

## oprning_scene calls the next_scene function
## wiht a parameter of @start_scene
  def opening_scene()
    return next_scene(@start_scene)
  end
end

a_map = Map.new('castle_entrance')
a_game = Engine.new(a_map)
a_game.play()