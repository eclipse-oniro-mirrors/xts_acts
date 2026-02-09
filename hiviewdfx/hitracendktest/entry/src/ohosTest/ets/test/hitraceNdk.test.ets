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

import { describe, expect, it, TestType, Size, Level} from '@ohos/hypium'
import hitracendk from 'libentry.so'
import { hiTraceChain  } from '@kit.PerformanceAnalysisKit';

export default function hitraceNdkTest() {
  describe('HiviewdfxHitraceTest', () => {
    /**
     * @tc.name   testOHHiTraceCountTrace001
     * @tc.number SUB_HIVIEWDFX_HITRACE_TRACE_OH_HITRACE_COUNTTRACE_0100
     * @tc.desc   test OH_HiTrace_CountTrace
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHHiTraceCountTrace001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hitracendk.oHHiTraceCountTrace();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHHiTraceStartTrace001
     * @tc.number SUB_HIVIEWDFX_HITRACE_TRACE_OH_HITRACE_STARTTRACE_0100
     * @tc.desc   test OH_HiTrace_StartTrace
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHHiTraceStartTrace001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hitracendk.oHHiTraceStartTrace();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOHHiTraceStartAsyncTrace001
     * @tc.number SUB_HIVIEWDFX_HITRACE_TRACE_OH_HITRACE_STARTASYNCTRACE_0100
     * @tc.desc   test OH_HiTrace_StartAsyncTrace
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHHiTraceStartAsyncTrace001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hitracendk.oHHiTraceStartAsyncTrace();
      expect(result).assertEqual(0);
      done();
    });
    
    /**
     * @tc.name   testOHHiTraceChainNd001
     * @tc.number SUB_DFX_DFT_HiTraceChain_C_0200
     * @tc.desc   test OH_HiTrace_BeginChain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHHiTraceChainNd001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let result: number = hitracendk.begin(); 
        expect(result).assertEqual(0);
        done();
    });

    /**
     * @tc.name   testOHHiTraceChainNd002
     * @tc.number SUB_DFX_DFT_HiTraceChain_C_1000
     * @tc.desc   test OH_HiTrace_IsFlagEnabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHHiTraceChainNd002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let result: number = hitracendk.beginflag(); 
        expect(result).assertEqual(0);
        done();
    });

    /**
     * @tc.name   testOHHiTraceChainNd003
     * @tc.number SUB_DFX_DFT_HiTraceChain_C_0800
     * @tc.desc   test OH_HiTrace_Tracepoint
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHHiTraceChainNd003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let result: number = hitracendk.beginSpan(); 
        expect(result).assertEqual(0);
        done();
    });

    /**
     * @tc.name   testoHHiTraceCountTraceEx
     * @tc.number testoHHiTraceCountTraceEx
     * @tc.desc   testoHHiTraceCountTraceEx
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testoHHiTraceCountTraceEx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let result: number = hitracendk.oHHiTraceCountTraceEx(); 
        expect(result).assertEqual(0);
        done();
    });

    /**
     * @tc.name   testoHHiTraceIsIdValid1
     * @tc.number testoHHiTraceIsIdValid1
     * @tc.desc   testoHHiTraceIsIdValid1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testoHHiTraceIsIdValid1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hiTraceChain.clearId()
        let result = hitracendk.oHHiTraceIsIdValid(); 
        expect(result).assertFalse()
        done();
    });

    /**
     * @tc.name   testoHHiTraceIsIdValidstatic1
     * @tc.number testoHHiTraceIsIdValidstatic1
     * @tc.desc   testoHHiTraceIsIdValidstatic1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testoHHiTraceIsIdValidstatic1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hiTraceChain.clearId()
        let result1 = hitracendk.oHHiTraceIsFlagEnabled()
        expect(result1).assertFalse()
        done();
    });

    /**
     * @tc.name   testoHHiTraceIsIdValidstatic2
     * @tc.number testoHHiTraceIsIdValidstatic2
     * @tc.desc   testoHHiTraceIsIdValidstatic2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testoHHiTraceIsIdValidstatic2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hiTraceChain.clearId()
        let traceId = hiTraceChain.begin("business", hiTraceChain.HiTraceFlag.DEFAULT);
        let result1 = hitracendk.oHHiTraceIsTraceEnabled()
        expect(result1).assertTrue()
        hiTraceChain.end(traceId);
        done();
    });

     /**
     * @tc.name   testoHHiTraceIsIdValidstatic3
     * @tc.number testoHHiTraceIsIdValidstatic3
     * @tc.desc   testoHHiTraceIsIdValidstatic3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testoHHiTraceIsIdValidstatic3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hiTraceChain.clearId()
        let traceId = hiTraceChain.begin("business", hiTraceChain.HiTraceFlag.DEFAULT);
        let result = hitracendk.oHHiTraceIsIdValid(); 
        expect(result).assertTrue()
        hiTraceChain.end(traceId);
        done();
    });

     /**
     * @tc.name   testoHHiTraceIsIdValidstatic4
     * @tc.number testoHHiTraceIsIdValidstatic4
     * @tc.desc   testoHHiTraceIsIdValidstatic4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testoHHiTraceIsIdValidstatic4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hiTraceChain.clearId()
        let traceId = hiTraceChain.begin("business", hiTraceChain.HiTraceFlag.DEFAULT|hiTraceChain.HiTraceFlag.INCLUDE_ASYNC);
        let result1 = hitracendk.oHHiTraceIsFlagEnabled()
        expect(result1).assertTrue()
        hiTraceChain.end(traceId);
        done();
    });

  })
}