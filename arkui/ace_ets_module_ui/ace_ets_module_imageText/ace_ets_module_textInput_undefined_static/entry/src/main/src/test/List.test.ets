'use static';
/***
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

import TextInputOnWillInsert from './TextInputTest/TextInputOnWillInsert.test';
import TextInputMaxFontSize from './TextInputTest/TextInputMaxFontSize.test';
import TextInputCancelButton from './TextInputTest/TextInputCancelButton.test';
import TextInputCopyOption from './TextInputTest/TextInputCopyOption.test';
import TextInputEnterKeyType from './TextInputTest/TextInputEnterKeyType.test';
import TextInputPlaceholderColor from './TextInputTest/TextInputPlaceholderColor.test';
import TextInputPlaceholderFont from './TextInputTest/TextInputPlaceholderFont.test';
import TextInputStopBackPress from './TextInputTest/TextInputStopBackPress.test';
import TextInputShowUnit_ShowUnderline_WordBreak from './TextInputTest/TextInputShowUnit_ShowUnderline_WordBreak.test';
import TextInputOnEditChange from './TextInputTest/TextInputOnEditChange.test';
import TextInputCaretPositionTest from './TextInputTest/TextInputCaretPosition.test';
import TextInputCaretStyleTest from './TextInputTest/TextInputCaretStyle.test';
import TextInputLineHeightTest from './TextInputTest/TextInputLineHeight.test';
import TextInputMinFontSizeTest from './TextInputTest/TextInputMinFontSize.test';
import TextInputMaxLinesTest from './TextInputTest/TextInputMaxLines.test';
import TextInputShowPasswordTest from './TextInputTest/TextInputShowPassword.test';
import TextInputShowPasswordIconTest from './TextInputTest/TextInputShowPasswordIcon.test';
import TextInputMaxLengthTest from './TextInputTest/TextInputMaxLength.test';
import TextInputOnCopyTest from './TextInputTest/TextInputOnCopy.test';
import TextInputOnPasteTest from './TextInputTest/TextInputOnPaste.test';
import TextInputMinFontScaleTest from './TextInputTest/TextInputMinFontScale.test';
import TextInputMaxFontScaleTest from './TextInputTest/TextInputMaxFontScale.test';
import TextInputCaretPositionModifierTest from './TextInputTest/TextInputCaretPositionModifier.test';
import TextInputCaretStyleModifierTest from './TextInputTest/TextInputCaretStyleModifier.test';
import TextInputLineHeightModifierTest from './TextInputTest/TextInputLineHeightModifier.test';
import TextInputMaxFontScaleModifierTest from './TextInputTest/TextInputMaxFontScaleModifier.test';
import TextInputMinFontScaleModifierTest from './TextInputTest/TextInputMinFontScaleModifier.test';
import TextInputMaxLengthModifierTest from './TextInputTest/TextInputMaxLengthModifier.test';
import TextInputMaxLinesModifierTest from './TextInputTest/TextInputMaxLinesModifier.test';
import TextInputMinFontSizeModifierTest from './TextInputTest/TextInputMinFontSizeModifier.test';
import TextInputOnCopyModifierTest from './TextInputTest/TextInputOnCopyModifier.test';
import TextInputOnPasteModifierTest from './TextInputTest/TextInputOnPasteModifier.test';
import TextInputShowPasswordModifierTest from './TextInputTest/TextInputShowPasswordModifier.test';
import TextInputShowPasswordIconModifierTest from './TextInputTest/TextInputShowPasswordIconModifier.test';
import TextInputBarStateTest from './TextInputTest/TextInputBarState.test';
import TextInputBarStateModifierTest from './TextInputTest/TextInputBarStateModifier.test';
import TextInputEllipsisModeTest from './TextInputTest/TextInputEllipsisMode.test';
import TextInputEllipsisModeModifierTest from './TextInputTest/TextInputEllipsisModeModifier.test';
import TextInputHeightAdaptivePolicyTest from './TextInputTest/TextInputHeightAdaptivePolicy.test';
import TextInputHeightAdaptivePolicyModifierTest from './TextInputTest/TextInputHeightAdaptivePolicyModifier.test';
// import TextInputLineBreakStrategyTest from './TextInputTest/TextInputLineBreakStrategy.test'; // 未适配
import TextInputSelectAllTest from './TextInputTest/TextInputSelectAll.test';
import TextInputSelectAllModifierTest from './TextInputTest/TextInputSelectAllModifier.test';
import TextInputShowErrorTest from './TextInputTest/TextInputShowError.test';
import TextInputShowErrorModifierTest from './TextInputTest/TextInputShowErrorModifier.test';
import TextInputFontColor from './TextInputTest/TextInputFontColor.test';
import TextInputOnDidDelete from './TextInputTest/TextInputOnDidDelete.test';
import TextInputType from './TextInputTest/TextInputType.test';
import TextInputTextIndent from './TextInputTest/TextInputTextIndent.test';
import TextInputSelectedBackgroundColor from './TextInputTest/TextInputSelectedBackgroundColor.test';
import TextInputTextOverFlow from './TextInputTest/TextInputTextOverFlow.test';
import TextInputTextAlign from './TextInputTest/TextInputTextAlign.test';
import TextInputEnableHapticFeedback from './TextInputTest/TextInputEnableHapticFeedback.test';
import TextInputOnCut from './TextInputTest/TextInputOnCut.test';
import TextInputShowCounter from './TextInputTest/TextInputShowCounter.test';
import TextInputShowUnderline from './TextInputTest/TextInputShowUnderline.test';
import TextInputOnDidInsert from './TextInputTest/TextInputOnDidInsert.test';
import TextInputDecoration from './TextInputTest/TextInputDecoration.test';
import TextInputLetterSpacing from './TextInputTest/TextInputLetterSpacing.test';
import TextInputPasswordRules from './TextInputTest/TextInputPasswordRules.test';
import TextInputEditMenuOptions from './TextInputTest/TextInputEditMenuOptions.test';
import TextInputTypeModifier from './TextInputTest/TextInputTypeModifier.test';
import TextInputFontColorModifier from './TextInputTest/TextInputFontColorModifier.test';
import TextInputTextIndentModifier from './TextInputTest/TextInputTextIndentModifier.test';
import TextInputSelectedBackgroundColorModifier from './TextInputTest/TextInputSelectedBackgroundColorModifier.test';
import TextInputTextAlignModifier from './TextInputTest/TextInputTextAlignModifier.test';
import TextInputEnableHapticFeedbackModifier from './TextInputTest/TextInputEnableHapticFeedbackModifier.test';
import TextInputShowCounterModifier from './TextInputTest/TextInputShowCounterModifier.test';
import TextInputShowUnderlineModifier from './TextInputTest/TextInputShowUnderlineModifier.test';
import TextInputOnDidInsertModifier from './TextInputTest/TextInputOnDidInsertModifier.test';
import TextInputOnDidDeleteModifier from './TextInputTest/TextInputOnDidDeleteModifier.test';
import TextInputTextOverFlowModifier from './TextInputTest/TextInputTextOverFlowModifier.test';
import TextInputPasswordRulesModifier from './TextInputTest/TextInputPasswordRulesModifier.test';
import TextInputOnCutModifier from './TextInputTest/TextInputOnCutModifier.test';
import TextInputLetterSpacingModifier from './TextInputTest/TextInputLetterSpacingModifier.test';
import TextInputEditMenuOptionsModifier from './TextInputTest/TextInputEditMenuOptionsModifier.test';
import TextInputDecorationModifier from './TextInputTest/TextInputDecorationModifier.test';
import textInputContentType from './TextInputTest/TextInputContentType.test';
import textInputContentTypeModifier from './TextInputTest/TextInputContentTypeModifier.test';


export default function testsuite() {
  TextInputOnWillInsert();
  TextInputMaxFontSize();
  TextInputCancelButton();
  TextInputCopyOption();
  TextInputEnterKeyType();
  TextInputPlaceholderColor();
  TextInputPlaceholderFont();
  TextInputStopBackPress();
  TextInputShowUnit_ShowUnderline_WordBreak();
  TextInputOnEditChange();
  textInputContentType();
  textInputContentTypeModifier();
  TextInputCaretPositionTest();
  TextInputCaretStyleTest();
  TextInputLineHeightTest();
  TextInputMinFontSizeTest();
  TextInputMaxLinesTest();
  TextInputShowPasswordTest();
  TextInputShowPasswordIconTest();
  TextInputMaxLengthTest();
  TextInputOnCopyTest();
  TextInputOnPasteTest();
  TextInputMinFontScaleTest();
  TextInputMaxFontScaleTest();
  TextInputCaretPositionModifierTest();
  TextInputCaretStyleModifierTest();
  TextInputLineHeightModifierTest();
  TextInputMaxFontScaleModifierTest();
  TextInputMinFontScaleModifierTest();
  TextInputMaxLengthModifierTest();
  TextInputMaxLinesModifierTest();
  TextInputMinFontSizeModifierTest();
  TextInputOnCopyModifierTest();
  TextInputOnPasteModifierTest();
  TextInputShowPasswordModifierTest();
  TextInputShowPasswordIconModifierTest();
  TextInputBarStateTest();
  TextInputEllipsisModeTest();
  TextInputHeightAdaptivePolicyTest();
  // TextInputLineBreakStrategyTest(); //后端xts未对接
  TextInputSelectAllTest();
  TextInputShowErrorTest();
  TextInputFontColor();
  TextInputType();
  TextInputTextIndent();
  TextInputSelectedBackgroundColor();
  TextInputTextAlign();
  TextInputEnableHapticFeedback();
  TextInputOnCut();
  TextInputShowCounter();
  TextInputShowUnderline();
  TextInputOnDidInsert();
  TextInputOnDidDelete();
  TextInputDecoration();
  TextInputLetterSpacing();
  TextInputPasswordRules();
  TextInputEditMenuOptions();
  TextInputTextOverFlow();
  TextInputBarStateModifierTest();
  TextInputEllipsisModeModifierTest();
  TextInputHeightAdaptivePolicyModifierTest();
  TextInputSelectAllModifierTest();
  TextInputShowErrorModifierTest();
  TextInputTypeModifier();
  TextInputFontColorModifier();
  TextInputTextIndentModifier();
  TextInputSelectedBackgroundColorModifier();
  TextInputTextAlignModifier();
  TextInputEnableHapticFeedbackModifier();
  TextInputShowCounterModifier();
  TextInputShowUnderlineModifier();
  TextInputOnDidInsertModifier();
  TextInputOnDidDeleteModifier();
  TextInputTextOverFlowModifier();
  TextInputPasswordRulesModifier();
  TextInputOnCutModifier();
  TextInputLetterSpacingModifier();
  TextInputEditMenuOptionsModifier();
  TextInputDecorationModifier();
}