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
        console.info("Test_verifyAccessToken_003 tokenID: " + tokenID + " data: " + data);
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
        console.info("Test_verifyAccessToken_006 tokenID: " + tokenID + " data: " + data);
        expect(data).assertEqual(GrantStatus.PERMISSION_DENIED);
        done();
      }).catch((err: BusinessError) => {
        console.error(`Test_verifyAccessToken_006 fail, err->${JSON.stringify(err)}`);
      });

    })

    /**
     * @tc.name   Test_verifyAccessToken_007
     * @tc.number Test_verifyAccessToken_007
     * @tc.desc   Test Error permission(Promise).
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
     * @tc.name   Test_verifyAccessTokenSync_000
     * @tc.number Test_verifyAccessTokenSync_0000
     * @tc.desc   Test verifyAccessTokenSync, After the installation, user_grant permission is not granted by default.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_verifyAccessTokenSync_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("Test_verifyAccessTokenSync_000 start");
      let atManager = abilityAccessCtrl.createAtManager();
      let result = atManager.verifyAccessTokenSync(tokenID, permissionNameUser);
      console.info("Test_verifyAccessTokenSync_000 tokenID: " + tokenID + " result: " + result);
      expect(result).assertEqual(GrantStatus.PERMISSION_DENIED);
      done();
    })

    /**
     * @tc.name   Test_verifyAccessTokenSync_001
     * @tc.number Test_verifyAccessTokenSync_0100
     * @tc.desc   Test verifyAccessTokenSync, After the installation, system_grant permission is granted by default.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Test_verifyAccessTokenSync_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info("Test_verifyAccessTokenSync_001 start");
      let atManager = abilityAccessCtrl.createAtManager();
      let result = atManager.verifyAccessTokenSync(tokenID, permissionNameSystem);
      console.info("Test_verifyAccessTokenSync_001 tokenID: " + tokenID + " result: " + result);
      expect(result).assertEqual(GrantStatus.PERMISSION_GRANTED);
      done();
    })

    /**
     * @tc.name   Test_verifyAccessTokenSync_002
     * @tc.number Test_verifyAccessTokenSync_0200
     * @tc.desc   Test verifyAccessTokenSync, invalid TokenID(0).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Test_verifyAccessTokenSync_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("Test_verifyAccessTokenSync_002 start");
      let atManager = abilityAccessCtrl.createAtManager();
      try {
        atManager.verifyAccessTokenSync(0, permissionNameUser);
      } catch (error) {
        console.error("Test_verifyAccessTokenSync_002 error " + JSON.stringify(error));
        expect(error.code).assertEqual(ERR_PARAM_INVALID);
        done();
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
    it('Test_verifyAccessTokenSync_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("Test_verifyAccessTokenSync_005 start");
      let atManager = abilityAccessCtrl.createAtManager();
      let permissionName: Permissions = "ohos.permission.GRANT_SENSITIVE_PERMISSIONS";

      try {
        let result = atManager.verifyAccessTokenSync(1111111111, permissionName);
        console.info("Test_verifyAccessTokenSync_005 tokenID: " + tokenID + " result: " + result);
        expect(result).assertEqual(GrantStatus.PERMISSION_DENIED);
        done();
      } catch (error) {
        console.error("Test_verifyAccessTokenSync_005 error " + JSON.stringify(error));
        expect(error.code).assertEqual(ERR_PARAM_INVALID);
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
     * @tc.name   Test_checkAccessToken_006
     * @tc.number Test_checkAccessToken_006
     * @tc.desc   After the installation, user_grant permission is not granted by default(Promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_checkAccessToken_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("Test_checkAccessToken_006 start");
      let atManager = abilityAccessCtrl.createAtManager();

      try {
        atManager.checkAccessToken(tokenID, permissionNameUser).then((data: abilityAccessCtrl.GrantStatus) => {
          console.info("Test_checkAccessToken_006  tokenID: " + tokenID + " data: " + data);
          expect(data).assertEqual(GrantStatus.PERMISSION_DENIED);
          done();
        }).catch((err: BusinessError) => {
          console.error(`Test_checkAccessToken_006 fail, err->${JSON.stringify(err)}`);
        });
      } catch (error) {
        console.error("Test_checkAccessToken_006 error " + JSON.stringify(error));
      }
    })

    /**
     * @tc.name   Test_checkAccessToken_007
     * @tc.number Test_checkAccessToken_007
     * @tc.desc   Test Error tokenID(Promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_checkAccessToken_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("Test_checkAccessToken_007 start");
      let atManager = abilityAccessCtrl.createAtManager();
      let permissionName: Permissions = "ohos.permission.GRANT_SENSITIVE_PERMISSIONS";

      try {
        atManager.checkAccessToken(1111111111, permissionName).then((data: abilityAccessCtrl.GrantStatus) => {
          console.info("Test_checkAccessToken_007  tokenID: " + tokenID + " data: " + data);
          expect(data).assertEqual(GrantStatus.PERMISSION_DENIED);
          done();
        }).catch((err: BusinessError) => {
          console.error(`Test_checkAccessToken_007 fail, err->${JSON.stringify(err)}`);
        });
      } catch (error) {
        console.error("Test_checkAccessToken_007 error " + JSON.stringify(error));
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
     * @tc.name   Test_checkAccessTokenSync_006
     * @tc.number Test_checkAccessTokenSync_006
     * @tc.desc   Test Error tokenID(Promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_checkAccessTokenSync_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("Test_checkAccessTokenSync_006 start");
      let atManager = abilityAccessCtrl.createAtManager();
      let permissionName: Permissions = "ohos.permission.GRANT_SENSITIVE_PERMISSIONS";

      try {
        let data = atManager.checkAccessTokenSync(1111111111, permissionName);
        console.info("Test_checkAccessTokenSync_006 tokenID: " + tokenID + " data: " + data);
        expect(data).assertEqual(GrantStatus.PERMISSION_DENIED);
        done();
      } catch (err) {
        console.error("Test_checkAccessTokenSync_006 error " + JSON.stringify(err));
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

  })
}
