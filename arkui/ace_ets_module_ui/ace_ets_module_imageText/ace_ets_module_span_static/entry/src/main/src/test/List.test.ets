'use static';
import SpanTest from './SpanTest/Span.test';
import SpanFontVariationsTest from './SpanTest/SpanFontVariations.test';
import SymbolSpanFontWeightTest from './SymbolSpanTest/SymbolSpanFontWeight.test';

export default function testsuite() {
  SpanTest();
  SpanFontVariationsTest();
  SymbolSpanFontWeightTest();
}