# Neovim Shortcut Cheatsheet

## General
| Shortcut | Mode | Description |
| :--- | :--- | :--- |
| `<Space>` | - | **Leader Key** |
| `<leader>pv` | Normal | Open Netrw (File Explorer) |
| `<C-d>` | Normal | Scroll down (half page) & center cursor |
| `<C-u>` | Normal | Scroll up (half page) & center cursor |
| `n` | Normal | Next search result (centers cursor) |
| `N` | Normal | Previous search result (centers cursor) |
| `<leader>x` | Normal | Make current file executable (`chmod +x`) |
| `<leader>s` | Normal | Replace word under cursor globally |

## Editing & Movement
| Shortcut | Mode | Description |
| :--- | :--- | :--- |
| `J` | Visual | Move selected line(s) down |
| `K` | Visual | Move selected line(s) up |
| `J` | Normal | Append next line to current line (keep cursor) |
| `<leader>p` | Visual | Paste over selection without losing paste buffer |
| `<leader>y` | N/V | Copy to system clipboard |
| `<leader>Y` | Normal | Copy line to system clipboard |
| `<leader>d` | N/V | Delete without copying (to void register) |
| `<C-c>` | Insert | Exit insert mode (alternative to Esc) |

## Window & Tmux Navigation
| Shortcut | Mode | Description |
| :--- | :--- | :--- |
| `<C-h>` | Normal | Navigate Left (works with Tmux) |
| `<C-l>` | Normal | Navigate Right (works with Tmux) |
| `<C-j>` | Normal | Navigate Down (works with Tmux - implied) |
| `<C-k>` | Normal | Navigate Up (works with Tmux - implied) |
| `<C-f>` | Normal | Open New Tmux Sessionizer (if configured) |

## Telescope (Fuzzy Finder)
| Shortcut | Mode | Description |
| :--- | :--- | :--- |
| `<C-p>` | Normal | Find Files (Project) |
| `<leader>ps` | Normal | Project Search (Grep) |
| `<leader>vh` | Normal | Help Tags |

## Git (Fugitive, Gitsigns, Diffview)
| Shortcut | Mode | Description |
| :--- | :--- | :--- |
| `<leader>gs` | Normal | Git Status (Fugitive) |
| `<leader>p` | Normal | Git Push (in fugitive buffer) |
| `<leader>P` | Normal | Git Pull (in fugitive buffer) |
| `<leader>t` | Normal | Push to upstream (`git push -u origin`) |
| **Gitsigns** | | |
| `]c` / `[c` | Normal | Next / Previous Hunk |
| `<leader>hs` | N/V | Stage Hunk |
| `<leader>hr` | N/V | Reset Hunk |
| `<leader>hu` | Normal | Undo Stage Hunk |
| `<leader>hS` | Normal | Stage Buffer |
| `<leader>hR` | Normal | Reset Buffer |
| `<leader>hp` | Normal | Preview Hunk |
| `<leader>hb` | Normal | Blame Line (Full) |
| `<leader>tb` | Normal | Toggle Inline Blame |
| `<leader>hd` | Normal | Diff This Hunk |
| **Diffview** | | |
| `<leader>gd` | Normal | Open Diff View |
| `<leader>gh` | Normal | File History |
| `<leader>gc` | Normal | Close Diff View |

## LSP (Language Server Protocol)
| Shortcut | Mode | Description |
| :--- | :--- | :--- |
| `gd` | Normal | Go to Definition |
| `K` | Normal | Hover Documentation |
| `<leader>vws` | Normal | Workspace Symbol Search |
| `<leader>vd` | Normal | Open Diagnostic Float |
| `[d` | Normal | Next Diagnostic |
| `]d` | Normal | Previous Diagnostic |
| `<leader>vca` | Normal | Code Action |
| `<leader>vrr` | Normal | Find References |
| `<leader>vrn` | Normal | Rename Symbol |
| `<C-h>` | Insert | Signature Help |
| `<leader>f` | Normal | Format buffer |

## Quickfix Navigation
| Shortcut | Mode | Description |
| :--- | :--- | :--- |
| `<C-k>` | Normal | Next Quickfix Item |
| `<C-j>` | Normal | Previous Quickfix Item |
| `<leader>k` | Normal | Next Location List Item |
| `<leader>j` | Normal | Previous Location List Item |

