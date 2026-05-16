/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
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
import dateTest from './Date/Date.test';
import Date1Test from './Date/Date1.test';
import Date2Test from './Date/Date2.test';
import Date3Test from './Date/Date3.test';
import Date4Test from './Date/Date4.test';
import Date5Test from './Date/Date5.test';
import Date6Test from './Date/Date6.test';
import Date7Test from './Date/Date7.test';
import DateTestCase001Test from './DateTestCase001.test';
import DateTestCase002Test from './DateTestCase002.test';
import DateTestCase003Test from './DateTestCase003.test';
import DateTestCase004Test from './DateTestCase004.test';
import DateTestCase005Test from './DateTestCase005.test';
import DateTestCase006Test from './DateTestCase006.test';
import DateTestCase007Test from './DateTestCase007.test';

export default function testsuite() {
  dateTest();
  Date1Test();
  Date2Test();
  Date3Test();
  Date4Test();
  Date5Test();
  Date6Test();
  Date7Test();

  DateTestCase001Test();
  DateTestCase002Test();
  DateTestCase003Test();
  DateTestCase004Test();
  DateTestCase005Test();
  DateTestCase006Test();
  DateTestCase007Test();
}