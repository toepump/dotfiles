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

    # Only run stow if it's actually a directory
    if test -d "$dir"
		# special case where since we're running this in fish, it often creates this ~/.config/fish before stowing which works but results in sym-linking the contents instead of the directory.
		if test "$dir" = "fish"
			rm -rf ~/.config/fish
		end

        echo "Stowing $dir..."
        stow -v "$dir"
    end
end
