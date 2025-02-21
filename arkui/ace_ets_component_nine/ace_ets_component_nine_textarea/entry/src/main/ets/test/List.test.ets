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



import textAreaBarState from './component/textAreaBarState.test';
import textAreaCaretColor from './component/textAreaCaretColor.test';
import textAreaCopyOption from './component/textAreaCopyOption.test';
// import textAreaEnableKeyboardOnFocus from './component/textAreaEnableKeyboardOnFocus.test';
import textAreaFontColor from './component/textAreaFontColor.test';
import textAreaFontFamily from './component/textAreaFontFamily.test';
import textAreaFontSize from './component/textAreaFontSize.test';
import textAreaFontStyle from './component/textAreaFontStyle.test';
import textAreaFontWeight from './component/textAreaFontWeight.test';
import textAreaMaxLength from './component/textAreaMaxLength.test';
import textAreaMaxLines from './component/textAreaMaxLines.test';
import textAreaPlaceholderColor from './component/textAreaPlaceholderColor.test';
import textAreaPlaceholderFont from './component/textAreaPlaceholderFont.test';
// import textAreaSelectionMenuHidden from './component/textAreaSelectionMenuHidden.test';
import textAreaShowCounter from './component/textAreaShowCounter.test';
import textAreaStyle from './component/textAreaStyle.test';
import textAreaTextAlign from './component/textAreaTextAlign.test';

export default function testsuite() {
  textAreaBarState();
  textAreaCaretColor();
  textAreaCopyOption();
  // textAreaEnableKeyboardOnFocus();
  textAreaFontColor();
  textAreaFontFamily();
  textAreaFontSize();
  textAreaFontStyle();
  textAreaFontWeight();
  textAreaMaxLength();
  textAreaMaxLines();
  textAreaPlaceholderColor();
  textAreaPlaceholderFont();
  // textAreaSelectionMenuHidden();
  textAreaShowCounter();
  textAreaStyle();
  textAreaTextAlign();
}