/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium'
import { testHappyPath, testTwoTasks, testManyTasks, testTwoTasksChained, testManyTasksChained, testRepeats } from './TaskPoolTest';
import { skipConditional } from './utils'

export default function TaskPoolTest() {
  let printLog = 'TaskPoolTest:';
  describe('TaskPoolTest', () => {

    afterAll(() => {
      console.info(printLog + 'total case over');
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_TASK_001
     * @tc.name: testHappyPath
     * @tc.desc: checks most basic task pool use
     * @tc.author: oleg-ignatenko
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testHappyPath', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: Object = await testHappyPath();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_TASK_002
     * @tc.name: testTwoTasks
     * @tc.desc: checks task pool with two tasks
     * @tc.author: oleg-ignatenko
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testTwoTasks', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: Object = await testTwoTasks();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_TASK_003
     * @tc.name: testManyTasks
     * @tc.desc: checks task pool with many tasks
     * @tc.author: oleg-ignatenko
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testManyTasks', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result: Object = await testManyTasks();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_TASK_004
     * @tc.name: testTwoTasksChained
     * @tc.desc: checks task pool with two tasks chained
     * @tc.author: oleg-ignatenko
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testTwoTasksChained', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result: Object = await testTwoTasksChained();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_TASK_005
     * @tc.name: testManyTasksChained
     * @tc.desc: checks task pool with many tasks chained
     * @tc.author: oleg-ignatenko
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testManyTasksChained', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result: Object = await testManyTasksChained();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.number: SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_TASK_006
     * @tc.name: testRepeats
     * @tc.desc: checks repeated use of task pool
     * @tc.author: oleg-ignatenko
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testRepeats', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result: Object = await testRepeats();
      expect(result).assertEqual("PASSED");
      done();
    })

  })
}
