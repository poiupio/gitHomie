def draw_tree(height)
  1.upto(height){|repetition| puts ('#' * repetition).rjust(height)}
end
draw_tree(5) 