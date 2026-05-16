/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import touchTestInfoTest from './touchTestInfo/TouchTestInfoTest.test'
import TestErrorCodeTest from './touchTestInfo/ErrorCodeTest.test'
import NodeAdoptChildTest from './node/NodeAdoptChildTest.test'
import NodeAdoptedTest from './node/NodeAdoptedTest.test'
import focusScopeTest from './focusScope/FocusScopeTest.test'
import AccessibilityValueTest from "./accessibilityValue/AccessibilityValueTest.test"

export default function testsuite() {
  NodeAdoptChildTest(); // 此条特殊用例请放在首行，勿动
  NodeAdoptedTest();
  TestErrorCodeTest();
  touchTestInfoTest();
  focusScopeTest();
  AccessibilityValueTest();
}