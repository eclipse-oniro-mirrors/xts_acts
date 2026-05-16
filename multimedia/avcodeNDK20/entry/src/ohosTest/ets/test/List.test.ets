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

import AVCodeTest from "./AVCode/AVCodeTest.test";
import AVCodeTest2 from "./AVCode/AVCodeTest2.test";
import AVCodeTest3 from "./AVCode/AVCodeTest3.test";
import AVCodeBaseTest from "./AVCode/AVCodeBase.test";
import AVCodeBaseTwoTest from "./AVCode/AVCodeBaseTwo.test";
import AVCodeBaseThreeTest from "./AVCode/AVCodeBaseThree.test";

export default function testsuite() {
  AVCodeBaseThreeTest()
  AVCodeBaseTwoTest()
  AVCodeTest()
  AVCodeTest2()
  AVCodeTest3()
  AVCodeBaseTest()
}
