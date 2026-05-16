
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
 
import { describe, it, expect, Level } from '@ohos/hypium'

export default function abilityTest() {
    describe('AACommandTest', () => {
         /**
          * @tc.name   ACTS_AACommand_finish_01_0100
          * @tc.number ACTS_AACommand_finishTest_01_0100
          * @tc.desc   Verify that the process of the test framework can be stopped by calling this interface.
          * @tc.type   FUNCTION
          * @tc.size   MEDIUMTEST
          * @tc.level  LEVEL0
          */
         it('ACTS_AACommand_finish_01_0100', Level.LEVEL0, async (done: Function) => {
            let msg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146ACTS_AACommand_finish_01_0100'
            globalThis.abilityDelegator.finishTest(msg, 1,()=>{
                console.log("ACTS_AACommand_finish_01_0100 finishTest  test  end ========> callback " )
                done()
            })
        })

        /**
         * @tc.name   ACTS_AACommand_finish_01_0200
         * @tc.number ACTS_AACommand_finishTest_01_0200
         * @tc.desc   Verify that the process of the test framework can be stopped by calling this interface.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('ACTS_AACommand_finish_01_0200', Level.LEVEL0, async (done: Function) => {
            done();
            let code:string = globalThis.abilityDelegator.finishTest(null, 1,()=>{
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
         * @tc.name   ACTS_AACommand_finish_01_0300
         * @tc.number ACTS_AACommand_finishTest_01_0300
         * @tc.desc   Verify that the process of the test framework can be stopped by calling this interface.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('ACTS_AACommand_finish_01_0300', Level.LEVEL0, async (done: Function) => {
            let code:string = globalThis.abilityDelegator.finishTest(undefined, 1,()=>{
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
         * @tc.name   ACTS_AACommand_finish_01_0400
         * @tc.number ACTS_AACommand_finishTest_01_0400
         * @tc.desc   Verify that the process of the test framework can be stopped by calling this interface.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('ACTS_AACommand_finish_01_0400', Level.LEVEL0, async (done: Function) => {
            let msg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146'
            globalThis.abilityDelegator.finishTest(msg, Number.MAX_VALUE,()=>{
                console.log("ACTS_AACommand_finish_01_0400 finishTest  test  end ========> callback " )
                done()
            })
        })

        /**
         * @tc.name   ACTS_AACommand_finish_01_0500
         * @tc.number ACTS_AACommand_finishTest_01_0500
         * @tc.desc   Verify that the process of the test framework can be stopped by calling this interface.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('ACTS_AACommand_finish_01_0500', Level.LEVEL0, async (done: Function) => {
            let msg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146'
            globalThis.abilityDelegator.finishTest(msg, Number.MIN_VALUE,()=>{
                console.log("ACTS_AACommand_finish_01_0500 finishTest  test  end ========> callback " )
                done()
            })
        })

        /**
         * @tc.name   ACTS_AACommand_finish_01_0600
         * @tc.number ACTS_AACommand_finishTest_01_0600
         * @tc.desc   Verify that the process of the test framework can be stopped by calling this interface.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('ACTS_AACommand_finish_01_0600', Level.LEVEL0, async (done: Function) => {
            let msg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146'
            globalThis.abilityDelegator.finishTest(msg, (Number.MIN_VALUE+1),()=>{
                console.log("ACTS_AACommand_finish_01_0600 finishTest  test  end ========> callback " )
                done()
            })
        })

        /**
         * @tc.name   ACTS_AACommand_finish_01_0700
         * @tc.number ACTS_AACommand_finishTest_01_0700
         * @tc.desc   Verify that the process of the test framework can be stopped by calling this interface.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('ACTS_AACommand_finish_01_0700', Level.LEVEL0, async (done: Function) => {
            let msg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146'
            globalThis.abilityDelegator.finishTest(msg, (Number.MIN_VALUE-1),()=>{
                console.log("ACTS_AACommand_finish_01_0700 finishTest  test  end ========> callback " )
                done()
            })
        })

        /**
         * @tc.name   ACTS_AACommand_finish_01_0800
         * @tc.number ACTS_AACommand_finishTest_01_0800
         * @tc.desc   Verify that the process of the test framework is not stopped by calling this interface.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('ACTS_AACommand_finish_01_0800', Level.LEVEL0, async (done: Function) => {
            done();
            let msg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146'
            globalThis.abilityDelegator.finishTest(msg, 'ABCD',()=>{
                console.log(" ACTS_AACommand_finish_01_0800 finishTest  test  end ========> callback " )
                expect().assertFail();
            })
            
        })

        /**
         * @tc.name   ACTS_AACommand_finish_01_0900
         * @tc.number ACTS_AACommand_finishTest_01_0900
         * @tc.desc   Verify that the process of the test framework can be stopped by calling this interface.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('ACTS_AACommand_finish_01_0900', Level.LEVEL0, async (done: Function) => {
            let msg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146'
            globalThis.abilityDelegator.finishTest(msg, 1).then(() => {
                console.log("ACTS_AACommand_finish_01_0900 finishTest  test  end ========> callback " )
                done()
            })
        })

        /**
         * @tc.name   ACTS_AACommand_finish_01_1000
         * @tc.number ACTS_AACommand_finishTest_01_1000
         * @tc.desc   Verify that the process of the test framework can be stopped by calling this interface.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('ACTS_AACommand_finish_01_1000', Level.LEVEL0, async (done: Function) => {
            done()
            globalThis.abilityDelegator.finishTest(null, 1)
            
        })

        /**
         * @tc.name   ACTS_AACommand_finish_01_1100
         * @tc.number ACTS_AACommand_finishTest_01_1100
         * @tc.desc   Verify that the process of the test framework can be stopped by calling this interface.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('ACTS_AACommand_finish_01_1100', Level.LEVEL0, async (done: Function) => {
            done()
            globalThis.abilityDelegator.finishTest(undefined, 1)
            
        })

        /**
         * @tc.name   ACTS_AACommand_finish_01_1200
         * @tc.number ACTS_AACommand_finishTest_01_1200
         * @tc.desc   Verify that the process of the test framework can be stopped by calling this interface.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('ACTS_AACommand_finish_01_1200', Level.LEVEL0, async (done: Function) => {
            let msg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146'
            globalThis.abilityDelegator.finishTest(msg, Number.MAX_VALUE).then(()=>{
                console.log("ACTS_AACommand_finish_01_1200 finishTest  test  end ========> callback " )
                done()
            })
        })

        /**
         * @tc.name   ACTS_AACommand_finish_01_1300
         * @tc.number ACTS_AACommand_finishTest_01_1300
         * @tc.desc   Verify that the process of the test framework can be stopped by calling this interface.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('ACTS_AACommand_finish_01_1300', Level.LEVEL0, async (done: Function) => {
            let msg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146'
            globalThis.abilityDelegator.finishTest(msg, Number.MIN_VALUE).then(()=>{
                console.log("ACTS_AACommand_finish_01_1300 finishTest  test  end ========> callback " )
                done()
            })
        })

        /**
         * @tc.name   ACTS_AACommand_finish_01_1400
         * @tc.number ACTS_AACommand_finishTest_01_1400
         * @tc.desc   Verify that the process of the test framework can be stopped by calling this interface.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('ACTS_AACommand_finish_01_1400', Level.LEVEL0, async (done: Function) => {
            let msg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146'
            globalThis.abilityDelegator.finishTest(msg, Number.MIN_VALUE+1).then(()=>{
                console.log("ACTS_AACommand_finish_01_1400 finishTest  test  end ========> callback " )
                done()
            })
        })

        /**
         * @tc.name   ACTS_AACommand_finish_01_1500
         * @tc.number ACTS_AACommand_finishTest_01_1500
         * @tc.desc   Verify that the process of the test framework can be stopped by calling this interface.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('ACTS_AACommand_finish_01_1500', Level.LEVEL0, async (done: Function) => {
            let msg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146'
            globalThis.abilityDelegator.finishTest(msg, Number.MIN_VALUE-1).then(()=>{
                console.log("ACTS_AACommand_finish_01_1500 finishTest  test  end ========> callback " )
                done()
            })
        })

        /**
         * @tc.name   ACTS_AACommand_finish_01_1600
         * @tc.number ACTS_AACommand_finishTest_01_1600
         * @tc.desc   Verify that the process of the test framework can be stopped by calling this interface.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('ACTS_AACommand_finish_01_1600', Level.LEVEL0, async (done: Function) => {
            let code = null
            let msg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146'
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

