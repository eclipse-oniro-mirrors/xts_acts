/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permission and
 * limitations under the License.
 */


import { describe, beforeAll, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium'
import abilityAccessCtrl from '@ohos.abilityAccessCtrl'
import bundleManager from '@ohos.bundle.bundleManager'

var PermissionFlag = {
    PERMISSION_USER_SET: 1,
    PERMISSION_USER_FIXED: 2,
    PERMISSION_SYSTEM_FIXED: 4
};

var GrantStatus = {
    PERMISSION_DENIED: -1,
    PERMISSION_GRANTED: 0,
};
const RESULT_SUCCESS = 0;
const RESULT_FAIL = -1;
const ERR_PARAM_INVALID = 12100001;

const DEFAULT_PERMISSION_FALG = 0;
var permissionNameUser = "ohos.permission.DISTRIBUTED_DATASYNC";
var permissionNameSystem = "ohos.permission.GET_BUNDLE_INFO";
var tokenID = undefined;
export default function AccessTokenTest() {
    describe('AccessTokenTest', function () {
        console.info('##########start AccessTokenTest');
        beforeAll(async function (done) {
            let bundleFlags = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
            console.info('AccessTokenTest bundleFlags is: ' + bundleFlags);
            try {
                bundleManager.getBundleInfoForSelf(bundleFlags).then((data) => {
                    console.info('AccessTokenTest data is: ' + JSON.stringify(data));
                    tokenID = data.appInfo.accessTokenId;
                    console.info('AccessTokenTest tokenID is: ' + data.appInfo.accessTokenId);
                    done();
                }).catch((err) => {
                    console.info('AccessTokenTest getBundleInfoForSelf err is: ' + err.code);
                })
            } catch (error) {
                console.info('AccessTokenTest getBundleInfoForSelf error is: ' + error.code)
            }
        })
        afterEach(function () {
        })

        /**
         * @tc.name   Test_verifyAccessToken_001
         * @tc.number Test_verifyAccessToken_001
         * @tc.desc   After the installation, user_grant permission is not granted by default(Promise).
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('Test_verifyAccessToken_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("Test_verifyAccessToken_001 start");
            var atManager = abilityAccessCtrl.createAtManager();
            var result = await atManager.verifyAccessToken(tokenID, permissionNameUser);
            console.info("Test_verifyAccessToken_001 tokenID" + tokenID + "-" + result)
            expect(result).assertEqual(GrantStatus.PERMISSION_DENIED);

            done();
        })

        /**
         * @tc.name   Test_verifyAccessToken_002
         * @tc.number Test_verifyAccessToken_002
         * @tc.desc   After the installation, system_grant permission is granted by default(Promise).
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('Test_verifyAccessToken_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info("Test_verifyAccessToken_002 start");
            var atManager = abilityAccessCtrl.createAtManager();
            var result = await atManager.verifyAccessToken(tokenID, permissionNameSystem);
            console.info("Test_verifyAccessToken_002 tokenID" + tokenID + "-" + result)
            expect(result).assertEqual(GrantStatus.PERMISSION_GRANTED);

            done();
        })

        /**
         * @tc.name   Test_verifyAccessToken_003
         * @tc.number Test_verifyAccessToken_003
         * @tc.desc   Test invalid TokenID(0)(Promise).
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('Test_verifyAccessToken_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("Test_verifyAccessToken_003 start");
            var atManager = abilityAccessCtrl.createAtManager();
            var result = await atManager.verifyAccessToken(0, permissionNameUser);
            console.info("Test_verifyAccessToken_003 tokenID" + tokenID + "-" + result)
            expect(result).assertEqual(GrantStatus.PERMISSION_DENIED);

            done();
        })

        /**
         * @tc.name   Test_verifyAccessToken_004
         * @tc.number Test_verifyAccessToken_004
         * @tc.desc   Test invalid permission(empty)(Promise).
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('Test_verifyAccessToken_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("Test_verifyAccessToken_004 start");
            var atManager = abilityAccessCtrl.createAtManager();
            var result = await atManager.verifyAccessToken(tokenID, "");
            console.info("Test_verifyAccessToken_004 tokenID" + tokenID + "-" + result)
            expect(result).assertEqual(GrantStatus.PERMISSION_DENIED);

            done();
        })

        /**
         * @tc.name   Test_verifyAccessToken_005
         * @tc.number Test_verifyAccessToken_005
         * @tc.desc   Test invalid permission(length exceeds 256)(Promise).
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('Test_verifyAccessToken_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("Test_verifyAccessToken_005 start");
            var atManager = abilityAccessCtrl.createAtManager();
            var permissionName = "ohos.permission.testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest"
                + "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest"
                + "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest";

            var result = await atManager.verifyAccessToken(tokenID, permissionName);
            console.info("Test_verifyAccessToken_005 tokenID" + tokenID + "-" + result)
            expect(result).assertEqual(GrantStatus.PERMISSION_DENIED);

            done();
        })

        /**
         * @tc.name   Test_verifyAccessToken_006
         * @tc.number Test_verifyAccessToken_006
         * @tc.desc   Test Error tokenID(Promise).
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('Test_verifyAccessToken_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("Test_verifyAccessToken_006 start");
            var atManager = abilityAccessCtrl.createAtManager();
            var permissionName = "ohos.permission.GRANT_SENSITIVE_PERMISSIONS";

            var result = await atManager.verifyAccessToken(1111111111, permissionName);
            console.info("Test_verifyAccessToken_006 tokenID" + tokenID + "-" + result)
            expect(result).assertEqual(GrantStatus.PERMISSION_DENIED);

            done();
        })

        /**
         * @tc.name   Test_verifyAccessToken_007
         * @tc.number Test_verifyAccessToken_007
         * @tc.desc   Test Error permission(Promise).
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('Test_verifyAccessToken_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("Test_verifyAccessToken_007 start");
            var atManager = abilityAccessCtrl.createAtManager();
            var permissionName = "ohos.permission.GRANT_SENSITIVE_PERMISSIO";

            var result = await atManager.verifyAccessToken(tokenID, permissionName);
            console.info("Test_verifyAccessToken_007 tokenID" + tokenID + "-" + result)
            expect(result).assertEqual(GrantStatus.PERMISSION_DENIED);

            done();
        })

        /**
         * @tc.name   Test_verifyAccessTokenSync_000
         * @tc.number Test_verifyAccessTokenSync_0000
         * @tc.desc   Test verifyAccessTokenSync, After the installation, user_grant permission is not granted by default.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('Test_verifyAccessTokenSync_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
            console.info("Test_verifyAccessTokenSync_000 start");
            var atManager = abilityAccessCtrl.createAtManager();
            var result = atManager.verifyAccessTokenSync(tokenID, permissionNameUser);
            console.info("Test_verifyAccessTokenSync_000 tokenID" + tokenID + "-" + result)
            expect(result).assertEqual(GrantStatus.PERMISSION_DENIED);
        })

        /**
         * @tc.name   Test_verifyAccessTokenSync_001
         * @tc.number Test_verifyAccessTokenSync_0100
         * @tc.desc   Test verifyAccessTokenSync, After the installation, system_grant permission is granted by default.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('Test_verifyAccessTokenSync_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, function () {
            console.info("Test_verifyAccessTokenSync_001 start");
            var atManager = abilityAccessCtrl.createAtManager();
            var result = atManager.verifyAccessTokenSync(tokenID, permissionNameSystem);
            console.info("Test_verifyAccessTokenSync_001 tokenID" + tokenID + "-" + result)
            expect(result).assertEqual(GrantStatus.PERMISSION_GRANTED);
        })

        /**
         * @tc.name   Test_verifyAccessTokenSync_002
         * @tc.number Test_verifyAccessTokenSync_0200
         * @tc.desc   Test verifyAccessTokenSync, invalid TokenID(0).
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Test_verifyAccessTokenSync_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function () {
            console.info("Test_verifyAccessTokenSync_002 start");
            var atManager = abilityAccessCtrl.createAtManager();
            try {
                atManager.verifyAccessTokenSync(0, permissionNameUser);
            } catch (error) {
                console.info("Test_verifyAccessTokenSync_002 tokenID" + JSON.stringify(error))
                expect(error.code).assertEqual(ERR_PARAM_INVALID);
            }
        })

        /**
         * @tc.name   Test_verifyAccessTokenSync_003
         * @tc.number Test_verifyAccessTokenSync_0300
         * @tc.desc   Test verifyAccessTokenSync, invalid permission(empty).
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('Test_verifyAccessTokenSync_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
            console.info("Test_verifyAccessTokenSync_003 start");
            var atManager = abilityAccessCtrl.createAtManager();
            try {
                atManager.verifyAccessTokenSync(tokenID, "");
            } catch (error) {
                console.info("Test_verifyAccessTokenSync_003 tokenID" + JSON.stringify(error))
                expect(error.code).assertEqual(ERR_PARAM_INVALID);
            }
        })

        /**
         * @tc.name   Test_verifyAccessTokenSync_004
         * @tc.number Test_verifyAccessTokenSync_0400
         * @tc.desc   Test verifyAccessTokenSync, invalid permission(length exceeds 256).
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('Test_verifyAccessTokenSync_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
            console.info("Test_verifyAccessTokenSync_004 start");
            var atManager = abilityAccessCtrl.createAtManager();
            var permissionName = "ohos.permission.testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest"
                + "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest"
                + "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest";

            try {
                atManager.verifyAccessTokenSync(tokenID, permissionName);
            } catch (error) {
                console.info("Test_verifyAccessTokenSync_004 tokenID" + JSON.stringify(error))
                expect(error.code).assertEqual(ERR_PARAM_INVALID);
            }
        })

        /**
         * @tc.name   Test_verifyAccessTokenSync_005
         * @tc.number Test_verifyAccessTokenSync_0500
         * @tc.desc   Test Error tokenID(Promise).
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('Test_verifyAccessTokenSync_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
            console.info("Test_verifyAccessTokenSync_005 start");
            var atManager = abilityAccessCtrl.createAtManager();
            var permissionName = "ohos.permission.GRANT_SENSITIVE_PERMISSIONS";

            try {
                atManager.verifyAccessTokenSync(1111111111, permissionName);
            } catch (error) {
                console.info("Test_verifyAccessTokenSync_005 tokenID" + JSON.stringify(error))
                expect(error.code).assertEqual(ERR_PARAM_INVALID);
            }
        })

        /**
         * @tc.name   Test_verifyAccessTokenSync_006
         * @tc.number Test_verifyAccessTokenSync_0600
         * @tc.desc   Test Error permission(Promise).
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('Test_verifyAccessTokenSync_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, function () {
            console.info("Test_verifyAccessTokenSync_006 start");
            var atManager = abilityAccessCtrl.createAtManager();
            var permissionName = "ohos.permission.GRANT_SENSITIVE_PERMISSIO";

            try {
                atManager.verifyAccessTokenSync(tokenID, permissionName);
            } catch (error) {
                console.info("Test_verifyAccessTokenSync_006 tokenID" + JSON.stringify(error))
                expect(error.code).assertEqual(ERR_PARAM_INVALID);
            }
        })

        /**
         * @tc.name   Test_checkAccessToken_001
         * @tc.number Test_checkAccessToken_001
         * @tc.desc   After the installation, user_grant permission is not granted by default(Promise).
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('Test_checkAccessToken_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("Test_checkAccessToken_001 start");
            var atManager = abilityAccessCtrl.createAtManager();
            try {
                atManager.checkAccessToken(tokenID, permissionNameUser);
            } catch (error) {
                console.info("Test_checkAccessToken_001 tokenID" + JSON.stringify(error))
                expect(error.code).assertEqual(ERR_PARAM_INVALID);
            }
            done();
        })

        /**
         * @tc.name   Test_checkAccessToken_002
         * @tc.number Test_checkAccessToken_002
         * @tc.desc   After the installation, system_grant permission is granted by default(Promise).
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('Test_checkAccessToken_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("Test_checkAccessToken_002 start");
            var atManager = abilityAccessCtrl.createAtManager();
            try {
                var result = await atManager.checkAccessToken(tokenID, permissionNameSystem);
                console.info("Test_checkAccessToken_002 tokenID" + tokenID + "-" + result)
                expect(result).assertEqual(GrantStatus.PERMISSION_GRANTED);
            } catch (error) {
                console.info("Test_checkAccessToken_002 error code" + error.code + "error message" + error.message);
            }

            done();
        })

        /**
         * @tc.name   Test_checkAccessToken_003
         * @tc.number Test_checkAccessToken_003
         * @tc.desc   Test invalid TokenID(0)(Promise).
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('Test_checkAccessToken_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("Test_checkAccessToken_003 start");
            var atManager = abilityAccessCtrl.createAtManager();
            try {
                atManager.checkAccessToken(0, permissionNameUser)
            } catch (err) {
                expect(err.code).assertEqual(ERR_PARAM_INVALID);
            }

            done();
        })

        /**
         * @tc.name   Test_checkAccessToken_004
         * @tc.number Test_checkAccessToken_004
         * @tc.desc   Test invalid permission(empty)(Promise).
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('Test_checkAccessToken_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("Test_checkAccessToken_004 start");
            var atManager = abilityAccessCtrl.createAtManager();
            try {
                atManager.checkAccessToken(tokenID, "")
            } catch (err) {
                expect(err.code).assertEqual(ERR_PARAM_INVALID);
            }

            done();
        })

        /**
         * @tc.name   Test_checkAccessToken_005
         * @tc.number Test_checkAccessToken_005
         * @tc.desc   Test invalid permission(length exceeds 256)(Promise).
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('Test_checkAccessToken_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("Test_checkAccessToken_005 start");
            var atManager = abilityAccessCtrl.createAtManager();
            var permissionName = "ohos.permission.testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest"
                + "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest"
                + "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest";

            try {
                atManager.checkAccessToken(tokenID, permissionName)
            } catch (err) {
                expect(err.code).assertEqual(ERR_PARAM_INVALID);
            }

            done();
        })

        /**
         * @tc.name   Test_checkAccessToken_006
         * @tc.number Test_checkAccessToken_006
         * @tc.desc   After the installation, user_grant permission is not granted by default(Promise).
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('Test_checkAccessToken_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("Test_checkAccessToken_006 start");
            var atManager = abilityAccessCtrl.createAtManager();
            try {
                atManager.checkAccessToken(tokenID, permissionNameUser);
            } catch (error) {
                console.info("Test_checkAccessToken_006 tokenID" + JSON.stringify(error))
                expect(error.code).assertEqual(GrantStatus.PERMISSION_DENIED);
            }
            done();
        })

        /**
         * @tc.name   Test_checkAccessToken_007
         * @tc.number Test_checkAccessToken_007
         * @tc.desc   Test Error tokenID(Promise).
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('Test_checkAccessToken_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("Test_checkAccessToken_007 start");
            var atManager = abilityAccessCtrl.createAtManager();
            var permissionName = "ohos.permission.GRANT_SENSITIVE_PERMISSIONS";

            try {
                atManager.checkAccessToken(1111111111, permissionName)
            } catch (err) {
                expect(err.code).assertEqual(ERR_PARAM_INVALID);
            }

            done();
        })

        /**
         * @tc.name   Test_checkAccessToken_008
         * @tc.number Test_checkAccessToken_008
         * @tc.desc   Test Error permission(Promise).
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('Test_checkAccessToken_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("Test_checkAccessToken_008 start");
            var atManager = abilityAccessCtrl.createAtManager();
            var permissionName = "ohos.permission.GRANT_SENSITIVE_PERMISSIO";

            try {
                atManager.checkAccessToken(tokenID, permissionName)
            } catch (err) {
                expect(err.code).assertEqual(ERR_PARAM_INVALID);
            }

            done();
        })

        /**
         * @tc.name   Test_checkAccessTokenSync_001
         * @tc.number Test_checkAccessTokenSync_001
         * @tc.desc   After the installation, user_grant permission is not granted by default(Promise).
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('Test_checkAccessTokenSync_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("Test_checkAccessTokenSync_001 start");
            var atManager = abilityAccessCtrl.createAtManager();
            try {
                var result = atManager.checkAccessTokenSync(tokenID, permissionNameUser);
                expect(result).assertEqual(RESULT_FAIL);
                done();
            } catch (err) {
                console.info("Test_checkAccessTokenSync_001 tokenID" + JSON.stringify(err))
            }
        })

        /**
         * @tc.name   Test_checkAccessTokenSync_002
         * @tc.number Test_checkAccessTokenSync_002
         * @tc.desc   After the installation, system_grant permission is granted by default(Promise).
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('Test_checkAccessTokenSync_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("Test_checkAccessTokenSync_002 start");
            var atManager = abilityAccessCtrl.createAtManager();
            try {
                var result = atManager.checkAccessTokenSync(tokenID, permissionNameSystem);
                console.info("Test_checkAccessTokenSync_002 tokenID" + tokenID + "-" + result)
                expect(result).assertEqual(GrantStatus.PERMISSION_GRANTED);
                done();
            } catch (err) {
                console.info("Test_checkAccessTokenSync_002 error code" + err.code + "error message" + err.message);
            }
        })

        /**
         * @tc.name   Test_checkAccessTokenSync_003
         * @tc.number Test_checkAccessTokenSync_003
         * @tc.desc   Test invalid TokenID(0)(Promise).
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('Test_checkAccessTokenSync_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("Test_checkAccessTokenSync_003 start");
            var atManager = abilityAccessCtrl.createAtManager();
            try {
                atManager.checkAccessTokenSync(0, permissionNameUser)
            } catch (err) {
                expect(err.code).assertEqual(ERR_PARAM_INVALID);
                done();
            }
        })

        /**
         * @tc.name   Test_checkAccessTokenSync_004
         * @tc.number Test_checkAccessTokenSync_004
         * @tc.desc   Test invalid permission(empty)(Promise).
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('Test_checkAccessTokenSync_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("Test_checkAccessTokenSync_004 start");
            var atManager = abilityAccessCtrl.createAtManager();
            try {
                atManager.checkAccessTokenSync(tokenID, "")
            } catch (err) {
                expect(err.code).assertEqual(ERR_PARAM_INVALID);
                done();
            }
        })

        /**
         * @tc.name   Test_checkAccessTokenSync_005
         * @tc.number Test_checkAccessTokenSync_005
         * @tc.desc   Test invalid permission(length exceeds 256)(Promise).
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('Test_checkAccessTokenSync_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("Test_checkAccessTokenSync_005 start");
            var atManager = abilityAccessCtrl.createAtManager();
            var permissionName = "ohos.permission.testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest"
                + "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest"
                + "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest";

            try {
                atManager.checkAccessTokenSync(tokenID, permissionName)
            } catch (err) {
                expect(err.code).assertEqual(ERR_PARAM_INVALID);
                done();
            }
        })

        /**
         * @tc.name   Test_checkAccessTokenSync_006
         * @tc.number Test_checkAccessTokenSync_006
         * @tc.desc   Test Error tokenID(Promise).
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('Test_checkAccessTokenSync_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("Test_checkAccessTokenSync_006 start");
            var atManager = abilityAccessCtrl.createAtManager();
            var permissionName = "ohos.permission.GRANT_SENSITIVE_PERMISSIONS";

            try {
                var result = atManager.checkAccessTokenSync(1111111111, permissionName)
                expect(result).assertEqual(RESULT_FAIL);
                done();
            } catch (err) {
                console.info("Test_checkAccessTokenSync_006 tokenID" + JSON.stringify(err))
            }
        })

        /**
         * @tc.name   Test_checkAccessTokenSync_007
         * @tc.number Test_checkAccessTokenSync_007
         * @tc.desc   Test Error permission(Promise).
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('Test_checkAccessTokenSync_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("Test_checkAccessTokenSync_007 start");
            var atManager = abilityAccessCtrl.createAtManager();
            var permissionName = "ohos.permission.GRANT_SENSITIVE_PERMISSIO";

            try {
                var result = atManager.checkAccessTokenSync(tokenID, permissionName)
                expect(result).assertEqual(RESULT_FAIL);
                done();
            } catch (err) {
                console.info("Test_checkAccessTokenSync_007 tokenID" + JSON.stringify(err))
            }
        })

        /**
         * @tc.name   Test_requestPermissionsFromUser_001
         * @tc.number Test_requestPermissionsFromUser_0100
         * @tc.desc   RequestPermissionsFromUser normal scenario(Promise).
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('Test_requestPermissionsFromUser_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("Test_requestPermissionsFromUser_001 start");
            var atManager = abilityAccessCtrl.createAtManager();
            try {
                atManager.requestPermissionsFromUser(this.context, ["ohos.permission.CAMERA"]).then((data) => {
                    console.info("data:" + JSON.stringify(data));
                    console.info("data permissions:" + data.permissions);
                    console.info("data authResults:" + data.authResults);
                    console.info("data dialogShownResults: " + data.dialogShownResults);
                    console.info("data errorReasons: " + data.errorReasons);
                    expect(data.authResults).assertEqual(0);
                }).catch((err) => {
                    console.info("data:" + JSON.stringify(err));
                })
            } catch (err) {
                console.log(`Test_requestPermissionsFromUser_001 catch err->${JSON.stringify(err)}`);
            }
            done();
        })


        /**
         * @tc.name   Test_requestPermissionsFromUser_002
         * @tc.number Test_requestPermissionsFromUser_0200
         * @tc.desc   Exception scenario use case(Promise).
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('Test_requestPermissionsFromUser_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("Test_requestPermissionsFromUser_002 start");
            var atManager = abilityAccessCtrl.createAtManager();
            console.info("Test_requestPermissionsFromUser_002 start");
            try {
                var result = atManager.requestPermissionsFromUser(this.context, ["abc"]).then((data) => {
                    console.info("data:" + JSON.stringify(data));
                    console.info("data permissions:" + data.permissions);
                    console.info("data authResults:" + data.authResults);
                    console.info("data dialogShownResults: " + data.dialogShownResults);
                    console.info("data errorReasons: " + data.errorReasons);
                }).catch((err) => {
                    console.info("data:" + JSON.stringify(err));
                })
            } catch (err) {
                console.log("Test_requestPermissionsFromUser_002 catch err" + err.code + "message" + err.message);
                expect(result).assertEqual(undefined);
            }
            done();
        })

        /**
         * @tc.name   Test_requestPermissionsFromUser_003
         * @tc.number Test_requestPermissionsFromUser_0300
         * @tc.desc   RequestPermissionsFromUser normal scenario(callback).
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('Test_requestPermissionsFromUser_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("Test_requestPermissionsFromUser_003 start");
            var atManager = abilityAccessCtrl.createAtManager();
            try {
                atManager.requestPermissionsFromUser(this.context, ["ohos.permission.CAMERA"], (err, data) => {
                    console.info("data:" + JSON.stringify(data));
                    console.info("data permissions:" + data.permissions);
                    console.info("data authResults:" + data.authResults);
                    console.info("data dialogShownResults: " + data.dialogShownResults);
                    console.info("data errorReasons: " + data.errorReasons);
                    expect(data.authResults).assertEqual(0);
                });
            } catch (err) {
                console.log(`Test_requestPermissionsFromUser_003 catch err->${JSON.stringify(err)}`);
            }
            done();
        })

        /**
         * @tc.name   Test_requestPermissionsFromUser_004
         * @tc.number Test_requestPermissionsFromUser_0400
         * @tc.desc   Exception scenario use case(callback).
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('Test_requestPermissionsFromUser_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("Test_requestPermissionsFromUser_004 start ");
            var atManager = abilityAccessCtrl.createAtManager();
            try {
                var result = atManager.requestPermissionsFromUser(this.context, ["a"], (err, data) => {
                    console.info("data:" + JSON.stringify(data));
                    console.info("data permissions:" + data.permissions);
                    console.info("data authResults:" + data.authResults);
                    console.info("data dialogShownResults: " + data.dialogShownResults);
                    console.info("data errorReasons: " + data.errorReasons);
                });
            } catch (err) {
                console.log(`Test_requestPermissionsFromUser_004 catch err->${JSON.stringify(err)}`);
                expect(result).assertEqual(undefined);
            }
            done();
        })


        /**
         * @tc.name   Test_requestPermissionOnSetting_001
         * @tc.number Test_requestPermissionOnSetting_0100
         * @tc.desc   requestPermissionOnSetting Permissions.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('Test_requestPermissionOnSetting_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("Test_requestPermissionOnSetting_001 start ");
            let atManager = abilityAccessCtrl.createAtManager();
            let permissionList = 'ohos.permission.CAMERA';
            try {
                atManager.requestPermissionOnSetting(0, permissionList).then((data) => {
                    console.info('Test_requestPermissionOnSetting_001 data is:' + JSON.stringify(data));
                }).catch((err) => {
                    console.info('Test_requestPermissionOnSetting_001 err.code:' + err.code + JSON.stringify(err));
                });
            } catch (error) {
                console.info('Test_requestPermissionOnSetting_001 error.code: ' + error.code);
                expect(error.code).assertEqual(401);
                done();
            }
        })

        /**
         * @tc.name   Test_requestPermissionOnSetting_002
         * @tc.number Test_requestPermissionOnSetting_0200
         * @tc.desc   requestPermissionOnSetting Permissions no context.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('Test_requestPermissionOnSetting_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("Test_requestPermissionOnSetting_002 start ");
            let atManager = abilityAccessCtrl.createAtManager();
            let permissionList = 'ohos.permission.CAMERA';
            try {
                atManager.requestPermissionOnSetting(permissionList).then((data) => {
                    console.info('Test_requestPermissionOnSetting_002 data is:' + JSON.stringify(data));
                }).catch((err) => {
                    console.info('Test_requestPermissionOnSetting_002 err.code:' + err.code + JSON.stringify(err));
                });
            } catch (error) {
                console.info('Test_requestPermissionOnSetting_002 error.code: ' + error.code);
                expect(error.code).assertEqual(401);
                done();
            }
        })

        /**
         * @tc.name   Test_requestPermissionOnSetting_003
         * @tc.number Test_requestPermissionOnSetting_0300
         * @tc.desc   requestPermissionOnSetting Permissions no permissionList.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('Test_requestPermissionOnSetting_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("Test_requestPermissionOnSetting_003 start ");
            let atManager = abilityAccessCtrl.createAtManager();
            try {
                atManager.requestPermissionOnSetting(0).then((data) => {
                    console.info('Test_requestPermissionOnSetting_003 data is:' + JSON.stringify(data));
                }).catch((err) => {
                    console.info('Test_requestPermissionOnSetting_003 err.code:' + err.code + JSON.stringify(err));
                });
            } catch (error) {
                console.info('Test_requestPermissionOnSetting_003 error.code: ' + error.code);
                expect(error.code).assertEqual(401);
                done();
            }
        })

        /**
         * @tc.name   Test_requestPermissionOnSetting_004
         * @tc.number Test_requestPermissionOnSetting_0400
         * @tc.desc   requestPermissionOnSetting Permissions Abnormal parameter type.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('Test_requestPermissionOnSetting_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("Test_requestPermissionOnSetting_004 start ");
            let atManager = abilityAccessCtrl.createAtManager();
            try {
                atManager.requestPermissionOnSetting(0, 1).then((data) => {
                    console.info('Test_requestPermissionOnSetting_004 data is:' + JSON.stringify(data));
                }).catch((err) => {
                    console.info('Test_requestPermissionOnSetting_004 err.code:' + err.code + JSON.stringify(err));
                });
            } catch (error) {
                console.info('Test_requestPermissionOnSetting_004 error.code: ' + error.code);
                expect(error.code).assertEqual(401);
                done();
            }
        })

        /**
         * @tc.name   Test_requestPermissionOnSetting_005
         * @tc.number Test_requestPermissionOnSetting_0500
         * @tc.desc   requestPermissionOnSetting Permissions Abnormal parameter type.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('Test_requestPermissionOnSetting_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("Test_requestPermissionOnSetting_005 start ");
            let atManager = abilityAccessCtrl.createAtManager();
            let permissionList = 'ohos.permission.TEST';
            try {
                atManager.requestPermissionOnSetting(0, permissionList).then((data) => {
                    console.info('Test_requestPermissionOnSetting_005 data is:' + JSON.stringify(data));
                }).catch((err) => {
                    console.info('Test_requestPermissionOnSetting_005 err.code:' + err.code + JSON.stringify(err));
                });
            } catch (error) {
                console.info('Test_requestPermissionOnSetting_005 error.code: ' + error.code);
                expect(error.code).assertEqual(401);
                done();
            }
        })

        /**
         * @tc.name   Test_requestGlobalSwitch_001
         * @tc.number Test_requestGlobalSwitch_0100
         * @tc.desc   requestGlobalSwitch Permissions.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('Test_requestGlobalSwitch_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("Test_requestGlobalSwitch_001 start ");
            let atManager = abilityAccessCtrl.createAtManager();
            try {
                atManager.requestGlobalSwitch('', null).then((data) => {
                    console.info('Test_requestGlobalSwitch_001 data:' + data);
                }).catch((err) => {
                    console.error('Test_requestGlobalSwitch_001 err.code:' + err.code + JSON.stringify(err));
                });
            } catch (error) {
                console.info('Test_requestGlobalSwitch_001 error.code: ' + error.code);
                expect(error.code).assertEqual(401);
                done();
            }
        })

        /**
         * @tc.name   Test_requestGlobalSwitch_002
         * @tc.number Test_requestGlobalSwitch_0200
         * @tc.desc   requestGlobalSwitch Permissions Abnormal parameter type undefined.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('Test_requestGlobalSwitch_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("Test_requestGlobalSwitch_002 start ");
            let atManager = abilityAccessCtrl.createAtManager();
            try {
                atManager.requestGlobalSwitch('', undefined).then((data) => {
                    console.info('Test_requestGlobalSwitch_002 data:' + data);
                }).catch((err) => {
                    console.error('Test_requestGlobalSwitch_002 err.code:' + err.code + JSON.stringify(err));
                });
            } catch (error) {
                console.info('Test_requestGlobalSwitch_002 error.code: ' + error.code);
                expect(error.code).assertEqual(401);
                done();
            }
        })

        /**
         * @tc.name   Test_requestGlobalSwitch_003
         * @tc.number Test_requestGlobalSwitch_0300
         * @tc.desc   requestGlobalSwitch Permissions Abnormal parameter type [].
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('Test_requestGlobalSwitch_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("Test_requestGlobalSwitch_003 start ");
            let atManager = abilityAccessCtrl.createAtManager();
            try {
                atManager.requestGlobalSwitch(0, []).then((data) => {
                    console.info('Test_requestGlobalSwitch_003 data:' + data);
                }).catch((err) => {
                    console.error('Test_requestGlobalSwitch_003 err.code:' + err.code + JSON.stringify(err));
                });
            } catch (error) {
                console.info('Test_requestGlobalSwitch_003 error.code: ' + error.code);
                expect(error.code).assertEqual(401);
                done();
            }
        })

        /**
         * @tc.name   Test_requestGlobalSwitch_004
         * @tc.number Test_requestGlobalSwitch_0400
         * @tc.desc   requestGlobalSwitch Permissions Abnormal parameter type ''.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it('Test_requestGlobalSwitch_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info("Test_requestGlobalSwitch_004 start ");
            let atManager = abilityAccessCtrl.createAtManager();
            try {
                atManager.requestGlobalSwitch('', '').then((data) => {
                    console.info('Test_requestGlobalSwitch_004 data:' + data);
                }).catch((err) => {
                    console.error('Test_requestGlobalSwitch_004 err.code:' + err.code + JSON.stringify(err));
                });
            } catch (error) {
                console.info('Test_requestGlobalSwitch_004 error.code: ' + error.code);
                expect(error.code).assertEqual(401);
                done();
            }
        })

        /**
         * @tc.name   Test_SwitchType_001
         * @tc.number Test_SwitchType_0100
         * @tc.desc   abilityAccessCtrl SwitchType CAMERA
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("Test_SwitchType_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function (done) {
            console.info('----------------------Test_SwitchType_001---------------------------');
            let value = abilityAccessCtrl.SwitchType.CAMERA;
            console.info('Test_SwitchType_001 value is: ' + value);
            expect(value).assertEqual(0);
            done();
        })

        /**
         * @tc.name   Test_SwitchType_002
         * @tc.number Test_SwitchType_0200
         * @tc.desc   abilityAccessCtrl SwitchType MICROPHONE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("Test_SwitchType_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function (done) {
            console.info('----------------------Test_SwitchType_002---------------------------');
            let value = abilityAccessCtrl.SwitchType.MICROPHONE;
            console.info('Test_SwitchType_002 value is: ' + value);
            expect(value).assertEqual(1);
            done();
        })

        /**
         * @tc.name   Test_SwitchType_003
         * @tc.number Test_SwitchType_0300
         * @tc.desc   abilityAccessCtrl SwitchType LOCATION
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("Test_SwitchType_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function (done) {
            console.info('----------------------Test_SwitchType_003---------------------------');
            let value = abilityAccessCtrl.SwitchType.LOCATION;
            console.info('Test_SwitchType_003 value is: ' + value);
            expect(value).assertEqual(2);
            done();
        })

        /**
         * @tc.name   SUB_Security_AccessToken_OnTest_0100
         * @tc.number SUB_Security_AccessToken_OnTest_0100
         * @tc.desc   Test on,Subscription Permission Change
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL3
         */
        it("SUB_Security_AccessToken_OnTest_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
            console.info('SUB_Security_AccessToken_OnTest_0100 start');
            let atManager = abilityAccessCtrl.createAtManager();
            let callbackFlag = 0;
            let permissionList = ["ohos.permission.CAMERA"];
            let type = 'selfPermissionStateChange';

            function waitDone() {
                try {
                    atManager.off(type, permissionList);
                    console.info('SUB_Security_AccessToken_OnTest_0100 off success');
                }
                catch (err) {
                    console.error('SUB_Security_AccessToken_OnTest_0100 off' + err.code);
                }
                expect(callbackFlag).assertEqual(1);
                done();
            }

            function permissionChangeCallback(data) {
                expect(data.change).assertEqual(abilityAccessCtrl.PermissionStateChangeType.PERMISSION_REVOKED_OPER);
                expect(data.tokenID).assertEqual(tokenID);
                expect(data.permissionName).assertEqual(permissionList[0]);
            }
            try {
                atManager.on(type, permissionList, permissionChangeCallback);
                callbackFlag = 1;
                console.info('SUB_Security_AccessToken_OnTest_0100 on success');
                waitDone()
            } catch (error) {
                console.error('SUB_Security_AccessToken_OnTest_0100 error' + error.message + 'error.code' + error.code);
            }
        })

        /**
         * @tc.name   SUB_Security_AccessToken_On_PROTest_0100
         * @tc.number SUB_Security_AccessToken_On_PROTest_0100
         * @tc.desc   Test PermissionStateChangeType const PERMISSION_REVOKED_OPER
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_Security_AccessToken_On_PROTest_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('----------------------SUB_Security_AccessToken_On_PROTest_0100---------------------------');
            let value = abilityAccessCtrl.PermissionStateChangeType.PERMISSION_REVOKED_OPER;
            console.info('SUB_Security_AccessToken_On_PROTest_0100 value is: ' + value);
            expect(value).assertEqual(0);
            done();
        })

        /**
         * @tc.name   SUB_Security_AccessToken_On_PGOTest_0200
         * @tc.number SUB_Security_AccessToken_On_PGOTest_0200
         * @tc.desc   Test PermissionStateChangeType const PERMISSION_GRANTED_OPER
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_Security_AccessToken_On_PGOTest_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            console.info('----------------------SUB_Security_AccessToken_On_PGOTest_0200---------------------------');
            let value = abilityAccessCtrl.PermissionStateChangeType.PERMISSION_GRANTED_OPER;
            console.info('SUB_Security_AccessToken_On_PGOTest_0200 value is: ' + value);
            expect(value).assertEqual(1);
            done();
        })
    })
}
