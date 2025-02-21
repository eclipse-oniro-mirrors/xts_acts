
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
 
import { describe, it } from '@ohos/hypium'

export default function abilityTest() {
    describe('AACommandPrintOneTest', function () {
        /**
         * @tc.number: ACTS_AACommand_print_01_0100
         * @tc.name: The -b, -p, -s, -w and other parameters of the test command are valid, and the print interface is
         *           called in AsyncCallback mode. The print information includes Chinese, special characters, etc.
         * @tc.desc: Verify that the test framework can be started normally and the logs can be output normally through
         *           the test command.
         */
         it('ACTS_AACommand_print_01_0100', 0, async function (done) {
            console.log("ACTS_AACommand_print_01_0100 start ====> " )
            done()
            var msg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146'
            globalThis.abilityDelegator.print(msg,(err,data)=>{
                console.log("ACTS_AACommand_print_01_0100 print  test  end ========> callback " )
                console.log("ACTS_AACommand_print_01_0100 print  test  end ========> callback err: "+JSON.stringify(err) )
                console.log("ACTS_AACommand_print_01_0100 print  test  end ========> callback data: "+JSON.stringify(data))
            })
            var finishmsg = 'ACTS_AACommand_print_01_0100 end'
            globalThis.abilityDelegator.finishTest(finishmsg, 1).then((data)=>{
                console.log("ACTS_AACommand_print_01_0100 finishTest  test  end ========> callback " )
                console.log("ACTS_AACommand_print_01_0100 finishTest  test  end ========> callback data: "+JSON.stringify(data))
            })
        })

        /**
         * @tc.number: ACTS_AACommand_print_01_0200
         * @tc.name: The -b, -p, -s, -w and other parameters of the test command are valid, and the print interface is
         *           called in AsyncCallback mode. The length of the print message is 1000 characters.
         * @tc.desc: Verify that the test framework can be started normally and the logs can be output normally through
         *           the test command.
         */
        it('ACTS_AACommand_print_01_0200', 0, async function (done) {
            done()
            var msg = '0callbackaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
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
            var finishmsg = 'ACTS_AACommand_print_01_0200 end'
            globalThis.abilityDelegator.finishTest(finishmsg, 1).then(()=>{
                console.log("ACTS_AACommand_print_01_0200 print  test  end ========> callback " )
            })
        })

        /**
         * @tc.number: ACTS_AACommand_print_01_0300
         * @tc.name: The -b, -p, -s, -w and other parameters of the test command are valid, and the print interface is
         *           called in AsyncCallback mode. The length of the print message is greater than 1000 characters.
         * @tc.desc: Verify that the test framework can be started normally and the logs can be output normally through
         *           the test command.
         */
        it('ACTS_AACommand_print_01_0300', 0, async function (done) {
            done()
            var msg = '0callbackaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '1aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '2aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '3aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '4aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '5aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '6aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '7aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '8aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '9aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaae' +
            'fffffffffff'
            globalThis.abilityDelegator.print(msg,()=>{
                console.log("print  test  end ========> callback " )
            })
            var finishmsg = 'ACTS_AACommand_print_01_0300 end'
            globalThis.abilityDelegator.finishTest(finishmsg, 1).then(()=>{
                console.log("ACTS_AACommand_print_01_0300 print  test  end ========> callback " )
            })
        })

        /**
         * @tc.number: ACTS_AACommand_print_01_0400
         * @tc.name: The -b, -p, -s, -w and other parameters of the test command are valid, and the print interface is
         *           called in AsyncCallback mode. print information is null.
         * @tc.desc: Verify that the test framework can be started normally and the logs can be output normally through
         *           the test command.
         */
        it('ACTS_AACommand_print_01_0400', 0, async function (done) {
            done()
            globalThis.abilityDelegator.print(null,()=>{
                console.log("print  test  end ========> callback " )
            })
            var finishmsg = 'ACTS_AACommand_print_01_0400 end'
            globalThis.abilityDelegator.finishTest(finishmsg, 1).then(()=>{
                console.log("ACTS_AACommand_print_01_0400 print  test  end ========> callback " )
            })
        })

        /**
         * @tc.number: ACTS_AACommand_print_01_0500
         * @tc.name: The -b, -p, -s, -w and other parameters of the test command are valid, and the print interface is
         *           called in Promise mode. The print information includes Chinese, special characters, etc.
         * @tc.desc: Verify that the test framework can be started normally and the logs can be output normally through
         *           the test command.
         */
        it('ACTS_AACommand_print_01_0500', 0, async function (done) {
            done()
            var msg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146'
            globalThis.abilityDelegator.print(msg).then(()=>{
                console.log("ACTS_AACommand_print_01_0500 print  test  end ========> callback " )
            })
            var finishmsg = 'ACTS_AACommand_print_01_0500 end'
            globalThis.abilityDelegator.finishTest(finishmsg, 1).then(()=>{
                console.log("ACTS_AACommand_print_01_0500 print  test  end ========> callback " )
            })
        })

        /**
         * @tc.number: ACTS_AACommand_print_01_0600
         * @tc.name: The -b, -p, -s, -w and other parameters of the test command are valid, and the print interface is
         *           called in Promise mode. The length of the print message is 1000 characters.
         * @tc.desc: Verify that the test framework can be started normally and the logs can be output normally
         *           through the test command.
         */
        it('ACTS_AACommand_print_01_0600', 0, async function (done) {
            done()
            var msg = '0callbackaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
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
            var finishmsg = 'ACTS_AACommand_print_01_0600 end'
            globalThis.abilityDelegator.finishTest(finishmsg, 1).then(()=>{
                console.log("ACTS_AACommand_print_01_0600 2 print  test  end ========> callback " )
            })
        })

        /**
         * @tc.number: ACTS_AACommand_print_01_0700
         * @tc.name: The -b, -p, -s, -w and other parameters of the test command are valid, and the print interface is
         *           called in Promise mode. The length of the print message is greater than 1000 characters.
         * @tc.desc: Verify that the test framework can be started normally and the logs can be output normally through
         *           the test command.
         */
        it('ACTS_AACommand_print_01_0700', 0, async function (done) {
            done()
            var msg = '0callbackaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '1aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '2aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '3aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '4aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '5aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '6aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '7aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '8aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
            '9aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaae' +
            'fffffffffff'
            globalThis.abilityDelegator.print(msg).then(()=>{
                console.log("ACTS_AACommand_print_01_0700 print  test  end ========> callback " )
            })
            var finishmsg = 'ACTS_AACommand_print_01_0700 end'
            globalThis.abilityDelegator.finishTest(finishmsg, 1).then(()=>{
                console.log("ACTS_AACommand_print_01_0700 2 print  test  end ========> callback " )
            })
        })

        /**
         * @tc.number: ACTS_AACommand_print_01_0800
         * @tc.name: The -b, -p, -s, -w and other parameters of the test command are valid, and the print interface is
         *           called in Promise mode. print information is null.
         * @tc.desc: Verify that the test framework can be started normally and the logs can be output normally
         *           through the test command.
         */
        it('ACTS_AACommand_print_01_0800', 0, async function (done) {
            done()
            globalThis.abilityDelegator.print("").then(()=>{
                console.log("ACTS_AACommand_print_01_0800 print  test  end ========> callback " )
            })
            var finishmsg = 'ACTS_AACommand_print_01_0800 end'
            globalThis.abilityDelegator.finishTest(finishmsg, 1).then(()=>{
                console.log("ACTS_AACommand_print_01_0800 2 print  test  end ========> callback " )
            })
        })
    })
};

