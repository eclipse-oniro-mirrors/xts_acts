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
import { describe, beforeAll, it, expect, TestType, Size, Level  } from '@ohos/hypium'

const BUNDLE_NAME1 = 'com.example.bmsaccesstoken1';
const BUNDLE_NAME2 = 'com.example.bmsaccesstoken2';
const BUNDLE_NAME3 = 'com.example.bmsaccesstoken3';
let userId = 0;

export default function ActsBmsAccessTokenTest() {
    describe('ActsBmsAccessTokenTest', function () {

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
         * @tc.name   getAccessTokenIdOfEntry
         * @tc.number Sub_Bms_Framework_Query_AppInfo_7540
         * @tc.desc   get the accessTokenId
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('getAccessTokenIdOfEntry', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async function (done) {
            await bundle.getApplicationInfo(BUNDLE_NAME1, bundle.BundleFlag.GET_BUNDLE_DEFAULT, userId)
                .then(applicationInfo => {
                    console.info('accessTokenId: ' + applicationInfo.accessTokenId);
                    console.info('getAccessTokenIdOfEntry=> ' + JSON.stringify(applicationInfo));
                    expect(applicationInfo.name).assertEqual("");
                    expect(applicationInfo.accessTokenId).assertEqual(0);
                    done();
                }).catch((err) => {
                    expect(err).assertFail();
                    done();
                });
        });

        /**
         * @tc.name   getReqPermissionOfEntry
         * @tc.number Sub_Bms_Framework_Query_AppInfo_6200
         * @tc.desc   get the reqPermissions and reqPermissionStates
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('getReqPermissionOfEntry', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async function (done) {
            await bundle.getBundleInfo(BUNDLE_NAME3, bundle.BundleFlag.GET_BUNDLE_WITH_REQUESTED_PERMISSION)
                .then(bundleInfo => {
                    console.info('getReqPermissionOfEntry=> ' + JSON.stringify(bundleInfo));
                    expect(bundleInfo.name).assertEqual("");
                    expect(bundleInfo.reqPermissions.length).assertEqual(0);
                    expect(bundle.GrantStatus.PERMISSION_DENIED).assertEqual(-1);
                    expect(bundle.GrantStatus.PERMISSION_GRANTED).assertEqual(0)
                    done();
                }).catch((err) => {
                    expect(err).assertFail();
                    done();
                });
        });

        /**
         * @tc.name   getReqPermissionUpdateEntry
         * @tc.number Sub_Bms_Framework_Permission_Query_0300
         * @tc.desc   get the reqPermissions and reqPermissionStates
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('getReqPermissionUpdateEntry', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async function (done) {
            await bundle.getBundleInfo(BUNDLE_NAME2, bundle.BundleFlag.GET_BUNDLE_WITH_REQUESTED_PERMISSION)
                .then(bundleInfo => {
                    expect(bundleInfo.name).assertEqual("");
                    expect(bundleInfo.reqPermissions.length).assertEqual(0);
                    done();
                }).catch((err) => {
                    expect(err).assertFail();
                    done();
                });
        });

        /**
         * @tc.name   getReqPermissionUpdateEntryAndFeature
         * @tc.number Sub_Bms_Framework_Query_AppInfo_6240
         * @tc.desc   get the reqPermissions and reqPermissionStates
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('getReqPermissionUpdateEntryAndFeature', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async function (done) {
            await bundle.getBundleInfo(BUNDLE_NAME1, bundle.BundleFlag.GET_BUNDLE_WITH_REQUESTED_PERMISSION)
                .then(bundleInfo => {
                    expect(bundleInfo.name).assertEqual("");
                    expect(bundleInfo.reqPermissions.length).assertEqual(0);
                    expect(bundleInfo.reqPermissionStates.length).assertEqual(0);
                    done();
                }).catch((err) => {
                    expect(err).assertFail();
                    done();
                });
        });

        /**
         * @tc.name   getAccessTokenIdWithDefault
         * @tc.number Sub_Bms_Framework_Query_AppInfo_7560
         * @tc.desc   Test getBundleInfos interfaces with with a flag
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("getAccessTokenIdWithDefault", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
            await bundle.getApplicationInfo(BUNDLE_NAME1, bundle.BundleFlag.GET_BUNDLE_DEFAULT)
                .then((applicationInfo) => {
                    console.info("getAccessTokenIdWithDefault accessTokenId: " + applicationInfo.accessTokenId);
                    expect(applicationInfo.name).assertEqual("");
                    expect(applicationInfo.accessTokenId).assertEqual(0);
                    done();
                }).catch((err) => {
                    expect(err).assertFail();
                    done();
                });
        });

        /**
         * @tc.name   getAccessTokenIdWithGetAbilities
         * @tc.number Sub_Bms_Framework_Query_AppInfo_7580
         * @tc.desc   Test getBundleInfos interfaces with a flag
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("getAccessTokenIdWithGetAbilities", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
            await bundle.getApplicationInfo(BUNDLE_NAME1, bundle.BundleFlag.GET_BUNDLE_WITH_ABILITIES)
                .then((applicationInfo) => {
                    console.info("getAccessTokenIdWithGetAbilities accessTokenId: " + applicationInfo.accessTokenId);
                    expect(applicationInfo.name).assertEqual("");
                    expect(applicationInfo.accessTokenId).assertEqual(0);
                    done();
                }).catch((err) => {
                    expect(err).assertFail();
                    done();
                });
        });

        /**
         * @tc.name   getAccessTokenIdWithGetPermission
         * @tc.number Sub_Bms_Framework_Query_AppInfo_7600
         * @tc.desc   Test getBundleInfos interfaces with a flag
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("getAccessTokenIdWithGetPermission", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async function (done) {
            await bundle.getApplicationInfo(BUNDLE_NAME1, bundle.BundleFlag.GET_APPLICATION_INFO_WITH_PERMISSION)
                .then((applicationInfo) => {
                    console.info("getAccessTokenIdWithGetPermission accessTokenId: " + applicationInfo.accessTokenId);
                    expect(applicationInfo.name).assertEqual("");
                    expect(applicationInfo.accessTokenId).assertEqual(0);
                    done();
                }).catch((err) => {
                    expect(err).assertFail();
                    done();
                });
        });

    });
}
