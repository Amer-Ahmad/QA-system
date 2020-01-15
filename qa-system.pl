use WWW::Wikipedia;
use Data::Dumper;

 
# Amer Haj Ahmad
# Class: CMSC416
# ID: V00897230

# the following program simulate a question_answering system mainly based on Wikipedia.
# the program is designed to answer the questions that only start with who|what|where|when.
# the algorithm that is used to find the answers for the queries asked is mainly based on regular expression, that is,
# by identifying certain patterns in the articles searched in Wikipedia to extract the most accurate answer.
# the program could be run from the cmd by typing perl qa-system.pl mylog.txt
# where mylog.txt is a txt file that records the queries and the answers provided by the system. In addition to printing the article
# that was searched for in Wikipedia, and that is for debugging purposes.

# sample input/output:
#Question who is god?

# {{multiple image | footer = Many religions use images to "represent" God in icons for art or for | worship. Here are some examples of representations of God in Christianity and | various branches of Hinduism. perrow = 2 total_width=240  | image1 = Michelangelo, Creation of Adam 06.jpg width1 = 535 height1 = 750  | image2 = Gombak Selangor Batu-Caves-01.jpg width2 = 1712 height2 = 2288  | image3 = Acintya Bali.jpg width3 = 700 <!-- Width different form original | width for alignment reasons --> height3 = 882  | image4 = Lalita sm.JPG width4 = 205 height4 = 246 }} , an ancient symbol for the metaphysical Absolute. Early science, particularly geometry and astrology and astronomy, was connected to the divine for most medieval scholars, and many believed that there was something intrinsically "divine" or "perfect" that could be found in circles. Arthur Koestler, [[The Sleepwalkers (Koestler book)|The Sleepwalkers]]: A History of Mans Changing Vision of the Universe (1959) Proclus, [https://books.google.com/books?id=E1HYAAAAMAAJ The Six Books of Proclus, the Platonic Successor, on the Theology of Plato] Tr. Thomas Taylor (1816) Vol. 2, Ch. 2, "Of Plato" ]]   In monotheistic thought, God is conceived of as the supreme being, creator deity, and principal object of faith. Swinburne, R.G. "God" in Honderich, Ted. (ed)The Oxford Companion to Philosophy, Oxford University Press, 1995.  The conceptions of God, as described by theologians, commonly include the attributes of omniscience (all-knowing), omnipotence (all-powerful), omnipresence (all-present), and as having an eternal and necessary existence. Depending on ones kind of theism, these attributes are used either in way of analogy, or in a literal sense as distinct properties. God is most often held to be incorporeal (immaterial). David Bordwell (2002). Catechism of the Catholic Church, Continuum International Publishing p. 84  Incorporeality and corporeality of God are related to conceptions of transcendence (being outside nature) and immanence (being in nature) of God, with positions of synthesis such as the "immanent transcendence". Psychoanalyst Carl Jung equated religious ideas of God with transcendental aspects of consciousness in his interpretation.<ref name=jung>   Some religions describe God without reference to gender, while others or their translations use terminology. Judaism attributes only a grammatical gender to God, using terms such as "Him" or "Father" for convenience. "G-d has no body, no genitalia, therefore the very idea that G-d is male or female is patently absurd. Although in the Talmudic part of the Torah and especially in Kabalah G-d is referred to under the name Shchinah – which is feminine, this is only to accentuate the fact that all the creation and nature are actually in the receiving end in reference to the creator and as no part of the creation can perceive the creator outside of nature, it is adequate to refer to the divine presence in feminine form. We refer to G-d using masculine terms simply for conveniences sake, because Hebrew has no neutral gender; G-d is no more male than a table is." [http://www.jewfaq.org/g-d.htm Judaism 101]. "The fact that we always refer to God as He is also not meant to imply that the concept of sex or gender applies to God." Rabbi Aryeh Kaplan, The Aryeh Kaplan Reader, Mesorah Publications (1983), p. 144   God has been conceived as either personal or impersonal. In theism, God is the creator and sustainer of the universe, while in deism, God is the creator, but not the sustainer, of the universe. In pantheism, God is the universe itself. In atheism, there is an absence of belief in God. In agnosticism, the existence of God is deemed unknown or unknowable. God has also been conceived as the source of all moral obligation, and the "greatest conceivable existent".<ref name="Swinburne" /> Many notable philosophers have developed arguments for and against the existence of God.   Monotheists refer to their gods using names prescribed by their respective religions, with some of these names referring to certain cultural ideas about their gods identity and attributes. In the ancient Egyptian era of Atenism, possibly the earliest recorded monotheistic religion, this deity was called Aten, Jan Assmann, Religion and Cultural Memory: Ten Studies, Stanford University Press 2005, p. 59  premised on being the one "true" Supreme Being and creator of the universe. M. Lichtheim, Ancient Egyptian Literature, Vol. 2, 1980, p. 96  In the Hebrew Bible and Judaism, Elohim, Adonai, YHWH () and other names are used as the names of God. Yahweh and Jehovah, possible vocalizations of YHWH, are used in Christianity. In the Christian doctrine of the Trinity, God, coexisting in three "persons", is called the Father, the Son, and the Holy Spirit. In Islam, the name Allah is used, while Muslims also have a multitude of titular names for God. In Hinduism, Brahman is often considered a monistic concept of God. Pantheism: A Non- Theistic Concept of Deity – p. 136, Michael P. Levine – 2002  In Chinese religion, Shangdi is conceived as the progenitor (first ancestor) of the universe, intrinsic to it and constantly bringing order to it. Other religions have names for the concept, for instance, Baha in the Baháí Faith, A Feast for the Soul: Meditations on the Attributes of God : ... – p. x, Baháʾuʾlláh, Joyce Watanabe – 2006 Philosophy and Faith of Sikhism – p. ix, Kartar Singh Duggal – 1988  Sang Hyang Widhi Wasa in Balinese Hinduism, McDaniel, June (2013), A Modern Hindu Monotheism: Indonesian Hindus as ‘People of the Book’. The Journal of Hindu Studies, Oxford University Press,  The Intellectual Devotional: Revive Your Mind, Complete Your Education, and Roam confidently with the cultured class, David S. Kidder, Noah D. Oppenheim, p. 364   The many different conceptions of God, and competing claims as to Gods characteristics, aims, and actions, have led to the development of ideas of omnitheism, pandeism, {{cite book |title= The God Franchise: A Theory of Everything |author = Alan H. Dawe |year = 2011 |isbn = 978-0-473-20114- 2 |page = 48 |quote = Pandeism: This is the belief that God created the universe, is now one with it, and so, is no longer a separate conscious entity. This is a combination of pantheism (God is identical to the universe) and deism (God created the universe and then withdrew Himself). }}   or a perennial philosophy, which postulates that there is one underlying theological truth, of which all religions express a partial understanding, and as to which "the devout in the various great world religions are in fact worshipping that one God, but through different, overlapping concepts". Christianity and Other Religions, by John Hick and Brian Hebblethwaite. 1980. p. 178.  


