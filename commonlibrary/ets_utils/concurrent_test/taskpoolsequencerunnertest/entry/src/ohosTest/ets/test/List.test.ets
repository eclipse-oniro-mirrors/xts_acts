/*
* Copyright (C) 2024 HiHope Open Source Organization.
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

import SequenceRunnerErrorSuccess2Test from './SequenceRunneErrorSuccess2Test.test';
import SequenceRunnerErrorSuccessTest from './SequenceRunneErrorSuccessTest.test';
import sequenceRunnerAbilityTest from './SequenceRunnerAbility.test';
import sequenceRunnerAbilityTest_2 from './SequenceRunnerAbilityTwo.test';
import sequenceRunnerTaskTest from './SequenceRunnertask.test';
import taskPoolSequenceRunnerActTest from './TaskPoolSequenceRunnerActTest.test';
import taskPoolSequenceRunnerMultipleTest from './TaskPoolSequenceRunnerMultipleTest.test';
import taskPoolSequenceRunnerMultipleUITest from './TaskPoolSequenceRunnerMultipleUITest.test';
import TaskPoolSequenceRunnerTest from './TaskPoolSequenceRunnerTest.test';
import taskPoolSequenceRunnerTwoMultipleTest from './TaskPoolSequenceRunnerTwoMultipleTest.test';

export default function testsuite() {
  taskPoolSequenceRunnerMultipleTest();
  taskPoolSequenceRunnerTwoMultipleTest();
  taskPoolSequenceRunnerMultipleUITest();
  taskPoolSequenceRunnerActTest();
  TaskPoolSequenceRunnerTest();
  SequenceRunnerErrorSuccess2Test();
  SequenceRunnerErrorSuccessTest();
  sequenceRunnerAbilityTest()
  sequenceRunnerAbilityTest_2();
  sequenceRunnerTaskTest();
}