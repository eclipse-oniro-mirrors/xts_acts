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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import commonEvent from '@ohos.commonEvent'


var subscriberInfo_MainAbility_ability = {
    events: ["MainAbility_Start_CommonEvent_ability", "SecondAbility_Start_CommonEvent_ability"],
};

export default function abilityTest() {
    describe('ActsStaticInfoMationQueryTest', function () {
        /**
         * @tc.number: ACTS_getAbilityInfo_0100
         * @tc.name: Application query abilityInfo Static information.
         * @tc.desc: Verify that the application query abilityInfo static
         *           information is the same as that in the configuration file.
         */
        it('ACTS_getAbilityInfo_0100', 0, async function (done) {
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
        it('ACTS_getApplicationInfo_0100', 0, async function (done) {
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
        it('ACTS_getHapModuleInfo_0100', 0, async function (done) {
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
        it('ACTS_getAbilityInfo_0200', 0, async function (done) {
            console.log("ACTS_getAbilityInfo_0200 --- start")
            var Subscriber;
            var mainHap = false;
            var secondHap = false;
            function SubscribeCallBack(err, data) {
                console.debug("ACTS_getAbilityInfo_0200====>Subscribe CallBack data:====>" + JSON.stringify(data));
                if (data.event == 'MainAbility_Start_CommonEvent_ability') {
                    mainHap = true;
                    console.log("ACTS_getAbilityInfo_0200====> MainAbility_Start_CommonEvent_ability")
                    let abilityInfo = JSON.parse(data.parameters['abilityInfo'])
                    let hapModuleInfo = JSON.parse(data.parameters['hapModuleInfo'])
                    let applicationInfo =JSON.parse(data.parameters['applicationInfo'])
                    expect(hapModuleInfo.name).assertEqual("com.example.staticquerytesttwo");
                    expect(applicationInfo.name).assertEqual("com.example.staticquerytesttwo");
                    expect(abilityInfo.name).assertEqual("com.example.staticquerytesttwo.MainAbility");
                } else if (data.event == 'SecondAbility_Start_CommonEvent_ability'){
                    secondHap = true;
                    console.log("ACTS_getAbilityInfo_0200====> SecondAbility_Start_CommonEvent_ability")
                    let abilityInfo1 = JSON.parse(data.parameters['abilityInfo'])
                    let hapModuleInfo1 = JSON.parse(data.parameters['hapModuleInfo'])
                    let applicationInfo1 =JSON.parse(data.parameters['applicationInfo'])
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
                }, (error, data) => {
                    console.log('ACTS_getAbilityInfo_0200_startMainAbility: ' + JSON.stringify(error) +
                    ", " + JSON.stringify(data))
                })
            })
            function UnSubscribeCallback() {
                console.debug("ACTS_getAbilityInfo_0200====>UnSubscribe CallBack====>");
                done();
            }
        })

        function checkAbilityInfo(data) {
            console.log("checkAbilityInfo start  " + data);
            console.log("checkAbilityInfo bundleName : " + data.bundleName);
            console.log("checkAbilityInfo name : " + data.name);
            console.log("checkAbilityInfo label : " + data.label);
            console.log("checkAbilityInfo description : " + data.description);
            console.log("checkAbilityInfo icon : " + data.icon);
            console.log("checkAbilityInfo labelId : " + data.labelId);
            console.log("checkAbilityInfo descriptionId : " + data.descriptionId);
            console.log("checkAbilityInfo iconId : " + data.iconId);
            console.log("checkAbilityInfo moduleName : " + data.moduleName);
            console.log("checkAbilityInfo process : " + data.process);
            console.log("checkAbilityInfo targetAbility : " + data.targetAbility);
            console.log("checkAbilityInfo backgroundModes : " + data.backgroundModes);
            console.log("checkAbilityInfo isVisible : " + data.isVisible);
            console.log("checkAbilityInfo formEnabled : " + data.formEnabled);
            console.log("checkAbilityInfo type : " + data.type)
            console.log("checkAbilityInfo subType : " + data.subType);
            console.log("checkAbilityInfo orientation : " + data.orientation);
            console.log("checkAbilityInfo launchMode : " + data.launchMode);
            console.log("checkAbilityInfo permissions length : " + data.permissions.length);
            console.log("checkAbilityInfo permissions: " + data.permissions);
            for (var j = 0; j < data.permissions.length; j++) {
                console.log("getAbilityInfo data.permissions[" + j + "] : " + data.permissions[j]);
            }
            console.log("checkAbilityInfo deviceTypes length : " + data.deviceTypes.length);
            for (var j = 0; j < data.deviceTypes.length; j++) {
                console.log("getAbilityInfo data.deviceTypes[" + j + "] : " + data.deviceTypes[j]);
            }
            console.log("checkAbilityInfo deviceCapabilities length : " + data.deviceCapabilities.length);
            for (var j = 0; j < data.deviceCapabilities.length; j++) {
                console.log("getAbilityInfo data.deviceCapabilities[" + j + "] : " + data.deviceCapabilities[j]);
            }
            console.log("checkAbilityInfo readPermission : " + data.readPermission);
            console.log("checkAbilityInfo writePermission : " + data.writePermission);
            console.log("checkAbilityInfo formEntity : " + data.formEntity);
            console.log("checkAbilityInfo minFormHeight : " + data.minFormHeight);
            console.log("checkAbilityInfo defaultFormHeight : " + data.defaultFormHeight);
            console.log("checkAbilityInfo minFormWidth : " + data.minFormWidth);
            console.log("checkAbilityInfo defaultFormWidth : " + data.defaultFormWidth);
            console.log("checkAbilityInfo uri : " + data.uri);
            expect(typeof (data)).assertEqual("object");
            expect(typeof (data.bundleName)).assertEqual("string");
            expect(typeof (data.name)).assertEqual("string");
            expect(typeof (data.label)).assertEqual("string");
            expect(typeof (data.description)).assertEqual("string");
            expect(typeof (data.icon)).assertEqual("string");
            expect(typeof (data.labelId)).assertEqual("number");
            expect(typeof (data.descriptionId)).assertEqual("number");
            expect(typeof (data.iconId)).assertEqual("number");
            expect(typeof (data.moduleName)).assertEqual("string");
            expect(typeof (data.process)).assertEqual("string");
            expect(typeof (data.targetAbility)).assertEqual("string");
            expect(typeof (data.backgroundModes)).assertEqual("number");
            expect(typeof (data.isVisible)).assertEqual("boolean");
            expect(typeof (data.formEnabled)).assertEqual("boolean");
            expect(typeof (data.type)).assertEqual("number");
            expect(typeof (data.subType)).assertEqual("number");
            expect(typeof (data.orientation)).assertEqual("number");
            expect(typeof (data.launchMode)).assertEqual("number");
            expect(Array.isArray(data.permissions)).assertEqual(true);
            expect(Array.isArray(data.deviceTypes)).assertEqual(true);
            expect(Array.isArray(data.deviceCapabilities)).assertEqual(true);
            expect(typeof (data.readPermission)).assertEqual("string");
            expect(typeof (data.writePermission)).assertEqual("string");
            expect(typeof (data.applicationInfo)).assertEqual("object");
            expect(typeof (data.formEntity)).assertEqual("number");
            expect(typeof (data.minFormHeight)).assertEqual("number");
            expect(typeof (data.defaultFormHeight)).assertEqual("number");
            expect(typeof (data.minFormWidth)).assertEqual("number");
            expect(typeof (data.defaultFormWidth)).assertEqual("number");
            expect(typeof (data.uri)).assertEqual("string");

            expect(data.bundleName).assertEqual("com.example.staticinfomationquery");
            expect(data.name).assertEqual("com.example.staticinfomationquery.MainAbility");
            expect(data.label).assertEqual("$string:entry_label");
            expect(data.description).assertEqual("$string:phone_entry_main");
            expect(data.icon).assertEqual("$media:icon");
            expect(data.labelId).assertLarger(0);
            expect(data.descriptionId).assertLarger(0);
            expect(data.iconId).assertLarger(0);
            expect(data.moduleName).assertEqual("com.example.staticinfomationquery");
            expect(data.process).assertEqual("");
            expect(data.targetAbility).assertEqual("");
            expect(data.backgroundModes).assertEqual(0);
            expect(data.isVisible).assertEqual(true);
            expect(data.formEnabled).assertEqual(false);
            expect(data.type).assertEqual(1);
            expect(data.subType).assertEqual(0);
            expect(data.orientation).assertEqual(2);
            expect(data.launchMode).assertEqual(0);
            expect(data.permissions.length).assertEqual(0);
            expect(data.deviceTypes[0]).assertEqual("default");
            expect(data.deviceTypes.length).assertEqual(2);
            expect(data.deviceCapabilities.length).assertEqual(0);
            expect(data.readPermission).assertEqual("");
            expect(data.writePermission).assertEqual("");
            expect(data.formEntity).assertEqual(0);
            expect(data.minFormHeight).assertEqual(0);
            expect(data.defaultFormHeight).assertEqual(0);
            expect(data.minFormWidth).assertEqual(0);
            expect(data.defaultFormWidth).assertEqual(0);
            expect(data.uri).assertEqual("");
            console.log("checkAbilityInfo end  " + data);
        }
        function checkApplicationInfo(data) {
            console.log("checkApplicationInfo start  " + data);
            console.log("checkApplicationInfo name : " + data.name);
            console.log("checkApplicationInfo description : " + data.description);
            console.log("checkApplicationInfo descriptionId : " + data.descriptionId);
            console.log("checkApplicationInfo systemApp : " + data.systemApp);
            console.log("checkApplicationInfo enabled : " + data.enabled);
            console.log("checkApplicationInfo label : " + data.label)
            console.log("checkApplicationInfo labelId : " + data.labelId);
            console.log("checkApplicationInfo icon : " + data.icon);
            console.log("checkApplicationInfo iconId : " + data.iconId);
            console.log("checkApplicationInfo process : " + data.process);
            console.log("checkApplicationInfo supportedModes : " + data.supportedModes);
            console.log("checkApplicationInfo moduleSourceDirs length : " + data.moduleSourceDirs.length);
            for (var j = 0; j < data.moduleSourceDirs.length; j++) {
                console.log("checkApplicationInfo data.moduleSourceDirs[" + j + "] : " + data.moduleSourceDirs[j]);
            }
            console.log("checkApplicationInfo permissions length : " + data.permissions.length);
            for (var j = 0; j < data.permissions.length; j++) {
                console.log("checkApplicationInfo data.permissions[" + j + "] : " + data.permissions[j]);
            }
            console.log("checkApplicationInfo moduleInfos length : " + data.moduleInfos.length);
            for (var j = 0; j < data.moduleInfos.length; j++) {
                console.log("checkApplicationInfo data.moduleInfos[" + j + "].moduleName : " +
                data.moduleInfos[j].moduleName);
                console.log("checkApplicationInfo data.moduleInfos[" + j + "].moduleSourceDir : " +
                data.moduleInfos[j].moduleSourceDir);
            }

            console.log("checkApplicationInfo entryDir : " + data.entryDir);
            console.log("checkApplicationInfo codePath : " + data.codePath);
            console.log("checkApplicationInfo removable: " + data.removable);

            expect(typeof (data)).assertEqual("object");
            expect(typeof (data.name)).assertEqual("string");
            expect(typeof (data.description)).assertEqual("string");
            expect(typeof (data.descriptionId)).assertEqual("number");
            expect(typeof (data.systemApp)).assertEqual("boolean");
            expect(typeof (data.enabled)).assertEqual("boolean");
            expect(typeof (data.label)).assertEqual("string");
            expect(typeof (data.labelId)).assertEqual("string");
            expect(typeof (data.icon)).assertEqual("string");
            expect(typeof (data.iconId)).assertEqual("string");
            expect(typeof (data.process)).assertEqual("string");
            expect(typeof (data.supportedModes)).assertEqual("number");
            expect(Array.isArray(data.moduleSourceDirs)).assertEqual(true);
            expect(Array.isArray(data.permissions)).assertEqual(true);
            expect(Array.isArray(data.moduleInfos)).assertEqual(true);
            expect(typeof (data.entryDir)).assertEqual("string");
            expect(typeof (data.codePath)).assertEqual("string");
            expect(typeof (data.removable)).assertEqual("boolean");
            console.log("checkApplicationInfo_expect_typeof_end")
            expect(data.name).assertEqual("com.example.staticinfomationquery");
            expect(data.description).assertEqual("$string:description_application");
            expect(data.descriptionId).assertLarger(0);
            expect(data.systemApp).assertEqual(true);
            expect(data.enabled).assertEqual(true);
            expect(data.label).assertEqual("$string:app_name");
            expect(data.labelId.length).assertLarger(0);
            expect(data.icon).assertEqual("$media:icon");
            expect(data.iconId.length).assertLarger(0);
            expect(data.process).assertEqual("com.example.staticinfomationquery");
            expect(data.supportedModes).assertEqual(0);
            expect(data.moduleSourceDirs.length).assertEqual(1);
            expect(data.moduleSourceDirs[0]).assertEqual("/data/app/el1/bundle/public/" +
            "com.example.staticinfomationquery/com.example.staticinfomationquery");
            expect(data.moduleInfos.length).assertEqual(1);
            expect(data.moduleInfos[0].moduleName).assertEqual("com.example.staticinfomationquery");
            expect(data.moduleInfos[0].moduleSourceDir).assertEqual("/data/app/el1/bundle/public/" +
            "com.example.staticinfomationquery/com.example.staticinfomationquery");
            expect(data.entryDir).assertEqual("/data/app/el1/bundle/public/" +
            "com.example.staticinfomationquery/com.example.staticinfomationquery");
            expect(data.codePath).assertEqual("/data/app/el1/bundle/public/com.example.staticinfomationquery")
            expect(data.removable).assertEqual(true);
            console.log("checkApplicationInfo end  " + data);
        }
        function checkHapModuleInfo(data) {
            console.log("checkHapModuleInfo start  " + data);
            console.log("checkHapModuleInfo name : " + data.name);
            console.log("checkHapModuleInfo description : " + data.description);
            console.log("checkHapModuleInfo descriptionId : " + data.descriptionId);
            console.log("checkHapModuleInfo icon : " + data.icon);
            console.log("checkHapModuleInfo label : " + data.label);
            console.log("checkHapModuleInfo labelId : " + data.labelId);
            console.log("checkHapModuleInfo iconId : " + data.iconId);
            console.log("checkHapModuleInfo backgroundImg : " + data.backgroundImg);
            console.log("checkHapModuleInfo supportedModes : " + data.supportedModes);
            console.log("checkHapModuleInfo reqCapabilities length : " + data.reqCapabilities.length);
            for (var j = 0; j < data.reqCapabilities.length; j++) {
                console.log("checkHapModuleInfo data.reqCapabilities[" + j + "] : " + data.reqCapabilities[j]);
            }
            console.log("checkHapModuleInfo  deviceTypes length : " + data.deviceTypes.length);
            for (var j = 0; j < data.deviceTypes.length; j++) {
                console.log("checkHapModuleInfo data.deviceTypes[" + j + "] : " + data.deviceTypes[j]);
            }

            console.log("checkHapModuleInfo moduleName : " + data.moduleName);
            console.log("checkHapModuleInfo mainAbilityName : " + data.mainAbilityName);
            console.log("checkHapModuleInfo installationFree : " + data.installationFree);

            expect(typeof (data)).assertEqual("object");
            expect(typeof (data.name)).assertEqual("string");
            expect(typeof (data.description)).assertEqual("string");
            expect(typeof (data.icon)).assertEqual("string");
            expect(typeof (data.label)).assertEqual("string");
            expect(typeof (data.backgroundImg)).assertEqual("string");
            expect(typeof (data.supportedModes)).assertEqual("number");
            expect(Array.isArray(data.reqCapabilities)).assertEqual(true);
            expect(Array.isArray(data.deviceTypes)).assertEqual(true);
            expect(Array.isArray(data.abilityInfo)).assertEqual(true);
            expect(typeof (data.moduleName)).assertEqual("string");
            expect(typeof (data.mainAbilityName)).assertEqual("string");
            console.log("checkHapModuleInfo_expect_typeof_end")
            expect(data.name).assertEqual("com.example.staticinfomationquery");
            expect(data.description).assertEqual("$string:phone_entry_dsc");
            expect(data.descriptionId).assertEqual(16777221);
            expect(data.icon).assertEqual("$media:icon");
            expect(data.label).assertEqual("$string:entry_label");
            expect(data.labelId).assertEqual(16777219);
            expect(data.iconId).assertEqual(16777224);
            expect(data.backgroundImg).assertEqual("");
            expect(data.supportedModes).assertEqual(0);
            expect(data.reqCapabilities.length).assertEqual(0);
            expect(data.deviceTypes.length).assertEqual(2);
            expect(data.deviceTypes[0]).assertEqual("default");
            expect(data.moduleName).assertEqual("com.example.staticinfomationquery")
            expect(data.mainAbilityName).assertEqual("com.example.staticinfomationquery.MainAbility");
            expect(data.installationFree).assertEqual(false);
            expect(data.mainElementName).assertEqual('com.example.staticinfomationquery.MainAbility');
            expect(data.hashValue).assertEqual('');
            console.log("checkHapModuleInfo end  " + data);
        }
    })
}