#god is conceived of as the supreme being, creator deity, and principal object of faith.


#Question what is a clock?

#    .]] at the Royal Observatory, Greenwich.]] A clock is an instrument used to measure, keep,<!-- Per and , please do not remove comma without consensus on the talk page --> and indicate time. The clock is one of the oldest human inventions, meeting the need to measure intervals of time shorter than the natural units: the day, the lunar month,<!-- Per WP:RETAIN and MOS:OXFORD, please do not remove comma without consensus on the talk page --> and the year. Devices operating on several physical processes have been used over the millennia.  Some predecessors to the modern clock may be considered as "clocks" that are based on movement in nature: A sundial shows the time by displaying the position of a shadow on a flat surface. There is a range of duration timers, a well-known example being the hourglass. Water clocks, along with the sundials, are possibly the oldest time-measuring instruments. A major advance occurred with the invention of the verge escapement, which made possible the first mechanical clocks around 1300 in Europe, which kept time with oscillating timekeepers like balance wheels. {{cite book |last=Dohrn-van Rossum |first=Gerhard |title=History of the Hour: Clocks and Modern Temporal Orders |year=1996 |publisher=Univ. of Chicago Press |url=https://books.google.com/?id=xYhlNoUu- toC&dq=verge+escapement+technology |isbn=978-0-226-15511-1}}, pp. 103–104 <ref name="White">{{cite book  | last = White first = Lynn, Jr. title = Medieval Technology and Social Change  | publisher = Oxford Univ. Press year = 1962 location = UK pages = 119 url =  | doi = isbn = }}   Traditionally in horology, the term clock was used for a striking clock, while a clock that did not strike the hours audibly was called a timepiece. see Baillie et al., p. 307; Palmer, p. 19; Zea & Cheney, p. 172  In general usage today, a "clock" refers to any device for measuring and displaying the time. Watches and other timepieces that can be carried on ones person are often distinguished from clocks.  Spring-driven clocks appeared during the 15th century. During the 15th and 16th centuries, clockmaking flourished. The next development in accuracy occurred after 1656 with the invention of the pendulum clock. A major stimulus to improving the accuracy and reliability of clocks was the importance of precise time-keeping for navigation. The electric clock was patented in 1840. The development of electronics in the 20th century led to clocks with no clockwork parts at all.  The timekeeping element in every modern clock is a harmonic oscillator, a physical object (resonator) that vibrates or oscillates at a particular frequency.  This object can be a pendulum, a tuning fork, a quartz crystal, or the vibration of electrons in atoms as they emit microwaves.  Clocks have different ways of displaying the time. Analog clocks indicate time with a traditional clock face, with moving hands. Digital clocks display a numeric representation of time. Two numbering systems are in use; 24-hour time notation and 12-hour notation. Most digital clocks use electronic mechanisms and LCD, LED, or VFD displays. For the blind and use over telephones, speaking clocks state the time audibly in words. There are also clocks for the blind that have displays that can be read by touch. The study of timekeeping is known as horology. 


