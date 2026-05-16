'use static';
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

import SearchOnWillInsert from './SearchTest/SearchOnWillInsert.test';
import SearchMaxFontSize from './SearchTest/SearchMaxFontSize.test';
import SearchCancelButton from './SearchTest/SearchCancelButton.test';
import SearchCopyOption from './SearchTest/SearchCopyOption.test';
import SearchEnterKeyType from './SearchTest/SearchEnterKeyType.test';
import SearchPlaceholderColor from './SearchTest/SearchPlaceholderColor.test';
import SearchPlaceholderFont from './SearchTest/SearchPlaceholderFont.test';
import SearchStopBackPress from './SearchTest/SearchStopBackPress.test';
import SearchOnEditChange from './SearchTest/SearchOnEditChange.test';
import SearchCaretStyleTest from './SearchTest/SearchCaretStyle.test';
import SearchLineHeightTest from './SearchTest/SearchLineHeight.test';
import SearchMinFontSizeTest from './SearchTest/SearchMinFontSize.test';
import SearchMaxLengthTest from './SearchTest/SearchMaxLength.test';
import SearchOnCopyTest from './SearchTest/SearchOnCopy.test';
import SearchOnPasteTest from './SearchTest/SearchOnPaste.test';
import SearchMinFontScaleTest from './SearchTest/SearchMinFontScale.test';
import SearchMaxFontScaleTest from './SearchTest/SearchMaxFontScale.test';
import SearchCaretStyleModifierTest from './SearchTest/SearchCaretStyleModifier.test';
import SearchLineHeightModifierTest from './SearchTest/SearchLineHeightModifier.test';
import SearchMaxFontScaleModifierTest from './SearchTest/SearchMaxFontScaleModifier.test';
import SearchMinFontScaleModifierTest from './SearchTest/SearchMinFontScaleModifier.test';
import SearchMaxLengthModifierTest from './SearchTest/SearchMaxLengthModifier.test';
import SearchMinFontSizeModifierTest from './SearchTest/SearchMinFontSizeModifier.test';
import SearchOnCopyModifierTest from './SearchTest/SearchOnCopyModifier.test';
import SearchOnPasteModifierTest from './SearchTest/SearchOnPasteModifier.test';
import SearchDecorationTest from './SearchTest/SearchDecoration.test';
import SearchDecorationModifierTest from './SearchTest/SearchDecorationModifier.test';
import SearchEitMenuOptionsTest from './SearchTest/SearchEditMenuOptions.test';
import SearchEitMenuOptionsModifierTest from './SearchTest/SearchEditMenuOptionsModifier.test';
import SearchKeyboardAppearanceTest from './SearchTest/SearchKeyboardAppearance.test';
import SearchKeyboardAppearanceModifierTest from './SearchTest/SearchKeyboardAppearanceModifier.test';
import SearchLetterSpacingTest from './SearchTest/SearchLetterSpacing.test';
import SearchLetterSpacingModifierTest from './SearchTest/SearchLetterSpacingModifier.test';
import SearchOnTextSelectionChangeTest from './SearchTest/SearchOnTextSelectionChange.test';
import SearchOnTextSelectionChangeModifierTest from './SearchTest/SearchOnTextSelectionChangeModifier.test';
import SearchOnSubmitTest from './SearchTest/SearchOnSubmit.test';
import SearchOnSubmitModifierTest from './SearchTest/SearchOnSubmitModifier.test';
import SearchOnCutTest from './SearchTest/SearchOnCut.test';
import SearchSelectedBackgroundColor from './SearchTest/SearchSelectedBackgroundColor.test';
import SearchTextIndent from './SearchTest/SearchTextIndent.test';
import SearchOnDidInsert from './SearchTest/SearchOnDidInsert.test';
import SearchOnDidDelete from './SearchTest/SearchOnDidDelete.test';
import SearchFontColor from './SearchTest/SearchFontColor.test';
import SearchTextFont from './SearchTest/SearchTextFont.test';
import SearchTypeTest from './SearchTest/searchTypeTest.test';
import SearchTextAlignTest from './SearchTest/searchTextAlignTest.test';
import SearchFontColorModifier from './SearchTest/SearchFontColorModifier.test';
import SearchOnCutModifierTest from './SearchTest/SearchOnCutModifier.test';
import SearchOnDidInsertModifier from './SearchTest/SearchOnDidInsertModifier.test';
import SearchOnDidDeleteModifier from './SearchTest/SearchOnDidDeleteModifier.test';
import SearchTextIndentModifier from './SearchTest/SearchTextIndentModifier.test';
import SearchSelectedBackgroundColorModifier from './SearchTest/SearchSelectedBackgroundColorModifier.test';
import SearchTypeModifier from './SearchTest/SearchTypeModifier.test';
import SearchTextAlignModifierTest from './SearchTest/searchTextAlignModifierTest.test';
import SearchTextFontModifier from './SearchTest/SearchTextFontModifier.test';

