# Pretty High Resolution Time
# Display elapsed time in a pretty format
# Created by posva: https://github.com/posva/pretty-hrtime
#
# This was highly inspired by the node module pretty-hrtime created by robrich
# at https://github.com/robrich/pretty-hrtime

_desc=(d:86400:day h:3600:hour m:60:minute s:1:second ms:1000000:millisecond μs:1000:microsecond ns:1:nanosecond)
ptime() {
  local result s ns amount unit convert lconvert precise verbose tmp_str long
  # TODO check arguments
  # TODO check options
  s="$1"
  ns="$2"
  for unit in ${_desc[@]}; do
    convert=$(echo "$unit" | cut -d: -f2)
    if [[ -z "$verbose" ]]; then
      unit=$(echo "$unit" | cut -d: -f1)
    else
      unit=$(echo "$unit" | cut -d: -f3)
    fi
    # Use the seconds or the nanoseconds amount
    if echo "$unit" | grep '.s$' > /dev/null; then
      amount="$ns"
    else
      amount="$s"
    fi
    # Remove any extra time already counted
    if [[ "$unit" != d && "$unit" != ms ]]; then
      (( amount %= lconvert ))
    fi
    (( val = (100 * amount) /  convert ))
    if [[ "$unit" = s ]]; then
      (( val += ns / 10000000 ))
    fi
    if [[ "$val" -ge 100 ]]; then
      # Don't print to many decimals
      if [[ -z "$precise" && "$val" -ge 1000 ]]; then
        (( val /= 100 ))
        tmp_str="$val"
      else
        # We need a tmp var because val is treated as a number
        tmp_str=$(echo "$val" | sed -e 's/..$/.&/' -e 's/^.$/.0&/' -e 's/\.0*$//' -e 's/00*$//')
        if [[ -z "$tmp_str" ]]; then
          tmp_str=0
        fi
      fi
      if [[ ! -z "$result" ]]; then
        result="$result "
      fi
      result="${result}${tmp_str} $unit"
      if [[ -z "$long" ]]; then
        break
      fi
    fi
    # Save value for next iteration
    lconvert="$convert"
  done

  if [[ -z "$result" ]]; then
    echo "0 s"
  else
    echo "$result"
  fi
}