#a clock is an instrument used to measure, keep, and indicate time.


#Question what is wood?

#       {{Annotated image 4 | caption = header = alt = image = 16 wood samples.jpg align = right image-width | = 350 width = 350 height = 431 annot-font-size = 12 annot-color =f annot-text- | align = annotations =                    }}  Wood is a porous and fibrous structural tissue found in the stems and roots of trees and other woody plants. It is an organic material, a natural composite of cellulose fibers that are strong in tension and embedded in a of lignin that resists compression. Wood is sometimes defined as only the secondary xylem in the stems of trees,  or it is defined more broadly to include the same type of tissue elsewhere such as in the roots of trees or shrubs. In a living tree it performs a support function, enabling woody plants to grow large or to stand up by themselves. It also conveys water and nutrients between the leaves, other growing tissues, and the roots. Wood may also refer to other plant materials with comparable properties, and to material engineered from wood, or wood chips or fiber.  Wood has been used for thousands of years for fuel, as a construction material, for making tools and weapons, furniture and paper. More recently it emerged as a feedstock for the production of purified cellulose and its derivatives, such as cellophane and cellulose acetate.  As of 2005, the growing stock of forests worldwide was about 434 billion cubic meters, 47% of which was commercial.  As an abundant, carbon-neutral renewable resource, woody materials have been of intense interest as a source of renewable energy. In 1991 approximately 3.5 billion cubic meters of wood were harvested. Dominant uses were for furniture and building construction.<ref name=Ullmann>Horst H. Nimz, Uwe Schmitt, Eckart Schwab, Otto Wittmann, Franz Wolf "Wood" in Ullmanns Encyclopedia of Industrial Chemistry 2005, Wiley-VCH, Weinheim.   


