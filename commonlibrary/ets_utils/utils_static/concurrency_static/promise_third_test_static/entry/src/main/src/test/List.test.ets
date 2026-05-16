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

import promiseAllTest from './promise/promiseAllTest.test';
import promiseAnyTest from './promise/promiseAnyTest.test';
import promiseCombTest from './promise/promiseCombTest.test';
import promiseCatchTest from './promise/promiseCatchTest.test';
import promiseFinallyTest from './promise/promiseFinallyTest.test';
import promiseRejectTest from './promise/promiseRejectTest.test';
import promiseResolveTest from './promise/promiseResolveTest.test';
import promiseTest from './promise/promiseTest.test';
import promiseThenTest from './promise/promiseThenTest.test';
import promiseAllSettledTest from './promise/promiseAllSettledTest.test';

export default function testsuite() {
  promiseAllSettledTest();
  promiseAllTest();
  promiseAnyTest();
  promiseCatchTest();
  promiseCombTest();
  promiseFinallyTest();
  promiseRejectTest();
  promiseResolveTest();
  promiseTest();
  promiseThenTest();
}