# Number-Analyzer

Number-Analyzer is a single-purpose processor that queries if a given 32-bit number is even number, fibonacci number and palindrome number at the same time.
Thus, it consists of three finite state machines:
* isEvenNumber
* isFibonacciNumber
* isPalindromeNumber

## isEvenNumber

Corresponding C code of isEvenNumber finite state machine is as follows:

    int isEvenNumber(int num) {
        int result;
        if (num % 2 == 0) {
            result = 1;
        }
        else {
            result = 0;
        }
        return result;
    }

Its finite state machine is as follows:
   
![image](https://user-images.githubusercontent.com/23126077/84058359-cc531280-a9c1-11ea-9efc-0cd539299ba9.png)

## isFibonacciNumber

Corresponding C code of isFibonacciNumber finite state machine is as follows:

    int isFibonacciNumber(int num) {
        int fib1 = -1;
        int fib2 = 1;
        int res;

        do {
            res = fib1 + fib2;
            fib1 = fib2;
            fib2 = res;
        } while (res < num);

        if (res == num) {
            return 1;
        }
        else {
            return 0;
        }
    }

Its finite state machine is as follows:

![image](https://user-images.githubusercontent.com/23126077/84059256-efca8d00-a9c2-11ea-81e9-2baf18f0f5b0.png)

## isPalindromeNumber

Corresponding C code of isPalindromeNumber finite state machine is as follows:

    int isPalindrome(int num) {
        int divisor = 1;
        while (num / divisor >= 10)
            divisor *= 10;

        while (num != 0) {
            int leading = num / divisor;
            int trailing = num % 10;

            if (leading != trailing)
                return 0;

            num = (num % divisor) / 10;
            divisor = divisor / 100;
        }
        return 1;
    }
    
Its finite state machine is as follows:

![image](https://user-images.githubusercontent.com/23126077/84059847-eaba0d80-a9c3-11ea-9ca3-a79ab9749886.png)

## Results

![image](https://user-images.githubusercontent.com/23126077/84060250-8e0b2280-a9c4-11ea-9bcb-13df0effce3c.png)

## Built With
* [Quartus 13.1 Web Pack Edition with Cyclone III](http://fpgasoftware.intel.com/13.1/?edition=web)
