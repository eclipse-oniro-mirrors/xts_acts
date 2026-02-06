/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import dateTest from './DateTest.test.ets';
import Date1Test from './date/Date1.test';
import Date2Test from './date/Date2.test';
import Date3Test from './date/Date3.test';
import Date4Test from './date/Date4.test';
import Date5Test from './date/Date5.test';
import Date6Test from './date/Date6.test';
import Date7Test from './date/Date7.test';

export default function testsuite() {
  dateTest();
  Date1Test();
  Date2Test();
  Date3Test();
  Date4Test();
  Date5Test();
  Date6Test();
  Date7Test();
}