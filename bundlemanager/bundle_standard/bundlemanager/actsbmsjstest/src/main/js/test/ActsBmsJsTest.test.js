/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import bundle from '@ohos.bundle'
import pkg from '@system.package'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'

const NUM_TWO = 2;
const NUM_FOUR = 4;
const BUNDLE_NAME2 = 'com.example.third2';
const BUNDLE_NAME3 = 'com.example.third5';
const BUNDLE_NAME4 = 'com.example.js';
const BUNDLE_NAME5 = 'com.example.c';
const ABILITIY_NAME1 = 'com.example.third2.MainAbility';
const ABILITIY_NAME2 = 'com.example.third5.AMainAbility';
const ABILITIY_NAME3 = 'com.example.third5.BMainAbility';
const ABILITIY_NAME4 = 'com.example.js.MainAbility';
const ABILITIY_NAME5 = '.MainAbility';
const ABILITIY_NAME6 = "com.example.third2.MainAbilityA";
const ABILITIY_NAME7 = "com.example.third5.MainAbilityA";
const ABILITIY_NAME8 = "com.example.third5.MainAbilityB";

export default function ActsBmsJsTest() {
describe('ActsBmsJsTest', function () {

    /*
    * @tc.number: bms_getJsAbility_0100
    * @tc.name: test the multi js ability
    * @tc.desc: 1.install a js hap which has an ability with full domain name
    *           2.check the ability name by the interface of getBundleInfo
    */
    it('bms_getJsAbility_0100', 0, async function (done) {
        let result = await bundle.getBundleInfo(BUNDLE_NAME2, bundle.BundleFlag.GET_BUNDLE_WITH_ABILITIES);
        expect(result.abilityInfos.length).assertEqual(NUM_TWO);
        if (result.abilityInfos.length == NUM_TWO) {
            console.info("getBundleIno result" + JSON.stringify(result));
            let abilityInfo1 = result.abilityInfos[0];
            let abilityInfo2 = result.abilityInfos[1];
            expect(abilityInfo1.name).assertEqual(ABILITIY_NAME1);
            expect(abilityInfo2.name).assertEqual(ABILITIY_NAME6);
            expect(abilityInfo1.label).assertEqual("$string:app_name");
            expect(abilityInfo1.description).assertEqual("$string:mainability_description");
            expect(abilityInfo1.icon).assertEqual("$media:icon");
            expect(abilityInfo1.isVisible).assertEqual(true);
            expect(abilityInfo1.permissions.length).assertEqual(0);
            expect(abilityInfo1.deviceTypes[0]).assertEqual('default');
            expect(abilityInfo1.process).assertEqual(BUNDLE_NAME2);
            expect(abilityInfo1.uri).assertEqual("");
            expect(abilityInfo1.bundleName).assertEqual(BUNDLE_NAME2);
            expect(abilityInfo1.moduleName).assertEqual("entry");
            expect(Object.keys(abilityInfo1.applicationInfo).length).assertLarger(0);
            expect(abilityInfo1.type).assertEqual(1);
            expect(abilityInfo2.type).assertEqual(2);
            expect(abilityInfo1.orientation).assertEqual(0);
            expect(abilityInfo1.launchMode).assertEqual(1);
            expect(abilityInfo1.backgroundModes).assertEqual(0);
            expect(abilityInfo2.backgroundModes).assertEqual(510);
            expect(abilityInfo1.descriptionId).assertLarger(0);
            expect(abilityInfo1.formEnabled).assertEqual(false);
            expect(abilityInfo1.iconId).assertLarger(0);
            expect(abilityInfo1.labelId).assertLarger(0);
            expect(abilityInfo1.subType).assertEqual(0);
            expect(abilityInfo1.readPermission).assertEqual("");
            expect(abilityInfo1.writePermission).assertEqual("");
            expect(abilityInfo1.targetAbility).assertEqual("");
            expect(abilityInfo1.metaData.length).assertEqual(0);
            expect(abilityInfo1.enabled).assertEqual(true);
        }
        done();
    });

    /*
     * @tc.number: bms_getJsAbility_0200
     * @tc.name: test the multi js ability
     * @tc.desc: 1.install a js hap with two ability
     *           2.check the ability name by the interface of getBundleInfo
     */
    it('bms_getJsAbility_0200', 0, async function (done) {
        let result = await bundle.getBundleInfo(BUNDLE_NAME3, bundle.BundleFlag.GET_BUNDLE_WITH_ABILITIES);
        expect(result.abilityInfos.length).assertEqual(NUM_FOUR);
        if (result.abilityInfos.length == NUM_FOUR) {
            console.info("getBundleIno result" + JSON.stringify(result));
            let abilityInfo1 = result.abilityInfos[0];
            let abilityInfo2 = result.abilityInfos[1];
            let abilityInfo3 = result.abilityInfos[2];
            let abilityInfo4 = result.abilityInfos[3];
            checkAbilityInfos(abilityInfo1);
            expect(abilityInfo2.metaData.length).assertEqual(1);
            expect(abilityInfo2.metaData[0].name).assertEqual("Data5B");
            expect(abilityInfo2.metaData[0].value).assertEqual("float");
            expect(abilityInfo2.metaData[0].extra).assertEqual("$string:mainability_description");
            expect(abilityInfo2.name).assertEqual(ABILITIY_NAME3);
            expect(abilityInfo3.name).assertEqual(ABILITIY_NAME7);
            expect(abilityInfo4.name).assertEqual(ABILITIY_NAME8);
            expect(abilityInfo3.type).assertEqual(2);
            expect(abilityInfo4.type).assertEqual(2);
            expect(abilityInfo3.backgroundModes).assertEqual(511);
            expect(abilityInfo4.backgroundModes).assertEqual(129);
        }
        done();
    });

    /*
     * @tc.number: bms_getJsAbility_0300
     * @tc.name: test the multi js ability
     * @tc.desc: 1.install a js hap which has an ability with short domain name
     *           2.check the ability name by the interface of getBundleInfo
     */
    it('bms_getJsAbility_0300', 0, async function (done) {
        let result = await bundle.getBundleInfo(BUNDLE_NAME4, bundle.BundleFlag.GET_BUNDLE_WITH_ABILITIES);
        expect(result.abilityInfos.length).assertEqual(1);
        if (result.abilityInfos.length == 1) {
            console.info("getBundleIno result" + JSON.stringify(result));
            let abilityInfo1 = result.abilityInfos[0];
            expect(abilityInfo1.name).assertEqual(ABILITIY_NAME4);
            expect(abilityInfo1.label).assertEqual("$string:app_name");
            expect(abilityInfo1.description).assertEqual("$string:mainability_description");
            expect(abilityInfo1.icon).assertEqual("$media:icon");
            expect(abilityInfo1.isVisible).assertEqual(true);
            expect(abilityInfo1.permissions.length).assertEqual(0);
            expect(abilityInfo1.deviceTypes[0]).assertEqual('default');
            expect(abilityInfo1.process).assertEqual(BUNDLE_NAME4);
            expect(abilityInfo1.uri).assertEqual("");
            expect(abilityInfo1.bundleName).assertEqual(BUNDLE_NAME4);
            expect(abilityInfo1.moduleName).assertEqual("entry");
            expect(Object.keys(abilityInfo1.applicationInfo).length).assertLarger(0);
            expect(abilityInfo1.type).assertEqual(1);
            expect(abilityInfo1.orientation).assertEqual(0);
            expect(abilityInfo1.launchMode).assertEqual(1);
            expect(abilityInfo1.backgroundModes).assertEqual(0);
            expect(abilityInfo1.descriptionId).assertLarger(0);
            expect(abilityInfo1.formEnabled).assertEqual(false);
            expect(abilityInfo1.iconId).assertLarger(0);
            expect(abilityInfo1.labelId).assertLarger(0);
            expect(abilityInfo1.subType).assertEqual(0);
            expect(abilityInfo1.readPermission).assertEqual("");
            expect(abilityInfo1.writePermission).assertEqual("");
            expect(abilityInfo1.targetAbility).assertEqual("");
            expect(abilityInfo1.metaData.length).assertEqual(0);
            expect(abilityInfo1.enabled).assertEqual(true);
        }
        done();
    });

    /*
    * @tc.number: bms_getJsAbility_0400
    * @tc.name: test the multi js ability
    * @tc.desc: 1.install a c++ hap which has an ability with short domain name
    *           2.check the ability name by the interface of getBundleInfo
    */
    it('bms_getJsAbility_0400', 0, async function (done) {
        let result = await bundle.getBundleInfo(BUNDLE_NAME5, bundle.BundleFlag.GET_BUNDLE_WITH_ABILITIES);
        expect(result.abilityInfos.length).assertEqual(1);
        if (result.abilityInfos.length == 1) {
            console.info("getBundleIno result" + JSON.stringify(result));
            let abilityInfo1 = result.abilityInfos[0];
            expect(abilityInfo1.name).assertEqual(ABILITIY_NAME5);
            expect(abilityInfo1.label).assertEqual("$string:app_name");
            expect(abilityInfo1.description).assertEqual("$string:mainability_description");
            expect(abilityInfo1.icon).assertEqual("$media:icon");
            expect(abilityInfo1.isVisible).assertEqual(true);
            expect(abilityInfo1.permissions.length).assertEqual(0);
            expect(abilityInfo1.deviceTypes[0]).assertEqual('default');
            expect(abilityInfo1.process).assertEqual(BUNDLE_NAME5);
            expect(abilityInfo1.uri).assertEqual("");
            expect(abilityInfo1.bundleName).assertEqual(BUNDLE_NAME5);
            expect(abilityInfo1.moduleName).assertEqual("entry");
            expect(Object.keys(abilityInfo1.applicationInfo).length).assertLarger(0);
            expect(abilityInfo1.type).assertEqual(1);
            expect(abilityInfo1.orientation).assertEqual(0);
            expect(abilityInfo1.launchMode).assertEqual(1);
            expect(abilityInfo1.backgroundModes).assertEqual(0);
            expect(abilityInfo1.descriptionId).assertLarger(0);
            expect(abilityInfo1.formEnabled).assertEqual(false);
            expect(abilityInfo1.iconId).assertLarger(0);
            expect(abilityInfo1.labelId).assertLarger(0);
            expect(abilityInfo1.subType).assertEqual(0);
            expect(abilityInfo1.readPermission).assertEqual("");
            expect(abilityInfo1.writePermission).assertEqual("");
            expect(abilityInfo1.targetAbility).assertEqual("");
            expect(abilityInfo1.metaData.length).assertEqual(0);
            expect(abilityInfo1.enabled).assertEqual(true);
        }
        done();
    });

    function checkAbilityInfos(info) {
        expect(info.name).assertEqual(ABILITIY_NAME2);
        expect(info.label).assertEqual("$string:app_name");
        expect(info.description).assertEqual("$string:mainability_description");
        expect(info.icon).assertEqual("$media:icon");
        expect(info.isVisible).assertEqual(true);
        expect(info.permissions.length).assertEqual(0);
        expect(info.deviceTypes[0]).assertEqual('default');
        expect(info.process).assertEqual(BUNDLE_NAME3);
        expect(info.uri).assertEqual("");
        expect(info.bundleName).assertEqual(BUNDLE_NAME3);
        expect(info.moduleName).assertEqual("entry");
        expect(Object.keys(info.applicationInfo).length).assertLarger(0);
        expect(info.type).assertEqual(1);
        expect(info.orientation).assertEqual(0);
        expect(info.launchMode).assertEqual(1);
        expect(info.backgroundModes).assertEqual(0);
        expect(info.descriptionId).assertLarger(0);
        expect(info.formEnabled).assertEqual(false);
        expect(info.iconId).assertLarger(0);
        expect(info.labelId).assertLarger(0);
        expect(info.subType).assertEqual(0);
        expect(info.readPermission).assertEqual("");
        expect(info.writePermission).assertEqual("");
        expect(info.targetAbility).assertEqual("");
        expect(info.metaData.length).assertEqual(1);
        expect(info.metaData[0].name).assertEqual("Data5A");
        expect(info.metaData[0].value).assertEqual("float");
        expect(info.metaData[0].extra).assertEqual("$string:mainability_description");
        expect(info.enabled).assertEqual(true);
    }
})}
