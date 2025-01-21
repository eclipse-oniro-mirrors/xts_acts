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


export default function abilityTest() {
    describe('ActsglobalThis.abilityStageContextTest', function () {
        /**
         * @tc.number: ACTS_getApplicationInfo_0300
         * @tc.name: Application query applicationInfo Static information.
         * @tc.desc: Verify that the application query applicationInfo static
         *           information is the same as that in the configuration file.
         */
        it('ACTS_getApplicationInfo_0300', 0, async function (done) {
            console.log("ACTS_getApplicationInfo_0300 --- start ability=====>'+ abilityContext.applicationInfo")
            checkApplicationInfo(globalThis.abilityContext.applicationInfo);
            done();
        })

        /**
         * @tc.number: ACTS_getHapModuleInfo_0300
         * @tc.name: Application query currentHapModuleInfo Static information.
         * @tc.desc: Verify that the application query currentHapModuleInfo static
         *           information is the same as that in the configuration file.
         */
        it('ACTS_getHapModuleInfo_0300', 0, async function (done) {
            console.log("ACTS_getHapModuleInfo_0300 --- start ability=====>'+ abilityContext.currentHapModuleInfo")
            checkHapModuleInfo(globalThis.abilityStageContext.currentHapModuleInfo);
            done();
        })

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
            expect(data.name).assertEqual("com.example.staticabilitystagecontext");
            expect(data.description).assertEqual("$string:description_application");
            expect(data.descriptionId).assertLarger(0);
            expect(data.systemApp).assertEqual(true);
            expect(data.enabled).assertEqual(true);
            expect(data.label).assertEqual("$string:app_name");
            expect(data.labelId.length).assertLarger(0);
            expect(data.icon).assertEqual("$media:icon");
            expect(data.iconId.length).assertLarger(0);
            expect(data.process).assertEqual("com.example.staticabilitystagecontext");
            expect(data.supportedModes).assertEqual(0);
            expect(data.moduleSourceDirs.length).assertEqual(1);
            expect(data.moduleSourceDirs[0]).assertEqual("/data/app/el1/bundle/public/" +
            "com.example.staticabilitystagecontext/com.example.staticabilitystagecontext");
            expect(data.moduleInfos.length).assertEqual(1);
            expect(data.moduleInfos[0].moduleName).assertEqual("com.example.staticabilitystagecontext");
            expect(data.moduleInfos[0].moduleSourceDir).assertEqual("/data/app/el1/bundle/public/" +
            "com.example.staticabilitystagecontext/com.example.staticabilitystagecontext");
            expect(data.entryDir).assertEqual("/data/app/el1/bundle/public/" +
            "com.example.staticabilitystagecontext/com.example.staticabilitystagecontext");
            expect(data.codePath).assertEqual("/data/app/el1/bundle/public/" +
            "com.example.staticabilitystagecontext");
            expect(data.removable).assertEqual(true);
            console.log("checkApplicationInfo end  " + data);
        }
        function checkHapModuleInfo(data) {
            console.log("checkHapModuleInfo start  " + JSON.stringify(data));
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
            expect(data.name).assertEqual("com.example.staticabilitystagecontext");
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
            expect(data.moduleName).assertEqual("com.example.staticabilitystagecontext")
            expect(data.mainAbilityName).assertEqual("com.example.staticabilitystagecontext.MainAbility");
            expect(data.installationFree).assertEqual(false);
            expect(data.mainElementName).assertEqual('com.example.staticabilitystagecontext.MainAbility');
            expect(data.hashValue).assertEqual('');
            console.log("checkHapModuleInfo end  " + data);
        }
    })
}