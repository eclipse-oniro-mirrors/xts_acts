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

import onHoverStatusChange from './onHoverStatusChange/onHoverStatusChange.test'
import MouseEventWindowTest from "./MouseEvent/MouseEventWindow.test";
import hoverEffectNullAndUndefinedTest from './HoverEffect/hoverEffectNullAndUndefinedTest.test';
import setOnClickNullAndUndefinedTest from './UICommonEvent/SetOnClick/setOnClickNullAndUndefinedTest.test';
import setOnTouchNullAndUndefinedTest from './UICommonEvent/SetOnTouch/setOnTouchNullAndUndefinedTest.test';
import setOnAppearNullAndUndefinedTest from './UICommonEvent/SetOnAppear/setOnAppearNullAndUndefinedTest.test';
import setOnDisappearNullAndUndefinedTest from './UICommonEvent/SetOnDisappear/setOnDisappearNullAndUndefinedTest.test';
import setOnKeyEventNullAndUndefinedTest from './UICommonEvent/SetOnKeyEvent/setOnKeyEventNullAndUndefinedTest.test';
import setOnFocusNullAndUndefinedTest from './UICommonEvent/SetOnFocus/setOnFocusNullAndUndefinedTest.test';
import setOnBlurNullAndUndefinedTest from './UICommonEvent/SetOnBlur/setOnBlurNullAndUndefinedTest.test';
import setOnHoverNullAndUndefinedTest from './UICommonEvent/SetOnHover/setOnHoverNullAndUndefinedTest.test';
import setOnMouseNullAndUndefinedTest from './UICommonEvent/SetOnMouse/setOnMouseNullAndUndefinedTest.test';
import setOnSizeChangeNullAndUndefinedTest from './UICommonEvent/SetOnSizeChange/setOnSizeChangeNullAndUndefinedTest.test';
import setCustomCursornull from './setCustomCursor/setCustomCursor_null.test';
import setCustomCursorundefined from './setCustomCursor/setCustomCursor_undefined.test';
import shouldRecognizerParallelWith from './shouldRecognizerParallelWith/shouldRecognizerParallelWith.test';
import shouldRecognizerParallelWith_undefined from './shouldRecognizerParallelWith/shouldRecognizerParallelWith.test';


export default function testsuite() {
  onHoverStatusChange();
  MouseEventWindowTest();
  hoverEffectNullAndUndefinedTest();
  setOnClickNullAndUndefinedTest();
  setOnTouchNullAndUndefinedTest();
  setOnAppearNullAndUndefinedTest();
  setOnDisappearNullAndUndefinedTest();
  setOnKeyEventNullAndUndefinedTest();
  setOnFocusNullAndUndefinedTest();
  setOnBlurNullAndUndefinedTest();
  setOnHoverNullAndUndefinedTest();
  setOnMouseNullAndUndefinedTest();
  setOnSizeChangeNullAndUndefinedTest();
  setCustomCursornull();
  setCustomCursorundefined();
  shouldRecognizerParallelWith();
  shouldRecognizerParallelWith_undefined();
}