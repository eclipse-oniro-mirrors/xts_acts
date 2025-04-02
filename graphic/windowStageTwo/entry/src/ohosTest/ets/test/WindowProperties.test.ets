/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { BusinessError } from '@ohos.base';
import window from '@ohos.window';
import ohosWindow from '@ohos.window';
import common from '@ohos.app.ability.common';
import { Driver, ON } from '@ohos.UiTest';
import deviceInfo from '@ohos.deviceInfo';
import settings from '@ohos.settings';
import { image } from '@kit.ImageKit';
export default function windowPropertiesTest() {
    describe('windowProperties_test', () => {
        let sleep = (sleepMs: number) => new Promise<string>(resolve => setTimeout(resolve, sleepMs));
        let context: common.UIAbilityContext;
        let deviceType: string = '';
        let windowStage: ohosWindow.WindowStage;
        let isAutoWindow: string = '';
        beforeAll(() => {
            context = AppStorage.get('context') as common.UIAbilityContext;
            console.log('windowTest context: ' + JSON.stringify(context))
            windowStage = AppStorage.get('windowStage') as ohosWindow.WindowStage;
            deviceType = deviceInfo.deviceType;
            console.log('jsUnittest beforeAll deviceType =' + deviceType);
            isAutoWindow = settings.getValueSync(context, 'window_pcmode_switch_status', '',settings.domainName.DEVICE_SHARED);
            console.info(`isAutoWindow: ${JSON.stringify(isAutoWindow)}`);

        })
        beforeEach(() => {
            // Presets an action, which is performed before each unit test case starts.
            // The number of execution times is the same as the number of test cases defined by **it**.
            // This API supports only one parameter: preset action function.
        })
        afterEach(() => {
            // Presets a clear action, which is performed after each unit test case ends.
            // The number of execution times is the same as the number of test cases defined by **it**.
            // This API supports only one parameter: clear action function.
        })
        afterAll(() => {
            // Presets a clear action, which is performed after all test cases of the test suite end.
            // This API supports only one parameter: clear action function.
        })
        /** 
        * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GET_DENSITYINFO_JS_API_0100
        * @tc.name      : testGetWindowDensityInfo
        * @tc.desc      : getWindowDensityInfo
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
        */
        it('testGetWindowDensityInfo', 0, async (done: Function) => {
        let caseName: string = 'test_testGetWindowDensityInfo';
        let msgStr: string = 'jsUnittest ' + caseName + ' ';
        console.log(msgStr + 'begin');
        let windowClass = await windowStage.getMainWindow();
        try {
            let densityInfo: window.WindowDensityInfo = windowClass.getWindowDensityInfo();
            console.info(msgStr +`getWindowDensityInfo densityInfo: `, JSON.stringify(densityInfo));
            expect(densityInfo.systemDensity).assertEqual(densityInfo.customDensity);
            done();
        } catch (exception) {
            console.error(msgStr +
            `Failed to getWindowDensityInfo. Cause code: ${exception.code}, message: ${exception.message}`);
            if (exception.code == 801) {
            console.info(msgStr + `Current device not support API:getWindowDensityInfo`);
            done();
            } else {
            expect(false).assertTrue();
            done();
            }
        }
        });

        /**
        * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GET_DENSITYINFO_JS_API_0200
        * @tc.name      : testGetWindowDensityInfo
        * @tc.desc      : getWindowDensityInfo, DPI-1 getWindowDensityInfo
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level0
        */
        it('testSetCustomDensityParamCheck', 0, async (done: Function) => {
        let caseName: string = 'test_testSetCustomDensityParamCheck';
        let msgStr: string = 'jsUnittest ' + caseName + ' ';
        console.log(msgStr + 'begin');
        let windowClass = await windowStage.getMainWindow();
        try {
            let densityInfo1: window.WindowDensityInfo = windowClass.getWindowDensityInfo();
            console.info(msgStr +`getWindowDensityInfo densityInfo1: `, JSON.stringify(densityInfo1));
            windowStage.setCustomDensity(-1);
            console.info(msgStr + `setCustomDensity -1 success`);
            let densityInfo2: window.WindowDensityInfo = windowClass.getWindowDensityInfo();
            console.info(msgStr +`getWindowDensityInfo densityInfo2: `, JSON.stringify(densityInfo2));
            expect(densityInfo2.systemDensity).assertEqual(densityInfo2.customDensity)
            expect(densityInfo1.customDensity).assertEqual(densityInfo2.customDensity)
            done();
        } catch (exception) {
            console.error(msgStr +
            `Failed to getWindowDensityInfo. Cause code: ${exception.code}, message: ${exception.message}`);
            if (exception.code == 801) {
            console.info(msgStr + `Current device not support API:setCustomDensity`);
            done();
            } else {
            expect(false).assertTrue();
            done();
            }
        }
        });

        /**
        * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GET_DENSITYINFO_JS_API_0300
        * @tc.name      : testGetWindowDensityInfo
        * @tc.desc      : 有效左边界校验
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level1
        */
        it('testSetCustomDensityParamCheck1', 0, async (done: Function) => {
        let caseName: string = 'test_testSetCustomDensityParamCheck1';
        let msgStr: string = 'jsUnittest ' + caseName + ' ';
        console.log(msgStr + 'begin');
        try {
            windowStage.setCustomDensity(0.5);
            console.info(msgStr + `setCustomDensity 0.5 success`);
            done();
        } catch (exception) {
            console.error(msgStr +
            `Failed to getWindowDensityInfo. Cause code: ${exception.code}, message: ${exception.message}`);
            if (exception.code == 801) {
            console.info(msgStr + `Current device not support API:setCustomDensity`);
            done();
            } else {
            expect(false).assertTrue();
            done();
            }
        }
        });

        /**
        * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GET_DENSITYINFO_JS_API_0300
        * @tc.name      : testGetWindowDensityInfo
        * @tc.desc      : effective right boundary
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level1
        */
        it('testSetCustomDensityParamCheck2', 0, async (done: Function) => {
        let caseName: string = 'test_testSetCustomDensityParamCheck2';
        let msgStr: string = 'jsUnittest ' + caseName + ' ';
        console.log(msgStr + 'begin');
        try {
            windowStage.setCustomDensity(4.0);
            console.info(msgStr + `setCustomDensity 4.0 success`);
            done();
        } catch (exception) {
            console.error(msgStr +
            `Failed to getWindowDensityInfo. Cause code: ${exception.code}, message: ${exception.message}`);
            if (exception.code == 801) {
            console.info(msgStr + `Current device not support API:setCustomDensity`);
            done();
            } else {
            expect(false).assertTrue();
            done();
            }
        }
        });

        /**
        * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GET_DENSITYINFO_JS_API_0400
        * @tc.name      : testGetWindowDensityInfo
        * @tc.desc      : testGetWindowDensityInfo with aruguments null
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level1
        */
        it('testSetCustomDensityParamCheck5', 0, async (done: Function) => {
        let caseName: string = 'test_testSetCustomDensityParamCheck5';
        let msgStr: string = 'jsUnittest ' + caseName + ' ';
        console.log(msgStr + 'begin');
        try {
            windowStage.setCustomDensity(null);
            console.info(msgStr + `setCustomDensity null`);
            expect().assertFail();
            done();
        } catch (exception) {
            console.error(msgStr +
            `Failed to getWindowDensityInfo. Cause code: ${exception.code}, message: ${exception.message}`);
            if (exception.code == 801) {
            console.info(msgStr + `Current device not support API:setCustomDensity`);
            done();
            } else {
            expect(exception.code).assertEqual(401);
            done();
            }
        }
        });

        /**
        * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GET_DENSITYINFO_JS_API_0500
        * @tc.name      : testGetWindowDensityInfo
        * @tc.desc      : testGetWindowDensityInfo with arguments undefined
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level1
        */
        it('testSetCustomDensityParamCheck6', 0, async (done: Function) => {
        let caseName: string = 'test_testSetCustomDensityParamCheck6';
        let msgStr: string = 'jsUnittest ' + caseName + ' ';
        console.log(msgStr + 'begin');
        try {
            windowStage.setCustomDensity(undefined);
            console.info(msgStr + `setCustomDensity undefined`);
            expect().assertFail();
            done();
        } catch (exception) {
            console.error(msgStr +
            `Failed to getWindowDensityInfo. Cause code: ${exception.code}, message: ${exception.message}`);
            if (exception.code == 801) {
            console.info(msgStr + `Current device not support API:setCustomDensity`);
            done();
            } else {
            expect(exception.code).assertEqual(401);
            done();
            }
        }
        });

        /**
        * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GET_DENSITYINFO_JS_API_0600
        * @tc.name      : testGetWindowDensityInfo
        * @tc.desc      : new ability set dpi
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level1
        */
        it('testSetCustomDensity', 0, async (done: Function) => {
        let caseName: string = 'test_SetCustomDensity';
        let msgStr: string = 'jsUnittest ' + caseName + ' ';
        console.log(msgStr + 'begin');
        let want: Want = {
            bundleName: AppStorage.get('bundleName'),
            abilityName: 'TestAbilityDensity1'
        };
        try {
            await context.startAbility(want);
            console.info(msgStr +`Succeeded in starting ability.`);
            await sleep(500);
        } catch (err) {
            console.info(msgStr +`Failed in starting ability. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
            done();
            return;
        }
        let context1 = AppStorage.get('context1') as common.UIAbilityContext;
        console.log(msgStr +'windowTest context1: ' + JSON.stringify(context1));
        let windowStage1 = AppStorage.get('windowStage1') as ohosWindow.WindowStage;
        let windowClass1 = await windowStage1.getMainWindow();
        try {
            let densityInfo1: window.WindowDensityInfo = windowClass1.getWindowDensityInfo();
            console.info(msgStr +`getWindowDensityInfo densityInfo1: `, JSON.stringify(densityInfo1));
            expect(densityInfo1.systemDensity).assertLarger(-2);
            expect(densityInfo1.defaultDensity).assertLarger(-2);
            expect(densityInfo1.systemDensity).assertEqual(densityInfo1.customDensity);
            windowStage1.setCustomDensity(4.0);
            console.info(msgStr + `setCustomDensity 4.0 success`);
            let densityInfo2: window.WindowDensityInfo = windowClass1.getWindowDensityInfo();
            console.info(msgStr +`getWindowDensityInfo densityInfo2: `, JSON.stringify(densityInfo2));
            expect(densityInfo2.customDensity).assertEqual(4);
            expect(densityInfo1.customDensity != densityInfo2.customDensity).assertTrue();
            await context1.terminateSelf();
            await sleep(500);
            done();
        } catch (exception) {
            console.error(msgStr +
            `Failed to getWindowDensityInfo. Cause code: ${exception.code}, message: ${exception.message}`);
            await context1.terminateSelf();
            await sleep(500);
            if (exception.code == 801) {
            console.info(msgStr + `Current device not support API:setCustomDensity`);
            done();
            } else {
            expect(false).assertTrue();
            done();
            }
        }
        });

        /**
        * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GET_DENSITYINFO_JS_API_0700
        * @tc.name      : testGetWindowDensityInfo
        * @tc.desc      : new abilty setDefaultDensityEnabled true
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level1
        */
        it('testSetCustomDensity1', 0, async (done: Function) => {
        let caseName: string = 'test_SetCustomDensity1';
        let msgStr: string = 'jsUnittest ' + caseName + ' ';
        console.log(msgStr + 'begin');
        let want: Want = {
            bundleName: AppStorage.get('bundleName'),
            abilityName: 'TestAbilityDensity2'
        };
        try {
            await context.startAbility(want);
            console.info(msgStr +`Succeeded in starting ability.`);
            await sleep(500);
        } catch (err) {
            console.info(msgStr +`Failed in starting ability. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
            done();
            return;
        }
        let context2 = AppStorage.get('context2') as common.UIAbilityContext;
        console.log(msgStr +'windowTest context2: ' + JSON.stringify(context2));
        let windowStage2 = AppStorage.get('windowStage2') as ohosWindow.WindowStage;
        let windowClass2 = await windowStage2.getMainWindow();
        try {
            windowStage2.setCustomDensity(3.0);
            console.info(msgStr + `setCustomDensity 3.0 success`);
            let densityInfo1: window.WindowDensityInfo = windowClass2.getWindowDensityInfo();
            console.info(msgStr +`getWindowDensityInfo densityInfo1: `, JSON.stringify(densityInfo1));
            expect(densityInfo1.customDensity).assertEqual(3);
            windowStage2.setDefaultDensityEnabled(true);
            console.info(msgStr +`setDefaultDensityEnabled true Success`);
            let densityInfo2: window.WindowDensityInfo = windowClass2.getWindowDensityInfo();
            console.info(msgStr +`getWindowDensityInfo densityInfo2: `, JSON.stringify(densityInfo2));
            expect(densityInfo2.customDensity).assertEqual(densityInfo2.defaultDensity);
            expect(densityInfo2.customDensity != 3).assertTrue();
            await context2.terminateSelf();
            await sleep(500);
            done();
        } catch (exception) {
            console.error(msgStr +
            `Failed to getWindowDensityInfo. Cause code: ${exception.code}, message: ${exception.message}`);
            await context2.terminateSelf();
            await sleep(500);
            if (exception.code == 801) {
            console.info(msgStr + `Current device not support API:setCustomDensity`);
            done();
            } else {
            expect(false).assertTrue();
            done();
            }
        }
        });

        /**
        * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GET_DENSITYINFO_JS_API_0800
        * @tc.name      : testGetWindowDensityInfo
        * @tc.desc      : new abilty setDefaultDensityEnabled false
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level1
        */
        it('testSetCustomDensity2', 0, async (done: Function) => {
        let caseName: string = 'test_SetCustomDensity2';
        let msgStr: string = 'jsUnittest ' + caseName + ' ';
        console.log(msgStr + 'begin');
        let want: Want = {
            bundleName: AppStorage.get('bundleName'),
            abilityName: 'TestAbilityDensity1'
        };
        try {
            await context.startAbility(want);
            console.info(msgStr +`Succeeded in starting ability.`);
            await sleep(500);
        } catch (err) {
            console.info(msgStr +`Failed in starting ability. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
            done();
            return;
        }
        let context1 = AppStorage.get('context1') as common.UIAbilityContext;
        console.log(msgStr +'windowTest context1: ' + JSON.stringify(context1));
        let windowStage1 = AppStorage.get('windowStage1') as ohosWindow.WindowStage;
        let windowClass1 = await windowStage1.getMainWindow();
        try {
            windowStage1.setCustomDensity(2.0);
            console.info(msgStr + `setCustomDensity 2.0 success`);
            let densityInfo1: window.WindowDensityInfo = windowClass1.getWindowDensityInfo();
            console.info(msgStr +`getWindowDensityInfo densityInfo1: `, JSON.stringify(densityInfo1));
            expect(densityInfo1.customDensity).assertEqual(2);
            windowStage1.setDefaultDensityEnabled(false);
            console.info(msgStr +`setDefaultDensityEnabled false Success`);
            let densityInfo2: window.WindowDensityInfo = windowClass1.getWindowDensityInfo();
            console.info(msgStr +`getWindowDensityInfo densityInfo2: `, JSON.stringify(densityInfo2));
            expect(densityInfo2.customDensity).assertEqual(2);
            await context1.terminateSelf();
            await sleep(500);
            done();
        } catch (exception) {
            console.error(msgStr +
            `Failed to getWindowDensityInfo. Cause code: ${exception.code}, message: ${exception.message}`);
            await context1.terminateSelf();
            await sleep(500);
            if (exception.code == 801) {
            console.info(msgStr + `Current device not support API:setCustomDensity`);
            done();
            } else {
            expect(false).assertTrue();
            done();
            }
        }
        });

        /**
        * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GET_DENSITYINFO_JS_API_0900
        * @tc.name      : testGetWindowDensityInfo
        * @tc.desc      : multi ability,set ability with diffrent dpi
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level2
        */
        it('testSetCustomDensity3', 0, async (done: Function) => {
        let caseName: string = 'test_SetCustomDensity3';
        let msgStr: string = 'jsUnittest ' + caseName + ' ';
        console.log(msgStr + 'begin');
        let want1: Want = {
            bundleName: AppStorage.get('bundleName'),
            abilityName: 'TestAbilityDensity1'
        };
        let want2: Want = {
            bundleName: AppStorage.get('bundleName'),
            abilityName: 'TestAbilityDensity2'
        };
        try {
            await context.startAbility(want2);
            console.info(msgStr +`Succeeded in starting ability.`);
            await sleep(500);
        } catch (err) {
            console.info(msgStr +`Failed in starting ability. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
            done();
            return;
        }
        let context1:common.UIAbilityContext | undefined;
        let context2 = AppStorage.get('context2') as common.UIAbilityContext;
        console.log(msgStr +'windowTest context1: ' + JSON.stringify(context1));
        console.log(msgStr +'windowTest context2: ' + JSON.stringify(context2));
        let windowStage2 = AppStorage.get('windowStage2') as ohosWindow.WindowStage;
        let windowClass2 = await windowStage2.getMainWindow();
        try {
            windowStage2.setCustomDensity(3.5);
            console.info(msgStr + `setCustomDensity 3.5 success`);
            let densityInfo1: window.WindowDensityInfo = windowClass2.getWindowDensityInfo();
            console.info(msgStr +`getWindowDensityInfo densityInfo1: `, JSON.stringify(densityInfo1));
            await context2.terminateSelf();
            await sleep(500);
            try {
            await context.startAbility(want1);
            console.info(msgStr +`Succeeded in starting ability.`);
            await sleep(500);
            } catch (err) {
            console.info(msgStr +`Failed in starting ability. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
            done();
            return;
            }
            context1 = AppStorage.get('context1') as common.UIAbilityContext;
            console.log(msgStr +'windowTest context1: ' + JSON.stringify(context1));
            let windowStage1 = AppStorage.get('windowStage1') as ohosWindow.WindowStage;
            let windowClass1 = await windowStage1.getMainWindow();
            windowStage1.setCustomDensity(2.5);
            console.info(msgStr + `setCustomDensity 2.5 success`);
            let densityInfo2: window.WindowDensityInfo = windowClass1.getWindowDensityInfo();
            console.info(msgStr +`getWindowDensityInfo densityInfo2: `, JSON.stringify(densityInfo2));
            expect(densityInfo1.customDensity).assertEqual(3.5);
            expect(densityInfo2.customDensity).assertEqual(2.5);
            await context1.terminateSelf();
            await sleep(500);
            done();
        } catch (exception) {
            console.error(msgStr +
            `Failed to getWindowDensityInfo. Cause code: ${exception.code}, message: ${exception.message}`);
            await context1?.terminateSelf();
            await sleep(500);
            await context2.terminateSelf();
            await sleep(500);
            if (exception.code == 801) {
            console.info(msgStr + `Current device not support API:setCustomDensity`);
            done();
            } else {
            expect(false).assertTrue();
            done();
            }
        }
        });

        /**
        * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GET_DENSITYINFO_JS_API_1000
        * @tc.name      : testGetWindowDensityInfo
        * @tc.desc      : on systemDensityChange
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level2
        */
        it('testOnSetCustomDensity', 0, async (done: Function) => {
        let caseName: string = 'test_testOnSetCustomDensity';
        let msgStr: string = 'jsUnittest ' + caseName + ' ';
        console.log(msgStr + 'begin');
        let windowClass = await windowStage.getMainWindow();
        let want: Want = {
            bundleName: AppStorage.get('bundleName'),
            abilityName: 'TestAbilityDensity1'
        };
        let g_flag: number = 0
        let callback1: Callback<number> = async (data) => {
            console.info(msgStr +`on_systemDensityChange callback1 data: ${data}`);
            g_flag += 1
            expect(data).assertEqual(2);
        }
        let callback2: Callback<number> = async (data) => {
            console.info(msgStr +`on_systemDensityChange callback2 data: ${data}`);
            g_flag += 1
            expect(data).assertEqual(2);
        }
        try {
            windowClass.on("systemDensityChange", callback1);
            windowClass.on("systemDensityChange", callback2);
            console.info(msgStr +`Succeeded on systemDensityChange twice.`);
        } catch (exception) {
            console.error(msgStr +
            `Failed to on systemDensityChange. Cause code: ${exception.code}, message: ${exception.message}`);
            if (exception.code == 801) {
            console.info(msgStr + `Current device not support API:on_systemDensityChange`);
            done();
            return;
            } else {
            expect(false).assertTrue();
            done();
            return;
            }
        }
        try {
            await context.startAbility(want);
            console.info(msgStr +`Succeeded in starting ability.`);
            await sleep(500);
        } catch (err) {
            console.info(msgStr +`Failed in starting ability. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
            done();
            return;
        }
        let context1 = AppStorage.get('context1') as common.UIAbilityContext;
        console.log(msgStr +'windowTest context1: ' + JSON.stringify(context1));
        let windowStage1 = AppStorage.get('windowStage1') as ohosWindow.WindowStage;
        try {
            windowStage1.setCustomDensity(2);
            console.info(msgStr + `setCustomDensity 2 success`);
            await sleep(1000);
            windowClass.off("systemDensityChange");
            console.info(msgStr + `off all systemDensityChange success`);
            await context1.terminateSelf();
            await sleep(500);
            expect(g_flag).assertEqual(0);
            done();
        } catch (exception) {
            console.error(msgStr +
            `Failed to getWindowDensityInfo. Cause code: ${exception.code}, message: ${exception.message}`);
            await context1.terminateSelf();
            await sleep(500);
            if (exception.code == 801) {
            console.info(msgStr + `Current device not support API:setCustomDensity`);
            done();
            } else {
            expect(false).assertTrue();
            done();
            }
        }
        });

        /**
        * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GET_DENSITYINFO_JS_API_1100
        * @tc.name      : testGetWindowDensityInfo
        * @tc.desc      : off systemDensityChange event
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level2
        */
        it('testOnSetCustomDensity1', 0, async (done: Function) => {
        let caseName: string = 'test_testOnSetCustomDensity1';
        let msgStr: string = 'jsUnittest ' + caseName + ' ';
        console.log(msgStr + 'begin');
        let windowClass = await windowStage.getMainWindow();
        let callback1: Callback<number> = async (data) => {
            console.info(msgStr +`on_systemDensityChange callback1 data: ${data}`);
        }
        let callback2: Callback<number> = async (data) => {
            console.info(msgStr +`on_systemDensityChange callback2 data: ${data}`);
        }
        try {
            windowClass.on("systemDensityChange", callback1);
            windowClass.on("systemDensityChange", callback2);
            console.info(msgStr +`Succeeded on systemDensityChange twice.`);
            windowClass.off("systemDensityChange");
            console.info(msgStr +`Succeeded off all systemDensityChange.`);
        } catch (exception) {
            console.error(msgStr +
            `Failed to on systemDensityChange. Cause code: ${exception.code}, message: ${exception.message}`);
            if (exception.code == 801) {
            console.info(msgStr + `Current device not support API:on_systemDensityChange`);
            done();
            return;
            } else {
            expect(false).assertTrue();
            done();
            }
        }
        done();
        });
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_8000
         * @tc.name      : testSetGestureBackEnabledTrue
         * @tc.desc      : Set whether to disable the gesture back function.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
         */
        it('testSetGestureBackEnabledTrue', 0, async (done: Function) => {
            let caseName = 'TestSetGestureBackEnabledTrue';
            let windowClass = windowStage.getMainWindowSync();
            windowClass.setGestureBackEnabled(true).then(() => {
                console.info(`${caseName} Succeeded in setting gesture back enabled true.`);
                const isGestureBackEnabled = windowClass.isGestureBackEnabled();
                console.info(`${caseName} Succeeded in getting gesture back enabled. Data: ${isGestureBackEnabled}`);
                expect(isGestureBackEnabled).assertTrue();
                done();
            }).catch((err: BusinessError) => {
                if (err.code == 801) {
                    console.info(`${caseName} The current device type does not support to setGestureBackEnabled`);
                    done();
                } else {
                    console.error(`${caseName} Failed to set gesture back enabled. Cause code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                }
            });
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_8100
         * @tc.name      : testSetGestureBackEnabledFalse
         * @tc.desc      : Set whether to disable the gesture back function.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
         */
        it('testSetGestureBackEnabledFalse', 0, async (done: Function) => {
            let caseName = 'TestSetGestureBackEnabledFalse';
            let windowClass = windowStage.getMainWindowSync();
            windowClass.setGestureBackEnabled(false).then(async () => {
                console.info(`${caseName} Succeeded in setting gesture back enabled false.`);
                const isGestureBackEnabled = windowClass.isGestureBackEnabled();
                console.info(`${caseName} Succeeded in getting gesture back enabled. Data: ${isGestureBackEnabled}`);
                expect(isGestureBackEnabled).assertFalse();
                done();
            }).catch((err: BusinessError) => {
                if (err.code == 801) {
                    console.info(`${caseName} The current device type does not support to setGestureBackEnabled`);
                    done();
                } else {
                    console.error(`${caseName} Failed to set gesture back enabled. Cause code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                }
            });
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_8200
         * @tc.name      : testSetGestureBackEnabledInSubWindow
         * @tc.desc      : Set whether to disable the gesture back function.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
         */
        it('testSetGestureBackEnabledInSubWindow', 0, async (done: Function) => {
            let caseName = 'TestSetGestureBackEnabledInSubWindow';
            let subWindowClass = await windowStage.createSubWindow('subWindow');
            console.info(`${caseName} Succeeded in creating the sub window.`);
            await subWindowClass.setUIContent('testability/pages/First/index2');
            console.info(`${caseName} Succeeded in loading the sub window content.`);
            await subWindowClass.showWindow();
            console.info(`${caseName} Succeeded in showing the sub window.`);
            subWindowClass.setGestureBackEnabled(true).then(() => {
                console.info(`${caseName} Succeeded in setting gesture back enabled.`);
                expect(false).assertTrue();
                done();
            }).catch(async (err: BusinessError) => {
                if (err.code == 801) {
                    console.info(`${caseName} The current device type does not support to setGestureBackEnabled.`);
                    await subWindowClass.destroyWindow();
                    done();
                } else {
                    console.error(`${caseName} Unauthorized operation.`);
                    expect(err.code).assertEqual(1300004);
                    await subWindowClass.destroyWindow();
                    done();
                }
            });
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_8300
         * @tc.name      : testSetGestureBackEnabledInSysSubWindow
         * @tc.desc      : Set whether to disable the gesture back function.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
         */
        it('testSetGestureBackEnabledInSysSubWindow', 0, async (done: Function) => {
            let caseName = 'TestSetGestureBackEnabledInSysSubWindow';
            let config: window.Configuration = {
                name: "systemWindow",
                windowType: window.WindowType.TYPE_DIALOG,
                ctx: context
            };
            let subWindowClass = await window.createWindow(config);
            console.info(`${caseName} Succeeded in creating the system sub window.`);
            await subWindowClass.setUIContent('testability/pages/First/index2');
            console.info(`${caseName} Succeeded in loading the system sub window content.`);
            await subWindowClass.showWindow();
            console.info(`${caseName} Succeeded in showing the system sub window.`);
            subWindowClass.setGestureBackEnabled(true).then(() => {
                console.info(`${caseName} Succeeded in setting gesture back enabled.`);
                expect(false).assertTrue();
                done();
            }).catch(async (err: BusinessError) => {
                if (err.code == 801) {
                    console.info(`${caseName} The current device type does not support to setGestureBackEnabled.`);
                    await subWindowClass.destroyWindow();
                    done();
                } else {
                    console.error(`${caseName} Unauthorized operation.`);
                    expect(err.code).assertEqual(1300004);
                    await subWindowClass.destroyWindow();
                    done();
                }
            });
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_8400
         * @tc.name      : testSetGestureBackEnabledInDestroyWindow
         * @tc.desc      : Set whether to disable the gesture back function.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
         */
        it('testSetGestureBackEnabledInDestroyWindow', 0, async (done: Function) => {
            let caseName = 'TestSetGestureBackEnabledInDestroyWindow';
            let subWindowClass = await windowStage.createSubWindow('subWindow');
            console.info(`${caseName} Succeeded in creating the sub window.`);
            await subWindowClass.setUIContent('testability/pages/First/index2');
            console.info(`${caseName} Succeeded in loading the sub window content.`);
            await subWindowClass.showWindow();
            console.info(`${caseName} Succeeded in showing the sub window.`);
            await subWindowClass.destroyWindow();
            subWindowClass.setGestureBackEnabled(true).then(() => {
                console.info(`${caseName} Succeeded in setting gesture back enabled.`);
                expect(false).assertTrue();
                done();
            }).catch(async (err: BusinessError) => {
                if (err.code == 801) {
                    console.info(`${caseName} The current device type does not support to setGestureBackEnabled.`);
                    done();
                } else {
                    console.error(`${caseName} This window state is abnormal.`);
                    expect(err.code).assertEqual(1300002);
                    done();
                }
            });
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_8500
         * @tc.name      : testGetGestureBackEnabledInSubWindow
         * @tc.desc      : get whether to disable the gesture back function.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
         */
        it('testGetGestureBackEnabledInSubWindow', 0, async (done: Function) => {
            let caseName = 'TestGetGestureBackEnabledInSubWindow';
            let subWindowClass = await windowStage.createSubWindow('subWindow');
            console.info(`${caseName} Succeeded in creating the sub window.`);
            try {
                await subWindowClass.setUIContent('testability/pages/First/index2');
                console.info(`${caseName} Succeeded in loading the sub window content.`);
                await subWindowClass.showWindow();
                console.info(`${caseName} Succeeded in showing the sub window.`);
                subWindowClass.isGestureBackEnabled();
                expect(false).assertTrue();
                done();
            } catch (exception) {
                if (exception.code == 801) {
                    console.info(`${caseName} The current device type does not support to getGestureBackEnabled.`);
                    done();
                } else {
                    console.error(`${caseName} Unauthorized operation.`);
                    expect(exception.code).assertEqual(1300004);
                    await subWindowClass.destroyWindow();
                    done();
                }
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0100
         * @tc.name      : testGetWindowPropertiesInMainWindow
         * @tc.desc      : get the current window properties
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
         */
        it('testGetWindowPropertiesInMainWindow', 0, (done: Function) => {
            let caseName = 'TestGetWindowPropertiesInMainWindow';
            try {
                let windowClass = windowStage.getMainWindowSync();
                let properties = windowClass.getWindowProperties();
                console.info(`${caseName} Succeeded get window proerties`);
                expect(properties !== null).assertTrue();
                done();
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0200
         * @tc.name      : testGetWindowPropertiesInSubWindow
         * @tc.desc      : get the current window properties
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
         */
        it('testGetWindowPropertiesInSubWindow', 0, (done: Function) => {
            let caseName = 'TestGetWindowPropertiesInSubWindow';
            try {
                windowStage.createSubWindow('subWindow').then((data) => {
                    console.info(`${caseName} Succeeded in creating the subWindow. Data:` + JSON.stringify(data));
                    let properties = data.getWindowProperties();
                    console.info(`${caseName} Succeeded get window proerties`);
                    expect(properties !== null).assertTrue();
                    done();
                }).catch((err: BusinessError) => {
                    console.error(`${caseName}: Failed to create the Window. Cause code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                });
            } catch (exception) {
                console.error(`${caseName}: Failed to create the window. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })

        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SET_WINDOW_GRAYSCALE_0300
         * @tc.name      : testSetWindowGrayScale0
         * @tc.desc      : test setWindowGrayScale
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("testSetWindowGrayScale0", 0, async (done: Function) => {
            let caseName = "TestSetWindowGrayScale0";
            let windowClass = await windowStage.getMainWindow();
            try {
                await windowClass.setUIContent('testability/pages/First/index2');
                console.info(`${caseName} Succeeded in loading the content.`);
                windowClass.setWindowGrayScale(0).then(() => {
                    console.info(`${caseName}: Succeeded in setting the grayScale 0.`);
                    done();
                }).catch((err: BusinessError) => {
                    if (err.code == 801) {
                        console.info(`${caseName}: 此设备不支持setWindowGrayScale能力.`);
                        done();
                    } else {
                        console.error(`${caseName}: Failed to set the grayScale 0. Cause code: ${err.code}, message: ${err.message}`);
                        expect().assertFail();
                        done();
                    }
                });
            } catch (error) {
                console.error(`${caseName}: Error ${JSON.stringify(error)}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SET_WINDOW_GRAYSCALE_0400
         * @tc.name      : testSetWindowGrayScale0.5
         * @tc.desc      : test setWindowGrayScale
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("testSetWindowGrayScale0.5", 0, async (done: Function) => {
            let caseName = "TestSetWindowGrayScale0.5";
            let windowClass = await windowStage.getMainWindow();
            try {
                await windowClass.setUIContent('testability/pages/First/index2');
                console.info(`${caseName} Succeeded in loading the content.`);
                windowClass.setWindowGrayScale(0.5).then(() => {
                    console.info(`${caseName}: Succeeded in setting the grayScale 0.5.`);
                    done();
                }).catch((err: BusinessError) => {
                    if (err.code == 801) {
                        console.info(`${caseName} 此设备不支持setWindowGrayScale能力.`);
                        done();
                    } else {
                        console.error(`${caseName} Failed to set the grayScale 0.5. Cause code: ${err.code}, message: ${err.message}`);
                        expect().assertFail();
                        done();
                    }
                });
            } catch (error) {
                console.error(`${caseName}: Error ${JSON.stringify(error)}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SET_WINDOW_GRAYSCALE_0500
         * @tc.name      : testSetWindowGrayScale1
         * @tc.desc      : test setWindowGrayScale
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("testSetWindowGrayScale1", 0, async (done: Function) => {
            let caseName = "TestSetWindowGrayScale1";
            let windowClass = await windowStage.getMainWindow();
            try {
                await windowClass.setUIContent('testability/pages/First/index2');
                console.info(`${caseName} Succeeded in loading the content.`);
                windowClass.setWindowGrayScale(1).then(() => {
                    console.info(`${caseName} Succeeded in setting the grayScale 1.`);
                    done();
                }).catch((err: BusinessError) => {
                    if (err.code == 801) {
                        console.info(`${caseName} 此设备不支持setWindowGrayScale能力.`);
                        done();
                    } else {
                        console.error(`${caseName} Failed to set the grayScale 1. Cause code: ${err.code}, message: ${err.message}`);
                        expect().assertFail();
                        done();
                    }
                });
            } catch (error) {
                console.error(`${caseName}: Error ${JSON.stringify(error)}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SET_WINDOW_GRAYSCALE_0600
         * @tc.name      : testSetWindowGrayScaleNegative1
         * @tc.desc      : test setWindowGrayScale
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("testSetWindowGrayScaleNegative1", 0, async (done: Function) => {
            let caseName = "TestSetWindowGrayScaleNegative1";
            let windowClass = await windowStage.getMainWindow();
            try {
                await windowClass.setUIContent('testability/pages/First/index2');
                console.info(`${caseName} Succeeded in loading the content.`);
                windowClass.setWindowGrayScale(-1).then(() => {
                    console.info(`${caseName}: Succeeded in setting the grayScale -1.`);
                    expect(false).assertTrue();
                    done();
                }).catch((err: BusinessError) => {
                    if (err.code == 801) {
                        console.info(`${caseName} 此设备不支持setWindowGrayScale能力.`);
                        done();
                    } else {
                        console.error(`${caseName} Failed to set the grayScale -1. Cause code: ${err.code}, message: ${err.message}`);
                        expect().assertFail();
                        done();
                    }
                });
            } catch (error) {
                console.error(`${caseName}: Parameter Error ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(401);
                done();
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SET_WINDOW_GRAYSCALE_0700
         * @tc.name      : testSetWindowGrayScale2
         * @tc.desc      : test setWindowGrayScale
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("testSetWindowGrayScale2", 0, async (done: Function) => {
            let caseName = "TestSetWindowGrayScale2";
            let windowClass = await windowStage.getMainWindow();
            try {
                await windowClass.setUIContent('testability/pages/First/index2');
                console.info(`${caseName} Succeeded in loading the content.`);
                windowClass.setWindowGrayScale(2).then(() => {
                    console.info(`${caseName}: Succeeded in setting the grayScale 2.`);
                    expect(false).assertTrue();
                    done();
                }).catch((err: BusinessError) => {
                    if (err.code == 801) {
                        console.info(`${caseName}: 此设备不支持setWindowGrayScale能力.`);
                        done();
                    } else {
                        console.error(`${caseName}: Failed to set the grayScale 2. Cause code: ${err.code}, message: ${err.message}`);
                        expect().assertFail();
                        done();
                    }
                });
            } catch (error) {
                console.error(`${caseName}: Parameter ${JSON.stringify(error)}`);
                expect(error.code).assertEqual(401);
                done();
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_SET_WINDOW_GRAYSCALE_0800
         * @tc.name      : testSubWindowSetWindowGrayScale1
         * @tc.desc      : test subWindow setWindowGrayScale
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("testSubWindowSetWindowGrayScale1", 0, async (done: Function) => {
            let caseName = "TestSubWindowSetWindowGrayScale1";
            try {
                windowStage.createSubWindow('TestSubWindowSetWindowGrayScale1').then(async (data) => {
                    console.info(`${caseName}: Succeeded in creating the subwindow. Data: ${JSON.stringify(data)}`);
                    let subWindowClass = data;
                    await subWindowClass.setUIContent('testability/pages/First/index2')
                    console.info(`${caseName}: Succeeded in setUiContent.`);
                    subWindowClass.setWindowGrayScale(1).then(() => {
                        console.info(`${caseName}: Succeeded in setting the grayScale 1.`);
                        done();
                    }).catch((err: BusinessError) => {
                        if (err.code == 801) {
                            console.info(`${caseName}: 此设备不支持setWindowGrayScale能力.`);
                            done();
                        } else {
                            console.error(`${caseName}: Failed to set the grayScale. Cause code: ${err.code}, message: ${err.message}`);
                            expect().assertFail();
                            done();
                        }
                    });
                }).catch((err: BusinessError) => {
                    console.log(`${caseName}: Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                });
            } catch (error) {
                console.log(`${caseName}: Failed to setWindowGrayScale ${JSON.stringify(error)}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGETWO_JS_API_0900
         * @tc.name      : testOnRectChangeOptionsResizeSubWindow
         * @tc.desc      : Test the function value of testRectChangeOptions
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
         */
        it("testOnRectChangeOptionsResizeSubWindow", 0, async (done: Function) => {
            let caseName = "TestOnRectChangeOptionsResizeSubWindow";
            try {
                let subWindowClass = await windowStage.createSubWindow("subwindow");
                console.info(`${caseName} Succeeded in creating the sub window.`);
                await subWindowClass.showWindow();
                await sleep(1000);
                subWindowClass.on('windowSizeChange', async (data) => {
                    console.info(`${caseName} Succeeded window rect changes. Data: ${JSON.stringify(data)}`);
                    expect(data.width).assertEqual(500);
                    expect(data.height).assertEqual(500);
                    subWindowClass.off('windowSizeChange');
                    await subWindowClass.destroyWindow();
                    done();
                });
                await subWindowClass.resize(500, 500);
                console.info(`${caseName} Succeeded in changing the sub window size.`);
            } catch (error) {
                console.error(`${caseName}: Error: ${JSON.stringify(error)}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGETWO_JS_API_1000
         * @tc.name      : testOnRectChangeOptionsResizeMainWindow
         * @tc.desc      : Test the function value of testRectChangeOptions
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
         */
        it("testOnRectChangeOptionsResizeMainWindow", 0, async (done: Function) => {
            let caseName = "TestOnRectChangeOptionsResizeMainWindow";
            let windowClass = windowStage.getMainWindowSync();
            try {
                windowClass.on('windowSizeChange', async (data) => {
                    console.info(`${caseName} Succeeded window rect changes. Data: ${JSON.stringify(data)}`);
                    expect(data.width).assertEqual(1000);
                    expect(data.height).assertEqual(500);
                    windowClass.off('windowSizeChange');
                    done();
                });
                await windowClass.resize(1000, 500);
                console.info(`${caseName} Succeeded in changing the window size.`);
            } catch (error) {
                if (error.code == 1300002) {
                    try {
                        const windowStatus = windowClass.getWindowStatus();
                        console.info(`${caseName} This window state is: ${windowStatus}. full-screen is not to support resize`);
                        windowClass.off('windowSizeChange');
                        expect(windowStatus).assertEqual(window.WindowStatusType.FULL_SCREEN);
                        done();
                    } catch (error) {
                        if (error.code === 801) {
                            console.info(`${caseName} The current device type does not support to getWindowStatus`);
                            windowClass.off('windowSizeChange');
                            done();
                        } else {
                            console.error(`${caseName}: Error: ${JSON.stringify(error)}`);
                            windowClass.off('windowSizeChange');
                            expect().assertFail();
                            done();
                        }
                    }
                } else {
                    console.error(`${caseName}: Error: ${JSON.stringify(error)}`);
                    windowClass.off('windowSizeChange');
                    expect().assertFail();
                    done();
                }
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGETWO_JS_API_1100
         * @tc.name      : testOnRectChangeOptionsMove
         * @tc.desc      : Test the function value of testRectChangeOptions
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
         */
        it("testOnRectChangeOptionsMove", 0, async (done: Function) => {
            let caseName = "TestOnRectChangeOptionsMove";
            try {
                let subWindowClass = await windowStage.createSubWindow("TestOnRectChangeOptionsMove");
                console.info(`${caseName} Succeeded in creating the sub window.`);
                await subWindowClass.showWindow();
                await sleep(1000);
                subWindowClass.on('windowRectChange', async (data) => {
                    console.info(`${caseName}: Succeeded window rect changes. Data: ${JSON.stringify(data)}`);
                    expect(data.rect.left).assertEqual(300);
                    expect(data.rect.top).assertEqual(300);
                    subWindowClass.off('windowRectChange');
                    await subWindowClass.destroyWindow();
                    done();
                });
                await subWindowClass.moveWindowTo(300, 300);
                console.info(`${caseName} Succeeded in moving the window.`);
            } catch (error) {
                if (error.code == 1300002) {
                    console.info(`${caseName} This window state is abnormal`);
                    done();
                } else if (error.code == 801) {
                    console.info(`${caseName} The current device type does not support to windowRectChange`);
                    done();
                } else {
                    console.error(`${caseName}: Error: ${JSON.stringify(error)}`);
                    expect().assertFail();
                    done();
                }
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGETWO_JS_API_1200
         * @tc.name      : testOffRectChangeOptions
         * @tc.desc      : Test the function value of testRectChangeOptions
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
         */
        it("testOffRectChangeOptions", 0, async (done: Function) => {
            let caseName = "TestOffRectChangeOptions";
            try {
                let subWindowClass = await windowStage.createSubWindow("subwindow");
                console.info(`${caseName} Succeeded in creating the sub window.`);
                await subWindowClass.showWindow();
                let count = 0;
                let callback = () => {
                    console.info(`${caseName}: Succeeded listen window rect changes.`);
                    count++;
                }
                subWindowClass.on('windowRectChange', callback);
                subWindowClass.off('windowRectChange');
                await subWindowClass.moveWindowTo(300, 300);
                console.info(`${caseName} Succeeded in moving the window.`);
                expect(count).assertEqual(0);
                await subWindowClass.destroyWindow();
                done();
            } catch (error) {
                if (error.code == 1300002) {
                    console.info(`${caseName} This window state is abnormal`);
                    done();
                } else if (error.code == 801) {
                    console.info(`${caseName} The current device type does not support to windowRectChange`);
                    done();
                } else {
                    console.error(`${caseName}: Error: ${JSON.stringify(error)}`);
                    expect().assertFail();
                    done();
                }
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGETWO_JS_API_1300
         * @tc.name      : testOffOneRectChangeOptions
         * @tc.desc      : Test the function value of testRectChangeOptions
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
         */
        it("testOffOneRectChangeOptions", 0, async (done: Function) => {
            let caseName = "TestOffOneRectChangeOptions";
            try {
                let subWindowClass = await windowStage.createSubWindow("TestOffOneRectChangeOptions");
                console.info(`${caseName} Succeeded in creating the sub window.`);
                await subWindowClass.showWindow();
                let count1 = 0;
                let count2 = 0;
                let callback1 = () => {
                    console.info(`${caseName}: callback1 Succeeded listen window rect changes.`);
                    count1++;
                }
                let callback2 = () => {
                    console.info(`${caseName}: callback2 Succeeded listen window rect changes.`);
                    count2++;
                }
                subWindowClass.on('windowRectChange', callback1);
                subWindowClass.on('windowRectChange', callback2);
                subWindowClass.off('windowRectChange', callback1);
                await sleep(1000);
                await subWindowClass.moveWindowTo(300, 300);
                console.info(`${caseName} Succeeded in moving the window.`);
                expect(count1).assertEqual(0);
                expect(count2).assertLarger(0);
                subWindowClass.off('windowRectChange', callback2);
                await subWindowClass.destroyWindow();
                done();
            } catch (error) {
                if (error.code == 1300002) {
                    console.info(`${caseName} This window state is abnormal`);
                    done();
                } else if (error.code == 801) {
                    console.info(`${caseName} The current device type does not support to windowRectChange`);
                    done();
                } else {
                    console.error(`${caseName}: Error: ${JSON.stringify(error)}`);
                    expect().assertFail();
                    done();
                }
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGETWO_JS_API_1400
         * @tc.name      : testOnTwoRectChangeOptions
         * @tc.desc      : Test the function value of testRectChangeOptions
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
         */
        it("testOnTwoRectChangeOptions", 0, async (done: Function) => {
            let caseName = "TestOnTwoRectChangeOptions";
            try {
                let subWindowClass = await windowStage.createSubWindow("subwindow");
                console.info(`${caseName} Succeeded in creating the sub window.`);
                await subWindowClass.showWindow();
                let count1 = 0;
                let count2 = 0;
                let callback1 = () => {
                    console.info(`${caseName}: callback1 Succeeded listen window rect changes.`);
                    count1++;
                }
                let callback2 = () => {
                    console.info(`${caseName}: callback2 Succeeded listen window rect changes.`);
                    count2++;
                }
                subWindowClass.on('windowRectChange', callback1);
                subWindowClass.on('windowRectChange', callback2);
                await sleep(1000);
                await subWindowClass.moveWindowTo(300, 300);
                console.info(`${caseName} Succeeded in moving the window.`);
                expect(count1).assertLarger(0);
                expect(count2).assertLarger(0);
                subWindowClass.off('windowRectChange');
                await subWindowClass.destroyWindow();
                done();
            } catch (error) {
                if (error.code == 1300002) {
                    console.info(`${caseName} This window state is abnormal`);
                    done();
                } else if (error.code == 801) {
                    console.info(`${caseName} The current device type does not support to windowRectChange`);
                    done();
                } else {
                    console.error(`${caseName}: Error: ${JSON.stringify(error)}`);
                    expect().assertFail();
                    done();
                }
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGETWO_JS_API_1500
         * @tc.name      : testOffTwoRectChangeOptions
         * @tc.desc      : Test the function value of testRectChangeOptions
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
         */
        it("testOffTwoRectChangeOptions", 0, async (done: Function) => {
            let caseName = "TestOffTwoRectChangeOptions";
            try {
                let subWindowClass = await windowStage.createSubWindow("subwindow");
                console.info(`${caseName} Succeeded in creating the sub window.`);
                await subWindowClass.showWindow();
                let count1 = 0;
                let count2 = 0;
                let callback1 = () => {
                    console.info(`${caseName}: callback1 Succeeded listen window rect changes.`);
                    count1++;
                }
                let callback2 = () => {
                    console.info(`${caseName}: callback2 Succeeded listen window rect changes.`);
                    count2++;
                }
                subWindowClass.on('windowRectChange', callback1);
                subWindowClass.on('windowRectChange', callback2);
                subWindowClass.off('windowRectChange');
                await sleep(1000);
                await subWindowClass.moveWindowTo(300, 300);
                console.info(`${caseName} Succeeded in moving the window.`);
                expect(count1).assertEqual(0);
                expect(count2).assertEqual(0);
                await subWindowClass.destroyWindow();
                done();
            } catch (error) {
                if (error.code == 1300002) {
                    console.info(`${caseName} This window state is abnormal`);
                    done();
                } else if (error.code == 801) {
                    console.info(`${caseName} The current device type does not support to windowRectChange`);
                    done();
                } else {
                    console.error(`${caseName}: Error: ${JSON.stringify(error)}`);
                    expect().assertFail();
                    done();
                }
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1600
         * @tc.name      : testIsSubWindowSupportWideGamutCallback
         * @tc.desc      : Check whether the subwindow supports the wide color gamut mode
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testIsSubWindowSupportWideGamutCallback', 0, async (done: Function) => {
            let caseName = 'TestIsSubWindowSupportWideGamutCallback';
            try {
                windowStage.createSubWindow('SubWindow1').then((data) => {
                    let subWindowClass = data;
                    console.info('Succeeded in creating the subwindow. Data: ' + JSON.stringify(data));
                    subWindowClass.isWindowSupportWideGamut(async (err: BusinessError, data) => {
                        const errCode: number = err.code;
                        if (errCode) {
                            console.error(`${caseName} Failed to check whether the window support WideGamut. Cause code: ${err.code}, message: ${err.message}`);
                            expect().assertFail();
                            done();
                        } else {
                            console.info(`${caseName} Succeeded in checking whether the window support WideGamut Data: ` + JSON.stringify(data));
                            await subWindowClass.destroyWindow();
                            done();
                        }
                    });
                }).catch((err: BusinessError) => {
                    console.error(`${caseName} Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                });
            } catch (exception) {
                console.error(`${caseName} Failed to create the subwindow. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1700
         * @tc.name      : testIsSubWindowSupportWideGamutPromise
         * @tc.desc      : Check whether the subwindow supports the wide color gamut mode
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testIsSubWindowSupportWideGamutPromise', 0, async (done: Function) => {
            let caseName = 'TestIsSubWindowSupportWideGamutPromise';
            try {
                windowStage.createSubWindow('SubWindow2').then((data) => {
                    console.info(`${caseName} Succeeded in creating the subwindow. Data: ` + JSON.stringify(data));
                    let subWindowClass = data;
                    subWindowClass.isWindowSupportWideGamut().then(async (data) => {
                        console.info(`${caseName} Succeeded in checking whether the window support WideGamut. Data: ` + JSON.stringify(data));
                        await subWindowClass.destroyWindow();
                        done();
                    }).catch((err: BusinessError) => {
                        console.error(`${caseName} Failed to check whether the window support WideGamut. Cause code: ${err.code}, message: ${err.message}`);
                        expect().assertFail();
                        done();
                    });
                }).catch((err: BusinessError) => {
                    console.error(`${caseName} Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                });
            } catch (exception) {
                console.error(`${caseName} Failed to create the subwindow. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1800
         * @tc.name      : testIsMainWindowSupportWideGamutCallback
         * @tc.desc      : Check whether the mainWindow supports the wide color gamut mode
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testIsMainWindowSupportWideGamutCallback', 0, async (done: Function) => {
            let caseName = 'TestIsMainWindowSupportWideGamutCallback';
            try {
                let windowClass = windowStage.getMainWindowSync();
                windowClass.isWindowSupportWideGamut((err: BusinessError, data) => {
                    const errCode: number = err.code;
                    if (errCode) {
                        console.error(`${caseName} Failed to check whether the window support WideGamut. Cause code: ${err.code}, message: ${err.message}`);
                        expect().assertFail();
                        done();
                    } else {
                        console.info(`${caseName} Succeeded in checking whether the window support WideGamut Data: ` + JSON.stringify(data));
                        done();
                    }
                });
            } catch (exception) {
                console.error(`${caseName} Failed to get the window. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1900
         * @tc.name      : testIsMainWindowSupportWideGamutPromise
         * @tc.desc      : Check whether the mainWindow supports the wide color gamut mode
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testIsMainWindowSupportWideGamutPromise', 0, async (done: Function) => {
            let caseName = 'TestIsMainWindowSupportWideGamutPromise';
            try {
                let windowClass = windowStage.getMainWindowSync();
                windowClass.isWindowSupportWideGamut().then((data) => {
                    console.info(`${caseName} Succeeded in checking whether the window support WideGamut. Data: ` + JSON.stringify(data));
                    done();
                }).catch((err: BusinessError) => {
                    console.error(`${caseName} Failed to check whether the window support WideGamut. Cause code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                });
            } catch (exception) {
                console.error(`${caseName} Failed to create the subwindow. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2000
         * @tc.name      : testSetMainWindowColorSpaceDefaultCallback
         * @tc.desc      : set window colorSpace
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testSetMainWindowColorSpaceDefaultCallback', 0, async (done: Function) => {
            let caseName = 'TestSetMainWindowColorSpaceDefaultCallback';
            try {
                let windowClass = windowStage.getMainWindowSync();
                windowClass.setWindowColorSpace(window.ColorSpace.DEFAULT, (err: BusinessError) => {
                    const errCode: number = err.code;
                    if (errCode) {
                        console.error(`${caseName} Failed to set window colorspace. Cause code: ${err.code}, message: ${err.message}`);
                        expect().assertFail();
                        done();
                    } else {
                        console.info(`${caseName} Succeeded in setting window colorspace default.`);
                        let colorSpace = windowClass.getWindowColorSpace();
                        console.info(`${caseName} This window get window color space is: ${colorSpace}`);
                        expect(colorSpace).assertEqual(window.ColorSpace.DEFAULT);
                        done();
                    }
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2100
         * @tc.name      : testSetSubWindowColorSpaceDefaultCallback
         * @tc.desc      : set window colorSpace
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testSetSubWindowColorSpaceDefaultCallback', 0, async (done: Function) => {
            let caseName = 'TestSetSubWindowColorSpaceDefaultCallback';
            try {
                windowStage.createSubWindow('SubWindow3').then((data) => {
                    console.info(`${caseName} Succeeded in creating the subwindow. Data: ` + JSON.stringify(data));
                    let subWindowClass = data;
                    subWindowClass.setWindowColorSpace(window.ColorSpace.DEFAULT, async (err: BusinessError) => {
                        const errCode: number = err.code;
                        if (errCode) {
                            console.error(`${caseName} Failed to set window colorspace. Cause code: ${err.code}, message: ${err.message}`);
                            expect().assertFail();
                            done();
                        } else {
                            console.info(`${caseName} Succeeded in setting window colorspace default.`);
                            let colorSpace = subWindowClass.getWindowColorSpace();
                            console.info(`${caseName} This window get window color space is: ${colorSpace}`);
                            expect(colorSpace).assertEqual(window.ColorSpace.DEFAULT);
                            await subWindowClass.destroyWindow();
                            done();
                        }
                    });
                }).catch((err: BusinessError) => {
                    console.error(`${caseName} Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2200
         * @tc.name      : testSetMainWindowColorSpaceWideGamutPromise
         * @tc.desc      : set window colorSpace
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testSetMainWindowColorSpaceWideGamutPromise', 0, async (done: Function) => {
            let caseName = 'TestSetMainWindowColorSpaceDefaultPromise';
            try {
                let windowClass = windowStage.getMainWindowSync();
                windowClass.setWindowColorSpace(window.ColorSpace.WIDE_GAMUT).then(() => {
                    console.info(`${caseName}: Succeeded in setting window colorspace WIDE_GAMUT.`);
                    let colorSpace = windowClass.getWindowColorSpace();
                    console.info(`${caseName} This window get window color space is: ${colorSpace}`);
                    expect(colorSpace).assertEqual(window.ColorSpace.WIDE_GAMUT);
                    done();
                }).catch((err: BusinessError) => {
                    console.error(`${caseName}: Failed to set window colorspace. Cause code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2300
         * @tc.name      : testSetSubWindowColorSpaceWideGamutCallback
         * @tc.desc      : set window colorSpace
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testSetSubWindowColorSpaceWideGamutCallback', 0, async (done: Function) => {
            let caseName = 'TestSetSubWindowColorSpaceWideGamutCallback';
            try {
                windowStage.createSubWindow('SubWindow4').then((data) => {
                    console.info(`${caseName} Succeeded in creating the subwindow. Data: ` + JSON.stringify(data));
                    let subWindowClass = data;
                    subWindowClass.setWindowColorSpace(window.ColorSpace.WIDE_GAMUT, async (err: BusinessError) => {
                        const errCode: number = err.code;
                        if (errCode) {
                            console.error(`${caseName} Failed to set window colorspace. Cause code: ${err.code}, message: ${err.message}`);
                            expect().assertFail();
                            done();
                        } else {
                            console.info(`${caseName} Succeeded in setting window colorspace WIDE_GAMUT.`);
                            let colorSpace = subWindowClass.getWindowColorSpace();
                            console.info(`${caseName} This window get window color space is: ${colorSpace}`);
                            expect(colorSpace).assertEqual(window.ColorSpace.WIDE_GAMUT);
                            await subWindowClass.destroyWindow();
                            done();
                        }
                    });
                }).catch((err: BusinessError) => {
                    console.error(`${caseName} Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                });
            } catch (exception) {
                console.error(`${caseName} Failed to set window colorspace. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2400
         * @tc.name      : testSetWindowBackgroundColor
         * @tc.desc      : set main window colorSpace
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testSetMainWindowBackgroundColor', 0, async (done: Function) => {
            let caseName = 'TestSetMainWindowBackgroundColor';
            try {
                let windowClass = windowStage.getMainWindowSync();
                await windowClass.setUIContent('testability/pages/First/index2');
                console.info(`${caseName}: Succeeded in setUiContent.`);
                windowClass.setWindowBackgroundColor('#00ff33');
                console.info(`${caseName}: Succeeded in setting window background color.`);
                done();
            } catch (exception) {
                console.error(`${caseName} Failed. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2500
         * @tc.name      : testSetSubWindowBackgroundColor
         * @tc.desc      : set sub window colorSpace
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testSetSubWindowBackgroundColor', 0, (done: Function) => {
            let caseName = 'TestSetSubWindowBackgroundColor';
            try {
                let windowClass = windowStage.getMainWindowSync();
                windowStage.createSubWindow('SubWindow5').then(async (data) => {
                    console.info(`${caseName} Succeeded in creating the subwindow. Data: ${JSON.stringify(data)}`);
                    let subWindowClass = data;
                    await subWindowClass.setUIContent('testability/pages/First/index2');
                    console.info(`${caseName}: Succeeded in setUiContent.`);
                    windowClass.setWindowBackgroundColor('#00ff33');
                    console.info(`${caseName}: Succeeded in setting window background color.`);
                    await subWindowClass.destroyWindow();
                    done();
                }).catch((err: BusinessError) => {
                    console.error(`${caseName} Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                });
            } catch (exception) {
                console.error(`${caseName} Failed to set window colorspace. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2600
         * @tc.name      : testSetSubWindowBackgroundColorNoUIContent
         * @tc.desc      : set sub window colorSpace no set UIContent
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testSetSubWindowBackgroundColorNoUIContent', 0, async (done: Function) => {
            let caseName = 'TestSetSubWindowBackgroundColorNoUIContent';
            try {
                let subWindowClass = await windowStage.createSubWindow('SubWindow6');
                console.info(`${caseName} Succeeded in creating the sub window.`);
                subWindowClass.setWindowBackgroundColor('#00ff33');
                console.info(`${caseName}: Succeeded in setting sub window background color.`);
                expect(false).assertTrue();
                done();
            } catch (exception) {
                console.error(`${caseName} Failed to set sub window colorspace. Cause code: ${exception.code}, message: ${exception.message}`);
                expect(exception.code).assertEqual(1300002);
                done();
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2700
         * @tc.name      : testSetWindowBrightnessCallbackNegative2
         * @tc.desc      : set window brightness
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testSetWindowBrightnessCallbackNegative2', 0, async (done: Function) => {
            let caseName = 'TestSetWindowBrightnessCallbackNegative2';
            try {
                let windowClass = windowStage.getMainWindowSync();
                windowClass.setWindowBrightness(-2, (err: BusinessError) => {
                    const errCode: number = err.code;
                    if (errCode) {
                        console.error(`${caseName} Failed to set the brightness -2 Parameter error. Cause code: ${err.code}, message: ${err.message}`);
                        expect(errCode).assertEqual(401);
                        done();
                    } else {
                        console.info(`${caseName} Succeeded in setting the brightness -2.`);
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2800
         * @tc.name      : testSetWindowBrightnessCallback1.5
         * @tc.desc      : set window brightness
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testSetWindowBrightnessCallback1.5', 0, async (done: Function) => {
            let caseName = 'TestSetWindowBrightnessCallback1.5';
            try {
                let windowClass = windowStage.getMainWindowSync();
                windowClass.setWindowBrightness(1.5, (err: BusinessError) => {
                    const errCode: number = err.code;
                    if (errCode) {
                        console.error(`${caseName} Failed to set the brightness 1.5. Cause code: ${err.code}, message: ${err.message}`);
                        expect(errCode).assertEqual(401);
                        done();
                    } else {
                        console.info(`${caseName} Succeeded in setting the brightness 1.5.`);
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2900
         * @tc.name      : testSetWindowBrightnessCallback0
         * @tc.desc      : set window brightness
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testSetWindowBrightnessCallback0', 0, async (done: Function) => {
            let caseName = 'TestSetWindowBrightnessCallback0';
            try {
                let windowClass = windowStage.getMainWindowSync();
                windowClass.setWindowBrightness(0, (err: BusinessError) => {
                    const errCode: number = err.code;
                    if (errCode) {
                        console.error(`${caseName} Failed to set the brightness 0. Cause code: ${err.code}, message: ${err.message}`);
                        expect().assertFail();
                        done();
                    } else {
                        console.info(`${caseName} Succeeded in setting the brightness 0.`);
                        done();
                    }
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3000
         * @tc.name      : testSetWindowBrightnessCallback_0.5
         * @tc.desc      : set window brightness
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testSetWindowBrightnessCallback0.5', 0, async (done: Function) => {
            let caseName = 'TestSetWindowBrightnessCallback0.5';
            try {
                let windowClass = windowStage.getMainWindowSync();
                windowClass.setWindowBrightness(0.5, (err: BusinessError) => {
                    const errCode: number = err.code;
                    if (errCode) {
                        console.error(`${caseName} Failed to set the brightness 0.5. Cause code: ${err.code}, message: ${err.message}`);
                        expect().assertFail();
                        done();
                    } else {
                        console.info(`${caseName} Succeeded in setting the brightness 0.5.`);
                        done();
                    }
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3100
         * @tc.name      : testSetWindowBrightnessCallback_1
         * @tc.desc      : set window brightness
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testSetWindowBrightnessCallback1', 0, async (done: Function) => {
            let caseName = 'TestSetWindowBrightnessCallback_1';
            try {
                let windowClass = windowStage.getMainWindowSync();
                windowClass.setWindowBrightness(1, (err: BusinessError) => {
                    const errCode: number = err.code;
                    if (errCode) {
                        console.error(`${caseName} Failed to set the brightness 1. Cause code: ${err.code}, message: ${err.message}`);
                        expect().assertFail();
                        done();
                    } else {
                        console.info(`${caseName} Succeeded in setting the brightness 1.`);
                        done();
                    }
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3200
         * @tc.name      : testSetWindowBrightnessCallbackDefault
         * @tc.desc      : set window brightness
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testSetWindowBrightnessCallbackDefault', 0, async (done: Function) => {
            let caseName = 'TestSetWindowBrightnessCallbackDefault';
            try {
                let windowClass = windowStage.getMainWindowSync();
                windowClass.setWindowBrightness(-1, (err: BusinessError) => {
                    const errCode: number = err.code;
                    if (errCode) {
                        console.error(`${caseName} Failed to set the brightness -1. Cause code: ${err.code}, message: ${err.message}`);
                        expect().assertFail();
                        done();
                    } else {
                        console.info(`${caseName} Succeeded in setting the brightness -1.`);
                        done();
                    }
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3300
         * @tc.name      : testSetWindowBrightnessPromiseNegative1.5
         * @tc.desc      : set window brightness
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testSetWindowBrightnessPromiseNegative1.5', 0, async (done: Function) => {
            let caseName = 'TestSetWindowBrightnessPromise_1.5';
            try {
                let windowClass = windowStage.getMainWindowSync();
                windowClass.setWindowBrightness(-1.5).then(() => {
                    console.info(`${caseName} Succeeded in setting the brightness -1.5.`);
                    expect(false).assertTrue();
                    done();
                }).catch((err: BusinessError) => {
                    console.info(`${caseName} Set the brightness -1.5 Parameter error. Cause code: ${err.code}, message: ${err.message}`)
                    expect(err.code).assertEqual(401);
                    done();
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3400
         * @tc.name      : testSetWindowBrightnessPromise1.5
         * @tc.desc      : set window brightness
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testSetWindowBrightnessPromise1.5', 0, async (done: Function) => {
            let caseName = 'TestSetWindowBrightnessPromise1.5';
            try {
                let windowClass = windowStage.getMainWindowSync();
                windowClass.setWindowBrightness(1.5).then(() => {
                    console.info(`${caseName} Succeeded in setting the brightness 1.5.`);
                    expect(false).assertTrue();
                    done();
                }).catch((err: BusinessError) => {
                    if (err.code === 401) {
                        console.info(`${caseName} Set the brightness 1.5 Parameter error. Cause code: ${err.code}, message: ${err.message}`)
                        done();
                    } else {
                        console.error(`${caseName} Failed to set the brightness 1.5. Cause code: ${err.code}, message: ${err.message}`);
                        expect().assertFail();
                        done();
                    }
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3500
         * @tc.name      : testSetWindowBrightnessPromise_0
         * @tc.desc      : set window brightness
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testSetWindowBrightnessPromise0', 0, async (done: Function) => {
            let caseName = 'TestSetWindowBrightnessPromise_0';
            try {
                let windowClass = windowStage.getMainWindowSync();
                windowClass.setWindowBrightness(0).then(() => {
                    console.info(`${caseName} Succeeded in setting the brightness 0.`);
                    done();
                }).catch((err: BusinessError) => {
                    console.error(`${caseName} Failed to set the brightness 0. Cause code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3600
         * @tc.name      : testSetWindowBrightnessPromise_0.5
         * @tc.desc      : set window brightness
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testSetWindowBrightnessPromise0.5', 0, async (done: Function) => {
            let caseName = 'TestSetWindowBrightnessPromise_0.5';
            try {
                let windowClass = windowStage.getMainWindowSync();
                windowClass.setWindowBrightness(0.5).then(() => {
                    console.info(`${caseName} Succeeded in setting the brightness 0.5.`);
                    done();
                }).catch((err: BusinessError) => {
                    console.error(`${caseName} Failed to set the brightness 0.5. Cause code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3700
         * @tc.name      : testSetWindowBrightnessPromise_1
         * @tc.desc      : set window brightness
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testSetWindowBrightnessPromise1', 0, async (done: Function) => {
            let caseName = 'testSetWindowBrightnessPromise_1';
            try {
                let windowClass = windowStage.getMainWindowSync();
                windowClass.setWindowBrightness(1).then(() => {
                    console.info(`${caseName} Succeeded in setting the brightness 1.`);
                    done();
                }).catch((err: BusinessError) => {
                    console.error(`${caseName} Failed to set the brightness 1. Cause code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3800
         * @tc.name      : testSetWindowBrightnessPromiseNegative1
         * @tc.desc      : set window brightness
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testSetWindowBrightnessPromiseNegative1', 0, async (done: Function) => {
            let caseName = 'TestSetWindowBrightnessPromiseNegative1';
            try {
                let windowClass = windowStage.getMainWindowSync();
                windowClass.setWindowBrightness(-1).then(() => {
                    console.info(`${caseName} Succeeded in setting the brightness -1.`);
                    done();
                }).catch((err: BusinessError) => {
                    console.error(`${caseName} Failed to set the brightness -1. Cause code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_3900
         * @tc.name      : testSetSubWindowBrightnessPromiseNegative1
         * @tc.desc      : set subwindow brightness
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testSetSubWindowBrightnessPromiseNegative1', 0, (done: Function) => {
            let caseName = 'TestSetSubWindowBrightnessPromiseNegative1';
            try {
                windowStage.createSubWindow('subWindow6').then((data) => {
                    console.info(`${caseName} Succeeded in creating the subwindow. Data: ` + JSON.stringify(data));
                    let subWindowClass = data;
                    subWindowClass.setWindowBrightness(-1).then(async () => {
                        console.info(`${caseName} Succeeded in setting the brightness -1.`);
                        await subWindowClass.destroyWindow();
                        done();
                    }).catch((err: BusinessError) => {
                        console.error(`${caseName} Failed to set the brightness -1. Cause code: ${err.code}, message: ${err.message}`);
                        expect().assertFail();
                        done();
                    });
                }).catch((err: BusinessError) => {
                    console.error(`${caseName} Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4000
         * @tc.name      : testSetSubWindowBrightnessPromiseNegative2
         * @tc.desc      : set subwindow brightness
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testSetSubWindowBrightnessPromiseNegative2', 0, (done: Function) => {
            let caseName = 'TestSetSubWindowBrightnessPromiseNegative2';
            try {
                windowStage.createSubWindow('subWindow7').then((data) => {
                    console.info(`${caseName} Succeeded in creating the subwindow. Data: ` + JSON.stringify(data));
                    let subWindowClass = data;
                    subWindowClass.setWindowBrightness(-2).then(() => {
                        console.info(`${caseName} Succeeded in setting the brightness -2.`);
                        expect(false).assertTrue();
                        done();
                    }).catch(async (err: BusinessError) => {
                        console.error(`${caseName} Failed to set the brightness -2. Cause code: ${err.code}, message: ${err.message}`);
                        expect(err.code).assertEqual(401);
                        await subWindowClass.destroyWindow();
                        done();
                    });
                }).catch((err: BusinessError) => {
                    console.error(`${caseName} Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4100
         * @tc.name      : testSetSubWindowKeepScreenOnCallbackFalse
         * @tc.desc      : set subwindow screen to be always on
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testSetSubWindowKeepScreenOnCallbackFalse', 0, (done: Function) => {
            let caseName = 'TestSetSubWindowKeepScreenOnCallbackFalse';
            try {
                windowStage.createSubWindow('subWindow8').then((data) => {
                    console.info(`${caseName} Succeeded in creating the subwindow. Data: ` + JSON.stringify(data));
                    let subWindowClass = data;
                    subWindowClass.setWindowKeepScreenOn(false, async (err: BusinessError) => {
                        const errCode: number = err.code;
                        if (errCode) {
                            console.error(`${caseName} Failed to set the screen to be always on. Cause code: ${err.code}, message: ${err.message}`);
                            expect().assertFail();
                            done();
                        } else {
                            console.info(`${caseName} Succeeded in setting the screen to be always on.`);
                            await subWindowClass.destroyWindow();
                            done();
                        }
                    });
                }).catch((err: BusinessError) => {
                    console.error(`${caseName} Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4200
         * @tc.name      : testSetSubWindowKeepScreenOnCallbackTrue
         * @tc.desc      : set subwindow screen to be always on
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testSetSubWindowKeepScreenOnCallbackTrue', 0, (done: Function) => {
            let caseName = 'TestSetSubWindowKeepScreenOnCallbackTrue';
            try {
                windowStage.createSubWindow('subWindow9').then((data) => {
                    console.info(`${caseName} Succeeded in creating the subwindow. Data: ` + JSON.stringify(data));
                    let subWindowClass = data;
                    data.setWindowKeepScreenOn(true, async (err: BusinessError) => {
                        const errCode: number = err.code;
                        if (errCode) {
                            console.error(`${caseName} Failed to set the screen to be always on. Cause code: ${err.code}, message: ${err.message}`);
                            expect().assertFail();
                            done();
                        } else {
                            console.info(`${caseName} Succeeded in setting the screen to be always on.`);
                            await subWindowClass.destroyWindow();
                            done();
                        }
                    });
                }).catch((err: BusinessError) => {
                    console.error(`${caseName} Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4300
         * @tc.name      : testSetWindowKeepScreenOnCallbackFalse
         * @tc.desc      : set window screen to be always on
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testSetWindowKeepScreenOnCallbackFalse', 0, async (done: Function) => {
            let caseName = 'TestSetWindowKeepScreenOnCallbackFalse';
            try {
                let windowClass = windowStage.getMainWindowSync();
                windowClass.setWindowKeepScreenOn(false, (err: BusinessError) => {
                    const errCode: number = err.code;
                    if (errCode) {
                        console.error(`${caseName} Failed to set the screen to be always on. Cause code: ${err.code}, message: ${err.message}`);
                        expect().assertFail();
                        done();
                    } else {
                        console.info(`${caseName} Succeeded in setting the screen to be always on.`);
                        done();
                    }
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4400
         * @tc.name      : testSetWindowKeepScreenOnCallbackTrue
         * @tc.desc      : set window screen to be always on
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testSetWindowKeepScreenOnCallbackTrue', 0, async (done: Function) => {
            let caseName = 'TestSetWindowKeepScreenOnCallbackTrue';
            try {
                let windowClass = windowStage.getMainWindowSync();
                windowClass.setWindowKeepScreenOn(true, (err: BusinessError) => {
                    const errCode: number = err.code;
                    if (errCode) {
                        console.error(`${caseName} Failed to set the screen to be always on. Cause code: ${err.code}, message: ${err.message}`);
                        expect().assertFail();
                        done();
                    } else {
                        console.info(`${caseName} Succeeded in setting the screen to be always on.`);
                        done();
                    }
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4500
         * @tc.name      : testSetWindowKeepScreenOnPromiseTrue
         * @tc.desc      : set window screen to be always on
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testSetWindowKeepScreenOnPromiseTrue', 0, async (done: Function) => {
            let caseName = 'TestSetWindowKeepScreenOnPromiseTrue';
            try {
                let windowClass = windowStage.getMainWindowSync();
                windowClass.setWindowKeepScreenOn(true).then(() => {
                    console.info(`${caseName} Succeeded in setting the screen to be always on.`);
                    done();
                }).catch((err: BusinessError) => {
                    console.info(`${caseName} Failed to set the screen to be always on. Cause code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4600
         * @tc.name      : testSetWindowKeepScreenOnPromiseFalse
         * @tc.desc      : set window screen to be always on
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testSetWindowKeepScreenOnPromiseFalse', 0, async (done: Function) => {
            let caseName = 'TestSetWindowKeepScreenOnPromiseFalse';
            try {
                let windowClass = windowStage.getMainWindowSync();
                windowClass.setWindowKeepScreenOn(false).then(() => {
                    console.info(`${caseName} Succeeded in setting the screen to be always on.`);
                    done();
                }).catch((err: BusinessError) => {
                    console.info(`${caseName} Failed to set the screen to be always on. Cause code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4700
         * @tc.name      : testSetSubWindowPrivacyModeTrue
         * @tc.desc      : set subwindow screen to be privacy mode
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testSetSubWindowPrivacyModeTrue', 0, async (done: Function) => {
            let caseName = 'TestSetSubWindowPrivacyModeTrue';
            try {
                let subWindow = await windowStage.createSubWindow('subWindow10');
                console.info(`${caseName} Succeeded in creating the subwindow. Data: ` + JSON.stringify(subWindow));
                subWindow.setWindowPrivacyMode(true, async (err: BusinessError) => {
                    const errCode: number = err.code;
                    if (errCode) {
                        if (errCode === 201) {
                            console.info(`${caseName} The application does not have the permission required to call the API`);
                            done();
                        } else {
                            console.error(`${caseName} Failed to set the subwindow to privacy mode. Cause code: ${err.code}, message: ${err.message}`);
                            expect().assertFail();
                            done();
                        }
                    } else {
                        console.info(`${caseName} Succeeded in setting the subwindow to privacy mode..`);
                        await subWindow.destroyWindow();
                        done();
                    }
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4800
         * @tc.name      : testSetSubWindowPrivacyModeFalse
         * @tc.desc      : set subwindow screen to be privacy mode
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testSetSubWindowPrivacyModeFalse', 0, async (done: Function) => {
            let caseName = 'TestSetSubWindowPrivacyModeFalse';
            try {
                let subWindow = await windowStage.createSubWindow('subWindow11');
                console.info(`${caseName} Succeeded in creating the subwindow. Data: ` + JSON.stringify(subWindow));
                subWindow.setWindowPrivacyMode(false, async (err: BusinessError) => {
                    const errCode: number = err.code;
                    if (errCode) {
                        if (errCode === 201) {
                            console.info(`${caseName} The application does not have the permission required to call the API`);
                            done();
                        } else {
                            console.error(`${caseName} Failed to set the subwindow to privacy mode. Cause code: ${err.code}, message: ${err.message}`);
                            expect().assertFail();
                            done();
                        }
                    } else {
                        console.info(`${caseName} Succeeded in setting the subwindow to privacy mode..`);
                        await subWindow.destroyWindow();
                        done();
                    }
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4900
         * @tc.name      : testSetWindowPrivacyModeTrue
         * @tc.desc      : set window screen to be privacy mode
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testSetWindowPrivacyModeTrue', 0, async (done: Function) => {
            let caseName = 'TestSetWindowPrivacyModeTrue';
            try {
                let windowClass = windowStage.getMainWindowSync();
                windowClass.setWindowPrivacyMode(true, (err: BusinessError) => {
                    const errCode: number = err.code;
                    if (errCode) {
                        if (errCode === 201) {
                            console.info(`${caseName} The application does not have the permission required to call the API`);
                            done();
                        } else {
                            console.error(`${caseName} Failed to set the window to privacy mode. Cause code: ${err.code}, message: ${err.message}`);
                            expect().assertFail();
                            done();
                        }
                    } else {
                        console.info(`${caseName} Succeeded in setting the window to privacy mode..`);
                        done();
                    }
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5000
         * @tc.name      : testSetWindowPrivacyModeFalse
         * @tc.desc      : set window screen to be privacy mode
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testSetWindowPrivacyModeFalse', 0, async (done: Function) => {
            let caseName = 'TestSetWindowPrivacyModeFalse';
            try {
                let windowClass = windowStage.getMainWindowSync();
                windowClass.setWindowPrivacyMode(false, (err: BusinessError) => {
                    const errCode: number = err.code;
                    if (errCode) {
                        if (errCode === 201) {
                            console.info(`${caseName} The application does not have the permission required to call the API`);
                            done();
                        } else {
                            console.error(`${caseName} Failed to set the window to privacy mode. Cause code: ${err.code}, message: ${err.message}`);
                            expect().assertFail();
                            done();
                        }
                    } else {
                        console.info(`${caseName} Succeeded in setting the window to privacy mode..`);
                        done();
                    }
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5100
         * @tc.name      : testWindowSnapshotCallback
         * @tc.desc      : snapshot window
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testWindowSnapshotCallback', 0, async (done: Function) => {
            let caseName = 'TestWindowSnapshotCallback';
            try {
                let windowClass = windowStage.getMainWindowSync();
                windowClass.snapshot((err: BusinessError, pixelMap) => {
                    const errCode: number = err.code;
                    if (errCode) {
                        if (errCode === 1300002) {
                            console.info(`${caseName} This window state is abnormal`);
                            done();
                        } else {
                            console.error(`${caseName} Failed to snapshot window. Cause code: ${err.code}, message: ${err.message}`);
                            expect().assertFail();
                            done();
                        }
                    } else {
                        console.info(`${caseName} Succeeded in snapshotting window. Pixel bytes number: ${pixelMap.getPixelBytesNumber()}`);
                        let widthBefore: number = windowClass.getWindowProperties().windowRect.width;
                        let heightBefore: number = windowClass.getWindowProperties().windowRect.height;
                        console.info(`${caseName} windowHeight: ${heightBefore}, windowWidth: ${widthBefore}`);
                        let imageInfo: image.ImageInfo = pixelMap.getImageInfoSync();
                        console.info(`${caseName} pixelMapHeight: ${imageInfo.size.height}, pixelMapWidth: ${imageInfo.size.width}`);
                        expect(widthBefore).assertEqual(imageInfo.size.width);
                        expect(heightBefore).assertEqual(imageInfo.size.height);
                        pixelMap.release();
                        done();
                    }
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5200
         * @tc.name      : testSubWindowSnapshotCallback
         * @tc.desc      : snapshot subwindow
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testSubWindowSnapshotCallback', 0, async (done: Function) => {
            let caseName = 'TestSubWindowSnapshotCallback';
            try {
                let subWindow = await windowStage.createSubWindow('subWindow12');
                console.info(`${caseName} Succeeded in creating the subwindow. Data: ` + JSON.stringify(subWindow));
                subWindow.snapshot(async (err: BusinessError, pixelMap) => {
                    const errCode: number = err.code;
                    if (errCode) {
                        if (errCode === 1300002) {
                            console.info(`${caseName} This subwindow state is abnormal`);
                            done();
                        } else {
                            console.error(`${caseName} Failed to snapshot subwindow. Cause code: ${err.code}, message: ${err.message}`);
                            expect().assertFail();
                            done();
                        }
                    } else {
                        console.info(`${caseName} Succeeded in snapshotting subwindow. Pixel bytes number: ${pixelMap.getPixelBytesNumber()}`);
                        let widthBefore: number = subWindow.getWindowProperties().windowRect.width;
                        let heightBefore: number = subWindow.getWindowProperties().windowRect.height;
                        console.info(`${caseName} subWindowHeight: ${heightBefore}, subWindowWidth: ${widthBefore}`);
                        let imageInfo: image.ImageInfo = pixelMap.getImageInfoSync();
                        console.info(`${caseName} pixelMapHeight: ${imageInfo.size.height}, pixelMapWidth: ${imageInfo.size.width}`);
                        expect(widthBefore).assertEqual(imageInfo.size.width);
                        expect(heightBefore).assertEqual(imageInfo.size.height);
                        pixelMap.release();
                        await subWindow.destroyWindow();
                        done();
                    }
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5300
         * @tc.name      : testWindowSnapshotPromise
         * @tc.desc      : snapshot window
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testWindowSnapshotPromise', 0, async (done: Function) => {
            let caseName = 'TestWindowSnapshotPromise';
            try {
                let windowClass = windowStage.getMainWindowSync();
                windowClass.snapshot().then((pixelMap) => {
                    console.info(`${caseName} Succeeded in snapshotting window. Pixel bytes number: ${pixelMap.getPixelBytesNumber()}`);
                    let widthBefore: number = windowClass.getWindowProperties().windowRect.width;
                    let heightBefore: number = windowClass.getWindowProperties().windowRect.height;
                    console.info(`${caseName} windowHeight: ${heightBefore}, windowWidth: ${widthBefore}`);
                    let imageInfo: image.ImageInfo = pixelMap.getImageInfoSync();
                    console.info(`${caseName} pixelMapHeight: ${imageInfo.size.height}, pixelMapWidth: ${imageInfo.size.width}`);
                    expect(widthBefore).assertEqual(imageInfo.size.width);
                    expect(heightBefore).assertEqual(imageInfo.size.height);
                    pixelMap.release();
                    done();
                }).catch((err: BusinessError) => {
                    if (err.code === 1300002) {
                        console.info(`${caseName} This window state is abnormal`);
                        done();
                    } else {
                        console.error(`${caseName} Failed to snapshot window. Cause code: ${err.code}, message: ${err.message}`);
                        expect().assertFail();
                        done();
                    }
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5400
         * @tc.name      : testSubWindowSnapshotPromise
         * @tc.desc      : snapshot subwindow
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testSubWindowSnapshotPromise', 0, async (done: Function) => {
            let caseName = 'TestSubWindowSnapshotPromise';
            try {
                let subWindow = await windowStage.createSubWindow('subWindow13');
                console.info(`${caseName} Succeeded in creating the subwindow. Data: ` + JSON.stringify(subWindow));
                subWindow.snapshot().then(async (pixelMap) => {
                    console.info(`${caseName} Succeeded in snapshotting window. Pixel bytes number: ${pixelMap.getPixelBytesNumber()}`);
                    let widthBefore: number = subWindow.getWindowProperties().windowRect.width;
                    let heightBefore: number = subWindow.getWindowProperties().windowRect.height;
                    console.info(`${caseName} subWindowHeight: ${heightBefore}, subWindowWidth: ${widthBefore}`);
                    let imageInfo: image.ImageInfo = pixelMap.getImageInfoSync();
                    console.info(`${caseName} pixelMapHeight: ${imageInfo.size.height}, pixelMapWidth: ${imageInfo.size.width}`);
                    expect(widthBefore).assertEqual(imageInfo.size.width);
                    expect(heightBefore).assertEqual(imageInfo.size.height);
                    pixelMap.release();
                    await subWindow.destroyWindow();
                    done();
                }).catch((err: BusinessError) => {
                    if (err.code === 1300002) {
                        console.info(`${caseName} This window state is abnormal`);
                        done();
                    } else {
                        console.error(`${caseName} Failed to snapshot window. Cause code: ${err.code}, message: ${err.message}`);
                        expect().assertFail();
                        done();
                    }
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5500
         * @tc.name      : testWindowGetUIContext
         * @tc.desc      : get window ui context
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testWindowGetUIContext', 0, async (done: Function) => {
            let caseName = 'TestWindowGetUIContext';
            try {
                let windowClass = windowStage.getMainWindowSync();
                let uiContext = windowClass.getUIContext();
                console.info(`${caseName} Succeeded in gettting the main window ui context. Data: ${JSON.stringify(uiContext)}`)
                expect(uiContext !== null).assertTrue();
                done();
            } catch (exception) {
                if (exception.code === 1300002) {
                    console.info(`${caseName} This window state is abnormal`);
                    done();
                } else {
                    console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                    expect().assertFail();
                    done();
                }
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5600
         * @tc.name      : testSubWindowGetUIContext
         * @tc.desc      : get subwindow ui context
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testSubWindowGetUIContext', 0, async (done: Function) => {
            let caseName = 'TestSubWindowGetUIContext';
            try {
                let subWindow = await windowStage.createSubWindow('subWindow14');
                console.info(`${caseName} Succeeded in creating the subwindow. Data: ` + JSON.stringify(subWindow));
                let uiContext = subWindow.getUIContext();
                console.info(`${caseName} Succeeded in gettting the subwindow ui context. Data: ${JSON.stringify(uiContext)}`)
                expect(uiContext !== null).assertTrue();
                await subWindow.destroyWindow();
                done();
            } catch (exception) {
                if (exception.code === 1300002) {
                    console.info(`${caseName} This window state is abnormal`);
                    done();
                } else {
                    console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                    expect().assertFail();
                    done();
                }
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5700
         * @tc.name      : testWindowSetUIContextCallback
         * @tc.desc      : set window ui context
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testWindowSetUIContextCallback', 0, async (done: Function) => {
            let caseName = 'TestWindowSetUIContextCallback';
            try {
                let windowClass = windowStage.getMainWindowSync();
                windowClass.setUIContent('testability/pages/First/index2', (err: BusinessError) => {
                    const errCode: number = err.code;
                    if (errCode) {
                        console.error(`Failed to load the content. Cause code: ${err.code}, message: ${err.message}`);
                        expect().assertFail();
                        done();
                    } else {
                        console.info(`${caseName} Succeeded in loading the content.`);
                        done();
                    }
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5800
         * @tc.name      : testWindowSetUIContextErrorPathCallback
         * @tc.desc      : set window ui context
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testWindowSetUIContextErrorPathCallback', 0, async (done: Function) => {
            let caseName = 'TestWindowSetUIContextErrorPathCallback';
            try {
                let windowClass = windowStage.getMainWindowSync();
                windowClass.setUIContent('testability/pages/First/Error', (err: BusinessError) => {
                    const errCode: number = err.code;
                    if (errCode) {
                        console.error(`${caseName} Failed to load the content. Cause code: ${err.code}, message: ${err.message}`);
                        expect(err.code).assertEqual(401);
                        done();
                    } else {
                        console.info(`${caseName} Succeeded in loading the content.`);
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5900
         * @tc.name      : testSubWindowSetUIContextCallback
         * @tc.desc      : set subwindow ui context
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testSubWindowSetUIContextCallback', 0, async (done: Function) => {
            let caseName = 'TestSubWindowSetUIContextCallback';
            try {
                let subWindow = await windowStage.createSubWindow('subWindow15');
                console.info(`${caseName} Succeeded in creating the subwindow. Data: ` + JSON.stringify(subWindow));
                subWindow.setUIContent('testability/pages/First/index2', async (err: BusinessError) => {
                    const errCode: number = err.code;
                    if (errCode) {
                        console.error(`Failed to load the content. Cause code: ${err.code}, message: ${err.message}`);
                        expect().assertFail();
                        done();
                    } else {
                        console.info(`${caseName} Succeeded in loading the content.`);
                        await subWindow.destroyWindow();
                        done();
                    }
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_6000
         * @tc.name      : testSubWindowSetUIContextErrorPathCallback
         * @tc.desc      : set subwindow ui context
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testSubWindowSetUIContextErrorPathCallback', 0, async (done: Function) => {
            let caseName = 'TestSubWindowSetUIContextErrorPathCallback';
            try {
                let subWindow = await windowStage.createSubWindow('subWindow16');
                console.info(`${caseName} Succeeded in creating the subwindow. Data: ` + JSON.stringify(subWindow));
                subWindow.setUIContent('testability/pages/First/Error', async (err: BusinessError) => {
                    const errCode: number = err.code;
                    if (errCode) {
                        console.error(`Failed to load the content. Cause code: ${err.code}, message: ${err.message}`);
                        expect(err.code).assertEqual(401);
                        await subWindow.destroyWindow();
                        done();
                    } else {
                        console.info(`${caseName} Succeeded in loading the content.`);
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_6100
         * @tc.name      : testWindowSetUIContextPromise
         * @tc.desc      : set window ui context
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testWindowSetUIContextPromise', 0, async (done: Function) => {
            let caseName = 'TestWindowSetUIContextPromise';
            try {
                let windowClass = windowStage.getMainWindowSync();
                windowClass.setUIContent('testability/pages/First/index2').then(() => {
                    console.info(`${caseName} Succeeded in loading the content.`);
                    done();
                }).catch((err: BusinessError) => {
                    console.error(`Failed to load the content. Cause code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_6200
         * @tc.name      : testSubWindowSetUIContextErrorPathPromise
         * @tc.desc      : set subwindow ui context
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testSubWindowSetUIContextErrorPathPromise', 0, async (done: Function) => {
            let caseName = 'TestSubWindowSetUIContextErrorPathPromise';
            try {
                let subWindow = await windowStage.createSubWindow('subWindowError');
                console.info(`${caseName} Succeeded in creating the subwindow. Data: ` + JSON.stringify(subWindow));
                subWindow.setUIContent('testability/pages/First/Error').then(() => {
                    console.info(`${caseName} Succeeded in loading the content.`);
                    expect(false).assertTrue();
                    done();
                }).catch((err: BusinessError) => {
                    console.error(`Failed to load the content. Cause code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(401);
                    done();
                });
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_6300
         * @tc.name      : testSetDefaultDensityEnabledTrue
         * @tc.desc      : set window ui context
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testSetDefaultDensityEnabledTrue', 0, async (done: Function) => {
            let caseName = 'TestSetDefaultDensityEnabledTrue';
            try {
                windowStage.setDefaultDensityEnabled(true);
                console.info(`${caseName} Succeeded in setting default density enabled`)
                done();
            } catch (exception) {
                if (exception.code === 801) {
                    console.info(`${caseName} The current device not support to setDefaultDensityEnabled`)
                    done();
                } else {
                    console.error(`Failed to set default density enabled. Cause code: ${exception.code}, message: ${exception.message}`);
                    expect().assertFail();
                    done();
                }
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_6400
         * @tc.name      : testSetDefaultDensityEnabledFalse
         * @tc.desc      : set window ui context
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testSetDefaultDensityEnabledFalse', 0, async (done: Function) => {
            let caseName = 'TestSetDefaultDensityEnabledFalse';
            try {
                windowStage.setDefaultDensityEnabled(false);
                console.info(`${caseName} Succeeded in setting default density enabled`)
                done();
            } catch (exception) {
                if (exception.code === 801) {
                    console.info(`${caseName} The current device not support to setDefaultDensityEnabled`)
                    done();
                } else {
                    console.error(`Failed to set default density enabled. Cause code: ${exception.code}, message: ${exception.message}`);
                    expect().assertFail();
                    done();
                }
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_6500
         * @tc.name      : testSetMainWindowMask
         * @tc.desc      : set window ui context
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testSetMainWindowMask', 0, async (done: Function) => {
            let caseName = 'TestSetMainWindowMask';
            try {
                let windowClass = windowStage.getMainWindowSync();
                let windowMask: Array<Array<number>> = [
                    [0, 0, 0, 1, 0, 0, 0],
                    [0, 0, 1, 1, 1, 0, 0],
                    [0, 1, 1, 0, 1, 1, 0],
                    [1, 1, 0, 0, 0, 1, 1]
                ];
                await windowClass.setWindowMask(windowMask);
                console.info(`${caseName} Succeeded in setting the window mask.`);
                expect(true).assertFalse();
                done();
            } catch (exception) {
                console.error(`${caseName} Failed to set the window mask. Cause code: ${exception.code}, message: ${exception.message}`);
                expect(exception.code).assertEqual(1300004);
                done();
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_6600
         * @tc.name      : testSetSubWindowMask
         * @tc.desc      : set window ui context
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testSetSubWindowMask', 0, async (done: Function) => {
            let caseName = 'TestSetSubWindowMask';
            try {
                let subWindow = await windowStage.createSubWindow('subWindowMask');
                console.info(`${caseName} Succeeded in creating the subwindow. Data: ` + JSON.stringify(subWindow));
                await subWindow.showWindow();
                let windowMask: Array<Array<number>> = [
                    [0, 0, 0, 1, 0, 0, 0],
                    [0, 0, 1, 1, 1, 0, 0],
                    [0, 1, 1, 0, 1, 1, 0],
                    [1, 1, 0, 0, 0, 1, 1]
                ];
                await subWindow.setWindowMask(windowMask);
                console.info(`${caseName} Succeeded in setting the window mask.`);
                done();
            } catch (exception) {
                if (exception.code === 801) {
                    console.info(`${caseName} The current device not support to set sub window mask`)
                    done();
                } else {
                    console.error(`Failed to set sub window mask. Cause code: ${exception.code}, message: ${exception.message}`);
                    expect().assertFail();
                    done();
                }
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_6700
         * @tc.name      : testGetWindowStatusInDefault
         * @tc.desc      : get the window status of current window
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
         */
        it('testGetWindowStatusInDefault', 0, async (done: Function) => {
            let caseName = 'TestGetWindowStatusInDefault';
            try {
                let windowClass = windowStage.getMainWindowSync();
                await windowClass.setFullScreen(true);
                console.info(`${caseName} Succeeded in enabling the full-screen mode.`);
                await sleep(1000);
                windowClass.recover().then(() => {
                    const windowStatus = windowClass.getWindowStatus();
                    console.info(`${caseName} windowStatus is: ${windowStatus}`);
                    expect(windowStatus).assertEqual(window.WindowStatusType.FLOATING);
                    done();
                }).catch((err: BusinessError) => {
                    try {
                        const windowStatus = windowClass.getWindowStatus();
                        console.info(`${caseName} windowStatus is: ${windowStatus}`);
                        expect(windowStatus).assertEqual(window.WindowStatusType.FULL_SCREEN);
                        done();
                    } catch (exception) {
                        if (exception.code == 801) {
                            console.info(`${caseName}: The current device type does not support to get window status`);
                            done();
                        } else {
                            console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                            expect().assertFail();
                            done();
                        }
                    }
                });
            } catch (exception) {
                if (exception.code == 801) {
                    console.info(`${caseName}: The current device type does not support: ${exception.message}`);
                    done();
                } else {
                    console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                    expect().assertFail();
                    done();
                }
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_6800
         * @tc.name      : testGetWindowStatusInFullScreen
         * @tc.desc      : get the window status of current window
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
         */
        it('testGetWindowStatusInFullScreen', 0, async (done: Function) => {
            let caseName = 'TestGetWindowStatusInFullScreen';
            try {
                let windowClass = windowStage.getMainWindowSync();
                await windowClass.setFullScreen(true);
                console.info(`${caseName} Succeeded in enabling the full-screen mode.`);
                const windowStatus = windowClass.getWindowStatus();
                console.info(`${caseName} windowStatus is: ${windowStatus}`);
                if (deviceType !== '2in1' || isAutoWindow == 'false') {
                    expect(windowStatus).assertEqual(window.WindowStatusType.FULL_SCREEN);
                    await windowClass.recover();
                    done();
                } else {
                    expect(windowStatus).assertEqual(window.WindowStatusType.MAXIMIZE);
                    await windowClass.recover();
                    done();
                }
            } catch (exception) {
                if (exception.code == 801) {
                    console.info(`${caseName}: The current device type does not support: ${exception.message}`);
                    done();
                } else {
                    console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                    expect().assertFail();
                    done();
                }
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_6900
         * @tc.name      : testGetWindowStatusInMaximize
         * @tc.desc      : get the window status of current window
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
         */
        it('testGetWindowStatusInMaximize', 0, async (done: Function) => {
            let caseName = 'TestGetWindowStatusInMaximize';
            try {
                let windowClass = windowStage.getMainWindowSync();
                await windowClass.maximize();
                console.info(`${caseName} Succeeded in maximizing the window.`);
                await sleep(1000);
                const windowStatus = windowClass.getWindowStatus();
                console.info(`${caseName} windowStatus is: ${windowStatus}`);
                expect(windowStatus).assertEqual(window.WindowStatusType.FULL_SCREEN);
                await windowClass.recover();
                done();
            } catch (exception) {
                if (exception.code == 801) {
                    console.info(`${caseName}: The current device type does not support: ${exception.message}`);
                    done();
                } else {
                    console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                    expect().assertFail();
                    done();
                }
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_7000
         * @tc.name      : testGetDialogWindowStatus
         * @tc.desc      : get the window status of current window
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
         */
        it('testGetDialogWindowStatus', 0, async (done: Function) => {
            let caseName = 'TestGetDialogWindowStatus';
            try {
                let config: window.Configuration = {
                    name: "dialog",
                    windowType: window.WindowType.TYPE_DIALOG,
                    ctx: context
                };
                const windowClass = await window.createWindow(config);
                console.info(`${caseName} Succeeded in creating the dialog window.`);
                windowClass.setUIContent("testability/pages/First/index2");
                await windowClass.showWindow();
                await sleep(1000);
                const windowStatus = windowClass.getWindowStatus();
                console.info(`${caseName} windowStatus is: ${windowStatus}`);
                await windowClass.destroyWindow();
                console.info(`${caseName} Succeeded in destroying the window.`);
                await sleep(1000);
                expect(windowStatus).assertEqual(window.WindowStatusType.FLOATING);
                done();
            } catch (exception) {
                if (exception.code == 801) {
                    console.info(`${caseName}: The current device type does not support: ${exception.message}`);
                    done();
                } else {
                    console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                    expect().assertFail();
                    done();
                }
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_7100
         * @tc.name      : testGetDestroyedDialogWindowStatus
         * @tc.desc      : get the window status of current window
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
         */
        it('testGetDestroyedDialogWindowStatus', 0, async (done: Function) => {
            let caseName = 'TestGetDestroyedDialogWindowStatus';
            try {
                let config: window.Configuration = {
                    name: "destroyDialog",
                    windowType: window.WindowType.TYPE_DIALOG,
                    ctx: context
                };
                const windowClass = await window.createWindow(config);
                console.info(`${caseName} Succeeded in creating the dialog window.`);
                windowClass.setUIContent("testability/pages/First/index2");
                windowClass.showWindow();
                await windowClass.destroyWindow();
                console.info(`${caseName} Succeeded in destroying the dialog window.`);
                await sleep(1000);
                const windowStatus = windowClass.getWindowStatus();
                console.info(`${caseName} windowStatus is: ${windowStatus}`);
                expect(false).assertEqual(true);
                done();
            } catch (exception) {
                if (exception.code == 801) {
                    console.info(`${caseName}: The current device type does not support: ${exception.message}`);
                    done();
                } else {
                    console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                    expect(exception.code).assertEqual(1300002);
                    done();
                }
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_7200
         * @tc.name      : testGetDestroyedSubWindowStatus
         * @tc.desc      : get the sub window status of current window
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
         */
        it('testGetDestroyedSubWindowStatus', 0, async (done: Function) => {
            let caseName = 'TestGetDestroyedSubWindowStatus';
            try {
                const windowClass = await windowStage.createSubWindow('subwindow');
                console.info(`${caseName} Succeeded in creating the sub window.`);
                windowClass.setUIContent("testability/pages/First/index2");
                await windowClass.destroyWindow();
                console.info(`${caseName} Succeeded in destroying the sub window.`);
                await sleep(1000);
                const windowStatus = windowClass.getWindowStatus();
                console.info(`${caseName} windowStatus is: ${windowStatus}`);
                expect(false).assertEqual(true);
                done();
            } catch (exception) {
                if (exception.code == 801) {
                    console.info(`${caseName}: The current device type does not support: ${exception.message}`);
                    done();
                } else {
                    console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                    expect(exception.code).assertEqual(1300002);
                    done();
                }
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_7300
         * @tc.name      : testGetSubWindowFocused
         * @tc.desc      : get the sub window focused of current window
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
         */
        it('testGetSubWindowFocused', 0, async (done: Function) => {
            let caseName = 'TestGetSubWindowFocused';
            try {
                const windowClass = await windowStage.createSubWindow('subwindow');
                console.info(`${caseName} Succeeded in creating the sub window.`);
                await windowClass.setUIContent("testability/pages/First/index3");
                await windowClass.showWindow();
                await sleep(1000);
                const isFocused = windowClass.isFocused();
                console.info(`${caseName} isFocused is: ${isFocused}`);
                await windowClass.destroyWindow();
                console.info(`${caseName} Succeeded in destroying the window.`);
                expect(isFocused).assertTrue();
                done();
            } catch (exception) {
                if (exception.code === 1300002) {
                    console.error(`${caseName} This window state is abnormal.`);
                    done();
                } else if (exception.code === 801) {
                    console.error(`${caseName}: The current device type does not support: ${exception.message}.`);
                    done();
                } else {
                    console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                    expect().assertFail();
                    done();
                }
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_7400
         * @tc.name      : testGetDialogWindowFocused
         * @tc.desc      : get the window focused of current window
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
         */
        it('testGetDialogWindowFocused', 0, async (done: Function) => {
            let caseName = 'TestGetDialogWindowFocused';
            try {
                let config: window.Configuration = {
                    name: "dialogWindow",
                    windowType: window.WindowType.TYPE_DIALOG,
                    ctx: context
                };
                const windowClass = await window.createWindow(config);
                console.info(`${caseName} Succeeded in creating the dialog window.`);
                windowClass.setUIContent("testability/pages/First/index3");
                await windowClass.showWindow();
                await sleep(1000);
                const isFocused = windowClass.isFocused();
                console.info(`${caseName} isFocused is: ${isFocused}`);
                await windowClass.destroyWindow();
                console.info(`${caseName} Succeeded in destroying the window.`);
                expect(isFocused).assertTrue();
                done();
            } catch (exception) {
                if (exception.code === 1300002) {
                    console.error(`${caseName} This window state is abnormal.`);
                    done();
                } else {
                    console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                    expect().assertFail();
                    done();
                }
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_7500
         * @tc.name      : testGetTopSubWindowFocused
         * @tc.desc      : get the top sub window focused of current window
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
         */
        it('testGetTopSubWindowFocused', 0, async (done: Function) => {
            let caseName = 'TestGetTopSubWindowFocused';
            try {
                const windowClass1 = await windowStage.createSubWindow('subwindow1');
                console.info(`${caseName} Succeeded in creating the sub window 1.`);
                windowClass1.setUIContent("testability/pages/First/index2");
                await windowClass1.showWindow();
                await sleep(1000);
                const windowClass2 = await windowStage.createSubWindow('subwindow2');
                console.info(`${caseName} Succeeded in creating the sub window 2.`);
                windowClass2.setUIContent("testability/pages/First/index3");
                await windowClass2.showWindow();
                await sleep(1000);
                const isFocused1 = windowClass1.isFocused();
                const isFocused2 = windowClass2.isFocused();
                console.info(`${caseName} windowClass1 isFocused is: ${isFocused1}`);
                console.info(`${caseName} windowClass2 isFocused is: ${isFocused2}`);
                expect(isFocused1).assertFalse();
                expect(isFocused2).assertTrue();
                done();
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_7600
         * @tc.name      : testGetShiftWindowFocused
         * @tc.desc      : get the main window focused by shift from sub window
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
         */
        it('testGetShiftWindowFocused', 0, async (done: Function) => {
            let caseName = 'TestGetShiftWindowFocused';
            try {
                const windowClass = windowStage.getMainWindowSync();
                const subWindowClass = await windowStage.createSubWindow('subwindow');
                console.info(`${caseName} Succeeded in creating the sub window.`);
                subWindowClass.setUIContent("testability/pages/First/index2");
                await subWindowClass.showWindow();
                await sleep(1000);
                const subWindowClassId = subWindowClass.getWindowProperties().id;
                const windowClassId = windowClass.getWindowProperties().id;
                await window.shiftAppWindowFocus(subWindowClassId, windowClassId);
                console.info('Succeeded in shifting sub window focus to main window');
                await sleep(1000);
                const windowStatus = windowClass.isFocused();
                const subWindowStatus = subWindowClass.isFocused();
                console.info(`${caseName} main window isFocused is: ${windowStatus}`);
                console.info(`${caseName} sub window isFocused is: ${subWindowStatus}`);
                await subWindowClass.destroyWindow();
                console.info(`${caseName} Succeeded in destroying the window.`);
                expect(windowStatus).assertTrue();
                expect(subWindowStatus).assertFalse();
                done();
            } catch (exception) {
                if (exception.code === 1300002) {
                    console.error(`${caseName} This window state is abnormal.`);
                    done();
                } else {
                    console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                    expect().assertFail();
                    done();
                }
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_7700
         * @tc.name      : testGetDestroyedSubWindowFocused
         * @tc.desc      : get the sub window focused of current window
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
         */
        it('testGetDestroyedSubWindowFocused', 0, async (done: Function) => {
            let caseName = 'TestGetDestroyedSubWindowFocused';
            try {
                const windowClass = await windowStage.createSubWindow('subwindow');
                console.info(`${caseName} Succeeded in creating the sub window.`);
                windowClass.setUIContent("testability/pages/First/index2");
                await windowClass.destroyWindow();
                console.info(`${caseName} Succeeded in destroying the sub window.`);
                await sleep(1000);
                const isFocused = windowClass.isFocused();
                console.info(`${caseName} isFocused is: ${isFocused}`);
                expect(false).assertEqual(true);
                done();
            } catch (exception) {
                console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                expect(exception.code).assertEqual(1300002);
                done();
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_7800
         * @tc.name      : testmoveWindowToGlobal_401
         * @tc.desc      : get the global rect.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
         */
        it('testmoveWindowToGlobal_401', 0, async (done: Function) => {
            let caseName = 'TestmoveWindowToGlobal_401';
            try {
                const windowClass = await windowStage.createSubWindow('testmoveWindowToGlobal_401');
                windowClass.moveWindowToGlobal(null, null).then(() => {
                    console.info(`${caseName} Succeeded in moving the window`);
                    let rect = windowClass.getWindowProperties().windowRect;
                    console.info(`${caseName} Get window rect: ${JSON.stringify(rect)}`);
                    expect(false).assertTrue();
                    done();
                }).catch((err: BusinessError) => {
                    console.error(`${caseName} Failed to move the window. Cause code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                });
            } catch (exception) {
                console.error(`${caseName} Failed to move the window. Cause code: ${exception.code}, message: ${exception.message}`);
                expect(exception.code).assertEqual(401);
                done();
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_7900
         * @tc.name      : testgetGlobalRect
         * @tc.desc      : get the global rect.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
         */
        it('testgetGlobalRect', 0, async (done: Function) => {
            let caseName = 'testgetGlobalRect';
            try {
                const windowClass = windowStage.getMainWindowSync();
                let rect = windowClass.getGlobalRect();
                console.info(`${caseName} Succeeded in getting global rect: ${JSON.stringify(rect)}`);
                expect(rect.width).assertLarger(0);
                expect(rect.height).assertLarger(0);
                done();
            } catch (exception) {
                if (exception.code === 801) {
                    console.error(`${caseName} The current device type does not support to getting the global rect.`);
                    done();
                } else {
                    console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
                    expect().assertFail();
                    done();
                }
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_8000
         * @tc.name      : testRestoreByMinimize
         * @tc.desc      : After the app main window is minimized, if the Ability is not in the background state, you can restore app main window.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
         */
        it('testRestoreByMinimize', 0, async (done: Function) => {
            let caseName = 'TestRestoreByMinimize';
            try {
                let windowClass = windowStage.getMainWindowSync();
                const mainWindowstatus = windowClass.getWindowStatus();
                console.info(`${caseName} Succeeded in getting window status. Data: ${mainWindowstatus}`);
                windowClass.minimize().then(async () => {
                    console.info(`${caseName} Succeeded in minimizing the window.`);
                    await sleep(2000);
                    windowClass.restore().then(async () => {
                        console.info(`${caseName} Succeeded in restoring the window.`);
                        await sleep(1000);
                        let windowStatus = windowClass.getWindowStatus();
                        console.info(`${caseName} Succeeded in getting the window status. Data: ${windowStatus}`);
                        expect(windowStatus).assertEqual(mainWindowstatus);
                        done();
                    }).catch((err: BusinessError) => {
                        if (err.code === 801) {
                            console.error(`${caseName} The current device type does not support to restore.`);
                            done();
                        } else {
                            console.error(`${caseName} Unauthorized operation. Cause code: ${err.code}, message: ${err.message}`);
                            expect(1300004).assertEqual(err.code);
                            done();
                        }
                    });
                }).catch((err: BusinessError) => {
                    console.error(`${caseName} Failed to minimize the window. Cause code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                });
            } catch (exception) {
                if (exception.code === 801) {
                    console.error(`${caseName} The current device type does not support to getWindowStatus. Cause code: ${exception.code}, message: ${exception.message}`);
                    done();
                } else {
                    console.error(`Failed to obtain the window status of window. Cause code: ${exception.code}, message: ${exception.message}`);
                    expect().assertFail();
                    done();
                }
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_8100
         * @tc.name      : testRestoreByMinimizeBtn
         * @tc.desc      : After the app main window is minimized, if the Ability is not in the background state, you can restore app main window.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
         */
        it('testRestoreByMinimizeBtn', 0, async (done: Function) => {
            let caseName = 'TestRestoreByMinimizeBtn';
            try {
                let windowClass = windowStage.getMainWindowSync();
                const mainWindowstatus = windowClass.getWindowStatus();
                console.info(`${caseName} Succeeded in getting window status. Data: ${mainWindowstatus}`);
                let driver: Driver = Driver.create();
                let minimizeBtn = await driver.findComponent(ON.id('EnhanceMinimizeBtn'));
                if (minimizeBtn) {
                    await minimizeBtn.click();
                    await sleep(1000);
                    windowClass.restore().then(async () => {
                        console.info(`${caseName} Succeeded in restoring the window.`);
                        await sleep(1000);
                        let windowStatus = windowClass.getWindowStatus();
                        console.info(`${caseName} Succeeded in getting the window status. Data: ${windowStatus}`);
                        expect(windowStatus).assertEqual(mainWindowstatus);
                        done();
                    }).catch((err: BusinessError) => {
                        console.error(`${caseName} Unauthorized operation. Cause code: ${err.code}, message: ${err.message}`);
                        expect(1300004).assertEqual(err.code);
                        done();
                    });
                } else {
                    windowClass.restore().then(() => {
                        console.info(`${caseName} Succeeded in restoring the window.`);
                        expect().assertFail();
                        done();
                    }).catch((err: BusinessError) => {
                        if (err.code === 801) {
                            console.error(`${caseName} The current device type does not support to restore. Cause code: ${err.code}, message: ${err.message}`);
                            done();
                        } else {
                            console.error(`${caseName} Unauthorized operation. Cause code: ${err.code}, message: ${err.message}`);
                            expect(1300004).assertEqual(err.code);
                            done();
                        }
                    });
                }
            } catch (exception) {
                if (exception.code === 801) {
                    console.error(`${caseName} The current device type does not support to getWindowStatus. Cause code: ${exception.code}, message: ${exception.message}`);
                    done();
                } else {
                    console.error(`Failed to obtain the window status of window. Cause code: ${exception.code}, message: ${exception.message}`);
                    expect().assertFail();
                    done();
                }
            }
        })


        /**
        * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_WINDOW_DISPLAYIDCHANGE_JS_API_0100
        * @tc.name      : testOnDisplayIdChangeTest
        * @tc.desc      : On DisplayChange
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level3
        */
        it('testOnDisplayIdChangeTest', 0, async (done: Function) => {
            let caseName = 'testOnDisplayIdChangeTest';
            console.log(caseName + 'start run');
            let windowClass = windowStage.getMainWindowSync();
            const callback = (displayId: number) => {
                console.info(caseName + 'Window displayId changed, displayId=' + displayId);
            };
            try {
                windowClass.on('displayIdChange', callback);
            } catch (exception) {
                console.error(`${caseName} Failed to register callback. Cause code: ${exception.code}, message: ${exception.message}`);
                if (exception.code != 801) {
                expect().assertFail();
                }
            }
            done();
        })


        /**
        * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_WINDOW_DISPLAYIDCHANGE_JS_API_0200
        * @tc.name      : testOffDisplayIdChangeTest
        * @tc.desc      : Off DisplayChange
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level3
        */
        it('testOffDisplayIdChangeTest', 0, async (done: Function) => {
            let caseName = 'testOffDisplayIdChangeTest';
            console.log(caseName + 'start run');
            let windowClass = windowStage.getMainWindowSync();
            const callback = (displayId: number) => {
                console.info(caseName + 'Window displayId changed, displayId=' + displayId);
            };
            try {
                windowClass.on('displayIdChange', callback);
                windowClass.off('displayIdChange', callback);
                windowClass.off('displayIdChange');
            } catch (exception) {
                console.error(caseName + `Failed to unregister callback. Cause code: ${exception.code}, message: ${exception.message}`);
                if (exception.code != 801) {
                expect().assertFail();
                }
            }
            done();
        })

         /**
     * @tc.number    : SUB_BASIC_WMS_GET_ALL_WINDOW_LAYOUT_INFO_0100
     * @tc.name      : test_getAllWindowLayoutInfo_401
     * @tc.desc      : test_getAllWindowLayoutInfo_401
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_getAllWindowLayoutInfo_401', 0, async (done: Function) => {
      let caseName: string = 'test_getAllWindowLayoutInfo_401';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      try {
        let promise = window.getAllWindowLayoutInfo(null)
        promise.then((data) => {
          console.info(`${caseName} :Succeeded in obtaining all window layout info. Data: ` + JSON.stringify(data));
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} :Failed to obtain all window layout info. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        });
      } catch (err) {
        console.error(`${caseName} :Failed . Cause code: ${err.code}, message: ${err.message}`);
        if(err.code == 401){
          done();
        }else {
          expect().assertFail();
          done();
        }
      }

    });

    /**
     * @tc.number    : SUB_BASIC_WMS_GET_ALL_WINDOW_LAYOUT_INFO_0200
     * @tc.name      : test_getAllWindowLayoutInfo_mainWindow
     * @tc.desc      : test_getAllWindowLayoutInfo_mainWindow
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_getAllWindowLayoutInfo_mainWindow', 0, async (done: Function) => {
      let caseName: string = 'test_getAllWindowLayoutInfo_mainWindow';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      try {
        let mainWindow = windowStage.getMainWindowSync();
        let displayId = mainWindow.getWindowProperties().displayId;
        let promise = window.getAllWindowLayoutInfo(displayId)
        promise.then((data) => {
          console.info(`${caseName} :Succeeded in obtaining all window layout info. Data: ` + JSON.stringify(data));
          expect(data.length).assertLargerOrEqual(1);
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} :Failed to obtain all window layout info. Cause code: ${err.code}, message: ${err.message}`);
          if(err.code == 801){
            done();
          }else {
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(`${caseName} :Failed . Cause code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
        done();

      }

    });

    /**
     * @tc.number    : SUB_BASIC_WMS_START_MOVING_0100
     * @tc.name      : test_startMoving_mainWindow
     * @tc.desc      : test_startMoving_mainWindow
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_startMoving_mainWindow', 0, async (done: Function) => {
      let caseName: string = 'test_startMoving_mainWindow';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      try {
        let mainWindow = windowStage.getMainWindowSync();
        let promise = mainWindow.startMoving(100, 50)
        promise.then(() => {
          console.info(`${caseName} :Succeeded startMoving ` );
          expect(true).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} :Failed to startMoving. Cause code: ${err.code}, message: ${err.message}`);
          if(err.code == 801){
            done();
          }else {
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(`${caseName} :Failed . Cause code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
        done();

      }

    });

    /**
     * @tc.number    : SUB_BASIC_WMS_STOP_MOVING_0100
     * @tc.name      : test_stopMoving_mainWindow
     * @tc.desc      : test_stopMoving_mainWindow
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('test_stopMoving_mainWindow', 0, async (done: Function) => {
      let caseName: string = 'test_stopMoving_mainWindow';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      try {
        let mainWindow = windowStage.getMainWindowSync();
        let promise = mainWindow.stopMoving()
        promise.then(() => {
          console.info(`${caseName} :Succeeded stopMoving ` );
          expect(true).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.error(`${caseName} :Failed to stopMoving. Cause code: ${err.code}, message: ${err.message}`);
          if(err.code == 801){
            done();
          }else {
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(`${caseName} :Failed . Cause code: ${err.code}, message: ${err.message}`);
        expect().assertFail();
        done();

      }

    });

    /**
     * @tc.number    : SUB_BASIC_WMS_SET_WINDOW_LIMITS_0100
     * @tc.name      : test_SetWindowLimits_40vp
     * @tc.desc      : test_SetWindowLimits_40vp
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('test_SetWindowLimits_40vp', 0, async(done: Function) => {
      let msg = ' test_SetWindowLimits_40vp ';
      console.info(msg + ' begin ');
      try {
        let windowClass: window.Window = windowStage.getMainWindowSync()
        let windowLimits: window.WindowLimits = {
          maxWidth: 1000,
          maxHeight: 1000,
          minWidth: vp2px(40),
          minHeight: vp2px(40)
        };
        let promise: Promise<window.WindowLimits> = windowClass.setWindowLimits(windowLimits, true);
        promise.then(async (data: window.WindowLimits) => {
          console.info(msg + ' Succeeded in changing the window limits. Cause: ' + JSON.stringify(data));
          let windowLimits = await windowClass.getWindowLimits();
          console.info(msg + ' Succeeded in get the window limits. Cause: ' + JSON.stringify(windowLimits));
          expect(windowLimits.maxWidth).assertEqual(data.maxWidth);
          expect(windowLimits.maxHeight).assertEqual(data.maxHeight);
          if(windowLimits.minWidth != undefined && data.minWidth != undefined && windowLimits.minHeight != undefined && data.minHeight != undefined){
            expect(Math.abs(windowLimits.minWidth-data.minWidth)).assertLessOrEqual(1);
            expect(Math.abs(windowLimits.minHeight-data.minHeight)).assertLessOrEqual(1);
            done();
          }
        }).catch((err: BusinessError) => {
            console.error(msg + ' failed in windowClass.setWindowLimits ' + JSON.stringify(err));
            expect().assertFail()
            done();
        });
      } catch (error) {
        console.error(msg + ' failed in windowClass.setWindowLimits 2  ' + JSON.stringify(error));
        if(error.code == 801){
            console.info(msg+' The current device type is not supported')
            done();
          }else{
            expect().assertFail()
            done();
          }
      }
    })
    })
}

