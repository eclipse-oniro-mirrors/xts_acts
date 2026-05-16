/**
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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import Utils from './Utils';
import bundleManager from '@ohos.bundle';

const BUNDLE_NAME1 = 'com.open.harmony.packagemag';
const BUNDLE_NAME_OTHER = 'com.ohos.acecollaboration';
const BUNDLE_NAME2 = 'com.harmony.packagemag';
const BUNDLE_NAME3 = "";
const BUNDLE_NAME4 = 'com.example.third1';
const ABILITY_NAME1 = 'com.open.harmony.packagemag.MainAbility';
const ABILITY_NAME_OTHER = 'com.ohos.acecollaboration.MainAbility';
const ABILITY_NAME2 = 'com.harmony.packagemag1.MainAbility';
const ABILITY_NAME3 = 'com.example.third1.entry.MainAbility';

export default function GetabilityInfo() {

    describe('GetabilityInfo', function () {

        /**
         * @tc.name   bundle_GetabilityInfo_test_0100
         * @tc.number bundle_GetabilityInfo_test_0100
         * @tc.desc   Check the return value of the interface (by promise)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('bundle_GetabilityInfo_test_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async function (done) {
            let mData;
            let timeOldStamp = await Utils.getNowTime();
            await bundleManager.getAbilityInfo(BUNDLE_NAME1, ABILITY_NAME1).then((data) => {
                let timeNewStamp = Utils.getNowTime();
                Utils.getDurationTime('bundle_GetabilityInfo_test_0100', timeOldStamp, timeNewStamp);
                console.info('[bundle_GetabilityInfo_test_0100] getApplicationInfo promise data is: ' + JSON.stringify(data));
                expect(typeof (data)).assertEqual("object");
                mData = data;
                checkAbilityInfo(mData);
                done();
            }).catch((error) => {
                console.error('[bundle_GetabilityInfo_test_0100]Operation failed. Cause: ' + JSON.stringify(error));
                expect(error).assertFail();
                done();
            });
        });

        /**
         * @tc.name   Sub_Bms_Framework_Query_AbilityInfo_2600
         * @tc.number Sub_Bms_Framework_Query_AbilityInfo_2600
         * @tc.desc   Check the return value of the interface (by callback)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('Sub_Bms_Framework_Query_AbilityInfo_2600', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async function (done) {
            let mData;
            let timeOldStamp = await Utils.getNowTime();
            bundleManager.getAbilityInfo(BUNDLE_NAME1, ABILITY_NAME1, (err, data) => {
                let timeNewStamp = Utils.getNowTime();
                Utils.getDurationTime('Sub_Bms_Framework_Query_AbilityInfo_2600', timeOldStamp, timeNewStamp);
                if (err) {
                    console.error('[Sub_Bms_Framework_Query_AbilityInfo_2600]Operation failed. Cause: ' + JSON.stringify(err));
                    expect(err).assertFail();
                }
                console.info('[Sub_Bms_Framework_Query_AbilityInfo_2600] getApplicationInfo callback data is: ' + JSON.stringify(data));
                mData = data;
                Utils.sleep(200);
                checkAbilityInfo(mData);
                done();
            });
        });

        /**
         * @tc.name   Sub_Bms_Framework_Query_AbilityInfo_2660
         * @tc.number Sub_Bms_Framework_Query_AbilityInfo_2660
         * @tc.desc   Check the return value of the interface (by callback)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Sub_Bms_Framework_Query_AbilityInfo_2660', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
            await bundleManager.getAbilityInfo(BUNDLE_NAME4, ABILITY_NAME3).then(res => {
                checkAbilityInfo_other(res);
                console.info('actwsBundleManager getAbilityInfo promise success res:' + JSON.stringify(res));
            }).catch(err => {
                console.info('actwsBundleManager getAbilityInfo promise err:' + JSON.stringify(err));
                expect().assertFail();
            });
            bundleManager.getAbilityInfo(BUNDLE_NAME4, ABILITY_NAME3, (err, res) => {
                if (err) {
                    console.info('actwsBundleManager getAbilityInfo callback err:' + JSON.stringify(err));
                    expect().assertFail();
                    done();
                    return;
                }
                checkAbilityInfo_other(res);
                console.info('actwsBundleManager getAbilityInfo callback success res:' + JSON.stringify(res));
                done();
            });
        });


        /**
         * @tc.name   Sub_Bms_Framework_Query_AbilityInfo_2460
         * @tc.number Sub_Bms_Framework_Query_AbilityInfo_2460
         * @tc.desc   Check the return value of the interface (by promise)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('Sub_Bms_Framework_Query_AbilityInfo_2460', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async function (done) {
            let timeOldStamp = await Utils.getNowTime();
            await bundleManager.getAbilityInfo(BUNDLE_NAME_OTHER, ABILITY_NAME_OTHER).then((data) => {
                let timeNewStamp = Utils.getNowTime();
                Utils.getDurationTime('Sub_Bms_Framework_Query_AbilityInfo_2460', timeOldStamp, timeNewStamp);
                expect(data).assertFail();
            }).catch((error) => {
                console.error('[Sub_Bms_Framework_Query_AbilityInfo_2460]Operation failed. Cause: ' + JSON.stringify(error));
                expect(error).assertEqual(1);
            });
            done();
        });

        /**
         * @tc.name   Sub_Bms_Framework_Query_AbilityInfo_2620
         * @tc.number Sub_Bms_Framework_Query_AbilityInfo_2620
         * @tc.desc   Check the return value of the interface (by promise)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('Sub_Bms_Framework_Query_AbilityInfo_2620', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async function (done) {
            let error1;
            let timeOldStamp = await Utils.getNowTime();
            await bundleManager.getAbilityInfo(BUNDLE_NAME2, ABILITY_NAME1).then((data) => {
                let timeNewStamp = Utils.getNowTime();
                Utils.getDurationTime('Sub_Bms_Framework_Query_AbilityInfo_2620', timeOldStamp, timeNewStamp);
                console.info('[Sub_Bms_Framework_Query_AbilityInfo_2620] getApplicationInfo data is: ' + JSON.stringify(data));
                expect(typeof (data)).assertEqual("object");
            }).catch((error) => {
                console.error('[Sub_Bms_Framework_Query_AbilityInfo_2620]Operation failed. Cause: ' + JSON.stringify(error));
                error1 = error;
            });
            await Utils.sleep(100);
            await expect(error1).assertEqual(1);
            done();
        });

        /**
         * @tc.name   Sub_Bms_Framework_Query_AbilityInfo_2480
         * @tc.number Sub_Bms_Framework_Query_AbilityInfo_2480
         * @tc.desc   Check the return value of the interface (by callback)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('Sub_Bms_Framework_Query_AbilityInfo_2480', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async function (done) {
            let error
            await bundleManager.getAbilityInfo(BUNDLE_NAME1, ABILITY_NAME2).then((data) => {
                console.info('[Sub_Bms_Framework_Query_AbilityInfo_2480] START' + JSON.stringify(data));
            }).catch((err) => {
                console.info('[Sub_Bms_Framework_Query_AbilityInfo_2480] err = ' + JSON.stringify(err));
                error = err;
            })
            expect(error).assertEqual(1);
            done();
            console.info('[Sub_Bms_Framework_Query_AbilityInfo_2480] END');
        });

        /**
         * @tc.name   Sub_Bms_Framework_Query_AbilityInfo_2640
         * @tc.number Sub_Bms_Framework_Query_AbilityInfo_2640
         * @tc.desc   Check the return value of the interface (by promise)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('Sub_Bms_Framework_Query_AbilityInfo_2640', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async function (done) {
            let error1;
            let timeOldStamp = await Utils.getNowTime();
            await bundleManager.getAbilityInfo(BUNDLE_NAME3, ABILITY_NAME1).then((data) => {
                let timeNewStamp = Utils.getNowTime();
                Utils.getDurationTime('Sub_Bms_Framework_Query_AbilityInfo_2640', timeOldStamp, timeNewStamp);
                console.info('[Sub_Bms_Framework_Query_AbilityInfo_2640] getApplicationInfo data promise is: ' + JSON.stringify(data));
                expect(typeof (data)).assertEqual("object");
            }).catch((error) => {
                console.error('[Sub_Bms_Framework_Query_AbilityInfo_2640]Operation failed. Cause: ' + JSON.stringify(error));
                error1 = error;
            })
            await Utils.sleep(100);
            await expect(error1).assertEqual(1);
            done();
        });

        /**
         * @tc.name   testgetAbilityInfoUndefined
         * @tc.number Sub_Bms_Framework_Query_AbilityInfo_2660
         * @tc.desc   Check the return value of the interface (by callback)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('testgetAbilityInfoUndefined', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async function (done) {
            await bundleManager.getAbilityInfo(undefined, undefined).then(res => {
                console.info('actwsBundleManager getAbilityInfo promise success res:' + JSON.stringify(res));
                expect().assertFail();
            }).catch(err => {
                expect(err).assertEqual(2);
            });
            bundleManager.getAbilityInfo(null, null, (err, res) => {
                if (err) {
                    expect(err).assertEqual(2);
                    done();
                    return;
                }
                console.info('actwsBundleManager getAbilityInfo callback success res:' + JSON.stringify(res));
                expect().assertFail();
                done();
            });
        });

        function checkAbilityInfo(data) {
            expect(typeof (data.bundleName)).assertEqual("string");
            expect(data.bundleName).assertEqual("com.open.harmony.packagemag");
            expect(typeof (data.name)).assertEqual("string");
            expect(data.name).assertEqual("com.open.harmony.packagemag.MainAbility");
            expect(data.label).assertEqual("$string:entry_MainAbility");
            expect(typeof (data.label)).assertEqual("string");
            expect(data.description).assertEqual("$string:mainability_description");
            expect(typeof (data.description)).assertEqual("string");
            expect(data.icon).assertEqual("$media:icon");
            expect(typeof (data.icon)).assertEqual("string");
            expect(data.isVisible).assertEqual(true);
            expect(Array.isArray(data.permissions)).assertEqual(true);
            expect(Array.isArray(data.deviceCapabilities)).assertEqual(true);
            expect(data.deviceTypes[0]).assertEqual("default");
            expect(typeof (data.process)).assertEqual("string");
            expect(data.process).assertEqual("com.open.harmony.packagemag");
            expect(typeof (data.uri)).assertEqual("string");
            expect(data.uri).assertEqual("");
            expect(data.moduleName).assertEqual("entry");
            expect(typeof (data.moduleName)).assertEqual("string");
            expect(typeof (data.applicationInfo)).assertEqual("object");
            checkApplicationInfo(data.applicationInfo);
            console.log("---checkAbilityInfo End---  ");
        }

        function checkApplicationInfo(info) {
            expect(typeof (info)).assertEqual("object");
            expect(typeof (info.name)).assertEqual("string");
            expect(info.name).assertEqual("com.open.harmony.packagemag");
            expect(typeof (info.codePath)).assertEqual("string");
            expect(info.codePath).assertEqual("/data/app/el1/bundle/public/com.open.harmony.packagemag");
            expect(typeof (info.accessTokenId)).assertEqual("number");
            expect(info.accessTokenId > 0).assertTrue();
            expect(typeof (info.description)).assertEqual("string");
            expect(info.description).assertEqual("$string:entry_description");
            expect(typeof (info.descriptionId)).assertEqual("number");
            expect(info.descriptionId > 0).assertTrue();
            expect(typeof (info.icon)).assertEqual("string");
            expect(info.icon).assertEqual("$media:icon");
            expect(typeof (info.iconId)).assertEqual("number");
            expect(info.iconId > 0).assertTrue();
            expect(typeof (info.label)).assertEqual("string");
            expect(info.label).assertEqual("$string:entry_MainAbility");
            expect(typeof (info.labelId)).assertEqual("number");
            expect(info.labelId > 0).assertTrue();
            expect(info.systemApp).assertEqual(false);
            expect(typeof (info.entryDir)).assertEqual("string");
            expect(info.entryDir).assertEqual("");
            expect(typeof (info.supportedModes)).assertEqual("number");
            expect(info.supportedModes).assertEqual(0);
            expect(typeof (info.process)).assertEqual("string");
            expect(info.process).assertEqual("com.open.harmony.packagemag");
            expect(Array.isArray(info.moduleSourceDirs)).assertEqual(true);
            expect(info.moduleSourceDirs.length).assertEqual(0);
            expect(Array.isArray(info.permissions)).assertEqual(true);
        }

        async function checkAbilityInfo_other(data) {
            expect(data.bundleName).assertEqual("com.example.third1");
            expect(data.name).assertEqual("com.example.third1.entry.MainAbility");
            expect(data.label).assertEqual("$string:app_name");
            expect(data.description).assertEqual("$string:mainability_description");
            expect(data.icon).assertEqual("$media:icon");
            expect(data.isVisible).assertEqual(true);
            expect(data.deviceTypes.length).assertEqual(0);
            expect(data.process).assertEqual("com.example.third1");
            expect(data.uri).assertEqual("");
            expect(data.moduleName).assertEqual("entry");
            expect(data.type).assertEqual(1);
            expect(data.orientation).assertEqual(0);
            expect(data.launchMode).assertEqual(1);
            expect(data.backgroundModes).assertEqual(0);
            expect(data.descriptionId).assertLarger(0);
            expect(data.formEnabled).assertEqual(false);
            expect(data.iconId).assertLarger(0);
            expect(data.labelId).assertLarger(0);
            expect(data.subType).assertEqual(0);
            expect(data.enabled).assertEqual(true);
            expect(data.readPermission).assertEqual("");
            expect(data.writePermission).assertEqual("");
            expect(data.targetAbility).assertEqual("");
            expect(data.metaData.length).assertEqual(0);
            checkApplicationInfo_other(data.applicationInfo);
            console.log("---checkAbilityInfo_other End---  ");
        }

        async function checkApplicationInfo_other(info) {
            expect(info.name).assertEqual("com.example.third1");
            expect(info.codePath).assertEqual("/data/app/el1/bundle/public/com.example.third1");
            expect(info.accessTokenId > 0).assertTrue();
            expect(info.description).assertEqual("$string:entry_description");
            expect(info.descriptionId > 0).assertTrue();
            expect(info.icon).assertEqual("$media:icon");
            expect(info.iconId > 0).assertTrue();
            expect(info.label).assertEqual("$string:app_name");
            expect(info.labelId > 0).assertTrue();
            expect(info.systemApp).assertEqual(false);
            expect(info.entryDir).assertEqual("");
            expect(info.supportedModes).assertEqual(0);
            expect(info.process).assertEqual("com.example.third1");
            expect(info.moduleSourceDirs.length).assertEqual(0);
            expect(JSON.stringify(info.metaData)).assertEqual("{}");
            expect(info.enabled).assertEqual(true);
            expect(info.uid).assertLarger(0);
            expect(info.entityType).assertEqual("unspecified");
            expect(info.removable).assertEqual(true);
        }
    });
}