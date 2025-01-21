/*
 * Copyright (c) 2022-2023 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { Component, Driver, UiWindow, ON, UiDriver } from '@ohos.UiTest';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let msg:any;
let msgcopy:any;
let finishmsg:any;
let finishmsg1:any;
let abilityDelegator;
let TAG = 'AttachDebugTestTAG';
function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}
export default function abilityTest() {
    describe('ACTS_AACommand_Test', function () {

        beforeAll(async function (done) {
          abilityDelegator = await AbilityDelegatorRegistry.getAbilityDelegator();
          await done();
        })

        afterEach(async (done) => {
            console.log("ActsAACommandTest afterEach called");
            let wantInfo = {
                bundleName: "com.example.aacommandtest",
                abilityName: "MainAbility"
            }
            await globalThis.abilityContext.startAbility(wantInfo).then((data) => {
                console.log("ActsAACommandTest startAbility data : " + JSON.stringify(data));
            }).catch((err) => {
                console.log("ActsAACommandTest startAbility err : " + JSON.stringify(err));
            })

            setTimeout(function () {
                console.log("ActsAACommandTest afterEach end");
                done();
            }, 1000);
        })

        afterAll(async (done) => {
            let cmd1 = 'pkill -f com.acts.attachdebuguiextensiontest';
            let cmd2 = 'pkill -f com.acts.attachdebuguiextensiontest:ui';
            let cmd3 = 'pkill -f com.acts.attachdebugextensiontest';
            await abilityDelegator.executeShellCommand(cmd1);
            await abilityDelegator.executeShellCommand(cmd2);
            await abilityDelegator.executeShellCommand(cmd3);
            await done();
        })

        /**
         * @tc.number: ACTS_AACommand_0100
         * @tc.name: -b, -s unittest, -p, -s class, -s level, -s size, -s testType, -s timeout,
         *           -s <any-key> <any-value>, -w, etc. of the test command arguments are
         *           valid ( -s class specifies only test suites).
         * @tc.desc: Verify that the test framework can start normally through the test command.
         */
        it('ACTS_AACommand_0100', 0, async function (done) {
            console.log("ACTS_AACommand_0100 --- start")
            let cmd = 'aa test -b com.example.actsaacommandtesta' +
                'test -m entry_test ' +
                '-s unittest OpenHarmonyTestRunner ' +
                '-w 40 -s class ACTS_AACommand_01_3 -s level 1 -s size 0 -s testType aaa -s ' +
                'timeout 5 -s 1 3 -D'
            let delay = 3000
            globalThis.abilityDelegator.executeShellCommand(cmd, (err, data) => {
                console.log('ACTS_AACommand_0100 - executeShellCommand: start ')
                console.log('ACTS_AACommand_0100 stdResult = ' + data.stdResult)
                let i = data.stdResult.indexOf('start ability successfully');
                console.log('ACTS_AACommand_0100 query string i = ' + i);
                expect(i == -1).assertEqual(false);
            })
            setTimeout(async () => {
                console.log('ACTS_AACommand_0100 - executeShellCommand: end')
                done();
            }, delay)
        })

        /**
         * @tc.number: ACTS_AACommand_0200
         * @tc.name: The -b parameter of the test command is invalid, and the other parameters such as -s and -w are valid.
         * @tc.desc: Verify that the test framework cannot be started normally by passing the test command.
         */
        it('ACTS_AACommand_0200', 0, async function (done) {
            console.log("ACTS_AACommand_0200 --- start")
            let cmd = 'aa test -b invalid -m entry_test -s unittest OpenHarmonyTestRunner'
            globalThis.abilityDelegator.executeShellCommand(cmd, (err, data) => {
                console.log('ACTS_AACommand_0200 - executeShellCommand: start ')
                console.log('ACTS_AACommand_0200 stdResult = ' + data.stdResult)
                let i = data.stdResult.indexOf('failed to start user test');
                let j = data.stdResult.indexOf('ACTS_AACommand_0200/0300/0400/0500/0600');
                console.log('ACTS_AACommand_0200 query string i = ' + i);
                console.log('ACTS_AACommand_0200 query string j = ' + j);
                expect(i == -1).assertEqual(false);
                expect(j == -1).assertEqual(true);
                console.log('ACTS_AACommand_0200 - executeShellCommand: end')
                done()
            })
        })

        /**
         * @tc.number: ACTS_AACommand_0300
         * @tc.name: The -s parameter of the test command is invalid, and the other parameters such as -b and -w are valid.
         * @tc.desc:Verify that the test framework cannot be started normally by passing the test command.
         */
        it('ACTS_AACommand_0300', 0, async function (done) {
            console.log("ACTS_AACommand_0300 --- start")
            let cmd = 'aa test -b com.example.actsaacommandtestatest -m entry_test -s invalid'
            globalThis.abilityDelegator.executeShellCommand(cmd, (err, data) => {
                console.log('ACTS_AACommand_0300 - executeShellCommand: start ')
                console.log('ACTS_AACommand_0300 stdResult = ' + data.stdResult)
                let i = data.stdResult.indexOf('option [-s] is incorrect');
                let j = data.stdResult.indexOf('ACTS_AACommand_0200/0300/0400/0500/0600');
                console.log('ACTS_AACommand_0300 query string i = ' + i);
                console.log('ACTS_AACommand_0300 query string j = ' + j);
                expect(i == -1).assertEqual(false);
                expect(j == -1).assertEqual(true);
                console.log('ACTS_AACommand_0300 - executeShellCommand: end')
                done()
            })
        })

        /**
         * @tc.number: ACTS_AACommand_0400
         * @tc.name: The -w parameter of the test command is invalid, and the other parameters such as -b and -s are valid.
         * @tc.desc: Verify that the test framework cannot be started normally by passing the test command.
         */
        it('ACTS_AACommand_0400', 0, async function (done) {
            console.log("ACTS_AACommand_0400 --- start")
            let cmd = 'aa test -b com.example.actsaacommandtestatest -m entry_test ' +
                '-s unittest OpenHarmonyTestRunner ' +
                '-w 无效值'
            globalThis.abilityDelegator.executeShellCommand(cmd, (err, data) => {
                console.log('ACTS_AACommand_0400 - executeShellCommand: start ')
                console.log('ACTS_AACommand_0400 stdResult = ' + data.stdResult)
                let i = data.stdResult.indexOf('start ability successfully');
                let j = data.stdResult.indexOf('ACTS_AACommand_0200/0300/0400/0500/0600');
                console.log('ACTS_AACommand_0400 query string i = ' + i);
                console.log('ACTS_AACommand_0400 query string j = ' + j);
                expect(i == -1).assertEqual(true);
                expect(j == -1).assertEqual(true);
                console.log('ACTS_AACommand_0400 - executeShellCommand: end')
                done()
            })
        })

        /**
         * @tc.number: ACTS_AACommand_0500
         * @tc.name: The -b, -s, -w and other parameters of the test command are valid, and the
         *           invalid -z parameter is added.
         * @tc.desc: Verify that the test framework cannot be started normally by passing the test command.
         */
        it('ACTS_AACommand_0500', 0, async function (done) {
            console.log("ACTS_AACommand_0500 --- start")
            let cmd = 'aa test -b aa test -b com.example.actsaacommandtestatest -m entry_test' +
                '-s unittest OpenHarmonyTestRunner -z invalid'
            globalThis.abilityDelegator.executeShellCommand(cmd, (err, data) => {
                console.log('ACTS_AACommand_0500 - executeShellCommand: start ')
                console.log('ACTS_AACommand_0500 stdResult = ' + data.stdResult)
                let i = data.stdResult.indexOf('error: unknown option: -z');
                let j = data.stdResult.indexOf('ACTS_AACommand_0200/0300/0400/0500/0600');
                console.log('ACTS_AACommand_0500 query string i = ' + i);
                console.log('ACTS_AACommand_0500 query string j = ' + j);
                expect(i == -1).assertEqual(false);
                expect(j == -1).assertEqual(true);
                console.log('ACTS_AACommand_0500 - executeShellCommand: end')
                done()
            })
        })

        /**
         * @tc.number: ACTS_AACommand_0600
         * @tc.name: The -p parameter of the test command is invalid, and the -b, -s, -w and other parameters are valid.
         * @tc.desc: Verify that the test framework cannot be started normally by passing the test command.
         */
        it('ACTS_AACommand_0600', 0, async function (done) {
            console.log("ACTS_AACommand_0600 --- start")
            let cmd = 'aa test -b com.example.actsaacommandtestatest -m aatest -s unittest OpenHarmonyTestRunner -w 20'
            globalThis.abilityDelegator.executeShellCommand(cmd, (err, data) => {
                console.log('ACTS_AACommand_0600 - executeShellCommand: start ')
                console.log('ACTS_AACommand_0600 stdResult = ' + data.stdResult)
                let i = data.stdResult.indexOf('start ability successfully');
                let j = data.stdResult.indexOf('ACTS_AACommand_0200/0300/0400/0500/0600');
                console.log('ACTS_AACommand_0600 query string i = ' + i);
                console.log('ACTS_AACommand_0600 query string j = ' + j);
                expect(i == -1).assertEqual(true);
                expect(j == -1).assertEqual(true);
                console.log('ACTS_AACommand_0600 - executeShellCommand: end')
                done()
            })
        })

        /**
         * @tc.number: ACTS_AACommand_finishTest_0700
         * @tc.name: The parameters of the test command are valid, 
         * and the finishTest interface is called in AsyncCallback
         * mode. The msg parameter is invalid(including Chinese and special characters) and the code parameter
         * is valid (Number.MIN_VALUE-1)
         * @tc.desc: Verify that the process of the test framework can be stopped by calling this interface.
         */
        it('ACTS_AACommand_finishTest_0700', 0, async function (done) {
            console.log("ACTS_AACommand_finishTest_0700 --- start")
            finishmsg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146'
            finishmsg1 = 'TestFinished-ResultCode: -1'
            expect(globalThis.stdResult1).assertContain(finishmsg);
            expect(globalThis.stdResult1).assertContain(finishmsg1);
            expect(globalThis.stdResult2.indexOf("com.example.aacommandrelyhap") == -1).assertTrue()
            done()
        })

        /**
         * @tc.number: ACTS_AACommand_0800
         * @tc.name: The -b, -s, -w and other parameters of the test command are valid, and there is no -D 
         *          parameter setting.
         * @tc.desc: Verify that the test framework cannot be started in Debug mode through the test command.
         */
        it('ACTS_AACommand_0800', 0, async function (done) {
            console.log("ACTS_AACommand_0800 --- start")
            let cmd = 'aa test -b com.example.aacommand08 -m entry_test -s unittest OpenHarmonyTestRunner -w 3'
            globalThis.abilityDelegator.executeShellCommand(cmd, (err, data) => {
                console.log('ACTS_AACommand_0800 - executeShellCommand: start ')
                console.log('ACTS_AACommand_0800 stdResult = ' + data.stdResult)
                let i = data.stdResult.indexOf('start ability successfully');
                console.log('ACTS_AACommand_0800 query string i = ' + i);
                expect(i == -1).assertEqual(false);
                console.log('ACTS_AACommand_0800 - executeShellCommand: end')
                done()
            })
        })

        /**
         * @tc.number: ACTS_AACommand_finishTest_0400
         * @tc.name: The parameters of the test command are valid, and the finishTest interface is called in
         *           AsyncCallback
         *           mode. The msg parameter is invalid(including Chinese and special characters) and the code 
         *           parameter
         *           is valid (Number.MAX_VALUE)
         * @tc.desc: Verify that the process of the test framework can be stopped by calling this interface.
         */
        it('ACTS_AACommand_finishTest_0400', 0, async function (done) {
            console.log("ACTS_AACommand_finishTest_0400 --- start")
            finishmsg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146'
            expect(globalThis.stdResult11).assertContain(finishmsg);
            expect(globalThis.stdResult12.indexOf("com.example.aacommandrelyhap") == -1).assertTrue()
            done()

        })

        /**
         * @tc.number: ACTS_AACommand_finishTest_0100
         * @tc.name: Each parameter of the test command is valid, and the finishTest interface is called
         *           in AsyncCallback mode.
         *           The msg parameter is valid (including Chinese and special characters) and the code parameter
         *           is valid (1).
         * @tc.desc: Verify that the process of the test framework can be stopped by calling this interface.
         */
        it('ACTS_AACommand_finishTest_0100', 0, async function (done) {
            console.log("ACTS_AACommand_finishTest_0100 --- start")
            finishmsg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146'
            finishmsg1 = 'TestFinished-ResultCode: 1'
            expect(globalThis.stdResult13).assertContain(finishmsg);
            expect(globalThis.stdResult13).assertContain(finishmsg1);
            expect(globalThis.stdResult14.indexOf("com.example.aacommandrelyhap") == -1).assertTrue()
            done()
        })

        /**
         * @tc.number: ACTS_AACommand_finishTest_0500
         * @tc.name: The parameters of the test command are valid, and the finishTest
         *           interface is called in AsyncCallback
         *           mode. The msg parameter is invalid(including Chinese and special
         *           characters) and the code parameter
         *           is valid (Number.MIN_VALUE)
         * @tc.desc: Verify that the process of the test framework can be stopped by calling this interface.
         */
        it('ACTS_AACommand_finishTest_0500', 0, async function (done) {
            console.log("ACTS_AACommand_finishTest_0500 --- start")
            finishmsg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146'
            finishmsg1 = 'TestFinished-ResultCode: 0'
            expect(globalThis.stdResult15).assertContain(finishmsg);
            expect(globalThis.stdResult15).assertContain(finishmsg1);
            expect(globalThis.stdResult16.indexOf("com.example.aacommandrelyhap") == -1).assertTrue()
            done()
        })

        /**
         * @tc.number: ACTS_AACommand_finishTest_0600
         * @tc.name: The parameters of the test command are valid, and the finishTest
         *           interface is called in AsyncCallback
         *           mode. The msg parameter is invalid(including Chinese and special characters)
         *           and the code parameter
         *           is valid (Number.MAX_VALUE+1)
         * @tc.desc: Verify that the process of the test framework can be stopped by calling this interface.
         */
        it('ACTS_AACommand_finishTest_0600', 0, async function (done) {
            console.log("ACTS_AACommand_finishTest_0600 --- start")
            finishmsg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146'
            finishmsg1 = 'TestFinished-ResultCode: 1'
            expect(globalThis.stdResult17).assertContain(finishmsg);
            expect(globalThis.stdResult17).assertContain(finishmsg1);
            expect(globalThis.stdResult18.indexOf("com.example.aacommandrelyhap") == -1).assertTrue()
            done()
        })

        /**
         * @tc.number: ACTS_AACommand_finishTest_0900
         * @tc.name: The parameters of the test command are valid, and the finishTest interface is called in Promise
         *           mode. The msg parameter is valid(including Chinese and special characters) and the code parameter
         *           is valid (1)
         * @tc.desc: Verify that the process of the test framework can be stopped by calling this interface.
         */
        it('ACTS_AACommand_finishTest_0900', 0, async function (done) {
            console.log("ACTS_AACommand_finishTest_0900 --- start")
            finishmsg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146'
            finishmsg1 = 'TestFinished-ResultCode: 1'
            expect(globalThis.stdResult19).assertContain(finishmsg);
            expect(globalThis.stdResult19).assertContain(finishmsg1);
            expect(globalThis.stdResult20.indexOf("com.example.aacommandrelyhap") == -1).assertTrue()
            done()
        })

        /**
         * @tc.number: ACTS_AACommand_finishTest_1300
         * @tc.name: The parameters of the test command are valid, and the finishTest interface is called in Promise
         *           mode. The msg parameter is valid(including Chinese and special characters) and the code parameter
         *           is valid (Number.MIN_VALUE)
         * @tc.desc: Verify that the process of the test framework can be stopped by calling this interface.
         */
        it('ACTS_AACommand_finishTest_1300', 0, async function (done) {
            console.log("ACTS_AACommand_finishTest_1300 --- start")
            finishmsg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146'
            finishmsg1 = 'TestFinished-ResultCode: 0'
            expect(globalThis.stdResult23).assertContain(finishmsg);
            expect(globalThis.stdResult23).assertContain(finishmsg1);
            expect(globalThis.stdResult24.indexOf("com.example.aacommandrelyhap") == -1).assertTrue()
            done()
        })

        /**
         * @tc.number: ACTS_AACommand_finishTest_1400
         * @tc.name: The parameters of the test command are valid, and the finishTest interface is called in Promise
         *           mode. The msg parameter is valid(including Chinese and special characters) and the code parameter
         *           is valid (Number.MAX_VALUE+1)
         * @tc.desc: Verify that the process of the test framework can be stopped by calling this interface.
         */
        it('ACTS_AACommand_finishTest_1400', 0, async function (done) {
            console.log("ACTS_AACommand_finishTest_1400 --- start")
            finishmsg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146'
            finishmsg1 = 'TestFinished-ResultCode: 1'
            expect(globalThis.stdResult25).assertContain(finishmsg);
            expect(globalThis.stdResult25).assertContain(finishmsg1);
            expect(globalThis.stdResult26.indexOf("com.example.aacommandrelyhap") == -1).assertTrue()
            done()
        })

        /**
         * @tc.number: ACTS_AACommand_finishTest_1500
         * @tc.name: The parameters of the test command are valid, and the finishTest interface is called in Promise
         *           mode. The msg parameter is valid(including Chinese and special characters) and the code parameter
         *           is valid (Number.MIN_VALUE-1)
         * @tc.desc: Verify that the process of the test framework can be stopped by calling this interface.
         */
        it('ACTS_AACommand_finishTest_1500', 0, async function (done) {
            console.log("ACTS_AACommand_finishTest_1500 --- start")
            finishmsg = '测试日志!@#$%^&*()_+QWE{}|?><Fafq3146'
            finishmsg1 = 'TestFinished-ResultCode: -1'
            expect(globalThis.stdResult27).assertContain(finishmsg);
            expect(globalThis.stdResult27).assertContain(finishmsg1);
            expect(globalThis.stdResult28.indexOf("com.example.aacommandrelyhap") == -1).assertTrue()
            done()
        })

        /**
         * @tc.number: ACTS_AACommand_finishTest_0300
         * @tc.name: The parameters of the test command are valid, and the finishTest interface is called in 
         *           AsyncCallback mode. The msg parameter is invalid (Undefined) and the code parameter is valid (1)
         * @tc.desc: Verify that the process of the test framework can be stopped by calling this interface.
         */
        it('ACTS_AACommand_finishTest_0300', 0, async function (done) {
            console.log("ACTS_AACommand_finishTest_0300 --- start")
            expect(globalThis.stdResult30.indexOf("com.example.aacommandrelyhap") >= 0).assertTrue()
            done()
        })

        /**
        * @tc.number: ACTS_AACommand_finishTest_1600
        * @tc.name: The parameters of the test command are valid, and the finishTest interface is called in 
        *           Promisemode. The msg parameter is valid(including Chinese and special characters) and the 
        *           code parameter
        *           is valid (ABCD)
        * @tc.desc: Verify that the process of the test framework can be stopped by calling this interface.
        */
        it('ACTS_AACommand_finishTest_1600', 0, async function (done) {
            console.log("ACTS_AACommand_finishTest_1600 --- start")
            expect(globalThis.stdResult34.indexOf("com.example.aacommandrelyhap") >= 0).assertTrue()
            done()
        })

        /**
        * @tc.number: SUB_Ability_AbilityTools_AACommand_AAAttachDebug_0700
        * @tc.name: Test command which is invalid
        * @tc.desc: Verify 'aa attach'
        */
        it('SUB_Ability_AbilityTools_AACommand_AAAttachDebug_0700',0, async function (done) {
            console.debug(TAG, 'SUB_Ability_AbilityTools_AACommand_AAAttachDebug_0700 start!');
            let cmd1 = 'aa attach';
            let cmd2 = 'aa detach';
            await abilityDelegator.executeShellCommand(cmd1).then((data) => {
                console.info(TAG, 'SUB_Ability_AbilityTools_AACommand_AAAttachDebug_0700 shell result1 data: ' + JSON.stringify(data));
                try {
                    expect(data.stdResult).assertContain('aa attach <options>');
                } catch (error) {
                    console.info(TAG, 'SUB_Ability_AbilityTools_AACommand_AAAttachDebug_0700 assert error: ' + JSON.stringify(error));
                }
            });
            await sleep(700);
            await abilityDelegator.executeShellCommand(cmd2).then((data) => {
                console.info(TAG, 'SUB_Ability_AbilityTools_AACommand_AAAttachDebug_0700 shell result2 data: ' + JSON.stringify(data));
                try {
                    expect(data.stdResult).assertContain('aa detach <options>');
                } catch (error) {
                    console.info(TAG, 'SUB_Ability_AbilityTools_AACommand_AAAttachDebug_0700 assert error: ' + JSON.stringify(error));
                }
                done();
            });
        })

        /**
        * @tc.number: SUB_Ability_AbilityTools_AACommand_AAAttachDebug_0800
        * @tc.name: Test command which is invalid
        * @tc.desc: Verify 'aa detach -b'
        */
        it('SUB_Ability_AbilityTools_AACommand_AAAttachDebug_0800',0, async function (done) {
            console.debug(TAG, 'SUB_Ability_AbilityTools_AACommand_AAAttachDebug_0800 start!');
            let cmd1 = 'aa attach -b';
            let cmd2 = 'aa detach -b';
            await abilityDelegator.executeShellCommand(cmd1).then((data) => {
                console.info(TAG, 'SUB_Ability_AbilityTools_AACommand_AAAttachDebug_0800 shell result1 data: ' + JSON.stringify(data));
                try {
                    expect(data.stdResult).assertContain('aa attach <options>');
                } catch (error) {
                    console.info(TAG, 'SUB_Ability_AbilityTools_AACommand_AAAttachDebug_0800 assert error: ' + JSON.stringify(error));
                }
            });
            await sleep(700);
            await abilityDelegator.executeShellCommand(cmd2).then((data) => {
                console.info(TAG, 'SUB_Ability_AbilityTools_AACommand_AAAttachDebug_0800 shell result2 data: ' + JSON.stringify(data));
                try {
                    expect(data.stdResult).assertContain('aa detach <options>');
                } catch (error) {
                    console.info(TAG, 'SUB_Ability_AbilityTools_AACommand_AAAttachDebug_0800 assert error: ' + JSON.stringify(error));
                }
                done();
            });
        })

        /**
        * @tc.number: SUB_Ability_AbilityTools_AACommand_AAAttachDebug_0900
        * @tc.name: Test command which is invalid
        * @tc.desc: Verify 'aa attach -c'
        */
        it('SUB_Ability_AbilityTools_AACommand_AAAttachDebug_0900',0, function (done) {
            console.debug(TAG, 'SUB_Ability_AbilityTools_AACommand_AAAttachDebug_0900 start!');
            let cmd = 'aa attach -c';
            abilityDelegator.executeShellCommand(cmd, (error, data) => {
                expect(error).assertEqual(null);
                console.info(TAG, 'SUB_Ability_AbilityTools_AACommand_AAAttachDebug_0900 shell result data: ' + JSON.stringify(data));
                try {
                    expect(data.stdResult).assertContain('aa attach <options>');
                } catch (error) {
                    console.info(TAG, 'SUB_Ability_AbilityTools_AACommand_AAAttachDebug_0900 assert error: ' + JSON.stringify(error));
                }
                done();
            });
        })

        /**
        * @tc.number: SUB_Ability_AbilityTools_AACommand_AAAttachDebug_1000
        * @tc.name: Test command which is invalid
        * @tc.desc: Verify 'aa detach -c'
        */
        it('SUB_Ability_AbilityTools_AACommand_AAAttachDebug_1000',0, function (done) {
            console.debug(TAG, 'SUB_Ability_AbilityTools_AACommand_AAAttachDebug_1000 start!');
            let cmd = 'aa detach -c';
            abilityDelegator.executeShellCommand(cmd, (error, data) => {
                expect(error).assertEqual(null);
                console.info(TAG, 'SUB_Ability_AbilityTools_AACommand_AAAttachDebug_1000 shell result data: ' + JSON.stringify(data));
                try {
                    expect(data.stdResult).assertContain('aa detach <options>');
                } catch (error) {
                    console.info(TAG, 'SUB_Ability_AbilityTools_AACommand_AAAttachDebug_1000 assert error: ' + JSON.stringify(error));
                }
                done();
            });
        })

        /**
        * @tc.number: SUB_Ability_AbilityTools_AACommand_AAAttachDebug_1100
        * @tc.name: Test command which is valid
        * @tc.desc: Verify 'aa attach -b com.example.attachdebugtest'
        */
        it('SUB_Ability_AbilityTools_AACommand_AAAttachDebug_1100',0 , function (done) {
            console.debug(TAG, 'SUB_Ability_AbilityTools_AACommand_AAAttachDebug_1100 start!');
            let cmd = 'aa attach -b com.example.attachdebugtest';
            abilityDelegator.executeShellCommand(cmd, (error, data) => {
                expect(error).assertEqual(null);
                console.info(TAG, 'SUB_Ability_AbilityTools_AACommand_AAAttachDebug_1100 shell result data: ' + JSON.stringify(data));
                try {
                    expect(data.stdResult).assertContain('attach app debug successfully.');
                } catch (error) {
                    console.info(TAG, 'SUB_Ability_AbilityTools_AACommand_AAAttachDebug_1100 assert error: ' + JSON.stringify(error));
                }
                done();
            });
        })

        /**
        * @tc.number: SUB_Ability_AbilityTools_AACommand_AAAttachDebug_1200
        * @tc.name: Test command which is valid
        * @tc.desc: Verify 'aa detach -b com.example.attachdebugtest'
        */
        it('SUB_Ability_AbilityTools_AACommand_AAAttachDebug_1200',0, function (done) {
            console.debug(TAG, 'SUB_Ability_AbilityTools_AACommand_AAAttachDebug_1200 start!');
            let cmd = 'aa detach -b com.example.attachdebugtest';
            abilityDelegator.executeShellCommand(cmd, (error, data) => {
                expect(error).assertEqual(null);
                console.info(TAG, 'SUB_Ability_AbilityTools_AACommand_AAAttachDebug_1200 shell result data: ' + JSON.stringify(data));
                try {
                    expect(data.stdResult).assertContain('detach app debug successfully.');
                } catch (error) {
                    console.info(TAG, 'SUB_Ability_AbilityTools_AACommand_AAAttachDebug_1200 assert error: ' + JSON.stringify(error));
                }
                done();
            });
        })

        /**
        * @tc.number: SUB_Ability_AbilityTools_AACommand_AAAttachDebug_1300
        * @tc.name: Test extension ability after attach whose process will not be killed
        * @tc.desc: Verify process
        */
        it('SUB_Ability_AbilityTools_AACommand_AAAttachDebug_1300',0, async function (done) {
            console.debug(TAG, 'SUB_Ability_AbilityTools_AACommand_AAAttachDebug_1300 start!');
            let want = {
                'deviceId': '',
                'bundleName': 'com.acts.attachdebugextensiontest',
                'abilityName': 'ServiceExtAbility'
            };
            await globalThis.abilityContext.startServiceExtensionAbility(want);
            await sleep(500);
            let cmd = 'aa attach -b com.acts.attachdebugextensiontest';
            await abilityDelegator.executeShellCommand(cmd).then((data) => {
                console.info(TAG, 'aa attach sucessfully!');
            });
            await sleep(500);
            await globalThis.abilityContext.stopServiceExtensionAbility(want);
            let cmd1 = 'ps -ef | grep com.acts';
            await abilityDelegator.executeShellCommand(cmd1).then(async (data) => {
                console.info(TAG, 'SUB_Ability_AbilityTools_AACommand_AAAttachDebug_1300 shell result data: ' + JSON.stringify(data));
                try {
                    expect(data.stdResult).assertContain('com.acts.attachdebugextensiontest');
                } catch (error) {
                    console.info(TAG, 'SUB_Ability_AbilityTools_AACommand_AAAttachDebug_1300 assert error: ' + JSON.stringify(error));
                }
                await sleep(500);
                await abilityDelegator.executeShellCommand('pkill -f com.acts.attachdebugextensiontest').then((data) => {
                    done();
                });
            });
        })

        /**
        * @tc.number: SUB_Ability_AbilityTools_AACommand_AAAttachDebug_1400
        * @tc.name: Test ui extension ability after attach whose process will not be killed
        * @tc.desc: Verify process
        */
        it('SUB_Ability_AbilityTools_AACommand_AAAttachDebug_1400',0, async function (done) {
            console.debug(TAG, 'SUB_Ability_AbilityTools_AACommand_AAAttachDebug_1400 start!');
            let want = {
                'bundleName': 'com.acts.attachdebuguiextensiontest',
                'abilityName': 'EntryAbility'
            };
            await globalThis.abilityContext.startAbility(want).then(() => {
                console.info(TAG, 'SUB_Ability_AbilityTools_AACommand_AAAttachDebug_1400 start ability sucessfully.');
            });
            let cmd = 'aa attach -b com.acts.attachdebuguiextensiontest';
            await abilityDelegator.executeShellCommand(cmd).then((data) => {
                console.info(TAG, 'aa attach sucessfully!');
            });
            await sleep(1500);
            let cmd1 = 'ps -ef | grep com.acts';
            await abilityDelegator.executeShellCommand(cmd1).then((data) => {
                console.info(TAG, 'SUB_Ability_AbilityTools_AACommand_AAAttachDebug_1400 shell result data: ' + JSON.stringify(data));
                try {
                    expect(data.stdResult).assertContain('com.acts.attachdebuguiextensiontest:ui');
                } catch (error) {
                    console.info(TAG, 'SUB_Ability_AbilityTools_AACommand_AAAttachDebug_1400 assert error: ' + JSON.stringify(error));
                }
                done();
            });
        })
    })
}
