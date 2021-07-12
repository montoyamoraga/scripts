# clear command line
"clear"

# announce start running script
echo "start running " $PWD

# check if files/ exists
if [ -d "files" ];

# if files/ exists do operation
then

  echo "success, files/ exists"
  
  # if there are /.mp3 files in files/
  if [ -f files/*.mp3 ];
    then
      echo "sucesss, there are .mp3 files"

      # iterate over every .mp3 in files/
      for i in files/*.mp3;

        # pipe the filename into cut
        # -d is delimiter of '.'
        # -f is the field number, indexed in 1
        # it retrieves the filename without the extension
        do name=`echo "$i" | cut -d'.' -f1`

        # print $name
        echo converting "$i" from mp3 to ogg

        # ffmpeg input original mp3 and convert to .ogg
        ffmpeg -i "$i" "${name}.ogg"

        echo converted "$i" to .ogg

        # delete original .mp3 file
        rm "$i"

        echo deleted "$i"

      # finish iteration
      done

    else
      echo "fail, no mp3 files "
  fi


# if files/ does not exist
else
  echo "fail, files/ does not exist"

# end of if statement
fi

# announce finished running script
echo "finished running " $PWD
