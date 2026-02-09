/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import PromiseAllSecondTest from './PromiseAllSecondTest.test';
import PromiseRejectSecondTest from "./PromiseRejectSecondTest.test";
import PromiseRejectTest from "./PromiseRejectTest.test";
import PromiseAllSettledTest from "./PromiseAllSettledTest.test";
import PromiseAllTest from "./PromiseAllTest.test";
import PromiseRaceSecondTest from './PromiseRaceSecondTest.test';
import PromiseErrorTest from './PromiseErrorTest.test';

export default function testsuite() {

  PromiseAllSecondTest();
  PromiseRejectSecondTest();
  PromiseRejectTest();
  PromiseAllSettledTest();
  PromiseAllTest();
  PromiseRaceSecondTest();
  PromiseErrorTest();
}
