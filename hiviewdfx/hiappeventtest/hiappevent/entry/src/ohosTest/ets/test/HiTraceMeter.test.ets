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
import hiTraceMeter from "@ohos.hiTraceMeter";


export default function HitraceMeterTest() {
  describe('HitraceMeterTest', () => {
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
     * @tc.name   testHitraceMeter_0001_start
     * @tc.number SUB_DFX_DFR_HitraceMeter_Ets_0001_start
     * @tc.desc   验证HitraceMeter.startTrace() & HitraceMeter.finishTrace(),参数依次输入参数输入' ' ;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testHitraceMeter_0001_start", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("testHitraceMeter_0001_start start");
      try{
        hiTraceMeter.startTrace("", null);
        console.info("====> testHitraceMeter_0001_start startTrace undefined end 01");
        done();
      }catch(err){
        console.error(`====>testHitraceMeter_0001_start finishTrace undefined catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(err.code === 401).assertTrue();
        done();
      }
      console.info("testHitraceMeter_0001_start end");
    })
    /**
     * @tc.name   testHitraceMeter_0001_finish
     * @tc.number SUB_DFX_DFR_HitraceMeter_Ets_0001_finish
     * @tc.desc   验证HitraceMeter.startTrace() & HitraceMeter.finishTrace(),参数依次输入参数输入' ';
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testHitraceMeter_0001_finish", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("testHitraceMeter_0001_finish start");
      try{
        hiTraceMeter.finishTrace("",null);
        console.info("====> testHitraceMeter_0001_finish finishTrace undefined end 01");
        done();
      }catch(err){
        console.error(`====>testHitraceMeter_0001_finish finishTrace undefined catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(err.code === 401).assertTrue();
        done();
      }
      console.info("testHitraceMeter_0001_finish end");
    })

    /**
     * @tc.name   testHitraceMeter_0001_start_null
     * @tc.number SUB_DFX_DFR_HitraceMeter_Ets_0001_start_null
     * @tc.desc   验证HitraceMeter.startTrace() & HitraceMeter.finishTrace(),参数依次输入参数输入undefined/null;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testHitraceMeter_0001_start_null", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("testHitraceMeter_0001_start_null start");
      try{
        hiTraceMeter.startTrace(null, null);
        console.info("====> testHitraceMeter_0001_start_null startTrace undefined end 01");
        done();
      }catch(err){
        console.error(`====>testHitraceMeter_0001_start_null finishTrace undefined catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(err.code === 401).assertTrue();
        done();
      }
      console.info("testHitraceMeter_0001_start_null end");
    })

    /**
     * @tc.name   testHitraceMeter_0001_finish_null
     * @tc.number SUB_DFX_DFR_HitraceMeter_Ets_0001_finish_null
     * @tc.desc   验证HitraceMeter.startTrace() & HitraceMeter.finishTrace(),参数依次输入参数输入undefined/null;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testHitraceMeter_0001_finish_null", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("testHitraceMeter_0001_finish_null start");
      try{
        hiTraceMeter.finishTrace(null,null);
        console.info("====> testHitraceMeter_0001_finish_null finishTrace undefined end 01");
        done();
      }catch(err){
        console.error(`====>testHitraceMeter_0001_finish_null finishTrace undefined catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(err.code === 401).assertTrue();
        done();
      }
      console.info("testHitraceMeter_0001_finish_null end");
    })

    /**
     * @tc.name   testHitraceMeter_0001_start_undefined
     * @tc.number SUB_DFX_DFR_HitraceMeter_Ets_0001_start_undefined
     * @tc.desc   验证HitraceMeter.startTrace() & HitraceMeter.finishTrace(),参数依次输入参数输入undefined;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testHitraceMeter_0001_start_undefined", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("testHitraceMeter_0001_start_undefined start");
      try{
        hiTraceMeter.startTrace(undefined, undefined);
        console.info("====> testHitraceMeter_0001_start_undefined startTrace undefined end 01");
        done();
      }catch(err){
        console.error(`====>testHitraceMeter_0001_start_undefined finishTrace undefined catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(err.code === 401).assertTrue();
        done();
      }
      console.info("testHitraceMeter_0001_start_undefined end");
    })
    /**
     * @tc.name   testHitraceMeter_0001_finish_undefined
     * @tc.number SUB_DFX_DFR_HitraceMeter_Ets_0001_finish_undefined
     * @tc.desc   验证HitraceMeter.startTrace() & HitraceMeter.finishTrace(),参数依次输入参数输入undefined;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testHitraceMeter_0001_finish_undefined", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("testHitraceMeter_0001_finish_undefined start");
      try{
        hiTraceMeter.finishTrace(undefined,undefined);
        console.info("====> testHitraceMeter_0001_finish_undefined startTrace undefined end 01");
        done();
      }catch(err){
        console.error(`====>testHitraceMeter_0001_finish_undefined finishTrace undefined catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(err.code === 401).assertTrue();
        done();
      }
      console.info("testHitraceMeter_0001_finish_undefined end");
    })
    /**
     * @tc.name   testHitraceMeter_0002
     * @tc.number SUB_DFX_DFR_HitraceMeter_Ets_0002
     * @tc.desc   验证HitraceMeter.startTrace(),参数依次输入参数输入”“;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testHitraceMeter_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("testHitraceMeter_0002 start");
      try{
        hiTraceMeter.traceByValue("", null);
        console.info("====> testHitraceMeter_0002 traceByValue undefined end 01");
        done();
      }catch(err){
        console.error(`====>testHitraceMeter_0002 traceByValue undefined catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(err.code === 401).assertTrue();
        done();
      }
      console.info("testHitraceMeter_0002 end");
    })
    /**
     * @tc.name   testHitraceMeter_0002_null
     * @tc.number SUB_DFX_DFR_HitraceMeter_Ets_0002_null
     * @tc.desc   验证HitraceMeter.startTrace(),参数依次输入参数输入null;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testHitraceMeter_0002_null", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("testHitraceMeter_0002_null start");
      try{
        hiTraceMeter.traceByValue(null, null);
        console.info("====> testHitraceMeter_0002_null traceByValue undefined end 01");
        done();
      }catch(err){
        console.error(`====>testHitraceMeter_0002_null traceByValue undefined catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(err.code === 401).assertTrue();
        done();
      }
      console.info("testHitraceMeter_0002_null end");
    })
    /**
     * @tc.name   testHitraceMeter_0002_undefined
     * @tc.number SUB_DFX_DFR_HitraceMeter_Ets_0002_undefined
     * @tc.desc   验证HitraceMeter.startTrace(),参数依次输入参数输入undefined;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testHitraceMeter_0002_undefined", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("testHitraceMeter_0002_undefined start");
      try{
        hiTraceMeter.traceByValue(undefined, undefined);
        console.info("====> testHitraceMeter_0002_undefined traceByValue undefined end 01");
        done();
      }catch(err){
        console.error(`====>testHitraceMeter_0002_undefined traceByValue undefined catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(err.code === 401).assertTrue();
        done();
      }
      console.info("testHitraceMeter_0002_undefined end");
    })
    /**
     * @tc.name   testHitraceMeter_0003
     * @tc.number SUB_DFX_DFR_HitraceMeter_Ets_0003
     * @tc.desc   验证HitraceMeter.startTrace()&HitraceMeter.finishAsyncTrace(),其余参数依次输入参数输入undefined/null，第一个参数分别输入枚举值['INFO', 'COMMERCIAL', 'MAX';
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testHitraceMeter_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      try{
        console.info("testHitraceMeter_0003 start");
        hiTraceMeter.startAsyncTrace(hiTraceMeter.HiTraceOutputLevel.COMMERCIAL, undefined, undefined, undefined,undefined);
        console.info("====> testHitraceMeter_0003 startAsyncTrace undefined end 01");
        hiTraceMeter.startAsyncTrace(hiTraceMeter.HiTraceOutputLevel.INFO, null, null, null,null);
        console.info("====> testHitraceMeter_0003 startAsyncTrace undefined end 02");
        hiTraceMeter.startAsyncTrace(hiTraceMeter.HiTraceOutputLevel.MAX, "", null, "", "");
        console.info("====> testHitraceMeter_0003 startAsyncTrace undefined end 03");

        hiTraceMeter.finishAsyncTrace(hiTraceMeter.HiTraceOutputLevel.COMMERCIAL, undefined, undefined);
        console.info("====> testHitraceMeter_0003 finishAsyncTrace undefined end 04");
        hiTraceMeter.finishAsyncTrace(hiTraceMeter.HiTraceOutputLevel.INFO,null,null);
        console.info("====> testHitraceMeter_0003 finishAsyncTrace undefined end 05");
        hiTraceMeter.finishAsyncTrace(hiTraceMeter.HiTraceOutputLevel.MAX, "",null);
        console.info("====> testHitraceMeter_0003 finishAsyncTrace undefined end 06");
        done();
      }catch(err){
        console.error(`====>testHitraceMeter_0003 finishAsyncTrace undefined catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(err.code === 401).assertTrue();
        done();
      }
      console.info("testHitraceMeter_0003 end");
    })

    /**
     * @tc.name   testHitraceMeter_0004
     * @tc.number SUB_DFX_DFR_HitraceMeter_Ets_0004
     * @tc.desc   验证HitraceMeter.startSyncTrace()&HitraceMeter.finishSyncTrace(),
     * 第2个参数缺少空值""//null/undefined覆盖;
     * 第3个参数缺少空值""//null/undefined覆盖;
     * 第1个参数未覆盖枚举:['DEBUG', 'CRITICAL']；
     * 第1个参数未覆盖枚举:['INFO', 'COMMERCIAL', 'MAX']；;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testHitraceMeter_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      try{
        console.info("testHitraceMeter_0004 start");
        hiTraceMeter.startSyncTrace(hiTraceMeter.HiTraceOutputLevel.COMMERCIAL, undefined, undefined);
        console.info("====> testHitraceMeter_0004 startSyncTrace undefined end 01");
        hiTraceMeter.startSyncTrace(hiTraceMeter.HiTraceOutputLevel.INFO, null, null);
        console.info("====> testHitraceMeter_0004 startSyncTrace undefined end 02");
        hiTraceMeter.startSyncTrace(hiTraceMeter.HiTraceOutputLevel.INFO, "", "");
        console.info("====> testHitraceMeter_0004 startSyncTrace undefined end 03");
        hiTraceMeter.finishSyncTrace(hiTraceMeter.HiTraceOutputLevel.COMMERCIAL);
        console.info("====> testHitraceMeter_0004 finishSyncTrace undefined end 04");
        hiTraceMeter.finishSyncTrace(hiTraceMeter.HiTraceOutputLevel.INFO);
        console.info("====> testHitraceMeter_0004 finishSyncTrace undefined end 05");
        hiTraceMeter.finishSyncTrace(hiTraceMeter.HiTraceOutputLevel.MAX);
        console.info("====> testHitraceMeter_0004 finishSyncTrace undefined end 06");
        done();
      }catch(err){
        console.error(`====>testHitraceMeter_0004 finishSyncTrace undefined catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(err.code === 401).assertTrue();
        done();
      }
      console.info("testHitraceMeter_0004 end");
    })
    /**
     * @tc.name   testHitraceMeter_0005
     * @tc.number SUB_DFX_DFR_HitraceMeter_Ets_0005
     * @tc.desc   验证HitraceMeter.traceByValue(hiTraceMeter.HiTraceOutputLevel.COMMERCIAL,undefined, undefined),
     * 第2、3参数依次输入参数输入undefined，第一个参数输入枚举值['INFO', 'CRITICAL', 'COMMERCIAL', 'MAX'];
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testHitraceMeter_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      try{
        console.info("testHitraceMeter_0005 start");
        hiTraceMeter.traceByValue(hiTraceMeter.HiTraceOutputLevel.COMMERCIAL,undefined, undefined);
        console.info("====> testHitraceMeter_0005 traceByValue undefined end 01");
        hiTraceMeter.traceByValue(hiTraceMeter.HiTraceOutputLevel.INFO, null, null);
        console.info("====> testHitraceMeter_0005 traceByValue undefined end 02");
        hiTraceMeter.traceByValue(hiTraceMeter.HiTraceOutputLevel.MAX,"", null);
        console.info("====> testHitraceMeter_0005 traceByValue undefined end 03");
        done();
      }catch(err){
        console.error(`====>testHitraceMeter_0005 traceByValue undefined catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(err.code === 401).assertTrue();
        done();
      }
      console.info("testHitraceMeter_0005 end");
    })

    /**
     * @tc.name   testHitraceMeter_0006
     * @tc.number SUB_DFX_DFR_HitraceMeter_Ets_0006
     * @tc.desc   验证HitraceMeter.startSyncTrace第一个参数输入枚举值['DEBUG', 'CRITICAL'];traceByValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testHitraceMeter_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      try{
        console.info("testHitraceMeter_0006 start");
        hiTraceMeter.startSyncTrace(hiTraceMeter.HiTraceOutputLevel.DEBUG, "myTestTRACE001", "1");
        console.info("====> testHitraceMeter_0006 traceByValue DEBUG end 01");
        hiTraceMeter.traceByValue(hiTraceMeter.HiTraceOutputLevel.DEBUG, "myTestTRACE001", 1);
        console.info("====> testHitraceMeter_0006 startSyncTrace CRITICAL start 02");
        hiTraceMeter.startSyncTrace(hiTraceMeter.HiTraceOutputLevel.CRITICAL, "myTestTRACE002", "2");
        console.info("====> testHitraceMeter_0006 traceByValue CRITICAL start 02");
        hiTraceMeter.traceByValue(hiTraceMeter.HiTraceOutputLevel.CRITICAL, "myTestTRACE001", 2);
        console.info("====> testHitraceMeter_0006 finishSyncTrace CRITICAL start 03");
        hiTraceMeter.finishSyncTrace(hiTraceMeter.HiTraceOutputLevel.CRITICAL);
        done();
      }catch(err){
        console.error(`====>testHitraceMeter_0006 traceByValue undefined catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(err.code === 401).assertTrue();
        done();
      }
      console.info("testHitraceMeter_0006 end");
    })
  })
}
