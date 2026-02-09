'use static';
/*
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
import MarqueeApi from './Marquee/MarqueeApi.test';
import MarqueeMirroringTest from './Marquee/MarqueeMirroring.test';
import SearchApi1 from './Search/SearchApi1.test';
import SearchEvent from './Search/SearchEvent.test';
import SearchEvent2 from './Search/SearchEvent2.test';
import SymbolGlyphApi from './SymbolGlyph/SymbolGlyphApi.test';
import textAreaInputTest from './TextArea/textAreaInputTest.test';
import TextAreaApi1 from './TextArea/TextAreaApi1.test'
import TextAreaApi2 from './TextArea/TextAreaApi2.test'
import TextAreaApi3 from './TextArea/TextAreaApi3.test'
import TextAreaApi4 from './TextArea/TextAreaApi4.test'
import textAreaPreview from './TextArea/textAreaPreview.test'
import textAreaAutoFillTest from './TextArea/TextAreaAutoFillJsUnit.test'
import textAreaHeightAdaptivePolicyTest from "./TextArea/textAreaHeightAdaptivePolicy.test";
import textAreaMaxFontSize from "./TextArea/textAreaMaxFontSize.test";
import textAreaMinFontSize from "./TextArea/textAreaMinFontSize.test";
import textAreaDecoration from "./TextArea/textAreaDecoration.test";
import textAreaLineHeight from "./TextArea/textAreaLineHeight.test";
import textAreaLetterSpacing from "./TextArea/textAreaLetterSpacing.test";
import TextAreaTypeTest from "./TextArea/TextAreaType.test";
import TextAreaTest from './TextAreaTest/TextAreaAPITest/TextAreaTest.test'
import TextArea_lineBreakStrategyTest from './TextAreaTest/TextAreaAPITest/TextArea_lineBreakStrategyTest.test'
import TextArea_lineSpacingTest from './TextAreaTest/TextAreaAPITest/TextArea_lineSpacingTest.test'
import APIContentTypeTest from './TextInput/APIContentTypeTest.test';
import APIUnderlineColorTest from './TextInput/APIUnderlineColorTest.test';
import underlineColor from './TextInput/underlineColor.test'
import TextInput_lineBreakStrategyTest from './TextInput/TextInputAPITest/TextInput_lineBreakStrategyTest.test'
import TextInputApi1 from './TextInput/TextInputApi1.test'
import TextInputAddApi from './TextInput/TextInputAddApi.test'
import TextInputEvent from './TextInput/TextInputEvent.test'
import TextInputEvent2 from './TextInput/TextInputEvent2.test'
import textInputPreview from './TextInput/textInputPreview.test'
import textInputEnterKeyTypeTest from './TextInput/textInputEnterKeyType.test'
import TextInputTypeTest from "./TextInput/TextInputType.test";
import textInputUnderlineColorTest from "./TextInput/textInputUnderlineColor.test";
import textInputMaxFontSize from "./TextInput/textInputMaxFontSize.test";
import textInputMinFontSize from "./TextInput/textInputMinFontSize.test";
import textInputHeightAdaptivePolicy from "./TextInput/textInputHeightAdaptivePolicy.test";
import textInputDecoration from "./TextInput/textInputDecoration.test";
import textInputLetterSpacing from "./TextInput/textInputLetterSpacing.test";
import textInputLineHeight from "./TextInput/textInputLineHeight.test";
import removeStyles from './TextTest/removeStyles.test'
import StyledString from './TextTest/StyledStringTest.test'
import clearStyles from './TextTest/clearStyles.test'
import TextStyle from './TextTest/TextStyle.test';
import TextStyleWavy from './TextTest/TextStyleWavy.test';
import Text_lineBreakStrategyTest from './TextTest/TextAPITest/Text_lineBreakStrategyTest.test'
import Text_lineSpacingTest from './TextTest/TextAPITest/Text_lineSpacingTest.test'
import textStrategyJsunit from './TextTest/textStrategyJsunit.test';
import Context from './TextTest/Context.test'
import getLayout from './TextTest/getLayout.test'
import styledStringApi from './TextTest/styledStringApi.test'
import AttributeUpdaterTest from './TextTest/TextAPITest/AttributeUpdaterTest.test'
import UnitTest from './TextTest/TextAPITest/Unit.test'
import getLineMetrics from './TextTest/getLineMetrics.test'
import textSelectableJsunit from './TextTest/textSelectableJsunit.test'
import typeNodeTextDecorationStyleTest from './Text/TextDecorationStyle.test';
import typeNodeTextSelectableMode1Test from './Text/TextSelectableMode1.test';
import typeNodeTextSelectableMode2Test from './Text/TextSelectableMode2.test';
import typeNodeTextSelectableMode3Test from './Text/TextSelectableMode3.test';
import styledStringAddApi from './Text/styledStringAddApi.test'
import TextAddApi1 from './Text/TextAddApi1.test'
import TextHalfLeading from './Text/TextHalfLeading.test'
import TextDataDetectorConfig from './Text/TextDataDetectorConfig.test';
import FontSettingOptions from './Text/FontSettingOptions.test';
import imageSpanTest1 from './TextTest/imageSpan1.test';
import imageSpanTest2 from './TextTest/imageSpan2.test';
import imageSpanTest3 from './TextTest/imageSpan3.test';
import imageSpanTest4 from './TextTest/imageSpan4.test';
import imageSpanTest5 from './TextTest/imageSpan5.test';
import imageSpanTest6 from './TextTest/imageSpan6.test';
import imageSpanTest7 from './TextTest/imageSpan7.test';
import imageSpanTest8 from './TextTest/imageSpan8.test';
import TextMaxLines from './Text/TextMaxLines.test';
import ContainerSpanModifierTest from './TextTest/ContainerSpanModifierTest.test'
import TextCommonTextComputing1 from './TextTest/MeasureSizeTest/TextCommonTextComputing1.test';
import TextCommonTextComputing2 from './TextTest/MeasureSizeTest/TextCommonTextComputing2.test';
import TextCommonTextComputing3 from './TextTest/MeasureSizeTest/TextCommonTextComputing3.test';
import TextCommonTextComputing4 from './TextTest/MeasureSizeTest/TextCommonTextComputing4.test';
import TextCommonTextComputing5 from './TextTest/MeasureSizeTest/TextCommonTextComputing5.test';
import TextCommonTextComputing6 from './TextTest/MeasureSizeTest/TextCommonTextComputing6.test';
import TextCommonTextComputing7 from './TextTest/MeasureSizeTest/TextCommonTextComputing7.test';
import TextCommonTextComputing8 from './TextTest/MeasureSizeTest/TextCommonTextComputing8.test';
import TextCommonTextComputing9 from './TextTest/MeasureSizeTest/TextCommonTextComputing9.test';
import onSelectionChange2 from './RichEditorTest/onSelectionChange2.test'
import onSelectionChange3 from './RichEditorTest/onSelectionChange3.test'
import onSelectionChange9 from './RichEditorTest/onSelectionChange9.test'
import onSelectionChange11 from './RichEditorTest/onSelectionChange11.test'
import onSelectionChange12 from './RichEditorTest/onSelectionChange12.test'
import onSelectionChange13 from './RichEditorTest/onSelectionChange13.test'
import onSelectionChange14 from './RichEditorTest/onSelectionChange14.test'
import onSelectionChange16 from './RichEditorTest/onSelectionChange16.test'
import onSelectionChange17 from './RichEditorTest/onSelectionChange17.test'
import RichEditorApi3 from './RichEditor/RichEditorApi3.test'
import RichEditorChangeCallback from './RichEditor/RichEditorChangeCallback.test'
import RichEditorWordBreakJsunitTest from './RichEditorEnhance01/RichEditorWordBreakJsunitTest.test'
import RichEditorTextStyleJsunit from './RichEditorEnhance01/RichEditorTextStyleJsunit.test'
import RichEditorFontFeatureJsunit from './RichEditorEnhance01/RichEditorFontFeatureJsunit.test'
import RichEditor2 from './RichEditorEnhance/RichEditor2.test'
import RichEditor8 from './RichEditorEnhance/RichEditor8.test'
import RichEditor9 from './RichEditorEnhance/RichEditor9.test'
import RichEditor10 from './RichEditorEnhance/RichEditor10.test'
import TextInputTextAreaSearch from './RichEditorEnhance/TextInputTextAreaSearch.test'
import SelectionMenuApi from './RichEditor/SelectionMenuApi.test'
import menuPolicyHIDE from './RichEditorTest/menuPolicyHIDE.test'
import menuPolicySHOW from './RichEditorTest/menuPolicySHOW.test'
import RichEditorChangeValueTest1 from './RichEditor/RichEditorChangeValueTest1.test'
import RichEditorGetLayoutManagerTest1 from './RichEditor/RichEditorGetLayoutManagerTest1.test'
import RichEditorStyledStringTest1 from './RichEditor/RichEditorStyledStringTest1.test'
import RichEditorStyledStringTest2 from './RichEditor/RichEditorStyledStringTest2.test'
import RichEditorApi2 from './RichEditor/RichEditorApi2.test'
import RichEditorApi6 from './RichEditor/RichEditorApi6.test'
import RichEditorApi7 from './RichEditor/RichEditorApi7.test'
import RichEditorApi8 from './RichEditor/RichEditorApi8.test'
import RichEditorApi9 from './RichEditor/RichEditorApi9.test'
import RichEditorApi10 from './RichEditor/RichEditorApi10.test'
import RichEditorApi11 from './RichEditor/RichEditorApi11.test'
import RichEditorApi12 from './RichEditor/RichEditorApi12.test'
import RichEditorAddApi from './RichEditor/RichEditorAddApi.test'
import RichEditorApi13 from './RichEditor/RichEditorApi13.test'
import RichEditor001 from './RichEditorEmojiTest/RichEditor001.test'
import RichEditor002 from './RichEditorEmojiTest/RichEditor002.test'
import RichEditor003 from './RichEditorEmojiTest/RichEditor003.test'
import RichEditor004 from './RichEditorEmojiTest/RichEditor004.test'
import RichEditor005 from './RichEditorEmojiTest/RichEditor005.test'
import RichEditor006 from './RichEditorEmojiTest/RichEditor006.test'
import RichEditor007 from './RichEditorEmojiTest/RichEditor007.test'
import RichEditor008 from './RichEditorEmojiTest/RichEditor008.test'
import RichEditor009 from './RichEditorEmojiTest/RichEditor009.test'
import RichEditor010 from './RichEditorEmojiTest/RichEditor010.test'
import RichEditor011 from './RichEditorEmojiTest/RichEditor011.test'
import RichEditor012 from './RichEditorEmojiTest/RichEditor012.test'
import RichEditor013 from './RichEditorEmojiTest/RichEditor013.test'
import RichEditor014 from './RichEditorEmojiTest/RichEditor014.test'
import RichEditor015 from './RichEditorEmojiTest/RichEditor015.test'
import RichEditor016 from './RichEditorEmojiTest/RichEditor016.test'
import RichEditor017 from './RichEditorEmojiTest/RichEditor017.test'
import RichEditor018 from './RichEditorEmojiTest/RichEditor018.test'
import RichEditor019 from './RichEditorEmojiTest/RichEditor019.test'
import RichEditor020 from './RichEditorEmojiTest/RichEditor020.test'
import RichEditor021 from './RichEditorEmojiTest/RichEditor021.test'
import RichEditor022 from './RichEditorEmojiTest/RichEditor022.test'
import RichEditor023 from './RichEditorEmojiTest/RichEditor023.test'
import RichEditor024 from './RichEditorEmojiTest/RichEditor024.test'
import RichEditorBreak001 from './RichEditorWordBreakTest/RichEditorBreak001.test'
import RichEditorBreak002 from './RichEditorWordBreakTest/RichEditorBreak002.test'
import RichEditorBreak003 from './RichEditorWordBreakTest/RichEditorBreak003.test'
import RichEditorBreak004 from './RichEditorWordBreakTest/RichEditorBreak004.test'
import RichEditorBreak005 from './RichEditorWordBreakTest/RichEditorBreak005.test'

import RichEditorCustomColors001 from './RichEditorCustomColorsTest/RichEditorCustomColors001.test'
import RichEditorCustomColors002 from './RichEditorCustomColorsTest/RichEditorCustomColors002.test'
import RichEditorInterFace001 from './RichEditorCustomColorsTest/RichEditorInterFace001.test'
import RichEditorAction001 from './RichEditorCustomColorsTest/RichEditorAction001.test'
import RichEditorParticiple001 from './RichEditorCustomColorsTest/RichEditorParticiple001.test'
import RichEditorParticiple002 from './RichEditorCustomColorsTest/RichEditorParticiple002.test'

import RichEditorOnWillChange001 from './RichEditorOnWillChangeTest/RichEditorOnWillChange001.test'
import RichEditorOnWillChange002 from './RichEditorOnWillChangeTest/RichEditorOnWillChange002.test'
import RichEditorOnWillChange003 from './RichEditorOnWillChangeTest/RichEditorOnWillChange003.test'
import RichEditorOnWillChange004 from './RichEditorOnWillChangeTest/RichEditorOnWillChange004.test'
import RichEditorOnWillChange005 from './RichEditorOnWillChangeTest/RichEditorOnWillChange005.test'
import RichEditorOnWillChange006 from './RichEditorOnWillChangeTest/RichEditorOnWillChange006.test'
import RichEditorOnWillChange007 from './RichEditorOnWillChangeTest/RichEditorOnWillChange007.test'
import RichEditorOnWillChange008 from './RichEditorOnWillChangeTest/RichEditorOnWillChange008.test'
import RichEditorOnWillChange009 from './RichEditorOnWillChangeTest/RichEditorOnWillChange009.test'
import RichEditorOnWillChange010 from './RichEditorOnWillChangeTest/RichEditorOnWillChange010.test'
import RichEditorOnWillChange011 from './RichEditorOnWillChangeTest/RichEditorOnWillChange011.test'
import RichEditorOnWillChange012 from './RichEditorOnWillChangeTest/RichEditorOnWillChange012.test'
import RichEditorOnWillChange013 from './RichEditorOnWillChangeTest/RichEditorOnWillChange013.test'
import RichEditorOnWillChange014 from './RichEditorOnWillChangeTest/RichEditorOnWillChange014.test'
import RichEditorOnWillChange015 from './RichEditorOnWillChangeTest/RichEditorOnWillChange015.test'
import RichEditorOnWillChange016 from './RichEditorOnWillChangeTest/RichEditorOnWillChange016.test'
import RichEditorOnWillChange017 from './RichEditorOnWillChangeTest/RichEditorOnWillChange017.test'
import RichEditorOnWillChange018 from './RichEditorOnWillChangeTest/RichEditorOnWillChange018.test'
import RichEditorOnWillChange019 from './RichEditorOnWillChangeTest/RichEditorOnWillChange019.test'
import RichEditorOnWillChange020 from './RichEditorOnWillChangeTest/RichEditorOnWillChange020.test'

import RichEditorQueryLayout001 from './RichEditorQueryLayoutTest/RichEditorQueryLayout001.test'
import RichEditorQueryLayout002 from './RichEditorQueryLayoutTest/RichEditorQueryLayout002.test'
import RichEditorQueryLayout003 from './RichEditorQueryLayoutTest/RichEditorQueryLayout003.test'
import RichEditorQueryLayout004 from './RichEditorQueryLayoutTest/RichEditorQueryLayout004.test'
import RichEditorQueryLayout005 from './RichEditorQueryLayoutTest/RichEditorQueryLayout005.test'
import RichEditorQueryLayout006 from './RichEditorQueryLayoutTest/RichEditorQueryLayout006.test'
import RichEditorQueryLayout007 from './RichEditorQueryLayoutTest/RichEditorQueryLayout007.test'
import RichEditorQueryLayout008 from './RichEditorQueryLayoutTest/RichEditorQueryLayout008.test'
import RichEditorQueryLayout009 from './RichEditorQueryLayoutTest/RichEditorQueryLayout009.test'
import RichEditorQueryLayout010 from './RichEditorQueryLayoutTest/RichEditorQueryLayout010.test'
import RichEditorQueryLayout011 from './RichEditorQueryLayoutTest/RichEditorQueryLayout011.test'
import RichEditorQueryLayout012 from './RichEditorQueryLayoutTest/RichEditorQueryLayout012.test'
import RichEditorQueryLayout013 from './RichEditorQueryLayoutTest/RichEditorQueryLayout013.test'
import RichEditorQueryLayout014 from './RichEditorQueryLayoutTest/RichEditorQueryLayout014.test'
import RichEditorQueryLayout015 from './RichEditorQueryLayoutTest/RichEditorQueryLayout015.test'
import RichEditorQueryLayout016 from './RichEditorQueryLayoutTest/RichEditorQueryLayout016.test'
import RichEditorQueryLayout017 from './RichEditorQueryLayoutTest/RichEditorQueryLayout017.test'
import RichEditorQueryLayout018 from './RichEditorQueryLayoutTest/RichEditorQueryLayout018.test'
import RichEditorQueryLayout019 from './RichEditorQueryLayoutTest/RichEditorQueryLayout019.test'
import RichEditorQueryLayout020 from './RichEditorQueryLayoutTest/RichEditorQueryLayout020.test'
import RichEditorQueryLayout021 from './RichEditorQueryLayoutTest/RichEditorQueryLayout021.test'
import RichEditorQueryLayout022 from './RichEditorQueryLayoutTest/RichEditorQueryLayout022.test'
import RichEditorQueryLayout023 from './RichEditorQueryLayoutTest/RichEditorQueryLayout023.test'
import RichEditorQueryLayout024 from './RichEditorQueryLayoutTest/RichEditorQueryLayout024.test'

import RichEditorPlaceHolder001 from './RichEditorPlaceHolderTest/RichEditorPlaceHolder001.test'

import RichEditorTextChange001 from './RichEditorTextChangeTest/RichEditorTextChange001.test'
import RichEditorTextChange002 from './RichEditorTextChangeTest/RichEditorTextChange002.test'
import RichEditorTextChange003 from './RichEditorTextChangeTest/RichEditorTextChange003.test'
import RichEditorTextChange004 from './RichEditorTextChangeTest/RichEditorTextChange004.test'
import RichEditorTextChange005 from './RichEditorTextChangeTest/RichEditorTextChange005.test'
import RichEditorTextChange006 from './RichEditorTextChangeTest/RichEditorTextChange006.test'
import RichEditorTextChange008 from './RichEditorTextChangeTest/RichEditorTextChange008.test'
import RichEditorTextChange010 from './RichEditorTextChangeTest/RichEditorTextChange010.test'
import RichEditorTextChange011 from './RichEditorTextChangeTest/RichEditorTextChange011.test'
import RichEditorTextChange012 from './RichEditorTextChangeTest/RichEditorTextChange012.test'
import RichEditorTextChange013 from './RichEditorTextChangeTest/RichEditorTextChange013.test'
import RichEditorTextChange014 from './RichEditorTextChangeTest/RichEditorTextChange014.test'
import RichEditorTextChange015 from './RichEditorTextChangeTest/RichEditorTextChange015.test'
import RichEditorTextChange016 from './RichEditorTextChangeTest/RichEditorTextChange016.test'
import RichEditorTextChange017 from './RichEditorTextChangeTest/RichEditorTextChange017.test'

import RichEditorOnSelectionChange001 from './RichEditorOnSelectionChangeTest/RichEditorOnSelectionChange001.test'
import RichEditorOnSelectionChange002 from './RichEditorOnSelectionChangeTest/RichEditorOnSelectionChange002.test'
import RichEditorOnSelectionChange003 from './RichEditorOnSelectionChangeTest/RichEditorOnSelectionChange003.test'
import RichEditorOnSelectionChange004 from './RichEditorOnSelectionChangeTest/RichEditorOnSelectionChange004.test'
import RichEditorOnSelectionChange005 from './RichEditorOnSelectionChangeTest/RichEditorOnSelectionChange005.test'
import RichEditorOnSelectionChange006 from './RichEditorOnSelectionChangeTest/RichEditorOnSelectionChange006.test'
import RichEditorOnSelectionChange007 from './RichEditorOnSelectionChangeTest/RichEditorOnSelectionChange007.test'
import RichEditorOnSelectionChange008 from './RichEditorOnSelectionChangeTest/RichEditorOnSelectionChange008.test'
import RichEditorOnSelectionChange009 from './RichEditorOnSelectionChangeTest/RichEditorOnSelectionChange009.test'
import RichEditorOnSelectionChange011 from './RichEditorOnSelectionChangeTest/RichEditorOnSelectionChange011.test'
import RichEditorOnSelectionChange012 from './RichEditorOnSelectionChangeTest/RichEditorOnSelectionChange012.test'
import RichEditorOnSelectionChange013 from './RichEditorOnSelectionChangeTest/RichEditorOnSelectionChange013.test'
import RichEditorOnSelectionChange014 from './RichEditorOnSelectionChangeTest/RichEditorOnSelectionChange014.test'
import RichEditorOnSelectionChange015 from './RichEditorOnSelectionChangeTest/RichEditorOnSelectionChange015.test'
import RichEditorOnSelectionChange016 from './RichEditorOnSelectionChangeTest/RichEditorOnSelectionChange016.test'
import RichEditorOnSelectionChange017 from './RichEditorOnSelectionChangeTest/RichEditorOnSelectionChange017.test'
import RichEditorOnSelectionChange018 from './RichEditorOnSelectionChangeTest/RichEditorOnSelectionChange018.test'
import RichEditorOnSelectionChange019 from './RichEditorOnSelectionChangeTest/RichEditorOnSelectionChange019.test'

import RichEditorLineLetter001 from './RichEditorLineLetterTest/RichEditorLineLetter001.test'
import RichEditorLineLetter002 from './RichEditorLineLetterTest/RichEditorLineLetter002.test'
import RichEditorLineLetter003 from './RichEditorLineLetterTest/RichEditorLineLetter003.test'
import RichEditorLineLetter004 from './RichEditorLineLetterTest/RichEditorLineLetter004.test'
import RichEditorLineLetter005 from './RichEditorLineLetterTest/RichEditorLineLetter005.test'
import RichEditorLineLetter006 from './RichEditorLineLetterTest/RichEditorLineLetter006.test'
import RichEditorLineLetter007 from './RichEditorLineLetterTest/RichEditorLineLetter007.test'
import RichEditorLineLetter008 from './RichEditorLineLetterTest/RichEditorLineLetter008.test'
import RichEditorLineLetter009 from './RichEditorLineLetterTest/RichEditorLineLetter009.test'
import RichEditorLineLetter010 from './RichEditorLineLetterTest/RichEditorLineLetter010.test'
import RichEditorLineLetter011 from './RichEditorLineLetterTest/RichEditorLineLetter011.test'
import RichEditorLineLetter012 from './RichEditorLineLetterTest/RichEditorLineLetter012.test'
import RichEditorLineLetter013 from './RichEditorLineLetterTest/RichEditorLineLetter013.test'
import RichEditorLineLetter014 from './RichEditorLineLetterTest/RichEditorLineLetter014.test'
import RichEditorLineLetter015 from './RichEditorLineLetterTest/RichEditorLineLetter015.test'

import RichEditorKeyBoard001 from './RichEditorKeyBoardTest/RichEditorKeyBoard001.test'
import RichEditorKeyBoard002 from './RichEditorKeyBoardTest/RichEditorKeyBoard002.test'
import RichEditorKeyBoard003 from './RichEditorKeyBoardTest/RichEditorKeyBoard003.test'
import RichEditorKeyBoard004 from './RichEditorKeyBoardTest/RichEditorKeyBoard004.test'
import RichEditorKeyBoard005 from './RichEditorKeyBoardTest/RichEditorKeyBoard005.test'
import RichEditorKeyBoard006 from './RichEditorKeyBoardTest/RichEditorKeyBoard006.test'
import RichEditorKeyBoard007 from './RichEditorKeyBoardTest/RichEditorKeyBoard007.test'
import RichEditorKeyBoard008 from './RichEditorKeyBoardTest/RichEditorKeyBoard008.test'

import RichEditorUxConFormance001 from './RichEditorUxConFormanceTest/RichEditorUxConFormance001.test'
import RichEditorUxConFormance002 from './RichEditorUxConFormanceTest/RichEditorUxConFormance002.test'
import RichEditorUxConFormance004 from './RichEditorUxConFormanceTest/RichEditorUxConFormance004.test'
import RichEditorUxConFormance005 from './RichEditorUxConFormanceTest/RichEditorUxConFormance005.test'
import RichEditorUxConFormance006 from './RichEditorUxConFormanceTest/RichEditorUxConFormance006.test'

import RichEditorLayoutStyle001 from './RichEditorLayoutStyleTest/RichEditorLayoutStyle001.test'
import RichEditorLayoutStyle002 from './RichEditorLayoutStyleTest/RichEditorLayoutStyle002.test'
import RichEditorLayoutStyle003 from './RichEditorLayoutStyleTest/RichEditorLayoutStyle003.test'

import RichEditorLineMetrics001 from './RichEditorLineMetricsTest/RichEditorLineMetrics001.test'
import RichEditorLineMetrics002 from './RichEditorLineMetricsTest/RichEditorLineMetrics002.test'
import RichEditorLineMetrics003 from './RichEditorLineMetricsTest/RichEditorLineMetrics003.test'
import RichEditorLineMetrics004 from './RichEditorLineMetricsTest/RichEditorLineMetrics004.test'
import RichEditorLineMetrics005 from './RichEditorLineMetricsTest/RichEditorLineMetrics005.test'
import RichEditorLineMetrics006 from './RichEditorLineMetricsTest/RichEditorLineMetrics006.test'
import RichEditorLineMetrics007 from './RichEditorLineMetricsTest/RichEditorLineMetrics007.test'
import RichEditorLineMetrics008 from './RichEditorLineMetricsTest/RichEditorLineMetrics008.test'
import RichEditorLineMetrics009 from './RichEditorLineMetricsTest/RichEditorLineMetrics009.test'
import RichEditorLineMetrics010 from './RichEditorLineMetricsTest/RichEditorLineMetrics010.test'
import RichEditorLineMetrics011 from './RichEditorLineMetricsTest/RichEditorLineMetrics011.test'
import RichEditorLineMetrics012 from './RichEditorLineMetricsTest/RichEditorLineMetrics012.test'
import RichEditorLineMetrics013 from './RichEditorLineMetricsTest/RichEditorLineMetrics013.test'
import RichEditorLineMetrics014 from './RichEditorLineMetricsTest/RichEditorLineMetrics014.test'
import RichEditorLineMetrics015 from './RichEditorLineMetricsTest/RichEditorLineMetrics015.test'
import RichEditorLineMetrics016 from './RichEditorLineMetricsTest/RichEditorLineMetrics016.test'
import RichEditorLineMetrics017 from './RichEditorLineMetricsTest/RichEditorLineMetrics017.test'
import RichEditorLineMetrics018 from './RichEditorLineMetricsTest/RichEditorLineMetrics018.test'
import RichEditorLineMetrics019 from './RichEditorLineMetricsTest/RichEditorLineMetrics019.test'
import RichEditorLineMetrics020 from './RichEditorLineMetricsTest/RichEditorLineMetrics020.test'
import RichEditorLineMetrics021 from './RichEditorLineMetricsTest/RichEditorLineMetrics021.test'
import RichEditorLineMetrics022 from './RichEditorLineMetricsTest/RichEditorLineMetrics022.test'
import RichEditorLineMetrics023 from './RichEditorLineMetricsTest/RichEditorLineMetrics023.test'

import RichEditorLineBreakStrategy001 from './RichEditorLineBreakStrategyTest/RichEditorLineBreakStrategy001.test'
import RichEditorLineBreakStrategy002 from './RichEditorLineBreakStrategyTest/RichEditorLineBreakStrategy002.test'
import RichEditorLineBreakStrategy003 from './RichEditorLineBreakStrategyTest/RichEditorLineBreakStrategy003.test'

import RichEditorPreventDefault001 from './RichEditorPreventDefaultTest/RichEditorPreventDefault001.test'
import RichEditorPreventDefault002 from './RichEditorPreventDefaultTest/RichEditorPreventDefault002.test'
import RichEditorPreventDefault003 from './RichEditorPreventDefaultTest/RichEditorPreventDefault003.test'
import RichEditorPreventDefault004 from './RichEditorPreventDefaultTest/RichEditorPreventDefault004.test'
import RichEditorPreventDefault005 from './RichEditorPreventDefaultTest/RichEditorPreventDefault005.test'
import RichEditorPreventDefault006 from './RichEditorPreventDefaultTest/RichEditorPreventDefault006.test'
import RichEditorPreventDefault007 from './RichEditorPreventDefaultTest/RichEditorPreventDefault007.test'

import RichEditorSetStyledString002 from './RichEditorSetStyledStringTest/RichEditorSetStyledString002.test'
import RichEditorSetStyledString003 from './RichEditorSetStyledStringTest/RichEditorSetStyledString003.test'
import RichEditorSetStyledString004 from './RichEditorSetStyledStringTest/RichEditorSetStyledString004.test'
import RichEditorSetStyledString005 from './RichEditorSetStyledStringTest/RichEditorSetStyledString005.test'
import RichEditorSetStyledString006 from './RichEditorSetStyledStringTest/RichEditorSetStyledString006.test'
import RichEditorSetStyledString007 from './RichEditorSetStyledStringTest/RichEditorSetStyledString007.test'
import RichEditorSetStyledString008 from './RichEditorSetStyledStringTest/RichEditorSetStyledString008.test'
import RichEditorSetStyledString009 from './RichEditorSetStyledStringTest/RichEditorSetStyledString009.test'
import RichEditorSetStyledString010 from './RichEditorSetStyledStringTest/RichEditorSetStyledString010.test'
import RichEditorSetStyledString011 from './RichEditorSetStyledStringTest/RichEditorSetStyledString011.test'
import RichEditorSetStyledString012 from './RichEditorSetStyledStringTest/RichEditorSetStyledString012.test'
import RichEditorSetStyledString013 from './RichEditorSetStyledStringTest/RichEditorSetStyledString013.test'
import RichEditorSetStyledString014 from './RichEditorSetStyledStringTest/RichEditorSetStyledString014.test'
import RichEditorSetStyledString015 from './RichEditorSetStyledStringTest/RichEditorSetStyledString015.test'
import RichEditorSetStyledString016 from './RichEditorSetStyledStringTest/RichEditorSetStyledString016.test'
import RichEditorSetStyledString017 from './RichEditorSetStyledStringTest/RichEditorSetStyledString017.test'
import RichEditorSetStyledString018 from './RichEditorSetStyledStringTest/RichEditorSetStyledString018.test'
import RichEditorSetStyledString019 from './RichEditorSetStyledStringTest/RichEditorSetStyledString019.test'
import RichEditorSetStyledString020 from './RichEditorSetStyledStringTest/RichEditorSetStyledString020.test'

import RichEditorTransformation001 from './RichEditorTransformationTest/RichEditorTransformation001.test'
import RichEditorTransformation002 from './RichEditorTransformationTest/RichEditorTransformation002.test'
import RichEditorTransformation003 from './RichEditorTransformationTest/RichEditorTransformation003.test'
import RichEditorTransformation004 from './RichEditorTransformationTest/RichEditorTransformation004.test'
import RichEditorTransformation005 from './RichEditorTransformationTest/RichEditorTransformation005.test'

import RichEditorGetNumber001 from './RichEditorGetNumberTest/RichEditorGetNumber001.test'
import RichEditorGetNumber002 from './RichEditorGetNumberTest/RichEditorGetNumber002.test'
import RichEditorGetNumber003 from './RichEditorGetNumberTest/RichEditorGetNumber003.test'
import RichEditorGetNumber004 from './RichEditorGetNumberTest/RichEditorGetNumber004.test'
import RichEditorGetNumber005 from './RichEditorGetNumberTest/RichEditorGetNumber005.test'
import RichEditorGetNumber006 from './RichEditorGetNumberTest/RichEditorGetNumber006.test'
import RichEditorGetNumber007 from './RichEditorGetNumberTest/RichEditorGetNumber007.test'
import RichEditorGetNumber008 from './RichEditorGetNumberTest/RichEditorGetNumber008.test'
import RichEditorGetNumber009 from './RichEditorGetNumberTest/RichEditorGetNumber009.test'
import RichEditorGetNumber010 from './RichEditorGetNumberTest/RichEditorGetNumber010.test'
import RichEditorGetNumber011 from './RichEditorGetNumberTest/RichEditorGetNumber011.test'
import RichEditorGetNumber012 from './RichEditorGetNumberTest/RichEditorGetNumber012.test'
import RichEditorGetNumber013 from './RichEditorGetNumberTest/RichEditorGetNumber013.test'
import RichEditorGetNumber014 from './RichEditorGetNumberTest/RichEditorGetNumber014.test'
import RichEditorGetNumber015 from './RichEditorGetNumberTest/RichEditorGetNumber015.test'
import RichEditorGetNumber016 from './RichEditorGetNumberTest/RichEditorGetNumber016.test'

import RichEditorShortCutKeys001 from './RichEditorShortCutKeysTest/RichEditorShortCutKeys001.test'
import RichEditorShortCutKeys002 from './RichEditorShortCutKeysTest/RichEditorShortCutKeys002.test'
import RichEditorShortCutKeys003 from './RichEditorShortCutKeysTest/RichEditorShortCutKeys003.test'
import RichEditorShortCutKeys004 from './RichEditorShortCutKeysTest/RichEditorShortCutKeys004.test'
import RichEditorShortCutKeys005 from './RichEditorShortCutKeysTest/RichEditorShortCutKeys005.test'
import RichEditorShortCutKeys006 from './RichEditorShortCutKeysTest/RichEditorShortCutKeys006.test'
import RichEditorShortCutKeys007 from './RichEditorShortCutKeysTest/RichEditorShortCutKeys007.test'
import RichEditorShortCutKeys008 from './RichEditorShortCutKeysTest/RichEditorShortCutKeys008.test'
import RichEditorShortCutKeys009 from './RichEditorShortCutKeysTest/RichEditorShortCutKeys009.test'
import RichEditorShortCutKeys010 from './RichEditorShortCutKeysTest/RichEditorShortCutKeys010.test'
import RichEditorShortCutKeys011 from './RichEditorShortCutKeysTest/RichEditorShortCutKeys011.test'
import RichEditorShortCutKeys012 from './RichEditorShortCutKeysTest/RichEditorShortCutKeys012.test'
import RichEditorShortCutKeys013 from './RichEditorShortCutKeysTest/RichEditorShortCutKeys013.test'
import RichEditorShortCutKeys014 from './RichEditorShortCutKeysTest/RichEditorShortCutKeys014.test'
import RichEditorShortCutKeys015 from './RichEditorShortCutKeysTest/RichEditorShortCutKeys015.test'
import RichEditorShortCutKeys017 from './RichEditorShortCutKeysTest/RichEditorShortCutKeys017.test'
import RichEditorShortCutKeys018 from './RichEditorShortCutKeysTest/RichEditorShortCutKeys018.test'
import RichEditorShortCutKeys019 from './RichEditorShortCutKeysTest/RichEditorShortCutKeys019.test'
import RichEditorShortCutKeys020 from './RichEditorShortCutKeysTest/RichEditorShortCutKeys020.test'
import RichEditorShortCutKeys021 from './RichEditorShortCutKeysTest/RichEditorShortCutKeys021.test'
import RichEditorShortCutKeys022 from './RichEditorShortCutKeysTest/RichEditorShortCutKeys022.test'
import RichEditorShortCutKeys023 from './RichEditorShortCutKeysTest/RichEditorShortCutKeys023.test'
import RichEditorShortCutKeys024 from './RichEditorShortCutKeysTest/RichEditorShortCutKeys024.test'

import RichEditorStringSpan001 from './RichEditorStringSpanTest/RichEditorStringSpan001.test'
import RichEditorStringSpan002 from './RichEditorStringSpanTest/RichEditorStringSpan002.test'
import RichEditorStringSpan003 from './RichEditorStringSpanTest/RichEditorStringSpan003.test'
import RichEditorStringSpan004 from './RichEditorStringSpanTest/RichEditorStringSpan004.test'
import RichEditorStringSpan005 from './RichEditorStringSpanTest/RichEditorStringSpan005.test'

import RichEditorCustomSpan001 from './RichEditorCustomSpanTest/RichEditorCustomSpan001.test'
import RichEditorCustomSpan002 from './RichEditorCustomSpanTest/RichEditorCustomSpan002.test'
import RichEditorCustomSpan003 from './RichEditorCustomSpanTest/RichEditorCustomSpan003.test'
import RichEditorCustomSpan004 from './RichEditorCustomSpanTest/RichEditorCustomSpan004.test'
import RichEditorCustomSpan005 from './RichEditorCustomSpanTest/RichEditorCustomSpan005.test'
import RichEditorCustomSpan006 from './RichEditorCustomSpanTest/RichEditorCustomSpan006.test'
import RichEditorCustomSpan007 from './RichEditorCustomSpanTest/RichEditorCustomSpan007.test'
import RichEditorCustomSpan008 from './RichEditorCustomSpanTest/RichEditorCustomSpan008.test'
import RichEditorCustomSpan009 from './RichEditorCustomSpanTest/RichEditorCustomSpan009.test'
import RichEditorCustomSpan010 from './RichEditorCustomSpanTest/RichEditorCustomSpan010.test'
import RichEditorCustomSpan011 from './RichEditorCustomSpanTest/RichEditorCustomSpan011.test'
import RichEditorCustomSpan012 from './RichEditorCustomSpanTest/RichEditorCustomSpan012.test'
import RichEditorCustomSpan013 from './RichEditorCustomSpanTest/RichEditorCustomSpan013.test'
import RichEditorCustomSpan014 from './RichEditorCustomSpanTest/RichEditorCustomSpan014.test'
import RichEditorCustomSpan015 from './RichEditorCustomSpanTest/RichEditorCustomSpan015.test'
import RichEditorCustomSpan016 from './RichEditorCustomSpanTest/RichEditorCustomSpan016.test'
import RichEditorCustomSpan017 from './RichEditorCustomSpanTest/RichEditorCustomSpan017.test'

import RichEditorAttributeStrings001 from './RichEditorAttributeStringsTest/RichEditorAttributeStrings001.test'
import RichEditorAttributeStrings002 from './RichEditorAttributeStringsTest/RichEditorAttributeStrings002.test'
import RichEditorAttributeStrings003 from './RichEditorAttributeStringsTest/RichEditorAttributeStrings003.test'
import RichEditorAttributeStrings004 from './RichEditorAttributeStringsTest/RichEditorAttributeStrings004.test'
import RichEditorAttributeStrings005 from './RichEditorAttributeStringsTest/RichEditorAttributeStrings005.test'
import RichEditorAttributeStrings006 from './RichEditorAttributeStringsTest/RichEditorAttributeStrings006.test'
import RichEditorAttributeStrings007 from './RichEditorAttributeStringsTest/RichEditorAttributeStrings007.test'
import RichEditorAttributeStrings008 from './RichEditorAttributeStringsTest/RichEditorAttributeStrings008.test'

import RichEditorStabillity001 from './RichEditorStabillityTest/RichEditorStabillity001.test'
import RichEditorStabillity002 from './RichEditorStabillityTest/RichEditorStabillity002.test'
import RichEditorStabillity003 from './RichEditorStabillityTest/RichEditorStabillity003.test'
import RichEditorStabillity004 from './RichEditorStabillityTest/RichEditorStabillity004.test'
import RichEditorStabillity005 from './RichEditorStabillityTest/RichEditorStabillity005.test'

import RichEditorThreeStrikes001 from './RichEditorThreeStrikesTest/RichEditorThreeStrikes001.test'
import RichEditorThreeStrikes002 from './RichEditorThreeStrikesTest/RichEditorThreeStrikes002.test'
import RichEditorThreeStrikes003 from './RichEditorThreeStrikesTest/RichEditorThreeStrikes003.test'
import RichEditorThreeStrikes004 from './RichEditorThreeStrikesTest/RichEditorThreeStrikes004.test'
import RichEditorThreeStrikes005 from './RichEditorThreeStrikesTest/RichEditorThreeStrikes005.test'
import RichEditorThreeStrikes006 from './RichEditorThreeStrikesTest/RichEditorThreeStrikes006.test'
import RichEditorThreeStrikes007 from './RichEditorThreeStrikesTest/RichEditorThreeStrikes007.test'
import RichEditorThreeStrikes008 from './RichEditorThreeStrikesTest/RichEditorThreeStrikes008.test'

import RichEditorDoubleClick001 from './RichEditorDoubleClickTest/RichEditorDoubleClick001.test'
import RichEditorDoubleClick002 from './RichEditorDoubleClickTest/RichEditorDoubleClick002.test'
import RichEditorDoubleClick003 from './RichEditorDoubleClickTest/RichEditorDoubleClick003.test'
import RichEditorDoubleClick004 from './RichEditorDoubleClickTest/RichEditorDoubleClick004.test'
import RichEditorDoubleClick005 from './RichEditorDoubleClickTest/RichEditorDoubleClick005.test'
import RichEditorDoubleClick006 from './RichEditorDoubleClickTest/RichEditorDoubleClick006.test'
import RichEditorDoubleClick007 from './RichEditorDoubleClickTest/RichEditorDoubleClick007.test'
import RichEditorDoubleClick008 from './RichEditorDoubleClickTest/RichEditorDoubleClick008.test'
import RichEditorDoubleClick009 from './RichEditorDoubleClickTest/RichEditorDoubleClick009.test'
import RichEditorDoubleClick010 from './RichEditorDoubleClickTest/RichEditorDoubleClick010.test'
import RichEditorDoubleClick011 from './RichEditorDoubleClickTest/RichEditorDoubleClick011.test'
import RichEditorDoubleClick012 from './RichEditorDoubleClickTest/RichEditorDoubleClick012.test'
import RichEditorDoubleClick013 from './RichEditorDoubleClickTest/RichEditorDoubleClick013.test'
import RichEditorDoubleClick014 from './RichEditorDoubleClickTest/RichEditorDoubleClick014.test'
import RichEditorDoubleClick015 from './RichEditorDoubleClickTest/RichEditorDoubleClick015.test'
import RichEditorDoubleClick016 from './RichEditorDoubleClickTest/RichEditorDoubleClick016.test'
import RichEditorDoubleClick017 from './RichEditorDoubleClickTest/RichEditorDoubleClick017.test'
import RichEditorDoubleClick018 from './RichEditorDoubleClickTest/RichEditorDoubleClick018.test'
import RichEditorDoubleClick019 from './RichEditorDoubleClickTest/RichEditorDoubleClick019.test'

import APIClipMaskShape from "./ImageTest/APIClipMaskShape.test";
import imageAddApi from "./ImageTest/imageAddApi.test";
import imageAddApi2 from "./ImageTest/imageAddApi2.test";
import imageAddApi3 from "./ImageTest/imageAddApi3.test";
import dstIndexTest from "./MatrixTest/dstIndexTest.test";
import srcIndexTest from "./MatrixTest/srcIndexTest.test";
import RelativeContainerApi1 from "./RelativeContainer/RelativeContainerApi1.test";
import getStyles from "./StyledString/getStyles.test";
import replaceString from "./StyledString/replaceString.test";
import StyledStringApi1 from "./StyledString/StyledStringApi1.test";
import StyledStringKeyTest1 from "./StyledString/StyledStringKeyTest1.test";
import spanTest from './spanTest/SpanJsunit1.test'

export default function testsuite() {
  RichEditorStringSpan001();
  RichEditorStringSpan002()
  RichEditorStringSpan003();
  RichEditorStringSpan004();
  RichEditorStringSpan005();

  RichEditorCustomSpan001();
  RichEditorCustomSpan002();
  RichEditorCustomSpan003();
  RichEditorCustomSpan004();
  RichEditorCustomSpan007();
  RichEditorCustomSpan009();
  RichEditorCustomSpan012();
  RichEditorCustomSpan013();
  RichEditorCustomSpan014();
  RichEditorCustomSpan015();
  RichEditorCustomSpan016();
  RichEditorCustomSpan017();
  RichEditorCustomSpan008();
  RichEditorCustomSpan005();
  RichEditorCustomSpan006();
  RichEditorCustomSpan010();
  RichEditorCustomSpan011();

  RichEditorTransformation001();
  RichEditorTransformation002();
  RichEditorTransformation003();
  RichEditorTransformation005();
  RichEditorTransformation004();


  RichEditorLayoutStyle003();
  RichEditorLayoutStyle001();
  RichEditorLayoutStyle002();

  RichEditorShortCutKeys006();
  RichEditorShortCutKeys009();
  RichEditorShortCutKeys010();
  RichEditorShortCutKeys011();
  RichEditorShortCutKeys012();
  RichEditorShortCutKeys013();
  RichEditorShortCutKeys014();
  RichEditorShortCutKeys015();
  RichEditorShortCutKeys017();
  RichEditorShortCutKeys018();
  RichEditorShortCutKeys019();
  RichEditorShortCutKeys020();
  RichEditorShortCutKeys021();
  RichEditorShortCutKeys022();
  RichEditorShortCutKeys023();
  RichEditorShortCutKeys024();
  RichEditorShortCutKeys001();
  RichEditorShortCutKeys002();
  RichEditorShortCutKeys003();
  RichEditorShortCutKeys004();
  RichEditorShortCutKeys005();
  RichEditorShortCutKeys007();
  RichEditorShortCutKeys008();

  RichEditorUxConFormance001();
  RichEditorUxConFormance002();
  RichEditorUxConFormance004();
  RichEditorUxConFormance005();
  RichEditorUxConFormance006();

  RichEditorQueryLayout001();
  RichEditorQueryLayout002();
  RichEditorQueryLayout003();
  RichEditorQueryLayout004();
  RichEditorQueryLayout005();
  RichEditorQueryLayout006();
  RichEditorQueryLayout007();
  RichEditorQueryLayout008();
  RichEditorQueryLayout009();
  RichEditorQueryLayout010();
  RichEditorQueryLayout011();
  RichEditorQueryLayout012();
  RichEditorQueryLayout013();
  RichEditorQueryLayout014();
  RichEditorQueryLayout015();
  RichEditorQueryLayout016();
  RichEditorQueryLayout017();
  RichEditorQueryLayout018();
  RichEditorQueryLayout019();
  RichEditorQueryLayout020();
  RichEditorQueryLayout021();
  RichEditorQueryLayout022();
  RichEditorQueryLayout023();
  RichEditorQueryLayout024();

  RichEditorBreak002();
  RichEditorBreak003();
  RichEditorBreak004();
  RichEditorBreak005();
  RichEditorBreak001();

  RichEditorAttributeStrings005();
  RichEditorAttributeStrings001();
  RichEditorAttributeStrings002();
  RichEditorAttributeStrings003();
  RichEditorAttributeStrings004();
  RichEditorAttributeStrings006();
  RichEditorAttributeStrings007();
  RichEditorAttributeStrings008();

  getStyles();
  replaceString();

  RichEditorSetStyledString015();
  RichEditorSetStyledString012();
  RichEditorSetStyledString018();
  RichEditorSetStyledString005();
  RichEditorSetStyledString006();
  RichEditorSetStyledString017();
  RichEditorSetStyledString007();
  RichEditorSetStyledString008();
  RichEditorSetStyledString002();
  RichEditorSetStyledString003();
  RichEditorSetStyledString004();
  RichEditorSetStyledString009();
  RichEditorSetStyledString010();
  RichEditorSetStyledString011();
  RichEditorSetStyledString013();
  RichEditorSetStyledString014();
  RichEditorSetStyledString016();
  RichEditorSetStyledString019();
  RichEditorSetStyledString020();

  getLayout()

  RichEditorLineLetter001();
  RichEditorLineLetter002();
  RichEditorLineLetter003();
  RichEditorLineLetter004();
  RichEditorLineLetter005();
  RichEditorLineLetter006();
  RichEditorLineLetter007();
  RichEditorLineLetter008();
  RichEditorLineLetter009();
  RichEditorLineLetter010();
  RichEditorLineLetter011();
  RichEditorLineLetter012();
  RichEditorLineLetter013();
  RichEditorLineLetter014();
  RichEditorLineLetter015();

  RichEditor020();
  RichEditor021();
  RichEditor022();
  RichEditor023();

  RichEditorLineMetrics002();
  RichEditorLineMetrics003();
  RichEditorLineMetrics011();
  RichEditorLineMetrics012();
  RichEditorLineMetrics013();
  RichEditorLineMetrics014();
  RichEditorLineMetrics015();
  RichEditorLineMetrics016();
  RichEditorLineMetrics017();
  RichEditorLineMetrics018();
  RichEditorLineMetrics021();
  RichEditorLineMetrics022();
  RichEditorLineMetrics023();
  RichEditorLineMetrics001();
  RichEditorLineMetrics004();
  RichEditorLineMetrics005();
  RichEditorLineMetrics006();
  RichEditorLineMetrics007();
  RichEditorLineMetrics009();
  RichEditorLineMetrics008();
  RichEditorLineMetrics010();
  RichEditorLineMetrics019();
  RichEditorLineMetrics020();

  getLineMetrics();
  TextMaxLines();

  RichEditorOnWillChange018();
  RichEditorOnWillChange019();
  RichEditorOnWillChange008();
  RichEditorOnWillChange002();
  RichEditorOnWillChange001();
  RichEditorOnWillChange003();
  RichEditorOnWillChange004();
  RichEditorOnWillChange005();
  RichEditorOnWillChange006();
  RichEditorOnWillChange007();
  RichEditorOnWillChange009();
  RichEditorOnWillChange010();
  RichEditorOnWillChange011();
  RichEditorOnWillChange012();
  RichEditorOnWillChange013();
  RichEditorOnWillChange014();
  RichEditorOnWillChange015();
  RichEditorOnWillChange016();
  RichEditorOnWillChange017();
  RichEditorOnWillChange020();

  RichEditorApi9();
  RichEditorChangeValueTest1();
  spanTest();
  textInputEnterKeyTypeTest()

  MarqueeMirroringTest();
  MarqueeApi();

  SearchApi1();
  SearchEvent();
  SearchEvent2();

  SymbolGlyphApi();

  TextCommonTextComputing1();
  TextCommonTextComputing2();
  TextCommonTextComputing3();
  TextCommonTextComputing4();
  TextCommonTextComputing5();
  TextCommonTextComputing6();
  TextCommonTextComputing7();
  TextCommonTextComputing8();
  TextCommonTextComputing9();

  textAreaInputTest();
  APIContentTypeTest();
  APIUnderlineColorTest();
  TextInputAddApi();
  TextInputEvent()
  TextInputEvent2()
  removeStyles()
  clearStyles()
  StyledString()
  TextStyle();
  underlineColor();
  TextAreaApi1();
  TextAreaApi2();
  TextAreaApi3();
  TextAddApi1()

  TextInput_lineBreakStrategyTest();
  Text_lineBreakStrategyTest();
  Text_lineSpacingTest();
  textStrategyJsunit();
  Context()
  styledStringApi()
  TextInputApi1();
  AttributeUpdaterTest();
  UnitTest();
  TextAreaApi4()

  textAreaLetterSpacing();
  TextStyleWavy()
  textAreaLineHeight();
  TextAreaTypeTest();
  TextAreaTest()
  TextArea_lineBreakStrategyTest();
  TextArea_lineSpacingTest();
  styledStringAddApi()


  textSelectableJsunit();
  typeNodeTextDecorationStyleTest();
  typeNodeTextSelectableMode1Test();
  typeNodeTextSelectableMode2Test();
  typeNodeTextSelectableMode3Test();
  textAreaPreview();
  textInputPreview();
  TextHalfLeading();

  TextDataDetectorConfig();
  FontSettingOptions();

  imageSpanTest1();
  imageSpanTest2();
  imageSpanTest3();
  imageSpanTest4();
  imageSpanTest5();
  imageSpanTest6();
  imageSpanTest7();
  imageSpanTest8();

  textAreaAutoFillTest()
  textAreaHeightAdaptivePolicyTest();
  textAreaMinFontSize();
  textAreaMaxFontSize();
  textAreaDecoration();
  textInputUnderlineColorTest();
  textInputMaxFontSize();
  textInputMinFontSize();
  textInputHeightAdaptivePolicy();
  textInputDecoration();
  textInputLetterSpacing();
  textInputLineHeight();
  ContainerSpanModifierTest();
  TextInputTypeTest();
  onSelectionChange2();
  onSelectionChange3();
  onSelectionChange9();
  onSelectionChange11();
  onSelectionChange12();
  onSelectionChange13();
  onSelectionChange14();
  onSelectionChange16();
  onSelectionChange17();
  RichEditorApi3();
  RichEditorChangeCallback();
  RichEditorWordBreakJsunitTest();
  RichEditorTextStyleJsunit();
  RichEditorFontFeatureJsunit();
  RichEditor2();
  RichEditor8();
  RichEditor9();
  RichEditor10();
  TextInputTextAreaSearch();
  SelectionMenuApi();
  menuPolicyHIDE();
  menuPolicySHOW();
  RichEditorGetLayoutManagerTest1();
  RichEditorStyledStringTest1();
  RichEditorStyledStringTest2();
  RichEditorApi2();
  RichEditorApi6();
  RichEditorApi7();
  RichEditorApi8();
  RichEditorApi10();
  RichEditorApi11();
  RichEditorApi12();
  RichEditorAddApi();
  RichEditorApi13();
  RichEditor001();
  RichEditor002();
  RichEditor003();
  RichEditor004();
  RichEditor005();
  RichEditor006();
  RichEditor007();
  RichEditor008();
  RichEditor009();
  RichEditor010();
  RichEditor011();
  RichEditor012();
  RichEditor013();
  RichEditor014();
  RichEditor015();
  RichEditor016();
  RichEditor017();
  RichEditor018();
  RichEditor019();
  RichEditor024();
  RichEditorCustomColors001();
  RichEditorCustomColors002();
  RichEditorInterFace001();
  RichEditorAction001();
  RichEditorParticiple001();
  RichEditorParticiple002();

  RichEditorPlaceHolder001();
  RichEditorTextChange001();
  RichEditorTextChange002();
  RichEditorTextChange003();
  RichEditorTextChange004();
  RichEditorTextChange005();
  RichEditorTextChange006();
  RichEditorTextChange008();
  RichEditorTextChange010();
  RichEditorTextChange011();
  RichEditorTextChange012();
  RichEditorTextChange013();
  RichEditorTextChange014();
  RichEditorTextChange015();
  RichEditorTextChange016();
  RichEditorTextChange017();
  RichEditorOnSelectionChange001();
  RichEditorOnSelectionChange002();
  RichEditorOnSelectionChange003();
  RichEditorOnSelectionChange004();
  RichEditorOnSelectionChange005();
  RichEditorOnSelectionChange006();
  RichEditorOnSelectionChange007();
  RichEditorOnSelectionChange008();
  RichEditorOnSelectionChange009();
  RichEditorOnSelectionChange011();
  RichEditorOnSelectionChange012();
  RichEditorOnSelectionChange013();
  RichEditorOnSelectionChange014();
  RichEditorOnSelectionChange015();
  RichEditorOnSelectionChange016();
  RichEditorOnSelectionChange017();
  RichEditorOnSelectionChange018();
  RichEditorOnSelectionChange019();
  RichEditorKeyBoard001();
  RichEditorKeyBoard002();
  RichEditorKeyBoard003();
  RichEditorKeyBoard004();
  RichEditorKeyBoard005();
  RichEditorKeyBoard006();
  RichEditorKeyBoard007();
  RichEditorKeyBoard008();
  RichEditorLineBreakStrategy001();
  RichEditorLineBreakStrategy002();
  RichEditorLineBreakStrategy003();
  RichEditorPreventDefault001();
  RichEditorPreventDefault002();
  RichEditorPreventDefault003();
  RichEditorPreventDefault004();
  RichEditorPreventDefault005();
  RichEditorPreventDefault006();
  RichEditorPreventDefault007();

  RichEditorGetNumber001();
  RichEditorGetNumber002();
  RichEditorGetNumber003();
  RichEditorGetNumber004();
  RichEditorGetNumber005();
  RichEditorGetNumber006();
  RichEditorGetNumber007();
  RichEditorGetNumber008();
  RichEditorGetNumber009();
  RichEditorGetNumber010();
  RichEditorGetNumber011();
  RichEditorGetNumber012();
  RichEditorGetNumber013();
  RichEditorGetNumber014();
  RichEditorGetNumber015();
  RichEditorGetNumber016();


  RichEditorStabillity001();
  RichEditorStabillity002();
  RichEditorStabillity003();
  RichEditorStabillity004();
  RichEditorStabillity005();
  RichEditorThreeStrikes001();
  RichEditorThreeStrikes002();
  RichEditorThreeStrikes003();
  RichEditorThreeStrikes004();
  RichEditorThreeStrikes005();
  RichEditorThreeStrikes006();
  RichEditorThreeStrikes007();
  RichEditorThreeStrikes008();
  RichEditorDoubleClick001();
  RichEditorDoubleClick002();
  RichEditorDoubleClick003();
  RichEditorDoubleClick004();
  RichEditorDoubleClick005();


  RichEditorDoubleClick006();
  RichEditorDoubleClick007();
  RichEditorDoubleClick008();
  RichEditorDoubleClick009();
  RichEditorDoubleClick010();
  RichEditorDoubleClick011();
  RichEditorDoubleClick012();
  RichEditorDoubleClick013();
  RichEditorDoubleClick014();
  RichEditorDoubleClick015();
  RichEditorDoubleClick016();
  RichEditorDoubleClick017();
  RichEditorDoubleClick018();
  RichEditorDoubleClick019();
  APIClipMaskShape();
  imageAddApi();
  imageAddApi2();
  imageAddApi3();
  dstIndexTest();
  srcIndexTest();
  RelativeContainerApi1();
  StyledStringApi1();
  StyledStringKeyTest1();
}
