# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a technical book project for 技術書典19 (TechBookFest 19) using Re:VIEW 5.8 as the document compilation system. The book title is "私のすごいAI活用技術大全 〜女性エンジニアのためのガイドブック〜" published by WAKE Community.

## Key Build Commands

### PDF Generation (Recommended: Docker)

The **Docker method is the most reliable** and requires no local environment setup:

```bash
# Download Docker image (first time only)
docker pull ghcr.io/vvakame/review:5.8

# Build PDF
./build-in-docker.sh
```

Generated PDF will be at: `articles/techbookfest19.pdf`

### Alternative Build Methods

**Local environment** (requires Ruby 2.7+, Node.js 20+, graphviz):
```bash
# First time setup
bundle install
npm install

# Build PDF
npm run pdf
```

**Direct Re:VIEW commands** (from articles/ directory):
```bash
cd articles
rake pdf
# or
review-pdfmaker config.yml
```

### Other Output Formats

```bash
npm run epub    # EPUB format
npm run web     # Web HTML format
npm run text    # Plain text format
npm run html    # HTML format
```

### Configuration Variants

To build with different configurations (e.g., ebook version):
```bash
REVIEW_CONFIG_FILE=config-ebook.yml npm run pdf
# or with Docker
REVIEW_CONFIG_FILE=config-ebook.yml ./build-in-docker.sh
```

## Chapter Contribution Workflow

### File Structure

```
articles/
├── contents/
│   ├── chap00-preface.re       # Preface
│   ├── chap19-shoco            # Chapter 19
│   └── chapDD-yourname.re      # Your chapter (DD = day number)
└── images/
    └── chapDD-yourname/        # Images for your chapter
        ├── image01.jpg
        └── image02.jpg
```

### Adding a New Chapter

1. **Create branch**: `git checkout -b feature/chapDD-yourname`
2. **Create files**:
   - Chapter file: `articles/contents/chapDD-yourname.re`
   - Images folder: `articles/images/chapDD-yourname/`
3. **Update catalog**: Edit `articles/catalog.yml` CHAPS section
4. **Write content** using Re:VIEW format (see below)
5. **Test build**: `./build-in-docker.sh`
6. **Submit PR**: Push and create pull request

### Critical Writing Rules

- **NO EMOJIS**: Emojis cause build errors
- **Author bio required**: Include author introduction at the end of each chapter
- **File naming**: Use format `chapDD-yourname.re` where DD is your assigned day number

## Re:VIEW Format Essentials

Re:VIEW uses a custom markup language. Key syntax:

```re
= Chapter Title              # Level 1 heading
== Section Title             # Level 2 heading
=== Subsection Title         # Level 3 heading

//lead{                      # Lead text (introduction)
Introduction paragraph
//}

Normal paragraph text.

//image[image-id][Caption]{  # Image
//}

//list[list-id][Caption]{    # Code listing
code example
//}

//table[table-id][Caption]{  # Table
header1	header2
--------
data1	data2
//}

//footnote[fn-id][footnote text]  # Footnote
```

Full format reference: https://github.com/kmuto/review/blob/master/doc/format.ja.md

## Configuration Architecture

### Main Configuration Files

- **catalog.yml**: Defines chapter order and structure (PREDEF, CHAPS, APPENDIX, POSTDEF)
- **config.yml**: Primary book settings (metadata, page layout, build options)
- **config-ebook.yml**: Inherits from config.yml, overrides for ebook version

### Page Layout Settings

Currently set to **B5 print version** (10pt, 40 chars × 35 lines). Different paper sizes and media types are available by uncommenting the appropriate `texdocumentclass` line in config.yml:

- B5 print (default)
- B5 ebook
- A5 print
- A5 ebook

### Book Metadata

Defined in `articles/config.yml`:
- `bookname`: Output filename (techbookfest19)
- `booktitle`: Book title and subtitle
- `aut`: Authors
- `edt`: Editors
- `pbl`: Publisher (WAKE Career)
- `date` / `history`: Publication dates

## Development Environment Notes

### Docker Environment

The project uses `vvakame/review:5.8` Docker image which includes:
- Re:VIEW 5.8
- Complete LaTeX environment
- Playwright for advanced rendering

No local TeX installation required when using Docker.

### Directory Purposes

- `articles/contents/`: Re:VIEW chapter files (.re)
- `articles/images/`: All image assets organized by chapter
- `articles/sty/`: LaTeX style files (review-jsbook.cls, custom styles)
- `articles/layouts/`: Custom LaTeX layout templates
- `articles/lib/`: Ruby helper libraries for build process
- `prh-rules/`: Proofreading helper rules for text validation

## Image and Asset Guidelines

Images should be placed in `articles/images/chapDD-yourname/` subdirectories matching the chapter filename. Images are referenced in Re:VIEW without the directory prefix:

```re
//image[chapDD-yourname/image01][Caption text]{
//}
```

## Contact and Support

For questions or help, ask in the WAKE Community Slack #技術書典17執筆 channel.

For git assistance, team members can help create branches and PRs on your behalf.
