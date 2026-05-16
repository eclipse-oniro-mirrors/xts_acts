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
export default function hidebugrawcleanTest() {
  describe('hidebugrawcleanTest', () => {
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
     * @tc.name   testHidebugrawclean_0100
     * @tc.number SUB_DFX_DFR_Hidebug_Ets_Clean_0100
     * @tc.desc   hidebug.dumpJsRawHeapData(false, true)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHidebugrawclean_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      try {
        console.info(`SUB_DFX_DFR_Hidebug_Ets_Clean_0100 TestTag success `)
        let path: string = '/data/storage/el2/base/files/' ;
        console.info("output path: " + path);
        let freeSize = await statfs.getFreeSize(path);
        if (freeSize > 30 * 1024 * 1024 * 1024) {
        console.info(`SUB_DFX_DFR_Hidebug_Ets_Clean_0100 TestTag success `)
          let filename = await hidebug.dumpJsRawHeapData(false,true)
          console.info(`SUB_DFX_DFR_Hidebug_Ets_Clean_0100 TestTag success and generated file path is ${filename}`)
          expect(filename.length > 0).assertTrue()
          done();
        }
        done();
      }catch (error) {
        console.error(`SUB_DFX_DFR_Hidebug_Ets_Clean_0100 TestTag error code: ${error.code}, error msg: ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })


    /**
     * @tc.name   testHidebugrawclean_0200
     * @tc.number SUB_DFX_DFR_Hidebug_Ets_Clean_0200
     * @tc.desc   hidebug.dumpJsRawHeapData(false, false)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHidebugrawclean_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      try {
        let path: string = '/data/storage/el2/base/files/' ;
        console.info("output path: " + path);
        let freeSize = await statfs.getFreeSize(path);
        if (freeSize > 30 * 1024 * 1024 * 1024) {
          let filename1 = await hidebug.dumpJsRawHeapData(false, false)
          console.info(`SUB_DFX_DFR_Hidebug_Ets_Clean_0200 TestTag success and generated file path1111 is ${filename1}`)
          expect(filename1).assertContain("hidebug-jsheap");
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
     * @tc.name   testHidebugrawclean_0300
     * @tc.number SUB_DFX_DFR_Hidebug_Ets_Clean_0300
     * @tc.desc   hidebug.dumpJsRawHeapData(true, true)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHidebugrawclean_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      try {
        let path: string = '/data/storage/el2/base/files/' ;
        console.info("output path: " + path);
        let freeSize = await statfs.getFreeSize(path);
        if (freeSize > 30 * 1024 * 1024 * 1024) {
          let filename = await hidebug.dumpJsRawHeapData(true, true)
          console.info(`SUB_DFX_DFR_Hidebug_Ets_Clean_0300 TestTag success and generated file path is ${filename}`)
          expect(filename).assertContain("hidebug-jsheap");
          done();
        }
        done();
      }catch (error) {
        console.error(`SUB_DFX_DFR_Hidebug_Ets_Clean_0300 TestTag error code: ${(error as BusinessError).code}, error msg: ${(error as BusinessError).message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testHidebugrawclean_0400
     * @tc.number SUB_DFX_DFR_Hidebug_Ets_Clean_0400
     * @tc.desc   hidebug.dumpJsRawHeapData(true, false)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHidebugrawclean_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      try {
        let path: string = '/data/storage/el2/base/files/' ;
        console.info("output path: " + path);
        let freeSize = await statfs.getFreeSize(path);
        if (freeSize > 30 * 1024 * 1024 * 1024) {
          let filename = await hidebug.dumpJsRawHeapData(false, false)
          console.info(`SUB_DFX_DFR_Hidebug_Ets_Clean_0400 TestTag success and generated file path is ${filename}`)
          expect(filename).assertContain("hidebug-jsheap");
          done();
        }
        done();
      }catch (error) {
        console.error(`SUB_DFX_DFR_Hidebug_Ets_Clean_0400 TestTag error code: ${(error as BusinessError).code}, error msg: ${(error as BusinessError).message}`);
        expect(false).assertTrue();
        done();
      }
    })


    /**
     * @tc.name   testHidebugrawclean_0500
     * @tc.number SUB_DFX_DFR_Hidebug_Ets_Clean_0500
     * @tc.desc   捕获11400112错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHidebugrawclean_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      try {
        let path: string = '/data/storage/el2/base/files/' ;
        console.info("output path: " + path);
        let freeSize = await statfs.getFreeSize(path);
        if (freeSize > 30 * 1024 * 1024 * 1024) {
          hidebug.dumpJsRawHeapData(true, true).then((filePath: string) => {
            console.info(`TestTag success and generated file path is ${filePath}`)
          })
          let filename = await hidebug.dumpJsRawHeapData(true, true)
          console.info(`SUB_DFX_DFR_Hidebug_Ets_Clean_0500 TestTag success and generated file path is ${filename}`)
          expect(false).assertTrue();
          done();
        }
        done();
      }catch (error) {
        console.error(`SUB_DFX_DFR_Hidebug_Ets_Clean_0500 TestTag error code: ${(error as BusinessError).code}, error msg: ${(error as BusinessError).message}`);
        expect((error as BusinessError).code==11400112).assertTrue();
        await asyncSleep(5000);
        done();
      }
    })

  })
}