/*
 * Copyright (c) 2022-2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, beforeAll, afterEach, Level } from '@ohos/hypium';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import commonEventManager from '@ohos.commonEventManager';
import { Driver, ON } from '@ohos.UiTest';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import UIAbility from '@ohos.app.ability.UIAbility';
import appManager from '@ohos.app.ability.appManager';

let driver = Driver.create();
let TestUiAbility:UIAbility;
let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
function sleep(time:number) {
  return new Promise((resolve: (value: string) => void) => {
    setTimeout(() => {
      resolve("ok");
    }, time)
  });
}

export default function stageAppContextTest(abilityContext:common.UIAbilityContext) {
    describe('ActsStageAppContextTest', () => {

        beforeAll(async () => {
            try {
                let allowed = await driver.findComponent(ON.id('advanced_dialog_button_0'));
                if (allowed) {
                    await allowed.click();
                }
            } catch (err) {
                console.error('findComponent failed: ' + JSON.stringify(err));
            }
            await sleep(300);
            TestUiAbility = await abilityDelegator.getCurrentTopAbility();
        })

        afterEach(async () => {
            console.log("ActsStageContextPropertiesTest run afterEach with await");
            await sleep(1000);
        })

        /**
         * @tc.name   SUB_AA_OpenHarmony_ApplicationContext_0200
         * @tc.number SUB_AA_OpenHarmony_ApplicationContext_0200
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_AA_OpenHarmony_ApplicationContext_0200', Level.LEVEL0, async (done:Function) => {
            let TAG = "SUB_AA_OpenHarmony_ApplicationContext_0200";
            console.log(TAG + " --- start");
            let context:Context = abilityContext.getApplicationContext();
            let result = context.getApplicationContext()
            let getCacheDir:string = result.cacheDir
            console.log(TAG + 'getCacheDir::' + JSON.stringify(getCacheDir));
            expect(getCacheDir).assertEqual('/data/storage/el2/base/cache')
            done();
        });

        /**
         * @tc.name   SUB_AA_OpenHarmony_ApplicationContext_0300
         * @tc.number SUB_AA_OpenHarmony_ApplicationContext_0300
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_AA_OpenHarmony_ApplicationContext_0300', Level.LEVEL0, async (done:Function) => {
            let TAG = "SUB_AA_OpenHarmony_ApplicationContext_0300";
            console.log(TAG + " --- start");
            let context:Context = abilityContext.getApplicationContext();
            let result = await context.resourceManager.getString(33554435);
            console.log(TAG + " result = " + JSON.stringify(result));
            expect(result).assertEqual("entry_MainAbility");
            done();
        });

        /**
         * @tc.name   SUB_AA_OpenHarmony_ApplicationContext_0400
         * @tc.number SUB_AA_OpenHarmony_ApplicationContext_0400
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_AA_OpenHarmony_ApplicationContext_0400', Level.LEVEL0, async (done:Function) => {
            let TAG = "SUB_AA_OpenHarmony_ApplicationContext_0400";
            console.log(TAG + " --- start");
            let context:Context = abilityContext.getApplicationContext();
            let result = context.applicationInfo.name;
            console.log(TAG + " result = " + JSON.stringify(result));
            expect(result).assertEqual("com.example.stageappcontexttest");
            done();
        });


        /**
         * @tc.name   SUB_AA_OpenHarmony_ApplicationContext_0500
         * @tc.number SUB_AA_OpenHarmony_ApplicationContext_0500
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_AA_OpenHarmony_ApplicationContext_0500', Level.LEVEL0, async (done:Function) => {
            let TAG = "SUB_AA_OpenHarmony_ApplicationContext_0500";
            console.log(TAG + " --- start");
            let context:Context = globalThis.abilityStageContext.getApplicationContext();
            let result:Context = context.getApplicationContext()
            let getCacheDir:string = result.cacheDir
            console.log(TAG + 'getCacheDir::' + JSON.stringify(getCacheDir));
            expect(getCacheDir).assertEqual('/data/storage/el2/base/cache')
            done();
        });

        /**
         * @tc.name   SUB_AA_OpenHarmony_ApplicationContext_0600
         * @tc.number SUB_AA_OpenHarmony_ApplicationContext_0600
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_AA_OpenHarmony_ApplicationContext_0600', Level.LEVEL0, async (done:Function) => {
            let TAG = "SUB_AA_OpenHarmony_ApplicationContext_0600";
            console.log(TAG + " --- start");
            let context:Context = globalThis.abilityStageContext.getApplicationContext();
            let result = context.applicationInfo.name;
            console.log(TAG + " result = " + JSON.stringify(result));
            expect(result).assertEqual("com.example.stageappcontexttest");
            done();
        });

        /**
         * @tc.name   SUB_AA_OpenHarmony_ApplicationContext_1200
         * @tc.number SUB_AA_OpenHarmony_ApplicationContext_1200
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_AA_OpenHarmony_ApplicationContext_1200', Level.LEVEL0, async (done:Function) => {
            let TAG = "SUB_AA_OpenHarmony_ApplicationContext_1200";
            console.log(TAG + " --- start");
            let context:Context = abilityContext.getApplicationContext();
            let context2:Context = context.getApplicationContext();
            let result = context2.getApplicationContext();
            let dir:string = result.cacheDir;
            console.log(TAG + " dir = " + dir);
            expect(dir).assertEqual("/data/storage/el2/base/cache");
            done();
        });

        /**
         * @tc.name   SUB_AA_OpenHarmony_ApplicationContext_1300
         * @tc.number SUB_AA_OpenHarmony_ApplicationContext_1300
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_AA_OpenHarmony_ApplicationContext_1300', Level.LEVEL0, async (done:Function) => {
            let TAG = "SUB_AA_OpenHarmony_ApplicationContext_1300";
            console.log(TAG + " --- start");
            let context:Context = abilityContext.getApplicationContext();
            let context2:Context = context.getApplicationContext();
            let result:string = await context2.resourceManager.getString(33554435);
            console.log(TAG + " result = " + result);
            expect(result).assertEqual("entry_MainAbility");
            done();
        });

        /**
         * @tc.name   SUB_AA_OpenHarmony_ApplicationContext_1400
         * @tc.number SUB_AA_OpenHarmony_ApplicationContext_1400
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_AA_OpenHarmony_ApplicationContext_1400', Level.LEVEL0, async (done:Function) => {
            let TAG = "SUB_AA_OpenHarmony_ApplicationContext_1400";
            console.log(TAG + " --- start");
            let context:Context = abilityContext.getApplicationContext();
            let context2:Context = context.getApplicationContext();
            let result = context2.applicationInfo.name;
            console.log(TAG + " result = " + result);
            expect(result).assertEqual("com.example.stageappcontexttest");
            done();
        });

        /**
         * @tc.name   SUB_AA_OpenHarmony_ApplicationContext_1500
         * @tc.number SUB_AA_OpenHarmony_ApplicationContext_1500
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_AA_OpenHarmony_ApplicationContext_1500', Level.LEVEL0, async (done:Function) => {
            let TAG = "SUB_AA_OpenHarmony_ApplicationContext_1500";
            console.log(TAG + " --- start");
            let context:Context = abilityContext.getApplicationContext();
            let context2:Context = context.getApplicationContext();
            let result = context2.getApplicationContext();
            console.log(TAG + " result = " + JSON.stringify(result));
            expect(result.tempDir).assertEqual("/data/storage/el2/base/temp");
            expect(result.filesDir).assertEqual("/data/storage/el2/base/files");
            expect(result.distributedFilesDir).assertEqual("/data/storage/el2/distributedfiles");
            expect(result.databaseDir).assertEqual("/data/storage/el2/database");
            expect(result.preferencesDir).assertEqual("/data/storage/el2/base/preferences");
            expect(result.bundleCodeDir).assertEqual("/data/storage/el1/bundle");
            done();
        });

        /**
         * @tc.name   SUB_AA_OpenHarmony_ApplicationContext_1600
         * @tc.number SUB_AA_OpenHarmony_ApplicationContext_1600
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_AA_OpenHarmony_ApplicationContext_1600', Level.LEVEL0, async (done:Function) => {
            let TAG = "SUB_AA_OpenHarmony_ApplicationContext_1600";
            console.log(TAG + " --- start");
            let context:common.ApplicationContext = globalThis.abilityStageContext.getApplicationContext();
            context.getRunningProcessInformation().then((data:appManager.ProcessInformation[]) => {
                console.log(TAG + " result = " + JSON.stringify(data));
                expect(data[0].processName).assertEqual("com.example.stageappcontexttest");
                expect(data[0].bundleType).assertEqual(0);
            })
            done();
        });

        /**
         * @tc.name   SUB_AA_OpenHarmony_ApplicationContext_1700
         * @tc.number SUB_AA_OpenHarmony_ApplicationContext_1700
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_AA_OpenHarmony_ApplicationContext_1700', Level.LEVEL0, async (done:Function) => {
            let TAG = "SUB_AA_OpenHarmony_ApplicationContext_1700";
            console.log(TAG + " --- start");
            let context:common.ApplicationContext = globalThis.abilityStageContext.getApplicationContext();
            context.getRunningProcessInformation((err:BusinessError, data:appManager.ProcessInformation[]) => {
                console.log(TAG + " result = " + JSON.stringify(data));
                expect(data[0].processName).assertEqual("com.example.stageappcontexttest");
            })
            done();
        });

        /**
         * @tc.name   SUB_AA_OpenHarmony_ApplicationContext_1800
         * @tc.number SUB_AA_OpenHarmony_ApplicationContext_1800
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_AA_OpenHarmony_ApplicationContext_1800', Level.LEVEL0, async (done:Function) => {
            let TAG = "SUB_AA_OpenHarmony_ApplicationContext_1800";
            console.log(TAG + " --- start");
            let context:common.ApplicationContext = globalThis.abilityStageContext.getApplicationContext();
            context.getRunningProcessInformation((err:BusinessError, data:appManager.ProcessInformation[]) => {
                console.log(TAG + " result = " + JSON.stringify(data));
                expect(data[0].processName).assertEqual("com.example.stageappcontexttest");
                expect(typeof data[0].state).assertEqual("number");
            })
            done();
        });

        /**
         * @tc.name   SUB_Ability_AbilityRuntime_Configration_ApplicationContext_ClearUpApplicationData_0100
         * @tc.number SUB_Ability_AbilityRuntime_Configration_ApplicationContext_ClearUpApplicationData_0100
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Ability_AbilityRuntime_Configration_ApplicationContext_ClearUpApplicationData_0100', Level.LEVEL0, async (done:Function) => {
            let TAG = 'SUB_Ability_AbilityRuntime_Configration_ApplicationContext_ClearUpApplicationData_0100';
            let startType = 'Promise';
            console.log(TAG + ' --- start');
            let createFile = true;
            let Subscriber:commonEventManager.CommonEventSubscriber;
            let subscriberInfo_startdebugapp:commonEventManager.CommonEventSubscribeInfo = {
                events: ['clearUpApplicationDataEvent'],
            };
            let startAbility = async (notClear = false) => {
                await abilityDelegator.doAbilityForeground(TestUiAbility);
                await sleep(1000);
                await abilityContext.startAbility({
                    bundleName: 'com.example.clearUpApplicationDataHelp',
                    abilityName: 'MainAbility',
                    parameters: {
                        notClear,
                        startType,
                        createFile
                    }
                }).then(async () => {
                    let openBtn = await driver.waitForComponent(ON.id('advanced_dialog_button_1'), 3000);
                    openBtn?.click();
                }).catch((error:BusinessError) => {
                    console.log(TAG + 'start clearUpApplicationDataHelp failed:' + JSON.stringify(error));
                });
            }
            let SubscribeCallBack = async (err:BusinessError, data:commonEventManager.CommonEventData) => {
                console.log(TAG + 'Subscriber data' + JSON.stringify(data));
                let haveFileFlg:boolean = data.parameters?.result;
                try {
                    if (createFile) {
                        expect(haveFileFlg).assertTrue();
                        await sleep(1000);
                        createFile = false;
                        startAbility(true);
                    } else {
                        expect(haveFileFlg).assertFalse();
                        console.log(TAG + 'Close Subscriber');
                        commonEventManager.unsubscribe(Subscriber);
                        done();
                    }
                } catch (error) {
                    console.log(TAG + 'case failed:' + JSON.stringify(error));
                    done();
                }
            }
            try {
                commonEventManager.createSubscriber(subscriberInfo_startdebugapp).then(async (data) => {
                    console.log(TAG + 'Subscriber create');
                    Subscriber = data;
                    await commonEventManager.subscribe(Subscriber, SubscribeCallBack);
                })
            } catch (error) {
                console.log(TAG + 'Subscriber create fail ' + JSON.stringify(error));
            }
            await sleep(100);
            await startAbility();
        });

        /**
         * @tc.name   SUB_Ability_AbilityRuntime_Configration_ApplicationContext_ClearUpApplicationData_0200
         * @tc.number SUB_Ability_AbilityRuntime_Configration_ApplicationContext_ClearUpApplicationData_0200
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Ability_AbilityRuntime_Configration_ApplicationContext_ClearUpApplicationData_0200', Level.LEVEL0, async (done:Function) => {
            let TAG = 'SUB_Ability_AbilityRuntime_Configration_ApplicationContext_ClearUpApplicationData_0200';
            let startType = 'Callback';
            console.log(TAG + ' --- start');
            let createFile = true;
            let Subscriber:commonEventManager.CommonEventSubscriber;
            let subscriberInfo_startdebugapp:commonEventManager.CommonEventSubscribeInfo = {
                events: ['clearUpApplicationDataEvent'],
            };
            let startAbility = async (notClear = false) => {
                await abilityDelegator.doAbilityForeground(TestUiAbility);
                await sleep(1000);
                await abilityContext.startAbility({
                    bundleName: 'com.example.clearUpApplicationDataHelp',
                    abilityName: 'MainAbility',
                    parameters: {
                        notClear,
                        startType,
                        createFile
                    }
                }).then(async () => {
                    let openBtn = await driver.waitForComponent(ON.id('advanced_dialog_button_1'), 3000);
                    openBtn?.click();
                }).catch((error:BusinessError) => {
                    console.log(TAG + 'start clearUpApplicationDataHelp failed:' + JSON.stringify(error));
                });
            }
            let SubscribeCallBack = async (err:BusinessError, data:commonEventManager.CommonEventData) => {
                console.log(TAG + 'Subscriber data' + JSON.stringify(data));
                let haveFileFlg:boolean = data.parameters?.result;
                try {
                    if (createFile) {
                        expect(haveFileFlg).assertTrue();
                        await sleep(1000);
                        createFile = false;
                        startAbility(true);
                    } else {
                        expect(haveFileFlg).assertFalse();
                        console.log(TAG + 'Close Subscriber');
                        commonEventManager.unsubscribe(Subscriber);
                        done();
                    }
                } catch (error) {
                    console.log(TAG + 'case failed:' + JSON.stringify(error));
                    done();
                }
            }
            try {
                commonEventManager.createSubscriber(subscriberInfo_startdebugapp).then(async (data) => {
                    console.log(TAG + 'Subscriber create');
                    Subscriber = data;
                    await commonEventManager.subscribe(Subscriber, SubscribeCallBack);
                })
            } catch (error) {
                console.log(TAG + 'Subscriber create fail ' + JSON.stringify(error));
            }
            await sleep(100);
            await startAbility();
        });

        /**
         * @tc.name   SUB_Ability_AbilityRuntime_Configration_ApplicationContext_ClearUpApplicationData_0300
         * @tc.number SUB_Ability_AbilityRuntime_Configration_ApplicationContext_ClearUpApplicationData_0300
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Ability_AbilityRuntime_Configration_ApplicationContext_ClearUpApplicationData_0300', Level.LEVEL0, async (done:Function) => {
            let TAG = 'SUB_Ability_AbilityRuntime_Configration_ApplicationContext_ClearUpApplicationData_0300';
            let startType = 'Promise';
            console.log(TAG + ' --- start');
            let createFile = true;
            let Subscriber:commonEventManager.CommonEventSubscriber;
            let subscriberInfo_startdebugapp:commonEventManager.CommonEventSubscribeInfo = {
                events: ['clearUpApplicationDataEventFeature'],
            };
            let startAbility = async (notClear = false) => {
                await abilityDelegator.doAbilityForeground(TestUiAbility);
                await sleep(1000);
                await abilityContext.startAbility({
                    bundleName: 'com.example.clearUpApplicationDataHelp',
                    abilityName: 'MainAbilityFeature',
                    parameters: {
                        notClear,
                        startType,
                        createFile
                    }
                }).then(async () => {
                    let openBtn = await driver.waitForComponent(ON.id('advanced_dialog_button_1'), 3000);
                    openBtn?.click();
                }).catch((error:BusinessError) => {
                    console.log(TAG + 'start clearUpApplicationDataHelpFeature failed:' + JSON.stringify(error));
                });
            }
            let SubscribeCallBack = async (err:BusinessError, data:commonEventManager.CommonEventData) => {
                console.log(TAG + 'Subscriber data' + JSON.stringify(data));
                let haveFileFlg:boolean = data.parameters?.result;
                try {
                    if (createFile) {
                        expect(haveFileFlg).assertTrue();
                        await sleep(1000);
                        createFile = false;
                        startAbility(true);
                    } else {
                        expect(haveFileFlg).assertFalse();
                        console.log(TAG + 'Close Subscriber');
                        commonEventManager.unsubscribe(Subscriber);
                        done();
                    }
                } catch (error) {
                    console.log(TAG + 'case failed:' + JSON.stringify(error));
                    done();
                }
            }
            try {
                commonEventManager.createSubscriber(subscriberInfo_startdebugapp).then(async (data) => {
                    console.log(TAG + 'Subscriber create');
                    Subscriber = data;
                    await commonEventManager.subscribe(Subscriber, SubscribeCallBack);
                })
            } catch (error) {
                console.log(TAG + 'Subscriber create fail ' + JSON.stringify(error));
            }
            await sleep(100);
            await startAbility();
        });

        /**
         * @tc.name   SUB_Ability_AbilityRuntime_Configration_ApplicationContext_ClearUpApplicationData_0400
         * @tc.number SUB_Ability_AbilityRuntime_Configration_ApplicationContext_ClearUpApplicationData_0400
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Ability_AbilityRuntime_Configration_ApplicationContext_ClearUpApplicationData_0400', Level.LEVEL0, async (done:Function) => {
            let TAG = 'SUB_Ability_AbilityRuntime_Configration_ApplicationContext_ClearUpApplicationData_0400';
            let startType = 'Callback';
            console.log(TAG + ' --- start');
            let createFile = true;
            let Subscriber:commonEventManager.CommonEventSubscriber;
            let subscriberInfo_startdebugapp:commonEventManager.CommonEventSubscribeInfo = {
                events: ['clearUpApplicationDataEventFeature'],
            };
            let startAbility = async (notClear = false) => {
                await abilityDelegator.doAbilityForeground(TestUiAbility);
                await sleep(1000);
                await abilityContext.startAbility({
                    bundleName: 'com.example.clearUpApplicationDataHelp',
                    abilityName: 'MainAbilityFeature',
                    parameters: {
                        notClear,
                        startType,
                        createFile
                    }
                }).then(async () => {
                    let openBtn = await driver.waitForComponent(ON.id('advanced_dialog_button_1'), 3000);
                    openBtn?.click();
                }).catch((error:BusinessError) => {
                    console.log(TAG + 'start clearUpApplicationDataHelpFeature failed:' + JSON.stringify(error));
                });
            }
            let SubscribeCallBack = async (err:BusinessError, data:commonEventManager.CommonEventData) => {
                console.log(TAG + 'Subscriber data' + JSON.stringify(data));
                let haveFileFlg:boolean = data.parameters?.result;
                try {
                    if (createFile) {
                        expect(haveFileFlg).assertTrue();
                        await sleep(1000);
                        createFile = false;
                        startAbility(true);
                    } else {
                        expect(haveFileFlg).assertFalse();
                        console.log(TAG + 'Close Subscriber');
                        commonEventManager.unsubscribe(Subscriber);
                        done();
                    }
                } catch (error) {
                    console.log(TAG + 'case failed:' + JSON.stringify(error));
                    done();
                }
            }
            try {
                commonEventManager.createSubscriber(subscriberInfo_startdebugapp).then(async (data) => {
                    console.log(TAG + 'Subscriber create');
                    Subscriber = data;
                    await commonEventManager.subscribe(Subscriber, SubscribeCallBack);
                })
            } catch (error) {
                console.log(TAG + 'Subscriber create fail ' + JSON.stringify(error));
            }
            await sleep(100);
            await startAbility();
        });

        /**
         * @tc.name   SUB_Ability_AbilityRuntime_Configration_ApplicationContext_ClearUpApplicationData_0500
         * @tc.number SUB_Ability_AbilityRuntime_Configration_ApplicationContext_ClearUpApplicationData_0500
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Ability_AbilityRuntime_Configration_ApplicationContext_ClearUpApplicationData_0500', Level.LEVEL0, async (done:Function) => {
            let TAG = 'SUB_Ability_AbilityRuntime_Configration_ApplicationContext_ClearUpApplicationData_0500';
            let startType = 'Promise';
            console.log(TAG + ' --- start');
            let createFile = true;
            let Subscriber:commonEventManager.CommonEventSubscriber;
            let subscriberInfo_startdebugapp:commonEventManager.CommonEventSubscribeInfo = {
                events: ['clearUpApplicationDataEventSystem'],
            };
            let startAbility = async (notClear = false) => {
                await abilityDelegator.doAbilityForeground(TestUiAbility);
                await sleep(1000);
                await abilityContext.startAbility({
                    bundleName: 'com.example.clearUpApplicationDataHelpSystem',
                    abilityName: 'MainAbility',
                    parameters: {
                        notClear,
                        startType,
                        createFile
                    }
                }).then(async () => {
                    let openBtn = await driver.waitForComponent(ON.id('advanced_dialog_button_1'), 3000);
                    openBtn?.click();
                }).catch((error:BusinessError) => {
                    console.log(TAG + 'start clearUpApplicationDataHelpSystem failed:' + JSON.stringify(error));
                });
            }
            let SubscribeCallBack = async (err:BusinessError, data:commonEventManager.CommonEventData) => {
                console.log(TAG + 'Subscriber data' + JSON.stringify(data));
                let haveFileFlg:boolean = data.parameters?.result;
                try {
                    if (createFile) {
                        expect(haveFileFlg).assertTrue();
                        await sleep(1000);
                        createFile = false;
                        startAbility(true);
                    } else {
                        expect(haveFileFlg).assertFalse();
                        console.log(TAG + 'Close Subscriber');
                        commonEventManager.unsubscribe(Subscriber);
                        done();
                    }
                } catch (error) {
                    console.log(TAG + 'case failed:' + JSON.stringify(error));
                    done();
                }
            }
            try {
                commonEventManager.createSubscriber(subscriberInfo_startdebugapp).then(async (data) => {
                    console.log(TAG + 'Subscriber create');
                    Subscriber = data;
                    await commonEventManager.subscribe(Subscriber, SubscribeCallBack);
                })
            } catch (error) {
                console.log(TAG + 'Subscriber create fail ' + JSON.stringify(error));
            }
            await sleep(100);
            await startAbility();
        });

        /**
         * @tc.name   SUB_Ability_AbilityRuntime_Configration_ApplicationContext_ClearUpApplicationData_0600
         * @tc.number SUB_Ability_AbilityRuntime_Configration_ApplicationContext_ClearUpApplicationData_0600
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Ability_AbilityRuntime_Configration_ApplicationContext_ClearUpApplicationData_0600', Level.LEVEL0, async (done:Function) => {
            let TAG = 'SUB_Ability_AbilityRuntime_Configration_ApplicationContext_ClearUpApplicationData_0600';
            let startType = 'Callback';
            console.log(TAG + ' --- start');
            let createFile = true;
            let Subscriber:commonEventManager.CommonEventSubscriber;
            let subscriberInfo_startdebugapp:commonEventManager.CommonEventSubscribeInfo = {
                events: ['clearUpApplicationDataEventSystem'],
            };
            let startAbility = async (notClear = false) => {
                await abilityDelegator.doAbilityForeground(TestUiAbility);
                await sleep(1000);
                await abilityContext.startAbility({
                    bundleName: 'com.example.clearUpApplicationDataHelpSystem',
                    abilityName: 'MainAbility',
                    parameters: {
                        notClear,
                        startType,
                        createFile
                    }
                }).then(async () => {
                    let openBtn = await driver.waitForComponent(ON.id('advanced_dialog_button_1'), 3000);
                    openBtn?.click();
                }).catch((error:BusinessError) => {
                    console.log(TAG + 'start clearUpApplicationDataHelpSystem failed:' + JSON.stringify(error));
                });
            }
            let SubscribeCallBack = async (err:BusinessError, data:commonEventManager.CommonEventData) => {
                console.log(TAG + 'Subscriber data' + JSON.stringify(data));
                let haveFileFlg:boolean = data.parameters?.result;
                try {
                    if (createFile) {
                        expect(haveFileFlg).assertTrue();
                        await sleep(1000);
                        createFile = false;
                        startAbility(true);
                    } else {
                        expect(haveFileFlg).assertFalse();
                        console.log(TAG + 'Close Subscriber');
                        commonEventManager.unsubscribe(Subscriber);
                        done();
                    }
                } catch (error) {
                    console.log(TAG + 'case failed:' + JSON.stringify(error));
                    done();
                }
            }
            try {
                commonEventManager.createSubscriber(subscriberInfo_startdebugapp).then(async (data) => {
                    console.log(TAG + 'Subscriber create');
                    Subscriber = data;
                    await commonEventManager.subscribe(Subscriber, SubscribeCallBack);
                })
            } catch (error) {
                console.log(TAG + 'Subscriber create fail ' + JSON.stringify(error));
            }
            await sleep(100);
            await startAbility();
        });

        /**
         * @tc.name   SUB_Ability_AbilityRuntime_Configration_ApplicationContext_ClearUpApplicationData_0700
         * @tc.number SUB_Ability_AbilityRuntime_Configration_ApplicationContext_ClearUpApplicationData_0700
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Ability_AbilityRuntime_Configration_ApplicationContext_ClearUpApplicationData_0700', Level.LEVEL0, async (done:Function) => {
            let TAG = 'SUB_Ability_AbilityRuntime_Configration_ApplicationContext_ClearUpApplicationData_0700';
            let startType = 'Promise';
            console.log(TAG + ' --- start');
            let createFile = true;
            let startEntery = async () => {
                await abilityDelegator.doAbilityForeground(TestUiAbility);
                await sleep(1000);
                await abilityContext.startAbility({
                    bundleName: 'com.example.clearUpApplicationDataHelp',
                    abilityName: 'MainAbility',
                    parameters: {
                        notClear: true,
                        startType,
                        createFile
                    }
                }).then(async () => {
                    let openBtn = await driver.waitForComponent(ON.id('advanced_dialog_button_1'), 3000);
                    openBtn?.click();
                }).catch((error:BusinessError) => {
                    console.log(TAG + 'start clearUpApplicationDataHelp failed:' + JSON.stringify(error));
                });
            }
            let haveFileFlg:boolean = false;
            let Subscriber:commonEventManager.CommonEventSubscriber;
            let subscriberInfo_startdebugapp:commonEventManager.CommonEventSubscribeInfo = {
                events: ['clearUpApplicationDataEvent'],
            };
            let SubscribeCallBack = async (err:BusinessError, data:commonEventManager.CommonEventData) => {
                console.log(TAG + 'Subscriber data entry' + JSON.stringify(data));
                haveFileFlg = !!data.parameters?.result;
                try {
                    if (createFile) {
                        expect(haveFileFlg).assertTrue();
                        await sleep(1000);
                        await startSystem();
                    } else {
                        expect(haveFileFlg).assertTrue();
                        console.log(TAG + 'Close Subscriber');
                        await sleep(1000);
                        createFileSys = false;
                        await startSystem(true);
                        commonEventManager.unsubscribe(Subscriber);
                    }
                } catch (error) {
                    console.log(TAG + 'case failed:' + JSON.stringify(error));
                    done();
                }
            }

            try {
                commonEventManager.createSubscriber(subscriberInfo_startdebugapp).then(async (data) => {
                    console.log(TAG + 'clearUpApplicationDataEvent create');
                    Subscriber = data;
                    await commonEventManager.subscribe(Subscriber, SubscribeCallBack);
                })
            } catch (error) {
                console.log(TAG + 'Subscriber create fail ' + JSON.stringify(error));
            }
            let createFileSys = true;
            let startSystem = async (notClear = false) => {
                await abilityDelegator.doAbilityForeground(TestUiAbility);
                await sleep(1000);
                await abilityContext.startAbility({
                    bundleName: 'com.example.clearUpApplicationDataHelpSystem',
                    abilityName: 'MainAbility',
                    parameters: {
                        notClear,
                        startType,
                        createFile: createFileSys
                    }
                }).then(async () => {
                    let openBtn = await driver.waitForComponent(ON.id('advanced_dialog_button_1'), 3000);
                    openBtn?.click();
                }).catch((error:BusinessError) => {
                    console.log(TAG + 'start clearUpApplicationDataHelpSystem failed:' + JSON.stringify(error));
                });
            }
            let haveFileFlgSys = false;
            let SubscriberSys:commonEventManager.CommonEventSubscriber;
            let subscriberInfo_startdebugappSys:commonEventManager.CommonEventSubscribeInfo = {
                events: ['clearUpApplicationDataEventSystem'],
            };
            let SubscribeCallBackSys = async (err:BusinessError, data:commonEventManager.CommonEventData) => {
                console.log(TAG + 'Subscriber data sys' + JSON.stringify(data));
                haveFileFlgSys = !!data.parameters?.result;
                try {
                    if (createFileSys) {
                        expect(haveFileFlgSys).assertTrue();
                        await sleep(1000);
                        createFile = false;
                        await startEntery();
                    } else {
                        expect(haveFileFlgSys).assertFalse();
                        console.log(TAG + 'Close Subscriber');
                        commonEventManager.unsubscribe(SubscriberSys);
                        done();
                    }
                } catch (error) {
                    console.log(TAG + 'case failed:' + JSON.stringify(error));
                    done();
                }
            }
            try {
                commonEventManager.createSubscriber(subscriberInfo_startdebugappSys).then(async (data) => {
                    console.log(TAG + 'clearUpApplicationDataEventSystem create');
                    SubscriberSys = data;
                    await commonEventManager.subscribe(SubscriberSys, SubscribeCallBackSys);
                })
            } catch (error) {
                console.log(TAG + 'Subscriber create fail ' + JSON.stringify(error));
            }
            await sleep(1000);
            await startEntery();
        });

        /**
         * @tc.name   SUB_Ability_AbilityRuntime_Configration_ApplicationContext_ClearUpApplicationData_0800
         * @tc.number SUB_Ability_AbilityRuntime_Configration_ApplicationContext_ClearUpApplicationData_0800
         * @tc.desc   Function test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_Ability_AbilityRuntime_Configration_ApplicationContext_ClearUpApplicationData_0800', Level.LEVEL0, async (done: Function) => {
            let TAG = 'SUB_Ability_AbilityRuntime_Configration_ApplicationContext_ClearUpApplicationData_0800';
            let startType = 'Callback';
            console.log(TAG + ' --- start');
            let createFile = true;
            let startEntery = async () => {
                await abilityDelegator.doAbilityForeground(TestUiAbility);
                await sleep(1000);
                await abilityContext.startAbility({
                    bundleName: 'com.example.clearUpApplicationDataHelp',
                    abilityName: 'MainAbility',
                    parameters: {
                        notClear: true,
                        startType,
                        createFile
                    }
                }).then(async () => {
                    let openBtn = await driver.waitForComponent(ON.id('advanced_dialog_button_1'), 3000);
                    openBtn?.click();
                }).catch((error:BusinessError) => {
                    console.log(TAG + 'start clearUpApplicationDataHelp failed:' + JSON.stringify(error));
                });
            }
            let haveFileFlg:boolean = false;
            let Subscriber:commonEventManager.CommonEventSubscriber;
            let subscriberInfo_startdebugapp:commonEventManager.CommonEventSubscribeInfo = {
                events: ['clearUpApplicationDataEvent'],
            };
            let SubscribeCallBack = async (err:BusinessError, data:commonEventManager.CommonEventData) => {
                console.log(TAG + 'Subscriber data entry' + JSON.stringify(data));
                haveFileFlg = !!data.parameters?.result;
                try {
                    if (createFile) {
                        expect(haveFileFlg).assertTrue();
                        await sleep(1000);
                        await startSystem();
                    } else {
                        expect(haveFileFlg).assertTrue();
                        console.log(TAG + 'Close Subscriber');
                        await sleep(1000);
                        createFileSys = false;
                        await startSystem(true);
                        commonEventManager.unsubscribe(Subscriber);
                    }
                } catch (error) {
                    console.log(TAG + 'case failed:' + JSON.stringify(error));
                    done();
                }
            }

            try {
                commonEventManager.createSubscriber(subscriberInfo_startdebugapp).then(async (data) => {
                    console.log(TAG + 'clearUpApplicationDataEvent create');
                    Subscriber = data;
                    await commonEventManager.subscribe(Subscriber, SubscribeCallBack);
                })
            } catch (error) {
                console.log(TAG + 'Subscriber create fail ' + JSON.stringify(error));
            }
            let createFileSys = true;
            let startSystem = async (notClear = false) => {
                await abilityDelegator.doAbilityForeground(TestUiAbility);
                await sleep(1000);
                await abilityContext.startAbility({
                    bundleName: 'com.example.clearUpApplicationDataHelpSystem',
                    abilityName: 'MainAbility',
                    parameters: {
                        notClear,
                        startType,
                        createFile: createFileSys
                    }
                }).then(async () => {
                    let openBtn = await driver.waitForComponent(ON.id('advanced_dialog_button_1'), 3000);
                    openBtn?.click();
                }).catch((error:BusinessError) => {
                    console.log(TAG + 'start clearUpApplicationDataHelpSystem failed:' + JSON.stringify(error));
                });
            }
            let haveFileFlgSys = false;
            let SubscriberSys:commonEventManager.CommonEventSubscriber;
            let subscriberInfo_startdebugappSys:commonEventManager.CommonEventSubscribeInfo = {
                events: ['clearUpApplicationDataEventSystem'],
            };
            let SubscribeCallBackSys = async (err:BusinessError, data:commonEventManager.CommonEventData) => {
                console.log(TAG + 'Subscriber data sys' + JSON.stringify(data));
                haveFileFlgSys = !!data.parameters?.result;
                try {
                    if (createFileSys) {
                        expect(haveFileFlgSys).assertTrue();
                        await sleep(1000);
                        createFile = false;
                        await startEntery();
                    } else {
                        expect(haveFileFlgSys).assertFalse();
                        console.log(TAG + 'Close Subscriber');
                        commonEventManager.unsubscribe(SubscriberSys);
                        done();
                    }
                } catch (error) {
                    console.log(TAG + 'case failed:' + JSON.stringify(error));
                    done();
                }
            }
            try {
                commonEventManager.createSubscriber(subscriberInfo_startdebugappSys).then(async (data) => {
                    console.log(TAG + 'clearUpApplicationDataEventSystem create');
                    SubscriberSys = data;
                    await commonEventManager.subscribe(SubscriberSys, SubscribeCallBackSys);
                })
            } catch (error) {
                console.log(TAG + 'Subscriber create fail ' + JSON.stringify(error));
            }
            await sleep(1000);
            await startEntery();
        });

    })
}