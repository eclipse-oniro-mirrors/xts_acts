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
import customPropertyTest from "./customproperty/CustomPropertyTest.test"
import KeyEventGetTypeTest from './keyEvent/KeyEventGetTypeTest.test'
import KeyEventGetKeyCodeTest from './keyEvent/KeyEventGetKeyCodeTest.test'
import KeyEventGetGetDeviceIdTest from './keyEvent/KeyEventGetGetDeviceIdTest.test'
import KeyEventGetKeyIntensionCodeTest from './keyEvent/KeyEventGetKeyIntensionCodeTest.test'
import KeyEventGetKeySourceTest from './keyEvent/KeyEventGetKeySourceTest.test'
import KeyEventGetKeyTextTest from './keyEvent/KeyEventGetKeyTextTest.test'
import KeyEventGetPressedKeysTest from './keyEvent/KeyEventGetPressedKeysTest.test'
import KeyEventGetUnicodeTest from './keyEvent/KeyEventGetUnicodeTest.test'
import KeyEventSetConsumedTest from './keyEvent/KeyEventSetConsumedTest.test'
import KeyEventStopPropagationTest from './keyEvent/KeyEventStopPropagationTest.test'
import NativeXComponent_RegisterKeyEventCallbackWithResultTest from './keyEvent/NativeXComponent_RegisterKeyEventCallbackWithResultTest.test'
import tabStop from './tabStop/tabStop.test'
import ScrollSizeTest from './scrollSize/ScrollSizeTest.test'

export default function testsuite() {
  customPropertyTest()
  KeyEventGetKeyCodeTest()
  KeyEventGetTypeTest()
  KeyEventStopPropagationTest()
  KeyEventSetConsumedTest()
  KeyEventGetGetDeviceIdTest()
  KeyEventGetKeyIntensionCodeTest()
  KeyEventGetKeySourceTest()
  KeyEventGetKeyTextTest()
  KeyEventGetPressedKeysTest()
  KeyEventGetUnicodeTest()
  NativeXComponent_RegisterKeyEventCallbackWithResultTest()
  tabStop()
  ScrollSizeTest()
}
