/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import hiappevent from 'libentry.so'

export default function SetEventConfigMinidumpTest() {
  describe('ActsSetEventConfigMinidumpTest', () => {
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
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_0100
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_0100
     * @tc.desc   test OH_HiAppEvent_SetEventConfig & OH_APP_CRASH_PARAM_COLLECT_MINIDUMP set error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_0100',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        for (let i = 1; i < 13; i++){
          console.error(`====> SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_0100 i : ==  ${i}`);
          let result: number = hiappevent.OhHiappEventSetEventConfigMinidump(i);
          console.error(`====> SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_0100 i : ==  ${i}, i.result =  ${result}`);
          expect(result).assertEqual(2);
        }
        done();
      } catch (err) {
        console.error(`====> SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_0100 catch > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });


    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_0200
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_0200
     * @tc.desc   test OH_HiAppEvent_SetConfigItem & OH_APP_CRASH_PARAM_COLLECT_MINIDUMP set error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_0200',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        for (let i = 15; i < 17; i++){
          console.error(`====> SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_0200 i : ==  ${i}`);
          let result: number = hiappevent.OhHiappEventSetEventConfigMinidump(i);
          console.error(`====> SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_0200 i : ==  ${i}, i.result =  ${result}`);
          expect(result).assertEqual(-1);
        }
        done();
      } catch (err) {
        console.error(`====> SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_0200 catch > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });


    /**
     * @tc.name   SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_0300
     * @tc.number SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_0300
     * @tc.desc   test OH_HiAppEvent_SetEventConfig & OH_APP_CRASH_PARAM_COLLECT_MINIDUMP set success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_0300',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        for (let i = 13; i < 15; i++){
          console.error(`====> SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_0300 i : ==  ${i}`);
          let result: number = hiappevent.OhHiappEventSetEventConfigMinidump(i);
          console.error(`====> SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_0300 i : ==  ${i}, i.result =  ${result}`);
          expect(result).assertEqual(0);
        }
        for (let i = 17; i < 23; i++){
          console.error(`====> SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_0300 i : ==  ${i}`);
          let result: number = hiappevent.OhHiappEventSetEventConfigMinidump(i);
          console.error(`====> SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_0300 i : ==  ${i}, i.result =  ${result}`);
          expect(result).assertEqual(0);
        }
        done();
      } catch (err) {
        console.error(`====> SUB_DFX_DFT_OH_HIPPEVENT_SetEventConfig_0300 catch > error code: ${err.code}, error msg: ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });


  })
}