/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import textAreaInputTest from './TextTest/textAreaInputTest.test';
import SearchTypeTest from './SearchTest/SearchType.test';
import TextAreaTypeTest from './TextAreaTest/TextAreaType.test';
import TextInputTypeTest from './TextInputTest/TextInputType.test';
import ResourceNormalTest from './TextTest/ResourceNormal.test';
import ResourceModifierTest from './TextTest/ResourceModifier.test';
import TextStrokeTest from './TextTest/TextStrokeTest.test';
import StyledStringStrokeTest from './TextTest/StyledStringStrokeTest.test';
import TextInputEnableAutoFillAnimationTest from './TextInputTest/TextInputEnableAutoFillAnimation.test';
import TextShaderStyleTest from './TextTest/TextShaderStyle.test';
import TextStyleSuperscriptTest from './StyledStringTest/TextStyleSuperscript.test';
import TextEnableAutoSpacingTest from './TextTest/TextEnableAutoSpacing.test';
import SearchEnableAutoSpacingTest from './SearchTest/SearchEnableAutoSpacing.test';
import TextAreaEnableAutoSpacingTest from './TextAreaTest/TextAreaEnableAutoSpacing.test';
import TextInputEnableAutoSpacingTest from './TextInputTest/TextInputEnableAutoSpacing.test';
import ImageOnErrorTest from './ImageErrorTest/ImageOnError.test';
import TextAreaMinLinesTest from './TextAreaTest/TextAreaMinLines.test';
import TextLineSpacingTest from './TextTest/TextLineSpacing.test';
import TextAreaLineSpacingTest from './TextAreaTest/TextAreaLineSpacing.test';
import SearchAutoCapitalizationModeTest from './SearchTest/SearchAutoCapitalizationMode.test';
import SearchAutoCapitalizationModeModifierTest from './SearchTest/SearchAutoCapitalizationModeModifier.test';
import TextAreaAutoCapitalizationModeTest from './TextAreaTest/TextAreaAutoCapitalizationMode.test';
import TextAreaAutoCapitalizationModeModifierTest from './TextAreaTest/TextAreaAutoCapitalizationModeModifier.test';
import TextInputAutoCapitalizationModeTest from './TextInputTest/TextInputAutoCapitalizationMode.test';
import TextInputAutoCapitalizationModeModifierTest from './TextInputTest/TextInputAutoCapitalizationModeModifier.test';
import TextVerticalAlignTest from './TextTest/TextVerticalAlign.test';
import ModifierTextVerticalAlignTest from './TextTest/TextVerticalAlignModifier.test';
import TextGetParagraphsTest from './TextTest/TextGetparagraphs.test';
import fromHtmlTest from './StyledStringTest/fromHtml.test';
import ImageOrientationTest from './ImageOrientationTest/ImageOrientation.test';
import TextNumberTransitionTest from './TextTest/TextNumberTransitionTest.test';
import SymbolEffectTest from './SymbolGlyphTest/SymbolEffectTest.test';
import shaderStyleTest from './TextTest/shaderStyle.test';
import EnablePreviewMenuTest from './TextTest/EnablePreviewMenu.test';
import EnableMultiTypeTest from './StyledStringTest/EnableMultiTypeTest.test';
import StyledStringOnTouchTest from './StyledStringTest/StyledStringOnTouchTest.test';
import ThicknessScaleTest from './StyledStringTest/ThicknessScaleTest.test';
import OnWillAttachIMETest from './SearchTest/OnWillAttachIMETest.test';
import SymbolShadowTest from './SymbolGlyphTest/SymbolShadowTest.test';
import MaxLinesOptionsTest from './TextAreaTest/MaxLinesOptionsTest.test';
import TextAreaBindControllerTest from './TextAreaTest/TextAreaBindControllerTest.test';
import TextInputBindControllerTest from './TextInputTest/TextInputBindControllerTest.test';
import OptimizeTrailingSpaceTest from './TextTest/OptimizeTrailingSpaceTest.test';
import TextBindControllerTest from './TextTest/TextBindControllerTest.test';
import StyledStringVerticalAlignTest from './StyledStringTest/StyledStringVerticalAlignTest.test';
import TextChangeReasonTest from './TextTest/TextChangeReasonTest.test';
import ImageSupportSvg2Test from './ImageSvgTest/ImageSvg.test';

export default function testsuite() {
  textAreaInputTest();
  SearchTypeTest();
  TextAreaTypeTest();
  TextInputTypeTest();
  ResourceNormalTest();
  ResourceModifierTest();
  TextStrokeTest();
  StyledStringStrokeTest();
  TextInputEnableAutoFillAnimationTest();
  TextShaderStyleTest();
  TextStyleSuperscriptTest();
  TextEnableAutoSpacingTest();
  SearchEnableAutoSpacingTest();
  TextAreaEnableAutoSpacingTest();
  TextInputEnableAutoSpacingTest();
  ImageOnErrorTest();
  TextAreaMinLinesTest();
  TextLineSpacingTest();
  TextAreaLineSpacingTest();
  SearchAutoCapitalizationModeTest();
  SearchAutoCapitalizationModeModifierTest();
  TextAreaAutoCapitalizationModeTest();
  TextAreaAutoCapitalizationModeModifierTest();
  TextInputAutoCapitalizationModeTest();
  TextInputAutoCapitalizationModeModifierTest();
  TextVerticalAlignTest();
  ModifierTextVerticalAlignTest();
  TextGetParagraphsTest();
  fromHtmlTest();
  ImageOrientationTest();
  TextNumberTransitionTest();
  SymbolEffectTest();
  shaderStyleTest();
  EnablePreviewMenuTest();
  EnableMultiTypeTest();
  StyledStringOnTouchTest();
  ThicknessScaleTest();
  OnWillAttachIMETest();
  SymbolShadowTest();
  MaxLinesOptionsTest();
  TextAreaBindControllerTest();
  TextInputBindControllerTest();
  TextBindControllerTest();
  OptimizeTrailingSpaceTest();
  StyledStringVerticalAlignTest();
  TextChangeReasonTest();
  ImageSupportSvg2Test();
}