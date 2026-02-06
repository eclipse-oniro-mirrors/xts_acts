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
import account from '@ohos.account.osAccount'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'

const BUNDLE_NAME1 = 'com.example.third1';
const BUNDLE_NAME2 = 'com.example.third5';
const BUNDLE_NAME3 = 'com.example.noexist';
const BUNDLE_NAME4 = 'com.example.system1';
const BUNDLE_NAME5 = 'com.example.vendor1';
const BUNDLE_NAME6 = 'com.example.l3jsdemo';
const ABILITY_NAME1 = 'com.example.third1.MainAbility';
const ABILITY_NAME2 = 'com.example.third5.AMainAbility';
const ABILITY_NAME3 = 'com.example.noexist.MainAbility';
const ABILITY_NAME4 = 'com.example.system1.MainAbility';
const ABILITY_NAME5 = 'com.example.vendor1.MainAbility';
const ABILITY_NAME6 = 'com.example.l3jsdemo.MainAbility';
let userId = 0;

export default function ActsBmsMetaDataTest() {
describe('ActsBmsMetaDataTest', function () {

    beforeAll(async function (done) {
        await account.getAccountManager().getOsAccountLocalIdFromProcess().then(account => {
            console.info("getOsAccountLocalIdFromProcess userid  ==========" + account);
            userId = account;
            done();
          }).catch(err=>{
            console.info("getOsAccountLocalIdFromProcess err ==========" + JSON.stringify(err));
            done();
          })
    });

    /*
    * @tc.number: Sub_Bms_Framework_Query_AbilityInfo_8500
    * @tc.name: test to get meta data for an application.
    * @tc.desc: get an ability's meta data when update.
    */
    it('Sub_Bms_Framework_Query_AbilityInfo_8500', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async function (done) {
        await bundle.queryAbilityByWant(
            {
                "bundleName": BUNDLE_NAME1,
                "abilityName": ABILITY_NAME1
            }, bundle.BundleFlag.GET_ABILITY_INFO_WITH_METADATA, userId).then(dataInfos => {
            let metaData = dataInfos[0].metaData;
            expect(metaData[0].name).assertEqual("DataA1");
            expect(metaData[0].value).assertEqual("float");
            expect(metaData[0].extra).assertEqual("$string:mainability_description");
        }).catch(err => {
            expect(err).assertFail();
        });
        bundle.queryAbilityByWant(
            {
                "bundleName": BUNDLE_NAME1,
                "abilityName": ABILITY_NAME1
            }, bundle.BundleFlag.GET_ABILITY_INFO_WITH_METADATA, userId, (err, dataInfos) => {
            let metaData = dataInfos[0].metaData;
            expect(metaData[0].name).assertEqual("DataA1");
            expect(metaData[0].value).assertEqual("float");
            expect(metaData[0].extra).assertEqual("$string:mainability_description");
            done();
        });
    });

    /*
    * @tc.number: Sub_Bms_Framework_Query_AbilityInfo_8520
    * @tc.name: test to get meta data for an application.
    * @tc.desc: get an ability's meta data which contains two HAP packages.
    */
    it('Sub_Bms_Framework_Query_AbilityInfo_8520', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async function (done) {
        await bundle.queryAbilityByWant(
            {
                "bundleName": BUNDLE_NAME6,
                "abilityName": ABILITY_NAME6
            }, bundle.BundleFlag.GET_ABILITY_INFO_WITH_METADATA, userId).then(dataInfos => {
            let metaDataInfo = dataInfos[0].metaData;
            expect(metaDataInfo[0].name).assertEqual("Data3");
            expect(metaDataInfo[0].value).assertEqual("float");
            expect(metaDataInfo[0].extra).assertEqual("$string:mainability_description");
        }).catch(err => {
            expect(err).assertFail();
        });
        bundle.queryAbilityByWant(
            {
                "bundleName": BUNDLE_NAME6,
                "abilityName": ABILITY_NAME6
            }, bundle.BundleFlag.GET_ABILITY_INFO_WITH_METADATA, userId, (err, dataInfos) => {
            let metaData = dataInfos[0].metaData;
            expect(metaData[0].name).assertEqual("Data3");
            expect(metaData[0].value).assertEqual("float");
            expect(metaData[0].extra).assertEqual("$string:mainability_description");
            done();
        });
    });

    /*
    * @tc.number: Sub_Bms_Framework_Query_AbilityInfo_0080
    * @tc.name: test to get meta data for an application.
    * @tc.desc: get an ability's meta data which has two ability.
    */
    it('Sub_Bms_Framework_Query_AbilityInfo_0080', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async function (done) {
        await bundle.queryAbilityByWant(
            {
                bundleName: BUNDLE_NAME2,
                abilityName: ABILITY_NAME2,
            }, bundle.BundleFlag.GET_ABILITY_INFO_WITH_METADATA, userId).then(dataInfos => {
            let metaData = dataInfos[0].metaData;
            expect(metaData[0].name).assertEqual("Data5A");
            expect(metaData[0].value).assertEqual("float");
            expect(metaData[0].extra).assertEqual("$string:mainability_description");
        }).catch(err => {
            expect(err).assertFail();
        });
        bundle.queryAbilityByWant(
            {
                "bundleName": BUNDLE_NAME2,
                "abilityName": ABILITY_NAME2
            }, bundle.BundleFlag.GET_ABILITY_INFO_WITH_METADATA, userId, (err, dataInfos) => {
            let metaData = dataInfos[0].metaData;
            expect(metaData[0].name).assertEqual("Data5A");
            expect(metaData[0].value).assertEqual("float");
            expect(metaData[0].extra).assertEqual("$string:mainability_description");
            done();
        });
    });

    /*
    * @tc.number: Sub_Bms_Framework_Query_AbilityInfo_0100
    * @tc.name: test to get meta data for an application that does not exist.
    * @tc.desc: get an ability's meta data which does not exist.
    */
    it('Sub_Bms_Framework_Query_AbilityInfo_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async function (done) {
        await bundle.queryAbilityByWant(
            {
                bundleName: BUNDLE_NAME3,
                abilityName: ABILITY_NAME3,
            }, bundle.BundleFlag.GET_ABILITY_INFO_WITH_METADATA, userId).then(dataInfos => {
            expect(dataInfos).assertFail();
        }).catch(err => {
            expect(err).assertEqual(1);
        });
        bundle.queryAbilityByWant(
            {
                "bundleName": BUNDLE_NAME3,
                "abilityName": ABILITY_NAME3
            }, bundle.BundleFlag.GET_ABILITY_INFO_WITH_METADATA, userId, (err, dataInfos) => {
            expect(err).assertEqual(1);
            expect(dataInfos).assertEqual("QueryAbilityInfos failed");
            done();
        });
    });

    /*
    * @tc.number: Sub_Bms_Framework_Query_AbilityInfo_0120
    * @tc.name: test to get meta data for a system application.
    * @tc.desc: get a system ability's meta data.
    */
    it('Sub_Bms_Framework_Query_AbilityInfo_0120', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async function (done) {
        await bundle.queryAbilityByWant(
            {
                bundleName: BUNDLE_NAME4,
                abilityName: ABILITY_NAME4,
            }, bundle.BundleFlag.GET_ABILITY_INFO_WITH_METADATA, userId).then(dataInfos => {
            let metaData = dataInfos[0].metaData;
            expect(metaData[0].name).assertEqual("Data1S");
            expect(metaData[0].value).assertEqual("float");
            expect(metaData[0].extra).assertEqual("$string:mainability_description");
        }).catch(err => {
            expect(err).assertFail();
        });
        bundle.queryAbilityByWant(
            {
                "bundleName": BUNDLE_NAME4,
                "abilityName": ABILITY_NAME4
            }, bundle.BundleFlag.GET_ABILITY_INFO_WITH_METADATA, userId, (err, dataInfos) => {
            let metaData = dataInfos[0].metaData;
            expect(metaData[0].name).assertEqual("Data1S");
            expect(metaData[0].value).assertEqual("float");
            expect(metaData[0].extra).assertEqual("$string:mainability_description");
            done();
        });
    });

    /*
    * @tc.number: Sub_Bms_Framework_Query_AbilityInfo_0140
    * @tc.name: test to get meta data for a vendor application.
    * @tc.desc: get a vendor ability's meta data.
    */
    it('Sub_Bms_Framework_Query_AbilityInfo_0140', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async function (done) {
        await bundle.queryAbilityByWant(
            {
                bundleName: BUNDLE_NAME5,
                abilityName: ABILITY_NAME5,
            }, bundle.BundleFlag.GET_ABILITY_INFO_WITH_METADATA, userId).then(dataInfos => {
            let metaData = dataInfos[0].metaData;
            expect(metaData[0].name).assertEqual("vendorName");
            expect(metaData[0].value).assertEqual("vendorValue");
            expect(metaData[0].extra).assertEqual("vendorcustomizeData");
        }).catch(err => {
            expect(err).assertFail();
        });
        bundle.queryAbilityByWant(
            {
                "bundleName": BUNDLE_NAME5,
                "abilityName": ABILITY_NAME5
            }, bundle.BundleFlag.GET_ABILITY_INFO_WITH_METADATA, userId, (err, dataInfos) => {
            let metaData = dataInfos[0].metaData;
            expect(metaData[0].name).assertEqual("vendorName");
            expect(metaData[0].value).assertEqual("vendorValue");
            expect(metaData[0].extra).assertEqual("vendorcustomizeData");
            done();
        });
    });
})}
