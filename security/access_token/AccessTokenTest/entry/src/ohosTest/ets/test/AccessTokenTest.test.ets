/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import { describe, beforeAll, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import bundleManager from '@ohos.bundle.bundleManager';
import { abilityAccessCtrl, Permissions } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';

interface GeneratedObjectLiteralInterface_1 {
  PERMISSION_DENIED: number;
  PERMISSION_GRANTED: number;
}

let GrantStatus: GeneratedObjectLiteralInterface_1 = {
  PERMISSION_DENIED: -1,
  PERMISSION_GRANTED: 0,
};

const ERR_PARAM_INVALID = 12100001;
const ERR_PARAM_ERROR = 401;

let permissionNameUser: Permissions = "ohos.permission.DISTRIBUTED_DATASYNC";
let permissionNameSystem: Permissions = "ohos.permission.GET_BUNDLE_INFO";
let tokenID = 0;

export default function AccessTokenTest() {
  describe('AccessTokenTest', () => {
    console.info('##########start AccessTokenTest');
    beforeAll(async (done: Function) => {
      let bundleFlags = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
      console.info('AccessTokenTest bundleFlags is: ' + bundleFlags);
      try {
        bundleManager.getBundleInfoForSelf(bundleFlags).then((data) => {
          console.info('AccessTokenTest data is: ' + JSON.stringify(data));
          tokenID = data.appInfo.accessTokenId;
          console.info('AccessTokenTest tokenID is: ' + data.appInfo.accessTokenId);
          done();
        }).catch((err: BusinessError) => {
          console.error('AccessTokenTest getBundleInfoForSelf err is: ' + err.code);
        })
      } catch (error) {
        console.error('AccessTokenTest getBundleInfoForSelf error is: ' + error.code);
      }
    })
    afterEach(() => {
    })

    /**
     * @tc.name   Test_verifyAccessToken_001
     * @tc.number Test_verifyAccessToken_001
     * @tc.desc   After the installation, user_grant permission is not granted by default(Promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Test_verifyAccessToken_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info("Test_verifyAccessToken_001 start");
      let atManager = abilityAccessCtrl.createAtManager();
      atManager.verifyAccessToken(tokenID, permissionNameUser).then((data: abilityAccessCtrl.GrantStatus) => {
        console.info("Test_verifyAccessToken_001 tokenID: " + tokenID + " data: " + data);
        expect(data).assertEqual(GrantStatus.PERMISSION_DENIED);
        done();
      }).catch((err: BusinessError) => {
        console.error(`Test_verifyAccessToken_001 fail, err->${JSON.stringify(err)}`);
        expect(false).assertFail();
        done();
      });
    })

    /**
     * @tc.name   Test_verifyAccessToken_002
     * @tc.number Test_verifyAccessToken_002
     * @tc.desc   After the installation, system_grant permission is granted by default(Promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Test_verifyAccessToken_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info("Test_verifyAccessToken_002 start");
      let atManager = abilityAccessCtrl.createAtManager();
      atManager.verifyAccessToken(tokenID, permissionNameSystem).then((data: abilityAccessCtrl.GrantStatus) => {
        console.info("Test_verifyAccessToken_002 tokenID: " + tokenID + " data: " + data);
        expect(data).assertEqual(GrantStatus.PERMISSION_GRANTED);
        done();
      }).catch((err: BusinessError) => {
        console.error(`Test_verifyAccessToken_002 fail, err->${JSON.stringify(err)}`);
        expect(false).assertFail();
        done();
      });
    })

    /**
     * @tc.name   Test_verifyAccessToken_003
     * @tc.number Test_verifyAccessToken_003
     * @tc.desc   Test invalid TokenID(0)(Promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_verifyAccessToken_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("Test_verifyAccessToken_003 start");
      let atManager = abilityAccessCtrl.createAtManager();
      atManager.verifyAccessToken(0, permissionNameUser).then((data: abilityAccessCtrl.GrantStatus) => {
        console.info("Test_verifyAccessToken_003 tokenID: 0, data: " + data);
        expect(data).assertEqual(GrantStatus.PERMISSION_DENIED);
        done();
      }).catch((err: BusinessError) => {
        console.error(`Test_verifyAccessToken_003 fail, err->${JSON.stringify(err)}`);
      });
    })

    /**
     * @tc.name   Test_verifyAccessToken_004
     * @tc.number Test_verifyAccessToken_004
     * @tc.desc   Test invalid permission(empty)(Promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_verifyAccessToken_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("Test_verifyAccessToken_004 start");
      let atManager = abilityAccessCtrl.createAtManager();
      let permissionName: Permissions = "" as Permissions;
      let result = await atManager.verifyAccessToken(tokenID, permissionName);
      console.info("Test_verifyAccessToken_004 tokenID: " + tokenID + " result: " + result);
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
    it('Test_verifyAccessToken_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("Test_verifyAccessToken_005 start");
      let atManager = abilityAccessCtrl.createAtManager();
      let permissionName = "ohos.permission.testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest"
        + "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest"
        +
        "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest" as Permissions;

      let result = await atManager.verifyAccessToken(tokenID, permissionName);
      console.info("Test_verifyAccessToken_005 tokenID: " + tokenID + " result: " + result);
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
    it('Test_verifyAccessToken_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("Test_verifyAccessToken_006 start");
      let atManager = abilityAccessCtrl.createAtManager();
      let permissionName: Permissions = "ohos.permission.GRANT_SENSITIVE_PERMISSIONS";

      atManager.verifyAccessToken(1111111111, permissionName).then((data: abilityAccessCtrl.GrantStatus) => {
        console.info("Test_verifyAccessToken_006 tokenID: 1111111111, data: " + data);
        expect(data).assertEqual(GrantStatus.PERMISSION_DENIED);
        done();
      }).catch((err: BusinessError) => {
        console.error(`Test_verifyAccessToken_006 fail, err->${JSON.stringify(err)}`);
      });

    })

    /**
     * @tc.name   Test_verifyAccessToken_007
     * @tc.number Test_verifyAccessToken_007
     * @tc.desc   Test invalid permission(Promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_verifyAccessToken_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("Test_verifyAccessToken_007 start");
      let atManager = abilityAccessCtrl.createAtManager();
      let permissionName = "ohos.permission.GRANT_SENSITIVE_PERMISSIO" as Permissions;

      let result = await atManager.verifyAccessToken(tokenID, permissionName);
      console.info("Test_verifyAccessToken_007 tokenID: " + tokenID + " result: " + result);
      expect(result).assertEqual(GrantStatus.PERMISSION_DENIED);

      done();
    })

    /**
     * @tc.name   Test_verifyAccessToken_008
     * @tc.number Test_verifyAccessToken_008
     * @tc.desc   Test negative tokenID(Promise), boundary test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_verifyAccessToken_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("Test_verifyAccessToken_008 start");
      let atManager = abilityAccessCtrl.createAtManager();

      atManager.verifyAccessToken(-1, permissionNameUser).then((data: abilityAccessCtrl.GrantStatus) => {
        console.info("Test_verifyAccessToken_008 tokenID: -1 data: " + data);
        expect(data).assertEqual(GrantStatus.PERMISSION_DENIED);
        done();
      }).catch((err: BusinessError) => {
        console.error(`Test_verifyAccessToken_008 fail, err code->${err.code} message->${err.message}`);
        expect(err.code).assertEqual(ERR_PARAM_INVALID);
        done();
      });
    })

    /**
     * @tc.name   Test_verifyAccessToken_009
     * @tc.number Test_verifyAccessToken_009
     * @tc.desc   Test permission length equals 256(Promise), boundary test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_verifyAccessToken_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("Test_verifyAccessToken_009 start");
      let atManager = abilityAccessCtrl.createAtManager();
      let permissionName = "ohos.permission.testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest"
        + "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest" as string;

      let result = await atManager.verifyAccessToken(tokenID, permissionName);
      console.info("Test_verifyAccessToken_009 tokenID: " + tokenID + " result: " + result);
      expect(result).assertEqual(GrantStatus.PERMISSION_DENIED);

      done();
    })

    /**
     * @tc.name   Test_verifyAccessToken_010
     * @tc.number Test_verifyAccessToken_010
     * @tc.desc   Test invalid permission(empty string) with error code 12100001(Promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Test_verifyAccessToken_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("Test_verifyAccessToken_010 start");
      let atManager = abilityAccessCtrl.createAtManager();
      let permissionName: string = "";

      atManager.verifyAccessToken(tokenID, permissionName).then((data: abilityAccessCtrl.GrantStatus) => {
        console.info("Test_verifyAccessToken_010 tokenID: " + tokenID + " data: " + data);
        expect(data).assertEqual(GrantStatus.PERMISSION_DENIED);
        done();
      }).catch((err: BusinessError) => {
        console.error(`Test_verifyAccessToken_010 fail, err code->${err.code} message->${err.message}`);
        expect(err.code).assertEqual(ERR_PARAM_INVALID);
        done();
      });
    })

    /**
     * @tc.name   Test_verifyAccessToken_011
     * @tc.number Test_verifyAccessToken_011
     * @tc.desc   Test invalid permission(empty) with error code 12100001(Promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Test_verifyAccessToken_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("Test_verifyAccessToken_011 start");
      let atManager = abilityAccessCtrl.createAtManager();
      let permissionName: Permissions = "" as Permissions;

      atManager.verifyAccessToken(tokenID, permissionName).then((data: abilityAccessCtrl.GrantStatus) => {
        console.info("Test_verifyAccessToken_011 tokenID: " + tokenID + " data: " + data);
        expect(data).assertEqual(GrantStatus.PERMISSION_DENIED);
        done();
      }).catch((err: BusinessError) => {
        console.error(`Test_verifyAccessToken_011 fail, err code->${err.code} message->${err.message}`);
        expect(err.code).assertEqual(ERR_PARAM_INVALID);
        done();
      });
    })

    /**
     * @tc.name   Test_verifyAccessToken_012
     * @tc.number Test_verifyAccessToken_012
     * @tc.desc   Test invalid permission(length exceeds 256) with error code 12100001(Promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Test_verifyAccessToken_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("Test_verifyAccessToken_012 start");
      let atManager = abilityAccessCtrl.createAtManager();
      let permissionName = "ohos.permission.testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest"
        + "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest"
        + "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest"
        + "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest" as Permissions;

      atManager.verifyAccessToken(tokenID, permissionName).then((data: abilityAccessCtrl.GrantStatus) => {
        console.info("Test_verifyAccessToken_012 tokenID: " + tokenID + " data: " + data);
        expect(data).assertEqual(GrantStatus.PERMISSION_DENIED);
        done();
      }).catch((err: BusinessError) => {
        console.error(`Test_verifyAccessToken_012 fail, err code->${err.code} message->${err.message}`);
        expect(err.code).assertEqual(ERR_PARAM_INVALID);
        done();
      });
    })

    /**
     * @tc.name   Test_verifyAccessToken_013
     * @tc.number Test_verifyAccessToken_013
     * @tc.desc   Test tokenID is null(Promise), expect parameter type error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Test_verifyAccessToken_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("Test_verifyAccessToken_013 start");
      let atManager = abilityAccessCtrl.createAtManager();
      try {
        let testTokenID: number | null = null;
        atManager.verifyAccessToken(testTokenID, permissionNameUser);
        expect(false).assertFail();
        done();
      } catch (err) {
        console.error(`Test_verifyAccessToken_013 catch parameter type error, code->${err.code} message->${err.message}`);
        expect(err.code).assertEqual(ERR_PARAM_ERROR);
        done();
      }
    })

    /**
     * @tc.name   Test_verifyAccessToken_014
     * @tc.number Test_verifyAccessToken_014
     * @tc.desc   Test permissionName is null(Promise), expect parameter type error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Test_verifyAccessToken_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("Test_verifyAccessToken_014 start");
      let atManager = abilityAccessCtrl.createAtManager();
      try {
        let testPermissionName: Permissions | null = null;
        atManager.verifyAccessToken(tokenID, testPermissionName);
        expect(false).assertFail();
        done();
      } catch (err) {
        console.error(`Test_verifyAccessToken_014 catch parameter type error, code->${err.code} message->${err.message}`);
        expect(err.code).assertEqual(ERR_PARAM_ERROR);
        done();
      }
    })

    /**
     * @tc.name   Test_verifyAccessToken_015
     * @tc.number Test_verifyAccessToken_015
     * @tc.desc   Test tokenID is undefined(Promise), expect parameter type error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Test_verifyAccessToken_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("Test_verifyAccessToken_015 start");
      let atManager = abilityAccessCtrl.createAtManager();
      try {
        let testTokenID: number | undefined = undefined;
        atManager.verifyAccessToken(testTokenID, permissionNameUser);
        expect(false).assertFail();
        done();
      } catch (err) {
        console.error(`Test_verifyAccessToken_015 catch parameter type error, code->${err.code} message->${err.message}`);
        expect(err.code).assertEqual(ERR_PARAM_ERROR);
        done();
      }
    })

    /**
     * @tc.name   Test_verifyAccessToken_016
     * @tc.number Test_verifyAccessToken_016
     * @tc.desc   Test permissionName is undefined(Promise), expect parameter type error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Test_verifyAccessToken_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("Test_verifyAccessToken_016 start");
      let atManager = abilityAccessCtrl.createAtManager();
      try {
        let testPermissionName: Permissions | undefined = undefined;
        atManager.verifyAccessToken(tokenID, testPermissionName);
        expect(false).assertFail();
        done();
      } catch (err) {
        console.error(`Test_verifyAccessToken_016 catch parameter type error, code->${err.code} message->${err.message}`);
        expect(err.code).assertEqual(ERR_PARAM_ERROR);
        done();
      }
    })

    /**
     * @tc.name   Test_verifyAccessToken_017
     * @tc.number Test_verifyAccessToken_017
     * @tc.desc   Test permissionName is null(Promise), string type with null value, expect parameter type error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Test_verifyAccessToken_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("Test_verifyAccessToken_017 start");
      let atManager = abilityAccessCtrl.createAtManager();
      try {
        let testPermissionName: string | null = null;
        atManager.verifyAccessToken(tokenID, testPermissionName);
        expect(false).assertFail();
        done();
      } catch (err) {
        console.error(`Test_verifyAccessToken_017 catch parameter type error, code->${err.code} message->${err.message}`);
        expect(err.code).assertEqual(ERR_PARAM_ERROR);
        done();
      }
    })

    /**
     * @tc.name   Test_verifyAccessToken_018
     * @tc.number Test_verifyAccessToken_018
     * @tc.desc   Test permissionName is undefined(Promise), string type with undefined value, expect parameter type error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Test_verifyAccessToken_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("Test_verifyAccessToken_018 start");
      let atManager = abilityAccessCtrl.createAtManager();
      try {
        let testPermissionName: string | undefined = undefined;
        atManager.verifyAccessToken(tokenID, testPermissionName);
        expect(false).assertFail();
        done();
      } catch (err) {
        console.error(`Test_verifyAccessToken_018 catch parameter type error, code->${err.code} message->${err.message}`);
        expect(err.code).assertEqual(ERR_PARAM_ERROR);
        done();
      }
    })

    /**
     * @tc.name   Test_verifyAccessTokenSync_001
     * @tc.number Test_verifyAccessTokenSync_001
     * @tc.desc   Test verifyAccessTokenSync, After the installation, user_grant permission is not granted by default.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_verifyAccessTokenSync_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("Test_verifyAccessTokenSync_001 start");
      let atManager = abilityAccessCtrl.createAtManager();
      try {
        let result = atManager.verifyAccessTokenSync(tokenID, permissionNameUser);
        console.info("Test_verifyAccessTokenSync_001 tokenID: " + tokenID + " result: " + result);
        expect(result).assertEqual(GrantStatus.PERMISSION_DENIED);
        done();
      } catch (error) {
        console.error(`Test_verifyAccessTokenSync_001 catch parameter type error, code->${error.code} message->${error.message}`);
        expect(false).assertFail();
        done();
      }
    })

    /**
     * @tc.name   Test_verifyAccessTokenSync_002
     * @tc.number Test_verifyAccessTokenSync_002
     * @tc.desc   Test verifyAccessTokenSync, After the installation, system_grant permission is granted by default.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Test_verifyAccessTokenSync_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info("Test_verifyAccessTokenSync_002 start");
      let atManager = abilityAccessCtrl.createAtManager();
      let result = atManager.verifyAccessTokenSync(tokenID, permissionNameSystem);
      console.info("Test_verifyAccessTokenSync_002 tokenID: " + tokenID + " result: " + result);
      expect(result).assertEqual(GrantStatus.PERMISSION_GRANTED);
      done();
    })

    /**
     * @tc.name   Test_verifyAccessTokenSync_003
     * @tc.number Test_verifyAccessTokenSync_003
     * @tc.desc   Test verifyAccessTokenSync, invalid TokenID(0).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Test_verifyAccessTokenSync_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("Test_verifyAccessTokenSync_003 start");
      let atManager = abilityAccessCtrl.createAtManager();
      try {
        atManager.verifyAccessTokenSync(0, permissionNameUser);
      } catch (error) {
        console.error("Test_verifyAccessTokenSync_003 error " + JSON.stringify(error));
        expect(error.code).assertEqual(ERR_PARAM_INVALID);
        done();
      }
    })

    /**
     * @tc.name   Test_verifyAccessTokenSync_004
     * @tc.number Test_verifyAccessTokenSync_004
     * @tc.desc   Test Error tokenID(Promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_verifyAccessTokenSync_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("Test_verifyAccessTokenSync_004 start");
      let atManager = abilityAccessCtrl.createAtManager();
      let permissionName: Permissions = "ohos.permission.GRANT_SENSITIVE_PERMISSIONS";

      try {
        let result = atManager.verifyAccessTokenSync(1111111111, permissionName);
        console.info("Test_verifyAccessTokenSync_004 tokenID: " + tokenID + " result: " + result);
        expect(result).assertEqual(GrantStatus.PERMISSION_DENIED);
        done();
      } catch (error) {
        console.error("Test_verifyAccessTokenSync_004 error " + JSON.stringify(error));
        expect(error.code).assertEqual(ERR_PARAM_INVALID);
        done();
      }
    })

    /**
     * @tc.name   Test_verifyAccessTokenSync_005
     * @tc.number Test_verifyAccessTokenSync_005
     * @tc.desc   Test verifyAccessTokenSync, invalid permission(empty).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_verifyAccessTokenSync_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("Test_verifyAccessTokenSync_005 start");
      let atManager = abilityAccessCtrl.createAtManager();
      let permissionName: Permissions = "" as Permissions;

      try {
        let result = atManager.verifyAccessTokenSync(tokenID, permissionName);
        console.info("Test_verifyAccessTokenSync_005 tokenID: " + tokenID + " result: " + result);
        expect(result).assertEqual(GrantStatus.PERMISSION_DENIED);
        done();
      } catch (error) {
        console.error(`Test_verifyAccessTokenSync_005 catch parameter type error, code->${error.code} message->${error.message}`);
        expect(error.code).assertEqual(ERR_PARAM_INVALID);
        done();
      }
    })

    /**
     * @tc.name   Test_verifyAccessTokenSync_006
     * @tc.number Test_verifyAccessTokenSync_006
     * @tc.desc   Test verifyAccessTokenSync, invalid permission(empty).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_verifyAccessTokenSync_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("Test_verifyAccessTokenSync_006 start");
      let atManager = abilityAccessCtrl.createAtManager();
      let permissionName = "ohos.permission.testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest"
        + "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest"
        +
        "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest" as Permissions;

      try {
        let result = atManager.verifyAccessTokenSync(tokenID, permissionName);
        console.info("Test_verifyAccessTokenSync_006 tokenID: " + tokenID + " result: " + result);
        expect(result).assertEqual(GrantStatus.PERMISSION_DENIED);
        done();
      } catch (error) {
        console.error(`Test_verifyAccessTokenSync_006 catch parameter type error, code->${error.code} message->${error.message}`);
        expect(error.code).assertEqual(ERR_PARAM_INVALID);
        done();
      }
    })

    /**
     * @tc.name   Test_verifyAccessTokenSync_007
     * @tc.number Test_verifyAccessTokenSync_007
     * @tc.desc   Test verifyAccessTokenSync, Error permission.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_verifyAccessTokenSync_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("Test_verifyAccessTokenSync_007 start");
      let atManager = abilityAccessCtrl.createAtManager();
      let permissionName = "ohos.permission.GRANT_SENSITIVE_PERMISSIO" as Permissions;

      try {
        let result = atManager.verifyAccessTokenSync(tokenID, permissionName);
        console.info("Test_verifyAccessTokenSync_007 tokenID: " + tokenID + " result: " + result);
        expect(result).assertEqual(GrantStatus.PERMISSION_DENIED);
        done();
      } catch (error) {
        console.error(`Test_verifyAccessTokenSync_007 catch parameter type error, code->${error.code} message->${error.message}`);
        expect(false).assertFail();
        done();
      }
    })

    /**
     * @tc.name   Test_verifyAccessTokenSync_008
     * @tc.number Test_verifyAccessTokenSync_008
     * @tc.desc   Test verifyAccessTokenSync, permission length equals 256, boundary test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_verifyAccessTokenSync_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("Test_verifyAccessTokenSync_008 start");
      let atManager = abilityAccessCtrl.createAtManager();
      let permissionName = "ohos.permission.testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest"
        + "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest"
        + "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest"
        + "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttestX" as Permissions;

      try {
        let result = atManager.verifyAccessTokenSync(tokenID, permissionName);
        console.info("Test_verifyAccessTokenSync_008 tokenID: " + tokenID + " result: " + result);
        expect(result).assertEqual(GrantStatus.PERMISSION_DENIED);
        done();
      } catch (error) {
        console.error(`Test_verifyAccessTokenSync_008 catch parameter type error, code->${error.code} message->${error.message}`);
        expect(error.code).assertEqual(ERR_PARAM_INVALID);
        done();
      }
    })

    /**
     * @tc.name   Test_verifyAccessTokenSync_009
     * @tc.number Test_verifyAccessTokenSync_009
     * @tc.desc   Test verifyAccessTokenSync, negative tokenID, boundary test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_verifyAccessTokenSync_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("Test_verifyAccessTokenSync_009 start");
      let atManager = abilityAccessCtrl.createAtManager();

      try {
        let result = atManager.verifyAccessTokenSync(-1, permissionNameUser);
        console.info("Test_verifyAccessTokenSync_009 tokenID: -1 result: " + result);
        expect(result).assertEqual(GrantStatus.PERMISSION_DENIED);
        done();
      } catch (error) {
        console.error(`Test_verifyAccessTokenSync_009 catch parameter type error, code->${error.code} message->${error.message}`);
        expect(error.code).assertEqual(ERR_PARAM_INVALID);
        done();
      }
    })

    /**
     * @tc.name   Test_verifyAccessTokenSync_010
     * @tc.number Test_verifyAccessTokenSync_010
     * @tc.desc   Test verifyAccessTokenSync, invalid TokenID(0) with error code 12100001.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Test_verifyAccessTokenSync_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("Test_verifyAccessTokenSync_010 start");
      let atManager = abilityAccessCtrl.createAtManager();
      try {
        let result = atManager.verifyAccessTokenSync(0, permissionNameUser);
        console.info("Test_verifyAccessTokenSync_010 tokenID: 0 result: " + result);
      } catch (error) {
        console.error(`Test_verifyAccessTokenSync_010 catch error code->${error.code} message->${error.message}`);
        expect(error.code).assertEqual(ERR_PARAM_INVALID);
        done();
      }
    })

    /**
     * @tc.name   Test_verifyAccessTokenSync_011
     * @tc.number Test_verifyAccessTokenSync_011
     * @tc.desc   Test verifyAccessTokenSync, invalid permission(empty) with error code 12100001.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Test_verifyAccessTokenSync_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("Test_verifyAccessTokenSync_011 start");
      let atManager = abilityAccessCtrl.createAtManager();
      let permissionName: Permissions = "" as Permissions;

      try {
        atManager.verifyAccessTokenSync(tokenID, permissionName);
        expect(false).assertFail();
        done();
      } catch (error) {
        console.error(`Test_verifyAccessTokenSync_011 catch error code->${error.code} message->${error.message}`);
        expect(error.code).assertEqual(ERR_PARAM_INVALID);
        done();
      }
    })

    /**
     * @tc.name   Test_verifyAccessTokenSync_012
     * @tc.number Test_verifyAccessTokenSync_012
     * @tc.desc   Test verifyAccessTokenSync, invalid permission(length exceeds 256) with error code 12100001.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Test_verifyAccessTokenSync_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("Test_verifyAccessTokenSync_012 start");
      let atManager = abilityAccessCtrl.createAtManager();
      let permissionName = "ohos.permission.testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest"
        + "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest"
        + "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest"
        + "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest" as Permissions;

      try {
        atManager.verifyAccessTokenSync(tokenID, permissionName);
        expect(false).assertFail();
        done();
      } catch (error) {
        console.error(`Test_verifyAccessTokenSync_012 catch error code->${error.code} message->${error.message}`);
        expect(error.code).assertEqual(ERR_PARAM_INVALID);
        done();
      }
    })

    /**
     * @tc.name   Test_verifyAccessTokenSync_013
     * @tc.number Test_verifyAccessTokenSync_013
     * @tc.desc   Test verifyAccessTokenSync, tokenID is null, expect parameter type error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Test_verifyAccessTokenSync_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("Test_verifyAccessTokenSync_013 start");
      let atManager = abilityAccessCtrl.createAtManager();
      try {
        let testTokenID: number | null = null;
        atManager.verifyAccessTokenSync(testTokenID, permissionNameUser);
        expect(false).assertFail();
        done();
      } catch (error) {
        console.error(`Test_verifyAccessTokenSync_013 catch parameter type error, code->${error.code} message->${error.message}`);
        expect(error.code).assertEqual(ERR_PARAM_ERROR);
        done();
      }
    })

    /**
     * @tc.name   Test_verifyAccessTokenSync_014
     * @tc.number Test_verifyAccessTokenSync_014
     * @tc.desc   Test verifyAccessTokenSync, permissionName is null, expect parameter type error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Test_verifyAccessTokenSync_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("Test_verifyAccessTokenSync_014 start");
      let atManager = abilityAccessCtrl.createAtManager();
      try {
        let testPermissionName: Permissions | null = null;
        atManager.verifyAccessTokenSync(tokenID, testPermissionName);
        expect(false).assertFail();
        done();
      } catch (error) {
        console.error(`Test_verifyAccessTokenSync_014 catch parameter type error, code->${error.code} message->${error.message}`);
        expect(error.code).assertEqual(ERR_PARAM_ERROR);
        done();
      }
    })

    /**
     * @tc.name   Test_verifyAccessTokenSync_015
     * @tc.number Test_verifyAccessTokenSync_015
     * @tc.desc   Test verifyAccessTokenSync, tokenID is undefined, expect parameter type error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Test_verifyAccessTokenSync_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("Test_verifyAccessTokenSync_015 start");
      let atManager = abilityAccessCtrl.createAtManager();
      try {
        let testTokenID: number | undefined = undefined;
        atManager.verifyAccessTokenSync(testTokenID, permissionNameUser);
        expect(false).assertFail();
        done();
      } catch (error) {
        console.error(`Test_verifyAccessTokenSync_015 catch parameter type error, code->${error.code} message->${error.message}`);
        expect(error.code).assertEqual(ERR_PARAM_ERROR);
        done();
      }
    })

    /**
     * @tc.name   Test_verifyAccessTokenSync_016
     * @tc.number Test_verifyAccessTokenSync_016
     * @tc.desc   Test verifyAccessTokenSync, permissionName is undefined, expect parameter type error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Test_verifyAccessTokenSync_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("Test_verifyAccessTokenSync_016 start");
      let atManager = abilityAccessCtrl.createAtManager();
      try {
        let testPermissionName: Permissions | undefined = undefined;
        atManager.verifyAccessTokenSync(tokenID, testPermissionName);
        expect(false).assertFail();
        done();
      } catch (error) {
        console.error(`Test_verifyAccessTokenSync_016 catch parameter type error, code->${error.code} message->${error.message}`);
        expect(error.code).assertEqual(ERR_PARAM_ERROR);
        done();
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
    it('Test_checkAccessToken_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("Test_checkAccessToken_001 start");
      let atManager = abilityAccessCtrl.createAtManager();
      try {
        atManager.checkAccessToken(tokenID, permissionNameUser).then((data: abilityAccessCtrl.GrantStatus) => {
          console.info("Test_checkAccessToken_001 tokenID: " + tokenID + " data: " + data);
          expect(data).assertEqual(GrantStatus.PERMISSION_DENIED);
          done();
        }).catch((err: BusinessError) => {
          console.error(`Test_checkAccessToken_001 fail, err->${JSON.stringify(err)}`);
          expect(err.code).assertEqual(ERR_PARAM_INVALID);
        });
      } catch (error) {
        console.error("Test_checkAccessToken_001 error " + JSON.stringify(error));
      }
    })

    /**
     * @tc.name   Test_checkAccessToken_002
     * @tc.number Test_checkAccessToken_002
     * @tc.desc   After the installation, system_grant permission is granted by default(Promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_checkAccessToken_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("Test_checkAccessToken_002 start");
      let atManager = abilityAccessCtrl.createAtManager();
      try {
        atManager.checkAccessToken(tokenID, permissionNameSystem).then((data: abilityAccessCtrl.GrantStatus) => {
          console.info("Test_checkAccessToken_002 tokenID: " + tokenID + " data: " + data);
          expect(data).assertEqual(GrantStatus.PERMISSION_GRANTED);
          done();
        }).catch((err: BusinessError) => {
          console.error(`Test_checkAccessToken_002 fail, err->${JSON.stringify(err)}`);
          expect(err.code).assertEqual(ERR_PARAM_INVALID);
        });
      } catch (error) {
        console.error("Test_checkAccessToken_002 error code " + error.code + " error message " + error.message);
      }
    })

    /**
     * @tc.name   Test_checkAccessToken_003
     * @tc.number Test_checkAccessToken_003
     * @tc.desc   Test invalid TokenID(0)(Promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_checkAccessToken_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("Test_checkAccessToken_003 start");
      let atManager = abilityAccessCtrl.createAtManager();
      atManager.checkAccessToken(0, permissionNameUser).then((data: abilityAccessCtrl.GrantStatus) => {
        console.info(`Test_checkAccessToken_003 success, data->${JSON.stringify(data)}`);
      }).catch((err: BusinessError) => {
        console.error(`Test_checkAccessToken_003 fail, err->${JSON.stringify(err)}`);
        expect(err.code).assertEqual(ERR_PARAM_INVALID);
        done();
      });

    })

    /**
     * @tc.name   Test_checkAccessToken_004
     * @tc.number Test_checkAccessToken_004
     * @tc.desc   Test invalid tokenID(Promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_checkAccessToken_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("Test_checkAccessToken_004 start");
      let atManager = abilityAccessCtrl.createAtManager();
      let permissionName: Permissions = "ohos.permission.GRANT_SENSITIVE_PERMISSIONS";

      try {
        atManager.checkAccessToken(1111111111, permissionName).then((data: abilityAccessCtrl.GrantStatus) => {
          console.info("Test_checkAccessToken_004  tokenID: 1111111111, data: " + data);
          expect(data).assertEqual(GrantStatus.PERMISSION_DENIED);
          done();
        }).catch((err: BusinessError) => {
          console.error(`Test_checkAccessToken_004 fail, err->${JSON.stringify(err)}`);
        });
      } catch (error) {
        console.error("Test_checkAccessToken_004 error " + JSON.stringify(error));
      }
    })

    /**
     * @tc.name   Test_checkAccessToken_005
     * @tc.number Test_checkAccessToken_005
     * @tc.desc   Test invalid permission(Promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_checkAccessToken_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("Test_checkAccessToken_005 start");
      let atManager = abilityAccessCtrl.createAtManager();
      let permissionName = "ohos.permission.GRANT_SENSITIVE_PERMISSIO" as Permissions;

      let result = await atManager.checkAccessToken(tokenID, permissionName);
      console.info("Test_checkAccessToken_005 tokenID: " + tokenID + " result: " + result);
      expect(result).assertEqual(GrantStatus.PERMISSION_DENIED);

      done();
    })

    /**
     * @tc.name   Test_checkAccessToken_006
     * @tc.number Test_checkAccessToken_006
     * @tc.desc   Test invalid permission(empty)(Promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_checkAccessToken_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("Test_checkAccessToken_006 start");
      let atManager = abilityAccessCtrl.createAtManager();
      let permissionName: Permissions = "" as Permissions;
      try {
        let result = await atManager.checkAccessToken(tokenID, permissionName);
        console.info("Test_checkAccessToken_006 tokenID: " + tokenID + " result: " + result);
        expect(result).assertEqual(GrantStatus.PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`Test_checkAccessToken_006 fail, err code->${err.code} message->${err.message}`);
        expect(err.code).assertEqual(ERR_PARAM_INVALID);
        done();
      }
    })

    /**
     * @tc.name   Test_checkAccessToken_007
     * @tc.number Test_checkAccessToken_007
     * @tc.desc   Test invalid permission(length exceeds 256)(Promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_checkAccessToken_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("Test_checkAccessToken_007 start");
      let atManager = abilityAccessCtrl.createAtManager();
      let permissionName = "ohos.permission.testtesttesttesttesttesttesttesttesttesttesttesttesttest"
        + "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest"
        +
        "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest" as Permissions;

      try {
        let result = await atManager.checkAccessToken(tokenID, permissionName);
        console.info("Test_checkAccessToken_007 tokenID: " + tokenID + " result: " + result);
        expect(result).assertEqual(GrantStatus.PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`Test_checkAccessToken_007 fail, err code->${err.code} message->${err.message}`);
        expect(err.code).assertEqual(ERR_PARAM_INVALID);
        done();
      }
    })

    /**
     * @tc.name   Test_checkAccessToken_008
     * @tc.number Test_checkAccessToken_008
     * @tc.desc   Test permission length equals 256(Promise), boundary test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_checkAccessToken_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("Test_checkAccessToken_008 start");
      let atManager = abilityAccessCtrl.createAtManager();
      let permissionName = "ohos.permission.testtesttesttesttesttesttesttesttesttesttesttesttest"
        + "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest"
        + "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest"
        + "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttestX" as Permissions;

      try {
        let result = await atManager.checkAccessToken(tokenID, permissionName);
        console.info("Test_checkAccessToken_008 tokenID: " + tokenID + " result: " + result);
        expect(result).assertEqual(GrantStatus.PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error(`Test_checkAccessToken_008 fail, err code->${err.code} message->${err.message}`);
        expect(err.code).assertEqual(ERR_PARAM_INVALID);
        done();
      }
    })

    /**
     * @tc.name   Test_checkAccessToken_009
     * @tc.number Test_checkAccessToken_009
     * @tc.desc   Test negative tokenID(Promise), boundary test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_checkAccessToken_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("Test_checkAccessToken_009 start");
      let atManager = abilityAccessCtrl.createAtManager();

      atManager.checkAccessToken(-1, permissionNameUser).then((data: abilityAccessCtrl.GrantStatus) => {
        console.info("Test_checkAccessToken_009 tokenID: -1, data: " + data);
        expect(data).assertEqual(GrantStatus.PERMISSION_DENIED);
        done();
      }).catch((err: BusinessError) => {
        console.error(`Test_checkAccessToken_009 fail, err code->${err.code} message->${err.message}`);
        expect(err.code).assertEqual(ERR_PARAM_INVALID);
        done();
      });
    })

    /**
     * @tc.name   Test_checkAccessToken_010
     * @tc.number Test_checkAccessToken_010
     * @tc.desc   Test invalid TokenID(0) with error code 12100001(Promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Test_checkAccessToken_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("Test_checkAccessToken_010 start");
      let atManager = abilityAccessCtrl.createAtManager();
      atManager.checkAccessToken(0, permissionNameUser).then((data: abilityAccessCtrl.GrantStatus) => {
        console.info("Test_checkAccessToken_010 tokenID: 0, data: " + data);
        expect(data).assertEqual(GrantStatus.PERMISSION_DENIED);
        done();
      }).catch((err: BusinessError) => {
        console.error(`Test_checkAccessToken_010 fail, err code->${err.code} message->${err.message}`);
        expect(err.code).assertEqual(ERR_PARAM_INVALID);
        done();
      });
    })

    /**
     * @tc.name   Test_checkAccessToken_011
     * @tc.number Test_checkAccessToken_011
     * @tc.desc   Test invalid permission(empty) with error code 12100001(Promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Test_checkAccessToken_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("Test_checkAccessToken_011 start");
      let atManager = abilityAccessCtrl.createAtManager();
      let permissionName: Permissions = "" as Permissions;
      atManager.checkAccessToken(tokenID, permissionName).then((data: abilityAccessCtrl.GrantStatus) => {
        console.info("Test_checkAccessToken_011 tokenID: " + tokenID + " data: " + data);
        expect(data).assertEqual(GrantStatus.PERMISSION_DENIED);
        done();
      }).catch((err: BusinessError) => {
        console.error(`Test_checkAccessToken_011 fail, err code->${err.code} message->${err.message}`);
        expect(err.code).assertEqual(ERR_PARAM_INVALID);
        done();
      });
    })

    /**
     * @tc.name   Test_checkAccessToken_012
     * @tc.number Test_checkAccessToken_012
     * @tc.desc   Test invalid permission(length exceeds 256) with error code 12100001(Promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Test_checkAccessToken_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("Test_checkAccessToken_012 start");
      let atManager = abilityAccessCtrl.createAtManager();
      let permissionName = "ohos.permission.testtesttesttesttesttesttesttesttesttesttesttesttest"
        + "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest"
        + "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest"
        + "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest" as Permissions;

      atManager.checkAccessToken(tokenID, permissionName).then((data: abilityAccessCtrl.GrantStatus) => {
        console.info("Test_checkAccessToken_012 tokenID: " + tokenID + " data: " + data);
        expect(data).assertEqual(GrantStatus.PERMISSION_DENIED);
        done();
      }).catch((err: BusinessError) => {
        console.error(`Test_checkAccessToken_012 fail, err code->${err.code} message->${err.message}`);
        expect(err.code).assertEqual(ERR_PARAM_INVALID);
        done();
      });
    })

    /**
     * @tc.name   Test_checkAccessToken_013
     * @tc.number Test_checkAccessToken_013
     * @tc.desc   Test tokenID is null(Promise), expect parameter type error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Test_checkAccessToken_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("Test_checkAccessToken_013 start");
      let atManager = abilityAccessCtrl.createAtManager();
      try {
        let testTokenID: number | null = null;
        atManager.checkAccessToken(testTokenID, permissionNameUser);
        expect(false).assertFail();
        done();
      } catch (err) {
        console.error(`Test_checkAccessToken_013 catch parameter type error, code->${err.code} message->${err.message}`);
        expect(err.code).assertEqual(ERR_PARAM_ERROR);
        done();
      }
    })

    /**
     * @tc.name   Test_checkAccessToken_014
     * @tc.number Test_checkAccessToken_014
     * @tc.desc   Test permissionName is null(Promise), expect parameter type error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Test_checkAccessToken_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("Test_checkAccessToken_014 start");
      let atManager = abilityAccessCtrl.createAtManager();
      try {
        let testPermissionName: Permissions | null = null;
        atManager.checkAccessToken(tokenID, testPermissionName);
        expect(false).assertFail();
        done();
      } catch (err) {
        console.error(`Test_checkAccessToken_014 catch parameter type error, code->${err.code} message->${err.message}`);
        expect(err.code).assertEqual(ERR_PARAM_ERROR);
        done();
      }
    })

    /**
     * @tc.name   Test_checkAccessToken_015
     * @tc.number Test_checkAccessToken_015
     * @tc.desc   Test tokenID is undefined(Promise), expect parameter type error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Test_checkAccessToken_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("Test_checkAccessToken_015 start");
      let atManager = abilityAccessCtrl.createAtManager();
      try {
        let testTokenID: number | undefined = undefined;
        atManager.checkAccessToken(testTokenID, permissionNameUser);
        expect(false).assertFail();
        done();
      } catch (err) {
        console.error(`Test_checkAccessToken_015 catch parameter type error, code->${err.code} message->${err.message}`);
        expect(err.code).assertEqual(ERR_PARAM_ERROR);
        done();
      }
    })

    /**
     * @tc.name   Test_checkAccessToken_016
     * @tc.number Test_checkAccessToken_016
     * @tc.desc   Test permissionName is undefined(Promise), expect parameter type error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Test_checkAccessToken_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("Test_checkAccessToken_016 start");
      let atManager = abilityAccessCtrl.createAtManager();
      try {
        let testPermissionName: Permissions | undefined = undefined;
        atManager.checkAccessToken(tokenID, testPermissionName);
        expect(false).assertFail();
        done();
      } catch (err) {
        console.error(`Test_checkAccessToken_016 catch parameter type error, code->${err.code} message->${err.message}`);
        expect(err.code).assertEqual(ERR_PARAM_ERROR);
        done();
      }
    })

    /**
     * @tc.name   Test_checkAccessTokenSync_001
     * @tc.number Test_checkAccessTokenSync_001
     * @tc.desc   After the installation, user_grant permission is not granted by default(Promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_checkAccessTokenSync_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("Test_checkAccessTokenSync_001 start");
      let atManager = abilityAccessCtrl.createAtManager();
      try {
        let data = atManager.checkAccessTokenSync(tokenID, permissionNameUser);
        console.info("Test_checkAccessTokenSync_001  tokenID: " + tokenID + " data: " + data);
        expect(data).assertEqual(GrantStatus.PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error("Test_checkAccessTokenSync_001 error " + JSON.stringify(err));
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
    it('Test_checkAccessTokenSync_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("Test_checkAccessTokenSync_002 start");
      let atManager = abilityAccessCtrl.createAtManager();
      try {
        let data = atManager.checkAccessTokenSync(tokenID, permissionNameSystem);
        console.info("Test_checkAccessTokenSync_002 tokenID: " + tokenID + " data: " + data);
        expect(data).assertEqual(GrantStatus.PERMISSION_GRANTED);
        done();
      } catch (err) {
        console.error("Test_checkAccessTokenSync_002 error code " + err.code + " error message " + err.message);
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
    it('Test_checkAccessTokenSync_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("Test_checkAccessTokenSync_003 start");
      let atManager = abilityAccessCtrl.createAtManager();
      try {
        atManager.checkAccessTokenSync(0, permissionNameUser);
      } catch (err) {
        console.error("Test_checkAccessTokenSync_003 error " + JSON.stringify(err));
        expect(err.code).assertEqual(ERR_PARAM_INVALID);
        done();
      }
    })

    /**
     * @tc.name   Test_checkAccessTokenSync_004
     * @tc.number Test_checkAccessTokenSync_004
     * @tc.desc   Test invalid tokenID.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_checkAccessTokenSync_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("Test_checkAccessTokenSync_004 start");
      let atManager = abilityAccessCtrl.createAtManager();
      let permissionName: Permissions = "ohos.permission.GRANT_SENSITIVE_PERMISSIONS";

      try {
        let data = atManager.checkAccessTokenSync(1111111111, permissionName);
        console.info("Test_checkAccessTokenSync_004 tokenID: 1111111111, data: " + data);
        expect(data).assertEqual(GrantStatus.PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error("Test_checkAccessTokenSync_004 error " + JSON.stringify(err));
      }
    })

    /**
     * @tc.name   Test_checkAccessTokenSync_005
     * @tc.number Test_checkAccessTokenSync_005
     * @tc.desc   Test invalid permission.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_checkAccessTokenSync_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("Test_checkAccessTokenSync_005 start");
      let atManager = abilityAccessCtrl.createAtManager();
      let permissionName = "ohos.permission.GRANT_SENSITIVE_PERMISSIO" as Permissions;

      try {
        let result = atManager.checkAccessTokenSync(tokenID, permissionName);
        console.info("Test_checkAccessTokenSync_005 tokenID: " + tokenID + " result: " + result);
        expect(result).assertEqual(GrantStatus.PERMISSION_DENIED);
        done();
      } catch (error) {
        console.error(`Test_checkAccessTokenSync_005 catch error, code->${error.code} message->${error.message}`);
      }
    })

    /**
     * @tc.name   Test_checkAccessTokenSync_006
     * @tc.number Test_checkAccessTokenSync_006
     * @tc.desc   Test invalid permission(empty).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_checkAccessTokenSync_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("Test_checkAccessTokenSync_006 start");
      let atManager = abilityAccessCtrl.createAtManager();
      let permissionName: Permissions = "" as Permissions;

      try {
        let result = atManager.checkAccessTokenSync(tokenID, permissionName);
        console.info("Test_checkAccessTokenSync_006 tokenID: " + tokenID + " result: " + result);
        expect(result).assertEqual(GrantStatus.PERMISSION_DENIED);
        done();
      } catch (error) {
        console.error(`Test_checkAccessTokenSync_006 catch parameter type error, code->${error.code} message->${error.message}`);
        expect(error.code).assertEqual(ERR_PARAM_INVALID);
        done();
      }
    })

    /**
     * @tc.name   Test_checkAccessTokenSync_007
     * @tc.number Test_checkAccessTokenSync_007
     * @tc.desc   Test invalid permission(length exceeds 256).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_checkAccessTokenSync_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("Test_checkAccessTokenSync_007 start");
      let atManager = abilityAccessCtrl.createAtManager();
      let permissionName = "ohos.permission.testtesttesttesttesttesttesttesttesttesttesttesttesttest"
        + "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest"
        +
        "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest" as Permissions;

      try {
        let result = atManager.checkAccessTokenSync(tokenID, permissionName);
        console.info("Test_checkAccessTokenSync_007 tokenID: " + tokenID + " result: " + result);
        expect(result).assertEqual(GrantStatus.PERMISSION_DENIED);
        done();
      } catch (error) {
        console.error(`Test_checkAccessTokenSync_007 catch parameter type error, code->${error.code} message->${error.message}`);
        expect(error.code).assertEqual(ERR_PARAM_INVALID);
        done();
      }
    })

    /**
     * @tc.name   Test_checkAccessTokenSync_008
     * @tc.number Test_checkAccessTokenSync_008
     * @tc.desc   Test permission length equals 256, boundary test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_checkAccessTokenSync_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("Test_checkAccessTokenSync_008 start");
      let atManager = abilityAccessCtrl.createAtManager();
      let permissionName = "ohos.permission.testtesttesttesttesttesttesttesttesttesttesttesttest"
        + "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest"
        + "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest"
        + "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttestX" as Permissions;

      try {
        let result = atManager.checkAccessTokenSync(tokenID, permissionName);
        console.info("Test_checkAccessTokenSync_008 tokenID: " + tokenID + " result: " + result);
        expect(result).assertEqual(GrantStatus.PERMISSION_DENIED);
        done();
      } catch (error) {
        console.error(`Test_checkAccessTokenSync_008 catch parameter type error, code->${error.code} message->${error.message}`);
        expect(error.code).assertEqual(ERR_PARAM_INVALID);
        done();
      }
    })

    /**
     * @tc.name   Test_checkAccessTokenSync_009
     * @tc.number Test_checkAccessTokenSync_009
     * @tc.desc   Test negative tokenID, boundary test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_checkAccessTokenSync_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("Test_checkAccessTokenSync_009 start");
      let atManager = abilityAccessCtrl.createAtManager();

      try {
        let result = atManager.checkAccessTokenSync(-1, permissionNameUser);
        console.info("Test_checkAccessTokenSync_009 tokenID: -1, result: " + result);
        expect(result).assertEqual(GrantStatus.PERMISSION_DENIED);
        done();
      } catch (error) {
        console.error(`Test_checkAccessTokenSync_009 catch parameter type error, code->${error.code} message->${error.message}`);
        expect(error.code).assertEqual(ERR_PARAM_INVALID);
        done();
      }
    })

    /**
     * @tc.name   Test_checkAccessTokenSync_010
     * @tc.number Test_checkAccessTokenSync_010
     * @tc.desc   Test invalid TokenID(0) with error code 12100001.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Test_checkAccessTokenSync_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("Test_checkAccessTokenSync_010 start");
      let atManager = abilityAccessCtrl.createAtManager();
      try {
        let result = atManager.checkAccessTokenSync(0, permissionNameUser);
        console.info("Test_checkAccessTokenSync_010 tokenID: 0, result: " + result);
      } catch (error) {
        console.error(`Test_checkAccessTokenSync_010 catch error code->${error.code} message->${error.message}`);
        expect(error.code).assertEqual(ERR_PARAM_INVALID);
        done();
      }
    })

    /**
     * @tc.name   Test_checkAccessTokenSync_011
     * @tc.number Test_checkAccessTokenSync_011
     * @tc.desc   Test invalid permission(empty) with error code 12100001.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Test_checkAccessTokenSync_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("Test_checkAccessTokenSync_011 start");
      let atManager = abilityAccessCtrl.createAtManager();
      let permissionName: Permissions = "" as Permissions;

      try {
        atManager.checkAccessTokenSync(tokenID, permissionName);
        expect(false).assertFail();
        done();
      } catch (error) {
        console.error(`Test_checkAccessTokenSync_011 catch error code->${error.code} message->${error.message}`);
        expect(error.code).assertEqual(ERR_PARAM_INVALID);
        done();
      }
    })

    /**
     * @tc.name   Test_checkAccessTokenSync_012
     * @tc.number Test_checkAccessTokenSync_012
     * @tc.desc   Test invalid permission(length exceeds 256) with error code 12100001.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Test_checkAccessTokenSync_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("Test_checkAccessTokenSync_012 start");
      let atManager = abilityAccessCtrl.createAtManager();
      let permissionName = "ohos.permission.testtesttesttesttesttesttesttesttesttesttesttesttest"
        + "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest"
        + "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest"
        + "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest" as Permissions;

      try {
        atManager.checkAccessTokenSync(tokenID, permissionName);
        expect(false).assertFail();
        done();
      } catch (error) {
        console.error(`Test_checkAccessTokenSync_012 catch error code->${error.code} message->${error.message}`);
        expect(error.code).assertEqual(ERR_PARAM_INVALID);
        done();
      }
    })

    /**
     * @tc.name   Test_checkAccessTokenSync_013
     * @tc.number Test_checkAccessTokenSync_013
     * @tc.desc   Test tokenID is null, expect parameter type error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Test_checkAccessTokenSync_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("Test_checkAccessTokenSync_013 start");
      let atManager = abilityAccessCtrl.createAtManager();
      try {
        let testTokenID: number | null = null;
        atManager.checkAccessTokenSync(testTokenID, permissionNameUser);
        expect(false).assertFail();
        done();
      } catch (error) {
        console.error(`Test_checkAccessTokenSync_013 catch parameter type error, code->${error.code} message->${error.message}`);
        expect(error.code).assertEqual(ERR_PARAM_ERROR);
        done();
      }
    })

    /**
     * @tc.name   Test_checkAccessTokenSync_014
     * @tc.number Test_checkAccessTokenSync_014
     * @tc.desc   Test permissionName is null, expect parameter type error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Test_checkAccessTokenSync_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("Test_checkAccessTokenSync_014 start");
      let atManager = abilityAccessCtrl.createAtManager();
      try {
        let testPermissionName: Permissions | null = null;
        atManager.checkAccessTokenSync(tokenID, testPermissionName);
        expect(false).assertFail();
        done();
      } catch (error) {
        console.error(`Test_checkAccessTokenSync_014 catch parameter type error, code->${error.code} message->${error.message}`);
        expect(error.code).assertEqual(ERR_PARAM_ERROR);
        done();
      }
    })

    /**
     * @tc.name   Test_checkAccessTokenSync_015
     * @tc.number Test_checkAccessTokenSync_015
     * @tc.desc   Test tokenID is undefined, expect parameter type error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Test_checkAccessTokenSync_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("Test_checkAccessTokenSync_015 start");
      let atManager = abilityAccessCtrl.createAtManager();
      try {
        let testTokenID: number | undefined = undefined;
        atManager.checkAccessTokenSync(testTokenID, permissionNameUser);
        expect(false).assertFail();
        done();
      } catch (error) {
        console.error(`Test_checkAccessTokenSync_015 catch parameter type error, code->${error.code} message->${error.message}`);
        expect(error.code).assertEqual(ERR_PARAM_ERROR);
        done();
      }
    })

    /**
     * @tc.name   Test_checkAccessTokenSync_016
     * @tc.number Test_checkAccessTokenSync_016
     * @tc.desc   Test permissionName is undefined, expect parameter type error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Test_checkAccessTokenSync_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("Test_checkAccessTokenSync_016 start");
      let atManager = abilityAccessCtrl.createAtManager();
      try {
        let testPermissionName: Permissions | undefined = undefined;
        atManager.checkAccessTokenSync(tokenID, testPermissionName);
        expect(false).assertFail();
        done();
      } catch (error) {
        console.error(`Test_checkAccessTokenSync_016 catch parameter type error, code->${error.code} message->${error.message}`);
        expect(error.code).assertEqual(ERR_PARAM_ERROR);
        done();
      }
    })

    /**
     * @tc.name   Test_getSelfPermissionStatus_001
     * @tc.number Test_getSelfPermissionStatus_001
     * @tc.desc   After the installation, user_grant permission is not granted by default(Promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Test_getSelfPermissionStatus_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.info("Test_getSelfPermissionStatus_001 start");
        let atManager = abilityAccessCtrl.createAtManager();
        let result = atManager.getSelfPermissionStatus(permissionNameUser);
        console.info("Test_getSelfPermissionStatus_001 result: " + result);
        expect(result).assertEqual(abilityAccessCtrl.PermissionStatus.NOT_DETERMINED);

        done();
      })

    /**
     * @tc.name   Test_getSelfPermissionStatus_002
     * @tc.number Test_getSelfPermissionStatus_002
     * @tc.desc   After the installation, system_grant permission is granted by default(Promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Test_getSelfPermissionStatus_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        console.info("Test_getSelfPermissionStatus_002 start");
        let atManager = abilityAccessCtrl.createAtManager();
        let result = atManager.getSelfPermissionStatus(permissionNameSystem);
        console.info("Test_getSelfPermissionStatus_002 result: " + result);
        expect(result).assertEqual(abilityAccessCtrl.PermissionStatus.GRANTED);

        done();
      })

    /**
     * @tc.name   Test_getSelfPermissionStatus_003
     * @tc.number Test_getSelfPermissionStatus_003
     * @tc.desc   Call getSelfPermissionStatus with invalid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Test_getSelfPermissionStatus_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        console.info("Test_getSelfPermissionStatus_003 start");
        try {
          let atManager = abilityAccessCtrl.createAtManager();
          let permissionName: Permissions = "" as Permissions;
          let result = atManager.getSelfPermissionStatus(permissionName);
        } catch (error) {
          console.error("Test_getSelfPermissionStatus_003 error code " + error.code + " error message " +
          error.message);
          expect(error.code).assertEqual(ERR_PARAM_INVALID);
          done();
        }
      })

    /**
     * @tc.name   Test_getSelfPermissionStatus_004
     * @tc.number Test_getSelfPermissionStatus_004
     * @tc.desc   Call getSelfPermissionStatus with invalid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Test_getSelfPermissionStatus_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        console.info("Test_getSelfPermissionStatus_004 start");
        try {
          let atManager = abilityAccessCtrl.createAtManager();
          let permissionName: Permissions =
            "ohos.permission.testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttest"
              + "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest"
              +
              "testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest" as Permissions;
          let result = atManager.getSelfPermissionStatus(permissionName);
        } catch (error) {
          console.error("Test_getSelfPermissionStatus_004 error code " + error.code + " error message " +
          error.message);
          expect(error.code).assertEqual(ERR_PARAM_INVALID);
          done();
        }
      })

    /**
     * @tc.name   Test_getSelfPermissionStatus_005
     * @tc.number Test_getSelfPermissionStatus_005
     * @tc.desc   Call getSelfPermissionStatus with invalid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Test_getSelfPermissionStatus_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        console.info("Test_getSelfPermissionStatus_005 start");
        let atManager = abilityAccessCtrl.createAtManager();
        let permissionName: Permissions = "ohos.permission.INVALID_PERM" as Permissions;
        let result = atManager.getSelfPermissionStatus(permissionName);
        console.info("Test_getSelfPermissionStatus_005 result: " + result);
        expect(result).assertEqual(abilityAccessCtrl.PermissionStatus.INVALID);

        let result2 = atManager.getSelfPermissionStatus("ohos.permission.LOCATION");
        console.info("Test_getSelfPermissionStatus_005 result2: " + result2);
        expect(result2).assertEqual(abilityAccessCtrl.PermissionStatus.INVALID);

        done();
      })

    /**
     * @tc.name   Test_getSelfPermissionStatus_006
     * @tc.number Test_getSelfPermissionStatus_006
     * @tc.desc   Call getSelfPermissionStatus with null value, expect parameter type error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Test_getSelfPermissionStatus_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        console.info("Test_getSelfPermissionStatus_006 start");
        try {
          let atManager = abilityAccessCtrl.createAtManager();
          let permissionName: Permissions | null = null;
          atManager.getSelfPermissionStatus(permissionName);
          expect(false).assertFail();
          done();
        } catch (error) {
          console.error("Test_getSelfPermissionStatus_006 error code " + error.code + " error message " + error.message);
          expect(error.code).assertEqual(ERR_PARAM_ERROR);
          done();
        }
      })

    /**
     * @tc.name   Test_getSelfPermissionStatus_007
     * @tc.number Test_getSelfPermissionStatus_007
     * @tc.desc   Call getSelfPermissionStatus with undefined value, expect parameter type error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Test_getSelfPermissionStatus_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        console.info("Test_getSelfPermissionStatus_007 start");
        try {
          let atManager = abilityAccessCtrl.createAtManager();
          let permissionName: Permissions | undefined = undefined;
          atManager.getSelfPermissionStatus(permissionName);
          expect(false).assertFail();
          done();
        } catch (error) {
          console.error("Test_getSelfPermissionStatus_007 error code " + error.code + " error message " + error.message);
          expect(error.code).assertEqual(ERR_PARAM_ERROR);
          done();
        }
      })

    /**
     * @tc.name   Test_on_001
     * @tc.number Test_on_001
     * @tc.desc   Test on selfPermissionStateChange with valid parameters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_on_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("Test_on_001 start");
      let atManager = abilityAccessCtrl.createAtManager();
      let permissionList: Array<Permissions> = ["ohos.permission.DISTRIBUTED_DATASYNC"];
      try {
        atManager.on('selfPermissionStateChange', permissionList, (data: abilityAccessCtrl.PermissionStateChangeInfo) => {
          console.info("Test_on_001 callback data: " + JSON.stringify(data));
          let PermissionStateChangeInfo: abilityAccessCtrl.PermissionStateChangeInfo = data;
          expect(abilityAccessCtrl.PermissionStateChangeType.PERMISSION_REVOKED_OPER).assertEqual(PermissionStateChangeInfo.change);
          expect(tokenID).assertEqual(PermissionStateChangeInfo.tokenID);
          expect('ohos.permission.DISTRIBUTED_DATASYNC').assertEqual(PermissionStateChangeInfo.permissionName);
        });
        atManager.off('selfPermissionStateChange', permissionList);
        done();
      } catch (error) {
        console.error("Test_on_001 error code " + error.code + " error message " + error.message);
        expect(false).assertFail();
        done();
      }
    })

    /**
     * @tc.name   Test_on_002
     * @tc.number Test_on_002
     * @tc.desc   Test on selfPermissionStateChange, permissionList is null, expect parameter type error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Test_on_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("Test_on_002 start");
      let atManager = abilityAccessCtrl.createAtManager();
      try {
        let testPermissionList: Array<Permissions> | null = null;
        atManager.on('selfPermissionStateChange', testPermissionList, (data: abilityAccessCtrl.PermissionStateChangeInfo) => {
          console.info("Test_on_002 callback data: " + JSON.stringify(data));
        });
        expect(false).assertFail();
        done();
      } catch (error) {
        console.error("Test_on_002 error code " + error.code + " error message " + error.message);
        expect(error.code).assertEqual(ERR_PARAM_ERROR);
        done();
      }
    })

    /**
     * @tc.name   Test_on_003
     * @tc.number Test_on_003
     * @tc.desc   Test on selfPermissionStateChange, permissionList is undefined, expect parameter type error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Test_on_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("Test_on_003 start");
      let atManager = abilityAccessCtrl.createAtManager();
      try {
        let testPermissionList: Array<Permissions> | undefined = undefined;
        atManager.on('selfPermissionStateChange', testPermissionList, (data: abilityAccessCtrl.PermissionStateChangeInfo) => {
          console.info("Test_on_003 callback data: " + JSON.stringify(data));
        });
        expect(false).assertFail();
        done();
      } catch (error) {
        console.error("Test_on_003 error code " + error.code + " error message " + error.message);
        expect(error.code).assertEqual(ERR_PARAM_ERROR);
        done();
      }
    })

    /**
     * @tc.name   Test_on_004
     * @tc.number Test_on_004
     * @tc.desc   Test on selfPermissionStateChange, permissionList is empty array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Test_on_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("Test_on_004 start");
      let atManager = abilityAccessCtrl.createAtManager();
      try {
        let testPermissionList: Array<Permissions> = [];
        atManager.on('selfPermissionStateChange', testPermissionList, (data: abilityAccessCtrl.PermissionStateChangeInfo) => {
          console.info("Test_on_004 callback data: " + JSON.stringify(data));
        });
        atManager.off('selfPermissionStateChange', testPermissionList);
        done();
      } catch (error) {
        console.error("Test_on_004 error code " + error.code + " error message " + error.message);
        expect(error.code).assertEqual(ERR_PARAM_ERROR);
        done();
      }
    })
    
  })
}
