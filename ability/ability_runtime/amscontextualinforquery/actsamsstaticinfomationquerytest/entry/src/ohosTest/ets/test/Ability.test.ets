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
import commonEvent from '@ohos.commonEvent'
import bundleManager from '@ohos.bundle.bundleManager'
import commonEventManager from '@ohos.commonEventManager';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';

let subscriberInfo_MainAbility_ability:commonEventManager.CommonEventSubscribeInfo = {
    events: ["MainAbility_Start_CommonEvent_ability", "SecondAbility_Start_CommonEvent_ability"],
};

export default function abilityTest() {
    describe('ActsStaticInfoMationQueryTest', () => {
        /**
         * @tc.number: ACTS_getAbilityInfo_0100
         * @tc.name: Application query abilityInfo Static information.
         * @tc.desc: Verify that the application query abilityInfo static
         *           information is the same as that in the configuration file.
         */
        it('ACTS_getAbilityInfo_0100', Level.LEVEL0, async (done:Function) => {
            console.log("ACTS_getAbilityInfo_0100 --- start ability=====>'+ globalThis.abilityContext.abilityInfo")
            checkAbilityInfo(globalThis.abilityContext.abilityInfo);
            done();
        })

        /**
         * @tc.number: ACTS_getApplicationInfo_0100
         * @tc.name: Application query applicationInfo Static information.
         * @tc.desc: Verify that the application query applicationInfo static
         *           information is the same as that in the configuration file.
         */
        it('ACTS_getApplicationInfo_0100', Level.LEVEL0, async (done:Function) => {
            console.log("ACTS_getApplicationInfo_0100 --- start ability=====>'+ globalThis.abilityContext.applicationInfo")
            checkApplicationInfo(globalThis.abilityContext.applicationInfo);
            done();
        })

        /**
         * @tc.number: ACTS_getHapModuleInfo_0100
         * @tc.name: Application query currentHapModuleInfo Static information.
         * @tc.desc: Verify that the application query currentHapModuleInfo static
         *           information is the same as that in the configuration file.
         */
        it('ACTS_getHapModuleInfo_0100', Level.LEVEL0, async (done:Function) => {
            console.log("ACTS_getHapModuleInfo_0100 --- start ability=====>'+ globalThis.abilityContext.currentHapModuleInfo")
            checkHapModuleInfo(globalThis.abilityContext.currentHapModuleInfo);
            done();
        })

        /**
         * @tc.number: ACTS_getAbilityInfo_0200
         * @tc.name: Start different abilities of the application to obtain the static information of the
         * abilityInfo、applicationInfo、currentHapModuleInfo.
         * @tc.desc: Verify that the static information of the abilityInfo、applicationInfo、currentHapModuleInfo can be
         * queried by different abilities to start the application, which is the same as the information of the
         * abilityInfo、applicationInfo、currentHapModuleInfo in the configuration file,
         * and the information obtained by starting different abilities is different
         */
        it('ACTS_getAbilityInfo_0200', Level.LEVEL0, async (done:Function) => {
            console.log("ACTS_getAbilityInfo_0200 --- start")
            let Subscriber:commonEventManager.CommonEventSubscriber;
            let mainHap = false;
            let secondHap = false;
            let SubscribeCallBack = (err:BusinessError, data:commonEventManager.CommonEventData):void => {
                console.debug("ACTS_getAbilityInfo_0200====>Subscribe CallBack data:====>" + JSON.stringify(data));
                if (data.event == 'MainAbility_Start_CommonEvent_ability') {
                    mainHap = true;
                    console.log("ACTS_getAbilityInfo_0200====> MainAbility_Start_CommonEvent_ability")
                    let abilityInfo:bundleManager.AbilityInfo = JSON.parse(data.parameters!['abilityInfo'])
                    let hapModuleInfo:bundleManager.HapModuleInfo = JSON.parse(data.parameters!['hapModuleInfo'])
                    let applicationInfo:bundleManager.ApplicationInfo =JSON.parse(data.parameters!['applicationInfo'])
                    expect(hapModuleInfo.name).assertEqual("com.example.staticquerytesttwo");
                    expect(applicationInfo.name).assertEqual("com.example.staticquerytesttwo");
                    expect(abilityInfo.name).assertEqual("com.example.staticquerytesttwo.MainAbility");
                } else if (data.event == 'SecondAbility_Start_CommonEvent_ability'){
                    secondHap = true;
                    console.log("ACTS_getAbilityInfo_0200====> SecondAbility_Start_CommonEvent_ability")
                    let abilityInfo1:bundleManager.AbilityInfo = JSON.parse(data.parameters!['abilityInfo'])
                    let hapModuleInfo1:bundleManager.HapModuleInfo = JSON.parse(data.parameters!['hapModuleInfo'])
                    let applicationInfo1:bundleManager.ApplicationInfo =JSON.parse(data.parameters!['applicationInfo'])
                    expect(hapModuleInfo1.name).assertEqual("com.example.staticquerytesttwo");
                    expect(applicationInfo1.name).assertEqual("com.example.staticquerytesttwo");
                    expect(abilityInfo1.name).assertEqual("com.example.staticquerytesttwo.MainAbility");
                }
                if(mainHap && secondHap){
                    commonEvent.unsubscribe(Subscriber, UnSubscribeCallback);
                }
            }
            await commonEvent.createSubscriber(subscriberInfo_MainAbility_ability).then(async (data) => {
                console.debug("ACTS_getAbilityInfo_0200====>Create Subscriber====>");
                Subscriber = data;
                await commonEvent.subscribe(Subscriber, SubscribeCallBack);
                Subscriber.getSubscribeInfo().then((data)=>{
                    console.log('ACTS_getAbilityInfo_0200 - Subscriber: ' + JSON.stringify(data))
                })
                globalThis.abilityContext.startAbility({
                    bundleName: "com.example.staticquerytesttwo",
                    abilityName: "com.example.staticquerytesttwo.MainAbility",
                    action:"getglobalThis.abilityContext"
                }, (error:BusinessError, data:common.AbilityResult) => {
                    console.log('ACTS_getAbilityInfo_0200_startMainAbility: ' + JSON.stringify(error) +
                    ", " + JSON.stringify(data))
                })
            })
            let UnSubscribeCallback = ():void => {
                console.debug("ACTS_getAbilityInfo_0200====>UnSubscribe CallBack====>");
                done();
            }
        })

        let checkAbilityInfo = (data:ESObject):void => {
            console.log("checkAbilityInfo start  " + JSON.stringify(data));
            console.log("checkAbilityInfo bundleName : " + data.bundleName);
            console.log("checkAbilityInfo moduleName : " + data.moduleName);
            console.log("checkAbilityInfo name : " + data.name);
            console.log("checkAbilityInfo label : " + data.label);
            console.log("checkAbilityInfo labelId : " + data.labelId);
            console.log("checkAbilityInfo description : " + data.description);
            console.log("checkAbilityInfo descriptionId : " + data.descriptionId);
            console.log("checkAbilityInfo icon : " + data.icon);
            console.log("checkAbilityInfo iconId : " + data.iconId);
            console.log("checkAbilityInfo process : " + data.process);
            console.log("checkAbilityInfo exported : " + data.exported);
            console.log("checkAbilityInfo type : " + data.type)
            console.log("checkAbilityInfo orientation : " + data.orientation);
            console.log("checkAbilityInfo launchType : " + data.launchType);
            console.log("checkAbilityInfo permissions length : " + data.permissions.length);
            console.log("checkAbilityInfo permissions: " + data.permissions);
            for (let j = 0; j < data.permissions.length; j++) {
                console.log("checkAbilityInfo data.permissions[" + j + "] : " + data.permissions[j]);
            }
            console.log("checkAbilityInfo readPermission : " + data.readPermission);
            console.log("checkAbilityInfo writePermission : " + data.writePermission);
            console.log("checkAbilityInfo uri : " + data.uri);
            console.log("checkAbilityInfo deviceTypes length : " + data.deviceTypes.length);
            for (let j = 0; j < data.deviceTypes.length; j++) {
                console.log("checkAbilityInfo data.deviceTypes[" + j + "] : " + data.deviceTypes[j]);
            }
            console.log("checkAbilityInfo applicationInfo : " + JSON.stringify(data.applicationInfo));
            console.log("checkAbilityInfo metadata length : " + data.metadata.length);
            for (let j = 0; j < data.metadata.length; j++) {
                console.log("checkAbilityInfo data.metadata[" + j + "] : " + data.metadata[j]);
            }
            console.log("checkAbilityInfo enabled : " + data.enabled);
            console.log("checkAbilityInfo supportWindowModes length : " + data.supportWindowModes.length);
            for (let j = 0; j < data.supportWindowModes.length; j++) {
                console.log("checkAbilityInfo data.supportWindowModes[" + j + "] : " + data.supportWindowModes[j]);
            }
            console.log("checkAbilityInfo windowSize : " + JSON.stringify(data.windowSize));

            expect(typeof (data)).assertEqual("object");
            expect(typeof (data.bundleName)).assertEqual("string");
            expect(typeof (data.moduleName)).assertEqual("string");
            expect(typeof (data.name)).assertEqual("string");
            expect(typeof (data.label)).assertEqual("string");
            expect(typeof (data.labelId)).assertEqual("number");
            expect(typeof (data.description)).assertEqual("string");
            expect(typeof (data.descriptionId)).assertEqual("number");
            expect(typeof (data.icon)).assertEqual("string");
            expect(typeof (data.iconId)).assertEqual("number");
            expect(typeof (data.process)).assertEqual("string");
            expect(typeof (data.exported)).assertEqual("boolean");
            expect(typeof (data.type)).assertEqual("number");
            expect(typeof (data.orientation)).assertEqual("number");
            expect(typeof (data.launchType)).assertEqual("number");
            expect(Array.isArray(data.permissions)).assertEqual(true);
            expect(typeof (data.readPermission)).assertEqual("string");
            expect(typeof (data.writePermission)).assertEqual("string");
            expect(typeof (data.uri)).assertEqual("string");
            expect(Array.isArray(data.deviceTypes)).assertEqual(true);
            expect(typeof (data.applicationInfo)).assertEqual("object");
            expect(Array.isArray(data.metadata)).assertEqual(true);
            expect(typeof (data.enabled)).assertEqual("boolean");
            expect(Array.isArray(data.supportWindowModes)).assertEqual(true);
            expect(typeof (data.windowSize)).assertEqual("object");

            expect(data.bundleName).assertEqual("com.acts.staticinfomationquery");
            expect(data.moduleName).assertEqual("com.acts.staticinfomationquery");
            expect(data.name).assertEqual("com.acts.staticinfomationquery.MainAbility");
            expect(data.label).assertEqual("$string:entry_label");
            expect(data.labelId).assertLarger(0);
            expect(data.description).assertEqual("$string:phone_entry_main");
            expect(data.descriptionId).assertLarger(0);
            expect(data.icon).assertEqual("$media:icon");
            expect(data.iconId).assertLarger(0);
            expect(data.process).assertEqual("");
            expect(data.exported).assertEqual(true);
            expect(data.type).assertEqual(1);
            expect(data.orientation).assertEqual(2);
            expect(data.launchType).assertEqual(0);
            expect(data.permissions.length).assertEqual(0);
            expect(data.readPermission).assertEqual("");
            expect(data.writePermission).assertEqual("");
            expect(data.uri).assertEqual("");
            expect(data.deviceTypes.length).assertEqual(0);

            expect(data.applicationInfo.name).assertEqual("com.acts.staticinfomationquery");
            expect(data.applicationInfo.description).assertEqual("$string:description_application");
            expect(data.applicationInfo.descriptionId).assertLarger(0);
            expect(data.applicationInfo.enabled).assertEqual(true);
            expect(data.applicationInfo.label).assertEqual("$string:app_name");
            expect(data.applicationInfo.labelId).assertLarger(0);
            expect(data.applicationInfo.icon).assertEqual("$media:icon");
            expect(data.applicationInfo.iconId).assertEqual(16777225); //16777224 => 16777225
            expect(data.applicationInfo.process).assertEqual("com.acts.staticinfomationquery");
            expect(data.applicationInfo.permissions.length).assertEqual(0);
            expect(data.applicationInfo.codePath).assertEqual("/data/app/el1/bundle/public/com.acts.staticinfomationquery");
            expect(data.applicationInfo.removable).assertEqual(true);
            expect(data.applicationInfo.accessTokenId).assertLarger(0);
            expect(data.applicationInfo.uid).assertLarger(0);
            expect(data.applicationInfo.iconResource.bundleName).assertEqual("com.acts.staticinfomationquery");
            expect(data.applicationInfo.iconResource.moduleName).assertEqual("com.acts.staticinfomationquery");
            expect(data.applicationInfo.iconResource.id).assertLarger(0);
            expect(data.applicationInfo.labelResource.bundleName).assertEqual("com.acts.staticinfomationquery");
            expect(data.applicationInfo.labelResource.moduleName).assertEqual("com.acts.staticinfomationquery");
            expect(data.applicationInfo.labelResource.id).assertLarger(0);
            expect(data.applicationInfo.descriptionResource.bundleName).assertEqual("com.acts.staticinfomationquery");
            expect(data.applicationInfo.descriptionResource.moduleName).assertEqual("com.acts.staticinfomationquery");
            expect(data.applicationInfo.descriptionResource.id).assertLarger(0);
            expect(data.applicationInfo.appDistributionType).assertEqual("os_integration");
            expect(data.applicationInfo.appProvisionType).assertEqual("release");
            expect(data.applicationInfo.systemApp).assertEqual(true);
            expect(data.applicationInfo.bundleType).assertEqual(0);
            expect(data.applicationInfo.debug).assertEqual(false);

            expect(data.metadata.length).assertEqual(0);
            expect(data.enabled).assertEqual(true);
            expect(data.supportWindowModes.length).assertEqual(3);

            console.log("checkAbilityInfo end  " + data);
        }

        let checkApplicationInfo = (data:ESObject):void => {
            console.log("checkApplicationInfo start  " + JSON.stringify(data));
            console.log("checkApplicationInfo name : " + data.name);
            console.log("checkApplicationInfo description : " + data.description);
            console.log("checkApplicationInfo descriptionId : " + data.descriptionId);
            console.log("checkApplicationInfo enabled : " + data.enabled);
            console.log("checkApplicationInfo label : " + data.label)
            console.log("checkApplicationInfo labelId : " + data.labelId);
            console.log("checkApplicationInfo icon : " + data.icon);
            console.log("checkApplicationInfo iconId : " + data.iconId);
            console.log("checkApplicationInfo process : " + data.process);
            console.log("checkApplicationInfo permissions length : " + data.permissions.length);
            for (let j = 0; j < data.permissions.length; j++) {
                console.log("checkApplicationInfo data.permissions[" + j + "] : " + data.permissions[j]);
            }
            console.log("checkApplicationInfo codePath : " + data.codePath);
            console.log("checkApplicationInfo metadata size : " + data.metadata.size);
            for (let j = 0; j < data.metadata.size; j++) {
                console.log("checkApplicationInfo data.metadata[" + j + "] : " + data.metadata[j]);
            }
            console.log("checkApplicationInfo removable: " + data.removable);
            console.log("checkApplicationInfo accessTokenId: " + data.accessTokenId);
            console.log("checkApplicationInfo uid: " + data.uid);
            console.log("checkApplicationInfo iconResource: " + JSON.stringify(data.iconResource));
            console.log("checkApplicationInfo labelResource: " + JSON.stringify(data.labelResource));
            console.log("checkApplicationInfo descriptionResource: " + JSON.stringify(data.descriptionResource));
            console.log("checkApplicationInfo appDistributionType: " + data.appDistributionType);
            console.log("checkApplicationInfo appProvisionType: " + data.appProvisionType);
            console.log("checkApplicationInfo systemApp : " + data.systemApp);
            console.log("checkApplicationInfo bundleType : " + data.bundleType);
            console.log("checkApplicationInfo debug : " + data.debug);

            expect(typeof (data)).assertEqual("object");
            expect(typeof (data.name)).assertEqual("string");
            expect(typeof (data.description)).assertEqual("string");
            expect(typeof (data.descriptionId)).assertEqual("number");
            expect(typeof (data.enabled)).assertEqual("boolean");
            expect(typeof (data.label)).assertEqual("string");
            expect(typeof (data.labelId)).assertEqual("number");
            expect(typeof (data.icon)).assertEqual("string");
            expect(typeof (data.iconId)).assertEqual("number");
            expect(typeof (data.process)).assertEqual("string");
            expect(Array.isArray(data.permissions)).assertEqual(true);
            expect(typeof (data.codePath)).assertEqual("string");
            expect(typeof (data.removable)).assertEqual("boolean");
            expect(typeof (data.accessTokenId)).assertEqual("number");
            expect(typeof (data.uid)).assertEqual("number");
            expect(typeof (data.iconResource)).assertEqual("object");
            expect(typeof (data.labelResource)).assertEqual("object");
            expect(typeof (data.descriptionResource)).assertEqual("object");
            expect(typeof (data.appDistributionType)).assertEqual("string");
            expect(typeof (data.appProvisionType)).assertEqual("string");
            expect(typeof (data.systemApp)).assertEqual("boolean");
            expect(typeof (data.bundleType)).assertEqual("number");
            expect(typeof (data.debug)).assertEqual("boolean");
            console.log("checkApplicationInfo_expect_typeof_end")

            expect(data.name).assertEqual("com.acts.staticinfomationquery");
            expect(data.description).assertEqual("$string:description_application");
            expect(data.descriptionId).assertLarger(0);
            expect(data.enabled).assertEqual(true);
            expect(data.label).assertEqual("$string:app_name");
            expect(data.labelId).assertLarger(0);
            expect(data.icon).assertEqual("$media:icon");
            expect(data.iconId).assertLarger(0);
            expect(data.process).assertEqual("com.acts.staticinfomationquery");
            expect(data.permissions.length).assertEqual(0);
            expect(data.codePath).assertEqual("/data/app/el1/bundle/public/com.acts.staticinfomationquery")
            expect(data.removable).assertEqual(true);
            expect(data.accessTokenId).assertLarger(0);
            expect(data.uid).assertLarger(0);
            expect(data.iconResource.bundleName).assertEqual("com.acts.staticinfomationquery");
            expect(data.iconResource.moduleName).assertEqual("com.acts.staticinfomationquery");
            expect(data.iconResource.id).assertLarger(0);
            expect(data.labelResource.bundleName).assertEqual("com.acts.staticinfomationquery");
            expect(data.labelResource.moduleName).assertEqual("com.acts.staticinfomationquery");
            expect(data.labelResource.id).assertLarger(0);
            expect(data.descriptionResource.bundleName).assertEqual("com.acts.staticinfomationquery");
            expect(data.descriptionResource.moduleName).assertEqual("com.acts.staticinfomationquery");
            expect(data.descriptionResource.id).assertLarger(0);
            expect(data.appDistributionType).assertEqual("os_integration");
            expect(data.appProvisionType).assertEqual("release");
            expect(data.systemApp).assertEqual(true);
            expect(data.bundleType).assertEqual(0);
            expect(data.debug).assertEqual(false);
            console.log("checkApplicationInfo end  " + data);
        }

        let checkHapModuleInfo = (data:ESObject):void => {
            console.log("checkHapModuleInfo start  " + JSON.stringify(data));
            console.log("checkHapModuleInfo name : " + data.name);
            console.log("checkHapModuleInfo icon : " + data.icon);
            console.log("checkHapModuleInfo iconId : " + data.iconId);
            console.log("checkHapModuleInfo label : " + data.label);
            console.log("checkHapModuleInfo labelId : " + data.labelId);
            console.log("checkHapModuleInfo description : " + data.description);
            console.log("checkHapModuleInfo descriptionId : " + data.descriptionId);
            console.log("checkHapModuleInfo mainElementName : " + data.mainElementName);
            console.log("checkHapModuleInfo abilitiesInfo : " + JSON.stringify(data.abilitiesInfo));
            console.log("checkHapModuleInfo extensionAbilitiesInfo : " + JSON.stringify(data.extensionAbilitiesInfo));
            console.log("checkHapModuleInfo metadata : " + JSON.stringify(data.metadata));
            console.log("checkHapModuleInfo deviceTypes length : " + data.deviceTypes.length);
            for (let j = 0; j < data.deviceTypes.length; j++) {
                console.log("checkHapModuleInfo data.deviceTypes[" + j + "] : " + data.deviceTypes[j]);
            }
            console.log("checkHapModuleInfo installationFree : " + data.installationFree);
            console.log("checkHapModuleInfo hashValue : " + data.hashValue);
            console.log("checkHapModuleInfo type : " + data.type);
            console.log("checkHapModuleInfo dependencies length : " + data.dependencies.length);
            for (let j = 0; j < data.dependencies.length; j++) {
                console.log("checkHapModuleInfo data.dependencies[" + j + "] : " + data.dependencies[j]);
            }
            console.log("checkHapModuleInfo preloads length : " + data.preloads.length);
            for (let j = 0; j < data.preloads.length; j++) {
                console.log("checkHapModuleInfo data.preloads[" + j + "] : " + data.preloads[j]);
            }

            expect(typeof (data)).assertEqual("object");
            expect(typeof (data.name)).assertEqual("string");
            expect(typeof (data.icon)).assertEqual("string");
            expect(typeof (data.iconId)).assertEqual("number");
            expect(typeof (data.label)).assertEqual("string");
            expect(typeof (data.labelId)).assertEqual("number");
            expect(typeof (data.description)).assertEqual("string");
            expect(typeof (data.descriptionId)).assertEqual("number");
            expect(typeof (data.mainElementName)).assertEqual("string");
            expect(Array.isArray(data.abilitiesInfo)).assertEqual(true);
            expect(Array.isArray(data.extensionAbilitiesInfo)).assertEqual(true);
            expect(Array.isArray(data.metadata)).assertEqual(true);
            expect(Array.isArray(data.deviceTypes)).assertEqual(true);
            expect(typeof (data.installationFree)).assertEqual("boolean");
            expect(typeof (data.hashValue)).assertEqual("string");
            expect(typeof (data.type)).assertEqual("number");
            expect(Array.isArray(data.dependencies)).assertEqual(true);
            expect(Array.isArray(data.preloads)).assertEqual(true);
            console.log("checkHapModuleInfo_expect_typeof_end")

            expect(data.name).assertEqual("com.acts.staticinfomationquery");
            expect(data.icon).assertEqual("$media:icon");
            expect(data.iconId).assertEqual(16777225); //16777224 =>16777225
            expect(data.label).assertEqual("$string:entry_label");
            expect(data.labelId).assertEqual(16777219);
            expect(data.description).assertEqual("$string:phone_entry_dsc");
            expect(data.descriptionId).assertEqual(16777221);
            expect(data.mainElementName).assertEqual('com.acts.staticinfomationquery.MainAbility');
            expect(data.abilitiesInfo.length).assertEqual(1);
            expect(data.abilitiesInfo[0].bundleName).assertEqual("com.acts.staticinfomationquery");
            expect(data.abilitiesInfo[0].moduleName).assertEqual("com.acts.staticinfomationquery");
            expect(data.extensionAbilitiesInfo.length).assertEqual(0);
            expect(data.metadata.length).assertEqual(0);
            expect(data.deviceTypes.length).assertEqual(0);
            expect(data.installationFree).assertEqual(false);
            expect(data.hashValue).assertEqual('');
            expect(data.type).assertEqual(bundleManager.ModuleType.ENTRY);
            expect(data.dependencies.length).assertEqual(0);
            expect(data.preloads.length).assertEqual(0);
            console.log("checkHapModuleInfo end  " + data);
        }
    })
}
