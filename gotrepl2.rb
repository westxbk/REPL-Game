def get_input(setup, options)
	puts setup
	puts options
	gets.chomp.downcase.strip
end

def text_break
  puts "\n"
  puts "-+-" * 40
  puts "\n"
end

def rally_troops
northern_meeting = get_input("You arive late and many of the lords are drunk. Jon Umber, upset by your tardiness, threatens to take his men home, crippling your army. How do you respond to his threat?\n\n", "Options: Sorry sir, Ignore him, Call him a coward")

case northern_meeting
when "sorry sir"
  text_break
	puts "Jon Umber : I knew you were weak. I'm leaving, and taking my men with me."
  text_break
	$honor_one = 0
when "ignore him"
  text_break
	puts "Jon Umber : This pup doesn't take bait huh? That's good."
  text_break
	$honor_one = 1
when "call him a coward"
  text_break
	puts "Jon Umber : Har! We'll see who the coward is on the battlefield."
  text_break
	$honor_one = 3
else
  text_break
	puts "You failed to make a decision. The Northmen don't like that."
  text_break
	$honor_one = 0
	end
  text_break
	puts "You earned #{$honor_one} honor."
  text_break
end

def battle_one
	battleone = get_input("Where do you want to attack?\n\n", "Options: The Riverlands, The Reach, The Tooth")

	case battleone
	when "the tooth"
    text_break
		puts "You tell your commanders you want to attack The Tooth, the western most Lannister fortress Westeros."
    puts "You head west and attack The Tooth. Your forces win a hard fought victory."
    text_break
		$honor_two = 2
	when "the reach"
    text_break
		puts "You head east into The Reach and encounter nothing but a few Lannister patrols."
    puts "Clearing the area of their scouts is a small victory."
    text_break
    $honor_two = 1
	when "the riverlands"
    text_break
		puts "You head south into The Riverlands. The Lannister army is caught unprepared and are routed."
    puts "You have freed the land from their tyranny."
    text_break
    $honor_two = 3
	else
    text_break
		puts "You stay in the North and await further intelligence."
    text_break
		$honor_two = 0
	end
  text_break
	puts "You earned #{$honor_two} honor."
  text_break
end

def battle_two
	battletwo = get_input("Do you trust the commanders information?\n\n", "Options: Yes or No")

	case battletwo
	when "yes"
    text_break
		puts "You listen to the commanders information and plan an attack on The Twins."
    puts "The battle is a disaster and you lose a large portion of your forces."
    text_break
    $honor_three = 1
	when "no"
    text_break
		puts "You decide that the Lannister is lying and send out your scouts instead."
    text_break
    $honor_three = 3
	else
    text_break
		puts "You take too long to decide and Jon Umber beheads the Lannister."
    puts "You are unsure of how to proceed so you stay in the North."
    text_break
    $honor_three = 0
	end
  text_break
  puts "You earned #{$honor_three} honor."
  text_break
end

def battle_three
	battlethree = get_input("Where do you want to strike?\n\n", "Options: The Stormlands, Kings Landing")

	case battlethree
	when "the stormlands"
    text_break
		puts "You move your armies east and attack Tywin Lannister in The Stormlands."
    puts "His reputation as the greatest general ever is well earned."
    puts "You are defeated and your army is routed."
    text_break
		$honor_four = -3
	when "kings landing"
    text_break
		puts "You sail along the coast and come upon an unsuspecting Kings Landing."
    puts "With Tywin Lannister taking most of the forces, you easily crush the remaining army and capture King Joffrey."
    text_break
    $honor_four = 3
	else
    text_break
		puts "Your army is attacked by The White Walkers. You manage to flee and escape their wrath."
    text_break
    $honor_four = 0
	 end
   text_break
	 puts "You earned #{$honor_four} honor."
   text_break
end

def yes_or_no?
  choice = get_input("Yes", "No")
   case choice
	 when "yes"
		 true
	 when "no"
  # when "Yes", 'Y', 'True', '1' # multiple option support in case/when
  #   true
  # when "No", 'N', 'False', '0'
    false
  else
    # default yes
    true
  end
end

def continue?
  result = get_input("Continue?", "Yes, No")
   case result
	 when true
		 start_game_loop
	 when false
		 start_game_loop
	 end
end

#def continue_two


def start_game_loop
  game_over = false
  until game_over
		text_break
		puts "Welcome to Westeros, a land torn apart by unrelenting civil war. The King Joffrey Lannister has killed the honorable Ned Stark."
		puts "As his son, Rob Stark, you decide to gather and lead an army in rebellion against the throne."
		text_break
		puts "Can you win earn enough honor to avenge your father and claim the throne for yourself?"
		puts "Or will you lose and cause your house to fall into ruin?"
		text_break
		puts "Your first task awaits. The men in North need to know of your resolve before they will join you in battle."
		puts "You call a meeting with the noble leaders of the North."
		text_break
		rally_troops

		text_break
		puts "Now that your troops are secured, your first battle awaits."
		puts "One of your scouts has brought you reports of Lannister army encampments scattered nearby."
		text_break
		battle_one

		text_break
		puts "Your army's morale is heightened by your early victory."
		puts "During the battle you capture a Lannister commander who gives you additional information on enemy troop placement."
		text_break
		battle_two

		text_break
		puts "The time has come to take the fight to the Lannister's doorstep."
		puts "Tywin Lannister, the head of the Lannister family, is in The Stormlands with his army."
		text_break
		puts "His grandson, King Joffrey, the man who murdered your father, is in Kings Landing."
		text_break
		battle_three

		text_break
		puts "You have fought valiantly. Everyone knows that the most honorable men are the victors in Westeros, so let's see how you did."
		 final_honor = ($honor_one + $honor_two + $honor_three + $honor_four)
		text_break
		 puts "Your final honor is #{final_honor}"
		 if final_honor <= 0
		 	puts "Your campaign to avenge your father has been a disaster. While you waged war against the Lannisters, the real threat gathered strength."
		  puts "The White Walkers swarm across the land, killing everyone they encounter."
		elsif final_honor <=4
		 	puts "You waged a noble effort against the Lannister army. Unfortunately the war eventually became a stalemate."
		  puts "You and the armies of the North are forced to return home, content in the fact that at least there are no Lannisters at home."
		elsif final_honor <= 11
		 	puts "Congratulations, you successfully avenged your father and deafeated the Lannister army."
		  puts "You have become the new king of Westeros. Long live the king!"
		 else
		 	puts "You had a vision of the future. Blessed with the knowledge of the future, go forward and forge your destiny."
		 end
		 game_over = !continue?
  end
end

start_game_loop