import searchHalfLeading from './SearchTest/searchHalfLeading.test';
import searchHalfLeadingModifier from './SearchTest/searchHalfLeadingModifier.test';
import searchEnablePreviewText from './SearchTest/searchEnablePreviewText.test';
import searchEnablePreviewTextModifier from './SearchTest/searchEnablePreviewTextModifier.test';
import searchFontFeature from './SearchTest/searchFontFeature.test';
import searchFontFeatureModifier from './SearchTest/searchFontFeatureModifier.test';
import searchFontFeatureModifier from './SearchTest/searchFontFeatureModifier.test';
import searchOnWillChange from './SearchTest/searchOnWillChange.test';
import searchOnWillChangeModifier from './SearchTest/searchOnWillChangeModifier.test';
import searchOnWillDelete from './SearchTest/searchOnWillDelete.test';
import searchOnWillDeleteModifier from './SearchTest/searchOnWillDeleteModifier.test';
import searchOnChange from './SearchTest/searchOnChange.test';
import searchOnChangeModifier from './SearchTest/searchOnChangeModifier.test';
import searchInputFilter from './SearchTest/searchInputFilter.test';
import searchInputFilterModifier from './SearchTest/searchInputFilterModifier.test';
import searchIcon from './SearchTest/searchIcon.test';
import searchIconModifier from './SearchTest/searchIconModifier.test';
import searchButton from './SearchTest/searchButton.test';
import searchButtonModifier from './SearchTest/searchButtonModifier.test';
import searchOnContentScroll from './SearchTest/searchOnContentScroll.test';
import searchOnContentScrollModifier from './SearchTest/searchOnContentScrollModifier.test';
import searchEnableHapticFeedBack from './SearchTest/SearchEnableHapticFeedBack.test';
import searchEnableHapticFeedBackModifier from './SearchTest/SearchEnableHapticFeedBackModifier.test';

export default function testsuite() {
  SearchOnWillInsert();
  SearchMaxFontSize();
  SearchCancelButton();
  SearchCopyOption();
  // SearchEnterKeyType(); //后端xts未对接
  SearchPlaceholderColor();
  SearchPlaceholderFont();
  SearchStopBackPress();
  SearchOnEditChange();

  searchEnableHapticFeedBack();

  searchEnableHapticFeedBackModifier();

  searchHalfLeadingModifier();
  searchHalfLeading();
  searchEnablePreviewText();
  searchEnablePreviewTextModifier();
  // searchFontFeature(); //后端xts未对接
  // searchFontFeatureModifier(); //后端xts未对接
  searchOnWillChange();
  searchOnWillChangeModifier();
  searchOnWillDelete();
  searchOnWillDeleteModifier();
  searchOnContentScroll();
  searchOnContentScrollModifier();
  searchOnChange();
  searchOnChangeModifier();
  searchInputFilter();
  searchInputFilterModifier();
  searchIcon();
  searchIconModifier();
  searchButton();
  searchButtonModifier();

  SearchCaretStyleTest();
  SearchLineHeightTest();
  SearchMinFontSizeTest();
  SearchMaxLengthTest();
  SearchOnCopyTest();
  SearchOnPasteTest();
  SearchMinFontScaleTest();
  SearchMaxFontScaleTest();

  SearchCaretStyleModifierTest();
  SearchLineHeightModifierTest();
  SearchMaxFontScaleModifierTest();
  SearchMinFontScaleModifierTest();
  SearchMaxLengthModifierTest();
  SearchMinFontSizeModifierTest();
  SearchOnCopyModifierTest();
  SearchOnPasteModifierTest();

  SearchDecorationTest();
  SearchKeyboardAppearanceTest();
  SearchOnTextSelectionChangeTest();
  SearchOnSubmitTest();
  SearchEitMenuOptionsTest();
  SearchOnCutTest();
  SearchSelectedBackgroundColor();
  SearchTextIndent();
  SearchOnDidInsert();
  SearchOnDidDelete();
  SearchFontColor();
  SearchTextFont();
  SearchTypeTest();
  SearchTextAlignTest();

  SearchDecorationModifierTest();
  SearchEitMenuOptionsModifierTest();
  SearchKeyboardAppearanceModifierTest();
  SearchLetterSpacingModifierTest();
  SearchOnSubmitModifierTest();
  SearchOnTextSelectionChangeModifierTest();
  SearchFontColorModifier();
  SearchOnCutModifierTest();
  SearchOnDidInsertModifier();
  SearchOnDidDeleteModifier();
  SearchTextIndentModifier();
  SearchSelectedBackgroundColorModifier();
  SearchTypeModifier();
  SearchTextAlignModifierTest();
  SearchTextFontModifier();
}