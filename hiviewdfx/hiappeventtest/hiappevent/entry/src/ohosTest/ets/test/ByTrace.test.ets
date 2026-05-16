/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from "@ohos/hypium"
import { errorManager } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import bytrace from "@ohos.bytrace";


export default function BytraceTest() {
  describe('BytraceTest', () => {
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
     * @tc.name   testbytrace_0001
     * @tc.number SUB_DFX_DFR_Bytrace_Ets_0001
     * @tc.desc   验证abytrace.startTrace(),第1个参数空值""覆盖;第2个参数缺少null覆盖;第3个参数缺少undefined覆盖;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testbytrace_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("testbytrace_0001 start");
      try{
        bytrace.startTrace("", null, undefined);
        console.info("====> testbytrace_0001 startTrace undefined end 01");
        done();
      }catch(err){
        console.error(`====>testbytrace_0001 startTrace undefined catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(err.code === 401).assertTrue();
        done();
      }
      console.info("testbytrace_0001 end");
    })
    /**
     * @tc.name   testbytrace_0001_null
     * @tc.number SUB_DFX_DFR_Bytrace_Ets_0001_null
     * @tc.desc   验证abytrace.startTrace(),第1个参数null覆盖;第2个参数undefined覆盖;第3个参数缺少null覆盖;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testbytrace_0001_null", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("testbytrace_0001_null start");
      try{
        bytrace.startTrace(null, undefined, null);
        console.info("====> testbytrace_0001_null startTrace undefined end 01");
        done();
      }catch(err){
        console.error(`====>testbytrace_0001_null startTrace undefined catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(err.code === 401).assertTrue();
        done();
      }
      console.info("testbytrace_0001_null end");
    })
    /**
     * @tc.name   testbytrace_0001_undefined
     * @tc.number SUB_DFX_DFR_Bytrace_Ets_0001_undefined
     * @tc.desc   验证abytrace.startTrace(),第1个参数undefined覆盖;第2个参数undefined覆盖;第3个参数undefined覆盖;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testbytrace_0001_undefined", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("testbytrace_0001_undefined start");
      try{
        bytrace.startTrace(undefined, undefined, undefined);
        console.info("====> testbytrace_0001_undefined startTrace undefined end 01");
        done();
      }catch(err){
        console.error(`====>testbytrace_0001_undefined startTrace undefined catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(err.code === 401).assertTrue();
        done();
      }
      console.info("testbytrace_0001_undefined end");
    })


    /**
     * @tc.name   testbytrace_0002
     * @tc.number SUB_DFX_DFR_Bytrace_Ets_0002
     * @tc.desc   验证abytrace.finishTrace(),第1个参数缺少空值""覆盖;第2个参数缺少undefined覆盖;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testbytrace_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("testbytrace_0002 start");
      try{
        bytrace.finishTrace("", undefined);
        console.info("====> testbytrace_0002 finishTrace undefined end 01");
        done();
      }catch(err){
        console.error(`====>testbytrace_0002 finishTrace undefined catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(err.code === 401).assertTrue();
        done();
      }
      console.info("testbytrace_0002 end");
    })
    /**
     * @tc.name   testbytrace_0002_null
     * @tc.number SUB_DFX_DFR_Bytrace_Ets_0002_null
     * @tc.desc   验证abytrace.finishTrace(),第1个参数缺少null覆盖;第2个参数缺少null覆盖;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testbytrace_0002_null", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("testbytrace_0002_null start");
      try{
        bytrace.finishTrace(null, null);
        console.info("====> testbytrace_0002_null finishTrace undefined end 01");
        done();
      }catch(err){
        console.error(`====>testbytrace_0002_null finishTrace undefined catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(err.code === 401).assertTrue();
        done();
      }
      console.info("testbytrace_0002_null end");
    })
    /**
     * @tc.name   testbytrace_0002_undefined
     * @tc.number SUB_DFX_DFR_Bytrace_Ets_0002_undefined
     * @tc.desc   验证abytrace.finishTrace(),第1个参数缺少undefined覆盖;第2个参数缺少undefined覆盖;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testbytrace_0002_undefined", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("testbytrace_0002_undefined start");
      try{
        bytrace.finishTrace(undefined, undefined);
        console.info("====> testbytrace_0002_undefined finishTrace undefined end 01");
        done();
      }catch(err){
        console.error(`====>testbytrace_0002_undefined finishTrace undefined catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(err.code === 401).assertTrue();
        done();
      }
      console.info("testbytrace_0002_undefined end");
    })

    /**
     * @tc.name   testbytrace_0003
     * @tc.number SUB_DFX_DFR_Bytrace_Ets_0003
     * @tc.desc   验证abytrace.traceByValue(),第1个参数缺少空值""覆盖;第2个参数缺少null;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testbytrace_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("testbytrace_0003 start");
      try{
        bytrace.traceByValue("", null);
        console.info("====> testbytrace_0003 traceByValue  undefined end 01");
        done();
      }catch(err){
        console.error(`====>testbytrace_0003 traceByValue  undefined catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(err.code === 401).assertTrue();
        done();
      }
      console.info("testbytrace_0003 end");
    })
    /**
     * @tc.name   testbytrace_0003_null
     * @tc.number SUB_DFX_DFR_Bytrace_Ets_0003_null
     * @tc.desc   验证abytrace.traceByValue(),第1个参数缺少null覆盖;第2个参数缺少null覆盖;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testbytrace_0003_null", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("testbytrace_0003_null start");
      try{
        bytrace.traceByValue(null, null);
        console.info("====> testbytrace_0003_null traceByValue  undefined end 01");
        done();
      }catch(err){
        console.error(`====>testbytrace_0003_null traceByValue  undefined catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(err.code === 401).assertTrue();
        done();
      }
      console.info("testbytrace_0003_null end");
    })
    /**
     * @tc.name   testbytrace_0003_undefined
     * @tc.number SUB_DFX_DFR_Bytrace_Ets_0003_undefined
     * @tc.desc   验证abytrace.traceByValue(),第1个参数缺少undefined覆盖;第2个参数缺少undefined覆盖;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testbytrace_0003_undefined", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("testbytrace_0003_undefined start");
      try{
        bytrace.traceByValue(undefined, undefined);
        console.info("====> testbytrace_0003_undefined traceByValue  undefined end 01");
        done();
      }catch(err){
        console.error(`====>testbytrace_0003_undefined traceByValue  undefined catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(err.code === 401).assertTrue();
        done();
      }
      console.info("testbytrace_0003_undefined end");
    })
  })
}
