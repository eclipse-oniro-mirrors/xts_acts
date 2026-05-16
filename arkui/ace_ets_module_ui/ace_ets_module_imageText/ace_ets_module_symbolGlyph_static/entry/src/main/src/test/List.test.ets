'use static';
import SymbolGlyphTest from './SymbolGlyphTest/SymbolGlyph.test';
import SymbolGlyphSymbolColorTest from './SymbolGlyphTest/SymbolGlyphSymbolColor.test';
import SymbolGlyphFontWeightTest26 from './SymbolGlyphTest/SymbolGlyphFontWeight.test';

export default function testsuite() {
  SymbolGlyphTest();
  SymbolGlyphSymbolColorTest();
  SymbolGlyphFontWeightTest26();
}