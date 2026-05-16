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
import hiTraceChain from "@ohos.hiTraceChain";
import hilog from '@ohos.hilog'



export default function hiTraceChainTest() {
  describe('hiTraceChainTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      hiTraceChain.clearId();
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
     * @tc.name   testhiTraceChain_0001
     * @tc.number SUB_DFX_DFR_hiTraceChain_Ets_0001
     * @tc.desc   验证hiTraceChain.begin()&验证hiTraceChain.end,第2个参数输入null/undefined覆盖，返回值属性覆盖;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testhiTraceChain_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      let traceId1 = hiTraceChain.begin("business", hiTraceChain.HiTraceFlag.INCLUDE_ASYNC | hiTraceChain.HiTraceFlag.DONOT_CREATE_SPAN);
      console.info("testhiTraceChain_0001 start");
      try{
        let traceId = hiTraceChain.begin("business", undefined);
        console.info("====> testhiTraceChain_0001 hiTraceChain undefined end 01");
        hiTraceChain.end(undefined);
        console.info("====> testhiTraceChain_0001 hiTraceChain undefined end 02");
        let traceId2 = hiTraceChain.begin("business", null);
        console.info("====> testhiTraceChain_0001 hiTraceChain undefined end 03");
        hiTraceChain.end(null);
        console.info("====> testhiTraceChain_0001 hiTraceChain undefined end 04");
        expect(traceId.chainId != traceId1.chainId).assertEqual(true);
        expect(traceId.spanId == 0).assertEqual(true);
        expect(traceId.parentSpanId == 0).assertEqual(true);
        expect(traceId.flags == 0).assertEqual(true);
        expect(traceId2.chainId != traceId1.chainId).assertEqual(true);
        expect(traceId2.spanId == 0).assertEqual(true);
        expect(traceId2.parentSpanId == 0).assertEqual(true);
        expect(traceId2.flags == 0).assertEqual(true);
        hiTraceChain.end(traceId1);
        hiTraceChain.end(traceId2);
        hiTraceChain.end(traceId);
        done();
      }catch(err){
        console.error(`====>testhiTraceChain_0001 hiTraceChain undefined catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(err.code === 401).assertTrue();
        done();
      }
      console.info("testhiTraceChain_0001 end");
    })
    /**
     * @tc.name   testhiTraceChain_0002
     * @tc.number SUB_DFX_DFR_hiTraceChain_Ets_0002
     * @tc.desc   验证hiTraceChain.getId(),返回值属性覆盖,验证hiTraceChain.setId(undefined);
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testhiTraceChain_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      console.info("testhiTraceChain_0002 start");
      let traceId1 = hiTraceChain.begin("business", hiTraceChain.HiTraceFlag.DEFAULT);
      try{
        let traceId = hiTraceChain.getId();
        console.info("====> testhiTraceChain_0002 getId undefined end 01");
        hiTraceChain.setId(undefined);
        console.info("====> testhiTraceChain_0002 setId undefined end 02");
        hiTraceChain.setId(null);
        console.info("====> testhiTraceChain_0002 setId undefined end 03");
        expect(traceId.chainId == traceId1.chainId).assertEqual(true);
        expect(traceId.spanId == 0).assertEqual(true);
        expect(traceId.parentSpanId == 0).assertEqual(true);
        expect(traceId.flags == 0).assertEqual(true);
        done();
      }catch(err){
        console.error(`====>testhiTraceChain_0002 setId undefined catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(err.code === 401).assertTrue();
        done();
      }
      console.info("testhiTraceChain_0002 end");
    })
    /**
     * @tc.name   testhiTraceChain_0003
     * @tc.number SUB_DFX_DFR_hiTraceChain_Ets_0003
     * @tc.desc   验证hiTraceChain.createSpan(),返回值属性覆盖;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testhiTraceChain_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
      let traceId = hiTraceChain.begin("business", hiTraceChain.HiTraceFlag.DEFAULT);
      console.info("testhiTraceChain_0003 start");
      try{
        let spanTraceId = hiTraceChain.createSpan();
        console.info("====> testhiTraceChain_0003 getId undefined end 01");
        expect(spanTraceId.chainId == traceId.chainId).assertEqual(true);
        expect(spanTraceId.spanId != 0).assertEqual(true);
        expect(spanTraceId.parentSpanId == 0).assertEqual(true);
        expect(spanTraceId.flags == 0).assertEqual(true);
        console.info("====> testhiTraceChain_0003 createSpan undefined end 02");
        hiTraceChain.end(spanTraceId);
        hiTraceChain.end(traceId);
        done();
      }catch(err){
        console.error(`====>testhiTraceChain_0003 createSpan undefined catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(err.code === 401).assertTrue();
        done();
      }
      console.info("testhiTraceChain_0003 end");
    })
    /**
     * @tc.name   testhiTraceChain_0004
     * @tc.number SUB_DFX_DFR_hiTraceChain_Ets_0004
     * @tc.desc   验证hiTraceChain.tracepoint(hiTraceChain.HiTraceCommunicationMode.THREAD, hiTraceChain.HiTraceTracepointType.SS, undefined, undefined)，
     * 第3个参数缺少null/undefined覆盖;第4个参数缺少空值""//null/undefined覆盖;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testhiTraceChain_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      try{
        console.info("testhiTraceChain_0004 start");
        hiTraceChain.tracepoint(hiTraceChain.HiTraceCommunicationMode.THREAD, hiTraceChain.HiTraceTracepointType.SS, undefined, undefined);
        console.info("====> testhiTraceChain_0004 tracepoint undefined end 01");
        hiTraceChain.tracepoint(hiTraceChain.HiTraceCommunicationMode.THREAD, hiTraceChain.HiTraceTracepointType.SS, null, null);
        console.info("====> testhiTraceChain_0004 tracepoint undefined end 02");
        hiTraceChain.tracepoint(hiTraceChain.HiTraceCommunicationMode.THREAD, hiTraceChain.HiTraceTracepointType.SS, null, "");
        console.info("====> testhiTraceChain_0004 tracepoint undefined end 03");
        done();
      }catch(err){
        console.error(`====>testhiTraceChain_0004 tracepoint undefined catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(err.code === 401).assertTrue();
        done();
      }
      console.info("testhiTraceChain_0004 end");
    })

    /**
     * @tc.name   testhiTraceChain_0005
     * @tc.number SUB_DFX_DFR_hiTraceChain_Ets_0005
     * @tc.desc   验证hiTraceChain.isValid(undefined),参数输入undefined;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testhiTraceChain_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      try{
        console.info("testhiTraceChain_0005 start");
        hiTraceChain.isValid(undefined);
        console.info("====> testhiTraceChain_0005 isValid undefined end 01");
        hiTraceChain.isValid(null);
        console.info("====> testhiTraceChain_0005 isValid undefined end 02");
        done();
      }catch(err){
        console.error(`====>testhiTraceChain_0005 isValid undefined catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(err.code === 401).assertTrue();
        done();
      }
      console.info("testhiTraceChain_0005 end");
    })

    /**
     * @tc.name   testhiTraceChain_0006
     * @tc.number SUB_DFX_DFR_hiTraceChain_Ets_0006
     * @tc.desc   验证hiTraceChain.isFlagEnabled(undefined,hiTraceChain.HiTraceFlag.DEFAULT),第一个参数输入undefined;第2个参数未覆盖枚举:['DEFAULT', 'INCLUDE_ASYNC', 'DONOT_CREATE_SPAN', 'TP_INFO']；
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testhiTraceChain_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      try{
        console.info("testhiTraceChain_0006 start");
        hiTraceChain.isFlagEnabled(undefined,hiTraceChain.HiTraceFlag.DEFAULT);
        console.info("====> testhiTraceChain_0006 isFlagEnabled undefined end 01");
        hiTraceChain.isFlagEnabled(null,hiTraceChain.HiTraceFlag.INCLUDE_ASYNC);
        console.info("====> testhiTraceChain_0006 isFlagEnabled undefined end 02");
        hiTraceChain.isFlagEnabled(undefined,hiTraceChain.HiTraceFlag.DONOT_CREATE_SPAN);
        console.info("====> testhiTraceChain_0006 isFlagEnabled undefined end 03");
        hiTraceChain.isFlagEnabled(null,hiTraceChain.HiTraceFlag.TP_INFO);
        done();
      }catch(err){
        console.error(`====>testhiTraceChain_0006 isFlagEnabled undefined catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(err.code === 401).assertTrue();
        done();
      }
      console.info("testhiTraceChain_0006 end");
    })
    /**
     * @tc.name   testhiTraceChain_0007
     * @tc.number SUB_DFX_DFR_hiTraceChain_Ets_0007
     * @tc.desc   验证hiTraceChain.enableFlag(),第一个参数输入undefined/null;第2个参数未覆盖枚举:['DEFAULT', 'INCLUDE_ASYNC', 'DONOT_CREATE_SPAN', 'TP_INFO']；
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testhiTraceChain_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      try{
        console.info("testhiTraceChain_0007 start");
        hiTraceChain.enableFlag(undefined,hiTraceChain.HiTraceFlag.DEFAULT);
        console.info("====> testhiTraceChain_0007 enableFlag undefined end 01");
        hiTraceChain.enableFlag(null,hiTraceChain.HiTraceFlag.INCLUDE_ASYNC);
        console.info("====> testhiTraceChain_0007 enableFlag undefined end 02");
        hiTraceChain.enableFlag(undefined,hiTraceChain.HiTraceFlag.DONOT_CREATE_SPAN);
        console.info("====> testhiTraceChain_0007 enableFlag undefined end 03");
        hiTraceChain.enableFlag(null,hiTraceChain.HiTraceFlag.TP_INFO);
        done();
      }catch(err){
        console.error(`====>testhiTraceChain_0007 enableFlag undefined catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(err.code === 401).assertTrue();
        done();
      }
      console.info("testhiTraceChain_0007 end");
    })

    /**
     * @tc.name   testhiTraceChain_0008
     * @tc.number SUB_DFX_DFR_hiTraceChain_Ets_0008
     * @tc.desc   验证hiTraceChain.enableFlag(),第2个参数覆盖枚举:['NO_BE_INFO']；
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testhiTraceChain_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      try{
        console.info("testhiTraceChain_0008 start");
        let traceId = hiTraceChain.begin("business", hiTraceChain.HiTraceFlag.INCLUDE_ASYNC);
        let enabledDoNotCreateSpanFlag = hiTraceChain.isFlagEnabled(traceId, hiTraceChain.HiTraceFlag.NO_BE_INFO);
        hiTraceChain.enableFlag(traceId, hiTraceChain.HiTraceFlag.DONOT_CREATE_SPAN);
        enabledDoNotCreateSpanFlag = hiTraceChain.isFlagEnabled(traceId, hiTraceChain.HiTraceFlag.D2D_TP_INFO);
        done();
      }catch(err){
        console.error(`====>testhiTraceChain_0008 enableFlag undefined catch > error code: ${err.code}, error msg: ${err.message}`)
        expect(err.code === 401).assertTrue();
        done();
      }
      console.info("testhiTraceChain_0008 end");
    })
  })
}
