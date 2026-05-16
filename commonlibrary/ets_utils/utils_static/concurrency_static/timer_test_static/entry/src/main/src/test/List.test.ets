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

import timerTest from "./Timer.test";
import functionsInTimerTest from "./TimerFunctionsTest.test";
import TimerClearIntervalTest from "./TimerClearIntervalTest.test";
import clearTimeoutTest from "./TimerClearTimeoutTest.test";
import TimerMemoryTest from "./TimerMemoryTest.test";
import timerMultiThreadTest from "./TimerMultiThreadTest.test";
import TimerSetIntervalTest from "./TimerSetIntervalTest.test";
import setTimeoutTest from "./TimerSetTimeoutTest.test";

export default function testsuite() {
  timerTest();
  functionsInTimerTest();         
  setTimeoutTest();
  clearTimeoutTest();
  TimerClearIntervalTest();
  TimerMemoryTest();          
  TimerSetIntervalTest();
  timerMultiThreadTest();
}
