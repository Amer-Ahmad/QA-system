# QA-system
the following program simulate a question_answering system mainly based on Wikipedia.

* the following program simulates a question_answering system mainly based on Wikipedia.
The program is designed to answer the questions that only start with who|what|where|when.
The algorithm that is used to find the answers for the queries asked is mainly based on regular expression, that is, by identifying certain patterns in the articles searched in Wikipedia to extract the most accurate answer.
The program could be run from the cmd by typing perl qa-system.pl mylog.txt, where mylog.txt is a txt file that records the queries and the answers provided by the system. In addition to printing the article that was searched for in Wikipedia, for debugging purposes.

# sample input/output:
* p.s: I deleted the article that was searched for in Wikipedia in the output section for the first 2 sample questions due to the huge space it takes.

### Question who is god?

### god is conceived of as the supreme being, creator deity, and principal object of faith.


### Question what is a clock?

### a clock is an instrument used to measure, keep, and indicate time.


### Question what is wood?

{{Annotated image 4 | caption = header = alt = image = 16 wood samples.jpg align = right image-width | = 350 width = 350 height = 431 annot-font-size = 12 annot-color =f annot-text- | align = annotations =                    }}  Wood is a porous and fibrous structural tissue found in the stems and roots of trees and other woody plants. It is an organic material, a natural composite of cellulose fibers that are strong in tension and embedded in a of lignin that resists compression. Wood is sometimes defined as only the secondary xylem in the stems of trees,  or it is defined more broadly to include the same type of tissue elsewhere such as in the roots of trees or shrubs. In a living tree it performs a support function, enabling woody plants to grow large or to stand up by themselves. It also conveys water and nutrients between the leaves, other growing tissues, and the roots. Wood may also refer to other plant materials with comparable properties, and to material engineered from wood, or wood chips or fiber.  Wood has been used for thousands of years for fuel, as a construction material, for making tools and weapons, furniture and paper. More recently it emerged as a feedstock for the production of purified cellulose and its derivatives, such as cellophane and cellulose acetate.  As of 2005, the growing stock of forests worldwide was about 434 billion cubic meters, 47% of which was commercial.  As an abundant, carbon-neutral renewable resource, woody materials have been of intense interest as a source of renewable energy. In 1991 approximately 3.5 billion cubic meters of wood were harvested. Dominant uses were for furniture and building construction.<ref name=Ullmann>Horst H. Nimz, Uwe Schmitt, Eckart Schwab, Otto Wittmann, Franz Wolf "Wood" in Ullmanns Encyclopedia of Industrial Chemistry 2005, Wiley-VCH, Weinheim.   

### wood is a porous and fibrous structural tissue found in the stems and roots of trees and other woody plants.

###################################################################################################################################################


* The enhancements to the query reformulation added several manually-crafted regular expression in order to pick up the answer from wikipedia.
### the enhancements in answer composition include 
* 1- gram tiling: as the program compare each two answers and try to tile them together in case were similar. Moreover, the product score of the tiles answer would be the average of the scores of the two answers that got tiled.
* 2- several manually-crafted sentences compositions were added so that the answer would be expressed in a right grammatical way. (picking up what is only important when matching a potential answer by reg-ex)

## scoring:
* the program assigns a confidence score for each potential answer. the confidence scores are assigned manually according to how suitable a regular expression would be as a potential answer.
* moreover, the program dynamically change the confidence score for the same regular expression according to the heuristic in regards of the number of matches.
* as the algorithm follows an approach similar to the simulated annealing approach. with the heuristic of the answer would be most likely to be found at the first part of the paragraph. Thus, a regular expression matches the confidence score is multiplied by a multiplier which is decreased every time a match happens.

## Example
* when asked (where is Finland?) several answers that match with the regular expressions will be assigned with the following confidence scores.

ps: (if an answer got mentioned twice that means it matches with more than one reg-ex)

* is in Swedish, and in Sami, is the long protocol name, which is however not defined by law -- 0.8

* is in Northern Europe bordering the Baltic Sea, Gulf of Bothnia, and Gulf of Finland, between Norway to the north, Sweden to the northwest, and Russia to the east -- 0.92

* is in Northern Europe bordering the Baltic Sea, Gulf of Bothnia, and Gulf of Finland, between Norway to the north, Sweden to the northwest, and Russia to the east -- 0.92

* is situated in the geographical region of Fennoscandia -- 0.704

* is in the southern region -- 0.672

* is in Europe and the most sparsely populated country in the European Union -- 0.64

* is in the capital city of Helsinki, local governments in 311 municipalities, and one autonomous region, the ┼land Islands -- 0.608

* is in Estonia, Russia, and Norway -- 0.576

* are in 5200&nbsp;BCE, when the Comb Ceramic culture was introduced -- 0.544

* are in southern coastal Finland between 3000 and 2500&nbsp;BCE may have coincided with the start of agriculture -- 0.512

* were in the Fennoscandian and Baltic regions and the sedentary farming inhabitation increased towards the end of Iron Age -- 0.48

* are in contemporary jewellery -- 0.52

* are in contemporary jewellery -- 0.52

* is in the prevalence of the Swedish language and its official status -- 0.384

* was in the world to give all (adult) citizens full suffrage, in other words the right to vote and to run for office, in 1906 -- 0.352

* was in the world to grant all (adult) citizens the right to vote, in 1893 -- 0.32

* are in widespread prosperity and one of the highest per capita incomes in the world -- 0.288

* is in numerous metrics of national performance, including education, economic competitiveness, civil liberties, quality of life, and human development -- 0.256

### the final answer: Finland is in Northern Europe bordering the Baltic Sea, Gulf of Bothnia, and Gulf of Finland, between Norway to the north, Sweden to the northwest, and Russia to the east.


#### notes: I added searchinwiki subroutine that will try to search for all possible bigrams and trigrams of the question as if the whole question was long and could not be found in wikipedia, this would give a higher chance of finding a match in wikipedia.
