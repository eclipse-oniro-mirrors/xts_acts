/*
* Copyright (c) 2021 Huawei Device Co., Ltd.
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

import bundle from '@ohos.bundle'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'

const BUNDLE_NAME1 = 'com.example.bmsmainabilityfirstscene';
const BUNDLE_NAME2 = 'com.example.third2';
const BUNDLE_NAME3 = 'com.example.third5';
const BUNDLE_NAME5 = 'com.example.system1';
const FIRSTMAINABILITY = 'com.example.bmsmainabilityfirstscene.MainAbility';
const SECONDMAINABILITY = 'com.example.bmsmainabilitysecondscene.MainAbility';
const MODULE_NAME = 'entry';
const ICON = '$media:icon';
const ICON_ID = 16777218;
const LABEL = '$string:app_name';
const LABEL_ID = 16777216;
const DEVICE_TYPES = 'default';
const FIRST_SCENE_HAP_NAME = 'com.example.bmsmainabilityfirstscene.MyApplication';
const SECOND_SCENE_HAP_NAME = 'com.example.bmsmainabilitysecondscene.MyApplication';
const THIRD_TWO_HAP_NAME = 'com.example.third2.MyApplication';
const THIRD_FIVE_HAP_NAME = 'com.example.third5.BmsThirdBundle5';
const SYSTEM_ONE_HAP_NAME = 'com.example.system1.BmsSystemBundle1';

export default function ActsBmsHapModuleTest() {
describe('ActsBmsHapModuleTest', function () {

    /**
     * @tc.name   Sub_Bms_Framework_Query_AppInfo_8500
     * @tc.number Sub_Bms_Framework_Query_AppInfo_8500
     * @tc.desc   get the module information of the hap with type of entry
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Bms_Framework_Query_AppInfo_8500', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async function (done) {
        let dataInfo = await bundle.getBundleInfo(BUNDLE_NAME1, bundle.BundleFlag.GET_BUNDLE_WITH_ABILITIES);
        bundle.getBundleInfo(BUNDLE_NAME1, bundle.BundleFlag.GET_BUNDLE_WITH_ABILITIES, callback);
        async function callback(err, result) {
            expect(JSON.stringify(result)).assertEqual(JSON.stringify(dataInfo));
            expect(result.hapModuleInfos.length).assertEqual(2);
            if (result.hapModuleInfos.length > 0) {
                let hapModuleInfo = result.hapModuleInfos[0];
                expect(hapModuleInfo.name).assertEqual(FIRST_SCENE_HAP_NAME);
                expect(hapModuleInfo.moduleName).assertEqual(MODULE_NAME);
                expect(hapModuleInfo.description).assertEqual('');
                expect(hapModuleInfo.descriptionId).assertEqual(0);
                expect(hapModuleInfo.icon).assertEqual(ICON);
                expect(hapModuleInfo.label).assertEqual(LABEL);
                expect(hapModuleInfo.labelId).assertEqual(LABEL_ID);
                expect(hapModuleInfo.iconId).assertEqual(ICON_ID);
                expect(hapModuleInfo.backgroundImg).assertEqual("");
                expect(hapModuleInfo.supportedModes).assertEqual(0);
                expect(hapModuleInfo.reqCapabilities.length).assertEqual(0);
                expect(hapModuleInfo.deviceTypes.length).assertEqual(0);
                expect(hapModuleInfo.mainAbilityName).assertEqual(FIRSTMAINABILITY);
                expect(hapModuleInfo.abilityInfo.length).assertLarger(0);
                expect(hapModuleInfo.installationFree).assertEqual(false);
                done();
            }
        }
    });

    /**
     * @tc.name   Sub_Bms_Framework_Query_AppInfo_8520
     * @tc.number Sub_Bms_Framework_Query_AppInfo_8520
     * @tc.desc   get the module information of the hap with type of feature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Bms_Framework_Query_AppInfo_8520', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async function (done) {
        let dataInfo = await bundle.getBundleInfo(BUNDLE_NAME1, bundle.BundleFlag.GET_BUNDLE_WITH_ABILITIES);
        bundle.getBundleInfo(BUNDLE_NAME1, bundle.BundleFlag.GET_BUNDLE_WITH_ABILITIES, async (err, result) => {
            expect(JSON.stringify(result)).assertEqual(JSON.stringify(dataInfo));
            expect(result.hapModuleInfos.length).assertEqual(2);
            if (result.hapModuleInfos.length == 2) {
                let hapModuleInfo = result.hapModuleInfos[0];
                let hapModuleInfo1 = result.hapModuleInfos[1];
                checkHapMoudleInfos(hapModuleInfo);
                checkHapMoudleInfos(hapModuleInfo1);           
                expect(hapModuleInfo.name).assertEqual(FIRST_SCENE_HAP_NAME);
                expect(hapModuleInfo1.name).assertEqual(SECOND_SCENE_HAP_NAME);
                expect(hapModuleInfo.moduleName).assertEqual(MODULE_NAME);
                expect(hapModuleInfo.mainAbilityName).assertEqual(FIRSTMAINABILITY);
                expect(hapModuleInfo1.moduleName).assertEqual('bmsmainabilitysecondscene');
                expect(hapModuleInfo1.mainAbilityName).assertEqual(SECONDMAINABILITY);
                expect(hapModuleInfo.installationFree).assertEqual(false);
                expect(hapModuleInfo1.installationFree).assertEqual(false);
                done();
            }
        });
    });

    /**
     * @tc.name   Sub_Bms_Framework_Query_AppInfo_8540
     * @tc.number Sub_Bms_Framework_Query_AppInfo_8540
     * @tc.desc   get the module information of the hap without mainAbility
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Sub_Bms_Framework_Query_AppInfo_8540', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async function (done) {
        let result = await bundle.getBundleInfo(BUNDLE_NAME2, bundle.BundleFlag.GET_BUNDLE_WITH_ABILITIES);
        bundle.getBundleInfo(BUNDLE_NAME2, bundle.BundleFlag.GET_BUNDLE_WITH_ABILITIES, (err, data) => {
            expect(JSON.stringify(result)).assertEqual(JSON.stringify(data));
            expect(result.hapModuleInfos.length).assertEqual(1);
            if (result.hapModuleInfos.length > 0) {
                let hapModuleInfo = result.hapModuleInfos[0];
                expect(hapModuleInfo.name).assertEqual(THIRD_TWO_HAP_NAME);
                expect(hapModuleInfo.moduleName).assertEqual(MODULE_NAME);
                expect(hapModuleInfo.description).assertEqual('');
                expect(hapModuleInfo.descriptionId).assertEqual(0);
                expect(hapModuleInfo.icon).assertEqual('');
                expect(hapModuleInfo.label).assertEqual('');
                expect(hapModuleInfo.labelId).assertEqual(0);
                expect(hapModuleInfo.iconId).assertEqual(0);
                expect(hapModuleInfo.backgroundImg).assertEqual("");
                expect(hapModuleInfo.supportedModes).assertEqual(0);
                expect(hapModuleInfo.reqCapabilities.length).assertEqual(0);
                expect(hapModuleInfo.deviceTypes.length).assertEqual(0);
                expect(hapModuleInfo.mainAbilityName).assertEqual("");
                expect(hapModuleInfo.abilityInfo.length).assertLarger(0);
                expect(hapModuleInfo.installationFree).assertEqual(false);
                done();
            }
        });
    });

    /**
     * @tc.name   Sub_Bms_Framework_Query_AppInfo_8560
     * @tc.number Sub_Bms_Framework_Query_AppInfo_8560
     * @tc.desc   get the module information of the hap with the added field mainAbility
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Bms_Framework_Query_AppInfo_8560', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
        let dataInfo = await bundle.getBundleInfo(BUNDLE_NAME3, bundle.BundleFlag.GET_BUNDLE_WITH_ABILITIES);
        bundle.getBundleInfo(BUNDLE_NAME3, bundle.BundleFlag.GET_BUNDLE_WITH_ABILITIES, async (err, result) => {
            expect(JSON.stringify(result)).assertEqual(JSON.stringify(dataInfo));
            expect(result.hapModuleInfos.length).assertEqual(1);
            if (result.hapModuleInfos.length == 1) {
                let hapModuleInfo = result.hapModuleInfos[0];
                expect(hapModuleInfo.name).assertEqual(THIRD_FIVE_HAP_NAME);
                expect(hapModuleInfo.moduleName).assertEqual(MODULE_NAME);
                expect(hapModuleInfo.description).assertEqual('');
                expect(hapModuleInfo.descriptionId).assertEqual(0);
                expect(hapModuleInfo.icon).assertEqual(ICON);
                expect(hapModuleInfo.label).assertEqual(LABEL);
                expect(hapModuleInfo.labelId).assertEqual(LABEL_ID);
                expect(hapModuleInfo.iconId).assertEqual(16777219);
                expect(hapModuleInfo.backgroundImg).assertEqual("");
                expect(hapModuleInfo.supportedModes).assertEqual(0);
                expect(hapModuleInfo.reqCapabilities.length).assertEqual(0);
                expect(hapModuleInfo.deviceTypes.length).assertEqual(0);
                expect(hapModuleInfo.mainAbilityName).assertEqual("com.example.third5.AMainAbility");
                expect(hapModuleInfo.abilityInfo.length).assertLarger(0);
                expect(hapModuleInfo.installationFree).assertEqual(false);
                done();
            }
        });
    });

    /**
     * @tc.name   Sub_Bms_Framework_Query_AppInfo_0120
     * @tc.number Sub_Bms_Framework_Query_AppInfo_0120
     * @tc.desc   get module information of mainAbility system application
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Bms_Framework_Query_AppInfo_0120', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
        let dataInfo = await bundle.getBundleInfo(BUNDLE_NAME5, bundle.BundleFlag.GET_BUNDLE_WITH_ABILITIES);
        bundle.getBundleInfo(BUNDLE_NAME5, bundle.BundleFlag.GET_BUNDLE_WITH_ABILITIES, callback);
        function callback(err, data) {
            expect(JSON.stringify(data)).assertEqual(JSON.stringify(dataInfo));
            expect(data.hapModuleInfos.length).assertEqual(1);
            if (data.hapModuleInfos.length == 1) {
                let hapModuleInfo = data.hapModuleInfos[0];
                expect(hapModuleInfo.name).assertEqual(SYSTEM_ONE_HAP_NAME);
                expect(hapModuleInfo.moduleName).assertEqual(MODULE_NAME);
                expect(hapModuleInfo.description).assertEqual('');
                expect(hapModuleInfo.descriptionId).assertEqual(0);
                expect(hapModuleInfo.icon).assertEqual(ICON);
                expect(hapModuleInfo.label).assertEqual(LABEL);
                expect(hapModuleInfo.labelId).assertEqual(LABEL_ID);
                expect(hapModuleInfo.iconId).assertEqual(16777219);
                expect(hapModuleInfo.backgroundImg).assertEqual("");
                expect(hapModuleInfo.supportedModes).assertEqual(0);
                expect(hapModuleInfo.reqCapabilities.length).assertEqual(0);
                expect(hapModuleInfo.deviceTypes.length).assertEqual(0);
                expect(hapModuleInfo.mainAbilityName).assertEqual("com.example.system1.MainAbility");
                expect(hapModuleInfo.abilityInfo.length).assertLarger(0);
                expect(hapModuleInfo.installationFree).assertEqual(false);
            }
            done();
        }
    });

    function checkHapMoudleInfos(info) {
        expect(info.description).assertEqual('');
        expect(info.descriptionId).assertEqual(0);
        expect(info.icon).assertEqual(ICON);
        expect(info.labelId).assertEqual(LABEL_ID);
        expect(info.iconId).assertEqual(ICON_ID);
        expect(info.label).assertEqual(LABEL);
        expect(info.backgroundImg).assertEqual("");
        expect(info.supportedModes).assertEqual(0);
        expect(info.reqCapabilities.length).assertEqual(0);
        expect(info.deviceTypes.length).assertEqual(0);
        expect(info.abilityInfo.length).assertLarger(0);
    }
})}
