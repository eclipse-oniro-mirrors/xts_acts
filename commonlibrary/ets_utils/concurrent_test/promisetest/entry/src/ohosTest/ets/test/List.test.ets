/*
 * Copyright (C) 2025 HiHope Open Source Organization.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import PromiseAnyTest from './PromiseAnyTest.test';
import PromiseAnySecondTest from './PromiseAnySecondTest.test';
import PromiseRaceTest from './PromiseRaceTest.test';
import PromiseSecondRaceTest from './PromiseRaceSecondTest.test';
import PromiseRaceStressTest from './PromiseRaceStressTest.test';
import PromiseAnyPortTest from './PromiseAnyPortTest.test';
import PromiseAsyncOperationTest from './PromiseAsyncOperationTest.test';
import PromiseMultiAsyncOperationTest from './PromiseMultiAsyncOperationTest.test';
import PromiseErrorTest from './PromiseErrorTest.test';
import PromiseTimeOutTest from './PromiseTimeOutTest.test';
import PromiseTest from './PromiseTest.test';
import PromiseSecondTest from './PromiseSecondTest.test';
import PromiseResolveTest from './PromiseResolveTest.test';
import PromiseResolveSecondTest from './PromiseResolveSecondTest.test';
import PromiseRejectTest from './PromiseRejectTest.test';
import PromiseRejectSecondTest from './PromiseRejectSecondTest.test';
import PromiseAllTest from './PromiseAllTest.test';
import PromiseAllSecondTest from './PromiseAllSecondTest.test';
import PromiseAllSettledTest from './PromiseAllSettledTest.test';
import PromiseAllSettledSecondTest from './PromiseAllSettledSecondTest.test';

export default function testsuite() {
  PromiseAnyTest();
  PromiseAnySecondTest();
  PromiseRaceTest();
  PromiseSecondRaceTest();
  PromiseRaceStressTest();
  PromiseAnyPortTest();
  PromiseAsyncOperationTest();
  PromiseMultiAsyncOperationTest();
  PromiseErrorTest();
  PromiseTimeOutTest();
  PromiseTest();
  PromiseSecondTest();
  PromiseResolveTest();
  PromiseResolveSecondTest();
  PromiseRejectTest();
  PromiseRejectSecondTest();
  PromiseAllTest();
  PromiseAllSecondTest();
  PromiseAllSettledTest();
  PromiseAllSettledSecondTest();
}