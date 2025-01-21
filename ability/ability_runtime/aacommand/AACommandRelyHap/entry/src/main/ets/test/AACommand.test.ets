
/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
 
import { describe, it, expect } from '@ohos/hypium'

export default function abilityTest() {
    describe('AACommandTest', function () {
        /**
         * @tc.number: ACTS_AACommand_finishTest_01_0100
         * @tc.name: Each parameter of the test command is valid, and the finishTest interface is called
         *           in AsyncCallback mode.
         *           The msg parameter is valid (including Chinese and special characters) and the code parameter
         *           is valid (1).
         * @tc.desc: Verify that the process of the test framework can be stopped by calling this interface.
         */
         it('ACTS_AACommand_finish_01_0100', 0, async function (done) {
            done()
            var msg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146ACTS_AACommand_finish_01_0100'
            globalThis.abilityDelegator.finishTest(msg, 1,()=>{
                console.log("ACTS_AACommand_finish_01_0100 finishTest  test  end ========> callback " )
               
            })
        })

        /**
         * @tc.number: ACTS_AACommand_finishTest_01_0200
         * @tc.name: The parameters of the test command are valid, and the finishTest interface is called in AsyncCallback
         *           mode. The msg parameter is invalid (null) and the code parameter is valid (1)
         * @tc.desc: Verify that the process of the test framework can be stopped by calling this interface.
         */
        it('ACTS_AACommand_finish_01_0200', 0, async function (done) {
            done();
            var code = globalThis.abilityDelegator.finishTest(null, 1,()=>{
                console.log(" ACTS_AACommand_finish_01_0200 finishTest  test  end ========> callback " )
                expect().assertFail();
            })
            setTimeout(() => {
                console.log('ACTS_AACommand_finish_01_0200 code:'+JSON.stringify(code))
                if(code!=undefined){
                    console.log('ACTS_AACommand_finish_01_0200 start failed')
                    expect().assertFail();
                }
            }, 3000)
        })

        /**
         * @tc.number: ACTS_AACommand_finishTest_01_0300
         * @tc.name: The parameters of the test command are valid, and the finishTest interface is called in AsyncCallback
         *           mode. The msg parameter is invalid (Undefined) and the code parameter is valid (1)
         * @tc.desc: Verify that the process of the test framework can be stopped by calling this interface.
         */
        it('ACTS_AACommand_finish_01_0300', 0, async function (done) {
            var code = globalThis.abilityDelegator.finishTest(undefined, 1,()=>{
                console.log(" ACTS_AACommand_finish_01_0300 finishTest  test  end ========> callback " )
                expect().assertFail();
            })
            setTimeout(() => {
                console.log('ACTS_AACommand_finish_01_0300 code:'+JSON.stringify(code))
                if(code!=undefined){
                    console.log('ACTS_AACommand_finish_01_0300 start failed')
                    expect().assertFail();
                }
                done();
            }, 3000)
        })

        /**
         * @tc.number: ACTS_AACommand_finishTest_01_0400
         * @tc.name: The parameters of the test command are valid, and the finishTest interface is called in AsyncCallback
         *           mode. The msg parameter is invalid(including Chinese and special characters) and the code parameter
         *           is valid (Number.MAX_VALUE)
         * @tc.desc: Verify that the process of the test framework can be stopped by calling this interface.
         */
        it('ACTS_AACommand_finish_01_0400', 0, async function (done) {
            done()
            var msg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146'
            globalThis.abilityDelegator.finishTest(msg, Number.MAX_VALUE,()=>{
                console.log("ACTS_AACommand_finish_01_0400 finishTest  test  end ========> callback " )
            })
        })

        /**
         * @tc.number: ACTS_AACommand_finishTest_01_0500
         * @tc.name: The parameters of the test command are valid, and the finishTest interface is called in AsyncCallback
         *           mode. The msg parameter is invalid(including Chinese and special characters) and the code parameter
         *           is valid (Number.MIN_VALUE)
         * @tc.desc: Verify that the process of the test framework can be stopped by calling this interface.
         */
        it('ACTS_AACommand_finish_01_0500', 0, async function (done) {
            done()
            var msg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146'
            globalThis.abilityDelegator.finishTest(msg, Number.MIN_VALUE,()=>{
                console.log("ACTS_AACommand_finish_01_0500 finishTest  test  end ========> callback " )
            })
        })

        /**
         * @tc.number: ACTS_AACommand_finishTest_01_0600
         * @tc.name: The parameters of the test command are valid, and the finishTest interface is called in AsyncCallback
         *           mode. The msg parameter is invalid(including Chinese and special characters) and the code parameter
         *           is valid (Number.MAX_VALUE+1)
         * @tc.desc: Verify that the process of the test framework can be stopped by calling this interface.
         */
        it('ACTS_AACommand_finish_01_0600', 0, async function (done) {
            done()
            var msg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146'
            globalThis.abilityDelegator.finishTest(msg, (Number.MIN_VALUE+1),()=>{
                console.log("ACTS_AACommand_finish_01_0600 finishTest  test  end ========> callback " )
            })
        })

        /**
         * @tc.number: ACTS_AACommand_finishTest_01_0700
         * @tc.name: The parameters of the test command are valid, and the finishTest interface is called in AsyncCallback
         *           mode. The msg parameter is invalid(including Chinese and special characters) and the code parameter
         *           is valid (Number.MIN_VALUE-1)
         * @tc.desc: Verify that the process of the test framework can be stopped by calling this interface.
         */
        it('ACTS_AACommand_finish_01_0700', 0, async function (done) {
            done()
            var msg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146'
            globalThis.abilityDelegator.finishTest(msg, (Number.MIN_VALUE-1),()=>{
                console.log("ACTS_AACommand_finish_01_0700 finishTest  test  end ========> callback " )
            })
        })

        /**
         * @tc.number: ACTS_AACommand_finishTest_01_0800
         * @tc.name: The parameters of the test command are valid, and the finishTest interface is called in AsyncCallback
         *           mode. The msg parameter is invalid(including Chinese and special characters) and the
         *           code parameter is valid (“ABCD”)
         * @tc.desc: Verify that the process of the test framework is not stopped by calling this interface.
         */
        it('ACTS_AACommand_finish_01_0800', 0, async function (done) {
            done();
            var msg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146'
            globalThis.abilityDelegator.finishTest(msg, 'ABCD',()=>{
                console.log(" ACTS_AACommand_finish_01_0800 finishTest  test  end ========> callback " )
                expect().assertFail();
            })
            
        })

        /**
         * @tc.number: ACTS_AACommand_finishTest_01_0900
         * @tc.name: The parameters of the test command are valid, and the finishTest interface is called in Promise
         *           mode. The msg parameter is valid(including Chinese and special characters) and the code parameter
         *           is valid (1)
         * @tc.desc: Verify that the process of the test framework can be stopped by calling this interface.
         */
        it('ACTS_AACommand_finish_01_0900', 0, async function (done) {
            done()
            var msg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146'
            globalThis.abilityDelegator.finishTest(msg, 1).then(() => {
                console.log("ACTS_AACommand_finish_01_0900 finishTest  test  end ========> callback " )
                
            })
        })

        /**
         * @tc.number: ACTS_AACommand_finishTest_01_1000
         * @tc.name: The parameters of the test command are valid, and the finishTest interface is called in Promise
         *           mode. The msg parameter is invalid(null) and the code parameter is valid (1)
         * @tc.desc: Verify that the process of the test framework can be stopped by calling this interface.
         */
        it('ACTS_AACommand_finish_01_1000', 0, async function (done) {
            done()
            globalThis.abilityDelegator.finishTest(null, 1)
            
        })

        /**
         * @tc.number: ACTS_AACommand_finishTest_01_1100
         * @tc.name: The parameters of the test command are valid, and the finishTest interface is called in Promise
         *           mode. The msg parameter is invalid(undefined) and the code parameter is valid (1)
         * @tc.desc: Verify that the process of the test framework can be stopped by calling this interface.
         */
        it('ACTS_AACommand_finish_01_1100', 0, async function (done) {
            done()
            globalThis.abilityDelegator.finishTest(undefined, 1)
            
        })

        /**
         * @tc.number: ACTS_AACommand_finishTest_01_1200
         * @tc.name: The parameters of the test command are valid, and the finishTest interface is called in Promise
         *           mode. The msg parameter is valid(including Chinese and special characters) and the code parameter
         *           is valid (Number.MAX_VALUE)
         * @tc.desc: Verify that the process of the test framework can be stopped by calling this interface.
         */
        it('ACTS_AACommand_finish_01_1200', 0, async function (done) {
            done()
            var msg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146'
            globalThis.abilityDelegator.finishTest(msg, Number.MAX_VALUE).then(()=>{
                console.log("ACTS_AACommand_finish_01_1200 finishTest  test  end ========> callback " )
            })
        })

        /**
         * @tc.number: ACTS_AACommand_finishTest_01_1300
         * @tc.name: The parameters of the test command are valid, and the finishTest interface is called in Promise
         *           mode. The msg parameter is valid(including Chinese and special characters) and the code parameter
         *           is valid (Number.MIN_VALUE)
         * @tc.desc: Verify that the process of the test framework can be stopped by calling this interface.
         */
        it('ACTS_AACommand_finish_01_1300', 0, async function (done) {
            done()
            var msg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146'
            globalThis.abilityDelegator.finishTest(msg, Number.MIN_VALUE).then(()=>{
                console.log("ACTS_AACommand_finish_01_1300 finishTest  test  end ========> callback " )
                done()
            })
        })

        /**
         * @tc.number: ACTS_AACommand_finishTest_01_1400
         * @tc.name: The parameters of the test command are valid, and the finishTest interface is called in Promise
         *           mode. The msg parameter is valid(including Chinese and special characters) and the code parameter
         *           is valid (Number.MAX_VALUE+1)
         * @tc.desc: Verify that the process of the test framework can be stopped by calling this interface.
         */
        it('ACTS_AACommand_finish_01_1400', 0, async function (done) {
            done()
            var msg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146'
            globalThis.abilityDelegator.finishTest(msg, Number.MIN_VALUE+1).then(()=>{
                console.log("ACTS_AACommand_finish_01_1400 finishTest  test  end ========> callback " )
            })
        })

        /**
         * @tc.number: ACTS_AACommand_finishTest_01_1500
         * @tc.name: The parameters of the test command are valid, and the finishTest interface is called in Promise
         *           mode. The msg parameter is valid(including Chinese and special characters) and the code parameter
         *           is valid (Number.MIN_VALUE-1)
         * @tc.desc: Verify that the process of the test framework can be stopped by calling this interface.
         */
        it('ACTS_AACommand_finish_01_1500', 0, async function (done) {
            done()
            var msg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146'
            globalThis.abilityDelegator.finishTest(msg, Number.MIN_VALUE-1).then(()=>{
                console.log("ACTS_AACommand_finish_01_1500 finishTest  test  end ========> callback " )
            })
        })

        /**
         * @tc.number: ACTS_AACommand_finishTest_01_1600
         * @tc.name: The parameters of the test command are valid, and the finishTest interface is called in Promise
         *           mode. The msg parameter is valid(including Chinese and special characters) and the code parameter
         *           is valid (ABCD)
         * @tc.desc: Verify that the process of the test framework can be stopped by calling this interface.
         */
        it('ACTS_AACommand_finish_01_1600', 0, async function (done) {
            var code = null
            var msg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146'
            code = globalThis.abilityDelegator.finishTest(msg, 'ABCD')
            setTimeout(() => {
                console.log('ACTS_AACommand_finish_01_1600 code:'+JSON.stringify(code))
                if(code!=undefined){
                    console.log('ACTS_AACommand_finish_01_1600 start failed')
                    expect().assertFail();
                }
                done();
            }, 3000)
        })
    })
};

