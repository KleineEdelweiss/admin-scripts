# volumectl.rb

# This depends on AlsaCtl
require "alsactl"

##
# Print the volumes.
# Takes a mixer. No real need to test this,
# because main makes one, or 
def show(m)
  # Print out each channel
  border = "="*30
  puts border
  m.volume.each do |_idx, chan|
    puts " \"#{chan[:name]}\" => #{chan[:percent]}%".rjust(25)
  end
  puts border
end # End volume print

##
# Actually adjust the volume for the system.
# Takes the mixer, type, volume as a percent,
# and the option to display it, after.
def adjust(m, args)
  # Instantiate variables
  # This method is ONLY called, if there is
  # AT LEAST ONE argument. Automatically fill it.
  # 
  # If the others are invalid or not there, gets nil.
  # 
  # AlsaCtl uses nil for type to just change the volume
  # to a set percentage.
  volume = args[0].to_i
  type = args[1].nil? ? nil : args[1].to_sym
  display = args[2]
  
  # Set the volume
  check = m.set_volume(volume, type)
  # This really should not happen. At worst,
  # it should just set it incorrectly (default: exact number)
  if !check then STDERR.puts "::ERROR:: Failed to set the volume" end
  
  # If return display is set, print it
  if display then show(m) end
end # End volume set

##
# Check if the args passed are
# acceptable parameters. If so,
# make the adjustment.
def main args
  # Create a new mixer and connect it
  m = AlsaCtl::DefMixer.new
  m.connect
  
  # No arguments yields a simple display
  if args.length.zero? then
    show(m)
  else # Otherwise, adjust
    adjust(m, args)
  end
  
  # Close the mixer, when done
  m.close
end # End main

# Run the program
main ARGV