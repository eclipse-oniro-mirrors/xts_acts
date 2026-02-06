/*
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

import HuksApiTest from './nativehukstest/HuksApi.test'
import HuksApiTest3 from './nativehukstest/HuksApi3.test'
import HuksApiTest1 from './nativehukstest/HuksApi1.test'
import HuksApiTest4 from './nativehukstest/HuksApi4.test'
import HuksApiTest5 from './nativehukstest/HuksApi5.test'
import OHHuksStructTest from './ohhuksTest/OHHuksStructTest.test'

export default function testsuite() {
  HuksApiTest()
  HuksApiTest1()
  HuksApiTest3()
  HuksApiTest4()
  HuksApiTest5()
  OHHuksStructTest()
}
