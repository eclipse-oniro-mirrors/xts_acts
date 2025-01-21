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

import textShdowTest from './component/textShadow.test'; 
import textTextOverflowTest from './component/textTextOverflow.test'; 
import textHeightAdaptivePolicyTest from './component/textHeightAdaptivePolicy.test';  
import textTextDecorationTest from './component/textTextDecoration.test'; 
import textDraggableTest from './component/textDraggable.test'; 
import textCopyOptionTest from './component/textCopyOption.test'; 
import textLineHeightTest from './component/textLineHeight.test'; 
import textLetterSpacingTest from './component/textLetterSpacing.test'; 
import textMaxLinesTest from './component/textMaxLines.test';
import textTextCaseTest from './component/textTextCase.test';
import textFontTest from './component/textFont.test';
import textBaseLineOffsetTest from './component/textBaseLineOffset.test';
import textFontFamilyTest from './component/textFontFamily.test';
import textMaxFontSizeTest from './component/textMaxFontSize.test';
import textMinFontSizeTest from './component/textMinFontSize.test';

export default function testsuite() {
  textShdowTest();
  textTextOverflowTest();
  textHeightAdaptivePolicyTest();
  textTextDecorationTest();
  textCopyOptionTest();
  textLineHeightTest();
  textLetterSpacingTest();
  textMaxLinesTest();
  textTextCaseTest();
  textFontTest();
  textBaseLineOffsetTest();
  textFontFamilyTest();
  textMaxFontSizeTest();
  textMinFontSizeTest();
}