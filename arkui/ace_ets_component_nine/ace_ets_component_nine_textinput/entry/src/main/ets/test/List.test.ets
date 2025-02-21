/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import textInputBarStateTest from './component/textInputBarState.test'; 
import textInputCaretColorTest from './component/textInputCaretColor.test';
import textInputCaretPositionTest from './component/textInputCaretPosition.test';
import textInputCaretStyleTest from './component/textInputCaretStyle.test';
import textInputCopyOptionTest from './component/textInputCopyOption.test'; 
import textInputEnterKeyTypeTest from './component/textInputEnterKeyType.test';
import textInputFontColorTest from './component/textInputFontColor.test';
import textInputFontFamilyTest from './component/textInputFontFamily.test'; 
import textInputFontSizeTest from './component/textInputFontSize.test';
import textInputFontStyleTest from './component/textInputFontStyle.test';
import textInputFontWeightTest from './component/textInputFontWeight.test';
import textInputMaxLengthTest from './component/textInputMaxLength.test';
import textInputMaxLinesTest from './component/textInputMaxLines.test'; 
import textInputPasswordIconTest from './component/textInputPasswordIcon.test';
import textInputPlaceholderColorTest from './component/textInputPlaceholderColor.test';
import textInputPlaceholderFontTest from './component/textInputPlaceholderFont.test'; 
import textInputShowUnderlineTest from './component/textInputShowUnderline.test';
import textInputSelectedBackgroundColorTest from './component/textInputSelectedBackgroundColor.test';
import textInputShowErrorTest from './component/textInputShowError.test';

import textInputShowPasswordIconTest from './component/textInputShowPasswordIcon.test';
import textInputStyleTest from './component/textInputStyle.test';
import textInputTextAlignTest from './component/textInputTextAlign.test';
import textInputTypeTest from './component/textInputType.test';
export default function testsuite() {
  textInputBarStateTest();  
  textInputCaretColorTest();
  textInputCaretPositionTest();
  textInputCaretStyleTest();
  textInputCopyOptionTest();
  textInputEnterKeyTypeTest();
  textInputFontColorTest();
  textInputFontFamilyTest(); 
  textInputFontSizeTest();
  textInputFontStyleTest();
  textInputFontWeightTest();   
  textInputMaxLengthTest();
  textInputMaxLinesTest();  
  textInputPasswordIconTest();
  textInputPlaceholderColorTest();
  textInputPlaceholderFontTest(); 
  textInputSelectedBackgroundColorTest() ;
  textInputShowErrorTest();
  textInputShowPasswordIconTest();
  textInputShowUnderlineTest();
  textInputStyleTest();
  textInputTextAlignTest(); 
  textInputTypeTest();
}