#wood is a porous and fibrous structural tissue found in the stems and roots of trees and other woody plants.


###################################################################################################################################################


#additions on Programming Assignment 5:
# the enhancements to the query reformulation are adding more several manually-crafted regular expression to try to pick up the answer from wikipedia.
# as there is at least two query re-writes for each type of question.
# the enhancements in answer composition include 
# 1- gram tiling: as the program compare each two answers and try to tile them together in case were similar. Moreover, the product score of the tiles answer would be the average 
# of the scores of the two answers that got tiled.
# 2- several manually-crafted sentences compositions were added so that the answer would be expressed in a right grammatical way. (picking up what is only important when matching a potential answer by reg-ex)

# scoring:
# the program assigns a confidence score for each potential answer. the confidence scores are assigned manually according to how suitable a regular expression would be as a potential answer.
# moreover, the program dynamically change the confidence score for the same regular expression according to the heuristic of the number of matches.
# as the algorithm follows an approach similar to the simulated annealing approach. with the heuristic of the answer would be most likely to be found at the first part of the paragraph.
# Thus a regular expression matches the confidence score is multiplied by a multiplier which is decreased every time a match happen.

# when asked (where is Finland?) several answers that match with the regular expressions will be assigned with the following confidence scores.
# ps: (if an answer got mentioned twice that means it matches with more than one reg-ex)

# is in Swedish, and in Sami, is the long protocol name, which is however not defined by law -- 0.8

# is in Northern Europe bordering the Baltic Sea, Gulf of Bothnia, and Gulf of Finland, between Norway to the north, Sweden to the northwest, and Russia to the east -- 0.92

# is situated in the geographical region of Fennoscandia -- 0.704

# is in the southern region -- 0.672

# is in Europe and the most sparsely populated country in the European Union -- 0.64

# is in the capital city of Helsinki, local governments in 311 municipalities, and one autonomous region, the ┼land Islands -- 0.608

# is in Estonia, Russia, and Norway -- 0.576

# are in 5200&nbsp;BCE, when the Comb Ceramic culture was introduced -- 0.544

# are in southern coastal Finland between 3000 and 2500&nbsp;BCE may have coincided with the start of agriculture -- 0.512

# were in the Fennoscandian and Baltic regions and the sedentary farming inhabitation increased towards the end of Iron Age -- 0.48

# are in contemporary jewellery -- 0.52

# are in contemporary jewellery -- 0.52

# is in the prevalence of the Swedish language and its official status -- 0.384

# was in the world to give all (adult) citizens full suffrage, in other words the right to vote and to run for office, in 1906 -- 0.352

# was in the world to grant all (adult) citizens the right to vote, in 1893 -- 0.32

# are in widespread prosperity and one of the highest per capita incomes in the world -- 0.288

# is in numerous metrics of national performance, including education, economic competitiveness, civil liberties, quality of life, and human development -- 0.256

# the final answer: Finland is in Northern Europe bordering the Baltic Sea, Gulf of Bothnia, and Gulf of Finland, between Norway to the north, Sweden to the northwest, and Russia to the east.


# notes: I added searchinwiki subroutine that will try to search for all possible bigrams and trigrams of the question as if the whole question was long and could not be found in wikipedia
# this would give a higher chance of finding something in wikipedia.

my $wiki = WWW::Wikipedia->new( clean_html => 1 );

my $result;

#getting the log file
my $file = @ARGV[0];
print("$file\n");
#creating the log file
open( HANDLER , '>' , $file ) or die "cannot create file '$file' ";
print( "This is a Question-Answering system made by Amer Haj Ahmad, it will try to answer questions of the form Who, Where, When, What\n" );

