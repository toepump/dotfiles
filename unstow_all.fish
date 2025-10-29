#!/usr/bin/env fish

# Loop through everything in the current directory
for dir in *
    # Skip .git directory and specific files
    if test "$dir" = ".git"
        continue
    end
    if test "$dir" = ".gitmodules"
        continue
    end
    if test "$dir" = "README.md"
        continue
    end

    # Only run stow -D if it's actually a directory
    if test -d "$dir"
        echo "Un-Stowing $dir..."
        stow -D "$dir"
    end

	# special case where since we're running this in fish, it often generates this ~/.config/fish before stowing which works but results in sym-linking the contents instead of the directory.
	# In case that happened, this is a cleanup
	if test "$dir" = "fish"
		rm -rf ~/.config/fish
	end

end
