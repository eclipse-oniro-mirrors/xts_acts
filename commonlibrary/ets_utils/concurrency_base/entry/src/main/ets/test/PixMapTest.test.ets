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

import { testPixMapWriteTask, testPixMapWriteTaskGroup, testPixMapWriteSingleTaskGroup } from './PixMapTest';
import { skipConditional } from './utils';

export default function PixMapTest() {
  let printLog = 'PixMapTest:';
  describe('PixMapTest', () => {

    afterAll(() => {
      console.info(printLog + 'total case over');
    })

    /**
     * @tc.name   testPixMapWriteTask
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_PIXMAP_001
     * @tc.desc   checks writing to PixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPixMapWriteTask', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: Object = await skipConditional("testPixMapWriteTask in progress", true, testPixMapWriteTask);
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name   testPixMapWriteTaskGroup
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_PIXMAP_002
     * @tc.desc   checks writing to PixelMap in several taskpool group tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPixMapWriteTaskGroup', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: Object = await skipConditional(
        "testPixMapWriteTaskGroup in progress", true, testPixMapWriteTaskGroup);
      expect(result).assertEqual("PASSED");
      done();
    })

    /**
     * @tc.name   testPixMapWriteSingleTaskGroup
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCYBASE_PIXMAP_003
     * @tc.desc   checks writing to PixelMap in single taskpool group task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testPixMapWriteSingleTaskGroup', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let result: Object = await skipConditional(
        "testPixMapWriteSingleTaskGroup in progress", true, testPixMapWriteSingleTaskGroup);
      expect(result).assertEqual("PASSED");
      done();
    })
  })
}
