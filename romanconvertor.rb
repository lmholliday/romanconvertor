def fromRoman(romanNumber)
    validNumerals = %w[I V X L C D M]

        romanNumberHash = {
            I: 1,
            IV: 4,
            V: 5,
            IX: 9,
            X: 10,
            XL: 40,
            L: 50,
            XC: 90,
            C: 100,
            CD: 400,
            D: 500,
            CM: 900,
            M: 1000
        }

        romanNumber.each_char { |c|
            validity = validNumerals.any? { |s| s.include?(c) }
            if validity == false
                raise TypeError
            end
        }

        romanNumberLength = romanNumber.length
        i = 0
        characters = romanNumber.split('')
        finalRomanNumber = 0
        while i < romanNumberLength
            romanNumberHash.each do | romanNumber, arabicNumber |
                if characters[i] == "#{romanNumber}"
                    if characters[i] == "I" and characters[i+1] == "V"
                        finalRomanNumber += 4
                        i+=2
                    elsif characters[i] == "I" and characters[i+1] == "X"
                        finalRomanNumber += 9
                        i+=2
                    elsif characters[i] == "X" and characters[i+1] == "L"
                        finalRomanNumber += 40
                        i+=2
                    elsif characters[i] == "X" and characters[i+1] == "C"
                        finalRomanNumber += 90
                        i+=2
                    elsif characters[i] == "C" and characters[i+1] == "D"
                        finalRomanNumber += 400
                        i+=2
                    elsif characters[i] == "C" and characters[i+1] == "M"
                        finalRomanNumber += 900
                        i+=2
                    else
                        finalRomanNumber += arabicNumber
                        i+=1
                    end
                end
            end
        end
        return finalRomanNumber
    end

    def toRoman(arabicNumber)

        if  (arabicNumber <= 0 || arabicNumber >= 4000)
            raise RangeError
        end

        placement = 0
        numeralConversion = ""

        notZero = true

        while notZero
            if arabicNumber < 1
                notZero = false
            elsif arabicNumber >= 1000
                numeralConversion.insert(placement, "M")
                placement += 1
                arabicNumber -= 1000
            elsif arabicNumber >= 900
                numeralConversion.insert(placement, "CM")
                placement += 2
                arabicNumber -= 900
            elsif arabicNumber >= 500
                numeralConversion.insert(placement, "D")
                placement += 1
                arabicNumber -= 500
            elsif arabicNumber >= 400
                numeralConversion.insert(placement, "CD")
                placement += 2
                arabicNumber -= 400
            elsif arabicNumber >= 100
                numeralConversion.insert(placement, "C")
                placement += 1
                arabicNumber -= 100
            elsif arabicNumber >= 90
                numeralConversion.insert(placement, "XC")
                placement += 2
                arabicNumber -= 90
            elsif arabicNumber >= 50
                numeralConversion.insert(placement, "L")
                placement += 1
                arabicNumber -= 50
            elsif arabicNumber >= 40
                numeralConversion.insert(placement, "XL")
                placement += 2
                arabicNumber -= 40
            elsif arabicNumber >= 10
                numeralConversion.insert(placement, "X")
                placement += 1
                arabicNumber -= 10
            elsif arabicNumber >= 9
                numeralConversion.insert(placement, "IX")
                placement += 2
                arabicNumber -= 9
            elsif arabicNumber >= 5
                numeralConversion.insert(placement, "V")
                placement += 1
                arabicNumber -= 5
            elsif arabicNumber >= 4
                numeralConversion.insert(placement, "IV")
                placement += 2
                arabicNumber -= 4
            elsif arabicNumber >= 1
                numeralConversion.insert(placement, "I")
                placement += 1
                arabicNumber -= 1
            end
        end
        return numeralConversion
    end