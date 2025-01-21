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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'

let msg: any
export default function abilityTest() {
    describe('ActsAbilityTest', function () {

        afterEach(async (done) => {
            console.log("ActsAACommandPrintSyncTest afterEach called");
            let wantInfo = {
                bundleName: "com.example.aacommandprintsynctest",
                abilityName: "MainAbility"
            }
            await globalThis.abilityContext.startAbility(wantInfo).then((data) => {
                console.log("ActsAACommandPrintSyncTest startAbility data : " + JSON.stringify(data));
            }).catch((err) => {
                console.log("ActsAACommandPrintSyncTest startAbility err : " + JSON.stringify(err));
            })

            setTimeout(function () {
                console.log("ActsAACommandPrintSyncTest afterEach end");
                done();
            }, 1000);
        })

        /**
         * @tc.number: ACTS_AACommand_printSync_0100
         * @tc.name: The -b, -p, -s, -w and other parameters of the test command are valid
         *           The printSync information includes Chinese, special characters, etc.
         * @tc.desc: Verify that the test framework can be started normally and the logs can be output normally through
         *           the test command.
         */
        it('ACTS_AACommand_printSync_0100', 0, async function (done) {
            console.log('ACTS_AACommand_printSync_0100 --- start')
            msg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146'
            expect(globalThis.stdResult1).assertContain(msg)
            done()
        })

        /**
         * @tc.number: ACTS_AACommand_printSync_0200
         * @tc.name: The -b, -p, -s, -w and other parameters of the test command are valid,
         *           The length of the printSync message is 1000 characters.
         * @tc.desc: Verify that the test framework can be started normally and the logs can be output normally through
         *           the test command.
         */
        it('ACTS_AACommand_printSync_0200', 0, async function (done) {
            console.log('ACTS_AACommand_printSync_0200 --- start')
            msg = '0callbackaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
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
            expect(globalThis.stdResult2).assertContain(msg);
            done();
        })

        /**
         * @tc.number: ACTS_AACommand_printSync_0300
         * @tc.name: The -b, -p, -s, -w and other parameters of the test command are valid,
         *           The length of the printSync message is greater than 1000 characters.
         * @tc.desc: Verify that the test framework can be started normally and the logs can be output normally through
         *           the test command.
         */
        it('ACTS_AACommand_printSync_0300', 0, async function (done) {
            console.log('ACTS_AACommand_printSync_0300 --- start')
            msg = '0callbackaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' +
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
            expect(globalThis.stdResult3).assertContain(msg);
            done()

        })

        /**
         * @tc.number: ACTS_AACommand_printSync_0400
         * @tc.name: The -b, -p, -s, -w and other parameters of the test command are valid,
         *           printSync information is null.
         * @tc.desc: Verify that the test framework can be started normally and the logs can be output normally through
         *           the test command.
         */
        it('ACTS_AACommand_printSync_0400', 0, async function (done) {
            console.log('ACTS_AACommand_printSync_0400 --- start')
            msg = 'start ability successfully';
            expect(globalThis.stdResult4).assertContain(msg);
            done();
        })
    })
}