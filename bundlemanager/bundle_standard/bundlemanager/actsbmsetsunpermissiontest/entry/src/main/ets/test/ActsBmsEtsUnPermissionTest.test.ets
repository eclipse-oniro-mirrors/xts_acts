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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "hypium/index"
import bundle from '@ohos.bundle'
import pkg from '@system.package'
import account from '@ohos.account.osAccount'

const DEFAULT_FLAG = bundle.BundleFlag.GET_BUNDLE_DEFAULT;
const INVALID_CODE = 1;
const SELF_BUNDLENAME = "com.example.actsbmsetsunpermissiontest";
const SELF_ABILITYNAME = "com.example.actsbmsetsunpermissiontest.MainAbility";
const BUNDLE_NAME_OTHER = "com.example.myapplication1";
const ABILITIY_NAME_OTHER = "com.example.myapplication1.MainAbility";
const BUNDLE_NAME1 = "com.acts.bundle.stage";
const ABILITY_NAME1 = "ExtensionAbility1";
let userId = 0;

export default function actsBmsJsUnPermissionTest() {
    describe('actsBmsJsUnPermissionTest', function () {

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

        /**
        * @tc.number    getApplicationInfos_1300
        * @tc.name      getApplicationInfosUnPermission
        * @tc.desc      test getAllApplicationInfo 
        */
        it('getApplicationInfosUnPermission', 0, async function (done) {
            await bundle.getAllApplicationInfo(DEFAULT_FLAG).then(data => {
                expect().assertFail();
            }).catch(err => {
                expect(err.code).assertEqual(INVALID_CODE);
            });
            bundle.getAllApplicationInfo(DEFAULT_FLAG, (err, data) => {
                expect(err.code).assertEqual(INVALID_CODE);
                expect(data).assertEqual(undefined);
                done();
            });
        });

        /**
        * @tc.number    getBundleInfo_2000
        * @tc.name      getBundleInfoUnPermission
        * @tc.desc      test getBundleInfo
        */
        it('getBundleInfoUnPermission', 0, async function (done) {
            await bundle.getBundleInfo(BUNDLE_NAME_OTHER, DEFAULT_FLAG, { userId: userId }).then(data => {
                expect().assertFail();
            }).catch(err => {
                expect(err).assertEqual(INVALID_CODE);
            });
            bundle.getBundleInfo(BUNDLE_NAME_OTHER, DEFAULT_FLAG, { userId: userId }, (err, data) => {
                expect(err).assertEqual(INVALID_CODE);
                expect(data).assertEqual(undefined);
                done();
            });
        });

        /**
        * @tc.number    getApplicationInfo_1800
        * @tc.name      getApplicationInfoUnPermission
        * @tc.desc      test getApplicationInfo 
        */
        it('getApplicationInfoUnPermission', 0, async function (done) {
            await bundle.getApplicationInfo(BUNDLE_NAME_OTHER, DEFAULT_FLAG).then(data => {
                expect().assertFail();
            }).catch(err => {
                expect(err.code).assertEqual(INVALID_CODE);
            });
            bundle.getApplicationInfo(BUNDLE_NAME_OTHER, DEFAULT_FLAG, (err, data) => {
                expect(err.code).assertEqual(INVALID_CODE);
                expect(data).assertEqual(undefined);
                done();
            });
        });

        /*
         * @tc.number: SUB_BMS_HAP_STATUS_0011
         * @tc.name: hasInstalledUnPermissionSelf
         * @tc.desc: test hasInstalled without permission
        */
        it('hasInstalledUnPermissionSelf', 0, async function (done) {
            let flag = 0;
            pkg.hasInstalled({
                bundleName: SELF_BUNDLENAME,
                success: function success(data) {
                    console.info("get hasInstalled success" + JSON.stringify(data));
                    flag += 1;
                    expect(data.result).assertTrue();
                },
                fail: function fail(data, code) {
                    console.info("get hasInstalled fail" + JSON.stringify(data));
                    expect(data).assertFail();
                },
                complete: function complete() {
                    console.info("get hasInstalled complete");
                    expect(flag).assertEqual(1);
                    done();
                }
            })
        });

        /*
         * @tc.number: SUB_BMS_HAP_STATUS_0012
         * @tc.name: hasInstalledUnPermissionOther
         * @tc.desc: test hasInstalled without permission
        */
        it('hasInstalledUnPermissionOther', 0, async function (done) {
            let flag = 0;
            pkg.hasInstalled({
                bundleName: BUNDLE_NAME_OTHER,
                success: function success(data) {
                    console.info("get hasInstalled success" + JSON.stringify(data));
                    flag += 1;
                    expect(data.result).assertFalse();
                },
                fail: function fail(data, code) {
                    console.info("get hasInstalled fail" + JSON.stringify(data));
                    expect(data).assertFail();
                },
                complete: function complete() {
                    console.info("get hasInstalled complete");
                    expect(flag).assertEqual(1);
                    done();
                }
            })
        });

        /*
         * @tc.number: SUB_BMS_APPINFO_GETABILITYICON_0006
         * @tc.name: getAbilityIconUnPermission
         * @tc.desc: test getAbilityIcon without permission
        */
        it('getAbilityIconUnPermission', 0, async function (done) {
            await bundle.getAbilityIcon(BUNDLE_NAME_OTHER, ABILITIY_NAME_OTHER).then(pixelmap => {
                expect(pixelmap).assertFail();
            }).catch(err => {
                expect(err).assertEqual(1);
            });
            bundle.getAbilityIcon(BUNDLE_NAME_OTHER, ABILITIY_NAME_OTHER, (err, pixelmap) => {
                expect(err).assertEqual(1);
                done();
            });
        });

        /*
         * @tc.number: SUB_BMS_APPINFO_GETABILITYINFO_0008
         * @tc.name: getAbilityInfoUnPermissionSelf
         * @tc.desc: test getAbilityInfo
        */
        it('getAbilityInfoUnPermissionSelf', 0, async function (done) {
            await bundle.getAbilityInfo(SELF_BUNDLENAME, SELF_ABILITYNAME).then(res => {
                console.info('actwsBundleManager getAbilityInfo promise success res:' + JSON.stringify(res));
                for (const item in res) {
                    const a = res[item];
                    console.info(item + ":" + JSON.stringify(a));
                };
                checkAbilityInfo(res);
            }).catch(err => {
                expect(err).assertFail();
            });
            bundle.getAbilityInfo(SELF_BUNDLENAME, SELF_ABILITYNAME, (err, res) => {
                if (err) {
                    expect(err).assertFail();
                    done();
                    return;
                }
                console.info('actwsBundleManager getAbilityInfo callback success res:' + JSON.stringify(res));
                for (const item in res) {
                    const a = res[item];
                    console.info(item + ":" + JSON.stringify(a));
                };
                checkAbilityInfo(res);
                done();
            });
        });

        async function checkAbilityInfo(data) {
            console.info("checkAbilityInfo start !!!");
            expect(data.bundleName).assertEqual("com.example.actsbmsetsunpermissiontest");
            expect(data.name).assertEqual("com.example.actsbmsetsunpermissiontest.MainAbility");
            expect(data.label).assertEqual("$string:entry_MainAbility");
            expect(data.description).assertEqual("$string:description_mainability");
            expect(data.icon).assertEqual("$media:icon");
            expect(data.isVisible).assertEqual(true);
            expect(data.deviceTypes[0]).assertEqual("default");
            expect(data.process).assertEqual("com.example.actsbmsetsunpermissiontest");
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
            checkApplicationInfo(data.applicationInfo);
            console.log("---checkAbilityInfo_other End---  ");
        }

        async function checkApplicationInfo(info) {
            console.info("checkApplicationInfo start !!!");
            expect(info.name).assertEqual("com.example.actsbmsetsunpermissiontest");
            expect(info.codePath).assertEqual("/data/app/el1/bundle/public/com.example.actsbmsetsunpermissiontest");
            expect(info.accessTokenId > 0).assertTrue();
            expect(info.description).assertEqual("");
            expect(info.descriptionId).assertEqual(0);
            expect(info.icon).assertEqual("$media:icon");
            expect(info.iconId > 0).assertTrue();
            expect(info.label).assertEqual("$string:entry_MainAbility");
            expect(info.labelId > 0).assertTrue();
            expect(info.systemApp).assertEqual(false);
            expect(info.entryDir).assertEqual("/data/app/el1/bundle/public/com.example.actsbmsetsunpermissiontest/com.example.actsbmsetsunpermissiontest");
            expect(info.supportedModes).assertEqual(0);
            expect(info.process).assertEqual("com.example.actsbmsetsunpermissiontest");
            expect(info.moduleSourceDirs[0]).assertEqual("/data/app/el1/bundle/public/com.example.actsbmsetsunpermissiontest/com.example.actsbmsetsunpermissiontest");
            expect(info.enabled).assertEqual(true);
            expect(info.uid).assertLarger(0);
            expect(info.entityType).assertEqual("unspecified");
            expect(info.removable).assertEqual(true);
            console.info("checkApplicationInfo end !!!");
        }
    })
}
