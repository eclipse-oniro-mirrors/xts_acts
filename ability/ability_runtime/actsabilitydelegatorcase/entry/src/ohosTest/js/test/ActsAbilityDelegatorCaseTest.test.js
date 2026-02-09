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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import featureAbility from '@ohos.ability.featureAbility'
import abilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry'
import abilityDelegatorRegistryNew from '@ohos.app.ability.abilityDelegatorRegistry'
import bundle from '@ohos.bundle'

let result;

export default function actsStServiceAbilityTest() {
    describe('ActsStServiceAbilityTest', function () {
        let gSetTimeout = 1000
        beforeAll(async (done) => {
            console.debug('= ACTS_AbeforeAll 1812 ====<begin');
            console.debug('= ACTS_AbeforeAll ====<end');
            done();
        })
        beforeEach(async (done) => {
            done();
        })
        afterEach(async (done) => {
            done();
        })

        /**
         * @tc.name   ACTS_AExecuteShellCommand_Callback_0100
         * @tc.number ACTS_AExecuteShellCommand_0100
         * @tc.desc   Verify that the interface executes the Shell command successfully.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('ACTS_AExecuteShellCommand_Callback_0100', Level.LEVEL0, async function (done) {
            console.log("ACTS_AExecuteShellCommand_Callback_0100 --- start")
            var currentAlertTimeout = 0;
            try {
                currentAlertTimeout = setTimeout(mySetTimeout, gSetTimeout);
                function mySetTimeout() {
                    console.log('ACTS_AExecuteShellCommand_Callback_0100====<end mySetTimeout')
                    done();
                }
                var cmd = 'echo test'
                var AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
                AbilityDelegator.executeShellCommand(cmd, (err, data) => {
                    clearTimeout(currentAlertTimeout);
                    console.log('ACTS_AExecuteShellCommand_Callback_0100 data: ' + JSON.stringify(data))

                    result = data.stdResult.replace(/[\r\n]/g, "");
                    console.log('ACTS_AExecuteShellCommand_Callback_0100 stdResult = ' + data.stdResult)
                    expect(result).assertEqual('test');

                    console.log('ACTS_AExecuteShellCommand_Callback_0100 exitCode = ' + data.exitCode)
                    expect(data.exitCode).assertEqual(0);

                    console.log('ACTS_AExecuteShellCommand_Callback_0100 - executeShellCommand: end')

                    done()
                })
            } catch (error) {
                clearTimeout(currentAlertTimeout);
                console.log("ACTS_AExecuteShellCommand_Callback_0100 : error = " + error);
                console.debug('ACTS_AExecuteShellCommand_Callback_0100====<end catch (error)');
                done();
            }

        })

        /**
         * @tc.name   ACTS_AExecuteShellCommand_Promise_0100
         * @tc.number ACTS_AExecuteShellCommand_Promise_0100
         * @tc.desc   Verify that the interface executes the Shell command successfully.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('ACTS_AExecuteShellCommand_Promise_0100', Level.LEVEL0, async function (done) {
            console.log("ACTS_AExecuteShellCommand_Promise_0100 --- start")
            var currentAlertTimeout = 0;
            try {
                currentAlertTimeout = setTimeout(mySetTimeout, gSetTimeout);
                function mySetTimeout() {
                    console.log('ACTS_AExecuteShellCommand_Callback_0100====<end mySetTimeout')
                    done();
                }
                var cmd = 'echo test'
                var AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
                AbilityDelegator.executeShellCommand(cmd, 1).then((data) => {
                    clearTimeout(currentAlertTimeout);
                    console.log('ACTS_AExecuteShellCommand_Promise_0100 - executeShellCommand: start ')

                    result = data.stdResult.replace(/[\r\n]/g, "");
                    console.log('ACTS_AExecuteShellCommand_Promise_0100 stdResult = ' + data.stdResult)
                    expect(result).assertEqual('test');

                    console.log('ACTS_AExecuteShellCommand_Promise_0100 exitCode = ' + data.exitCode)
                    expect(data.exitCode).assertEqual(0);
                    done();
                })
            } catch (error) {
                clearTimeout(currentAlertTimeout);
                console.log("ACTS_AExecuteShellCommand_Callback_0100 : error = " + error);
                console.debug('ACTS_AExecuteShellCommand_Callback_0100====<end catch (error)');
                done();
            }
        })

        /**
         * @tc.name   ACTS_AGetDisplayOrientation_0100
         * @tc.number ACTS_AGetDisplayOrientation_0100
         * @tc.desc   Check the return value of the interface (by AsyncCallback)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('ACTS_AGetDisplayOrientation_0100', Level.LEVEL0, async function (done) {
            console.log("ACTS_AGetDisplayOrientation_0100 --- start")
            var currentAlertTimeout = 0;
            try {
                currentAlertTimeout = setTimeout(mySetTimeout, gSetTimeout);
                function mySetTimeout() {
                    console.log('ACTS_AGetDisplayOrientation_0100====<end mySetTimeout')
                    done();
                }
                var context = featureAbility.getContext()
                var result = context.getDisplayOrientation(
                    (err, DisplayOrientation) => {
                        clearTimeout(currentAlertTimeout);
                        console.debug("ACTS_AGetDisplayOrientation_0100====DisplayOrientation>"
                            + JSON.stringify(DisplayOrientation) + " , err= " + err);
                        expect(DisplayOrientation == bundle.DisplayOrientation.UNSPECIFIED
                            || (DisplayOrientation != bundle.DisplayOrientation.LANDSCAPE
                                || DisplayOrientation != bundle.DisplayOrientation.PORTRAIT
                                || DisplayOrientation != bundle.DisplayOrientation.FOLLOW_RECENT
                            )).assertTrue();
                        done()
                    }
                );
            } catch (error) {
                clearTimeout(currentAlertTimeout);
                console.log("ACTS_AGetDisplayOrientation_0100 : error = " + error);
                console.debug('ACTS_AGetDisplayOrientation_0100====<end catch (error)');
                done();
            }
        })

        /**
         * @tc.name   ACTS_AGetDisplayOrientation_0200
         * @tc.number ACTS_AGetDisplayOrientation_0200
         * @tc.desc   Check the return type of the interface (by promise)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('ACTS_AGetDisplayOrientation_0200', Level.LEVEL0, async function (done) {
            console.log("ACTS_AGetDisplayOrientation_0200 --- start")
            var currentAlertTimeout = 0;
            try {
                currentAlertTimeout = setTimeout(mySetTimeout, gSetTimeout);
                function mySetTimeout() {
                    console.log('ACTS_AGetDisplayOrientation_0200====<end mySetTimeout')
                    done();
                }
                var context = featureAbility.getContext()
                var result = await context.getDisplayOrientation().then((data) => {
                    clearTimeout(currentAlertTimeout);
                    console.debug("ACTS_AGetDisplayOrientation_0200====DisplayOrientation>"
                        + JSON.stringify(DisplayOrientation) + " , err= " + err);
                    expect(DisplayOrientation == bundle.DisplayOrientation.UNSPECIFIED
                        || (DisplayOrientation != bundle.DisplayOrientation.LANDSCAPE
                            || DisplayOrientation != bundle.DisplayOrientation.PORTRAIT
                            || DisplayOrientation != bundle.DisplayOrientation.FOLLOW_RECENT
                        )).assertTrue();
                    done()
                }
                );
            } catch (error) {
                clearTimeout(currentAlertTimeout);
                console.log("ACTS_AGetDisplayOrientation_0200 : error = " + error);
                console.debug('ACTS_AGetDisplayOrientation_0200====<end catch (error)');
                done();
            }
        })

        /**
         * @tc.name   ACTS_ASetDisplayOrientation_0100
         * @tc.number ACTS_ASetDisplayOrientation_0100
         * @tc.desc   Check the return value of the interface (by AsyncCallback)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('ACTS_ASetDisplayOrientation_0100', Level.LEVEL0, async function (done) {
            console.log("ACTS_ASetDisplayOrientation_0100 --- start")
            var currentAlertTimeout = 0;
            try {
                currentAlertTimeout = setTimeout(mySetTimeout, gSetTimeout);
                function mySetTimeout() {
                    console.log('ACTS_ASetDisplayOrientation_0100====<end mySetTimeout')
                    done();
                }
                var context = featureAbility.getContext()
                var result = context.setDisplayOrientation(bundle.DisplayOrientation.UNSPECIFIED,
                    (err) => {
                        clearTimeout(currentAlertTimeout);
                        console.debug("ACTS_ASetDisplayOrientation_0100====err>"
                            + JSON.stringify(err) + " , err= " + err);
                        done()
                    }
                );
            } catch (error) {
                clearTimeout(currentAlertTimeout);
                console.log("ACTS_ASetDisplayOrientation_0100 : error = " + error);
                console.debug('ACTS_ASetDisplayOrientation_0100====<end catch (error)');
                done();
            }
        })

        /**
         * @tc.name   ACTS_ASetDisplayOrientation_0200
         * @tc.number ACTS_ASetDisplayOrientation_0200
         * @tc.desc   Check the return type of the interface (by promise)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('ACTS_ASetDisplayOrientation_0200', Level.LEVEL0, async function (done) {
            console.log("ACTS_ASetDisplayOrientation_0200 --- start")
            var currentAlertTimeout = 0;
            try {
                currentAlertTimeout = setTimeout(mySetTimeout, gSetTimeout);
                function mySetTimeout() {
                    console.log('ACTS_ASetDisplayOrientation_0200====<end mySetTimeout')
                    done();
                }
                var context = featureAbility.getContext()
                var result = context.setDisplayOrientation(bundle.DisplayOrientation.UNSPECIFIED).then(() => {
                    clearTimeout(currentAlertTimeout);
                    done()
                }
                );
            } catch (error) {
                clearTimeout(currentAlertTimeout);
                console.log("ACTS_ASetDisplayOrientation_0200 : error = " + error);
                console.debug('ACTS_ASetDisplayOrientation_0200====<end catch (error)');
                done();
            }
        })

        /**
         * @tc.name   ACTS_ASetShowOnLockScreen_0100
         * @tc.number ACTS_ASetShowOnLockScreen_0100
         * @tc.desc   Check the return value of the interface (by AsyncCallback)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('ACTS_ASetShowOnLockScreen_0100', Level.LEVEL0, async function (done) {
            console.log("ACTS_ASetShowOnLockScreen_0100 --- start")
            var currentAlertTimeout = 0;
            try {
                currentAlertTimeout = setTimeout(mySetTimeout, gSetTimeout);
                function mySetTimeout() {
                    console.log('ACTS_ASetShowOnLockScreen_0100====<end mySetTimeout')
                    done();
                }
                var context = featureAbility.getContext()
                var result = context.setShowOnLockScreen(true,
                    (err) => {
                        clearTimeout(currentAlertTimeout);
                        console.debug("ACTS_ASetShowOnLockScreen_0100====err>"
                            + JSON.stringify(err) + " , err= " + err);
                        done()
                    }
                );
            } catch (error) {
                clearTimeout(currentAlertTimeout);
                console.log("ACTS_ASetShowOnLockScreen_0100 : error = " + error);
                console.debug('ACTS_ASetShowOnLockScreen_0100====<end catch (error)');
                done();
            }
        })

        /**
         * @tc.name   ACTS_ASetShowOnLockScreen_0200
         * @tc.number ACTS_ASetShowOnLockScreen_0200
         * @tc.desc   Check the return type of the interface (by promise)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('ACTS_ASetShowOnLockScreen_0200', Level.LEVEL0, async function (done) {
            console.log("ACTS_ASetShowOnLockScreen_0200 --- start")
            var currentAlertTimeout = 0;
            try {
                currentAlertTimeout = setTimeout(mySetTimeout, gSetTimeout);
                function mySetTimeout() {
                    console.log('ACTS_ASetShowOnLockScreen_0200====<end mySetTimeout')
                    done();
                }
                var context = featureAbility.getContext()
                var result = context.setShowOnLockScreen(true).then(() => {
                    clearTimeout(currentAlertTimeout);
                    console.debug("ACTS_ASetShowOnLockScreen_0200====then>");
                    done()
                }
                );
            } catch (error) {
                clearTimeout(currentAlertTimeout);
                console.log("ACTS_ASetShowOnLockScreen_0200 : error = " + error);
                console.debug('ACTS_ASetShowOnLockScreen_0200====<end catch (error)');
                done();
            }
        })

        /**
         * @tc.name   ACTS_ASetWakeUpScreen_0100
         * @tc.number ACTS_ASetWakeUpScreen_0100
         * @tc.desc   Check the return value of the interface (by AsyncCallback)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('ACTS_ASetWakeUpScreen_0100', Level.LEVEL0, async function (done) {
            console.log("ACTS_ASetWakeUpScreen_0100 --- start")
            var currentAlertTimeout = 0;
            try {
                currentAlertTimeout = setTimeout(mySetTimeout, gSetTimeout);
                function mySetTimeout() {
                    console.log('ACTS_ASetWakeUpScreen_0100====<end mySetTimeout')
                    done();
                }
                var context = featureAbility.getContext()
                var result = context.setWakeUpScreen(true,
                    (err) => {
                        clearTimeout(currentAlertTimeout);
                        console.debug("ACTS_ASetWakeUpScreen_0100====err>"
                            + JSON.stringify(err) + " , err= " + err);
                        done()
                    }
                );
            } catch (error) {
                clearTimeout(currentAlertTimeout);
                console.log("ACTS_ASetWakeUpScreen_0100 : error = " + error);
                console.debug('ACTS_ASetWakeUpScreen_0100====<end catch (error)');
                done();
            }
        })

        /**
         * @tc.name   ACTS_ASetWakeUpScreen_0200
         * @tc.number ACTS_ASetWakeUpScreen_0200
         * @tc.desc   Check the return type of the interface (by promise)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('ACTS_ASetWakeUpScreen_0200', Level.LEVEL0, async function (done) {
            console.log("ACTS_ASetWakeUpScreen_0200 --- start")
            var currentAlertTimeout = 0;
            try {
                currentAlertTimeout = setTimeout(mySetTimeout, gSetTimeout);
                function mySetTimeout() {
                    console.log('ACTS_ASetWakeUpScreen_0200====<end mySetTimeout')
                    done();
                }
                var context = featureAbility.getContext()
                var result = context.setWakeUpScreen(true).then(() => {
                    clearTimeout(currentAlertTimeout);
                    console.debug("ACTS_ASetWakeUpScreen_0200====then>");
                    done()
                }
                );
            } catch (error) {
                clearTimeout(currentAlertTimeout);
                console.log("ACTS_ASetWakeUpScreen_0200 : error = " + error);
                console.debug('ACTS_ASetWakeUpScreen_0200====<end catch (error)');
                done();
            }
        })

        /**
         * @tc.name   ACTS_ATestRunner_0200
         * @tc.number ACTS_ATestRunner_0200
         * @tc.desc   Starting mainability2 with startability succeeded.(callback)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('ACTS_ATestRunner_0200', Level.LEVEL0, async function (done) {
            console.debug('ACTS_ATestRunner_0200====<begin');
            let sa = '-b';
            try {
                var AbilityDelegatorArgs = abilityDelegatorRegistry.getArguments()
                console.debug("ACTS_ATestRunner_0200====>getArguments is====>" + JSON.stringify(AbilityDelegatorArgs));
                expect(AbilityDelegatorArgs.bundleName).assertEqual('com.amsst.actsabilitydelegatorcasetest')
                expect(AbilityDelegatorArgs.parameters["-b"]).assertEqual("com.amsst.actsabilitydelegatorcasetest")
                expect(AbilityDelegatorArgs.parameters["-p"]).assertEqual("com.amsst.actsabilitydelegatorcasetest")
                expect(AbilityDelegatorArgs.parameters["-s timeout"]).assertEqual("30000")
                expect(AbilityDelegatorArgs.parameters["-s unittest"]).assertEqual("OpenHarmonyTestRunner")
                expect(AbilityDelegatorArgs.parameters["-w"]).assertEqual("300000")
                expect(AbilityDelegatorArgs.parameters["moduleName"]).assertEqual("")
                expect(AbilityDelegatorArgs.testCaseNames).assertEqual('')
                expect(AbilityDelegatorArgs.testRunnerClassName).assertEqual('OpenHarmonyTestRunner')
                console.debug('ACTS_ATestRunner_0200====<end');
                done();
            } catch (error) {
                console.log("ACTS_ATestRunner_0200 : error = " + error);
                done();
            }
        })

        /**
         * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_setMockList_0100
         * @tc.number ACTS_SetMockList_0100
         * @tc.desc   Set mock list with undefined
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Ability_AbilityTools_AbilityDelegator_setMockList_0100', Level.LEVEL0, async function (done) {
            console.debug('SUB_Ability_AbilityTools_AbilityDelegator_setMockList_0100====<begin');
            let abilityDelegator = abilityDelegatorRegistryNew.getAbilityDelegator();
            try {
                abilityDelegator.setMockList(undefined);
                expect().assertFail()
                done()
            } catch (error) {
                console.log("SUB_Ability_AbilityTools_AbilityDelegator_setMockList_0100, error = " + error);
                expect(error.code).assertEqual(401);
                done();
            }
        })

        /**
         * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_setMockList_0200
         * @tc.number ACTS_SetMockList_0200
         * @tc.desc   Set mock list with null
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Ability_AbilityTools_AbilityDelegator_setMockList_0200', Level.LEVEL0, async function (done) {
            console.debug('SUB_Ability_AbilityTools_AbilityDelegator_setMockList_0200====<begin');
            let abilityDelegator = abilityDelegatorRegistryNew.getAbilityDelegator();
            try {
                abilityDelegator.setMockList(null);
                expect().assertFail()
                done()
            } catch (error) {
                console.log("SUB_Ability_AbilityTools_AbilityDelegator_setMockList_0200, error = " + error);
                expect(error.code).assertEqual(401);
                done();
            }
        })

        /**
         * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_setMockList_0300
         * @tc.number ACTS_SetMockList_0300
         * @tc.desc   Set mock list with no param
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Ability_AbilityTools_AbilityDelegator_setMockList_0300', Level.LEVEL0, async function (done) {
            console.debug('SUB_Ability_AbilityTools_AbilityDelegator_setMockList_0300====<begin');
            let abilityDelegator = abilityDelegatorRegistryNew.getAbilityDelegator();
            try {
                abilityDelegator.setMockList();
                expect().assertFail()
                done()
            } catch (error) {
                console.log("SUB_Ability_AbilityTools_AbilityDelegator_setMockList_0300, error = " + error);
                expect(error.code).assertEqual(401);
                done();
            }
        })

        /**
         * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_setMockList_0400
         * @tc.number ACTS_SetMockList_0400
         * @tc.desc   Set mock list with two param
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Ability_AbilityTools_AbilityDelegator_setMockList_0400', Level.LEVEL0, async function (done) {
            console.debug('SUB_Ability_AbilityTools_AbilityDelegator_setMockList_0400====<begin');
            let abilityDelegator = abilityDelegatorRegistryNew.getAbilityDelegator();
            try {
                abilityDelegator.setMockList(undefined, undefined);
                expect().assertFail()
                done()
            } catch (error) {
                console.log("SUB_Ability_AbilityTools_AbilityDelegator_setMockList_0400, error = " + error);
                expect(error.code).assertEqual(401);
                done();
            }
        })

        /**
         * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_setMockList_0500
         * @tc.number ACTS_SetMockList_0500
         * @tc.desc   Set mock list with wrong type
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Ability_AbilityTools_AbilityDelegator_setMockList_0500', Level.LEVEL0, async function (done) {
            console.debug('SUB_Ability_AbilityTools_AbilityDelegator_setMockList_0500====<begin');
            let abilityDelegator = abilityDelegatorRegistryNew.getAbilityDelegator();
            try {
                abilityDelegator.setMockList("test1");
                expect().assertFail()
                done()
            } catch (error) {
                console.log("SUB_Ability_AbilityTools_AbilityDelegator_setMockList_0500, error = " + error);
                expect(error.code).assertEqual(401);
                done();
            }
        })


        /**
         * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_setMockList_0600
         * @tc.number ACTS_SetMockList_0600
         * @tc.desc   Set mock list with mixed data
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Ability_AbilityTools_AbilityDelegator_setMockList_0600', Level.LEVEL0, async function (done) {
            console.debug('SUB_Ability_AbilityTools_AbilityDelegator_setMockList_0600====<begin');
            let abilityDelegator = abilityDelegatorRegistryNew.getAbilityDelegator();
            let mockList = {
                1: "1",
                "test2": "2",
                "test3": 3,
                4: 4,
            };
            abilityDelegator.setMockList(mockList);
            done();
        })

        /**
         * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_setMockList_0700
         * @tc.number ACTS_SetMockList_0700
         * @tc.desc   Set mock list with empty param
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Ability_AbilityTools_AbilityDelegator_setMockList_0700', Level.LEVEL0, async function (done) {
            console.debug('SUB_Ability_AbilityTools_AbilityDelegator_setMockList_0700====<begin');
            let abilityDelegator = abilityDelegatorRegistryNew.getAbilityDelegator();
            let mockList = {};
            abilityDelegator.setMockList(mockList);
            done();
        })

        /**
         * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_setMockList_0800
         * @tc.number ACTS_SetMockList_0800
         * @tc.desc   Set mock list with valid param
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Ability_AbilityTools_AbilityDelegator_setMockList_0800', Level.LEVEL0, async function (done) {
            console.debug('SUB_Ability_AbilityTools_AbilityDelegator_setMockList_0800====<begin');
            let abilityDelegator = abilityDelegatorRegistryNew.getAbilityDelegator();
            let mockList = {
                "test1": "1",
                "test2": "2",
                "test3": "3",
                "test4": "4",
            };
            abilityDelegator.setMockList(mockList);
            done();
        })


        /**
         * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_setMockList_0900
         * @tc.number ACTS_SetMockList_0900
         * @tc.desc   Set mock list with negative number
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Ability_AbilityTools_AbilityDelegator_setMockList_0900', Level.LEVEL0, async function (done) {
            console.debug('SUB_Ability_AbilityTools_AbilityDelegator_setMockList_0900====<begin');
            let abilityDelegator = abilityDelegatorRegistryNew.getAbilityDelegator();
            let mockList = {
                "-1": "1",
                "test2": "2"
            };
            abilityDelegator.setMockList(mockList);
            done();
        })

        /**
         * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_setMockList_1000
         * @tc.number ACTS_SetMockList_1000
         * @tc.desc   Set mock list with letter
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Ability_AbilityTools_AbilityDelegator_setMockList_1000', Level.LEVEL0, async function (done) {
            console.debug('SUB_Ability_AbilityTools_AbilityDelegator_setMockList_1000====<begin');
            let abilityDelegator = abilityDelegatorRegistryNew.getAbilityDelegator();
            let mockList = {
                "zhong": "1",
                "test2": "3"
            };
            abilityDelegator.setMockList(mockList);
            done();
        })

        /**
         * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_setMockList_1100
         * @tc.number ACTS_SetMockList_1100
         * @tc.desc   Set mock list with no param
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Ability_AbilityTools_AbilityDelegator_setMockList_1100', Level.LEVEL0, async function (done) {
            console.debug('SUB_Ability_AbilityTools_AbilityDelegator_setMockList_1100====<begin');
            let abilityDelegator = abilityDelegatorRegistryNew.getAbilityDelegator();
            let mockList = {
                "你好": "1",
                "test2": "3"
            };
            abilityDelegator.setMockList(mockList);
            done();
        })

        /**
         * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_setMockList_1200
         * @tc.number ACTS_SetMockList_1200
         * @tc.desc   Set mock list with Special characters
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Ability_AbilityTools_AbilityDelegator_setMockList_1200', Level.LEVEL0, async function (done) {
            console.debug('SUB_Ability_AbilityTools_AbilityDelegator_setMockList_1200====<begin');
            let abilityDelegator = abilityDelegatorRegistryNew.getAbilityDelegator();
            let mockList = {
                "%￥#": "1",
                "test2": "3"
            };
            abilityDelegator.setMockList(mockList);
            done();
        })

        /**
         * @tc.name   SUB_Ability_AbilityTools_AbilityDelegator_setMockList_1300
         * @tc.number ACTS_SetMockList_1300
         * @tc.desc   Set mock list with number
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Ability_AbilityTools_AbilityDelegator_setMockList_1300', Level.LEVEL0, async function (done) {
            console.debug('SUB_Ability_AbilityTools_AbilityDelegator_setMockList_1300====<begin');
            let abilityDelegator = abilityDelegatorRegistryNew.getAbilityDelegator();
            try {
                abilityDelegator.setMockList(1);
                expect().assertFail();
                done();
            } catch (error) {
                console.log("SUB_Ability_AbilityTools_AbilityDelegator_setMockList_1300, error = " + error);
                expect(error.code).assertEqual(401);
                done();
            }
        })

    })
}
