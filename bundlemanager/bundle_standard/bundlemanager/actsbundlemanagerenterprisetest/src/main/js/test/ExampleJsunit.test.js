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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
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



    function checkBundleInfo0200(datainfo) {
        console.info("testGetBundeInfoReqPermissionCallback dataInfo ====" + datainfo);
        expect(datainfo.name).assertEqual(NAME1);
        expect(datainfo.vendor).assertEqual("example");
        expect(datainfo.versionCode).assertEqual(VERSIONCODE1);
        expect(datainfo.versionName).assertEqual("1.0");
        expect(datainfo.entryModuleName).assertEqual("entry");
        expect(datainfo.compatibleVersion).assertEqual(12);
        expect(datainfo.targetVersion).assertLarger(11);
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
        expect(datainfo.targetVersion).assertLarger(11);
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
     * @tc.name   testGetAllApplicationInfoPromise
     * @tc.number Sub_Bms_Framework_Query_AppInfo_0840
     * @tc.desc   Test getApplicationInfos interfaces with one hap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetAllApplicationInfoPromise', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async function (done) {
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
     * @tc.name   testGetAllApplicationInfoCallback
     * @tc.number Sub_Bms_Framework_Query_AppInfo_0940
     * @tc.desc   Test getApplicationInfos interfaces with one hap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetAllApplicationInfoCallback', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
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
     * @tc.name   testGetAllBundleInfoPromise
     * @tc.number Sub_Bms_Framework_Query_AppInfo_2460
     * @tc.desc   Test getBundleInfos interfaces with one hap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetAllBundleInfoPromise', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async function (done) {
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
     * @tc.name   testGetAllBundleInfoCallback
     * @tc.number Sub_Bms_Framework_Query_AppInfo_2560
     * @tc.desc   Test getBundleInfos interfaces with one hap.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetAllBundleInfoCallback', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
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
     * @tc.name   testGetAllApplicationInfoTwoHapPromise
     * @tc.number Sub_Bms_Framework_Query_AppInfo_0860
     * @tc.desc   Test getApplicationInfos interfaces with two haps.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetAllApplicationInfoTwoHapPromise', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
        let datainfo = await demo.getAllApplicationInfo(demo.BundleFlag.GET_APPLICATION_INFO_WITH_PERMISSION, userId);
        console.info("==========ActsBmsGetInfosSecondScene is ==========" + JSON.stringify(datainfo));
        checkgetApplicationInfos(datainfo);
        done();
    })

    /**
     * @tc.name   testGetAllApplicationInfoDifferentParamPromise
     * @tc.number Sub_Bms_Framework_Query_AppInfo_0900
     * @tc.desc   Test getApplicationInfos interfaces with two haps and different param.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetAllApplicationInfoDifferentParamPromise', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
        let datainfo = await demo.getAllApplicationInfo(demo.BundleFlag.GET_BUNDLE_DEFAULT, userId);
        expect(datainfo.length).assertLarger(0);
        checkgetApplicationInfos(datainfo);
        done();
    })

    /**
     * @tc.name   testGetAllApplicationInfoTwoHapCallback
     * @tc.number Sub_Bms_Framework_Query_AppInfo_0960
     * @tc.desc   Test getApplicationInfos interfaces with two haps.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetAllApplicationInfoTwoHapCallback', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
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
     * @tc.name   testGetAllApplicationInfoThereHapCallback
     * @tc.number Sub_Bms_Framework_Query_AppInfo_0980
     * @tc.desc   Test getApplicationInfos interfaces with three haps.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetAllApplicationInfoThereHapCallback', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
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
     * @tc.name   testGetAllApplicationInfoDifferentParamCallback
     * @tc.number Sub_Bms_Framework_Query_AppInfo_1000
     * @tc.desc   Test getApplicationInfos interfaces with two haps and different param.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetAllApplicationInfoDifferentParamCallback', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
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
     * @tc.name   testGetAllBundleInfoTwoHapPromise
     * @tc.number Sub_Bms_Framework_Query_AppInfo_2480
     * @tc.desc   Test getBundleInfos interfaces with two haps.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetAllBundleInfoTwoHapPromise', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
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
     * @tc.name   testGetAllBundleInfoTwoHapDifferentParamPromise
     * @tc.number Sub_Bms_Framework_Query_AppInfo_2520
     * @tc.desc   Test getBundleInfos interfaces with two haps and different param.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetAllBundleInfoTwoHapDifferentParamPromise', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
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
     * @tc.name   testGetAllBundleInfoTwoHapCallback
     * @tc.number Sub_Bms_Framework_Query_AppInfo_2580
     * @tc.desc   Test getBundleInfos interfaces with two haps.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetAllBundleInfoTwoHapCallback', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
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
     * @tc.name   testGetAllBundleInfoTwoHapDifferentParamCallback
     * @tc.number Sub_Bms_Framework_Query_AppInfo_2620
     * @tc.desc   Test getBundleInfos interfaces with two haps and different param.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetAllBundleInfoTwoHapDifferentParamCallback', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
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
     * @tc.name   testGetAllBundleInfoThereHapPromise
     * @tc.number Sub_Bms_Framework_Query_AppInfo_2500
     * @tc.desc   Test getBundleInfos interfaces with three haps.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetAllBundleInfoThereHapPromise', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
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
     * @tc.name   testGetAllBundleInfoThereHapDifferentParamPromise
     * @tc.number Sub_Bms_Framework_Query_AppInfo_2540
     * @tc.desc   Test getBundleInfos interfaces with three haps and different param.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetAllBundleInfoThereHapDifferentParamPromise', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
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
     * @tc.name   testGetAllBundleInfoThereHapCallback
     * @tc.number Sub_Bms_Framework_Query_AppInfo_2600
     * @tc.desc   Test getBundleInfos interfaces with three haps.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetAllBundleInfoThereHapCallback', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
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



})

}
