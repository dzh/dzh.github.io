package ch1


class IntroSpec extends Specification{
	"The phrase 'Never odd or even'" should{
	 	"be a palindrome" in {
			Introduction.isPalindrome("Never odd or even") must beTrue	
		}	
	}



}
