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

import app from '@system.app'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import demo from '@ohos.bundle'
import account from '@ohos.account.osAccount'

const ERROR = "error.hap"
const NAME1 = "com.example.myapplication1"
const NAME2 = "com.example.myapplication2"
const NAME3 = "com.example.myapplication4"
const NAME4 = "com.example.myapplication5"
const NAME5 = "com.example.myapplication6"
const VERSIONCODE1 = 1
const OBJECT = "object"
const DIR1 = "/data/app/el1/bundle/public/com.example.myapplication1/com.example.myapplication1"
const DIR2 = "/data/app/el1/bundle/public/com.example.myapplication2/com.example.myapplication2"
const DIR3 = "/data/app/el1/bundle/public/com.example.myapplication2/com.example.myapplication1"
const DESCRIPTION = "$string:mainability_description"
const APPLICATION_DESCRIPTION = "$string:entry_description"
const FLAGONE = "1"
const FLAGTWO = "2"
let userId = 0;

export default function ActsBundleManagerTest() {
describe('ActsBundleManagerTest', function () {

    beforeAll(async function (done) {
        await account.getAccountManager().getOsAccountLocalIdFromProcess().then(account => {
            console.info("getOsAccountLocalIdFromProcess userid  ==========" + account);
            userId = account;
            done();
        }).catch(err => {
            console.info("getOsAccountLocalIdFromProcess err ==========" + JSON.stringify(err));
            done();
        })
    });

    /**
     * @tc.number Sub_Bms_Framework_Query_AppInfo_1960
     * @tc.name testGetBundleInfoReqPermissionPromise
     * @tc.desc Test getBundleInfo interfaces with one hap.(by promise)
     */
    it('testGetBundleInfoReqPermissionPromise', 0, async function (done) {
        let datainfo = await demo.getBundleInfo(NAME1,
            demo.BundleFlag.GET_BUNDLE_WITH_ABILITIES | demo.BundleFlag.GET_BUNDLE_WITH_REQUESTED_PERMISSION);
        expect(datainfo.name).assertEqual(NAME1);
        expect(datainfo.vendor).assertEqual("example");
        expect(datainfo.versionCode).assertEqual(VERSIONCODE1);
        expect(datainfo.versionName).assertEqual("1.0");
        expect(datainfo.entryModuleName).assertEqual("entry");
        expect(datainfo.compatibleVersion).assertEqual(12);
        expect(datainfo.targetVersion).assertEqual(12);
        expect(datainfo.uid).assertLarger(0);
        expect(datainfo.appId).assertContain(NAME1);
        expect(datainfo.type).assertEqual("");
        expect(datainfo.cpuAbi).assertEqual("");
        expect(datainfo.appInfo.name).assertEqual(NAME1);
        expect(datainfo.appInfo.description).assertEqual(APPLICATION_DESCRIPTION);
        expect(datainfo.appInfo.descriptionId >= 0).assertTrue();
        expect(datainfo.appInfo.icon).assertEqual("$media:icon");
        expect(datainfo.appInfo.iconId >= 0).assertTrue();
        expect(datainfo.appInfo.label).assertEqual("$string:app_name");
        expect(datainfo.appInfo.labelId >= 0).assertTrue();
        expect(datainfo.appInfo.systemApp).assertEqual(false);
        expect(datainfo.appInfo.supportedModes).assertEqual(0);
        expect(datainfo.installTime).assertLarger(0);
        expect(datainfo.updateTime).assertLarger(0);
        expect(datainfo.reqPermissions[0]).assertEqual("com.permission.PERMISSION_A");
        expect(datainfo.reqPermissionDetails[0].name).assertEqual("com.permission.PERMISSION_A");
        expect(datainfo.reqPermissionDetails[0].reason).assertEqual("Need PERMISSION_A");
        expect(datainfo.reqPermissionDetails[0].usedScene.abilities[0]).assertEqual(NAME1 + ".MainAbility");
        expect(datainfo.reqPermissionDetails[0].usedScene.when).assertEqual("always");
        expect(datainfo.compatibleVersion).assertEqual(12);
        expect(datainfo.targetVersion).assertEqual(12);
        expect(datainfo.isCompressNativeLibs).assertEqual(true);
        for (let s = 0; s < datainfo.hapModuleInfos.length; s++) {
            expect(datainfo.hapModuleInfos[s].name).assertEqual("com.example.myapplication1.MyApplication1");
            expect(datainfo.hapModuleInfos[s].moduleName).assertEqual("entry");
        }
        expect(datainfo.entryModuleName).assertEqual("entry");
        expect(datainfo.isSilentInstallation.length).assertEqual(0);
        expect(datainfo.minCompatibleVersionCode).assertEqual(1);
        expect(datainfo.entryInstallationFree).assertEqual(false);
        for (let j = 0; j < datainfo.appInfo.moduleInfos.length; j++) {
            expect(datainfo.appInfo.moduleInfos[j].moduleName).assertEqual("entry");
            expect(datainfo.appInfo.moduleInfos[j].moduleSourceDir).assertEqual('');
        }
        expect(datainfo.appInfo.enabled).assertEqual(true);
        done();
    })

    /**
     * @tc.number Sub_Bms_Framework_Query_AppInfo_2060
     * @tc.name testGetBundeInfoReqPermissionCallback
     * @tc.desc Test getBundleInfo interfaces with one hap.(by callback)
     */
    it('testGetBundeInfoReqPermissionCallback', 0, async function (done) {
        await demo.getBundleInfo(NAME1,
            demo.BundleFlag.GET_BUNDLE_WITH_ABILITIES | demo.BundleFlag.GET_BUNDLE_WITH_REQUESTED_PERMISSION,
            OnReceiveEvent);
        function OnReceiveEvent(err, datainfo) {
            checkBundleInfo0200(datainfo)
            done();
        }
    })

    function checkBundleInfo0200(datainfo) {
        console.info("testGetBundeInfoReqPermissionCallback dataInfo ====" + datainfo);
        expect(datainfo.name).assertEqual(NAME1);
        expect(datainfo.vendor).assertEqual("example");
        expect(datainfo.versionCode).assertEqual(VERSIONCODE1);
        expect(datainfo.versionName).assertEqual("1.0");
        expect(datainfo.entryModuleName).assertEqual("entry");
        expect(datainfo.compatibleVersion).assertEqual(12);
        expect(datainfo.targetVersion).assertEqual(12);
        expect(datainfo.uid).assertLarger(0);
        expect(datainfo.appId).assertContain(NAME1);
        expect(datainfo.type).assertEqual("");
        expect(datainfo.cpuAbi).assertEqual("");
        expect(datainfo.appInfo.name).assertEqual(NAME1);
        expect(datainfo.appInfo.description).assertEqual(APPLICATION_DESCRIPTION);
        expect(datainfo.appInfo.descriptionId >= 0).assertTrue();
        expect(datainfo.appInfo.icon).assertEqual("$media:icon");
        expect(datainfo.appInfo.iconId >= 0).assertTrue();
        expect(datainfo.appInfo.label).assertEqual("$string:app_name");
        expect(datainfo.appInfo.labelId >= 0).assertTrue();
        expect(datainfo.appInfo.systemApp).assertEqual(false);
        expect(datainfo.appInfo.supportedModes).assertEqual(0);
        expect(datainfo.installTime).assertLarger(0);
        expect(datainfo.updateTime).assertLarger(0);
        expect(datainfo.reqPermissions[0]).assertEqual("com.permission.PERMISSION_A");
        expect(datainfo.reqPermissionDetails[0].name).assertEqual("com.permission.PERMISSION_A");
        expect(datainfo.reqPermissionDetails[0].reason).assertEqual("Need PERMISSION_A");
        expect(datainfo.reqPermissionDetails[0].usedScene.abilities[0]).assertEqual(NAME1 + ".MainAbility");
        expect(datainfo.reqPermissionDetails[0].usedScene.when).assertEqual("always");
        expect(datainfo.compatibleVersion).assertEqual(12);
        expect(datainfo.targetVersion).assertEqual(12);
        expect(datainfo.isCompressNativeLibs).assertEqual(true);
        for (let s = 0; s < datainfo.hapModuleInfos.length; s++) {
            expect(datainfo.hapModuleInfos[s].name).assertEqual("com.example.myapplication1.MyApplication1");
            expect(datainfo.hapModuleInfos[s].moduleName).assertEqual("entry");
        }
        expect(datainfo.entryModuleName).assertEqual("entry");
        expect(datainfo.isSilentInstallation.length).assertEqual(0);
        expect(datainfo.minCompatibleVersionCode).assertEqual(1);
        expect(datainfo.entryInstallationFree).assertEqual(false);
        for (let j = 0; j < datainfo.appInfo.moduleInfos.length; j++) {
            expect(datainfo.appInfo.moduleInfos[j].moduleName).assertEqual("entry");
            expect(datainfo.appInfo.moduleInfos[j].moduleSourceDir).assertEqual('');
        }
        expect(datainfo.appInfo.enabled).assertEqual(true);
    }

    /**
     * @tc.number Sub_Bms_Framework_Query_AppInfo_1980
     * @tc.name testGetBundleInfoMultiHapPromise
     * @tc.desc Test getBundleInfo interfaces with two haps.(by promise)
     */
    it('testGetBundleInfoMultiHapPromise', 0, async function (done) {
        let datainfo = await demo.getBundleInfo(NAME2, demo.BundleFlag.GET_BUNDLE_WITH_ABILITIES);
        console.info("testGetBundleInfoMultiHapPromise dataInfo ====" + datainfo);
        expect(datainfo.name).assertEqual(NAME2);
        expect(datainfo.vendor).assertEqual("example");
        expect(datainfo.versionCode).assertEqual(1);
        expect(datainfo.versionName).assertLarger(0);
        expect(datainfo.entryModuleName).assertEqual("entry");
        expect(datainfo.appInfo.name).assertEqual(NAME2);
        expect(datainfo.appInfo.description).assertEqual(APPLICATION_DESCRIPTION);
        expect(datainfo.appInfo.descriptionId >= 0).assertTrue();
        expect(datainfo.appInfo.icon).assertEqual("$media:icon");
        expect(datainfo.appInfo.iconId >= 0).assertTrue();
        expect(datainfo.appInfo.label).assertEqual("$string:app_name");
        expect(datainfo.appInfo.labelId >= 0).assertTrue();
        expect(datainfo.appInfo.systemApp).assertEqual(false);
        done();
    })

    /**
     * @tc.number Sub_Bms_Framework_Query_AppInfo_2080
     * @tc.name testGetBundleInfoMultiHapCallback
     * @tc.desc Test getBundleInfo interfaces with two haps.(by callback)
     */
    it('testGetBundleInfoMultiHapCallback', 0, async function (done) {
        await demo.getBundleInfo(NAME2, demo.BundleFlag.GET_BUNDLE_WITH_ABILITIES, OnReceiveEvent);
        function OnReceiveEvent(err, datainfo) {
            console.info("testGetBundleInfoMultiHapCallback dataInfo ====" + datainfo);
            expect(datainfo.name).assertEqual(NAME2);
            expect(datainfo.vendor).assertEqual("example");
            expect(datainfo.versionCode).assertEqual(1);
            expect(datainfo.versionName).assertLarger(0);
            expect(datainfo.entryModuleName).assertEqual("entry");
            expect(datainfo.appInfo.name).assertEqual(NAME2);
            expect(datainfo.appInfo.description).assertEqual(APPLICATION_DESCRIPTION);
            expect(datainfo.appInfo.descriptionId >= 0).assertTrue();
            expect(datainfo.appInfo.icon).assertEqual("$media:icon");
            expect(datainfo.appInfo.iconId >= 0).assertTrue();
            expect(datainfo.appInfo.label).assertEqual("$string:app_name");
            expect(datainfo.appInfo.labelId >= 0).assertTrue();
            expect(datainfo.appInfo.systemApp).assertEqual(false);
            done();
        }
    })

    /**
      * @tc.number Sub_Bms_Framework_Query_AppInfo_2000
      * @tc.name testGetBundleInfoPromise
      * @tc.desc Test getBundleInfo interfaces with one hap. (by promise)
      */
    it('testGetBundleInfoPromise', 0, async function (done) {
        let datainfo = await demo.getBundleInfo(NAME1, demo.BundleFlag.GET_BUNDLE_WITH_ABILITIES);
        console.info("testGetBundleInfoPromise dataInfo ====" + datainfo);
        expect(datainfo.name).assertEqual(NAME1);
        expect(datainfo.vendor).assertEqual("example");
        expect(datainfo.versionCode).assertEqual(VERSIONCODE1);
        expect(datainfo.versionName).assertEqual("1.0");
        expect(datainfo.type).assertEqual("");
        expect(datainfo.cpuAbi).assertEqual("");
        expect(datainfo.compatibleVersion).assertEqual(12);
        expect(datainfo.targetVersion).assertEqual(12);
        expect(datainfo.installTime).assertLarger(0);
        expect(datainfo.updateTime).assertLarger(0);
        expect(datainfo.uid).assertLarger(0);
        expect(datainfo.entryModuleName).assertEqual("entry");
        expect(datainfo.minCompatibleVersionCode).assertEqual(1);
        expect(datainfo.entryInstallationFree).assertEqual(false);
        expect(datainfo.reqPermissions.length).assertEqual(0);
        expect(datainfo.reqPermissionStates.length).assertEqual(0);
        expect(datainfo.reqPermissionDetails.length).assertEqual(0);
        expect(datainfo.appInfo.name).assertEqual(NAME1);
        expect(datainfo.appInfo.description).assertEqual(APPLICATION_DESCRIPTION);
        expect(datainfo.appInfo.descriptionId >= 0).assertTrue();
        expect(datainfo.appInfo.icon).assertEqual("$media:icon");
        expect(datainfo.appInfo.iconId >= 0).assertTrue();
        expect(datainfo.appInfo.label).assertEqual("$string:app_name");
        expect(datainfo.appInfo.labelId >= 0).assertTrue();
        expect(datainfo.appInfo.systemApp).assertEqual(false);
        expect(datainfo.appInfo.supportedModes).assertEqual(0);
        for (let j = 0; j < datainfo.appInfo.moduleInfos.length; j++) {
            expect(datainfo.appInfo.moduleInfos[j].moduleName).assertEqual("entry");
            expect(datainfo.appInfo.moduleInfos[j].moduleSourceDir).assertEqual('');
        }
        expect(datainfo.appInfo.enabled).assertEqual(true);
        done();
    })

    /**
     * @tc.number Sub_Bms_Framework_Query_AppInfo_2100
     * @tc.name testGetBundleInfoCallback
     * @tc.desc Test getBundleInfo interfaces with one hap. (by callback)
     */
    it('testGetBundleInfoCallback', 0, async function (done) {
        await demo.getBundleInfo(NAME1, demo.BundleFlag.GET_BUNDLE_WITH_ABILITIES |
            demo.BundleFlag.GET_ABILITY_INFO_WITH_DISABLE, OnReceiveEvent);
        function OnReceiveEvent(err, datainfo) {
            console.info("testGetBundleInfoCallback dataInfo ====" + datainfo);
            expect(datainfo.name).assertEqual(NAME1);
            expect(datainfo.vendor).assertEqual("example");
            expect(datainfo.versionCode).assertEqual(VERSIONCODE1);
            expect(datainfo.versionName).assertEqual("1.0");
            expect(datainfo.type).assertEqual("");
            expect(datainfo.cpuAbi).assertEqual("");
            expect(datainfo.compatibleVersion).assertEqual(12);
            expect(datainfo.targetVersion).assertEqual(12);
            expect(datainfo.installTime).assertLarger(0);
            expect(datainfo.updateTime).assertLarger(0);
            expect(datainfo.uid).assertLarger(0);
            expect(datainfo.entryModuleName).assertEqual("entry");
            expect(datainfo.minCompatibleVersionCode).assertEqual(1);
            expect(datainfo.entryInstallationFree).assertEqual(false);
            expect(datainfo.reqPermissions.length).assertEqual(0);
            expect(datainfo.reqPermissionStates.length).assertEqual(0);
            expect(datainfo.reqPermissionDetails.length).assertEqual(0);
            expect(datainfo.appInfo.name).assertEqual(NAME1);
            expect(datainfo.appInfo.description).assertEqual(APPLICATION_DESCRIPTION);
            expect(datainfo.appInfo.descriptionId >= 0).assertTrue();
            expect(datainfo.appInfo.icon).assertEqual("$media:icon");
            expect(datainfo.appInfo.iconId >= 0).assertTrue();
            expect(datainfo.appInfo.label).assertEqual("$string:app_name");
            expect(datainfo.appInfo.labelId >= 0).assertTrue();
            expect(datainfo.appInfo.systemApp).assertEqual(false);
            expect(datainfo.appInfo.supportedModes).assertEqual(0);
            for (let j = 0; j < datainfo.appInfo.moduleInfos.length; j++) {
                expect(datainfo.appInfo.moduleInfos[j].moduleName).assertEqual("entry");
                expect(datainfo.appInfo.moduleInfos[j].moduleSourceDir).assertEqual('');
            }
            expect(datainfo.appInfo.enabled).assertEqual(true);
            done();
        }
    })

    /**
    * @tc.number Sub_Bms_Framework_Query_AppInfo_2020
    * @tc.name testGetBundleInfoNotExistPromise
    * @tc.desc Test getBundleInfo interfaces with error hap. (by promise)
    */
    it('testGetBundleInfoNotExistPromise', 0, async function (done) {
        await demo.getBundleInfo('error', demo.BundleFlag.GET_BUNDLE_WITH_ABILITIES).then(datainfo => {
            console.info("testGetBundleInfoNotExistPromise success:" + JSON.stringify(datainfo));
            expect(datainfo).assertFail();
            done();
        }).catch(err => {
            console.info("testGetBundleInfoNotExistPromise err:" + JSON.stringify(err));
            expect(err).assertEqual(1);
            done();
        });
    })

    /**
    * @tc.number Sub_Bms_Framework_Query_AppInfo_2120
    * @tc.name testGetBundleInfoNotExistCallback
    * @tc.desc Test getBundleInfo interfaces with error hap. (by callback)
    */
    it('testGetBundleInfoNotExistCallback', 0, async function (done) {
        await demo.getBundleInfo('error', demo.BundleFlag.GET_BUNDLE_WITH_ABILITIES, OnReceiveEvent);
        function OnReceiveEvent(err, datainfo) {
            if (err) {
                console.info("testGetBundleInfoNotExistCallback err" + JSON.stringify(err));
                expect(err).assertEqual(1);
                done();
                return;
            }
            console.info("testGetBundleInfoNotExistCallback success" + JSON.stringify(datainfo));
            expect(datainfo).assertFail();
            done();
        }
    })

    /**
   * @tc.number Sub_Bms_Framework_Query_AppInfo_2040
   * @tc.name testGetBundleInfoInvalidParamPromise
   * @tc.desc Test getBundleInfo interfaces with none hap. (by promise)
   */
    it('testGetBundleInfoInvalidParamPromise', 0, async function (done) {
        await demo.getBundleInfo(' ', demo.BundleFlag.GET_BUNDLE_WITH_ABILITIES).then(datainfo => {
            console.info("testGetBundleInfoInvalidParamPromise success" + JSON.stringify(datainfo));
            expect(datainfo).assertFail();
            done();
        }).catch(err => {
            console.info("testGetBundleInfoInvalidParamPromise fail" + JSON.stringify(err));
            expect(err).assertEqual(1);
            done();
        });
    })

    /**
     * @tc.number Sub_Bms_Framework_Query_AppInfo_2140
     * @tc.name testGetBundleInfoInvalidParamCallback
     * @tc.desc Test getBundleInfo interfaces with none hap. (by callback)
     */
    it('testGetBundleInfoInvalidParamCallback', 0, async function (done) {
        await demo.getBundleInfo(' ', demo.BundleFlag.GET_BUNDLE_WITH_ABILITIES, OnReceiveEvent);
        function OnReceiveEvent(err, datainfo) {
            if (err) {
                console.info("testGetBundleInfoInvalidParamCallback err" + JSON.stringify(err));
                expect(err).assertEqual(1);
                done();
                return;
            }
            console.info("testGetBundleInfoInvalidParamCallback success" + JSON.stringify(datainfo));
            expect(datainfo).assertFail();
            done();
        }
    })

    /**
     * @tc.number Sub_Bms_Framework_Query_AppInfo_2160
     * @tc.name testGetBundleInfoDifferentParamPromise
     * @tc.desc Test getBundleInfo interfaces with one hap and different param. (by promise)
     */
    it('testGetBundleInfoDifferentParamPromise', 0, async function (done) {
        let datainfo = await demo.getBundleInfo(NAME1, demo.BundleFlag.GET_BUNDLE_DEFAULT)
        console.info("testGetBundleInfoDifferentParamPromise dataInfo ====" + datainfo);
        expect(datainfo.name).assertEqual(NAME1);
        expect(datainfo.vendor).assertEqual("example");
        expect(datainfo.versionCode).assertEqual(VERSIONCODE1);
        expect(datainfo.versionName).assertLarger(0);
        expect(datainfo.entryModuleName).assertEqual("entry");
        expect(datainfo.appInfo.name).assertEqual(NAME1);
        expect(datainfo.appInfo.description).assertEqual(APPLICATION_DESCRIPTION);
        expect(datainfo.appInfo.descriptionId >= 0).assertTrue();
        expect(datainfo.appInfo.icon).assertEqual("$media:icon");
        expect(datainfo.appInfo.iconId >= 0).assertTrue();
        expect(datainfo.appInfo.label).assertEqual("$string:app_name");
        expect(datainfo.appInfo.labelId >= 0).assertTrue();
        expect(datainfo.appInfo.systemApp).assertEqual(false);
        expect(datainfo.appInfo.supportedModes).assertEqual(0);
        expect(datainfo.appInfo.enabled).assertEqual(true);
        done();
    })

    /**
     * @tc.number Sub_Bms_Framework_Query_AppInfo_2180
     * @tc.name testGetBundleInfoDifferentParamCallback
     * @tc.desc Test getBundleInfo interfaces with one hap and different param. (by callback)
     */
    it('testGetBundleInfoDifferentParamCallback', 0, async function (done) {
        await demo.getBundleInfo(NAME1, demo.BundleFlag.GET_BUNDLE_DEFAULT, OnReceiveEvent)
        function OnReceiveEvent(err, datainfo) {
            console.info("testGetBundleInfoDifferentParamCallback dataInfo ====" + datainfo);
            expect(datainfo.name).assertEqual(NAME1);
            expect(datainfo.vendor).assertEqual("example");
            expect(datainfo.versionCode).assertEqual(VERSIONCODE1);
            expect(datainfo.versionName).assertLarger(0);
            expect(datainfo.entryModuleName).assertEqual("entry");
            expect(datainfo.appInfo.name).assertEqual(NAME1);
            expect(datainfo.appInfo.description).assertEqual(APPLICATION_DESCRIPTION);
            expect(datainfo.appInfo.descriptionId >= 0).assertTrue();
            expect(datainfo.appInfo.icon).assertEqual("$media:icon");
            expect(datainfo.appInfo.iconId >= 0).assertTrue();
            expect(datainfo.appInfo.label).assertEqual("$string:app_name");
            expect(datainfo.appInfo.labelId >= 0).assertTrue();
            expect(datainfo.appInfo.systemApp).assertEqual(false);
            expect(datainfo.appInfo.supportedModes).assertEqual(0);
            for (let j = 0; j < datainfo.appInfo.moduleInfos.length; j++) {
                expect(datainfo.appInfo.moduleInfos[j].moduleName).assertEqual("entry");
                expect(datainfo.appInfo.moduleInfos[j].moduleSourceDir).assertEqual('');
            }
            expect(datainfo.appInfo.enabled).assertEqual(true);
            done();
        }
    })

    /**
     * @tc.number Sub_Bms_Framework_Query_AppInfo_2200
     * @tc.name testGetBundleInfoSystemAppCallback
     * @tc.desc Test getBundleInfo interfaces with systemApp.(by callback)
     */
    it('testGetBundleInfoSystemAppCallback', 0, async function (done) {
        let bundleOptions = {
            userId: userId
        };
        demo.getBundleInfo(NAME1, demo.BundleFlag.GET_BUNDLE_WITH_ABILITIES,
            bundleOptions, (err, datainfo) => {
                if (err) {
                    console.info("testGetBundleInfoSystemAppCallback fail:" + JSON.stringify(err));
                    expect(err).assertFail();
                    done();
                    return;
                }
                console.info("testGetBundleInfoSystemAppCallback success:" + JSON.stringify(datainfo));
                expect(datainfo.name).assertEqual(NAME1);
                expect(datainfo.vendor).assertEqual("example");
                expect(datainfo.versionCode).assertEqual(1);
                expect(datainfo.versionName.length).assertLarger(0);
                expect(datainfo.uid).assertLarger(2099);
                expect(datainfo.appInfo.name).assertEqual(NAME1);
                expect(datainfo.appInfo.systemApp).assertEqual(false);
                expect(datainfo.appInfo.supportedModes).assertEqual(0);
                expect(datainfo.appInfo.moduleInfos.length).assertLarger(0);
                expect(datainfo.appInfo.enabled).assertEqual(true);
                done();
            })
    })

    /**
     * @tc.number Sub_Bms_Framework_Query_AppInfo_2220
     * @tc.name testGetBundleInfoCurrentUserIdPromise
     * @tc.desc Test getBundleInfo interface with current userId (by promise).
     */
    it('testGetBundleInfoCurrentUserIdPromise', 0, async function (done) {
        let bundleOptions = {
            userId: userId
        };
        let dataInfo = await demo.getBundleInfo(NAME1, demo.BundleFlag.GET_BUNDLE_WITH_ABILITIES, bundleOptions);
        console.info("testGetBundleInfoCurrentUserIdPromise start --------");
        console.info("testGetBundleInfoCurrentUserIdPromise dataInfo ====" + dataInfo);
        expect(dataInfo.name).assertEqual(NAME1);
        expect(dataInfo.vendor).assertEqual("example");
        expect(dataInfo.versionCode).assertEqual(VERSIONCODE1);
        expect(dataInfo.versionName).assertLarger(0);
        expect(dataInfo.entryModuleName).assertEqual("entry");
        expect(dataInfo.appInfo.name).assertEqual(NAME1);
        expect(dataInfo.appInfo.description).assertEqual(APPLICATION_DESCRIPTION);
        expect(dataInfo.appInfo.descriptionId >= 0).assertTrue();
        expect(dataInfo.appInfo.icon).assertEqual("$media:icon");
        expect(dataInfo.appInfo.iconId >= 0).assertTrue();
        expect(dataInfo.appInfo.label).assertEqual("$string:app_name");
        expect(dataInfo.appInfo.labelId >= 0).assertTrue();
        expect(dataInfo.appInfo.systemApp).assertEqual(false);
        expect(dataInfo.appInfo.supportedModes).assertEqual(0);
        expect(dataInfo.updateTime).assertLarger(0);
        expect(dataInfo.reqPermissions.length).assertEqual(0);
        expect(dataInfo.reqPermissionDetails.length).assertEqual(0);
        expect(dataInfo.compatibleVersion).assertEqual(12);
        expect(dataInfo.targetVersion).assertEqual(12);
        expect(dataInfo.isCompressNativeLibs).assertEqual(true);
        for (let s = 0; s < dataInfo.hapModuleInfos.length; s++) {
            expect(dataInfo.hapModuleInfos[s].name).assertEqual("com.example.myapplication1.MyApplication1");
            expect(dataInfo.hapModuleInfos[s].moduleName).assertEqual("entry");
        }
        expect(dataInfo.entryModuleName).assertEqual("entry");
        expect(dataInfo.isSilentInstallation.length).assertEqual(0);
        expect(dataInfo.minCompatibleVersionCode).assertEqual(1);
        expect(dataInfo.entryInstallationFree).assertEqual(false);
        for (let j = 0; j < dataInfo.appInfo.moduleInfos.length; j++) {
            expect(dataInfo.appInfo.moduleInfos[j].moduleName).assertEqual("entry");
            expect(dataInfo.appInfo.moduleInfos[j].moduleSourceDir).assertEqual('');
        }
        expect(dataInfo.appInfo.enabled).assertEqual(true);
        console.info("testGetBundleInfoCurrentUserIdPromise end  --------");
        done();
    })

    /**
     * @tc.number Sub_Bms_Framework_Query_AppInfo_2240
     * @tc.name testGetBundleInfoCurrentUserIdCallback
     * @tc.desc Test getBundleInfo interface with current userId (by callback).
     */
    it('testGetBundleInfoCurrentUserIdCallback', 0, async function (done) {
        let bundleOptions = {
            userId: userId
        };
        demo.getBundleInfo(NAME1, demo.BundleFlag.GET_BUNDLE_WITH_ABILITIES, bundleOptions, (err, dataInfo) => {
            console.info("testGetBundleInfoCurrentUserIdCallback start --------");
            console.info("testGetBundleInfoCurrentUserIdCallback dataInfo ====" + dataInfo);
            expect(dataInfo.name).assertEqual(NAME1);
            expect(dataInfo.vendor).assertEqual("example");
            expect(dataInfo.versionCode).assertEqual(VERSIONCODE1);
            expect(dataInfo.versionName).assertLarger(0);
            expect(dataInfo.entryModuleName).assertEqual("entry");
            expect(dataInfo.appInfo.name).assertEqual(NAME1);
            expect(dataInfo.appInfo.description).assertEqual(APPLICATION_DESCRIPTION);
            expect(dataInfo.appInfo.descriptionId >= 0).assertTrue();
            expect(dataInfo.appInfo.icon).assertEqual("$media:icon");
            expect(dataInfo.appInfo.iconId >= 0).assertTrue();
            expect(dataInfo.appInfo.label).assertEqual("$string:app_name");
            expect(dataInfo.appInfo.labelId >= 0).assertTrue();
            expect(dataInfo.appInfo.systemApp).assertEqual(false);
            expect(dataInfo.appInfo.supportedModes).assertEqual(0);
            expect(dataInfo.updateTime).assertLarger(0);
            expect(dataInfo.reqPermissions.length).assertEqual(0);
            expect(dataInfo.reqPermissionDetails.length).assertEqual(0);
            expect(dataInfo.compatibleVersion).assertEqual(12);
            expect(dataInfo.targetVersion).assertEqual(12);
            expect(dataInfo.isCompressNativeLibs).assertEqual(true);
            for (let s = 0; s < dataInfo.hapModuleInfos.length; s++) {
                expect(dataInfo.hapModuleInfos[s].name).assertEqual("com.example.myapplication1.MyApplication1");
                expect(dataInfo.hapModuleInfos[s].moduleName).assertEqual("entry");
            }
            expect(dataInfo.entryModuleName).assertEqual("entry");
            expect(dataInfo.isSilentInstallation.length).assertEqual(0);
            expect(dataInfo.minCompatibleVersionCode).assertEqual(1);
            expect(dataInfo.entryInstallationFree).assertEqual(false);
            for (let j = 0; j < dataInfo.appInfo.moduleInfos.length; j++) {
                expect(dataInfo.appInfo.moduleInfos[j].moduleName).assertEqual("entry");
                expect(dataInfo.appInfo.moduleInfos[j].moduleSourceDir).assertEqual('');
            }
            console.info("testGetBundleInfoCurrentUserIdCallback end  --------");
            done();
        });
    })

    /**
     * @tc.number Sub_Bms_Framework_Query_AppInfo_2360
     * @tc.name testGetBundleInfoOtherUserIdPromise
     * @tc.desc Test getBundleInfo interface with other userId (by promise).
     */
    it('testGetBundleInfoOtherUserIdPromise', 0, async function (done) {
        await demo.getBundleInfo(NAME1, demo.BundleFlag.GET_BUNDLE_WITH_ABILITIES, {
            userId: 1
        }).then(data => {
            console.info("testGetBundleInfoOtherUserIdPromise success" + JSON.stringify(data));
            expect(data).assertFail();
            done();
        }).catch(err => {
            console.info("testGetBundleInfoOtherUserIdPromise err" + JSON.stringify(err));
            expect(err).assertEqual(1);
            done();
        });
    })

    /**
     * @tc.number Sub_Bms_Framework_Query_AppInfo_2380
     * @tc.name testGetBundleInfoOtherUserIdCallback
     * @tc.desc Test getBundleInfo interface with other userId (by callback).
     */
    it('testGetBundleInfoOtherUserIdCallback', 0, async function (done) {
        await demo.getBundleInfo(NAME1, demo.BundleFlag.GET_BUNDLE_WITH_ABILITIES, {
            userId: 1
        }, (err, dataInfo) => {
            if (err) {
                console.info("testGetBundleInfoOtherUserIdCallback err" + JSON.stringify(err));
                expect(err).assertEqual(1);
                done();
                return;
            }
            console.info("testGetBundleInfoOtherUserIdCallback success" + JSON.stringify(dataInfo));
            expect(dataInfo).assertFail();
            done();
        });
    })

    /**
     * @tc.number Sub_Bms_Framework_Query_AppInfo_0840
     * @tc.name testGetAllApplicationInfoPromise
     * @tc.desc Test getApplicationInfos interfaces with one hap.
     */
    it('testGetAllApplicationInfoPromise', 0, async function (done) {
        let datainfo = await demo.getAllApplicationInfo(demo.BundleFlag.GET_APPLICATION_INFO_WITH_PERMISSION, userId);
        checkgetApplicationInfos(datainfo);
        done();
    })

    function checkgetApplicationInfos(datainfo) {
        console.log("=============datainfo.length===============" + datainfo.length);
        expect(datainfo.length).assertLarger(0);
        for (let i = 0; i < datainfo.length; i++) {
            expect(datainfo[i].name.length).assertLarger(0);
            if (datainfo[i].name == NAME1 || datainfo[i].name == NAME2
                || datainfo[i].name == NAME3 || datainfo[i].name == NAME4 || datainfo[i].name == NAME5) {
                expect(datainfo[i].description.length >= 0).assertTrue();
                expect(datainfo[i].icon.length).assertLarger(0);
                expect(datainfo[i].label.length).assertLarger(0);
            }
            expect(datainfo[i].moduleSourceDirs.length).assertEqual(0);
            expect(datainfo[i].moduleInfos.length).assertLarger(0);
            expect(datainfo[i].supportedModes).assertEqual(0);
            for (let j = 0; j < datainfo[i].moduleInfos.length; j++) {
                expect(datainfo[i].moduleInfos[j].moduleName.length).assertLarger(0);
                expect(datainfo[i].moduleInfos[j].moduleSourceDir.length).assertEqual(0);
            }
        }

    }

    /**
     * @tc.number Sub_Bms_Framework_Query_AppInfo_0940
     * @tc.name testGetAllApplicationInfoCallback
     * @tc.desc Test getApplicationInfos interfaces with one hap.
     */
    it('testGetAllApplicationInfoCallback', 0, async function (done) {
        await demo.getAllApplicationInfo(demo.BundleFlag.GET_APPLICATION_INFO_WITH_PERMISSION,
            userId, (error, datainfo) => {
                expect(datainfo.length).assertLarger(0);
                for (let i = 0; i < datainfo.length; i++) {
                    expect(datainfo[i].name.length).assertLarger(0);
                    expect(datainfo[i].moduleSourceDirs.length).assertEqual(0);
                    expect(datainfo[i].moduleInfos.length).assertLarger(0);
                    expect(datainfo[i].supportedModes).assertEqual(0);
                    for (let j = 0; j < datainfo[i].moduleInfos.length; j++) {
                        expect(datainfo[i].moduleInfos[j].moduleName.length).assertLarger(0);
                        expect(datainfo[i].moduleInfos[j].moduleSourceDir.length).assertEqual(0);
                    }
                }
                done();
            });
    })

    /**
     * @tc.number Sub_Bms_Framework_Query_AppInfo_2460
     * @tc.name testGetAllBundleInfoPromise
     * @tc.desc Test getBundleInfos interfaces with one hap.
     */
    it('testGetAllBundleInfoPromise', 0, async function (done) {
        let data = await demo.getAllBundleInfo(demo.BundleFlag.GET_BUNDLE_DEFAULT);
        expect(typeof data).assertEqual(OBJECT);
        expect(data.length).assertLarger(0);
        for (let i = 0; i < data.length; i++) {
            expect(data[i].name.length).assertLarger(0);
            expect(data[i].appInfo.name.length).assertLarger(0);
            if (data[i].name == NAME1 || data[i].name == NAME2
                || data[i].name == NAME3 || data[i].name == NAME4 || data[i].name == NAME5) {
                expect(data[i].appInfo.description.length >= 0).assertTrue();
                expect(data[i].appInfo.icon.length).assertLarger(0);
                expect(data[i].appInfo.label.length).assertLarger(0);
            }
            if (data[i].appInfo.codePath != FLAGONE && data[i].appInfo.codePath != FLAGTWO) {
                expect(data[i].appInfo.supportedModes).assertEqual(0);
                expect(data[i].appInfo.moduleInfos.length).assertLarger(0);
            }
        }
        done();
    })

    /**
     * @tc.number Sub_Bms_Framework_Query_AppInfo_0220
     * @tc.name testGetApplicationInfoMetaDataPromise
     * @tc.desc Test getApplicationInfo interfaces with one hap. (by promise)
     */
    it('testGetApplicationInfoMetaDataPromise', 0, async function (done) {
        await demo.getApplicationInfo(NAME1,
            demo.BundleFlag.GET_APPLICATION_INFO_WITH_PERMISSION | demo.BundleFlag.GET_APPLICATION_INFO_WITH_METADATA,
            userId).then(datainfo => {
                expect(typeof datainfo).assertEqual(OBJECT);
                console.info("getApplicationInfo success:" + JSON.stringify(datainfo));
                expect(datainfo.moduleSourceDirs.length).assertEqual(0);
                expect(datainfo.moduleInfos.length).assertLarger(0);
                expect(datainfo.name).assertEqual(NAME1);
                expect(datainfo.description).assertEqual(APPLICATION_DESCRIPTION);
                expect(datainfo.icon).assertEqual("$media:icon");
                expect(datainfo.label).assertEqual("$string:app_name");
                expect(datainfo.systemApp).assertEqual(false);
                expect(datainfo.descriptionId).assertLarger(0);
                expect(parseInt(datainfo.iconId)).assertLarger(0);
                expect(parseInt(datainfo.labelId)).assertLarger(0);
                expect(datainfo.supportedModes).assertEqual(0);
                expect(datainfo.process).assertEqual(NAME1);
                expect(datainfo.enabled).assertEqual(true);
                expect(datainfo.metaData.entry[0].name).assertEqual("metaDataName");
                expect(datainfo.metaData.entry[0].value).assertEqual("metaDataValue");
                expect(datainfo.metaData.entry[0].extra).assertEqual("$string:app_name");
                expect(datainfo.moduleSourceDirs.length).assertEqual(0);
                for (let j = 0; j < datainfo.moduleInfos.length; j++) {
                    expect(datainfo.moduleInfos[j].moduleName).assertEqual("entry");
                    expect(datainfo.moduleInfos[j].moduleSourceDir.length).assertEqual(0);
                }
                done();
            }).catch(err => {
                console.info("getApplicationInfo fail:" + JSON.stringify(err));
                expect(err).assertFail();
                done();
            })
    })

    /**
     * @tc.number Sub_Bms_Framework_Query_AppInfo_0320
     * @tc.name testGetApplicationInfoMetaDataCallback
     * @tc.desc Test getApplicationInfo interfaces with one hap. (by callback)
     */
    it('testGetApplicationInfoMetaDataCallback', 0, async function (done) {
        await demo.getApplicationInfo(NAME1,
            demo.BundleFlag.GET_APPLICATION_INFO_WITH_PERMISSION | demo.BundleFlag.GET_APPLICATION_INFO_WITH_METADATA,
            userId, (error, datainfo) => {
                if (error.code != 0) {
                    console.info("testGetApplicationInfoMetaDataCallback fail:" + JSON.stringify(error));
                    expect(error).assertFail();
                    done();
                    return;
                }
                expect(typeof datainfo).assertEqual(OBJECT);
                console.info("testGetApplicationInfoMetaDataCallback success:" + JSON.stringify(datainfo));
                expect(datainfo.moduleSourceDirs.length).assertEqual(0);
                expect(datainfo.moduleInfos.length).assertLarger(0);
                expect(datainfo.name).assertEqual(NAME1);
                expect(datainfo.description).assertEqual(APPLICATION_DESCRIPTION);
                expect(datainfo.icon).assertEqual("$media:icon");
                expect(datainfo.label).assertEqual("$string:app_name");
                expect(datainfo.systemApp).assertEqual(false);
                expect(datainfo.descriptionId).assertLarger(0);
                expect(parseInt(datainfo.iconId)).assertLarger(0);
                expect(parseInt(datainfo.labelId)).assertLarger(0);
                expect(datainfo.supportedModes).assertEqual(0);
                expect(datainfo.process).assertEqual(NAME1);
                expect(datainfo.enabled).assertEqual(true);
                expect(datainfo.metaData.entry[0].name).assertEqual("metaDataName");
                expect(datainfo.metaData.entry[0].value).assertEqual("metaDataValue");
                expect(datainfo.metaData.entry[0].extra).assertEqual("$string:app_name");
                expect(datainfo.moduleSourceDirs.length).assertEqual(0);
                for (let j = 0; j < datainfo.moduleInfos.length; j++) {
                    expect(datainfo.moduleInfos[j].moduleName).assertEqual("entry");
                    expect(datainfo.moduleInfos[j].moduleSourceDir.length).assertEqual(0);
                }
                done();
            })
    })

    /**
     * @tc.number Sub_Bms_Framework_Query_AppInfo_0240
     * @tc.name testGetApplicationInfoTwoHapPromise
     * @tc.desc Test getApplicationInfo interfaces with two haps. (by promise)
     */
    it('testGetApplicationInfoTwoHapPromise', 0, async function (done) {
        let datainfo = await demo.getApplicationInfo(NAME2,
            demo.BundleFlag.GET_APPLICATION_INFO_WITH_PERMISSION, userId);
        console.info("testGetApplicationInfoTwoHapPromise result" + JSON.stringify(datainfo));
        expect(typeof datainfo).assertEqual(OBJECT);
        expect(datainfo.name.length).assertLarger(0);
        expect(datainfo.description.length).assertLarger(0);
        expect(datainfo.icon.length).assertLarger(0);
        expect(datainfo.label.length).assertLarger(0);
        expect(datainfo.moduleSourceDirs.length).assertEqual(0);
        expect(datainfo.moduleInfos.length).assertLarger(0);
        expect(datainfo.name).assertEqual(NAME2);
        expect(datainfo.description).assertEqual(APPLICATION_DESCRIPTION);
        expect(datainfo.icon).assertEqual("$media:icon");
        expect(datainfo.label).assertEqual("$string:app_name");
        expect(datainfo.systemApp).assertEqual(false);
        expect(datainfo.descriptionId >= 0).assertTrue();
        expect(datainfo.iconId >= 0).assertTrue();
        expect(datainfo.labelId >= 0).assertTrue();
        expect(datainfo.supportedModes).assertEqual(0);
        expect(datainfo.process).assertEqual(NAME2);
        expect(datainfo.enabled).assertEqual(true);
        expect(datainfo.moduleSourceDirs.length).assertEqual(0);
        expect(datainfo.moduleInfos.length).assertEqual(2);
        expect(datainfo.moduleInfos[0].moduleName).assertEqual("entry");
        expect(datainfo.moduleInfos[1].moduleName).assertEqual("feature");
        for (let j = 0; j < datainfo.moduleInfos.length; j++) {
            expect(datainfo.moduleInfos[j].moduleSourceDir.length).assertEqual(0);
        }
        done();
    })

    /**
     * @tc.number Sub_Bms_Framework_Query_AppInfo_0340
     * @tc.name testGetApplicationInfoTwoHapCallback
     * @tc.desc Test getApplicationInfo interfaces with two haps. (by callback)
     */
    it('testGetApplicationInfoTwoHapCallback', 0, async function (done) {
        await demo.getApplicationInfo(NAME2,
            demo.BundleFlag.GET_APPLICATION_INFO_WITH_PERMISSION, userId, (error, datainfo) => {
                console.info("testGetApplicationInfoTwoHapCallback result" + JSON.stringify(datainfo));
                expect(typeof datainfo).assertEqual(OBJECT);
                expect(datainfo.name.length).assertLarger(0);
                expect(datainfo.description.length).assertLarger(0);
                expect(datainfo.icon.length).assertLarger(0);
                expect(datainfo.label.length).assertLarger(0);
                expect(datainfo.moduleSourceDirs.length).assertEqual(0);
                expect(datainfo.moduleInfos.length).assertLarger(0);
                expect(datainfo.name).assertEqual(NAME2);
                expect(datainfo.description).assertEqual(APPLICATION_DESCRIPTION);
                expect(datainfo.icon).assertEqual("$media:icon");
                expect(datainfo.label).assertEqual("$string:app_name");
                expect(datainfo.systemApp).assertEqual(false);
                expect(datainfo.descriptionId >= 0).assertTrue();
                expect(datainfo.iconId >= 0).assertTrue();
                expect(datainfo.labelId >= 0).assertTrue();
                expect(datainfo.supportedModes).assertEqual(0);
                expect(datainfo.process).assertEqual(NAME2);
                expect(datainfo.enabled).assertEqual(true);
                expect(datainfo.moduleSourceDirs.length).assertEqual(0);
                expect(datainfo.moduleInfos.length).assertEqual(2);
                expect(datainfo.moduleInfos[0].moduleName).assertEqual("entry");
                expect(datainfo.moduleInfos[1].moduleName).assertEqual("feature");
                for (let j = 0; j < datainfo.moduleInfos.length; j++) {
                    expect(datainfo.moduleInfos[j].moduleSourceDir.length).assertEqual(0);
                }
                done();
            })
    })

    /**
     * @tc.number Sub_Bms_Framework_Query_AppInfo_0260
     * @tc.name testGetApplicationInfoThereHapPromise
     * @tc.desc Test getApplicationInfo interfaces with three haps. (by promise)
     */
    it('testGetApplicationInfoThereHapPromise', 0, async function (done) {
        let datainfo = await demo.getApplicationInfo(NAME3, demo.BundleFlag.GET_APPLICATION_INFO_WITH_PERMISSION,
            userId);
        console.info("testGetApplicationInfoThereHapPromise result" + JSON.stringify(datainfo));
        expect(datainfo.name).assertEqual(NAME3);
        expect(datainfo.label).assertEqual("$string:app_name");
        expect(datainfo.icon).assertEqual("$media:icon");
        expect(datainfo.name).assertEqual(NAME3);
        expect(datainfo.description).assertEqual(APPLICATION_DESCRIPTION);
        expect(datainfo.descriptionId >= 0).assertTrue();
        expect(datainfo.icon).assertEqual("$media:icon");
        expect(datainfo.iconId >= 0).assertTrue();
        expect(datainfo.label).assertEqual("$string:app_name");
        expect(datainfo.labelId >= 0).assertTrue();
        expect(datainfo.systemApp).assertEqual(false);
        expect(datainfo.supportedModes).assertEqual(0);
        done();
    })

    /**
    * @tc.number Sub_Bms_Framework_Query_AppInfo_0580
    * @tc.name testGetApplicationInfoThereHapCallback
    * @tc.desc Test getApplicationInfo interfaces with three haps. (by callback)
    */
    it('testGetApplicationInfoThereHapCallback', 0, async function (done) {
        await demo.getApplicationInfo(NAME3, demo.BundleFlag.GET_APPLICATION_INFO_WITH_PERMISSION,
            userId, (error, datainfo) => {
                console.info("testGetApplicationInfoThereHapCallback result" + JSON.stringify(datainfo));
                expect(datainfo.name).assertEqual(NAME3);
                expect(datainfo.label).assertEqual("$string:app_name");
                expect(datainfo.icon).assertEqual("$media:icon");
                expect(datainfo.name).assertEqual(NAME3);
                expect(datainfo.description).assertEqual(APPLICATION_DESCRIPTION);
                expect(datainfo.descriptionId >= 0).assertTrue();
                expect(datainfo.icon).assertEqual("$media:icon");
                expect(datainfo.iconId >= 0).assertTrue();
                expect(datainfo.label).assertEqual("$string:app_name");
                expect(datainfo.labelId >= 0).assertTrue();
                expect(datainfo.systemApp).assertEqual(false);
                expect(datainfo.supportedModes).assertEqual(0);
                done();
            })
    })

    /**
     * @tc.number Sub_Bms_Framework_Query_AppInfo_0280
     * @tc.name testGetApplicationInfoNotExistCallback
     * @tc.desc Test getApplicationInfo interfaces with error hap. (by promise)
     */
    it('testGetApplicationInfoNotExistCallback', 0, async function (done) {
        await demo.getApplicationInfo(ERROR, demo.BundleFlag.GET_APPLICATION_INFO_WITH_PERMISSION,
            userId).then(datainfo => {
                console.info("testGetApplicationInfoNotExistCallback success" + JSON.stringify(datainfo));
                expect(datainfo).assertFail();
                done();
            }).catch(err => {
                console.info("testGetApplicationInfoNotExistCallback err" + JSON.stringify(err));
                expect(err.code).assertEqual(1);
                done();
            });
    })

    /**
     * @tc.number Sub_Bms_Framework_Query_AppInfo_0360
     * @tc.name testGetApplicationInfoNotExistPromise
     * @tc.desc Test getApplicationInfo interfaces with error hap. (by callback)
     */
    it('testGetApplicationInfoNotExistPromise', 0, async function (done) {
        await demo.getApplicationInfo(ERROR, demo.BundleFlag.GET_APPLICATION_INFO_WITH_PERMISSION,
            userId, (error, datainfo) => {
                if (error) {
                    console.info("testGetApplicationInfoNotExistPromise fail" + JSON.stringify(error));
                    expect(error.code).assertEqual(1);
                    done();
                    return;
                }
                console.info("testGetApplicationInfoNotExistPromise success" + JSON.stringify(datainfo));
                expect(datainfo).assertFail();
                done();
            })
    })

    /**
     * @tc.number Sub_Bms_Framework_Query_AppInfo_0300
     * @tc.name testGetApplicationInfoInvalidParamPromise
     * @tc.desc Test getApplicationInfo interfaces with none hap. (by promise)
     */
    it('testGetApplicationInfoInvalidParamPromise', 0, async function (done) {
        await demo.getApplicationInfo('', demo.BundleFlag.GET_APPLICATION_INFO_WITH_PERMISSION,
            userId).then(datainfo => {
                console.info("testGetApplicationInfoInvalidParamPromise success" + JSON.stringify(datainfo));
                expect(datainfo).assertFail();
                done();
            }).catch(error => {
                console.info("testGetApplicationInfoInvalidParamPromise err" + JSON.stringify(error));
                expect(error.code).assertEqual(1);
                done();
            });
    })

    /**
     * @tc.number Sub_Bms_Framework_Query_AppInfo_0380
     * @tc.name testGetApplicationInfoInvalidParamCallback
     * @tc.desc Test getApplicationInfo interfaces with none hap. (by callback)
     */
    it('testGetApplicationInfoInvalidParamCallback', 0, async function (done) {
        await demo.getApplicationInfo('', demo.BundleFlag.GET_APPLICATION_INFO_WITH_PERMISSION,
            userId, (error, datainfo) => {
                if (error) {
                    console.info("testGetApplicationInfoInvalidParamCallback fail" + JSON.stringify(error));
                    expect(error.code).assertEqual(1);
                    done();
                    return;
                }
                console.info("testGetApplicationInfoInvalidParamCallback success" + JSON.stringify(datainfo));
                expect(datainfo).assertFail();
                done();
            });
    })

    /**
     * @tc.number Sub_Bms_Framework_Query_AppInfo_0400
     * @tc.name testGetApplicationInfoDifferentParamPromise
     * @tc.desc Test getApplicationInfo interfaces with one hap and different param. (by promise)
     */
    it('testGetApplicationInfoDifferentParamPromise', 0, async function (done) {
        await demo.getApplicationInfo(NAME1, demo.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(datainfo => {
            console.info("Sub_Bms_Framework_Query_AppInfo_0400 success" + JSON.stringify(datainfo));
            expect(typeof datainfo).assertEqual(OBJECT);
            expect(datainfo.name).assertEqual(NAME1);
            expect(datainfo.label).assertEqual("$string:app_name");
            expect(datainfo.description).assertEqual(APPLICATION_DESCRIPTION);
            expect(datainfo.icon).assertEqual("$media:icon");
            expect(datainfo.descriptionId).assertLarger(0);
            expect(parseInt(datainfo.iconId)).assertLarger(0);
            expect(parseInt(datainfo.labelId)).assertLarger(0);
            expect(datainfo.systemApp).assertEqual(false);
            expect(datainfo.supportedModes).assertEqual(0);
            done();
        }).catch(err => {
            console.info("testGetApplicationInfoDifferentParamPromise fail" + JSON.stringify(err));
            expect(err).assertFail();
            done();
        })
    })

    /**
     * @tc.number Sub_Bms_Framework_Query_AppInfo_0420
     * @tc.name testGetApplicationInfoDifferentParamCallback
     * @tc.desc Test getApplicationInfo interfaces with one hap and different param. (by callback)
     */
    it('testGetApplicationInfoDifferentParamCallback', 0, async function (done) {
        await demo.getApplicationInfo(NAME1, demo.BundleFlag.GET_BUNDLE_DEFAULT, userId, (error, datainfo) => {
            if (error.code != 0) {
                console.info("testGetApplicationInfoDifferentParamCallback fail" + JSON.stringify(error));
                expect(error).assertFail();
                done();
                return;
            }
            console.info("testGetApplicationInfoDifferentParamCallback success" + JSON.stringify(datainfo));
            expect(typeof datainfo).assertEqual(OBJECT);
            expect(datainfo.name).assertEqual(NAME1);
            expect(datainfo.label).assertEqual("$string:app_name");
            expect(datainfo.description).assertEqual(APPLICATION_DESCRIPTION);
            expect(datainfo.icon).assertEqual("$media:icon");
            expect(datainfo.descriptionId).assertLarger(0);
            expect(parseInt(datainfo.iconId)).assertLarger(0);
            expect(parseInt(datainfo.labelId)).assertLarger(0);
            expect(datainfo.systemApp).assertEqual(false);
            expect(datainfo.supportedModes).assertEqual(0);
            done();
        })
    })

    /**
     * @tc.number Sub_Bms_Framework_Query_AppInfo_0440
     * @tc.name testGetApplicationInfoPromise
     * @tc.desc Test getApplicationInfo interfaces with one hap. (by promise)
     */
    it('testGetApplicationInfoPromise', 0, async function (done) {
        await demo.getApplicationInfo(NAME1, demo.BundleFlag.GET_APPLICATION_INFO_WITH_PERMISSION,
            userId).then(datainfo => {
                console.info("testGetApplicationInfoPromise success:" + JSON.stringify(datainfo));
                expect(typeof datainfo).assertEqual(OBJECT);
                expect(datainfo.name).assertEqual(NAME1);
                expect(datainfo.label).assertEqual("$string:app_name");
                expect(datainfo.description).assertEqual(APPLICATION_DESCRIPTION);
                expect(datainfo.icon).assertEqual("$media:icon");
                expect(datainfo.descriptionId >= 0).assertTrue();
                expect(parseInt(datainfo.iconId)).assertLarger(0);
                expect(parseInt(datainfo.labelId)).assertLarger(0);
                expect(datainfo.systemApp).assertEqual(false);
                expect(datainfo.supportedModes).assertEqual(0);
                expect(datainfo.enabled).assertEqual(true);
                for (let j = 0; j < datainfo.moduleInfos.length; j++) {
                    expect(datainfo.moduleInfos[j].moduleName).assertEqual("entry");
                    expect(datainfo.moduleInfos[j].moduleSourceDir).assertEqual('');
                }
                done();
            }).catch(error => {
                console.info("testGetApplicationInfoPromise fail:" + JSON.stringify(error));
                expect(error).assertFail();
                done();
            })
    })

    /**
     * @tc.number Sub_Bms_Framework_Query_AppInfo_0460
     * @tc.name testGetApplicationInfoCallback
     * @tc.desc Test getApplicationInfo interfaces with one hap. (by callback)
     */
    it('testGetApplicationInfoCallback', 0, async function (done) {
        await demo.getApplicationInfo(NAME1, demo.BundleFlag.GET_APPLICATION_INFO_WITH_PERMISSION, userId,
            (error, datainfo) => {
                if (error.code != 0) {
                    console.info("testGetApplicationInfoCallback fail:" + JSON.stringify(error));
                    expect(error).assertFail();
                    done();
                    return;
                }
                console.info("testGetApplicationInfoCallback success:" + JSON.stringify(datainfo));
                expect(typeof datainfo).assertEqual(OBJECT);
                expect(datainfo.name).assertEqual(NAME1);
                expect(datainfo.label).assertEqual("$string:app_name");
                expect(datainfo.description).assertEqual(APPLICATION_DESCRIPTION);
                expect(datainfo.icon).assertEqual("$media:icon");
                expect(datainfo.descriptionId >= 0).assertTrue();
                expect(parseInt(datainfo.iconId)).assertLarger(0);
                expect(parseInt(datainfo.labelId)).assertLarger(0);
                expect(datainfo.systemApp).assertEqual(false);
                expect(datainfo.supportedModes).assertEqual(0);
                expect(datainfo.enabled).assertEqual(true);
                for (let j = 0; j < datainfo.moduleInfos.length; j++) {
                    expect(datainfo.moduleInfos[j].moduleName).assertEqual("entry");
                    expect(datainfo.moduleInfos[j].moduleSourceDir).assertEqual('');
                }
                done();
            })
    })

    /**
     * @tc.number Sub_Bms_Framework_Query_AppInfo_2560
     * @tc.name testGetAllBundleInfoCallback
     * @tc.desc Test getBundleInfos interfaces with one hap.
     */
    it('testGetAllBundleInfoCallback', 0, async function (done) {
        await demo.getAllBundleInfo(demo.BundleFlag.GET_BUNDLE_DEFAULT, (error, data) => {
            expect(typeof data).assertEqual(OBJECT);
            for (let i = 0; i < data.length; i++) {
                expect(data[i].name.length).assertLarger(0);
                expect(data[i].appInfo.name.length).assertLarger(0);
                if (data[i].name == NAME1 || data[i].name == NAME2
                    || data[i].name == NAME3 || data[i].name == NAME4 || data[i].name == NAME5) {
                    expect(data[i].appInfo.description.length >= 0).assertTrue();
                    expect(data[i].appInfo.icon.length).assertLarger(0);
                    expect(data[i].appInfo.label.length).assertLarger(0);
                }
                if (data[i].appInfo.codePath != FLAGONE && data[i].appInfo.codePath != FLAGTWO) {
                    expect(data[i].appInfo.supportedModes).assertEqual(0);
                    expect(data[i].appInfo.moduleInfos.length).assertLarger(0);
                }
            }
            done();
        });
    })

    /**
     * @tc.number Sub_Bms_Framework_Query_AppInfo_0860
    * @tc.name testGetAllApplicationInfoTwoHapPromise
     * @tc.desc Test getApplicationInfos interfaces with two haps.
     */
    it('testGetAllApplicationInfoTwoHapPromise', 0, async function (done) {
        let datainfo = await demo.getAllApplicationInfo(demo.BundleFlag.GET_APPLICATION_INFO_WITH_PERMISSION, userId);
        console.info("==========ActsBmsGetInfosSecondScene is ==========" + JSON.stringify(datainfo));
        checkgetApplicationInfos(datainfo);
        done();
    })

    /**
     * @tc.number Sub_Bms_Framework_Query_AppInfo_0900
     * @tc.name testGetAllApplicationInfoDifferentParamPromise
     * @tc.desc Test getApplicationInfos interfaces with two haps and different param.
     */
    it('testGetAllApplicationInfoDifferentParamPromise', 0, async function (done) {
        let datainfo = await demo.getAllApplicationInfo(demo.BundleFlag.GET_BUNDLE_DEFAULT, userId);
        expect(datainfo.length).assertLarger(0);
        checkgetApplicationInfos(datainfo);
        done();
    })

    /**
     * @tc.number Sub_Bms_Framework_Query_AppInfo_0960
     * @tc.name testGetAllApplicationInfoTwoHapCallback
     * @tc.desc Test getApplicationInfos interfaces with two haps.
     */
    it('testGetAllApplicationInfoTwoHapCallback', 0, async function (done) {
        await demo.getAllApplicationInfo(demo.BundleFlag.GET_APPLICATION_INFO_WITH_PERMISSION,
            userId, (error, datainfo) => {
                for (let i = 0; i < datainfo.length; i++) {
                    expect(datainfo[i].name.length).assertLarger(0);
                    if (datainfo[i].name == NAME1 || datainfo[i].name == NAME2
                        || datainfo[i].name == NAME3 || datainfo[i].name == NAME4 || datainfo[i].name == NAME5) {
                        expect(datainfo[i].description.length >= 0).assertTrue();
                        expect(datainfo[i].icon.length).assertLarger(0);
                        expect(datainfo[i].label.length).assertLarger(0);
                    }
                    expect(datainfo[i].moduleSourceDirs.length).assertEqual(0);
                    expect(datainfo[i].moduleInfos.length).assertLarger(0);
                    expect(datainfo[i].supportedModes).assertEqual(0);
                    for (let j = 0; j < datainfo[i].moduleInfos.length; j++) {
                        expect(datainfo[i].moduleInfos[j].moduleName.length).assertLarger(0);
                        expect(datainfo[i].moduleInfos[j].moduleSourceDir.length).assertEqual(0);
                    }
                }
                done();
            });
    })

    /**
     * @tc.number Sub_Bms_Framework_Query_AppInfo_0980
     * @tc.name testGetAllApplicationInfoThereHapCallback
     * @tc.desc Test getApplicationInfos interfaces with three haps.
    */
    it('testGetAllApplicationInfoThereHapCallback', 0, async function (done) {
        await demo.getAllApplicationInfo(demo.BundleFlag.GET_BUNDLE_DEFAULT, userId, (error, datainfo) => {
            for (let i = 0; i < datainfo.length; i++) {
                expect(datainfo[i].name.length).assertLarger(0);
                if (datainfo[i].name == NAME1 || datainfo[i].name == NAME2
                    || datainfo[i].name == NAME3 || datainfo[i].name == NAME4 || datainfo[i].name == NAME5) {
                    expect(datainfo[i].description.length >= 0).assertTrue();
                    expect(datainfo[i].icon.length).assertLarger(0);
                    expect(datainfo[i].label.length).assertLarger(0);
                }
                expect(datainfo[i].moduleSourceDirs.length).assertEqual(0);
                expect(datainfo[i].moduleInfos.length).assertLarger(0);
                expect(datainfo[i].supportedModes).assertEqual(0);
                for (let j = 0; j < datainfo[i].moduleInfos.length; j++) {
                    expect(datainfo[i].moduleInfos[j].moduleName.length).assertLarger(0);
                    expect(datainfo[i].moduleInfos[j].moduleSourceDir.length).assertEqual(0);
                }
            }
            done();
        });
    })

    /**
     * @tc.number Sub_Bms_Framework_Query_AppInfo_1000
     * @tc.name testGetAllApplicationInfoDifferentParamCallback
     * @tc.desc Test getApplicationInfos interfaces with two haps and different param.
     */
    it('testGetAllApplicationInfoDifferentParamCallback', 0, async function (done) {
        await demo.getAllApplicationInfo(demo.BundleFlag.GET_BUNDLE_DEFAULT, userId, (error, datainfo) => {
            for (let i = 0; i < datainfo.length; i++) {
                expect(datainfo[i].name.length).assertLarger(0);
                if (datainfo[i].name == NAME1 || datainfo[i].name == NAME2
                    || datainfo[i].name == NAME3 || datainfo[i].name == NAME4 || datainfo[i].name == NAME5) {
                    expect(datainfo[i].description.length >= 0).assertTrue();
                    expect(datainfo[i].icon.length).assertLarger(0);
                    expect(datainfo[i].label.length).assertLarger(0);
                }
                expect(datainfo[i].moduleSourceDirs.length).assertEqual(0);
                expect(datainfo[i].moduleInfos.length).assertLarger(0);
                expect(datainfo[i].supportedModes).assertEqual(0);
                for (let j = 0; j < datainfo[i].moduleInfos.length; j++) {
                    expect(datainfo[i].moduleInfos[j].moduleName.length).assertLarger(0);
                    expect(datainfo[i].moduleInfos[j].moduleSourceDir.length).assertEqual(0);
                }
            }
            done();
        });
    })

    /**
     * @tc.number Sub_Bms_Framework_Query_AppInfo_2480
     * @tc.name testGetAllBundleInfoTwoHapPromise
     * @tc.desc Test getBundleInfos interfaces with two haps.
     */
    it('testGetAllBundleInfoTwoHapPromise', 0, async function (done) {
        let data = await demo.getAllBundleInfo(demo.BundleFlag.GET_BUNDLE_DEFAULT);
        expect(typeof data).assertEqual(OBJECT);
        for (let i = 0; i < data.length; i++) {
            expect(data[i].name.length).assertLarger(0);
            expect(data[i].appInfo.name.length).assertLarger(0);
            if (data[i].name == NAME1 || data[i].name == NAME2
                || data[i].name == NAME3 || data[i].name == NAME4 || data[i].name == NAME5) {
                expect(data[i].appInfo.description.length >= 0).assertTrue();
                expect(data[i].appInfo.icon.length).assertLarger(0);
                expect(data[i].appInfo.label.length).assertLarger(0);
            }
            if (data[i].appInfo.codePath != FLAGONE && data[i].appInfo.codePath != FLAGTWO) {
                expect(data[i].appInfo.supportedModes).assertEqual(0);
                expect(data[i].appInfo.moduleInfos.length).assertLarger(0);
            }
        }
        done();
    })

    /**
     * @tc.number Sub_Bms_Framework_Query_AppInfo_2520
     * @tc.name testGetAllBundleInfoTwoHapDifferentParamPromise
     * @tc.desc Test getBundleInfos interfaces with two haps and different param.
     */
    it('testGetAllBundleInfoTwoHapDifferentParamPromise', 0, async function (done) {
        let data = await demo.getAllBundleInfo(demo.BundleFlag.GET_BUNDLE_WITH_ABILITIES);
        expect(typeof data).assertEqual(OBJECT);
        for (let i = 0; i < data.length; i++) {
            expect(data[i].name.length).assertLarger(0);
            expect(data[i].appInfo.name.length).assertLarger(0);
            if (data[i].name == NAME1 || data[i].name == NAME2
                || data[i].name == NAME3 || data[i].name == NAME4 || data[i].name == NAME5) {
                expect(data[i].appInfo.description.length >= 0).assertTrue();
                expect(data[i].appInfo.icon.length).assertLarger(0);
                expect(data[i].appInfo.label.length).assertLarger(0);
            }
            if (data[i].appInfo.codePath != FLAGONE && data[i].appInfo.codePath != FLAGTWO) {
                expect(data[i].appInfo.supportedModes).assertEqual(0);
                expect(data[i].appInfo.moduleInfos.length).assertLarger(0);
            }
        }
        done();
    })


    /**
     * @tc.number Sub_Bms_Framework_Query_AppInfo_2580
     * @tc.name testGetAllBundleInfoTwoHapCallback
     * @tc.desc Test getBundleInfos interfaces with two haps.
     */
    it('testGetAllBundleInfoTwoHapCallback', 0, async function (done) {
        await demo.getAllBundleInfo(demo.BundleFlag.GET_BUNDLE_DEFAULT, (error, data) => {
            expect(typeof data).assertEqual(OBJECT);
            for (let i = 0; i < data.length; i++) {
                expect(data[i].name.length).assertLarger(0);
                expect(data[i].appInfo.name.length).assertLarger(0);
                if (data[i].name == NAME1 || data[i].name == NAME2
                    || data[i].name == NAME3 || data[i].name == NAME4 || data[i].name == NAME5) {
                    expect(data[i].appInfo.description.length >= 0).assertTrue();
                    expect(data[i].appInfo.icon.length).assertLarger(0);
                    expect(data[i].appInfo.label.length).assertLarger(0);
                }
                if (data[i].appInfo.codePath != FLAGONE && data[i].appInfo.codePath != FLAGTWO) {
                    expect(data[i].appInfo.supportedModes).assertEqual(0);
                    expect(data[i].appInfo.moduleInfos.length).assertLarger(0);
                }
            }
            done();
        })
    })

    /**
     * @tc.number Sub_Bms_Framework_Query_AppInfo_2620
    * @tc.name testGetAllBundleInfoTwoHapDifferentParamCallback
     * @tc.desc Test getBundleInfos interfaces with two haps and different param.
     */
    it('testGetAllBundleInfoTwoHapDifferentParamCallback', 0, async function (done) {
        await demo.getAllBundleInfo(demo.BundleFlag.GET_BUNDLE_WITH_ABILITIES, (error, data) => {
            expect(typeof data).assertEqual(OBJECT);
            for (let i = 0; i < data.length; i++) {
                expect(data[i].name.length).assertLarger(0);
                expect(data[i].appInfo.name.length).assertLarger(0);
                if (data[i].name == NAME1 || data[i].name == NAME2
                    || data[i].name == NAME3 || data[i].name == NAME4 || data[i].name == NAME5) {
                    expect(data[i].appInfo.description.length >= 0).assertTrue();
                    expect(data[i].appInfo.icon.length).assertLarger(0);
                    expect(data[i].appInfo.label.length).assertLarger(0);
                }
                if (data[i].appInfo.codePath != FLAGONE && data[i].appInfo.codePath != FLAGTWO) {
                    expect(data[i].appInfo.supportedModes).assertEqual(0);
                    expect(data[i].appInfo.moduleInfos.length).assertLarger(0);
                }
            }
            done();
        })
    })

    /**
     * @tc.number Sub_Bms_Framework_Query_AppInfo_2500
     * @tc.name testGetAllBundleInfoThereHapPromise
     * @tc.desc Test getBundleInfos interfaces with three haps.
     */
    it('testGetAllBundleInfoThereHapPromise', 0, async function (done) {
        let data = await demo.getAllBundleInfo(demo.BundleFlag.GET_BUNDLE_DEFAULT);
        for (let i = 0; i < data.length; i++) {
            expect(data[i].name.length).assertLarger(0);
            expect(data[i].appInfo.name.length).assertLarger(0);
            if (data[i].name == NAME1 || data[i].name == NAME2
                || data[i].name == NAME3 || data[i].name == NAME4 || data[i].name == NAME5) {
                expect(data[i].appInfo.description.length >= 0).assertTrue();
                expect(data[i].appInfo.icon.length).assertLarger(0);
                expect(data[i].appInfo.label.length).assertLarger(0);
            }
            if (data[i].appInfo.codePath != FLAGONE && data[i].appInfo.codePath != FLAGTWO) {
                expect(data[i].appInfo.supportedModes).assertEqual(0);
                expect(data[i].appInfo.moduleInfos.length).assertLarger(0);
            }
        }
        done();
    })

    /**
     * @tc.number Sub_Bms_Framework_Query_AppInfo_2540
     * @tc.name testGetAllBundleInfoThereHapDifferentParamPromise
     * @tc.desc Test getBundleInfos interfaces with three haps and different param.
     */
    it('testGetAllBundleInfoThereHapDifferentParamPromise', 0, async function (done) {
        let data = await demo.getAllBundleInfo(demo.BundleFlag.GET_BUNDLE_WITH_ABILITIES);
        for (let i = 0; i < data.length; i++) {
            expect(data[i].name.length).assertLarger(0);
            expect(data[i].appInfo.name.length).assertLarger(0);
            if (data[i].name == NAME1 || data[i].name == NAME2
                || data[i].name == NAME3 || data[i].name == NAME4 || data[i].name == NAME5) {
                expect(data[i].appInfo.description.length >= 0).assertTrue();
                expect(data[i].appInfo.icon.length).assertLarger(0);
                expect(data[i].appInfo.label.length).assertLarger(0);
            }
            if (data[i].appInfo.codePath != FLAGONE && data[i].appInfo.codePath != FLAGTWO) {
                expect(data[i].appInfo.supportedModes).assertEqual(0);
                expect(data[i].appInfo.moduleInfos.length).assertLarger(0);
            }
        }
        done();
    })

    /**
     * @tc.number Sub_Bms_Framework_Query_AppInfo_2600
     * @tc.name testGetAllBundleInfoThereHapCallback
     * @tc.desc Test getBundleInfos interfaces with three haps.
     */
    it('testGetAllBundleInfoThereHapCallback', 0, async function (done) {
        await demo.getAllBundleInfo(demo.BundleFlag.GET_BUNDLE_DEFAULT, (error, data) => {
            for (let i = 0; i < data.length; i++) {
                expect(data[i].name.length).assertLarger(0);
                expect(data[i].appInfo.name.length).assertLarger(0);
                if (data[i].name == NAME1 || data[i].name == NAME2
                    || data[i].name == NAME3 || data[i].name == NAME4 || data[i].name == NAME5) {
                    expect(data[i].appInfo.description.length >= 0).assertTrue();
                    expect(data[i].appInfo.icon.length).assertLarger(0);
                    expect(data[i].appInfo.label.length).assertLarger(0);
                }
                if (data[i].appInfo.codePath != FLAGONE && data[i].appInfo.codePath != FLAGTWO) {
                    expect(data[i].appInfo.supportedModes).assertEqual(0);
                    expect(data[i].appInfo.moduleInfos.length).assertLarger(0);
                }
            }
            done();
        })

    })

    /**
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_0500
     * @tc.name testQueryAbilityByWantPromise
     * @tc.desc Test queryAbilityByWant interfaces with none hap. (by promise)
     */
    it('testQueryAbilityByWantPromise', 0, async function (done) {
        await demo.queryAbilityByWant(
            {
                "bundleName": "com.example.myapplication1",
                "abilityName": "com.example.myapplication1.MainAbility",
            }, demo.BundleFlag.GET_ABILITY_INFO_WITH_APPLICATION |
            demo.BundleFlag.GET_ABILITY_INFO_WITH_PERMISSION |
        demo.BundleFlag.GET_ABILITY_INFO_WITH_METADATA,
            userId).then(data => {
                expect(data.length).assertLarger(0);
                for (let i = 0, len = data.length; i < len; i++) {
                    let datainfo = data[i];
                    console.info("testQueryAbilityByWantPromise success:" + JSON.stringify(datainfo));
                    expect(datainfo.name).assertEqual("com.example.myapplication1.MainAbility");
                    expect(datainfo.label).assertEqual("$string:app_name");
                    expect(datainfo.description).assertEqual(DESCRIPTION);
                    expect(datainfo.icon).assertEqual("$media:icon");
                    expect(datainfo.moduleName).assertEqual("entry");
                    expect(datainfo.bundleName).assertEqual(NAME1);
                    expect(datainfo.type).assertEqual(demo.AbilityType.PAGE);
                    expect(datainfo.subType).assertEqual(demo.AbilitySubType.UNSPECIFIED);
                    expect(datainfo.orientation).assertEqual(demo.DisplayOrientation.UNSPECIFIED);
                    expect(datainfo.launchMode).assertEqual(demo.LaunchMode.STANDARD);
                    expect(datainfo.permissions[0]).assertEqual("com.permission.BMS_PERMISSION_CAMERA");
                    expect(datainfo.applicationInfo.name).assertEqual(NAME1);
                    expect(datainfo.applicationInfo.description).assertEqual(APPLICATION_DESCRIPTION);
                    expect(datainfo.applicationInfo.descriptionId >= 0).assertTrue();
                    expect(datainfo.applicationInfo.icon).assertEqual("$media:icon");
                    expect(datainfo.applicationInfo.iconId >= 0).assertTrue();
                    expect(datainfo.applicationInfo.label).assertEqual("$string:app_name");
                    expect(datainfo.applicationInfo.labelId >= 0).assertTrue();
                    expect(datainfo.applicationInfo.systemApp).assertEqual(false);
                    expect(datainfo.applicationInfo.supportedModes).assertEqual(0);
                    expect(datainfo.applicationInfo.enabled).assertEqual(true);
                    expect(datainfo.metaData.length).assertLarger(0);
                    for (let j = 0; j < datainfo.applicationInfo.moduleInfos.length; j++) {
                        expect(datainfo.applicationInfo.moduleInfos[j].moduleName).assertEqual("entry");
                        expect(datainfo.applicationInfo.moduleInfos[j].moduleSourceDir).assertEqual('');
                    }
                }
                done();
            }).catch(err => {
                console.info("testQueryAbilityByWantPromise err" + JSON.stringify(err));
                expect(err).assertFail();
                done();
            })
    })

    /**
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_0580
     * @tc.name testQueryAbilityByWantCallback
     * @tc.desc Test queryAbilityByWant interfaces with none hap. (by callback)
     */
    it('testQueryAbilityByWantCallback', 0, async function (done) {
        demo.queryAbilityByWant(
            {
                "bundleName": "com.example.myapplication1",
                "abilityName": "com.example.myapplication1.MainAbility",
            }, demo.BundleFlag.GET_ABILITY_INFO_WITH_APPLICATION |
            demo.BundleFlag.GET_ABILITY_INFO_WITH_PERMISSION |
        demo.BundleFlag.GET_ABILITY_INFO_WITH_METADATA,
            userId, (err, data) => {
                if (err) {
                    console.info("testQueryAbilityByWantCallback err" + JSON.stringify(err));
                    expect(err).assertFail();
                    done();
                    return;
                }
                expect(data.length).assertLarger(0);
                for (let i = 0, len = data.length; i < len; i++) {
                    let datainfo = data[i];
                    console.info("testQueryAbilityByWantCallback success:" + JSON.stringify(datainfo));
                    expect(datainfo.name).assertEqual("com.example.myapplication1.MainAbility");
                    expect(datainfo.label).assertEqual("$string:app_name");
                    expect(datainfo.description).assertEqual(DESCRIPTION);
                    expect(datainfo.icon).assertEqual("$media:icon");
                    expect(datainfo.moduleName).assertEqual("entry");
                    expect(datainfo.bundleName).assertEqual(NAME1);
                    expect(datainfo.type).assertEqual(demo.AbilityType.PAGE);
                    expect(datainfo.subType).assertEqual(demo.AbilitySubType.UNSPECIFIED);
                    expect(datainfo.orientation).assertEqual(demo.DisplayOrientation.UNSPECIFIED);
                    expect(datainfo.launchMode).assertEqual(demo.LaunchMode.STANDARD);
                    expect(datainfo.permissions[0]).assertEqual("com.permission.BMS_PERMISSION_CAMERA");
                    expect(datainfo.applicationInfo.name).assertEqual(NAME1);
                    expect(datainfo.applicationInfo.description).assertEqual(APPLICATION_DESCRIPTION);
                    expect(datainfo.applicationInfo.descriptionId >= 0).assertTrue();
                    expect(datainfo.applicationInfo.icon).assertEqual("$media:icon");
                    expect(datainfo.applicationInfo.iconId >= 0).assertTrue();
                    expect(datainfo.applicationInfo.label).assertEqual("$string:app_name");
                    expect(datainfo.applicationInfo.labelId >= 0).assertTrue();
                    expect(datainfo.applicationInfo.systemApp).assertEqual(false);
                    expect(datainfo.applicationInfo.supportedModes).assertEqual(0);
                    expect(datainfo.applicationInfo.enabled).assertEqual(true);
                    expect(datainfo.metaData.length).assertLarger(0);
                    for (let j = 0; j < datainfo.applicationInfo.moduleInfos.length; j++) {
                        expect(datainfo.applicationInfo.moduleInfos[j].moduleName).assertEqual("entry");
                        expect(datainfo.applicationInfo.moduleInfos[j].moduleSourceDir).assertEqual('');
                    }
                }
                done();
            })
    })

    /**
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_0520
     * @tc.name testQueryAbilityByWantTwoHapPromise
     * @tc.desc Test queryAbilityByWant interfaces with two haps. (by promise)
     */
    it('testQueryAbilityByWantTwoHapPromise', 0, async function (done) {
        let data = await demo.queryAbilityByWant(
            {
                "bundleName": "com.example.myapplication2",
                "abilityName": "com.example.myapplication1.MainAbility",
            }, demo.BundleFlag.GET_ALL_APPLICATION_INFO, userId);
        expect(data.length).assertLarger(0);
        for (let i = 0, len = data.length; i < len; i++) {
            let datainfo = data[i];
            console.info("testQueryAbilityByWantTwoHapPromise success:" + JSON.stringify(datainfo));
            expect(datainfo.name.length).assertLarger(0);
            expect(datainfo.label).assertEqual("$string:app_name");
            expect(datainfo.description).assertEqual(DESCRIPTION);
            expect(datainfo.icon).assertEqual("$media:icon");
            expect(datainfo.moduleName).assertEqual("entry");
            expect(datainfo.bundleName).assertEqual(NAME2);
            expect(datainfo.orientation).assertEqual(demo.DisplayOrientation.LANDSCAPE);
            expect(datainfo.launchMode).assertEqual(demo.LaunchMode.SINGLETON);
            expect(datainfo.applicationInfo.name).assertEqual(NAME2);
            expect(datainfo.applicationInfo.description).assertEqual(APPLICATION_DESCRIPTION);
            expect(datainfo.applicationInfo.descriptionId >= 0).assertTrue();
            expect(datainfo.applicationInfo.icon).assertEqual("$media:icon");
            expect(datainfo.applicationInfo.iconId >= 0).assertTrue();
            expect(datainfo.applicationInfo.label).assertEqual("$string:app_name");
            expect(datainfo.applicationInfo.labelId >= 0).assertTrue();
            expect(datainfo.applicationInfo.systemApp).assertEqual(false);
            expect(datainfo.applicationInfo.supportedModes).assertEqual(0);
            expect(datainfo.applicationInfo.enabled).assertEqual(true);
            expect(datainfo.applicationInfo.moduleInfos[0].moduleName).assertEqual("entry");
            expect(datainfo.applicationInfo.moduleInfos[0].moduleSourceDir).assertEqual('');
            expect(datainfo.applicationInfo.moduleInfos[1].moduleName).assertEqual("feature");
            expect(datainfo.applicationInfo.moduleInfos[1].moduleSourceDir).assertEqual('');
        }
        done();
    })

    /**
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_0600
     * @tc.name testQueryAbilityByWantTwoHapCallback
     * @tc.desc Test queryAbilityByWant interfaces with two haps. (by callback)
     */
    it('testQueryAbilityByWantTwoHapCallback', 0, async function (done) {
        await demo.queryAbilityByWant(
            {
                "bundleName": "com.example.myapplication2",
                "abilityName": "com.example.myapplication1.MainAbility",
            }, demo.BundleFlag.GET_ALL_APPLICATION_INFO, userId, (error, data) => {
                expect(data.length).assertLarger(0);
                for (let i = 0, len = data.length; i < len; i++) {
                    let datainfo = data[i];
                    console.info("testQueryAbilityByWantTwoHapCallback success:" + JSON.stringify(datainfo));
                    expect(datainfo.name.length).assertLarger(0);
                    expect(datainfo.label).assertEqual("$string:app_name");
                    expect(datainfo.description).assertEqual(DESCRIPTION);
                    expect(datainfo.icon).assertEqual("$media:icon");
                    expect(datainfo.moduleName).assertEqual("entry");
                    expect(datainfo.bundleName).assertEqual(NAME2);
                    expect(datainfo.orientation).assertEqual(1);
                    expect(datainfo.launchMode).assertEqual(demo.LaunchMode.SINGLETON);
                    expect(datainfo.applicationInfo.name).assertEqual(NAME2);
                    expect(datainfo.applicationInfo.description).assertEqual(APPLICATION_DESCRIPTION);
                    expect(datainfo.applicationInfo.descriptionId >= 0).assertTrue();
                    expect(datainfo.applicationInfo.icon).assertEqual("$media:icon");
                    expect(datainfo.applicationInfo.iconId >= 0).assertTrue();
                    expect(datainfo.applicationInfo.label).assertEqual("$string:app_name");
                    expect(datainfo.applicationInfo.labelId >= 0).assertTrue();
                    expect(datainfo.applicationInfo.systemApp).assertEqual(false);
                    expect(datainfo.applicationInfo.supportedModes).assertEqual(0);
                    expect(datainfo.applicationInfo.enabled).assertEqual(true);
                    expect(datainfo.applicationInfo.moduleInfos[0].moduleName).assertEqual("entry");
                    expect(datainfo.applicationInfo.moduleInfos[0].moduleSourceDir).assertEqual('');
                    expect(datainfo.applicationInfo.moduleInfos[1].moduleName).assertEqual("feature");
                    expect(datainfo.applicationInfo.moduleInfos[1].moduleSourceDir).assertEqual('');
                }
                done();
            })
    })

    /**
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_0540
     * @tc.name testQueryAbilityByWantThereHapPromise
     * @tc.desc Test queryAbilityByWant interfaces with three haps. (by promise)
     */
    it('testQueryAbilityByWantThereHapPromise', 0, async function (done) {
        await demo.queryAbilityByWant({
            entities: ['entity.system.home', 'entitiesentities']
        }, 4, userId).then(data => {
            checkAbilityInfo0500(data)
            done();
        }).catch(err => {
            console.info("testQueryAbilityByWantThereHapPromise err" + JSON.stringify(err));
            expect(err).assertFail();
            done();
        })
    })

    function checkAbilityInfo0500(data) {
        let queryResultCount = 0;
        for (let i = 0, len = data.length; i < len; i++) {
            let datainfo = data[i];
            console.info("testQueryAbilityByWantThereHapPromise success:" + JSON.stringify(datainfo));
            if (datainfo.bundleName == NAME3) {
                expect(datainfo.name).assertEqual("com.example.myapplication.MainAbility");
                expect(datainfo.label).assertEqual("$string:app_name");
                expect(datainfo.description).assertEqual(DESCRIPTION);
                expect(datainfo.icon).assertEqual("$media:icon");
                expect(datainfo.moduleName).assertEqual("entry");
                expect(datainfo.bundleName).assertEqual(NAME3);
                expect(datainfo.type).assertEqual(demo.AbilityType.PAGE);
                expect(datainfo.applicationInfo.name).assertEqual(NAME3);
                expect(datainfo.applicationInfo.description).assertEqual(APPLICATION_DESCRIPTION);
                expect(datainfo.applicationInfo.descriptionId >= 0).assertTrue();
                expect(datainfo.applicationInfo.icon).assertEqual("$media:icon");
                expect(datainfo.applicationInfo.iconId >= 0).assertTrue();
                expect(datainfo.applicationInfo.label).assertEqual("$string:app_name");
                expect(datainfo.applicationInfo.labelId >= 0).assertTrue();
                expect(datainfo.applicationInfo.systemApp).assertEqual(false);
                expect(datainfo.applicationInfo.supportedModes).assertEqual(0);
                expect(datainfo.orientation).assertEqual(demo.DisplayOrientation.PORTRAIT);
                expect(datainfo.orientation).assertEqual(2);
                expect(datainfo.applicationInfo.enabled).assertEqual(true);
                for (let j = 0; j < datainfo.applicationInfo.moduleInfos.length; j++) {
                    expect(datainfo.applicationInfo.moduleInfos[j].moduleName).assertEqual("entry");
                }
                queryResultCount++;
            }
            if (datainfo.bundleName == NAME4) {
                expect(datainfo.name).assertEqual("com.example.myapplication.MainAbility");
                expect(datainfo.type).assertEqual(demo.AbilityType.PAGE);
                expect(datainfo.orientation).assertEqual(demo.DisplayOrientation.UNSPECIFIED);
                expect(datainfo.bundleName).assertEqual(NAME4);
                queryResultCount++;
            }
            if (datainfo.bundleName == NAME5) {
                expect(datainfo.name).assertEqual("com.example.myapplication.MainAbility");
                expect(datainfo.type).assertEqual(demo.AbilityType.PAGE);
                expect(datainfo.bundleName).assertEqual(NAME5);
                expect(datainfo.orientation).assertEqual(demo.DisplayOrientation.FOLLOW_RECENT);
                queryResultCount++;
            }
        }
        expect(queryResultCount).assertEqual(3);
    }

    /**
    * @tc.number Sub_Bms_Framework_Query_AbilityInfo_0620
    * @tc.name testQueryAbilityByWantThereHapCallback
    * @tc.desc Test queryAbilityByWant interfaces with three haps. (by callback)
    */
    it('testQueryAbilityByWantThereHapCallback', 0, async function (done) {
        await demo.queryAbilityByWant(
            {
                entities: ['entity.system.home', 'entitiesentities']
            }, 4, userId, (err, data) => {
                if (err) {
                    console.info("testQueryAbilityByWantThereHapCallback err" + JSON.stringify(err));
                    expect(err).assertFail();
                    done();
                    return;
                }
                checkAbilityInfo0600(data);
                done();
            })
    })

    function checkAbilityInfo0600(data) {
        let queryResultCount = 0;
        for (let i = 0, len = data.length; i < len; i++) {
            let datainfo = data[i];
            console.info("testQueryAbilityByWantThereHapCallback success:" + JSON.stringify(datainfo));
            if (datainfo.bundleName == NAME3) {
                expect(datainfo.name).assertEqual("com.example.myapplication.MainAbility");
                expect(datainfo.label).assertEqual("$string:app_name");
                expect(datainfo.description).assertEqual(DESCRIPTION);
                expect(datainfo.icon).assertEqual("$media:icon");
                expect(datainfo.moduleName).assertEqual("entry");
                expect(datainfo.bundleName).assertEqual(NAME3);
                expect(datainfo.applicationInfo.name).assertEqual(NAME3);
                expect(datainfo.applicationInfo.description).assertEqual(APPLICATION_DESCRIPTION);
                expect(datainfo.applicationInfo.descriptionId >= 0).assertTrue();
                expect(datainfo.applicationInfo.icon).assertEqual("$media:icon");
                expect(datainfo.applicationInfo.iconId >= 0).assertTrue();
                expect(datainfo.applicationInfo.label).assertEqual("$string:app_name");
                expect(datainfo.applicationInfo.labelId >= 0).assertTrue();
                expect(datainfo.applicationInfo.systemApp).assertEqual(false);
                expect(datainfo.applicationInfo.supportedModes).assertEqual(0);
                expect(datainfo.orientation).assertEqual(2);
                expect(datainfo.applicationInfo.enabled).assertEqual(true);
                for (let j = 0; j < datainfo.applicationInfo.moduleInfos.length; j++) {
                    expect(datainfo.applicationInfo.moduleInfos[j].moduleName).assertEqual("entry");
                }
                queryResultCount++;
            }
            if (datainfo.bundleName == NAME4) {
                expect(datainfo.name).assertEqual("com.example.myapplication.MainAbility");
                expect(datainfo.bundleName).assertEqual(NAME4);
                expect(datainfo.orientation).assertEqual(demo.DisplayOrientation.UNSPECIFIED);
                queryResultCount++;
            }
            if (datainfo.bundleName == NAME5) {
                expect(datainfo.name).assertEqual("com.example.myapplication.MainAbility");
                expect(datainfo.bundleName).assertEqual(NAME5);
                expect(datainfo.orientation).assertEqual(demo.DisplayOrientation.FOLLOW_RECENT);
                queryResultCount++;
            }
        }
        expect(queryResultCount).assertEqual(3);
    }

    /**
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_0640
     * @tc.name testQueryAbilityByWantNotExistHapPromise
     * @tc.desc Test queryAbilityByWant interfaces with one hap. (by promise)
     */
    it('testQueryAbilityByWantNotExistHapPromise', 0, async function (done) {
        await demo.queryAbilityByWant(
            {
                "bundleName": "wrong name",
                "abilityName": "com.example.myapplication1.MainAbility"
            }, demo.BundleFlag.GET_BUNDLE_DEFAULT, userId).then(datainfo => {
                console.info("testQueryAbilityByWantNotExistHapPromise dataInfo : ===========" + datainfo);
                expect(datainfo).assertFail();
                done();
            }).catch(err => {
                console.info("testQueryAbilityByWantNotExistHapPromise err : ===========" + err);
                expect(err).assertEqual(1);
                done();
            })
    })

    /**
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_0660
     * @tc.name testQueryAbilityByWantNotExistHapCallback
     * @tc.desc Test queryAbilityByWant interfaces with one hap. (by callback)
     */
    it('testQueryAbilityByWantNotExistHapCallback', 0, async function (done) {
        await demo.queryAbilityByWant(
            {
                "bundleName": "wrong name",
                "abilityName": "com.example.myapplication1.MainAbility"
            }, demo.BundleFlag.GET_BUNDLE_DEFAULT, userId, (err, datainfo) => {
                if (err) {
                    console.info("testQueryAbilityByWantNotExistHapCallback err : ===========" + err);
                    expect(err).assertEqual(1);
                    done();
                    return;
                }
                console.info("testQueryAbilityByWantNotExistHapCallback dataInfo : ===========" + datainfo);
                expect(datainfo).assertFail();
                done();
            })
    })

    /**
    * @tc.number Sub_Bms_Framework_Query_AbilityInfo_0560
    * @tc.name testQueryAbilityByWantSystemHapPromise
    * @tc.desc Test queryAbilityByWant interfaces with system hap. (by promise)
    */
    it('testQueryAbilityByWantSystemHapPromise', 0, async function (done) {
        await demo.queryAbilityByWant(
            {
                bundleName: "wrong name",
                abilityName: "wrong name",
            }, 0, userId).then(datainfo => {
                console.info("testQueryAbilityByWantSystemHapPromise dataInfo : ===========" + datainfo);
                expect(datainfo.length).assertLarger(0);
                done();
            }).catch(err => {
                console.info("testQueryAbilityByWantSystemHapPromise err : ===========" + err);
                expect(err).assertEqual(1);
                done();
            })
    })

    /**
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_0700
     * @tc.name testQueryAbilityByWantSystemHapCallback
     * @tc.desc Test queryAbilityByWant interfaces with system hap. (by callback)
     */
    it('testQueryAbilityByWantSystemHapCallback', 0, async function (done) {
        demo.queryAbilityByWant(                                  
            {
                bundleName: "wrong name",
                abilityName: "wrong name",
            }, 0, userId, OnReceiveEvent);

        function OnReceiveEvent(err, datainfo) {
            console.info("testQueryAbilityByWantSystemHapCallback err : ===========" + err);
            console.info("testQueryAbilityByWantSystemHapCallback dataInfo : ===========" + datainfo);
            expect(err).assertEqual(1);
            expect(datainfo.length).assertLarger(0);
            done();
        }
    })

    /**
    * @tc.number installErrCodeTest_0100
    * @tc.name InstallErrorCode::STATUS_FAILED_NO_SPACE_LEFT
    * @tc.desc Test install errcode STATUS_FAILED_NO_SPACE_LEFT.
    */
    it('installErrCodeTest_0100', 0, async function (done) {
        expect(demo.InstallErrorCode.SUCCESS).assertEqual(0);
        expect(demo.InstallErrorCode.STATUS_INSTALL_FAILURE).assertEqual(1);
        expect(demo.InstallErrorCode.STATUS_INSTALL_FAILURE_ABORTED).assertEqual(2);
        expect(demo.InstallErrorCode.STATUS_INSTALL_FAILURE_INVALID).assertEqual(3);
        expect(demo.InstallErrorCode.STATUS_INSTALL_FAILURE_CONFLICT).assertEqual(4);
        expect(demo.InstallErrorCode.STATUS_INSTALL_FAILURE_STORAGE).assertEqual(5);
        expect(demo.InstallErrorCode.STATUS_INSTALL_FAILURE_INCOMPATIBLE).assertEqual(6);
        expect(demo.InstallErrorCode.STATUS_UNINSTALL_FAILURE).assertEqual(7);
        expect(demo.InstallErrorCode.STATUS_UNINSTALL_FAILURE_BLOCKED).assertEqual(8);
        expect(demo.InstallErrorCode.STATUS_UNINSTALL_FAILURE_ABORTED).assertEqual(9);
        expect(demo.InstallErrorCode.STATUS_UNINSTALL_FAILURE_CONFLICT).assertEqual(10);
        expect(demo.InstallErrorCode.STATUS_INSTALL_FAILURE_DOWNLOAD_TIMEOUT).assertEqual(11);
        expect(demo.InstallErrorCode.STATUS_INSTALL_FAILURE_DOWNLOAD_FAILED).assertEqual(12);
        expect(demo.InstallErrorCode.STATUS_RECOVER_FAILURE_INVALID).assertEqual(13);
        expect(demo.InstallErrorCode.STATUS_ABILITY_NOT_FOUND).assertEqual(64);
        expect(demo.InstallErrorCode.STATUS_BMS_SERVICE_ERROR).assertEqual(65);
        expect(demo.InstallErrorCode.STATUS_FAILED_NO_SPACE_LEFT).assertEqual(66);
        expect(demo.InstallErrorCode.STATUS_GRANT_REQUEST_PERMISSIONS_FAILED).assertEqual(67);
        expect(demo.InstallErrorCode.STATUS_INSTALL_PERMISSION_DENIED).assertEqual(68);
        expect(demo.InstallErrorCode.STATUS_UNINSTALL_PERMISSION_DENIED).assertEqual(69);
        done();
    })

    /**
    * @tc.number AbilityTypeTest_0100
    * @tc.name InstallErrorCode::STATUS_FAILED_NO_SPACE_LEFT
    * @tc.desc Test install errcode STATUS_FAILED_NO_SPACE_LEFT.
    */
    it('AbilityTypeTest_0100', 0, async function (done) {
        expect(demo.AbilitySubType.CA).assertEqual(1);
        expect(demo.AbilityType.UNKNOWN).assertEqual(0);
        expect(demo.AbilityType.SERVICE).assertEqual(2);
        expect(demo.AbilityType.DATA).assertEqual(3);
        expect(demo.ColorMode.AUTO_MODE).assertEqual(-1);
        expect(demo.ColorMode.DARK_MODE).assertEqual(0);
        expect(demo.ColorMode.LIGHT_MODE).assertEqual(1);
        done();
    })
})

}
