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
import appManager from '@ohos.application.appManager';

export default function abilityTest() {
    describe('ACTS_ExecuteShellCommandTest', function () {

        /**
         * @tc.number: ACTS_ExecuteShellCommand_Callback_0100
         * @tc.name: Execute a shell command without arguments (AsyncCallback).
         * @tc.desc: Verify that the interface executes the Shell command successfully.
         */
        it('ACTS_ExecuteShellCommand_Callback_0100', 0, async function (done) {
            console.log("ACTS_ExecuteShellCommand_Callback_0100 --- start")
            var cmd = 'aa help'
            var escresult = 'usage: aa <command> <options>'
            globalThis.abilityDelegator.executeShellCommand(cmd, (err, data) => {
                console.log('ACTS_ExecuteShellCommand_Callback_0100 - executeShellCommand: start ')
                console.log('ACTS_ExecuteShellCommand_Callback_0100 stdResult = ' + data.stdResult)
                var i = data.stdResult.indexOf(escresult);
                console.log('ACTS_ExecuteShellCommand_Callback_0100 query string i = ' + i);
                expect(i == -1).assertEqual(false);
                console.log('ACTS_ExecuteShellCommand_Callback_0100 exitCode = ' + data.exitCode)
                expect(data.exitCode).assertEqual(0);
                console.log('ACTS_ExecuteShellCommand_Callback_0100 - executeShellCommand: end')
                done()
            })
        })

        /**
         * @tc.number: ACTS_ExecuteShellCommand_Callback_0200
         * @tc.name: Execute shell command with timeout parameter (AsyncCallback)
         * @tc.desc: Verify that the interface executes the Shell command successfully.
         */
        it('ACTS_ExecuteShellCommand_Callback_0200', 0, async function (done) {
            console.log("ACTS_ExecuteShellCommand_Callback_0200 --- start")
            var cmd = 'aa start -a MainAbility -b com.example.actskillprocesswithaccountclosetest'
            globalThis.abilityDelegator.executeShellCommand(cmd, 1,(err, data) => {
                console.log('ACTS_ExecuteShellCommand_Callback_0200 - executeShellCommand: start ')
                console.log('ACTS_ExecuteShellCommand_Callback_0200 stdResult = ' + data.stdResult)
                var i = data.stdResult.indexOf('start ability successfully.');
                console.log('ACTS_ExecuteShellCommand_Callback_0200 query string i = ' + i);
                expect(i == -1).assertEqual(false);
                console.log('ACTS_ExecuteShellCommand_Callback_0200 exitCode = ' + data.exitCode)
                expect(data.exitCode).assertEqual(0);
                console.log('ACTS_ExecuteShellCommand_Callback_0200 - executeShellCommand: end')
                done()
            })
            setTimeout(async() => {
                appManager.killProcessWithAccount('com.example.actskillProcessWithAccountclosetest', 100).then(() => {
                    console.log('ACTS_ExecuteShellCommand_Callback_0200 killProcess ======> start');
                })
            }, 3000 )
        })
        /**
         * @tc.number: ACTS_ExecuteShellCommand_Callback_0300
         * @tc.name: Execute non-existing shell command (AsyncCallback).
         * @tc.desc: Failed to execute shell command on authentication interface.
         */
        it('ACTS_ExecuteShellCommand_Callback_0300', 0, async function (done) {
            console.log("ACTS_ExecuteShellCommand_Callback_0300 --- start")
            var cmd = 'ppwd -L'
            globalThis.abilityDelegator.executeShellCommand(cmd, 1,(err, data) => {
                console.log('ACTS_ExecuteShellCommand_Callback_0300 - executeShellCommand: start ')
                console.log('ACTS_ExecuteShellCommand_Callback_0300 stdResult = ' + data.stdResult)
                var i = data.stdResult.length
                console.log('ACTS_ExecuteShellCommand_Callback_0300 query string i = ' + i);
                expect(i == 0).assertEqual(true);
                console.log('ACTS_ExecuteShellCommand_Callback_0300 exitCode = ' + data.exitCode)
                expect(data.exitCode == 0).assertEqual(false);
                console.log('ACTS_ExecuteShellCommand_Callback_0300 - executeShellCommand: end')
                done();
            })
        })

        /**
         * @tc.number: ACTS_ExecuteShellCommand_Callback_0400
         * @tc.name: Execute shell command timeout (AsyncCallback)
         * @tc.desc: The authentication interface executes the shell command timed out.
         */
        it('ACTS_ExecuteShellCommand_Callback_0400', 0, async function (done) {
            console.log("ACTS_ExecuteShellCommand_Callback_0400 --- start")
            var cmd = 'aa help'
            var escresult = 'usage: aa <command> <options>'
            globalThis.abilityDelegator.executeShellCommand(cmd,0, (err, data) => {
                console.log('ACTS_ExecuteShellCommand_Callback_0400 - executeShellCommand: start ')
                console.log('ACTS_ExecuteShellCommand_Callback_0400 stdResult = ' + data.stdResult)
                var i = data.stdResult.indexOf(escresult);
                console.log('ACTS_ExecuteShellCommand_Callback_0400 query string i = ' + i);
                expect(i == -1).assertEqual(false);
                console.log('ACTS_ExecuteShellCommand_Callback_0100 exitCode = ' + data.exitCode)
                expect(data.exitCode).assertEqual(0);
                console.log('ACTS_ExecuteShellCommand_Callback_0400 - executeShellCommand: end')
                done();
            })
        })

        /**
         * @tc.number: ACTS_ExecuteShellCommand_Callback_0500
         * @tc.name: Invalid timeout parameter for executing shell command (AsyncCallback)
         * @tc.desc: The timeout parameter for executing shell commands on the authentication interface is invalid.
         */
        it('ACTS_ExecuteShellCommand_Callback_0500', 0, async function (done) {
            console.log("ACTS_ExecuteShellCommand_Callback_0500 --- start")
            var cmd = 'aa help'
            var escresult = 'usage: aa <command> <options>'
            globalThis.abilityDelegator.executeShellCommand(cmd,-1, (err, data) => {
                console.log('ACTS_ExecuteShellCommand_Callback_0500 - executeShellCommand: start ')
                console.log('ACTS_ExecuteShellCommand_Callback_0500 stdResult = ' + data.stdResult)
                var i = data.stdResult.indexOf(escresult);
                console.log('ACTS_ExecuteShellCommand_Callback_0500 query string i = ' + i);
                expect(i == -1).assertEqual(false);
                console.log('ACTS_ExecuteShellCommand_Callback_0500 exitCode = ' + data.exitCode)
                expect(data.exitCode).assertEqual(0);
                console.log('ACTS_ExecuteShellCommand_Callback_0500 - executeShellCommand: end')
                done();
            })
        })

        /**
         * @tc.number: ACTS_ExecuteShellCommand_Callback_0600
         * @tc.name: The executed shell command parameter is null (AsyncCallback)
         * @tc.desc: Failed to execute shell command on authentication interface.
         */
        it('ACTS_ExecuteShellCommand_Callback_0600', 0, async function (done) {
            let flag=true;
            console.log("ACTS_ExecuteShellCommand_Callback_0600 --- start")
            globalThis.abilityDelegator.executeShellCommand("",1,(err, data) => {
                console.log('ACTS_ExecuteShellCommand_Callback_0600 - executeShellCommand: start ')
                console.log('ACTS_ExecuteShellCommand_Callback_0600 - executeShellCommand:data'+JSON.stringify(data))
                expect(data).assertEqual(undefined);
                console.log('ACTS_ExecuteShellCommand_Callback_0600 - executeShellCommand: end')
                flag=false;
                done();
            })
            setTimeout(()=>{
                if(flag==true){
                    console.log('ACTS_ExecuteShellCommand_Callback_0600 timeout')
                    expect().assertFail();
                    done();
                }
            },5000)
        })


        /**
         * @tc.number: ACTS_ExecuteShellCommand_Callback_0700
         * @tc.name: The timeout parameter of the execution is null (AsyncCallback)
         * @tc.desc: Verify that the interface executes the Shell command successfully.
         */
        it('ACTS_ExecuteShellCommand_Callback_0700', 0, async function (done) {
            console.log("ACTS_ExecuteShellCommand_0700 --- start")
            var cmd = 'aa help'
            var code = null
            setTimeout(() => {
                console.log('ACTS_ExecuteShellCommand_Callback_0700 code:'+JSON.stringify(code))
                if(code!=undefined){
                    expect().assertFail();
                }
                done();
            }, 3000)
            code = globalThis.abilityDelegator.executeShellCommand(cmd,null,() => {
                console.log('ACTS_ExecuteShellCommand_Callback_0700 fail:')
                expect().assertFail();
            })
        })

        /**
         * @tc.number: ACTS_ExecuteShellCommand_Promise_0100
         * @tc.name: Execute a shell command without arguments (Promise).
         * @tc.desc: Verify that the interface executes the Shell command successfully.
         */
        it('ACTS_ExecuteShellCommand_Promise_0100', 0, async function (done) {
            console.log("ACTS_ExecuteShellCommand_Promise_0100 --- start")
            var cmd = 'aa help'
            var escresult = 'usage: aa <command> <options>'
            globalThis.abilityDelegator.executeShellCommand(cmd, 1).then((data) => {
                console.log('ACTS_ExecuteShellCommand_Promise_0100 - executeShellCommand: start ')
                console.log('ACTS_ExecuteShellCommand_Promise_0100 stdResult = ' + data.stdResult)
                var i = data.stdResult.indexOf(escresult);
                console.log('ACTS_ExecuteShellCommand_Promise_0100 query string i = ' + i);
                expect(i == -1).assertEqual(false);
                console.log('ACTS_ExecuteShellCommand_Promise_0100 exitCode = ' + data.exitCode)
                expect(data.exitCode).assertEqual(0);
                done();
            })
        })

        /**
         * @tc.number: ACTS_ExecuteShellCommand_Promise_0200
         * @tc.name: Execute shell command with timeout parameter (Promise)
         * @tc.desc: Verify that the interface executes the Shell command successfully.
         */
        it('ACTS_ExecuteShellCommand_Promise_0200', 0, async function (done) {
            console.log("ACTS_ExecuteShellCommand_Promise_0200 --- start")
            var cmd = 'aa start -d 0 -a MainAbility -b com.example.actskillprocesswithaccountclosetest'
            globalThis.abilityDelegator.executeShellCommand(cmd, 1).then((data) => {
                console.log('ACTS_ExecuteShellCommand_Promise_0200 - executeShellCommand: start ')
                console.log('ACTS_ExecuteShellCommand_Promise_0200 stdResult = ' + data.stdResult)
                var i = data.stdResult.indexOf('start ability successfully.');
                console.log('ACTS_ExecuteShellCommand_Promise_0200 query string i = ' + i);
                expect(i == -1).assertEqual(false);
                console.log('ACTS_ExecuteShellCommand_Promise_0200 exitCode = ' + data.exitCode)
                expect(data.exitCode).assertEqual(0);
                console.log('ACTS_ExecuteShellCommand_Promise_0200 - executeShellCommand: end')
                done()
            })
            setTimeout(async() => {
                appManager.killProcessWithAccount('com.example.actskillProcessWithAccountclosetest', 100).then(() => {
                    console.log('ACTS_ExecuteShellCommand_Promise_0200 killProcess ======> start');
                })
            }, 3000 )
        })

        /**
         * @tc.number: ACTS_ExecuteShellCommand_Promise_0300
         * @tc.name: Execute non-existing shell command (Promise).
         * @tc.desc: Failed to execute shell command on authentication interface.
         */
        it('ACTS_ExecuteShellCommand_Promise_0300', 0, async function (done) {
            console.log("ACTS_ExecuteShellCommand_Promise_0300 --- start")
            var cmd = 'ppwd -L'
            globalThis.abilityDelegator.executeShellCommand(cmd, 1).then((data) => {
                console.log('ACTS_ExecuteShellCommand_Promise_0300 - executeShellCommand: start ')
                console.log('ACTS_ExecuteShellCommand_Promise_0300 stdResult = ' + data.stdResult)
                var i = data.stdResult.length
                console.log('ACTS_ExecuteShellCommand_Promise_0300 query string i = ' + i);
                expect(i == 0).assertEqual(true);
                console.log('ACTS_ExecuteShellCommand_Promise_0300 exitCode = ' + data.exitCode)
                expect(data.exitCode == 0).assertEqual(false);
                console.log('ACTS_ExecuteShellCommand_Promise_0300 - executeShellCommand: end')
                done();
            })
        })

        /**
         * @tc.number: ACTS_ExecuteShellCommand_Promise_0400
         * @tc.name: Execute shell command timeout (Promise)
         * @tc.desc: The authentication interface executes the shell command timed out.
         */
        it('ACTS_ExecuteShellCommand_Promise_0400', 0, async function (done) {
            console.log("ACTS_ExecuteShellCommand_Promise_0400 --- start")
            var cmd = 'aa help'
            var escresult = 'usage: aa <command> <options>'
            globalThis.abilityDelegator.executeShellCommand(cmd, 0).then((data) => {
                console.log('ACTS_ExecuteShellCommand_Promise_0400 - executeShellCommand: start ')
                console.log('ACTS_ExecuteShellCommand_Promise_0400 stdResult = ' + data.stdResult)
                var i = data.stdResult.indexOf(escresult);
                console.log('ACTS_ExecuteShellCommand_Promise_0400 query string i = ' + i);
                expect(data.exitCode).assertEqual(0);
                console.log('ACTS_ExecuteShellCommand_Promise_0400 - executeShellCommand: end')
                done();
            })
        })

        /**
         * @tc.number: ACTS_ExecuteShellCommand_Promise_0500
         * @tc.name: Invalid timeout parameter for executing shell command (Promise)
         * @tc.desc: The timeout parameter for executing shell commands on the authentication interface is invalid.
         */
        it('ACTS_ExecuteShellCommand_Promise_0500', 0, async function (done) {
            console.log("ACTS_ExecuteShellCommand_Promise_0500 --- start")
            var cmd = 'aa help'
            var escresult = 'usage: aa <command> <options>'
            globalThis.abilityDelegator.executeShellCommand(cmd, -1).then((data) => {
                console.log('ACTS_ExecuteShellCommand_Promise_0500 - executeShellCommand: start ')
                console.log('ACTS_ExecuteShellCommand_Promise_0500 stdResult = ' + data.stdResult)
                var i = data.stdResult.indexOf(escresult);
                console.log('ACTS_ExecuteShellCommand_Promise_0500 query string i = ' + i);
                expect(data.exitCode).assertEqual(0);
                console.log('ACTS_ExecuteShellCommand_Promise_0500 - executeShellCommand: end')
                done();
            })
        })

        /**
         * @tc.number: ACTS_ExecuteShellCommand_Promise_0600
         * @tc.name: The executed shell command parameter is null (Promise)
         * @tc.desc: Failed to execute shell command on authentication interface.
         */
        it('ACTS_ExecuteShellCommand_Promise_0600', 0, async function (done) {
            console.log("ACTS_ExecuteShellCommand_Promise_0600 --- start")
            let flag = true;
            globalThis.abilityDelegator.executeShellCommand("",1).then((data) => {
                console.log('ACTS_ExecuteShellCommand_Promise_0600 - executeShellCommand: start ')
                console.log('ACTS_ExecuteShellCommand_Promise_0600 - executeShellCommand:data'+JSON.stringify(data))
                expect(data).assertEqual(undefined);
                console.log('ACTS_ExecuteShellCommand_Callback_0600 - executeShellCommand: end')
                flag=false;
                done();
            },(data) => {
                console.log('ACTS_ExecuteShellCommand_Promise_0600 -2 executeShellCommand: start ')
                console.log('ACTS_ExecuteShellCommand_Promise_0600 -2 executeShellCommand:data'+JSON.stringify(data))
                expect(data.code).assertEqual(-1);
                console.log('ACTS_ExecuteShellCommand_Callback_0600 -2 executeShellCommand: end')
                flag=false;
                done();
            }).catch((err) => {
                console.log('ACTS_ExecuteShellCommand_Promise_0600 -2 executeShellCommand:err'+JSON.stringify(err))
            })
            setTimeout(()=>{
                if(flag==true){
                    console.log('ACTS_ExecuteShellCommand_Callback_0600 timeout')
                    expect().assertFail();
                    done();
                }
            },5000)
        })

        /**
         * @tc.number: ACTS_ExecuteShellCommand_Promise_0700
         * @tc.name: The timeout parameter of the execution is null (Promise)
         * @tc.desc: Verify that the interface executes the Shell command successfully.
         */
        it('ACTS_ExecuteShellCommand_Promise_0700', 0, async function (done) {
            console.log("ACTS_ExecuteShellCommand_Promise_0700 --- start")
            var cmd = 'aa help'
            var code = null
            code = globalThis.abilityDelegator.executeShellCommand(cmd, null)
            setTimeout(() => {
                console.log('ACTS_ExecuteShellCommand_Callback_0700 code:'+JSON.stringify(code))
                if(code!=undefined){
                    expect().assertFail();
                }
                done();
            }, 3000)
        })
    })
};
