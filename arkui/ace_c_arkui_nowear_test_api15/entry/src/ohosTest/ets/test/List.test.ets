/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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

import setKeyProcessingMode01 from "./setKeyProcessingMode/setKeyProcessingMode01.test"
import setKeyProcessingMode02 from "./setKeyProcessingMode/setKeyProcessingMode02.test"
import scrollBackToTopTest from './scroll/ScrollBackToTopTest.test'
import keyDispatchTest from "./keydispatchTest/KeyDispatchTest.test"
import FocusControlTest3 from "./foucscontrolTest/FocusControlTest3.test"
import FocusControlTest4 from "./foucscontrolTest/FocusControlTest4.test"
import GetGestureParamTest from "./getGestureParam/getGestureParam.test"

export default function testsuite() {
   setKeyProcessingMode01();
   setKeyProcessingMode02();
   scrollBackToTopTest();
   keyDispatchTest();
   FocusControlTest3();
   FocusControlTest4();
   GetGestureParamTest();
}