my $ques;
my $tense;
my $x;
my $prop;
my $corpus;
my @grams_2;
my @grams_3;
my $partial_x;
my $flag = 0;
# boolean flags to signify birth and death questions
my $birth=0;
my $death=0;
my $mult = 1;
my $B = 0.04;
my @answers;
my %scores = ();
my @months = ("January","February","March","April","May","June","July","August","September","October","November","December");


# a sub routine that will generate n-grams
sub n_grams()
{
	my $query = @_[0];
	my $n = @_[1];
	#print("$n\n");
	my @array = split(/\s+/,$query);
	my @ret;
	my $k=0;
	my $str = "";
	for( my $i=0 ; $i+$n-1<=$#array ; $i++ )
	{
		$str = "";
		for ( my $j=$i ; $j<$i+$n ; $j++ )
		{
			$str = $str.$array[$j]." ";
		}
		#print("$str\n\n");
		push( @ret, $str );
	}
	return @ret;
}

# a sub routine that will search for all bigrams & trigrams in wikipedia.
sub searchInWiki()
{

	for ( my $i=0 ; $i<$#grams_3 ; $i++ )
	{
		
		$res = $wiki->search($grams_3[$i]);
		if ( $res )
		{
			$partial_x = $grams_3[$i];
			return $res->text();
		}
	}
	for ( my $i=0 ; $i<$#grams_2 ; $i++ )
	{
	
		$res = $wiki->search($grams_2[$i]);
		if ( $res )
		{
			$partial_x = $grams_2[$i];
			return $res->text();
		}
	}
	return "";
}

# a sub-routine to parse the corpus that was searched in Wikipedia
sub parse()
{
	#getting rid of useless texts
	$corpus =~s/\<(.*)\>/ /g;
	$corpus =~s/\n/ /g;
	$courps =~s/[^\x00-\x7F]+//g;
	#$corpus =~s/(\)|\}|\]|\[|\{|\(|\||\')//g;
	$corpus =~s/\'//g;
	print( "$corpus\n\n\n" );
	#print HANDLER "$corpus\n\n\n";
	return $corpus;
}

# a sub-routine to assign scores. 
sub assignscore()
{
	my $sc = @_[0];
	my $ret = $sc * $mult;
	$mult -= $B;
	return $ret;
}


# a sub routine to merge two answers together (in other words tiling similar answers together)
sub configureAnswers()
{
	my $s1 = @_[0];
	my $s2 = @_[1];
	$s1 =~s /(\/|\{|\}|\)|\(|\]|\[)//g;
	$s2 =~s /(\/|\{|\}|\)|\(|\]|\[)//g;
	my @ans1 = split($s1,/\s+/);
	my @ans2 = split($s2,/\s+/);
	
	my $p1=0;
	my $p2=0;
	my $ret = "";
	my $fl=0;
	while ( $p1<$#ans1 and $p2<$#ans2 )
	{
		if ( lc($ans1[$p1]) eq lc($ans2[$p2]) )
		{
			$ret = $ret.$ans1[$p1]." ";
			$p1++;
			$p2++;
			$fl=1;
		}
		else
		{
			$ret = $ret.$ans1[$p1]." ";
			$p1++;
		}
	}
	
	if ( $fl eq 1 )
	{
		return $ret;
	}
	else
	{
		return "";
	}
}



sub configureWhat()
{
	my $x = @_[0];
	my $score = 0;
	my @terms = split/\s+/,$x;
	my @array = split/\./,$corpus;
	
		for( my $i=0 ; $i<$#array ; $i++ )
		{
			#print( "$array[$i] !!!!!! \n" );
			#identifying the answer for the query (query rewrite)
			if ( $array[$i] =~m/($x)(.*?)\b(is|are|was|were|can|may|would)\s+(a|an|the)?(.*)(\b)/i )
			{
				$ans = $3." ".$4.$5;
				#print( "$4\n" );
				#last;
				if ( length $2 > 0 ){
				$scores{$ans} = &assignscore(0.8);
				
				}
				else
				{
				$scores{$ans} = &assignscore(1);
				}
				push(@answers, $ans);
			}
			
			#query rewrite for composite questions
			if ( $#terms>1 and $array[$i] =~m/($terms[0])(.*?)($terms[1])(.*?)\b(is|are|was|were)(.*)(\b)/i )
			{
				$ans = $3.$4.$5;
				if ( length $4 > 0 ){
				$scores{$ans} = &assignscore(0.7);
				}
				else
				{
				$scores{$ans} = &assignscore(1);
				}
				push(@answers, $ans);
				#last;
			}
			
			# another query rewrite
			if ( $array[$i] =~m/(born)\b(.*)(is|was|are|were)\s+(a|an|the)\s+(.*)/i )
			{
				$ans = $3." ".$4." ".$5;
				$scores{$ans} = &assignscore(0.5);
				push(@answers, $ans);
				#last;
			}
			#$ans =~s /(.*)\}\}//g;
			#if ( $ok eq 1 ) { last; }
		}
		for ( my $i=0 ; $i<$#answers ; $i++ )
		{
			#print( "$answers[$i] -- $scores{ $answers[$i] }\n\n" );
			for ( my $j = $i+1 ; $j<$#answers ; $j++ )
			{
				my $new_ans = &configureAnswers( $answers[$i] , $answers[$j] );
				if ( length $new_ans > 1 )
				{
					push( @answers , $new_ans );
					$scores{$new_ans} = ($scores{$answers[$i]} + $scores{$answers[$j]}) / 2.0;
				}
			}
		}
		my $output = "";
		@answers = sort { $scores{$b} <=> $scores{$a} } @answers;
		$ans = @answers[0];
		#print(" ====>>>>> $ans\n\n\n");
		if ( length $ans > 0 )
		{
			$output = (length $prop > 0 ?$prop." ":"").$x." ".$ans.".\n";
		}
		#print(" ====>>>>> $output\n\n\n");
		return $output;
}


sub configureWhere()
{
	my $x = @_[0];
	my $score = 0;
	my @array = split/\./,$corpus;
		for( my $i=0 ; $i<$#array ; $i++ )
		{
			#print( "$array[$i] !!!!!! \n" );
			
			#query rewrite for where questions
			if ( $array[$i] =~m/(.*?)($x)?(is|are|was|were)(.*?)(located|border(ing|ed)?|near|situated)\b(.*)(\b)/i )
			{
				$ans = $3." ".$5.$7;
				if ( length $2 > 0 and lc($5) eq "located" )
				{
				$scores{$ans} = &assignscore(1);
				}
				elsif ( length $3 > 0 ){
				$scores{$ans} = &assignscore(0.8);
				}
				else
				{
				$scores{$ans} = &assignscore(0.7);
				}
				push(@answers, $ans);
			}
			#another query rewrite
			if ( $array[$i] =~m/\b(neigbor(ing)?|$x)(.*)(located|east|west|south|north)(.*)\b/i )
			{
				$ans = $3.$4.$5;
				if ( $3 =~m/(\||=|&|\\|\/)/  ){
				$scores{$ans} = &assignscore(0.5);
				}
				else{
				$scores{$ans} = &assignscore(1);
				}
				push(@answers, $ans);
			}
			
		}
		
		#formulating the answer
		for ( my $i=0 ; $i<$#answers ; $i++ )
		{
			#print( "$answers[$i] -- $scores{ $answers[$i] }\n\n" );
			for ( my $j = $i+1 ; $j<$#answers ; $j++ )
			{
				#comparing each two answers and tiling them together.
				my $new_ans = &configureAnswers( $answers[$i] , $answers[$j] );
				if ( length $new_ans > 1 )
				{
					push( @answers , $new_ans );
					$scores{$new_ans} = ($scores{$answers[$i]} + $scores{$answers[$j]}) / 2.0;
				}
			}
		}
		my $output = "";
		#sorting the answers according to their scores
		@answers = sort { $scores{$b} <=> $scores{$a} } @answers;
		$ans = @answers[0];
		#print(" ====>>>>> $ans\n\n\n");
		if ( length $ans > 0 )
		{
			$output = (length $prop > 0 ?$prop." ":"").$x." ".$ans.".\n";
		}
		#print(" ====>>>>> $output\n\n\n");
		return $output;
}

sub configureWhen()
{
		my $x = @_[0];
		my $score = 0;
		my @array = split/(\.|,)/,$corpus;
		#print("$birth -- $death\n");
		
		for( my $i=0 ; $i<$#array ; $i++ )
		{
			
			# query rewrite to identify the dates for when questions
			if ( ($birth eq 0) and ($death eq 0) and ($array[$i] =~m/date(\s+)=(\s+)(.*)/i) )
			{
				$ans = " is on the ".$3;
				$scores{$ans} = &assignscore(0.9);
				push( @answers , $ans );
				#last;
			}
			
			if ( ($birth eq 0) and ($death eq 0) and ($array[$i] =~m/($x)?(.*)(from)\s+([0-9]+.*)\s+(to)(.*)/i) )
			{
				$ans = $2.$3." ".$4." ".$5.$6;
				$scores{$ans} = &assignscore(0.95);
				push( @answers , $ans );
				#last;
			}
			
			#trying to get the info form the info box for the birth_date.
			if ( $birth eq 1 and $array[$i] =~m/birth_date = (\|)([0-9a-zA-Z\s]+)(}})/i )
			{
				$ans = "was born on ".$2;
				$scores{$ans} = &assignscore(1);
				push( @answers , $ans );
				#last;
			}
			#trying to get the info form the info box for the birth_date.
			if ( $death eq 1 and $array[$i]=~m/death_date = (\|)([0-9a-zA-Z\s]+)(}})/i )
			{
				$ans = "died on ".$2;
				$scores{$ans} = &assignscore(1);
				push( @answers , $ans );
				#last;
			}
			
			#query rewrite based on identifying months in the sentence for death questions.
			for ( my $j=0 ; $j<$#months ; $j++ )
			{
				my $ok=0;
				if ( $death eq 1 and $array[$i]=~m/(died)(.*)($months[$j])(\s+)([0-9&,\s]+)/i )
				{
					$ans = "died on ".$3.$4.$5;
					$scores{$ans} = &assignscore(0.8);
					push( @answers , $ans );
					$ok=1;
				}	
			}
			
			#query rewrite for birth questions 
			if ( $birth eq 1 and $array[$i] =~m/(born)\b(.*)(is|was|are|were)\s+(a|an|the)\s+(.*)/i )
			{
				$ans = "was born on".$2;
				$scores{$ans} = &assignscore(0.9);
				push( @answers , $ans );
				#last;
			}
			
			#another query rewrite for birth questions
			if ( $birth eq 1 and $array[$i] =~m/(.*?)(is|are|was|were)(.*?)(born|birth)\b(.*)(\b)/i )
			{
				print( "$2\n" );
				$ans = "was born on".$5;
				$scores{$ans} = &assignscore(0.9);
				push( @answers , $ans );
				#last;
			}
			
			#if (  $birth eq 1 and $array[$i] =~m/(born|birth)\b(.*)(\b)/i )
			
			#query rewrite based on identifying months in the sentence for birth questions.
			for ( my $j=0 ; $j<$#months ; $j++ )
			{
				#print( "$months[$j]\n\n" );
				my $ok=0;
				if ( $birth eq 1 and $array[$i]=~m/($x)?(.*)($months[$j])(\s+)([0-9&,\s]+)/i )
				{
					$ans = "was born on ".$2.$3.$4.$5;
					$scores{$ans} = &assignscore(0.7);
					push( @answers , $ans );
				}	
			}
			
		}
		
		
		#formulating the answer
		for ( my $i=0 ; $i<$#answers ; $i++ )
		{
			#print( "$answers[$i] -- $scores{ $answers[$i] }\n\n" );
			for ( my $j = $i+1 ; $j<$#answers ; $j++ )
			{
				my $new_ans = &configureAnswers( $answers[$i] , $answers[$j] );
				if ( length $new_ans > 1 )
				{
					push( @answers , $new_ans );
					$scores{$new_ans} = ($scores{$answers[$i]} + $scores{$answers[$j]}) / 2.0;
				}
			}
		}
		my $output = "";
		@answers = sort { $scores{$b} <=> $scores{$a} } @answers;
		$ans = @answers[0];
		#print(" ====>>>>> $ans\n\n\n");
		if ( length $ans > 0 )
		{
			$output = (length $prop > 0 ?$prop." ":"").$x." ".$ans.".\n";
		}
		#print(" ====>>>>> $output\n\n\n");
		
		$output =~s/(\)|\}|\]|\[|\{|\(|\||\')//g;
		
		return $output;
		
}


while(1)
{
	$input = <STDIN>;
	@answers = ();
	%scores = (); 
	$mult = 1;
	$B = 0.04;
	$birth = 0;
	$death = 0;
	@grams_2 = ();
	@grams_3 = ();
	#if the input was exit then just break.
	if ( $input =~m/exit/i ) { last; }
	chomp $input;
	
	#print("$input\n");
	
	#identifying the important parts of the question
	if ( $input =~m/(who|what|where|when)\s+(is|are|was|were|do|does|did)\s+((a|an|the)\s)?(.*)(\?)/i )
	{
		$ques = $1;
		$tense = $2;
		$prop = $4;
		$x = $5;
	}
	
	#printing the question to the log file.
	print HANDLER "Question $input\n\n";
	
	#dealing with birth/death questions.
	if ( $input =~m/\b(born|birth)\b/i ) { $birth=1; $x =~s/(born|birth)//i; }
	if ( $input =~m/\b(die|death)\b/i ) { $death=1; $x =~s/(die(d)?|death)//i; }
	
	#splitting for composite questions (e.g when asking about Donald trump)
	my @terms = split/\s+/,$x;
	#if ( $ques=~m/when/ ) { $x = $terms[$#terms]; }
	#print("$x\n");
	#print( "$terms[0] -- $terms[1]\n" );
	#print("$x - !!!\n");
	
	#creating all bigrams and trigrams from the main part of the question.
	@grams_2 = &n_grams($x,2);
	@grams_3 = &n_grams($x,3);
	
	#searching in wikipedia
	my $res = $wiki->search($x);
	if ( $res )
	{
		$corpus = $res->text();
		$corpus = &parse();
	}
	else
	{
		$res = &searchInWiki();
		$corpus = $res;
		#print("$corpus\n\n\n!!!!!");
		if ( length $corpus < 1 )
		{
			print("no search results!!!!!!1!\n");
			print HANDLER "no search results!\n";
			next;
		}
		$corpus = &parse();
		#$flag = 1;
	}
	
	
	my $ans;
	my $output;
	if ($ques =~m/(who|what)/i)
	{
		$output = &configureWhat($x);
	}
	elsif ( $ques =~m/where/i )
	{
		$output = &configureWhere($x);
	}
	elsif( $ques =~m/when/i )
	{
		$output = &configureWhen($x);
	}
	
	#printing the answer.
	if ( length $output < 1 )
	{
		print("I am sorry, I don't know the answer.\n"); 
		print HANDLER "My system answer: I am sorry, I don't know the answer.\n\n";
	}
	else
	{
		print( "$output\n" );
		print HANDLER "My system answer: $output\n\n";
	}
}

close($fh);

