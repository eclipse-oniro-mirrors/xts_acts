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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "@ohos/hypium"
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
         * @tc.name   getApplicationInfosUnPermission
         * @tc.number Sub_Bms_Framework_Query_AppInfo_1080
         * @tc.desc   test getAllApplicationInfo
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('getApplicationInfosUnPermission', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async function (done) {
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
         * @tc.name   getApplicationInfosUnPermissionWithUserIdPromise
         * @tc.number Sub_Bms_Framework_Query_AppInfo_1090
         * @tc.desc   test getAllApplicationInfo with userId Promise (no permission)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('getApplicationInfosUnPermissionWithUserIdPromise', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async function (done) {
            await bundle.getAllApplicationInfo(DEFAULT_FLAG, userId).then(data => {
                expect().assertFail();
            }).catch(err => {
                expect(err.code).assertEqual(INVALID_CODE);
            });
            done();
        });

        /**
         * @tc.name   getApplicationInfosUnPermissionWithUserIdCallback
         * @tc.number Sub_Bms_Framework_Query_AppInfo_1100
         * @tc.desc   test getAllApplicationInfo with userId callback (no permission)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('getApplicationInfosUnPermissionWithUserIdCallback', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async function (done) {
            bundle.getAllApplicationInfo(DEFAULT_FLAG, userId, (err, data) => {
                if (err) {
                    console.info('getApplicationInfosUnPermissionWithUserIdCallback err:' + JSON.stringify(err));
                    expect(err.code).assertEqual(INVALID_CODE);
                    done();
                    return;
                }
                console.info('getApplicationInfosUnPermissionWithUserIdCallback success:' + JSON.stringify(data));
                expect().assertFail();
                done();
            });
        });

        /**
         * @tc.name   getApplicationInfosUnPermissionWithoutUserIdCallback
         * @tc.number Sub_Bms_Framework_Query_AppInfo_1110
         * @tc.desc   test getAllApplicationInfo without userId callback (no permission)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('getApplicationInfosUnPermissionWithoutUserIdCallback', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async function (done) {
            bundle.getAllApplicationInfo(DEFAULT_FLAG, (err, data) => {
                if (err) {
                    console.info('getApplicationInfosUnPermissionWithoutUserIdCallback err:' + JSON.stringify(err));
                    expect(err.code).assertEqual(INVALID_CODE);
                    done();
                    return;
                }
                console.info('getApplicationInfosUnPermissionWithoutUserIdCallback success:' + JSON.stringify(data));
                expect().assertFail();
                done();
            });
        });

        /**
         * @tc.name   getBundleInfoUnPermission
         * @tc.number Sub_Bms_Framework_Query_AppInfo_2340
         * @tc.desc   test getBundleInfo
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('getBundleInfoUnPermission', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async function (done) {
            await bundle.getBundleInfo(BUNDLE_NAME_OTHER, DEFAULT_FLAG, { userId: userId }).then(data => {
                expect().assertFail();
            }).catch(err => {
                expect(err).assertEqual(INVALID_CODE);
            });
            await bundle.getBundleInfo(BUNDLE_NAME_OTHER, DEFAULT_FLAG).then(data => {
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
         * @tc.name   getAllBundleInfoUnPermissionWithUserIdPromise
         * @tc.number Sub_Bms_Framework_Query_AppInfo_2350
         * @tc.desc   test getAllBundleInfo with userId Promise (no permission)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('getAllBundleInfoUnPermissionWithUserIdPromise', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async function (done) {
            await bundle.getAllBundleInfo(DEFAULT_FLAG, userId).then(data => {
                expect().assertFail();
            }).catch(err => {
                expect(err).assertEqual(INVALID_CODE);
            });
            done();
        });

        /**
         * @tc.name   getAllBundleInfoUnPermissionWithUserIdCallback
         * @tc.number Sub_Bms_Framework_Query_AppInfo_2360
         * @tc.desc   test getAllBundleInfo with userId callback (no permission)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('getAllBundleInfoUnPermissionWithUserIdCallback', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async function (done) {
            bundle.getAllBundleInfo(DEFAULT_FLAG, userId, (err, data) => {
                if (err) {
                    console.info('getAllBundleInfoUnPermissionWithUserIdCallback err:' + JSON.stringify(err));
                    expect(err).assertEqual(INVALID_CODE);
                    done();
                    return;
                }
                console.info('getAllBundleInfoUnPermissionWithUserIdCallback success:' + JSON.stringify(data));
                expect().assertFail();
                done();
            });
        });

        /**
         * @tc.name   getAllBundleInfoUnPermissionWithoutUserIdCallback
         * @tc.number Sub_Bms_Framework_Query_AppInfo_2370
         * @tc.desc   test getAllBundleInfo without userId callback (no permission)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('getAllBundleInfoUnPermissionWithoutUserIdCallback', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async function (done) {
            bundle.getAllBundleInfo(DEFAULT_FLAG, (err, data) => {
                if (err) {
                    console.info('getAllBundleInfoUnPermissionWithoutUserIdCallback err:' + JSON.stringify(err));
                    expect(err).assertEqual(INVALID_CODE);
                    done();
                    return;
                }
                console.info('getAllBundleInfoUnPermissionWithoutUserIdCallback success:' + JSON.stringify(data));
                expect().assertFail();
                done();
            });
        });

        /**
         * @tc.name   getApplicationInfoUnPermission
         * @tc.number Sub_Bms_Framework_Query_AppInfo_0540
         * @tc.desc   test getApplicationInfo
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('getApplicationInfoUnPermission', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async function (done) {
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
	
	/**
         * @tc.name   getApplicationInfoUnPermissionx
         * @tc.number Sub_Bms_Framework_Query_AppInfo_05400
         * @tc.desc   test getApplicationInfo
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('getApplicationInfoUnPermissionx', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async function (done) { 
            bundle.getApplicationInfo(BUNDLE_NAME_OTHER, DEFAULT_FLAG, userId, (err, data) => {
	         if (err) {
                     console.info('getApplicationInfoUnPermissionx err:' + JSON.stringify(err));
                     expect(err.code).assertEqual(INVALID_CODE);
                     done();
                     return;
                 }
                console.info('getApplicationInfoUnPermissionx success:' + JSON.stringify(data));
                expect().assertFail();
                done()    
            });
        });

        /**
         * @tc.name   hasInstalledUnPermissionSelf
         * @tc.number Sub_Bms_Framework_Status_Query_1100
         * @tc.desc   test hasInstalled without permission
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('hasInstalledUnPermissionSelf', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async function (done) {
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

        /**
         * @tc.name   hasInstalledUnPermissionOther
         * @tc.number Sub_Bms_Framework_Status_Query_1200
         * @tc.desc   test hasInstalled without permission
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('hasInstalledUnPermissionOther', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
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

        /**
         * @tc.name   getAbilityIconUnPermission
         * @tc.number Sub_Bms_Framework_Query_Icon_0600
         * @tc.desc   test getAbilityIcon without permission
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('getAbilityIconUnPermission', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
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

        /**
         * @tc.name   getAbilityInfoUnPermissionSelf
         * @tc.number Sub_Bms_Framework_Query_AbilityInfo_2580
         * @tc.desc   test getAbilityInfo
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('getAbilityInfoUnPermissionSelf', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
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


        /**
         * @tc.name   getAbilityInfoUnPermissionOtherBundlename
         * @tc.number Sub_Bms_Framework_Query_AbilityInfo_2590
         * @tc.desc   test getAbilityInfo
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
           it('getAbilityInfoUnPermissionOtherBundlename', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
            await bundle.getAbilityInfo(BUNDLE_NAME_OTHER, ABILITIY_NAME_OTHER).then(res => {
                console.info('actwsBundleManagerx getAbilityInfo promise success res:' + JSON.stringify(res));
                expect().assertFail();
            }).catch(err => {
                expect(err).assertEqual(1);
            });
            bundle.getAbilityInfo(BUNDLE_NAME_OTHER, ABILITIY_NAME_OTHER, (err, res) => {
                if (err) {
                    expect(err).assertEqual(1);
                    done();
                    return;
                }
                console.info('actwsBundleManagexr getAbilityInfo callback success res:' + JSON.stringify(res));
                expect().assertFail();
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
            expect(info.entryDir).assertEqual("");
            expect(info.supportedModes).assertEqual(0);
            expect(info.process).assertEqual("com.example.actsbmsetsunpermissiontest");
            expect(info.moduleSourceDirs.length).assertEqual(0);
            expect(info.enabled).assertEqual(true);
            expect(info.uid).assertLarger(0);
            expect(info.entityType).assertEqual("unspecified");
            expect(info.removable).assertEqual(true);
            console.info("checkApplicationInfo end !!!");
        }

        /**
         * @tc.name   queryAbilityByWantUnPermissionWithUserIdPromise
         * @tc.number Sub_Bms_Framework_Query_AbilityInfo_6200
         * @tc.desc   test queryAbilityByWant without permission (by promise with userId)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('queryAbilityByWantUnPermissionWithUserIdPromise', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
            await bundle.queryAbilityByWant({
                action: "action_a"
            }, DEFAULT_FLAG, userId).then(res => {
                console.info('queryAbilityByWantUnPermissionWithUserIdPromise success:' + JSON.stringify(res));
                expect().assertFail();
            }).catch(err => {
                console.info('queryAbilityByWantUnPermissionWithUserIdPromise err:' + JSON.stringify(err));
                expect(err).assertEqual(INVALID_CODE);
            });
            done();
        });

        /**
         * @tc.name   queryAbilityByWantUnPermissionWithUserIdCallback
         * @tc.number Sub_Bms_Framework_Query_AbilityInfo_6210
         * @tc.desc   test queryAbilityByWant without permission (by callback with userId)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('queryAbilityByWantUnPermissionWithUserIdCallback', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
            bundle.queryAbilityByWant({
                action: "action_a"
            }, DEFAULT_FLAG, userId, (err, data) => {
                if (err) {
                    console.info('queryAbilityByWantUnPermissionWithUserIdCallback err:' + JSON.stringify(err));
                    expect(err).assertEqual(INVALID_CODE);
                    done();
                    return;
                }
                console.info('queryAbilityByWantUnPermissionWithUserIdCallback success:' + JSON.stringify(data));
                expect().assertFail();
                done();
            });
        });

        /**
         * @tc.name   queryAbilityByWantUnPermissionWithoutUserIdCallback
         * @tc.number Sub_Bms_Framework_Query_AbilityInfo_6220
         * @tc.desc   test queryAbilityByWant without permission (by callback without userId)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('queryAbilityByWantUnPermissionWithoutUserIdCallback', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
            bundle.queryAbilityByWant({
                action: "action_a"
            }, DEFAULT_FLAG, (err, data) => {
                if (err) {
                    console.info('queryAbilityByWantUnPermissionWithoutUserIdCallback err:' + JSON.stringify(err));
                    expect(err).assertEqual(INVALID_CODE);
                    done();
                    return;
                }
                console.info('queryAbilityByWantUnPermissionWithoutUserIdCallback success:' + JSON.stringify(data));
                expect().assertFail();
                done();
            });
        });
	
		
    })
}
