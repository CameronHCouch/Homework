class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    take_turn
    until game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
      show_sequence
      sleep(2)
      system("clear")
      require_sequence
      unless game_over
        round_success_message
        self.sequence_length += 1
      end
  end

  def show_sequence
    add_random_color
    puts seq
  end

  def require_sequence
    p "Gimme ur colors ex 'red green blue yellow'"
    input = gets.chomp
    if input.split(' ') == seq
      self.game_over = false
    else
      self.game_over = true
    end
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    puts "You got it!"
  end

  def game_over_message
    puts "You lost!"
  end

  def reset_game
    self.sequence_length = 1
    self.game_over = false
    self.seq = []
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Simon.new
  game.play
end