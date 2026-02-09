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
import hiTraceChain from '@ohos.hiTraceChain'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size} from '@ohos/hypium'
import hilog from '@ohos.hilog'

export default function HiTraceJsTest() {
describe('HiTraceJsTest', function () {

    /**
    * run before testClass
    */
    beforeAll(function () {
        console.info('beforeAll called');
    })

    /**
    * run after testClass
    */
    afterAll(function () {
        console.info('afterAll called');
    })

    /**
     * @tc.name   testHitraceApi01
     * @tc.number DFX_DFT_Hitrace_JS_001
     * @tc.desc   hitrace begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHitraceApi01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        console.info('testHitraceApi01 start');
        hiTraceChain.clearId();
        try{
            let traceId = hiTraceChain.begin("hitrace01", hiTraceChain.HiTraceFlag.DEFAULT);
            let traceIdIsvalid = hiTraceChain.isValid(traceId);
            if(!traceIdIsvalid){
                expect().assertFail();
                console.log(`testHitraceApi01 got an error: ${JSON.stringify(error)}`);
            }
            hiTraceChain.end(traceId);
        } catch (error){
            console.log(`testHitraceApi01 got an error: ${JSON.stringify(error)}`);
            expect().assertFail();
            done();
        }
        console.info('testHitraceApi01 end');
        done();
    })

    /**
     * @tc.name   testHitraceApi02
     * @tc.number DFX_DFT_Hitrace_JS_002
     * @tc.desc   hitrace begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHitraceApi02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        console.info('testHitraceApi02 start');
        hiTraceChain.clearId();
        try{
            let traceId = hiTraceChain.begin("hitrace02", hiTraceChain.HiTraceFlag.INCLUDE_ASYNC |
            hiTraceChain.HiTraceFlag.DONOT_CREATE_SPAN);
            let traceIdIsvalid = hiTraceChain.isValid(traceId);
            if(!traceIdIsvalid){
                expect().assertFail();
                console.log(`testHitraceApi02 got an error: ${JSON.stringify(error)}`);
            }
            hiTraceChain.end(traceId);
        } catch (error){
            console.log(`testHitraceApi02 got an error: ${JSON.stringify(error)}`);
            expect().assertFail();
            done();
        }
        console.info('testHitraceApi02 end');
        done();
    })

    /**
     * @tc.name   testHitraceApi03
     * @tc.number DFX_DFT_Hitrace_JS_003
     * @tc.desc   hitrace begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHitraceApi03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        console.info('testHitraceApi03 start');
        hiTraceChain.clearId();
        try{
            let traceId = hiTraceChain.begin("hitrace03", hiTraceChain.HiTraceFlag.TP_INFO);
            let curTraceId = hiTraceChain.getId();
            if(traceId.chainId != curTraceId.chainId){
                expect().assertFail();
                console.log(`testHitraceApi03 got an error: ${JSON.stringify(error)}`);
            }
            hiTraceChain.tracepoint(hiTraceChain.HiTraceCommunicationMode.THREAD,
                                    hiTraceChain.HiTraceTracepointType.SS, traceId, "hitrace api test.");
            hiTraceChain.end(traceId);
        } catch (error){
            console.log(`testHitraceApi03 got an error: ${JSON.stringify(error)}`);
            expect().assertFail();
            done();
        }
        console.info('testHitraceApi03 end');
        done();
    })

    /**
     * @tc.name   testHitraceApi04
     * @tc.number DFX_DFT_Hitrace_JS_004
     * @tc.desc   hitrace begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHitraceApi04', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        console.info('testHitraceApi04 start');
        hiTraceChain.clearId();
        try{
            let traceId = hiTraceChain.begin("hitrace04", hiTraceChain.HiTraceFlag.NO_BE_INFO);
            let spanTraceId = hiTraceChain.createSpan();
            let enabledDoNotCreateSpanFlag = hiTraceChain.isFlagEnabled(traceId, hiTraceChain.HiTraceFlag.NO_BE_INFO);
            if(!enabledDoNotCreateSpanFlag){
                expect().assertFail();
                console.log(`testHitraceApi04 got an error: ${JSON.stringify(error)}`);
            }
            hiTraceChain.end(traceId);
        } catch (error){
            console.log(`testHitraceApi04 got an error: ${JSON.stringify(error)}`);
            expect().assertFail();
            done();
        }
        console.info('testHitraceApi04 end');
        done();
    })

    /**
     * @tc.name   testHitraceApi05
     * @tc.number DFX_DFT_Hitrace_JS_005
     * @tc.desc   hitrace begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHitraceApi05', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        console.info('testHitraceApi05 start');
        hiTraceChain.clearId();
        try{
            let traceId = hiTraceChain.begin("hitrace05");
            hiTraceChain.enableFlag(traceId, hiTraceChain.HiTraceFlag.DISABLE_LOG);
            let enabledDoNotCreateSpanFlag = hiTraceChain.isFlagEnabled(traceId, hiTraceChain.HiTraceFlag.DISABLE_LOG);
            if(!enabledDoNotCreateSpanFlag){
                expect().assertFail();
                console.log(`testHitraceApi05 got an error: ${JSON.stringify(error)}`);
            }
            hiTraceChain.end(traceId);
        } catch (error){
            console.log(`testHitraceApi05 got an error: ${JSON.stringify(error)}`);
            expect().assertFail();
            done();
        }
        console.info('testHitraceApi05 end');
        done();
    })

    /**
     * @tc.name   testHitraceApi06
     * @tc.number DFX_DFT_Hitrace_JS_006
     * @tc.desc   hitrace begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHitraceApi06', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        console.info('testHitraceApi06 start');
        hiTraceChain.clearId();
        try{
            let traceId = hiTraceChain.begin("hitrace06");
            hiTraceChain.enableFlag(traceId, hiTraceChain.HiTraceFlag.FAILURE_TRIGGER);
            let enabledDoNotCreateSpanFlag = hiTraceChain.isFlagEnabled(traceId,
            hiTraceChain.HiTraceFlag.FAILURE_TRIGGER);
            if(!enabledDoNotCreateSpanFlag){
                expect().assertFail();
                console.log(`testHitraceApi06 got an error: ${JSON.stringify(error)}`);
            }
            hiTraceChain.end(traceId);
        } catch (error){
            console.log(`testHitraceApi06 got an error: ${JSON.stringify(error)}`);
            expect().assertFail();
            done();
        }
        console.info('testHitraceApi06 end');
        done();
    })

    /**
     * @tc.name   testHitraceApi07
     * @tc.number DFX_DFT_Hitrace_JS_007
     * @tc.desc   hitrace begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHitraceApi07', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        console.info('testHitraceApi07 start');
        hiTraceChain.clearId();
        try{
            let traceId = hiTraceChain.begin("hitrace07", hiTraceChain.HiTraceFlag.D2D_TP_INFO);
            let enabledDoNotCreateSpanFlag = hiTraceChain.isFlagEnabled(traceId, hiTraceChain.HiTraceFlag.D2D_TP_INFO)
            if(!enabledDoNotCreateSpanFlag){
                expect().assertFail();
                console.log(`testHitraceApi07 got an error: ${JSON.stringify(error)}`);
            }
            hiTraceChain.tracepoint(hiTraceChain.HiTraceCommunicationMode.PROCESS,
                                    hiTraceChain.HiTraceTracepointType.CS, traceId, "hitrace test");
            hiTraceChain.end(traceId);
        } catch (error){
            console.log(`testHitraceApi07 got an error: ${JSON.stringify(error)}`);
            expect().assertFail();
            done();
        }
        console.info('testHitraceApi07 end');
        done();
    })

    /**
     * @tc.name   testHitraceApi08
     * @tc.number DFX_DFT_Hitrace_JS_008
     * @tc.desc   hitrace begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHitraceApi08', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        console.info('testHitraceApi08 start');
        hiTraceChain.clearId();
        let traceId = hiTraceChain.begin("testHitraceApi08", hiTraceChain.HiTraceFlag.INCLUDE_ASYNC);
        let curChainId = traceId.chainId;
        new Promise(function(resolve, reject){
            resolve()
        }).then(() => {
            console.info('in testHitraceApi08 then callback')
            console.info(`testHitraceApi08 ${hiTraceChain.getId().chainId} <> ${curChainId}`)
            expect(hiTraceChain.getId().chainId == curChainId).assertTrue()
            done()
        })
        hiTraceChain.end(traceId);
        done()
        console.info('testHitraceApi08 end');

    })

    /**
     * @tc.name   testHitraceApi09
     * @tc.number DFX_DFT_Hitrace_JS_009
     * @tc.desc   hitrace begin interface test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHitraceApi09', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        console.info('testHitraceApi09 start');
        hiTraceChain.clearId();
        let traceId = hiTraceChain.begin("hitrace09", hiTraceChain.HiTraceFlag.INCLUDE_ASYNC);
        let curChainId = traceId.chainId;
        async function asyncTask() {
        }
        asyncTask().then(() => {
            console.info('in testhiTraceApi09 then callback')
            console.info(`testHitraceApi09 ${hiTraceChain.getId().chainId} <> ${curChainId}`)
            expect(hiTraceChain.getId().chainId == curChainId).assertTrue()
            done()
        })
        hiTraceChain.end(traceId);
        done()
        console.info('testHitraceApi09 end');
    })

    /**
     * @tc.name   testHitraceApi10
     * @tc.number DFX_DFT_Hitrace_JS_010
     * @tc.desc   testHitraceApi10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHitraceApi10', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('testHitraceApi10 start')
        hiTraceChain.clearId();
        try {
            let traceId = hiTraceChain.begin("hitrace10", hiTraceChain.HiTraceFlag.D2D_TP_INFO);
            let enabledDoNotCreateSpanFlag = hiTraceChain.isFlagEnabled(traceId, hiTraceChain.HiTraceFlag.D2D_TP_INFO);
            if(!enabledDoNotCreateSpanFlag){
                expect().assertFail();
                console.log(`testHitraceApi10 got an error: ${JSON.stringify(error)}`);
            }
            hiTraceChain.tracepoint(hiTraceChain.HiTraceCommunicationMode.DEVICE,
                                    hiTraceChain.HiTraceTracepointType.CR,traceId, "hitrace test");
            hiTraceChain.end(traceId);
        } catch (error) {
            console.log(`testHitraceApi10 got an error: ${JSON.stringify(error)}`);
            expect().assertFail();
			done()
        }
        console.info('testHitraceApi10 end')
		done()
    });

    /**
     * @tc.name   testHitraceApi11
     * @tc.number DFX_DFT_Hitrace_JS_011
     * @tc.desc   testHitraceApi11
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHitraceApi11', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('testHitraceApi11 start')
		hiTraceChain.setId(12345678);
        hiTraceChain.clearId();
        try {
            let traceId = hiTraceChain.begin("hitrace11", hiTraceChain.HiTraceFlag.D2D_TP_INFO);
			let flags = traceId.flags
			let parentSpanId = traceId.parentSpanId
			let spanId = traceId.spanId
            let enabledDoNotCreateSpanFlag = hiTraceChain.isFlagEnabled(traceId, hiTraceChain.HiTraceFlag.D2D_TP_INFO);
            if(!enabledDoNotCreateSpanFlag){
                expect().assertFail();
                console.log(`testHitraceApi11 got an error: ${JSON.stringify(error)}`);
            }
            hiTraceChain.tracepoint(hiTraceChain.HiTraceCommunicationMode.DEFAULT,
                                    hiTraceChain.HiTraceTracepointType.SR, traceId, "hitrace test");
            hiTraceChain.end(traceId);
        } catch (error) {
            console.log(`testHitraceApi11 got an error: ${JSON.stringify(error)}`);
            expect().assertFail();
			done()
        }
        console.info('testHitraceApi11 end')
		done()
    });

    /**
     * @tc.name   testHitraceApi12
     * @tc.number DFX_DFT_Hitrace_JS_012
     * @tc.desc   testHitraceApi12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHitraceApi12', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('testHitraceApi12 start')
        try {
            let traceId = hiTraceChain.begin("hitrace12", hiTraceChain.HiTraceFlag.D2D_TP_INFO);
            let enabledDoNotCreateSpanFlag = hiTraceChain.isFlagEnabled(traceId, hiTraceChain.HiTraceFlag.D2D_TP_INFO);
            expect(enabledDoNotCreateSpanFlag).assertTrue()
            if(!enabledDoNotCreateSpanFlag){
                expect().assertFail();
                console.log(`testHitraceApi12 got an error: ${JSON.stringify(error)}`);
            }
            hiTraceChain.tracepoint(hiTraceChain.HiTraceCommunicationMode.DEVICE,
                                    hiTraceChain.HiTraceTracepointType.GENERAL, traceId, "hitrace test");
            hiTraceChain.end(traceId);
        } catch (error) {
            console.log(`testHitraceApi12 got an error: ${JSON.stringify(error)}`);
            expect().assertFail();
			done()
        }
        console.info('testHitraceApi12 end')
		done()
    });
    
    /**
     * @tc.name   testHitraceApi013
     * @tc.number DFX_DFT_Hitrace_JS_01300
     * @tc.desc   testHitraceApi013
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHitraceApi013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        console.info('testHitraceApi013 start');
        let traceId = hiTraceChain.begin(null);
        let traceIdIsvalid = hiTraceChain.isValid(traceId);
        expect(traceIdIsvalid).assertFalse()
        console.info('testHitraceApi013 end');
        done();
    })
    
     /**
      * @tc.name   testHitraceApi014
      * @tc.number DFX_DFT_Hitrace_JS_01400
      * @tc.desc   testHitraceApi014
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
     it('testHitraceApi014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        console.info('testHitraceApi014 start');
        let traceId = hiTraceChain.begin(undefined);
        let traceIdIsvalid = hiTraceChain.isValid(traceId);
        let enabledDoNotCreateSpanFlag = hiTraceChain.isFlagEnabled(traceId, hiTraceChain.HiTraceFlag.D2D_TP_INFO);
        expect(traceIdIsvalid).assertFalse()
        expect(enabledDoNotCreateSpanFlag).assertFalse()
        console.info('testHitraceApi014 end');
        done();
    })
    
     /**
      * @tc.name   testHitraceApi015
      * @tc.number DFX_DFT_Hitrace_JS_01500
      * @tc.desc   testHitraceApi015
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
     it('testHitraceApi015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        console.info('testHitraceApi015 start');
        try{
            let traceId = hiTraceChain.begin("1234567890qwertyuiopasdfghjklzxcvbnm");
            let traceIdIsvalid = hiTraceChain.isValid(traceId);
            expect(traceIdIsvalid).assertTrue()
            if(!traceIdIsvalid){
                expect().assertFail();
                console.log(`testHitraceApi015 got an error: ${JSON.stringify(error)}`);
            }
            hiTraceChain.end(traceId);
        } catch (error){
            console.log(`testHitraceApi015 got an error: ${JSON.stringify(error)}`);
            expect().assertFail();
            done();
        }
        console.info('testHitraceApi015 end');
        done();
    })
    
     /**
      * @tc.name   testHitraceApi016
      * @tc.number DFX_DFT_Hitrace_JS_01600
      * @tc.desc   testHitraceApi016
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
     it('testHitraceApi016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        console.info('testHitraceApi016 start');
        try{
            let traceId = hiTraceChain.begin("1234567890qwertyuiopasdfghjklzxcvbnm1234567890qwertyuiopasdfghjklzxcvbnm1234567890qwertyuiopasdfghjklzxcvbnm12345678901234567890");
            let traceIdIsvalid = hiTraceChain.isValid(traceId);
            if(!traceIdIsvalid){
                expect().assertFail();
                console.log(`testHitraceApi016 got an error: ${JSON.stringify(error)}`);
            }
            hiTraceChain.end(traceId);
        } catch (error){
            console.log(`testHitraceApi016 got an error: ${JSON.stringify(error)}`);
            expect().assertFail();
            done();
        }
        console.info('testHitraceApi016 end');
        done();
    })
    
     /**
      * @tc.name   testHitraceApi017
      * @tc.number DFX_DFT_Hitrace_JS_01700
      * @tc.desc   testHitraceApi017
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
     it('testHitraceApi017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        console.info('testHitraceApi017 start');
        try{
            let traceId = hiTraceChain.begin("");
            let traceIdIsvalid = hiTraceChain.isValid(traceId);
            if(!traceIdIsvalid){
                expect().assertFail();
                console.log(`testHitraceApi017 got an error: ${JSON.stringify(error)}`);
            }
            hiTraceChain.end(traceId);
        } catch (error){
            console.log(`testHitraceApi017 got an error: ${JSON.stringify(error)}`);
            expect().assertFail();
            done();
        }
        console.info('testHitraceApi017 end');
        done();
    })
    
     /**
      * @tc.name   testHitraceApi018
      * @tc.number DFX_DFT_Hitrace_JS_01800
      * @tc.desc   testHitraceApi018
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
     it('testHitraceApi018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        console.info('testHitraceApi018 start');
        try{
            let traceId = hiTraceChain.begin(" ");
            let traceIdIsvalid = hiTraceChain.isValid(traceId);
            if(!traceIdIsvalid){
                expect().assertFail();
                console.log(`testHitraceApi018 got an error: ${JSON.stringify(error)}`);
            }
            hiTraceChain.end(traceId);
        } catch (error){
            console.log(`testHitraceApi018 got an error: ${JSON.stringify(error)}`);
            expect().assertFail();
            done();
        }
        console.info('testHitraceApi018 end');
        done();
    })
    
     /**
      * @tc.name   testHitraceApi019
      * @tc.number DFX_DFT_Hitrace_JS_01900
      * @tc.desc   testHitraceApi019
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
     it('testHitraceApi019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        console.info('testHitraceApi019 start');
        try{
            let traceId = hiTraceChain.begin("default");
            let traceIdIsvalid = hiTraceChain.isValid(traceId);
            if(!traceIdIsvalid){
                expect().assertFail();
                console.log(`testHitraceApi019 got an error: ${JSON.stringify(error)}`);
            }
            hiTraceChain.end(traceId);
        } catch (error){
            console.log(`testHitraceApi019 got an error: ${JSON.stringify(error)}`);
            expect().assertFail();
            done();
        }
        console.info('testHitraceApi019 end');
        done();
    })
    
     /**
      * @tc.name   testHitraceApi020
      * @tc.number DFX_DFT_Hitrace_JS_02000
      * @tc.desc   testHitraceApi020
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
     it('testHitraceApi020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        console.info('testHitraceApi020 start');
        try{
            let traceId = hiTraceChain.begin("华为");
            let traceIdIsvalid = hiTraceChain.isValid(traceId);
            if(!traceIdIsvalid){
                expect().assertFail();
                console.log(`testHitraceApi020 got an error: ${JSON.stringify(error)}`);
            }
            hiTraceChain.end(traceId);
        } catch (error){
            console.log(`testHitraceApi020 got an error: ${JSON.stringify(error)}`);
            expect().assertFail();
            done();
        }
        console.info('testHitraceApi020 end');
        done();
    })
    
     /**
      * @tc.name   testHitraceApi021
      * @tc.number DFX_DFT_Hitrace_JS_02100
      * @tc.desc   testHitraceApi021
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
     it('testHitraceApi021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        console.info('testHitraceApi021 start');
        try{
            let traceId = hiTraceChain.begin("hitrace03", hiTraceChain.HiTraceFlag.TP_INFO);
            let curTraceId = hiTraceChain.getId();
            if(traceId.chainId != curTraceId.chainId){
                expect().assertFail();
                console.log(`testHitraceApi021 got an error: ${JSON.stringify(error)}`);
            }
            hiTraceChain.tracepoint(hiTraceChain.HiTraceCommunicationMode.DEFAULT,
                                    hiTraceChain.HiTraceTracepointType.SS, traceId, "hitrace api test.");
            hiTraceChain.end(traceId);
        } catch (error){
            console.log(`testHitraceApi021 got an error: ${JSON.stringify(error)}`);
            expect().assertFail();
            done();
        }
        console.info('testHitraceApi021 end');
        done();
    })
    
     /**
      * @tc.name   testHitraceApi022
      * @tc.number DFX_DFT_Hitrace_JS_02200
      * @tc.desc   testHitraceApi022
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
     it('testHitraceApi022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        console.info('testHitraceApi022 start');
        try{
            let traceId = hiTraceChain.begin("hitrace03", hiTraceChain.HiTraceFlag.TP_INFO);
            let curTraceId = hiTraceChain.getId();
            if(traceId.chainId != curTraceId.chainId){
                expect().assertFail();
                console.log(`testHitraceApi022 got an error: ${JSON.stringify(error)}`);
            }
            hiTraceChain.tracepoint(hiTraceChain.HiTraceCommunicationMode.PROCESS,
                                    hiTraceChain.HiTraceTracepointType.SS, traceId, "hitrace api test.");
            hiTraceChain.end(traceId);
        } catch (error){
            console.log(`testHitraceApi022 got an error: ${JSON.stringify(error)}`);
            expect().assertFail();
            done();
        }
        console.info('testHitraceApi022 end');
        done();
    })
    
     /**
      * @tc.name   testHitraceApi023
      * @tc.number DFX_DFT_Hitrace_JS_02300
      * @tc.desc   testHitraceApi023
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
     it('testHitraceApi023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        console.info('testHitraceApi023 start');
        try{
            let traceId = hiTraceChain.begin("testHitraceApi023", hiTraceChain.HiTraceFlag.TP_INFO);
            let curTraceId = hiTraceChain.getId();
            if(traceId.chainId != curTraceId.chainId){
                expect().assertFail();
                console.log(`testHitraceApi023 got an error: ${JSON.stringify(error)}`);
            }
            hiTraceChain.tracepoint(hiTraceChain.HiTraceCommunicationMode.DEVICE,
                                    hiTraceChain.HiTraceTracepointType.SS, traceId, "hitrace api test.");
            hiTraceChain.end(traceId);
        } catch (error){
            console.log(`testHitraceApi023 got an error: ${JSON.stringify(error)}`);
            expect().assertFail();
            done();
        }
        console.info('testHitraceApi023 end');
        done();
    })
    
     /**
      * @tc.name   testHitraceApi024
      * @tc.number DFX_DFT_Hitrace_JS_02400
      * @tc.desc   testHitraceApi024
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
     it('testHitraceApi024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        console.info('testHitraceApi024 start');
        try{
            let traceId = hiTraceChain.begin("testHitraceApi024", hiTraceChain.HiTraceFlag.TP_INFO);
            let curTraceId = hiTraceChain.getId();
            if(traceId.chainId != curTraceId.chainId){
                expect().assertFail();
                console.log(`testHitraceApi024 got an error: ${JSON.stringify(error)}`);
            }
            hiTraceChain.tracepoint(hiTraceChain.HiTraceCommunicationMode.DEVICE,
                                    hiTraceChain.HiTraceTracepointType.CS, traceId, "hitrace api test.");
            hiTraceChain.end(traceId);
        } catch (error){
            console.log(`testHitraceApi024 got an error: ${JSON.stringify(error)}`);
            expect().assertFail();
            done();
        }
        console.info('testHitraceApi024 end');
        done();
    })
    
     /**
      * @tc.name   testHitraceApi025
      * @tc.number DFX_DFT_Hitrace_JS_02500
      * @tc.desc   testHitraceApi025
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
     it('testHitraceApi025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        console.info('testHitraceApi025 start');
        try{
            let traceId = hiTraceChain.begin("testHitraceApi025", hiTraceChain.HiTraceFlag.TP_INFO);
            let curTraceId = hiTraceChain.getId();
            if(traceId.chainId != curTraceId.chainId){
                expect().assertFail();
                console.log(`testHitraceApi025 got an error: ${JSON.stringify(error)}`);
            }
            hiTraceChain.tracepoint(hiTraceChain.HiTraceCommunicationMode.DEVICE,
                                    hiTraceChain.HiTraceTracepointType.CR, traceId, "hitrace api test.");
            hiTraceChain.end(traceId);
        } catch (error){
            console.log(`testHitraceApi025 got an error: ${JSON.stringify(error)}`);
            expect().assertFail();
            done();
        }
        console.info('testHitraceApi025 end');
        done();
    })
    
     /**
      * @tc.name   testHitraceApi026
      * @tc.number DFX_DFT_Hitrace_JS_02600
      * @tc.desc   testHitraceApi026
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
     it('testHitraceApi026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        console.info('testHitraceApi026 start');
        try{
            let traceId = hiTraceChain.begin("testHitraceApi026", hiTraceChain.HiTraceFlag.TP_INFO);
            let curTraceId = hiTraceChain.getId();
            if(traceId.chainId != curTraceId.chainId){
                expect().assertFail();
                console.log(`testHitraceApi026 got an error: ${JSON.stringify(error)}`);
            }
            hiTraceChain.tracepoint(hiTraceChain.HiTraceCommunicationMode.DEVICE,
                                    hiTraceChain.HiTraceTracepointType.SR, traceId, "hitrace api test.");
            hiTraceChain.end(traceId);
        } catch (error){
            console.log(`testHitraceApi026 got an error: ${JSON.stringify(error)}`);
            expect().assertFail();
            done();
        }
        console.info('testHitraceApi026 end');
        done();
    })
    
     /**
      * @tc.name   testHitraceApi027
      * @tc.number DFX_DFT_Hitrace_JS_02700
      * @tc.desc   testHitraceApi027
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
     it('testHitraceApi027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        console.info('testHitraceApi027 start');
        try{
            let traceId = hiTraceChain.begin("testHitraceApi027", hiTraceChain.HiTraceFlag.TP_INFO);
            let curTraceId = hiTraceChain.getId();
            if(traceId.chainId != curTraceId.chainId){
                expect().assertFail();
                console.log(`testHitraceApi027 got an error: ${JSON.stringify(error)}`);
            }
            hiTraceChain.tracepoint(hiTraceChain.HiTraceCommunicationMode.DEVICE,
                                    hiTraceChain.HiTraceTracepointType.GENERAL, traceId, "hitrace api test.");
            hiTraceChain.end(traceId);
        } catch (error){
            console.log(`testHitraceApi027 got an error: ${JSON.stringify(error)}`);
            expect().assertFail();
            done();
        }
        console.info('testHitraceApi027 end');
        done();
    })
})
}
