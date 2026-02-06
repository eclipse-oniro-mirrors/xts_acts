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
import bundleManager from '@ohos.bundle.bundleManager'

export default function abilityTest() {
    describe('ActsglobalThis.abilityStageContextTest', () => {
        /**
         * @tc.number: ACTS_getApplicationInfo_0300
         * @tc.name: Application query applicationInfo Static information.
         * @tc.desc: Verify that the application query applicationInfo static
         *           information is the same as that in the configuration file.
         */
        it('ACTS_getApplicationInfo_0300', Level.LEVEL0, async (done:Function) => {
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
        it('ACTS_getHapModuleInfo_0300', Level.LEVEL0, async (done:Function) => {
            console.log("ACTS_getHapModuleInfo_0300 --- start ability=====>'+ abilityContext.currentHapModuleInfo")
            checkHapModuleInfo(globalThis.abilityStageContext.currentHapModuleInfo);
            done();
        })

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

            expect(data.name).assertEqual("com.acts.stabilitystagecontext");
            expect(data.description).assertEqual("$string:description_application");
            expect(data.descriptionId).assertLarger(0);
            expect(data.enabled).assertEqual(true);
            expect(data.label).assertEqual("$string:app_name");
            expect(data.labelId).assertLarger(0);
            expect(data.icon).assertEqual("$media:icon");
            expect(data.iconId).assertLarger(0);
            expect(data.process).assertEqual("com.acts.stabilitystagecontext");
            expect(data.permissions.length).assertEqual(0);
            expect(data.codePath).assertEqual("/data/app/el1/bundle/public/com.acts.stabilitystagecontext");
            expect(data.removable).assertEqual(true);
            expect(data.accessTokenId).assertLarger(0);
            expect(data.uid).assertLarger(0);
            expect(data.iconResource.bundleName).assertEqual("com.acts.stabilitystagecontext");
            expect(data.iconResource.moduleName).assertEqual("com.acts.stabilitystagecontext");
            expect(data.iconResource.id).assertLarger(0);
            expect(data.labelResource.bundleName).assertEqual("com.acts.stabilitystagecontext");
            expect(data.labelResource.moduleName).assertEqual("com.acts.stabilitystagecontext");
            expect(data.labelResource.id).assertLarger(0);
            expect(data.descriptionResource.bundleName).assertEqual("com.acts.stabilitystagecontext");
            expect(data.descriptionResource.moduleName).assertEqual("com.acts.stabilitystagecontext");
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

            expect(data.name).assertEqual('com.acts.stabilitystagecontext');
            expect(data.icon).assertEqual('$media:icon');
            expect(data.iconId).assertEqual(16777225); //16777224 =>16777225
            expect(data.label).assertEqual('$string:entry_label');
            expect(data.labelId).assertEqual(16777219);
            expect(data.description).assertEqual('$string:phone_entry_dsc');
            expect(data.descriptionId).assertEqual(16777221);
            expect(data.mainElementName).assertEqual('com.acts.stabilitystagecontext.MainAbility');
            expect(data.abilitiesInfo.length).assertEqual(1);
            expect(data.abilitiesInfo[0].bundleName).assertEqual('com.acts.stabilitystagecontext');
            expect(data.abilitiesInfo[0].moduleName).assertEqual('com.acts.stabilitystagecontext');
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
