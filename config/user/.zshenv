# Path to the oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Apply GTK theme
export GTK_THEME=Adwaita:dark

# Set winit scale factor https://doc.servo.org/winit/dpi/index.html#how-is-the-scale-factor-calculated
export WINIT_X11_SCALE_FACTOR=1

# Add ~/.local/bin to PATH
export PATH="${PATH}:$HOME/.local/bin"

# Add ~/.cargo/bin to PATH https://doc.rust-lang.org/cargo/guide/cargo-home.html#directories
export PATH="${PATH}:$HOME/.cargo/bin"
