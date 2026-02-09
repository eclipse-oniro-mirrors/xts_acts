/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import InputPresetTest from './PresetTest/InputPresetTest.test';
import TextStrokeTest from './CommonTest/TextStrokeTest.test';
import TextOnChangeOptionsTest from './CommonTest/TextOnChangeOptionsTest.test';
import TextOnWillChangeOptionsTest from './CommonTest/TextOnWillChangeOptionsTest.test';

import TextAreaOnCutJsunitTest from './TextAreaTest/TextAreaOnCutJsunitTest.test';
import TextAreaCallbackTest from './TextAreaApi11Test/TextAreaCallback.test';
import TextAreaSelectTest from './TextAreaApi11Test/TextAreaSelect.test';
import textAreaJsunit from './TextAreaApi11Test/TextAreaJsunit.test';
import textAreaUxTest  from './TextAreaApi11Test/textareaux.test';
import textArea_top from './TextAreaApi11Test/textArea_top.test'
import textArea_bottom from './TextAreaApi11Test/textArea_bottom.test'
import textAenEnabledJsunit from './TextAreaApi11Test/textAenEnabledJsunit.test';
import textAreaOnCutJsunit from './TextAreaApi11Test/textArea.test';
import textAreaJsunit3 from './TextAreaApi11Test/TextAreaJsunit3.test';
import textAreaOnCaretAndKeyboardTest from './TextAreaApi11Test/textAreaOnCaretAndKeyboard.test';
import TextAreaTypeApi11Test from "./TextAreaApi11Test/TextAreaTypeApi11.test";
import TextAreaShowCounterTest from './TextAreaApi11Test/TextAreaShowCounter.test';
import TextAreaApi1 from './TextAreaApi12Test/TextAreaApi1.test'
import TextAreaApi2 from './TextAreaApi12Test/TextAreaApi2.test'
import TextAreaApi3 from './TextAreaApi12Test/TextAreaApi3.test'
import TextArea_lineBreakStrategyTest from './TextAreaApi12Test/TextArea_lineBreakStrategyTest.test'
import TextArea_lineSpacingTest from './TextAreaApi12Test/TextArea_lineSpacingTest.test'
import TextAreaApi4 from './TextAreaApi12Test/TextAreaApi4.test'
import TextAreaTest from './TextAreaApi12Test/TextAreaTest.test'
import textAreaPreview from './TextAreaApi12Test/textAreaPreview.test'
import textAreaAutoFillTest from './TextAreaApi12Test/TextAreaAutoFillJsUnit.test'
import textAreaHeightAdaptivePolicyTest from "./TextAreaApi12Test/textAreaHeightAdaptivePolicy.test";
import textAreaMaxFontSize from "./TextAreaApi12Test/textAreaMaxFontSize.test";
import textAreaMinFontSize from "./TextAreaApi12Test/textAreaMinFontSize.test";
import textAreaDecoration from "./TextAreaApi12Test/textAreaDecoration.test";
import textAreaLineHeight from "./TextAreaApi12Test/textAreaLineHeight.test";
import textAreaLetterSpacing from "./TextAreaApi12Test/textAreaLetterSpacing.test";
import TextAreaXtsJsunit from './TextAreaApi12Test/TextAreaXtsJsunit.test'
import TextAreaTypeApi12Test from "./TextAreaApi12Test/TextAreaTypeApi12.test";
import textAreaNode from "./TextAreaApi14Test/textAreaNode.test";
import onSubmitTest from './TextAreaApi14Test/onSubmitTest.test';
import TextAreaKeyboardAppearanceTest from './TextAreaApi15Test/TextAreaKeyboardAppearance.test';
import TextAreaStopBackPressTest from './TextAreaApi16Test/TextAreaStopBackPress.test';
import textAreaEllipsisModeTest from './TextAreaApi16Test/textAreaEllipsisModeTest.test';
import textAreaFontScaleTest from './TextAreaApi16Test/textAreaFontScaleTest.test';
import textAreaHalfLeadingTest from './TextAreaApi16Test/textAreaHalfLeadingTest.test';
import TextAreaGetTextTest from './TextAreaApi18Test/TextAreaGetText.test';
import WordBreakTest from './TextAreaApi18Test/WordBreakTest.test';
import TextAreaTypeApi20Test from './TextAreaApi20Test/TextAreaTypeApi20.test';
import TextAreaEnableAutoSpacingTest from './TextAreaApi20Test/TextAreaEnableAutoSpacing.test';
import TextAreaMinLinesTest from './TextAreaApi20Test/TextAreaMinLines.test';
import TextAreaLineSpacingTest from './TextAreaApi20Test/TextAreaLineSpacing.test';
import TextAreaAutoCapitalizationModeTest from './TextAreaApi20Test/TextAreaAutoCapitalizationMode.test';
import TextAreaAutoCapitalizationModeModifierTest from './TextAreaApi20Test/TextAreaAutoCapitalizationModeModifier.test';
import MaxLinesOptionsTest from './TextAreaApi20Test/MaxLinesOptionsTest.test';
import TextAreaBindControllerTest from './TextAreaApi20Test/TextAreaBindControllerTest.test';
import textAreaObserverTest from './TextAreaApi22Test/textAreaObserver.test';
import TextAreaEnableSelectedDataDetectorTest from './TextAreaApi22Test/TextAreaEnableSelectedDataDetector.test';
import TextAreaSetStyledPlaceholderTest from './TextAreaApi22Test/TextAreaSetStyledPlaceholder.test';
import TextAreaOnWillAttachIMETest from './TextAreaApi22Test/TextAreaOnWillAttachIME.test';
import TextAreaTextDirectionTest from './TextAreaApi23Test/TextAreaTextDirection.test';
import TextAreaSpecialAttrsTest from './TextAreaTest/TextAreaSpecialAttrs.test';

