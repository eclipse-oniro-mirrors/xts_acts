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

import ShortcutKeyTABTest from './keyboardShortcutTest/ShortcutKeyTABTest.test';
import ShortcutKeyDPADUPTest from './keyboardShortcutTest/ShortcutKeyDPADUPTest.test';
import ShortcutKeyDPADDOWNTest from './keyboardShortcutTest/ShortcutKeyDPADDOWNTest.test';
import ShortcutKeyDPADLEFTTest from './keyboardShortcutTest/ShortcutKeyDPADLEFTTest.test';
import ShortcutKeyDPADRIGHTTest from './keyboardShortcutTest/ShortcutKeyDPADRIGHTTest.test';
import getModifierKeyStateTest from "./onKeyEventTest/getModifierKeyState.test";
import getModifierKeyState2Test from "./onKeyEventTest/getModifierKeyState2.test";
import getModifierKeyState3Test from "./onKeyEventTest/getModifierKeyState3.test";
import unicodeTest from './onKeyEventTest/unicode.test';
import keyEventDispatchTest from './keyEventDispatchTest/keyEventDispatchone.test';
import keyEventDispatchTest2 from './keyEventDispatchTest/keyEventDispatchtwo.test';
import keyEventDispatchTest3 from './keyEventDispatchTest/keyEventDispatchthree.test';
import keyEventDispatchTest4 from './keyEventDispatchTest/keyEventDispatchfour.test';
import keyEventDispatchTest5 from './keyEventDispatchTest/keyEventDispatchfive.test';
import keyEventDispatchTest6 from './keyEventDispatchTest/keyEventDispatchsix.test';
import onKeyEventDispatchTest from './keyEventDispatchTest/onKeyEventDispatchone.test';
import onKeyEventDispatchTest3 from './keyEventDispatchTest/onkeyEventDispatchthree.test';
import onkeyEventDispatchTest4 from './keyEventDispatchTest/onkeyEventDispatchfour.test';
import onkeyEventDispatchTest6 from './keyEventDispatchTest/onkeyEventDispatchsix.test';
import onkeyEventDispatchTest7 from './keyEventDispatchTest/onkeyEventDispatchseven.test';
import onkeyEventDispatchTest8 from './keyEventDispatchTest/onkeyEventDispatcheight.test';

export default function testsuite() {
  ShortcutKeyTABTest();
  ShortcutKeyDPADUPTest();
  ShortcutKeyDPADDOWNTest();
  ShortcutKeyDPADLEFTTest();
  ShortcutKeyDPADRIGHTTest();
  getModifierKeyState2Test();
  getModifierKeyState3Test();
  getModifierKeyStateTest();
  unicodeTest();
  keyEventDispatchTest();
  keyEventDispatchTest2();
  keyEventDispatchTest3();
  keyEventDispatchTest4();
  keyEventDispatchTest5();
  keyEventDispatchTest6();
  onKeyEventDispatchTest();
  onKeyEventDispatchTest3();
  onkeyEventDispatchTest4();
  onkeyEventDispatchTest6();
  onkeyEventDispatchTest7();
  onkeyEventDispatchTest8();
}