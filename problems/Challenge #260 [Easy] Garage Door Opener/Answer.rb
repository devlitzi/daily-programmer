$input =
  ['button_clicked', 'cycle_complete', 'button_clicked', 'button_clicked',
   'button_clicked', 'button_clicked', 'button_clicked', 'cycle_complete']
$bonus_input =
  ['button_clicked', 'cycle_complete', 'button_clicked', 'block_detected',
   'button_clicked', 'cycle_complete', 'button_clicked', 'button_clicked', 'cycle_complete']

$order = ['CLOSED', 'OPENING', 'STOPPED_WHILE_OPENING', 'OPEN', 'CLOSING', 'STOPPED_WHILE_CLOSING']

def new_door_state array, state
    input = array.first
    puts "Button: #{input}"
    if input == 'button_clicked'
        if (state == 'STOPPED_WHILE_OPENING') or (state == 'STOPPED_WHILE_CLOSING')
            ##$order[$order.index(state) + 2]
            puts "Door: #{$order[($order.index(state).to_i + 2) % $order.length]}"
            return $order[($order.index(state).to_i + 2) % $order.length]
        else
            ##$order[$order.index(state) + 1]
            puts "Door: #{$order[$order.index(state).to_i + 1]}"
            return $order[$order.index(state).to_i + 1]
        end
    else
        if state == 'OPENING'
            puts 'Door: OPEN'
            return 'OPEN'
        else
            puts 'Door: CLOSED'
            return 'CLOSED'
        end
    end
end

def go_through array, starting_state
    new_state = new_door_state array, starting_state
    if array.length > 1
        array.shift
        go_through array, new_state
    end
end

puts go_through $input, 'CLOSED'
