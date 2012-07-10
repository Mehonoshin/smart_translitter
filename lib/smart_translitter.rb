# encoding: UTF-8
class SmartTranslitter
    LOWER_CASE = {
      "а" => ["a"],
      "б" => ["b"],
      "в" => ["v"],
      "г" => ["g"],
      "д" => ["d"],
      "е" => ["e"],
      "ё" => ["yo", "jo"],
      "ж" => ["zh", "j"],
      "з" => ["z"],
      "и" => ["i"],
      "й" => ["j", "jj", "y"],
      "к" => ["k"],
      "л" => ["l"],
      "м" => ["m"],
      "н" => ["n"],
      "о" => ["o"],
      "п" => ["p"],
      "р" => ["r"],
      "с" => ["s"],
      "т" => ["t"],
      "у" => ["u"],
      "ф" => ["f"],
      "х" => ["ch", "h", "kh"],
      "ц" => ["c", "ts", "cz"],
      "ч" => ["ch"],
      "ш" => ["sh"],
      "щ" => ["shh", "shch", "sc"],
      "ъ" => ["\""],
      "ы" => ["y"],
      "ь" => ["\'"],
      "э" => ["e", "eh"],
      "ю" => ["ju", "yu", "iu"],
      "я" => ["ja", "ya", "ia"]
    }

    UPPER_CASE = {
      "А" => ["A"],
      "Б" => ["B"],
      "В" => ["V"],
      "Г" => ["G"],
      "Д" => ["D"],
      "Е" => ["E", "Je", "Ye"],
      "Ё" => ["Yo", "Jo"],
      "Ж" => ["Zh", "J"],
      "З" => ["Z"],
      "И" => ["I"],
      "Й" => ["J", "Jj", "Y"],
      "К" => ["K"],
      "Л" => ["L"],
      "М" => ["M"],
      "Н" => ["N"],
      "О" => ["O"],
      "П" => ["P"],
      "Р" => ["R"],
      "С" => ["S"],
      "Т" => ["T"],
      "У" => ["U"],
      "Ф" => ["F"],
      "Х" => ["Ch", "H", "Kh"],
      "Ц" => ["C", "Ts", "Cz"],
      "Ч" => ["Ch"],
      "Ш" => ["Sh"],
      "Щ" => ["Shh", "Shch", "Sc"],
      "Ъ" => ["\""],
      "Ы" => ["Y"],
      "Ь" => ["\'"],
      "Э" => ["E", "Eh"],
      "Ю" => ["Ju", "Yu", "Iu"],
      "Я" => ["Ja", "Ya", "Ia"]
    }

  def self.t(word)

    # Набор финальных вариантов транслитерации строки
    results = [""]
    word.chars do |ch|
      # Определяем регистр и выбираем набор возможных интерпреаций символа
      if UPPER_CASE[ch].nil? && LOWER_CASE[ch].nil?
        variants = [ch]
      else
        variants = !UPPER_CASE[ch].nil? ? UPPER_CASE[ch] : LOWER_CASE[ch]
      end

      # Для каждой возможной интерпретации символа копируем текущий набор вариантов интерпретации всей строки
      additional_results = []
      results.each do |result|
        (variants.size - 1).times do
          str_copy = result.dup
          additional_results << str_copy
        end
      end
      results += additional_results

      # Набор обновленных вариантов интепретации
      new_results = []
      # Добавляем к каждому варианту возможную интпретацию символа
      index = 0
      results.each_slice(results.size / variants.size) do |set|
        set.each do |result|
          result += variants[index]
          new_results << result
        end
        index += 1
      end
      results = new_results
    end
    results
  end

end
