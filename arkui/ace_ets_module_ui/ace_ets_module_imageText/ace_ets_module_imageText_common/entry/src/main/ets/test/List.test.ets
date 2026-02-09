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

import APIgetUIFontConfigJsunit from './FontTest/APIgetUIFontConfigJsunit.test';
import FontJsunit from './FontTest/FontJsunit.test';
import StageFontTest from './FontTest/StageFontTest.test';
import UIFontAliasInfo from './FontTest/UIFontAliasInfo.test';
import UIfontTest from './FontTest/UIfontTest.test';

import ContextGetMeasureUtils from './MeasureTest/ContextGetMeasureUtils.test';
import GetLayoutTest from './MeasureTest/GetLayoutTest.test';
import MeasureJsunitTest from './MeasureTest/MeasureJsunitTest.test';
import MeasureOptionsTest from './MeasureTest/MeasureOptionsTest.test';
import TextCommonTextComputing1 from './MeasureTest/TextCommonTextComputing1.test';
import TextCommonTextComputing2 from './MeasureTest/TextCommonTextComputing2.test';
import TextCommonTextComputing3 from './MeasureTest/TextCommonTextComputing3.test';
import TextCommonTextComputing4 from './MeasureTest/TextCommonTextComputing4.test';
import TextCommonTextComputing5 from './MeasureTest/TextCommonTextComputing5.test';
import TextCommonTextComputing6 from './MeasureTest/TextCommonTextComputing6.test';
import TextCommonTextComputing7 from './MeasureTest/TextCommonTextComputing7.test';
import TextCommonTextComputing8 from './MeasureTest/TextCommonTextComputing8.test';
import TextCommonTextComputing9 from './MeasureTest/TextCommonTextComputing9.test';
import TextGetParagraphsTest from './MeasureTest/TextGetParagraphsTest.test';

import BindSelectionMenuTest from './BindSelectionMenuTest.test';
import KeyboardAvoidModeTest from './KeyboardAvoidMode.test';
import ResourceModifierTest from './ResourceModifier.test';
import ResourceNormalTest from './ResourceNormal.test';
import TextAddApi1 from './TextAddApi1.test';
import TextMenuItemIdEqualsTest from './TextMenuItemIdEqualsTest.test';
import TextMenuType from './TextMenuType.test';

import RichEditorDeleteTest from './RichEditorDeleteTest/RichEditorDelete.test';
import TextDirectionTest from './TextDirectionTest.test';
import ScrollToVisibleTest from './ScrollToVisibleTest.test';
import IncludeFontPaddingTest from './RichEditorDisplayOptimizationTest/IncludeFontPadding.test';
import FallbackLineSpacingTest from './RichEditorDisplayOptimizationTest/FallbackLineSpacing.test';
import TextTest from './TextTest/TextTest.test';
import TextInputTest from './TextTest/TextInputTest.test';
import TextAreaTest from './TextTest/TextAreaTest.test';
import SearchTest from './TextTest/SearchTest.test';
import SearchDeleteTest from './TextDeleteTest/SearchDelete.test';
import TextAreaDeleteTest from './TextDeleteTest/TextAreaDelete.test';
import TextInputDelete from './TextDeleteTest/TextInputDelete.test';
import TextControllerTest from './TextControllerTest/TextControllerTest.test';
import SelectedDragPreviewStyleTest from './SelectedDragPreviewStyleTest/SelectedDragPreviewStyleTest.test';
import SetTextSelectionTest from './SetTextSelectionTest/SetTextSelectionTest.test';

export default function testsuite() {
  TextControllerTest();
  InputPresetTest() 
  // FontTest 
  APIgetUIFontConfigJsunit() 
  FontJsunit() 
  StageFontTest() 
  UIFontAliasInfo() 
  UIfontTest() 
  // MeasureTest 
  ContextGetMeasureUtils() 
  GetLayoutTest() 
  MeasureJsunitTest() 
  MeasureOptionsTest() 
  TextCommonTextComputing1() 
  TextCommonTextComputing2() 
  TextCommonTextComputing3() 
  TextCommonTextComputing4() 
  TextCommonTextComputing5() 
  TextCommonTextComputing6() 
  TextCommonTextComputing7() 
  TextCommonTextComputing8() 
  TextCommonTextComputing9() 
  TextGetParagraphsTest()
  BindSelectionMenuTest()
  KeyboardAvoidModeTest()
  ResourceModifierTest()
  ResourceNormalTest()
  TextAddApi1()
  TextMenuItemIdEqualsTest()
  TextMenuType()
  RichEditorDeleteTest();
  TextDirectionTest();
  IncludeFontPaddingTest();
  FallbackLineSpacingTest();
  TextTest();
  TextInputTest();
  TextAreaTest();
  SearchTest();
  SearchDeleteTest();
  TextAreaDeleteTest();
  TextInputDelete();
  SelectedDragPreviewStyleTest();
  SetTextSelectionTest()
}