import TextInputOnEditChangeJsunitTest from './TextInputTest/TextInputOnEditChangeJsunitTest.test';
import textInputApi11 from './TextInputApi11Test/textInputApi11.test'
import textInputApiTest from './TextInputApi11Test/textinputkeyNewLine.test'
import textInputJsunit from './TextInputApi11Test/TextInputJsunit.test';
import textInput_caret from './TextInputApi11Test/textInput_caret.test';
import textInputOnEditChangeJsunit from './TextInputApi11Test/textInput.test';
import textInputJsunit3 from './TextInputApi11Test/TextInputJsunit3.test';
import showCounterTest from './TextInputApi11Test/ShowCounter.test';
import TextfieldMultiTest from './TextInputApi11Test/TextfieldMulti.test';
import TextfieldSingleTest from './TextInputApi11Test/TextfieldSingle.test';
import APIContentTypeTest from './TextInputApi12Test/APIContentTypeTest.test';
import APIUnderlineColorTest from './TextInputApi12Test/APIUnderlineColorTest.test';
import underlineColor from './TextInputApi12Test/underlineColor.test'
import TextInput_lineBreakStrategyTest from './TextInputApi12Test/TextInput_lineBreakStrategyTest.test'
import TextInputApi1 from './TextInputApi12Test/TextInputApi1.test'
import TextInputAddApi from './TextInputApi12Test/TextInputAddApi.test'
import TextInputEvent from './TextInputApi12Test/TextInputEvent.test'
import TextInputEvent2 from './TextInputApi12Test/TextInputEvent2.test'
import textInputPreview from './TextInputApi12Test/textInputPreview.test'
import textInputEnterKeyTypeTest from './TextInputApi12Test/textInputEnterKeyType.test'
import textInputUnderlineColorTest from "./TextInputApi12Test/textInputUnderlineColor.test";
import textInputMaxFontSize from "./TextInputApi12Test/textInputMaxFontSize.test";
import textInputMinFontSize from "./TextInputApi12Test/textInputMinFontSize.test";
import textInputHeightAdaptivePolicy from "./TextInputApi12Test/textInputHeightAdaptivePolicy.test";
import textInputDecoration from "./TextInputApi12Test/textInputDecoration.test";
import textInputLetterSpacing from "./TextInputApi12Test/textInputLetterSpacing.test";
import textInputLineHeight from "./TextInputApi12Test/textInputLineHeight.test";
import TextInputXtsJsunit from './TextInputApi12Test/TextInputXtsJsunit.test'
import TextInputTypeApi12Test from "./TextInputApi12Test/TextInputTypeApi12.test";
import ContentTypeTest from './TextInputApi12Test/ContentType.test';
import fontFeatureTest from './TextInputApi12Test/fontFeature.test';
import TextInputModifierTest from "./TextInputApi12Test/TextInputModifier.test";
import TextInputKeyboardAppearanceTest from './TextInputApi15Test/TextInputKeyboardAppearance.test';
import TextInputStopBackPressTest from './TextInputApi16Test/TextInputStopBackPress.test';
import textInputEllipsisModeTest from './TextInputApi16Test/textInputEllipsisModeTest.test';
import textInputFontScaleTest from './TextInputApi16Test/textInputFontScaleTest.test';
import textInputHalfLeadingTest from './TextInputApi16Test/textInputHalfLeadingTest.test';
import ContentTypeTest1 from './TextInputApi18Test/ContentType1.test';
import ContentTypeTest2 from './TextInputApi18Test/ContentType2.test';
import TextInputGetTextTest from './TextInputApi18Test/TextInputGetText.test';
import TextInputTypeApi20Test from './TextInputApi20Test/TextInputTypeApi20.test';
import TextInputEnableAutoFillAnimationTest from './TextInputApi20Test/TextInputEnableAutoFillAnimation.test';
import TextInputEnableAutoSpacingTest from './TextInputApi20Test/TextInputEnableAutoSpacing.test';
import TextInputAutoCapitalizationModeTest from './TextInputApi20Test/TextInputAutoCapitalizationMode.test';
import TextInputAutoCapitalizationModeModifierTest from './TextInputApi20Test/TextInputAutoCapitalizationModeModifier.test';
import TextInputBindControllerTest from './TextInputApi20Test/TextInputBindControllerTest.test';
import textInputObserverTest from './TextInputApi22Test/textInputObserver.test';
import TextInputEnableSelectedDataDetectorTest from './TextInputApi22Test/TextInputEnableSelectedDataDetector.test';
import TextInputSetStyledPlaceholderTest from './TextInputApi22Test/TextInputSetStyledPlaceholder.test';
import TextInputOnWillAttachIMETest from './TextInputApi22Test/TextInputOnWillAttachIME.test';
import TextInputTextDirectionTest from './TextInputApi23Test/TextInputTextDirection.test';

