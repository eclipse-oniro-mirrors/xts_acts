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
import taskPoolAsyncRunnerExecute from "./TaskPoolAsyncRunnerExecute.test";
import TaskPoolAsyncRunnerErrorTest from "./TaskPoolAsyncRunnerErrorTest.test";
import taskPoolAsyncRunnerAbility from "./TaskPoolAsyncRunnerAbility.test";
import taskPoolAsyncRunnerAbility2 from "./TaskPoolAsyncRunnerAbility2.test";
import taskPoolAsyncRunnerAbility3 from "./TaskPoolAsyncRunnerAbility3.test";
import taskPoolAsyncRunnerErrorSuccessTest from "./TaskPoolAsyncRunnerErrorSuccessTest.test";
import taskPoolAsyncRunnerErrorSuccessTest2 from "./TaskPoolAsyncRunnerErrorSuccessTest2.test";


import taskPoolAsyncRunnerActTest from "./TaskPoolAsyncRunnerActTest.test";
import taskPoolAsyncRunnerMultipleTest from "./TaskPoolAsyncRunnerMultipleTest.test";
import taskPoolAsyncRunnerMultipleGCTest from "./TaskPoolAsyncRunnerMultipleGCTest.test";

import TaskPoolErrorCodeTest from './TaskpoolErrorCode.test';

import asyncRunnerTest from './AsyncRunner.test';



export default function testsuite() {
  taskPoolAsyncRunnerExecute();
  TaskPoolAsyncRunnerErrorTest();
  taskPoolAsyncRunnerAbility();
  taskPoolAsyncRunnerAbility2();
  taskPoolAsyncRunnerAbility3();
  taskPoolAsyncRunnerErrorSuccessTest();
  taskPoolAsyncRunnerErrorSuccessTest2();


  taskPoolAsyncRunnerActTest();
  taskPoolAsyncRunnerMultipleTest();
  taskPoolAsyncRunnerMultipleGCTest();
  
  TaskPoolErrorCodeTest();

  asyncRunnerTest();

}