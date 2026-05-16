/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level , beforeEach} from "../../../hypium/index";
import hiTraceChain from "@ohos.hiTraceChain"
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base';

export default function hiTraceChainJsTest() {
  describe("hiTraceChainJsTest", (): void => {

    beforeEach(() => {
      hiTraceChain.clearId();
    })
    /**
     * @tc.name   testHitraceApiStatic01
     * @tc.number DFX_DFT_Hitrace_JS_Static_001
     * @tc.desc   hitrace begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHitraceApiStatic01', Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'testTag', 'testHitraceApiStatic01 start');
      try {
        let traceId = hiTraceChain.begin("hitrace01", hiTraceChain.HiTraceFlag.DEFAULT);
        let traceIdIsvalid = hiTraceChain.isValid(traceId);
        if (!traceIdIsvalid) {
          expect().assertFail();
        }
        hiTraceChain.end(traceId);
      } catch (err: BusinessError) {
        hilog.info(0x0000, 'testTag', 'testHitraceApiStatic01 got an error:' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
      hilog.info(0x0000, 'testTag', 'testHitraceApiStatic01 end');
      done();
    })

    /**
     * @tc.name   testHitraceApiStatic02
     * @tc.number DFX_DFT_Hitrace_JS_Static_002
     * @tc.desc   hitrace begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHitraceApiStatic02', Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'testTag', 'testHitraceApiStatic02 start');
      try{
        let traceId = hiTraceChain.begin("hitrace02", hiTraceChain.HiTraceFlag.INCLUDE_ASYNC |
        hiTraceChain.HiTraceFlag.DONOT_CREATE_SPAN);
        let traceIdIsvalid = hiTraceChain.isValid(traceId);
        if(!traceIdIsvalid){
          expect().assertFail();
        }
        hiTraceChain.end(traceId);
      } catch (err: BusinessError){
        hilog.info(0x0000, 'testTag', 'testHitraceApiStatic02 got an error:' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
      hilog.info(0x0000, 'testTag', 'testHitraceApiStatic02 end');
      done();
    })

    /**
     * @tc.name   testHitraceApiStatic03
     * @tc.number DFX_DFT_Hitrace_JS_Static_003
     * @tc.desc   hitrace begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHitraceApiStatic03', Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'testTag', 'testHitraceApiStatic03 start');
      try{
        let traceId = hiTraceChain.begin("testHitraceApiStatic03", hiTraceChain.HiTraceFlag.TP_INFO);
        let curTraceId = hiTraceChain.getId();
        if(traceId.chainId != curTraceId.chainId){
          expect().assertFail();
        }
        hiTraceChain.tracepoint(hiTraceChain.HiTraceCommunicationMode.THREAD,
          hiTraceChain.HiTraceTracepointType.SS, traceId, "hitrace api test.");
        hiTraceChain.end(traceId);
      } catch (err: BusinessError){
        hilog.info(0x0000, 'testTag', 'testHitraceApiStatic03 got an error:' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
      hilog.info(0x0000, 'testTag', 'testHitraceApiStatic03 end');
      done();
    })

    /**
     * @tc.name   testHitraceApiStatic04
     * @tc.number DFX_DFT_Hitrace_JS_Static_004
     * @tc.desc   hitrace begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHitraceApiStatic04', Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'testTag', 'testHitraceApiStatic04 start');
      try{
        let traceId: hiTraceChain.HiTraceId = hiTraceChain.begin("hitrace04", hiTraceChain.HiTraceFlag.NO_BE_INFO);
        hilog.info(0x0000, 'testTag', 'testHitraceApiStatic04 begin:' + traceId.chainId);
        hilog.info(0x0000, 'testTag', 'testHitraceApiStatic04 begin:' + traceId.spanId);
        hilog.info(0x0000, 'testTag', 'testHitraceApiStatic04 begin:' + traceId.parentSpanId);
        hilog.info(0x0000, 'testTag', 'testHitraceApiStatic04 begin:' + traceId.flags);
        let spanTraceId: hiTraceChain.HiTraceId = hiTraceChain.createSpan();
        hilog.info(0x0000, 'testTag', 'testHitraceApiStatic04 spanTraceId:' + spanTraceId.chainId);
        hilog.info(0x0000, 'testTag', 'testHitraceApiStatic04 spanTraceId:' + spanTraceId.spanId);
        hilog.info(0x0000, 'testTag', 'testHitraceApiStatic04 spanTraceId:' + spanTraceId.parentSpanId);
        hilog.info(0x0000, 'testTag', 'testHitraceApiStatic04 spanTraceId:' + spanTraceId.flags);
        let enabledDoNotCreateSpanFlag: boolean = hiTraceChain.isFlagEnabled(traceId, hiTraceChain.HiTraceFlag.NO_BE_INFO);
        hilog.info(0x0000, 'testTag', 'testHitraceApiStatic04 isFlagEnabled:' + enabledDoNotCreateSpanFlag);
        if(!enabledDoNotCreateSpanFlag){
          expect().assertFail();
          hilog.info(0x0000, 'testTag', 'testHitraceApiStatic04 if');
        }
        hiTraceChain.end(traceId);
      } catch (err: BusinessError){
        hilog.info(0x0000, 'testTag', 'testHitraceApiStatic04 got an error:' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
      hilog.info(0x0000, 'testTag', 'testHitraceApiStatic04 end');
      done();
    })

    /**
     * @tc.name   testHitraceApiStatic05
     * @tc.number DFX_DFT_Hitrace_JS_Static_005
     * @tc.desc   hitrace begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHitraceApiStatic05', Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'testTag', 'testHitraceApiStatic05 start');
      try{
        let traceId: hiTraceChain.HiTraceId = hiTraceChain.begin("hitrace05");
        hilog.info(0x0000, 'testTag', 'testHitraceApiStatic05 begin:' + traceId.chainId);
        hilog.info(0x0000, 'testTag', 'testHitraceApiStatic05 begin:' + traceId.spanId);
        hilog.info(0x0000, 'testTag', 'testHitraceApiStatic05 begin:' + traceId.parentSpanId);
        hilog.info(0x0000, 'testTag', 'testHitraceApiStatic05 begin:' + traceId.flags);
        hiTraceChain.enableFlag(traceId, hiTraceChain.HiTraceFlag.DISABLE_LOG);
        hilog.info(0x0000, 'testTag', 'testHitraceApiStatic05 enableFlag');
        let enabledDoNotCreateSpanFlag: boolean = hiTraceChain.isFlagEnabled(traceId, hiTraceChain.HiTraceFlag.DISABLE_LOG);
        hilog.info(0x0000, 'testTag', 'testHitraceApiStatic05 isFlagEnabled:' + enabledDoNotCreateSpanFlag);
        if(!enabledDoNotCreateSpanFlag){
          expect().assertFail();
        }
        hiTraceChain.end(traceId);
      } catch (err: BusinessError){
        hilog.info(0x0000, 'testTag', 'testHitraceApiStatic05 got an error:' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
      hilog.info(0x0000, 'testTag', 'testHitraceApiStatic05 end');
      done();
    })

    /**
     * @tc.name   testHitraceApiStatic06
     * @tc.number DFX_DFT_Hitrace_JS_Static_006
     * @tc.desc   hitrace begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHitraceApiStatic06', Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'testTag', 'testHitraceApiStatic06 start');
      try{
        let traceId: hiTraceChain.HiTraceId = hiTraceChain.begin("hitrace06");
        hilog.info(0x0000, 'testTag', 'testHitraceApiStatic06 begin:' + traceId.chainId);
        hilog.info(0x0000, 'testTag', 'testHitraceApiStatic06 begin:' + traceId.spanId);
        hilog.info(0x0000, 'testTag', 'testHitraceApiStatic06 begin:' + traceId.parentSpanId);
        hilog.info(0x0000, 'testTag', 'testHitraceApiStatic06 begin:' + traceId.flags);
        hiTraceChain.enableFlag(traceId, hiTraceChain.HiTraceFlag.FAILURE_TRIGGER);
        let enabledDoNotCreateSpanFlag: boolean = hiTraceChain.isFlagEnabled(traceId,
          hiTraceChain.HiTraceFlag.FAILURE_TRIGGER);
        hilog.info(0x0000, 'testTag', 'testHitraceApiStatic06 isFlagEnabled:' + enabledDoNotCreateSpanFlag);
        if(!enabledDoNotCreateSpanFlag){
          expect().assertFail();
        }
        hiTraceChain.end(traceId);
      } catch (err: BusinessError){
        hilog.info(0x0000, 'testTag', 'testHitraceApiStatic06 got an error:' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
      hilog.info(0x0000, 'testTag', 'testHitraceApiStatic06 end');
      done();
    })

    /**
     * @tc.name   testHitraceApiStatic07
     * @tc.number DFX_DFT_Hitrace_JS_Static_007
     * @tc.desc   hitrace begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHitraceApiStatic07', Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'testTag', 'testHitraceApiStatic07 start');
      try{
        let traceId: hiTraceChain.HiTraceId = hiTraceChain.begin("hitrace07", hiTraceChain.HiTraceFlag.D2D_TP_INFO);
        hilog.info(0x0000, 'testTag', 'testHitraceApiStatic07 begin:' + traceId.chainId);
        hilog.info(0x0000, 'testTag', 'testHitraceApiStatic07 begin:' + traceId.spanId);
        hilog.info(0x0000, 'testTag', 'testHitraceApiStatic07 begin:' + traceId.parentSpanId);
        hilog.info(0x0000, 'testTag', 'testHitraceApiStatic07 begin:' + traceId.flags);
        let enabledDoNotCreateSpanFlag: boolean = hiTraceChain.isFlagEnabled(traceId,
          hiTraceChain.HiTraceFlag.D2D_TP_INFO);
        hilog.info(0x0000, 'testTag', 'testHitraceApiStatic07 isFlagEnabled:' + enabledDoNotCreateSpanFlag);
        if(!enabledDoNotCreateSpanFlag){
          expect().assertFail();
        }
        hiTraceChain.tracepoint(hiTraceChain.HiTraceCommunicationMode.PROCESS,
          hiTraceChain.HiTraceTracepointType.CS, traceId, "hitrace test");
        hiTraceChain.end(traceId);
      } catch (err: BusinessError){
        hilog.info(0x0000, 'testTag', 'testHitraceApiStatic07 got an error:' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
      hilog.info(0x0000, 'testTag', 'testHitraceApiStatic07 end');
      done();
    })

    /**
     * @tc.name   testHitraceApiStatic10
     * @tc.number DFX_DFT_Hitrace_JS_Static_010
     * @tc.desc   接口测试-hitrace接口支持跨设备跟踪
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHitraceApiStatic10', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'testTag', 'testHitraceApiStatic10 start');
      hiTraceChain.clearId();
      try {
        let traceId = hiTraceChain.begin("hitrace10", hiTraceChain.HiTraceFlag.D2D_TP_INFO);
        let enabledDoNotCreateSpanFlag = hiTraceChain.isFlagEnabled(traceId, hiTraceChain.HiTraceFlag.D2D_TP_INFO);
        if(!enabledDoNotCreateSpanFlag){
          expect().assertFail();
        }
        hiTraceChain.tracepoint(hiTraceChain.HiTraceCommunicationMode.DEVICE,
          hiTraceChain.HiTraceTracepointType.CR,traceId, "hitrace test");
        hiTraceChain.end(traceId);
      } catch (err: BusinessError) {
        hilog.info(0x0000, 'testTag', 'testHitraceApiStatic10 got an error:' + JSON.stringify(err));
        expect().assertFail();
        done()
      }
      hilog.info(0x0000, 'testTag', 'testHitraceApiStatic10 end');
      done()
    });

    /**
     * @tc.name   testHitraceApiStatic11
     * @tc.number DFX_DFT_Hitrace_JS_Static_011
     * @tc.desc   接口测试-hitrace接口支持跨设备跟踪
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHitraceApiStatic11', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'testTag', 'testHitraceApiStatic11 start');
      const traceId: hiTraceChain.HiTraceId = {
        chainId: 12345678n,
        spanId: 1,
        parentSpanId: 0,
        flags: 1
      };
      hiTraceChain.setId(traceId);
      hiTraceChain.clearId();
      try {
        let traceId = hiTraceChain.begin("hitrace11", hiTraceChain.HiTraceFlag.D2D_TP_INFO);
        let flags = traceId.flags
        let parentSpanId = traceId.parentSpanId
        let spanId = traceId.spanId
        let enabledDoNotCreateSpanFlag = hiTraceChain.isFlagEnabled(traceId, hiTraceChain.HiTraceFlag.D2D_TP_INFO);
        if(!enabledDoNotCreateSpanFlag){
          expect().assertFail();
        }
        hiTraceChain.tracepoint(hiTraceChain.HiTraceCommunicationMode.DEFAULT,
          hiTraceChain.HiTraceTracepointType.SR, traceId, "hitrace test");
        hiTraceChain.end(traceId);
      } catch (err: BusinessError) {
        hilog.info(0x0000, 'testTag', 'testHitraceApiStatic11 got an error:' + JSON.stringify(err));
        expect().assertFail();
        done()
      }
      hilog.info(0x0000, 'testTag', 'testHitraceApiStatic11 end');
      done()
    });

    /**
     * @tc.name   testHitraceApiStatic12
     * @tc.number DFX_DFT_Hitrace_JS_Static_012
     * @tc.desc   接口测试-hitrace接口支持跨设备跟踪
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHitraceApiStatic12', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'testTag', 'testHitraceApiStatic12 start');
      try {
        let traceId = hiTraceChain.begin("hitrace12", hiTraceChain.HiTraceFlag.D2D_TP_INFO);
        let traceIdIsvalid = hiTraceChain.isValid(traceId);
        expect(traceIdIsvalid).assertTrue()
        let enabledDoNotCreateSpanFlag = hiTraceChain.isFlagEnabled(traceId, hiTraceChain.HiTraceFlag.D2D_TP_INFO);
        expect(enabledDoNotCreateSpanFlag).assertTrue()
        if(!enabledDoNotCreateSpanFlag){
          expect().assertFail();
        }
        hiTraceChain.tracepoint(hiTraceChain.HiTraceCommunicationMode.DEVICE,
          hiTraceChain.HiTraceTracepointType.GENERAL, traceId, "hitrace test");
        hiTraceChain.end(traceId);
      } catch (err: BusinessError) {
        hilog.info(0x0000, 'testTag', 'testHitraceApiStatic12 got an error:' + JSON.stringify(err));
        expect().assertFail();
        done()
      }
      hilog.info(0x0000, 'testTag', 'testHitraceApiStatic12 end');
      done()
    });

    /**
     * @tc.name   testHitraceApiStatic14
     * @tc.number DFX_DFT_Hitrace_JS_Static_01400
     * @tc.desc   接口测试-跟踪业务名为长度大于32位
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHitraceApiStatic14', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'testTag', 'testHitraceApiStatic14 start');
      let traceId = hiTraceChain.getId()
      let traceIdIsvalid = hiTraceChain.isValid(traceId);
      let enabledDoNotCreateSpanFlag = hiTraceChain.isFlagEnabled(traceId, hiTraceChain.HiTraceFlag.D2D_TP_INFO);
      expect(traceIdIsvalid).assertFalse()
      expect(enabledDoNotCreateSpanFlag).assertFalse()
      hilog.info(0x0000, 'testTag', 'testHitraceApiStatic14 end');
      done();
    })

    /**
     * @tc.name   testHitraceApiStatic15
     * @tc.number DFX_DFT_Hitrace_JS_Static_01500
     * @tc.desc   接口测试-跟踪业务名为长度大于32位
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHitraceApiStatic15', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'testTag', 'testHitraceApiStatic15 start');
      try{
        let traceId = hiTraceChain.begin("1234567890qwertyuiopasdfghjklzxcvbnm");
        let traceIdIsvalid = hiTraceChain.isValid(traceId);
        if(!traceIdIsvalid){
          expect().assertFail();
        }
        hiTraceChain.end(traceId);
      } catch (err: BusinessError){
        hilog.info(0x0000, 'testTag', 'testHitraceApiStatic15 got an error:' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
      hilog.info(0x0000, 'testTag', 'testHitraceApiStatic15 end');
      done();
    })

    /**
     * @tc.name   testHitraceApiStatic016
     * @tc.number DFX_DFT_Hitrace_JS_Static_01600
     * @tc.desc   接口测试-跟踪业务名为长度大于1024位
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHitraceApiStatic016', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'testTag', 'testHitraceApiStatic016 start');
      try{
        let traceId = hiTraceChain.begin("1234567890qwertyuiopasdfghjklzxcvbnm1234567890qwertyuiopasdfghjklzxcvbnm1234567890qwertyuiopasdfghjklzxcvbnm12345678901234567890");
        let traceIdIsvalid = hiTraceChain.isValid(traceId);
        if(!traceIdIsvalid){
          expect().assertFail();
        }
        hiTraceChain.end(traceId);
      } catch (err: BusinessError){
        hilog.info(0x0000, 'testTag', 'testHitraceApiStatic016 got an error:' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
      hilog.info(0x0000, 'testTag', 'testHitraceApiStatic016 end');
      done();
    })

    /**
     * @tc.name   testHitraceApiStatic017
     * @tc.number DFX_DFT_Hitrace_JS_Static_01700
     * @tc.desc   接口测试-跟踪业务名为""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHitraceApiStatic017', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'testTag', 'testHitraceApiStatic017 start');
      try{
        let traceId = hiTraceChain.begin("");
        let traceIdIsvalid = hiTraceChain.isValid(traceId);
        if(!traceIdIsvalid){
          expect().assertFail();
        }
        hiTraceChain.end(traceId);
      } catch (err: BusinessError){
        hilog.info(0x0000, 'testTag', 'testHitraceApiStatic017 got an error:' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
      hilog.info(0x0000, 'testTag', 'testHitraceApiStatic017 end');
      done();
    })

    /**
     * @tc.name   testHitraceApiStatic018
     * @tc.number DFX_DFT_Hitrace_JS_Static_01800
     * @tc.desc   接口测试-跟踪业务名为" "
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHitraceApiStatic018', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'testTag', 'testHitraceApiStatic018 start');
      try{
        let traceId = hiTraceChain.begin(" ");
        let traceIdIsvalid = hiTraceChain.isValid(traceId);
        if(!traceIdIsvalid){
          expect().assertFail();
        }
        hiTraceChain.end(traceId);
      } catch (err: BusinessError){
        hilog.info(0x0000, 'testTag', 'testHitraceApiStatic018 got an error:' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
      hilog.info(0x0000, 'testTag', 'testHitraceApiStatic018 end');
      done();
    })

    /**
     * @tc.name   testHitraceApiStatic019
     * @tc.number DFX_DFT_Hitrace_JS_Static_01900
     * @tc.desc   接口测试-跟踪业务名为"default"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHitraceApiStatic019', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'testTag', 'testHitraceApiStatic019 start');
      try{
        let traceId = hiTraceChain.begin("default");
        let traceIdIsvalid = hiTraceChain.isValid(traceId);
        if(!traceIdIsvalid){
          expect().assertFail();
        }
        hiTraceChain.end(traceId);
      } catch (err: BusinessError){
        hilog.info(0x0000, 'testTag', 'testHitraceApiStatic019 got an error:' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
      hilog.info(0x0000, 'testTag', 'testHitraceApiStatic019 end');
      done();
    })

    /**
     * @tc.name   testHitraceApiStatic020
     * @tc.number DFX_DFT_Hitrace_JS_Static_02000
     * @tc.desc   接口测试-跟踪业务名为中文字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHitraceApiStatic020', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'testTag', 'testHitraceApiStatic020 start');
      try{
        let traceId = hiTraceChain.begin("华为");
        let traceIdIsvalid = hiTraceChain.isValid(traceId);
        if(!traceIdIsvalid){
          expect().assertFail();
        }
        hiTraceChain.end(traceId);
      } catch (err: BusinessError){
        hilog.info(0x0000, 'testTag', 'testHitraceApiStatic020 got an error:' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
      hilog.info(0x0000, 'testTag', 'testHitraceApiStatic020 end');
      done();
    })

    /**
     * @tc.name   testHitraceApiStatic021
     * @tc.number DFX_DFT_Hitrace_JS_Static_02100
     * @tc.desc   接口测试-HiTraceCommunicationMode为DEFAULT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHitraceApiStatic021', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'testTag', 'testHitraceApiStatic021 start');
      try{
        let traceId = hiTraceChain.begin("hitrace03", hiTraceChain.HiTraceFlag.TP_INFO);
        let curTraceId = hiTraceChain.getId();
        if(traceId.chainId != curTraceId.chainId){
          expect().assertFail();
        }
        hiTraceChain.tracepoint(hiTraceChain.HiTraceCommunicationMode.DEFAULT,
          hiTraceChain.HiTraceTracepointType.SS, traceId, "hitrace api test.");
        hiTraceChain.end(traceId);
      } catch (err: BusinessError){
        hilog.info(0x0000, 'testTag', 'testHitraceApiStatic021 got an error:' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
      hilog.info(0x0000, 'testTag', 'testHitraceApiStatic021 end');
      done();
    })

    /**
     * @tc.name   testHitraceApiStatic022
     * @tc.number DFX_DFT_Hitrace_JS_Static_02200
     * @tc.desc   接口测试-HiTraceCommunicationMode为PROCESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHitraceApiStatic022', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'testTag', 'testHitraceApiStatic022 start');
      try{
        let traceId = hiTraceChain.begin("hitrace03", hiTraceChain.HiTraceFlag.TP_INFO);
        let curTraceId = hiTraceChain.getId();
        if(traceId.chainId != curTraceId.chainId){
          expect().assertFail();
        }
        hiTraceChain.tracepoint(hiTraceChain.HiTraceCommunicationMode.PROCESS,
          hiTraceChain.HiTraceTracepointType.SS, traceId, "hitrace api test.");
        hiTraceChain.end(traceId);
      } catch (err: BusinessError){
        hilog.info(0x0000, 'testTag', 'testHitraceApiStatic022 got an error:' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
      hilog.info(0x0000, 'testTag', 'testHitraceApiStatic022 end');
      done();
    })

    /**
     * @tc.name   testHitraceApiStatic023
     * @tc.number DFX_DFT_Hitrace_JS_Static_02300
     * @tc.desc   接口测试-HiTraceCommunicationMode为DEVICE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHitraceApiStatic023', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'testTag', 'testHitraceApiStatic023 start');
      try{
        let traceId = hiTraceChain.begin("testHitraceApiStatic023", hiTraceChain.HiTraceFlag.TP_INFO);
        let curTraceId = hiTraceChain.getId();
        if(traceId.chainId != curTraceId.chainId){
          expect().assertFail();
        }
        hiTraceChain.tracepoint(hiTraceChain.HiTraceCommunicationMode.DEVICE,
          hiTraceChain.HiTraceTracepointType.SS, traceId, "hitrace api test.");
        hiTraceChain.end(traceId);
      } catch (err: BusinessError){
        hilog.info(0x0000, 'testTag', 'testHitraceApiStatic023 got an error:' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
      hilog.info(0x0000, 'testTag', 'testHitraceApiStatic023 end');
      done();
    })

    /**
     * @tc.name   testHitraceApiStatic024
     * @tc.number DFX_DFT_Hitrace_JS_Static_02400
     * @tc.desc   接口测试-HiTraceTracepointType为CS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHitraceApiStatic024', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'testTag', 'testHitraceApiStatic024 start');
      try{
        let traceId = hiTraceChain.begin("testHitraceApiStatic024", hiTraceChain.HiTraceFlag.TP_INFO);
        let curTraceId = hiTraceChain.getId();
        if(traceId.chainId != curTraceId.chainId){
          expect().assertFail();
        }
        hiTraceChain.tracepoint(hiTraceChain.HiTraceCommunicationMode.DEVICE,
          hiTraceChain.HiTraceTracepointType.CS, traceId, "hitrace api test.");
        hiTraceChain.end(traceId);
      } catch (err: BusinessError){
        hilog.info(0x0000, 'testTag', 'testHitraceApiStatic024 got an error:' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
      hilog.info(0x0000, 'testTag', 'testHitraceApiStatic024 end');
      done();
    })

    /**
     * @tc.name   testHitraceApiStatic025
     * @tc.number DFX_DFT_Hitrace_JS_Static_02500
     * @tc.desc   接口测试-HiTraceTracepointType为CR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHitraceApiStatic025', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'testTag', 'testHitraceApiStatic025 start');
      try{
        let traceId = hiTraceChain.begin("testHitraceApiStatic025", hiTraceChain.HiTraceFlag.TP_INFO);
        let curTraceId = hiTraceChain.getId();
        if(traceId.chainId != curTraceId.chainId){
          expect().assertFail();
        }
        hiTraceChain.tracepoint(hiTraceChain.HiTraceCommunicationMode.DEVICE,
          hiTraceChain.HiTraceTracepointType.CR, traceId, "hitrace api test.");
        hiTraceChain.end(traceId);
      } catch (err: BusinessError){
        hilog.info(0x0000, 'testTag', 'testHitraceApiStatic025 got an error:' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
      hilog.info(0x0000, 'testTag', 'testHitraceApiStatic025 end');
      done();
    })

    /**
     * @tc.name   testHitraceApiStatic026
     * @tc.number DFX_DFT_Hitrace_JS_Static_02600
     * @tc.desc   接口测试-HiTraceTracepointType为SR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHitraceApiStatic026', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'testTag', 'testHitraceApiStatic026 start');
      try{
        let traceId = hiTraceChain.begin("testHitraceApiStatic026", hiTraceChain.HiTraceFlag.TP_INFO);
        let curTraceId = hiTraceChain.getId();
        if(traceId.chainId != curTraceId.chainId){
          expect().assertFail();
        }
        hiTraceChain.tracepoint(hiTraceChain.HiTraceCommunicationMode.DEVICE,
          hiTraceChain.HiTraceTracepointType.SR, traceId, "hitrace api test.");
        hiTraceChain.end(traceId);
      } catch (err: BusinessError){
        hilog.info(0x0000, 'testTag', 'testHitraceApiStatic026 got an error:' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
      hilog.info(0x0000, 'testTag', 'testHitraceApiStatic026 end');
      done();
    })

    /**
     * @tc.name   testHitraceApiStatic027
     * @tc.number DFX_DFT_Hitrace_JS_Static_02700
     * @tc.desc   接口测试-HiTraceTracepointType为GENERAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHitraceApiStatic027', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'testTag', 'testHitraceApiStatic027 start');
      try{
        let traceId = hiTraceChain.begin("testHitraceApiStatic027", hiTraceChain.HiTraceFlag.TP_INFO);
        let curTraceId = hiTraceChain.getId();
        if(traceId.chainId != curTraceId.chainId){
          expect().assertFail();
        }
        hiTraceChain.tracepoint(hiTraceChain.HiTraceCommunicationMode.DEVICE,
          hiTraceChain.HiTraceTracepointType.GENERAL, traceId, "hitrace api test.");
        hiTraceChain.end(traceId);
      } catch (err: BusinessError){
        hilog.info(0x0000, 'testTag', 'testHitraceApiStatic027 got an error:' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
      console.info('testHitraceApiStatic027 end');
      hilog.info(0x0000, 'testTag', 'testHitraceApiStatic027 end');
      done();
    })

    /**
     * @tc.name   testHitraceApiStatic028
     * @tc.number DFX_DFT_Hitrace_JS_Static_02800
     * @tc.desc   接口测试-tracepoint接口参数msg为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHitraceApiStatic028', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'testTag', 'testHitraceApiStatic028 start');
      try{
        let traceId = hiTraceChain.begin("testHitraceApiStatic028", hiTraceChain.HiTraceFlag.TP_INFO);
        let curTraceId = hiTraceChain.getId();
        if(traceId.chainId != curTraceId.chainId){
          expect().assertFail();
        }
        hiTraceChain.tracepoint(hiTraceChain.HiTraceCommunicationMode.DEVICE,
          hiTraceChain.HiTraceTracepointType.GENERAL, traceId);
        hiTraceChain.end(traceId);
      } catch (err: BusinessError){
        hilog.info(0x0000, 'testTag', 'testHitraceApiStatic028 got an error:' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
      console.info('testHitraceApiStatic028 end');
      hilog.info(0x0000, 'testTag', 'testHitraceApiStatic028 end');
      done();
    })
  })
}