import TextAreaCompressLeadingPunctuation from './TextAreaTest/TextAreaCompressLeadingPunctuation.test';
import TextAreaCompressLeadingPunctuationModifier from './TextAreaTest/TextAreaCompressLeadingPunctuationModifier.test';
import TextInputCompressLeadingPunctuation from './TextInputTest/TextInputCompressLeadingPunctuation.test';
import TextInputCompressLeadingPunctuationModifier from './TextInputTest/TextInputCompressLeadingPunctuationModifier.test';


export default function testsuite() {
  InputPresetTest()
  TextAreaSelectTest()
  TextStrokeTest()
  TextOnChangeOptionsTest()
  TextOnWillChangeOptionsTest()

  // TextAreaTest
  TextAreaOnCutJsunitTest()    // Api11
  TextAreaCallbackTest()
  textAreaJsunit()
  textAreaUxTest()
  textArea_top()
  textArea_bottom()
  textAenEnabledJsunit()
  textAreaOnCutJsunit()
  textAreaJsunit3()
  textAreaOnCaretAndKeyboardTest()
  TextAreaTypeApi11Test()
  TextAreaShowCounterTest()
  TextAreaApi1()           // Api12
  TextAreaApi2()
  TextAreaApi3()
  TextArea_lineBreakStrategyTest()
  TextArea_lineSpacingTest()
  TextAreaApi4()
  TextAreaTest()
  textAreaPreview()
  textAreaAutoFillTest()
  textAreaHeightAdaptivePolicyTest()
  textAreaMaxFontSize()
  textAreaMinFontSize()
  textAreaDecoration()
  textAreaLineHeight()
  textAreaLetterSpacing()
  TextAreaXtsJsunit()
  TextAreaTypeApi12Test()
  textAreaNode()                   // Api14
  // onSubmitTest()
  TextAreaKeyboardAppearanceTest() // Api15
  TextAreaStopBackPressTest()      // Api16
  textAreaEllipsisModeTest()
  textAreaFontScaleTest()
  textAreaHalfLeadingTest()
  TextAreaGetTextTest()            // Api18
  WordBreakTest()
  TextAreaTypeApi20Test()          // Api20
  TextAreaEnableAutoSpacingTest()
  TextAreaMinLinesTest()
  TextAreaLineSpacingTest()
  TextAreaAutoCapitalizationModeTest()
  TextAreaAutoCapitalizationModeModifierTest()
  MaxLinesOptionsTest()
  TextAreaBindControllerTest()
  textAreaObserverTest()           // Api22
  TextAreaEnableSelectedDataDetectorTest()
  TextAreaSetStyledPlaceholderTest()
  TextAreaOnWillAttachIMETest()
  TextAreaTextDirectionTest()     // Api23
  TextAreaSpecialAttrsTest()

  // TextInputTest
  TextInputOnEditChangeJsunitTest()
  // textInputApi11()           // Api11
  textInputApiTest()
  textInputJsunit()
  textInput_caret()
  textInputOnEditChangeJsunit()
  textInputJsunit3()
  showCounterTest()
  TextfieldSingleTest()
  TextfieldMultiTest()
  APIContentTypeTest()       // Api12
  APIUnderlineColorTest()
  underlineColor()
  TextInput_lineBreakStrategyTest()
  TextInputApi1()
  TextInputAddApi()
  TextInputEvent()
  TextInputEvent2()
  textInputPreview()
  textInputEnterKeyTypeTest()
  textInputUnderlineColorTest()
  textInputMaxFontSize()
  textInputMinFontSize()
  textInputHeightAdaptivePolicy()
  textInputDecoration()
  textInputLetterSpacing()
  textInputLineHeight()
  TextInputXtsJsunit()
  TextInputTypeApi12Test()
  ContentTypeTest()
  fontFeatureTest()
  TextInputModifierTest()
  TextInputKeyboardAppearanceTest()  // Api15
  TextInputStopBackPressTest()       // Api16
  textInputEllipsisModeTest()
  textInputFontScaleTest()
  textInputHalfLeadingTest()
  ContentTypeTest1()                 // Api18
  ContentTypeTest2()
  TextInputGetTextTest()
  TextInputTypeApi20Test()           // Api20
  TextInputEnableAutoFillAnimationTest()
  TextInputEnableAutoSpacingTest()
  TextInputAutoCapitalizationModeTest()
  TextInputAutoCapitalizationModeModifierTest()
  TextInputBindControllerTest()
  textInputObserverTest()            // Api22
  TextInputEnableSelectedDataDetectorTest()
  TextInputSetStyledPlaceholderTest()
  TextInputOnWillAttachIMETest()
  TextInputTextDirectionTest()        // Api23
  TextAreaCompressLeadingPunctuation()
  TextAreaCompressLeadingPunctuationModifier()
  TextInputCompressLeadingPunctuation()
  TextInputCompressLeadingPunctuationModifier()
}