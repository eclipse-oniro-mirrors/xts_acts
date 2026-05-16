'use static';
import StyledStringTest from './StyledStringTest/StyledString.test';
import CustomSpanMeasureInfoTest from './StyledStringTest/CustomSpanMeasureInfo.test';
import StyledStringFontVariationsTest from './StyledStringTest/StyledStringFontVariations.test';
import LineHeightStyleTest from './StyledStringTest/LineHeightStyle.test';
import LineSpacingStyleTest from './StyledStringTest/LineSpacingStyle.test';

export default function testsuite() {
  StyledStringTest();
  CustomSpanMeasureInfoTest();
  StyledStringFontVariationsTest();
  LineHeightStyleTest();
  LineSpacingStyleTest();
}