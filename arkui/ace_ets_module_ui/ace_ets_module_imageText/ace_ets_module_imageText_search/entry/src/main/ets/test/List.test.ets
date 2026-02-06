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
import SearchJsunitInfTest from './SearchTest/SearchJsunitInfTest.test';
import SearchOnCutTest from './SearchTest/SearchOnCutTest.test';
import search from './SearchApi11Test/SearchTest.test';
import search_caret from './SearchApi11Test/search_caret.test';
import search_maxLength from './SearchApi11Test/search_maxLength.test';
import search_maxLength2 from './SearchApi11Test/search_maxLength2.test';
import search_top from './SearchApi11Test/search_top.test'
import search_bottom from './SearchApi11Test/search_bottom.test'
import searchTest from './SearchApi11Test/SearchJsunit1.test';
import SearchTypeApi11Test from "./SearchApi11Test/SearchTypeApi11.test";
import SearchModifierTest from "./SearchApi11Test/SearchModifier.test";
import SearchEvent from './SearchApi12Test/SearchEvent.test'
import SearchEvent2 from './SearchApi12Test/SearchEvent2.test'
import SearchApi1 from './SearchApi12Test/SearchApi1.test'
import searchMaxFontSize from "./SearchApi12Test/searchMaxFontSize.test";
import searchMinFontSize from "./SearchApi12Test/searchMinFontSize.test";
import searchDecoration from "./SearchApi12Test/searchDecoration.test";
import searchLetterSpacing from "./SearchApi12Test/searchLetterSpacing.test";
import searchLineHeight from "./SearchApi12Test/searchLineHeight.test";
import APISearchExample from "./SearchApi12Test/APISearchExample.test";
import MenuPolicy_HIDE_APITest from './SearchApi12Test/MenuPolicy_HIDE_APITest';
import MenuPolicy_SHOW_APITest from './SearchApi12Test/MenuPolicy_SHOW_APITest';
import SearchXtsJsunit from './SearchApi12Test/SearchXtsJsunit.test'
import SearchTypeApi12Test from "./SearchApi12Test/SearchTypeApi12.test";
import searchEnterKeyTypeTest from "./SearchApi12Test/SearchEnterKeyType.test";
import SearchFontFeatureTest from "./SearchApi12Test/SearchFontFeature.test";
import SearchKeyboardAppearanceTest from './SearchApi15Test/SearchKeyboardAppearance.test';
import searchButton from './SearchApi16Test/searchButton.test';
import SearchStopBackPressTest from './SearchApi16Test/SearchStopBackPress.test';
import searchFontScaleTest from './SearchApi16Test/searchFontScaleTest.test';
import searchHalfLeadingTest from './SearchApi16Test/searchHalfLeadingTest.test';
import SearchGetTextTest from './SearchApi18Test/SearchGetText.test';
import SearchTypeApi20Test from './SearchApi20Test/SearchTypeApi20.test';
import SearchEnableAutoSpacingTest from './SearchApi20Test/SearchEnableAutoSpacing.test';
import SearchAutoCapitalizationModeTest from './SearchApi20Test/SearchAutoCapitalizationMode.test';
import SearchAutoCapitalizationModeModifierTest from './SearchApi20Test/SearchAutoCapitalizationModeModifier.test';
import OnWillAttachIMETest from './SearchApi20Test/OnWillAttachIMETest.test';
import searchObserverTest from './SearchApi22Test/searchObserver.test';
import SearchEnableSelectedDataDetectorTest from './SearchApi22Test/SearchEnableSelectedDataDetector.test';
import SearchSetStyledPlaceholderTest from './SearchApi22Test/SearchSetStyledPlaceholder.test';
import SearchOnWillAttachIMETest from './SearchApi22Test/SearchOnWillAttachIME.test';
import SearchCompressLeadingPunctuation from './SearchTest/SearchCompressLeadingPunctuation.test';
import SearchCompressLeadingPunctuationModifier from './SearchTest/SearchCompressLeadingPunctuationModifier.test';
import SearchTextDirectionTest from './SearchApi23Test/SearchTextDirection.test';
import SearchEnableKeyboardOnFocusTest from './SearchTest/SearchEnableKeyboardOnFocus.test';
import SearchSelectionMenuHiddenTest from './SearchTest/SearchSelectionMenuHidden.test';


export default function testsuite() {
  InputPresetTest()
  SearchJsunitInfTest()
  SearchOnCutTest()
  search()              // Api11
  search_caret()
  search_maxLength()
  search_maxLength2()
  search_top()
  search_bottom()
  searchTest()
  SearchTypeApi11Test()
  SearchModifierTest()
  SearchEvent()         // Api12
  SearchEvent2()
  SearchApi1()
  searchMaxFontSize()
  searchMinFontSize()
  searchDecoration()
  searchLetterSpacing()
  searchLineHeight()
  APISearchExample()
  MenuPolicy_HIDE_APITest()
  MenuPolicy_SHOW_APITest()
  SearchXtsJsunit()
  SearchTypeApi12Test()
  SearchKeyboardAppearanceTest()  // Api15
  searchButton()                  // Api16
  SearchStopBackPressTest()
  searchFontScaleTest()
  searchHalfLeadingTest()
  SearchGetTextTest()             // Api18
  SearchTypeApi20Test()           // Api20
  SearchEnableAutoSpacingTest()
  SearchAutoCapitalizationModeTest()
  SearchAutoCapitalizationModeModifierTest()
  OnWillAttachIMETest()
  searchObserverTest()            // Api22
  SearchEnableSelectedDataDetectorTest()
  SearchSetStyledPlaceholderTest()
  SearchOnWillAttachIMETest()
  SearchCompressLeadingPunctuation()
  SearchCompressLeadingPunctuationModifier()
  SearchTextDirectionTest()      // Api23
  SearchEnableKeyboardOnFocusTest();
  SearchSelectionMenuHiddenTest();
}