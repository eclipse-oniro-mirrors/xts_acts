
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
 
import { describe, it, Level } from '@ohos/hypium'

export default function abilityTest() {
    describe('AACommandPrintOneTest', () => {
         /**
          * @tc.name   ACTS_AACommand_print_01_0100
          * @tc.number ACTS_AACommand_print_01_0100
          * @tc.desc   Verify that the test framework can be started normally and the logs can be output normally through
          * @tc.type   FUNCTION
          * @tc.size   MEDIUMTEST
          * @tc.level  LEVEL0
          */
         it('ACTS_AACommand_print_01_0100', Level.LEVEL0, async (done: Function) => {
            console.log("ACTS_AACommand_print_01_0100 start ====> " )
            done()
            let msg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146'
            globalThis.abilityDelegator.print(msg,()=>{
                console.log("ACTS_AACommand_print_01_0100 print  test  end ========> callback " )
                //console.log("ACTS_AACommand_print_01_0100 print  test  end ========> callback err: "+JSON.stringify(err) )
                //console.log("ACTS_AACommand_print_01_0100 print  test  end ========> callback data: "+JSON.stringify(data))
            })
            let finishmsg = 'ACTS_AACommand_print_01_0100 end'
            globalThis.abilityDelegator.finishTest(finishmsg, 1).then(()=>{
                console.log("ACTS_AACommand_print_01_0100 finishTest  test  end ========> callback " )
                //console.log("ACTS_AACommand_print_01_0100 finishTest  test  end ========> callback data: "+JSON.stringify(data))
            })
        })

        /**
         * @tc.name   ACTS_AACommand_print_01_0200
         * @tc.number ACTS_AACommand_print_01_0200
         * @tc.desc   Verify that the test framework can be started normally and the logs can be output normally through
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('ACTS_AACommand_print_01_0200', Level.LEVEL0, async (done: Function) => {
            done()
            let msg = '0callbackaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            'aaaaaaaaaa' +
            '1aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '2aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '3aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '4aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '5aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '6aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '7aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '8aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '9aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaae'
            globalThis.abilityDelegator.print(msg,()=>{
                console.log("print  test  end ========> callback " )
            })
            let finishmsg = 'ACTS_AACommand_print_01_0200 end'
            globalThis.abilityDelegator.finishTest(finishmsg, 1).then(()=>{
                console.log("ACTS_AACommand_print_01_0200 print  test  end ========> callback " )
            })
        })

        /**
         * @tc.name   ACTS_AACommand_print_01_0300
         * @tc.number ACTS_AACommand_print_01_0300
         * @tc.desc   Verify that the test framework can be started normally and the logs can be output normally through
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('ACTS_AACommand_print_01_0300', Level.LEVEL0, async (done: Function) => {
            done()
            let msg = '0callbackaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '1aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '2aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '3aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '4aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '5aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '6aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '7aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '8aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '9aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaae'
            let end = 'fffffffffff'
            let start = ''
            for(let i=0 ; i<10; i++) {
              start = start + msg;
            }
            console.log("ACTS_AACommand_print_01_0700 print  start length ========> " + start.length)
            console.log("ACTS_AACommand_print_01_0700 print  end length ========> " + end.length)
            globalThis.abilityDelegator.print(start + end).then(()=>{
              console.log("ACTS_AACommand_print_01_0700 print  test  end ========> callback " )
            })
            let finishmsg = 'ACTS_AACommand_print_01_0300 end'
            globalThis.abilityDelegator.finishTest(finishmsg, 1).then(()=>{
                console.log("ACTS_AACommand_print_01_0300 print  test  end ========> callback " )
            })
        })

        /**
         * @tc.name   ACTS_AACommand_print_01_0400
         * @tc.number ACTS_AACommand_print_01_0400
         * @tc.desc   Verify that the test framework can be started normally and the logs can be output normally through
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('ACTS_AACommand_print_01_0400', Level.LEVEL0, async (done: Function) => {
            done()
            globalThis.abilityDelegator.print(null,()=>{
                console.log("print  test  end ========> callback " )
            })
            let finishmsg = 'ACTS_AACommand_print_01_0400 end'
            globalThis.abilityDelegator.finishTest(finishmsg, 1).then(()=>{
                console.log("ACTS_AACommand_print_01_0400 print  test  end ========> callback " )
            })
        })

        /**
         * @tc.name   ACTS_AACommand_print_01_0500
         * @tc.number ACTS_AACommand_print_01_0500
         * @tc.desc   Verify that the test framework can be started normally and the logs can be output normally through
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('ACTS_AACommand_print_01_0500', Level.LEVEL0, async (done: Function) => {
            done()
            let msg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146'
            globalThis.abilityDelegator.print(msg).then(()=>{
                console.log("ACTS_AACommand_print_01_0500 print  test  end ========> callback " )
            })
            let finishmsg = 'ACTS_AACommand_print_01_0500 end'
            globalThis.abilityDelegator.finishTest(finishmsg, 1).then(()=>{
                console.log("ACTS_AACommand_print_01_0500 print  test  end ========> callback " )
            })
        })

        /**
         * @tc.name   ACTS_AACommand_print_01_0600
         * @tc.number ACTS_AACommand_print_01_0600
         * @tc.desc   Verify that the test framework can be started normally and the logs can be output normally
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('ACTS_AACommand_print_01_0600', Level.LEVEL0, async (done: Function) => {
            done()
            let msg = '0callbackaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '1aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '2aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '3aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '4aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '5aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '6aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '7aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '8aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '9aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaae'
            globalThis.abilityDelegator.print(msg).then(()=>{
                console.log("ACTS_AACommand_print_01_0600 print  test  end ========> callback " )
            })
            let finishmsg = 'ACTS_AACommand_print_01_0600 end'
            globalThis.abilityDelegator.finishTest(finishmsg, 1).then(()=>{
                console.log("ACTS_AACommand_print_01_0600 2 print  test  end ========> callback " )
            })
        })

        /**
         * @tc.name   ACTS_AACommand_print_01_0700
         * @tc.number ACTS_AACommand_print_01_0700
         * @tc.desc   Verify that the test framework can be started normally and the logs can be output normally through
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('ACTS_AACommand_print_01_0700', Level.LEVEL0, async (done: Function) => {
            done()
            let msg = '0callbackaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '1aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '2aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '3aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '4aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '5aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '6aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '7aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '8aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '9aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaae'
            let end = 'fffffffffff'
            let start = ''
            for(let i=0 ; i<10; i++) {
              start = start + msg;
            }
            console.log("ACTS_AACommand_print_01_0700 print  start length ========> " + start.length)
            console.log("ACTS_AACommand_print_01_0700 print  end length ========> " + end.length)
            globalThis.abilityDelegator.print(start + end,()=>{
              console.log("print  test  end ========> callback " )
            })
            let finishmsg = 'ACTS_AACommand_print_01_0700 end'
            globalThis.abilityDelegator.finishTest(finishmsg, 1).then(()=>{
                console.log("ACTS_AACommand_print_01_0700 2 print  test  end ========> callback " )
            })
        })

        /**
         * @tc.name   ACTS_AACommand_print_01_0800
         * @tc.number ACTS_AACommand_print_01_0800
         * @tc.desc   Verify that the test framework can be started normally and the logs can be output normally
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('ACTS_AACommand_print_01_0800', Level.LEVEL0, async (done: Function) => {
            done()
            globalThis.abilityDelegator.print("").then(()=>{
                console.log("ACTS_AACommand_print_01_0800 print  test  end ========> callback " )
            })
            let finishmsg = 'ACTS_AACommand_print_01_0800 end'
            globalThis.abilityDelegator.finishTest(finishmsg, 1).then(()=>{
                console.log("ACTS_AACommand_print_01_0800 2 print  test  end ========> callback " )
            })
        })
    })
};

