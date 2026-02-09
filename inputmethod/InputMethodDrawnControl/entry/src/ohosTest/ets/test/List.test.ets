/*
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
import inputMethodDrawnControl from './inputMethod_drawnControl.test'
import inputMethod_attach from './inputMethod_attach.test'
import inputMethod_showTextInput_hideTextInput_detach from './inputMethod_showTextInput_hideTextInput_detach.test'
import inputMethod_updateAttribute from './inputMethod_updateAttribute.test'
import inputMethod_changeSelection from './inputMethod_changeSelection.test'
import inputMethod_updateCursor from './inputMethod_updateCursor.test'
import inputMethod_setCallingWindow from './inputMethod_setCallingWindow.test'

export default function testsuite() {
  inputMethodDrawnControl();
  inputMethod_attach();
  inputMethod_showTextInput_hideTextInput_detach();
  inputMethod_updateAttribute();
  inputMethod_changeSelection();
  inputMethod_updateCursor();
  inputMethod_setCallingWindow();
}