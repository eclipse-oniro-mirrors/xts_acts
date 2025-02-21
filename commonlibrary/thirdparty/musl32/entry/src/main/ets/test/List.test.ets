/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import aeabiNdkTest from './AeabiNdk.test';
import fnmatch1NdkTest from './FnMatch1Ndk.test';
import fnmatchNdkTest from './FnMatchNdk.test';
import fnmatchNdk1Test from './FnMatchNdk1.test';
import otherstestNdkTest from './OthersTestNdk.test';
import signalNdk1Test from './SignalNdk1.test';
import timeNdk1Test from './TimeNdk1.test';
import timexNdk1Test from './TimexNdk1.test';
import locale1NdkTest from './Locale1Ndk.test';
export default function testsuite() {
  aeabiNdkTest();
  fnmatch1NdkTest();
  fnmatchNdkTest();
  fnmatchNdk1Test();
  otherstestNdkTest();
  signalNdk1Test();
  timeNdk1Test();
  timexNdk1Test();
  locale1NdkTest();
}
