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
     * @tc.name   testHappyPath
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_TASK_001
     * @tc.desc   checks most basic task pool use
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHappyPath', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: Object = await testHappyPath();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name   testTwoTasks
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_TASK_002
     * @tc.desc   checks task pool with two tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTwoTasks', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: Object = await testTwoTasks();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name   testManyTasks
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_TASK_003
     * @tc.desc   checks task pool with many tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testManyTasks', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result: Object = await testManyTasks();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name   testTwoTasksChained
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_TASK_004
     * @tc.desc   checks task pool with two tasks chained
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTwoTasksChained', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result: Object = await testTwoTasksChained();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name   testManyTasksChained
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_TASK_005
     * @tc.desc   checks task pool with many tasks chained
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testManyTasksChained', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result: Object = await testManyTasksChained();
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name   testRepeats
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_TASK_006
     * @tc.desc   checks repeated use of task pool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRepeats', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let result: Object = await testRepeats();
      expect(result).assertEqual("PASSED");
      done();
    })

  })
}
