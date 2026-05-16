/**
 * Copyright (c) 2023-2024 Huawei Device Co., Ltd.
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

import saveComponentTest from './SaveComponentTest.test';
import saveComponentTest_1 from './SaveComponentTest_1.test';
import saveComponentTest_2 from './SaveComponentTest_2.test';
import saveComponentUserCancelTest from './SaveComponentUserCancelTest.test';

export default function testsuite() {
  saveComponentUserCancelTest();
  saveComponentTest();
  saveComponentTest_1();
  saveComponentTest_2();
}