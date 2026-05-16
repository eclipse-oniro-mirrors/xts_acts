/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size} from '@ohos/hypium'
import { BusinessError } from '@kit.BasicServicesKit';
import { hidebug } from '@kit.PerformanceAnalysisKit';
import { fileIo as fs, statfs } from '@kit.CoreFileKit';
export function asyncSleep(time: number): Promise<Object> {
  return new Promise(resolve => setTimeout(resolve, time));
};
export default function hidebugheapcleanTest() {
  describe('hidebugheapcleanTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   testHidebugheapclean_0100
     * @tc.number SUB_DFX_DFR_Hidebug_Ets_Heap_Clean_0100
     * @tc.desc   hidebug.dumpJsHeapData("heapData",true);
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHidebugheapclean_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      try {
        let path: string = '/data/storage/el2/base/files/' ;
        console.info("output path: " + path);
        let freeSize = await statfs.getFreeSize(path);
        if (freeSize > 30 * 1024 * 1024 * 1024) {
          hidebug.dumpJsHeapData("heapData",true);
          done();
        }
        done();
      }catch (error) {
        console.error(`SUB_DFX_DFR_Hidebug_Ets_Clean_0100 TestTag error code: ${(error as BusinessError).code}, error msg: ${(error as BusinessError).message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testHidebugheapclean_0200
     * @tc.number SUB_DFX_DFR_Hidebug_Ets_Heap_Clean_0200
     * @tc.desc   hidebug.dumpJsHeapData("heapData",false);
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHidebugheapclean_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      try {
        let path: string = '/data/storage/el2/base/files/' ;
        console.info("output path: " + path);
        let freeSize = await statfs.getFreeSize(path);
        if (freeSize > 30 * 1024 * 1024 * 1024) {
          hidebug.dumpJsHeapData("heapData",false);
          done();
        }
        done();
      }catch (error) {
        console.error(`SUB_DFX_DFR_Hidebug_Ets_Clean_0200 TestTag error code: ${(error as BusinessError).code}, error msg: ${(error as BusinessError).message}`);
        expect(false).assertTrue();
        done();
      }
    })


    /**
     * @tc.name   testHidebugheapclean_0300
     * @tc.number SUB_DFX_DFR_Hidebug_Ets_Heap_Clean_0300
     * @tc.desc   hidebug.dumpJsHeapData("heapData",false)连续调用
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHidebugheapclean_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      try {
        let path: string = '/data/storage/el2/base/files/' ;
        console.info("output path: " + path);
        let freeSize = await statfs.getFreeSize(path);
        if (freeSize > 30 * 1024 * 1024 * 1024) {
          hidebug.dumpJsHeapData("heapData",true);
          hidebug.dumpJsHeapData("heapData",true);
          hidebug.dumpJsHeapData("heapData",false);
          hidebug.dumpJsHeapData("heapData",false);
          done();
        }
        done();
      }catch (error) {
        console.error(`SUB_DFX_DFR_Hidebug_Ets_Clean_0300 TestTag error code: ${(error as BusinessError).code}, error msg: ${(error as BusinessError).message}`);
        expect(false).assertTrue();
        done();
      }
    })



  })
}