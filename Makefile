# Build packages automatically for export to a hosting site
OUTDIR ?= build

LXDM_OUT := $(wildcard $(OUTDIR)/lxdm-theme-lenarch*.pkg.tar.zst)
FONTS_OUT := $(wildcard $(OUTDIR)/lenarch-fonts*.pkg.tar.zst)
PIXMAPS_OUT := $(wildcard $(OUTDIR)/lenarch-pixmaps*.pkg.tar.zst)

.PHONY:all
all:LXDM_OUT FONTS_OUT PIXMAPS_OUT

.PHONY:lxdm
lxdm:LXDM_OUT

.PHONY:fonts
fonts:FONTS_OUT

.PHONY:pixmaps
pixmaps:PIXMAPS_OUT

LXDM_OUT:lxdm-theme-lenarch/PKGBUILD
	mkdir -p $(OUTDIR)
	(cd lxdm-theme-lenarch && makepkg -fs)
	mv lxdm-theme-lenarch/*.pkg.tar.zst $(OUTDIR)/

FONTS_OUT:lenarch-fonts/PKGBUILD
	mkdir -p $(OUTDIR)
	(cd lenarch-fonts && makepkg -fs)
	mv lenarch-fonts/*.pkg.tar.zst $(OUTDIR)/

PIXMAPS_OUT:lenarch-pixmaps/PKGBUILD
	mkdir -p $(OUTDIR)
	(cd lenarch-pixmaps && makepkg -fs)
	mv lenarch-pixmaps/*.pkg.tar.zst $(OUTDIR)/

.PHONY:clean
clean:
	rm -rf build/
	rm -rf */pkg/
