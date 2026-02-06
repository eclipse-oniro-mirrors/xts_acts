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
import taskPoolTaskGroupExecuteTest from './TaskPoolTaskGroupExecute.test';
import taskPoolErrorSuccessTest from './TaskPoolErrorSuccessTest.test';
import taskPoolErrorSuccess2Test from './TaskPoolErrorSuccess2Test.test';
import taskPoolTaskMultipleTest from './TaskPoolTaskMultipleTest.test';
import taskPoolTaskMultipleUITest from './TaskPoolTaskMultipleUITest.test';
import taskPoolTaskGroupMultipleTest from './TaskPoolTaskGroupMultipleTest.test';
import taskPoolTaskGroup from './TaskPoolTaskGroupTask.test';
import taskPoolTaskGroupActTest from './TaskPoolTaskGroupActTest.test';
import TaskGroupAbilityTest from './TaskGroupAbility.test';
import TaskGroupAbilityTest2 from './TaskGroupAbility2.test';
import TaskGroupAbilityTest3 from './TaskGroupAbility3.test';

export default function testsuite() {
  taskPoolTaskMultipleTest();
  taskPoolTaskGroup();
  taskPoolTaskGroupExecuteTest();
  taskPoolErrorSuccessTest();
  taskPoolErrorSuccess2Test();
  taskPoolTaskMultipleUITest();
  taskPoolTaskGroupMultipleTest();
  taskPoolTaskGroupActTest();
  TaskGroupAbilityTest3();
  TaskGroupAbilityTest();
  TaskGroupAbilityTest2();

}