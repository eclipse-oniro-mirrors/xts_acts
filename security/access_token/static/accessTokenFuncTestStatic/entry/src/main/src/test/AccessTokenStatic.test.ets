/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeAll, afterEach, it, expect, TestType, Size, Level} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import Utils from './Util.test';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import { Permissions } from 'permissions';
import PermissionRequestResult from 'security.PermissionRequestResult';
import bundleManager from '@ohos.bundle.bundleManager'
import { BusinessError } from '@ohos.base'
let domain: int = 0x0000;
let tag: string = 'testTag';

const ERR_PARAM_ILLEGAL = 401;
const ERR_PARAM_INVALID = 12100001;
const ERR_NOT_USE_TOGETHER = 12100004;
const ERR_REGISTERS_EXCEED_LIMITATION = 12100005;

let permissionNameUser: Permissions = "ohos.permission.DISTRIBUTED_DATASYNC";
let permissionNameSystem: Permissions = "ohos.permission.GET_BUNDLE_INFO";
let tokenID: int;

export default function AccessTokenStaticTest() {
  let atManager = abilityAccessCtrl.createAtManager();
  describe("AccessTokenStaticTest", (): void => {
    hilog.info(domain, 'testTag', '##########start AccessTokenStaticTest');
    beforeAll((): void => {
      hilog.info(domain, tag, '%{public}s', 'beforeAll start');
      let bundleFlags = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
      try {
        hilog.info(domain, 'testTag', "Start getBundleInfoForSelf");
        let bundleInfo = bundleManager.getBundleInfoForSelfSync(bundleFlags)
        let accessTokenId: long = bundleInfo.appInfo?.accessTokenId as long;
        hilog.info(domain, 'testTag', 'accessTokenId:' + accessTokenId);
        tokenID = accessTokenId as int;
      } catch (error: BusinessError<void>) {
        hilog.info(domain, 'testTag', 'AccessTokenStaticTest getBundleInfoForSelf error is: ' + error.code);
      }
      hilog.info(domain, tag, '%{public}s', 'beforeAll end');
    })
    afterEach((): void => {
    })

    /**
     * @tc.name   Test_verifyAccessTokenSync_001
     * @tc.number Test_verifyAccessTokenSync_001
     * @tc.desc   Test verifyAccessTokenSync, After the installation, user_grant permission is not granted by default.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Test_verifyAccessTokenSync_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, 'testTag', "Test_verifyAccessTokenSync_001 start");
      try {
        let status = atManager.verifyAccessTokenSync(tokenID, permissionNameUser);
        expect(status).assertEqual(abilityAccessCtrl.GrantStatus.PERMISSION_DENIED);
        done();
      } catch (error: BusinessError<void>) {
        hilog.info(domain, 'testTag', "Test_verifyAccessTokenSync_001 error" + JSON.stringify(error));
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
    it('Test_verifyAccessTokenSync_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, 'testTag', "Test_verifyAccessTokenSync_002 start");
      try {
        let status = atManager.verifyAccessTokenSync(tokenID, permissionNameSystem);
        expect(status).assertEqual(abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED);
        done();
      } catch (error: BusinessError<void>) {
        hilog.info(domain, 'testTag', "Test_verifyAccessTokenSync_002 error" + JSON.stringify(error));
        expect(false).assertFail();
      }
    })

    /**
     * @tc.name   Test_verifyAccessTokenSync_003
     * @tc.number Test_verifyAccessTokenSync_003
     * @tc.desc   Test verifyAccessTokenSync, invalid TokenID(0).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Test_verifyAccessTokenSync_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, 'testTag', "Test_verifyAccessTokenSync_003 start");
      try {
        atManager.verifyAccessTokenSync(0, permissionNameUser);
        expect(false).assertFail();
        done();
      } catch (error: BusinessError<void>) {
        hilog.info(domain, 'testTag', "Test_verifyAccessTokenSync_003 error" + JSON.stringify(error));
        expect(error.code).assertEqual(ERR_PARAM_INVALID);
        done();
      }
    })

    /**
     * @tc.name   Test_verifyAccessTokenSync_004
     * @tc.number Test_verifyAccessTokenSync_004
     * @tc.desc   Test verifyAccessTokenSync, permissionName is empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_verifyAccessTokenSync_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, 'testTag', "Test_verifyAccessTokenSync_004 start");
      // empty permission
      let permissionName: Permissions = "" as Permissions;
      try {
        atManager.verifyAccessTokenSync(tokenID, permissionName);
        expect(false).assertFail();
        done();
      } catch (error: BusinessError<void>) {
        hilog.info(domain, 'testTag', "Test_verifyAccessTokenSync_004 error" + JSON.stringify(error));
        expect(error.code).assertEqual(ERR_PARAM_INVALID);
        done();
      }
    })

    /**
     * @tc.name   Test_verifyAccessTokenSync_005
     * @tc.number Test_verifyAccessTokenSync_005
     * @tc.desc   Test verifyAccessTokenSync, permissionName exceeds 256 characters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Test_verifyAccessTokenSync_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, 'testTag', "Test_verifyAccessTokenSync_005 start");
      // length of permission is 257
      let permissionName = 'a'.repeat(257) as Permissions;
      try {
        atManager.verifyAccessTokenSync(tokenID, permissionName);
        expect(false).assertFail();
        done();
      } catch (error: BusinessError<void>) {
        hilog.info(domain, 'testTag', "Test_verifyAccessTokenSync_005 error" + JSON.stringify(error));
        expect(error.code).assertEqual(ERR_PARAM_INVALID);
        done();
      }
    })

    /**
     * @tc.name   Test_verifyAccessTokenSync_006
     * @tc.number Test_verifyAccessTokenSync_006
     * @tc.desc   Test verifyAccessTokenSync, noexist tokenid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Test_verifyAccessTokenSync_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, 'testTag', "Test_verifyAccessTokenSync_006 start");
      // noexist tokenid
      let noexistId: int = 111111 as int;
      try {
        let status = atManager.verifyAccessTokenSync(noexistId, permissionNameSystem);
        expect(status).assertEqual(abilityAccessCtrl.GrantStatus.PERMISSION_DENIED);
        done();
      } catch (error: BusinessError<void>) {
        hilog.info(domain, 'testTag', "Test_verifyAccessTokenSync_006 error" + JSON.stringify(error));
        expect(false).assertFail();
        done();
      }
    })

    /**
     * @tc.name   Test_verifyAccessTokenSync_007
     * @tc.number Test_verifyAccessTokenSync_007
     * @tc.desc   Test verifyAccessTokenSync, noexist permission.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Test_verifyAccessTokenSync_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, 'testTag', "Test_verifyAccessTokenSync_007 start");
      // noexist permission
      try {
        let permissionName: Permissions = "ohos.test.test" as Permissions;
        let status = atManager.verifyAccessTokenSync(tokenID, permissionName);
        expect(status).assertEqual(abilityAccessCtrl.GrantStatus.PERMISSION_DENIED);
        done();
      } catch (error: BusinessError<void>) {
        hilog.info(domain, 'testTag', "Test_verifyAccessTokenSync_007 error" + JSON.stringify(error));
        expect(false).assertFail();
        done();
      }
    })

    /**
     * @tc.name   Test_checkAccessTokenSync_001
     * @tc.number Test_checkAccessTokenSync_001
     * @tc.desc   Test checkAccessTokenSync, After the installation, user_grant permission is not granted by default.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Test_checkAccessTokenSync_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, 'testTag', "Test_checkAccessTokenSync_001 start");
      try {
        let status = atManager.checkAccessTokenSync(tokenID, permissionNameUser);
        expect(status).assertEqual(abilityAccessCtrl.GrantStatus.PERMISSION_DENIED);
        done();
      } catch (error: BusinessError<void>) {
        hilog.info(domain, 'testTag', "Test_checkAccessTokenSync_001 error" + JSON.stringify(error));
        expect(false).assertFail();
        done();
      }
    })

    /**
     * @tc.name   Test_checkAccessTokenSync_002
     * @tc.number Test_checkAccessTokenSync_002
     * @tc.desc   Test checkAccessTokenSync, After the installation, system_grant permission is granted by default.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Test_checkAccessTokenSync_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, 'testTag', "Test_checkAccessTokenSync_002 start");
      try {
        let status = atManager.checkAccessTokenSync(tokenID, permissionNameSystem);
        expect(status).assertEqual(abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED);
        done();
      } catch (error: BusinessError<void>) {
        hilog.info(domain, 'testTag', "Test_checkAccessTokenSync_002 error" + JSON.stringify(error));
        expect(false).assertFail();
        done();
      }
    })

    /**
     * @tc.name   Test_checkAccessTokenSync_003
     * @tc.number Test_checkAccessTokenSync_003
     * @tc.desc   Test checkAccessTokenSync, invalid TokenID(0).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Test_checkAccessTokenSync_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, 'testTag', "Test_checkAccessTokenSync_003 start");
      try {
        atManager.checkAccessTokenSync(0, permissionNameUser);
        expect(false).assertFail();
        done();
      } catch (error: BusinessError<void>) {
        hilog.info(domain, 'testTag', "Test_checkAccessTokenSync_003 error" + JSON.stringify(error));
        expect(error.code).assertEqual(ERR_PARAM_INVALID);
        done();
      }
    })

    /**
     * @tc.name   Test_checkAccessTokenSync_004
     * @tc.number Test_checkAccessTokenSync_004
     * @tc.desc   Test checkAccessTokenSync, permissionName is empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_checkAccessTokenSync_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, 'testTag', "Test_checkAccessTokenSync_004 start");
      // empty permission
      let permissionName: Permissions = "" as Permissions;
      try {
        atManager.checkAccessTokenSync(tokenID, permissionName);
        expect(false).assertFail();
        done();
      } catch (error: BusinessError<void>) {
        hilog.info(domain, 'testTag', "Test_checkAccessTokenSync_004 error" + JSON.stringify(error));
        expect(error.code).assertEqual(ERR_PARAM_INVALID);
        done();
      }
    })

    /**
     * @tc.name   Test_checkAccessTokenSync_005
     * @tc.number Test_checkAccessTokenSync_005
     * @tc.desc   Test checkAccessTokenSync, permissionName exceeds 256 characters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Test_checkAccessTokenSync_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, 'testTag', "Test_checkAccessTokenSync_005 start");
      // length of permission is 257
      let permissionName = 'a'.repeat(257) as Permissions;
      try {
        atManager.checkAccessTokenSync(tokenID, permissionName);
        expect(false).assertFail();
        done();
      } catch (error: BusinessError<void>) {
        hilog.info(domain, 'testTag', "Test_checkAccessTokenSync_005 error" + JSON.stringify(error));
        expect(error.code).assertEqual(ERR_PARAM_INVALID);
        done();
      }
    })

    /**
     * @tc.name   Test_checkAccessTokenSync_006
     * @tc.number Test_checkAccessTokenSync_006
     * @tc.desc   Test checkAccessTokenSync, noexist tokenid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Test_checkAccessTokenSync_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, 'testTag', "Test_checkAccessTokenSync_006 start");
      // noexist tokenid
      try {
        let noexistId: int = 111111 as int;
        let status = atManager.checkAccessTokenSync(noexistId, permissionNameSystem);
        expect(status).assertEqual(abilityAccessCtrl.GrantStatus.PERMISSION_DENIED);
        done();
      } catch(error: BusinessError<void>) {
        hilog.info(domain, 'testTag', "Test_checkAccessTokenSync_006 error" + JSON.stringify(error));
        expect(false).assertFail();
        done();
      }
    })

    /**
     * @tc.name   Test_checkAccessTokenSync_007
     * @tc.number Test_checkAccessTokenSync_007
     * @tc.desc   Test checkAccessTokenSync, noexist permission.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Test_checkAccessTokenSync_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, 'testTag', "Test_checkAccessTokenSync_007 start");
      // noexist permission
      try {
        let permissionName: Permissions = "ohos.test.test" as Permissions;
        let status = atManager.checkAccessTokenSync(tokenID, permissionName);
        expect(status).assertEqual(abilityAccessCtrl.GrantStatus.PERMISSION_DENIED);
        done();
      } catch(error: BusinessError<void>) {
        hilog.info(domain, 'testTag', "Test_checkAccessTokenSync_007 error" + JSON.stringify(error));
        expect(false).assertFail();
        done();
      }
    })

    /**
     * @tc.name   Test_checkAccessToken_Promise_001
     * @tc.number Test_checkAccessToken_Promise_001
     * @tc.desc   After the installation, user_grant permission is not granted by default(Promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Test_checkAccessToken_Promise_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, 'testTag', "Test_checkAccessToken_Promise_001 start");
      try {
        let status = await atManager.checkAccessToken(tokenID, permissionNameUser);
        expect(status).assertEqual(abilityAccessCtrl.GrantStatus.PERMISSION_DENIED);
        done();
      } catch(error: BusinessError<void>) {
        hilog.info(domain, 'testTag', "Test_checkAccessToken_Promise_001 error" + JSON.stringify(error));
        expect(false).assertFail();
        done();
      }
    })

    /**
     * @tc.name   Test_checkAccessToken_Promise_002
     * @tc.number Test_checkAccessToken_Promise_002
     * @tc.desc   After the installation, system_grant permission is granted by default(Promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Test_checkAccessToken_Promise_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, 'testTag', "Test_checkAccessToken_Promise_002 start");
      try {
        let status = await atManager.checkAccessToken(tokenID, permissionNameSystem);
        expect(status).assertEqual(abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED);
        done();
      } catch(error: BusinessError<void>) {
        hilog.info(domain, 'testTag', "Test_checkAccessToken_Promise_002 error" + JSON.stringify(error));
        expect(false).assertFail();
        done();
      }
    })

    /**
     * @tc.name   Test_checkAccessToken_Promise_003
     * @tc.number Test_checkAccessToken_Promise_003
     * @tc.desc   Test checkAccessToken(promise), invalid TokenID(0).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Test_checkAccessToken_Promise_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, 'testTag', "Test_checkAccessToken_Promise_003 start");
      try {
        atManager.checkAccessToken(0, permissionNameUser).catch((error: Error): void => {
          hilog.info(domain, 'testTag', "Test_checkAccessToken_Promise_003 error" + JSON.stringify(error));
          expect(error.code).assertEqual(ERR_PARAM_INVALID);
          done();
        });
      } catch(error: BusinessError<void>) {
        hilog.info(domain, 'testTag', "catch Test_checkAccessToken_Promise_003 failed" + JSON.stringify(error));
        expect(false).assertFail();
        done();
      }
    })

    /**
     * @tc.name   Test_checkAccessToken_Promise_004
     * @tc.number Test_checkAccessToken_Promise_004
     * @tc.desc   Test checkAccessToken(promise), permissionName is empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_checkAccessToken_Promise_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, 'testTag', "Test_checkAccessToken_Promise_004 start");
      // empty permission
      let permissionName: Permissions = "" as Permissions;
      try {
        atManager.checkAccessToken(tokenID, permissionName).catch((error: Error): void => {
          hilog.info(domain, 'testTag', "Test_checkAccessToken_Promise_004 error" + JSON.stringify(error));
          expect(error.code).assertEqual(ERR_PARAM_INVALID);
          done();
        });
      } catch(error: BusinessError<void>) {
        hilog.info(domain, 'testTag', "catch Test_checkAccessToken_Promise_004 failed" + JSON.stringify(error));
        expect(false).assertFail();
        done();
      }
    })

    /**
     * @tc.name   Test_checkAccessToken_Promise_005
     * @tc.number Test_checkAccessToken_Promise_005
     * @tc.desc   Test checkAccessToken(promise), permissionName exceeds 256 characters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Test_checkAccessToken_Promise_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, 'testTag', "Test_checkAccessToken_Promise_005 start");
      // length of permission is 257
      let permissionName = 'a'.repeat(257) as Permissions;
      try {
        atManager.checkAccessToken(tokenID, permissionName).catch((error: Error): void => {
          hilog.info(domain, 'testTag', "Test_checkAccessToken_Promise_005 error" + JSON.stringify(error));
          expect(error.code).assertEqual(ERR_PARAM_INVALID);
          done();
        });
      } catch(error: BusinessError<void>) {
        hilog.info(domain, 'testTag', "catch Test_checkAccessToken_Promise_005 failed" + JSON.stringify(error));
        expect(false).assertFail();
        done();
      }
    })

    /**
     * @tc.name   Test_checkAccessToken_Promise_006
     * @tc.number Test_checkAccessToken_Promise_006
     * @tc.desc   Test checkAccessToken(promise), noexist tokenid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Test_checkAccessToken_Promise_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, 'testTag', "Test_checkAccessToken_Promise_006 start");
      // noexist tokenid
      let noexistId: int = 111111 as int;
      try {
        atManager.checkAccessToken(noexistId, permissionNameSystem).then<void, void>((status: abilityAccessCtrl.GrantStatus): void => {
          expect(status).assertEqual(abilityAccessCtrl.GrantStatus.PERMISSION_DENIED);
          done();
        });
      } catch (error: BusinessError<void>) {
        hilog.info(domain, 'testTag', "Test_checkAccessToken_Promise_006 failed" + JSON.stringify(error));
        expect(false).assertFail();
        done();
      }
    })

    /**
     * @tc.name   Test_checkAccessToken_Promise_007
     * @tc.number Test_checkAccessToken_Promise_007
     * @tc.desc   Test checkAccessToken(promise), noexist permission.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Test_checkAccessToken_Promise_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, 'testTag', "Test_checkAccessToken_Promise_007 start");
      // noexist permission
      let permissionName: Permissions = "ohos.test.test" as Permissions;
      try {
        atManager.checkAccessToken(tokenID, permissionName).then<void, void>((status: abilityAccessCtrl.GrantStatus): void => {
          expect(status).assertEqual(abilityAccessCtrl.GrantStatus.PERMISSION_DENIED);
          done();
        });
      } catch (error: BusinessError<void>) {
        hilog.info(domain, 'testTag', "Test_checkAccessToken_Promise_007 failed" + JSON.stringify(error));
        expect(false).assertFail();
        done();
      }
    })

    /**
     * @tc.name   Test_SwitchType_001
     * @tc.number Test_SwitchType_001
     * @tc.desc   abilityAccessCtrl SwitchType CAMERA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Test_SwitchType_001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, 'testTag', '----------------------Test_SwitchType_001---------------------------');
      let value = abilityAccessCtrl.SwitchType.CAMERA;
      hilog.info(domain, 'testTag', 'Test_SwitchType_001 value is: ' + value);
      expect(value + '').assertEqual('0');
      done();
    })

    /**
     * @tc.name   Test_SwitchType_002
     * @tc.number Test_SwitchType_002
     * @tc.desc   abilityAccessCtrl SwitchType MICROPHONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Test_SwitchType_002", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, 'testTag', '----------------------Test_SwitchType_002---------------------------');
      let value = abilityAccessCtrl.SwitchType.MICROPHONE;
      hilog.info(domain, 'testTag', 'Test_SwitchType_002 value is: ' + value);
      expect(value + '').assertEqual('1');
      done();
    })

    /**
     * @tc.name   Test_SwitchType_003
     * @tc.number Test_SwitchType_003
     * @tc.desc   abilityAccessCtrl SwitchType LOCATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Test_SwitchType_003", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, 'testTag', '----------------------Test_SwitchType_003---------------------------');
      await Utils.msSleep(1000);
      let value = abilityAccessCtrl.SwitchType.LOCATION;
      hilog.info(domain, 'testTag', 'Test_SwitchType_003 value is: ' + value);
      expect(value + '').assertEqual('2');
      done();
    })

    /**
     * @tc.name   Test_PermissionStateChangeType_001
     * @tc.number Test_PermissionStateChangeType_001
     * @tc.desc   abilityAccessCtrl PermissionStateChangeType PERMISSION_GRANTED_OPER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Test_PermissionStateChangeType_001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, 'testTag', '----------------------Test_PermissionStateChangeType_001---------------------------');
      await Utils.msSleep(1000);
      let value = abilityAccessCtrl.PermissionStateChangeType.PERMISSION_GRANTED_OPER;
      hilog.info(domain, 'testTag', 'Test_PermissionStateChangeType_001 value is: ' + value);
      expect(value + '').assertEqual('1');
      done();
    })

    /**
     * @tc.name   Test_PermissionStateChangeType_002
     * @tc.number Test_PermissionStateChangeType_002
     * @tc.desc   abilityAccessCtrl PermissionStateChangeType PERMISSION_REVOKED_OPER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Test_PermissionStateChangeType_002", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, 'testTag', '----------------------Test_PermissionStateChangeType_002---------------------------');
      await Utils.msSleep(1000);
      let value = abilityAccessCtrl.PermissionStateChangeType.PERMISSION_REVOKED_OPER;
      hilog.info(domain, 'testTag', 'Test_PermissionStateChangeType_002 value is: ' + value);
      expect(value + '').assertEqual('0');
      done();
    })

    /**
     * @tc.name   Test_PermissionRequestToggleStatus_001
     * @tc.number Test_PermissionRequestToggleStatus_001
     * @tc.desc   abilityAccessCtrl PermissionRequestToggleStatus CLOSED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Test_PermissionRequestToggleStatus_001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, 'testTag', '----------------------Test_PermissionRequestToggleStatus_001---------------------------');
      await Utils.msSleep(1000);
      let value = abilityAccessCtrl.PermissionRequestToggleStatus.CLOSED;
      hilog.info(domain, 'testTag', 'Test_PermissionRequestToggleStatus_001 value is: ' + value);
      expect(value + '').assertEqual('0');
      done();
    })

    /**
     * @tc.name   Test_PermissionRequestToggleStatus_002
     * @tc.number Test_PermissionRequestToggleStatus_002
     * @tc.desc   abilityAccessCtrl PermissionRequestToggleStatus OPEN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Test_PermissionRequestToggleStatus_002", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, 'testTag', '----------------------Test_PermissionRequestToggleStatus_002---------------------------');
      await Utils.msSleep(1000);
      let value = abilityAccessCtrl.PermissionRequestToggleStatus.OPEN;
      hilog.info(domain, 'testTag', 'Test_PermissionRequestToggleStatus_002 value is: ' + value);
      expect(value + '').assertEqual('1');
      done();
    })

    /**
     * @tc.name   Test_PermissionStatus_001
     * @tc.number Test_PermissionStatus_001
     * @tc.desc   abilityAccessCtrl PermissionStatus DENIED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Test_PermissionStatus_001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, 'testTag', '----------------------Test_PermissionStatus_001---------------------------');
      await Utils.msSleep(1000);
      let value = abilityAccessCtrl.PermissionStatus.DENIED;
      hilog.info(domain, 'testTag', 'Test_PermissionStatus_001 value is: ' + value);
      expect(value + '').assertEqual('-1');
      done();
    })

    /**
     * @tc.name   Test_PermissionStatus_002
     * @tc.number Test_PermissionStatus_002
     * @tc.desc   abilityAccessCtrl PermissionStatus GRANTED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Test_PermissionStatus_002", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, 'testTag', '----------------------Test_PermissionStatus_002---------------------------');
      await Utils.msSleep(1000);
      let value = abilityAccessCtrl.PermissionStatus.GRANTED;
      hilog.info(domain, 'testTag', 'Test_PermissionStatus_002 value is: ' + value);
      expect(value + '').assertEqual('0');
      done();
    })

    /**
     * @tc.name   Test_PermissionStatus_003
     * @tc.number Test_PermissionStatus_003
     * @tc.desc   abilityAccessCtrl PermissionStatus NOT_DETERMINED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Test_PermissionStatus_003", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, 'testTag', '----------------------Test_PermissionStatus_003---------------------------');
      await Utils.msSleep(1000);
      let value = abilityAccessCtrl.PermissionStatus.NOT_DETERMINED;
      hilog.info(domain, 'testTag', 'Test_PermissionStatus_003 value is: ' + value);
      expect(value + '').assertEqual('1');
      done();
    })

    /**
     * @tc.name   Test_PermissionStatus_004
     * @tc.number Test_PermissionStatus_004
     * @tc.desc   abilityAccessCtrl PermissionStatus INVALID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Test_PermissionStatus_004", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, 'testTag', '----------------------Test_PermissionStatus_004---------------------------');
      await Utils.msSleep(1000);
      let value = abilityAccessCtrl.PermissionStatus.INVALID;
      hilog.info(domain, 'testTag', 'Test_PermissionStatus_004 value is: ' + value);
      expect(value + '').assertEqual('2');
      done();
    })

    /**
     * @tc.name   Test_PermissionStatus_005
     * @tc.number Test_PermissionStatus_005
     * @tc.desc   abilityAccessCtrl PermissionStatus RESTRICTED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("Test_PermissionStatus_005", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, 'testTag', '----------------------Test_PermissionStatus_005---------------------------');
      await Utils.msSleep(1000);
      let value = abilityAccessCtrl.PermissionStatus.RESTRICTED;
      hilog.info(domain, 'testTag', 'Test_PermissionStatus_005 value is: ' + value);
      expect(value + '').assertEqual('3');
      done();
    })

    /**
     * @tc.name   Test_verifyAccessToken_Promise_001
     * @tc.number Test_verifyAccessToken_Promise_001
     * @tc.desc   After the installation, user_grant permission is not granted by default(Promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Test_verifyAccessToken_Promise_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, 'testTag', "Test_verifyAccessToken_Promise_001 start");
      try {
        let status = await atManager.verifyAccessToken(tokenID, permissionNameUser);
        expect(status).assertEqual(abilityAccessCtrl.GrantStatus.PERMISSION_DENIED);
        done();
      } catch(error: BusinessError<void>) {
        hilog.info(domain, 'testTag', "Test_verifyAccessToken_Promise_001 error" + JSON.stringify(error));
        expect(false).assertFail();
        done();
      }
    })

    /**
     * @tc.name   Test_verifyAccessToken_Promise_002
     * @tc.number Test_verifyAccessToken_Promise_002
     * @tc.desc   After the installation, system_grant permission is granted by default(Promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Test_verifyAccessToken_Promise_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, 'testTag', "Test_verifyAccessToken_Promise_002 start");
      try {
        let status = await atManager.verifyAccessToken(tokenID, permissionNameSystem);
        expect(status).assertEqual(abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED);
        done();
      } catch(error: BusinessError<void>) {
        hilog.info(domain, 'testTag', "Test_verifyAccessToken_Promise_002 error" + JSON.stringify(error));
        expect(false).assertFail();
        done();
      }
    })

    /**
     * @tc.name   Test_verifyAccessToken_Promise_003
     * @tc.number Test_verifyAccessToken_Promise_003
     * @tc.desc   Test verifyAccessToken(promise), invalid TokenID(0).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Test_verifyAccessToken_Promise_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, 'testTag', "Test_verifyAccessToken_Promise_003 start");
      try {
        let status = await atManager.verifyAccessToken(0, permissionNameUser);
        expect(status).assertEqual(abilityAccessCtrl.GrantStatus.PERMISSION_DENIED);
        done();
      } catch(error: BusinessError<void>) {
        hilog.info(domain, 'testTag', "Test_verifyAccessToken_Promise_003 error" + JSON.stringify(error));
        expect(false).assertFail();
        done();
      }
    })

    /**
     * @tc.name   Test_verifyAccessToken_Promise_004
     * @tc.number Test_verifyAccessToken_Promise_004
     * @tc.desc   Test verifyAccessToken(promise), permissionName is empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_verifyAccessToken_Promise_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, 'testTag', "Test_verifyAccessToken_Promise_004 start");
      // empty permission
      let permissionName: Permissions = "" as Permissions;
      try {
        let status = await atManager.verifyAccessToken(tokenID, permissionName);
        expect(status).assertEqual(abilityAccessCtrl.GrantStatus.PERMISSION_DENIED);
        done();
      } catch(error: BusinessError<void>) {
        hilog.info(domain, 'testTag', "Test_verifyAccessToken_Promise_003 error" + JSON.stringify(error));
        expect(false).assertFail();
        done();
      }
    })

    /**
     * @tc.name   Test_verifyAccessToken_Promise_005
     * @tc.number Test_verifyAccessToken_Promise_005
     * @tc.desc   Test verifyAccessToken(promise), permissionName exceeds 256 characters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Test_verifyAccessToken_Promise_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, 'testTag', "Test_verifyAccessToken_Promise_005 start");
      // length of permission is 257
      let permissionName = 'a'.repeat(257) as Permissions;
      try {
        let status = await atManager.verifyAccessToken(tokenID, permissionName);
        expect(status).assertEqual(abilityAccessCtrl.GrantStatus.PERMISSION_DENIED);
        done();
      } catch(error: BusinessError<void>) {
        hilog.info(domain, 'testTag', "Test_verifyAccessToken_Promise_003 error" + JSON.stringify(error));
        expect(false).assertFail();
        done();
      }
    })

    /**
     * @tc.name   Test_verifyAccessToken_Promise_006
     * @tc.number Test_verifyAccessToken_Promise_006
     * @tc.desc   Test verifyAccessToken(promise), noexist tokenid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Test_verifyAccessToken_Promise_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, 'testTag', "Test_verifyAccessToken_Promise_006 start");
      // noexist tokenid
      let noexistId: int = 111111 as int;
      try {
        atManager.verifyAccessToken(noexistId, permissionNameSystem).then<void, void>((status: abilityAccessCtrl.GrantStatus): void => {
          expect(status).assertEqual(abilityAccessCtrl.GrantStatus.PERMISSION_DENIED);
          done();
        });
      } catch (error: BusinessError<void>) {
        hilog.info(domain, 'testTag', "Test_verifyAccessToken_Promise_006 failed" + JSON.stringify(error));
        expect(false).assertFail();
        done();
      }
    })

    /**
     * @tc.name   Test_verifyAccessToken_Promise_007
     * @tc.number Test_verifyAccessToken_Promise_007
     * @tc.desc   Test verifyAccessToken(promise), noexist permission.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Test_verifyAccessToken_Promise_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, 'testTag', "Test_verifyAccessToken_Promise_007 start");
      // noexist permission
      let permissionName: Permissions = "ohos.test.test" as Permissions;
      try {
        atManager.verifyAccessToken(tokenID, permissionName).then<void, void>((status: abilityAccessCtrl.GrantStatus): void => {
          expect(status).assertEqual(abilityAccessCtrl.GrantStatus.PERMISSION_DENIED);
          done();
        });
      } catch (error: BusinessError<void>) {
        hilog.info(domain, 'testTag', "Test_verifyAccessToken_Promise_007 failed" + JSON.stringify(error));
        expect(false).assertFail();
        done();
      }
    })

    /**
     * @tc.name   Test_Off_001
     * @tc.number Test_Off_001
     * @tc.desc   abilityAccessCtrl Off The permission list does not exist
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("Test_Off_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, 'testTag', '----------------------Test_Off_001---------------------------');
      await Utils.msSleep(1000);
      try {
        let testpermissionName: Permissions = "ohos.permission.DISTRIBUTED_DATASYNC" as Permissions;
        let fn: (data: abilityAccessCtrl.PermissionStateChangeInfo) => void =
          (data: abilityAccessCtrl.PermissionStateChangeInfo) => {
            hilog.info(domain, 'testTag', 'Test_Off_001 Callback received: %{public}s', JSON.stringify(data));
            let PermissionStateChangeInfo: abilityAccessCtrl.PermissionStateChangeInfo = data;
            expect(abilityAccessCtrl.PermissionStateChangeType.PERMISSION_REVOKED_OPER).assertEqual(PermissionStateChangeInfo.change);
            expect(tokenID).assertEqual(PermissionStateChangeInfo.tokenID);
            expect(testpermissionName).assertEqual(PermissionStateChangeInfo.permissionName);
            done();
          }
        
        let permissionList: Array<Permissions> = [testpermissionName];
        atManager.offSelfPermissionStateChange(permissionList, fn);
        hilog.info(domain, 'testTag', 'Test_Off_001 success');
        expect(false).assertFail();
        done();
      } catch (error) {
        error = error as BusinessError;
        hilog.info(domain, 'testTag', "Test_Off_001 error" + JSON.stringify(error));
        expect(ERR_NOT_USE_TOGETHER).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.name   Test_Off_002
     * @tc.number Test_Off_002
     * @tc.desc   abilityAccessCtrl On Off The permission list does not exist
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("Test_Off_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, 'testTag', '----------------------Test_Off_002---------------------------');
      await Utils.msSleep(1000);
      try {
        let testpermissionName: Permissions = "ohos.permission.DISTRIBUTED_DATASYNC" as Permissions;
        let permissionList: Array<Permissions> = [testpermissionName];
        atManager.onSelfPermissionStateChange(permissionList,
          (data: abilityAccessCtrl.PermissionStateChangeInfo) => {
            hilog.info(domain, 'testTag', `Test_Off_002 on callback data: ${JSON.stringify(data)}`);
          });
        atManager.offSelfPermissionStateChange(permissionList, (data: abilityAccessCtrl.PermissionStateChangeInfo) => {
            hilog.info(domain, 'testTag', `Test_Off_002 off callback data: ${JSON.stringify(data)}`);
          });
        hilog.info(domain, 'testTag', 'Test_Off_002 success');
        expect(false).assertFail();
        done();
      } catch (error) {
        error = error as BusinessError;
        hilog.info(domain, 'testTag', "Test_Off_002 error" + JSON.stringify(error));
        expect(ERR_NOT_USE_TOGETHER).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.name   Test_On_001
     * @tc.number Test_On_001
     * @tc.desc   abilityAccessCtrl On The size of the permission list exceeds the limit of 1024
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("Test_On_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, 'testTag', '----------------------Test_On_001---------------------------');
      await Utils.msSleep(1000);
      try {
        let fn: (data: abilityAccessCtrl.PermissionStateChangeInfo) => void =
          (data: abilityAccessCtrl.PermissionStateChangeInfo) => {
            hilog.info(domain, 'testTag', 'Callback received: %{public}s', JSON.stringify(data));
          }
        let testpermissionName2: Permissions = 'ohos.permission.DISTRIBUTED_DATASYNC' as Permissions;
        let permissionList: Array<Permissions> = [testpermissionName2];
        for (let i = 0; i < 1025; i++) {
          permissionList.push(testpermissionName2);
        }
        atManager.onSelfPermissionStateChange(permissionList, fn);
        hilog.info(domain, 'testTag', 'Test_On_001 success');
        expect(false).assertFail();
        done();
      } catch (error) {
        error = error as BusinessError;
        hilog.info(domain, 'testTag', "Test_On_001 error" + JSON.stringify(error));
        expect(ERR_PARAM_INVALID).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.name   Test_On_002
     * @tc.number Test_On_002
     * @tc.desc   abilityAccessCtrl On Duplicate registration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("Test_On_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, 'testTag', '----------------------Test_On_002---------------------------');
      await Utils.msSleep(1000);
      try {
        let fn: (data: abilityAccessCtrl.PermissionStateChangeInfo) => void =
          (data: abilityAccessCtrl.PermissionStateChangeInfo) => {
            hilog.info(domain, 'testTag', 'Test_On_002 Callback received: %{public}s', JSON.stringify(data));
          }
        let testpermissionName: Permissions = "ohos.permission.DISTRIBUTED_DATASYNC" as Permissions;
        let permissionList: Array<Permissions> = [testpermissionName];
        atManager.onSelfPermissionStateChange(permissionList, fn);
        atManager.onSelfPermissionStateChange(permissionList, fn);
        hilog.info(domain, 'testTag', 'Test_On_002 success');
        expect(false).assertFail();
        done();

      } catch (error) {
        error = error as BusinessError;
        hilog.info(domain, 'testTag', "Test_On_002 error" + JSON.stringify(error));
        expect(ERR_NOT_USE_TOGETHER).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.name   Test_On_003
     * @tc.number Test_On_003
     * @tc.desc   abilityAccessCtrl On The length of the permission name exceeds 256
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("Test_On_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, 'testTag', '----------------------Test_On_003---------------------------');
      await Utils.msSleep(1000);
      try {
        let fn: (data: abilityAccessCtrl.PermissionStateChangeInfo) => void =
          (data: abilityAccessCtrl.PermissionStateChangeInfo) => {
            hilog.info(domain, 'testTag', 'Callback received: %{public}s', JSON.stringify(data));
          }
        let testpermissionName2: Permissions = 'a'.repeat(257) as Permissions;
        let permissionList: Array<Permissions> = [testpermissionName2];
        atManager.onSelfPermissionStateChange(permissionList, fn);
        hilog.info(domain, 'testTag', 'Test_On_003 success');
        expect(false).assertFail();
        done();
      } catch (error) {
        error = error as BusinessError;
        hilog.info(domain, 'testTag', "Test_On_003 error" + JSON.stringify(error));
        expect(ERR_PARAM_INVALID).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.name   Test_On_004
     * @tc.number Test_On_004
     * @tc.desc   abilityAccessCtrl On The number of registered callbacks exceeds the limit of 200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("Test_On_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, 'testTag', '----------------------Test_On_004---------------------------');
      await Utils.msSleep(1000);
      let testpermissionName: Permissions = "ohos.permission.DISTRIBUTED_DATASYNC" as Permissions;
      let permissionList: Array<Permissions> = [testpermissionName];
      try {
        for (let i = 0; i < 201; i++) {
          atManager.onSelfPermissionStateChange(permissionList,
            (data: abilityAccessCtrl.PermissionStateChangeInfo) => {
              hilog.info(domain, 'testTag', `monitor#${i}trigger: ${JSON.stringify(data)}`);
            });
        }
        hilog.info(domain, 'testTag', 'Test_On_004 success');
        expect(false).assertFail();
        done();
      } catch (error) {
        error = error as BusinessError;
        hilog.info(domain, 'testTag', "Test_On_004 error" + JSON.stringify(error));
        expect(ERR_REGISTERS_EXCEED_LIMITATION).assertEqual(error.code);
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
    it("Test_getSelfPermissionStatus_001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "Test_getSelfPermissionStatus_001 start");
      let result = atManager.getSelfPermissionStatus(permissionNameUser);
      hilog.info(domain, tag, "Test_getSelfPermissionStatus_001 result: " + result);
      expect(result).assertEqual(abilityAccessCtrl.PermissionStatus.NOT_DETERMINED);
      done();
    })

    /**
     * @tc.name   Test_getSelfPermissionStatus_002
     * @tc.number Test_getSelfPermissionStatus_002
     * @tc.desc   After the installation, system_grant permission is granted by default(Promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Test_getSelfPermissionStatus_002", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "Test_getSelfPermissionStatus_002 start");
      let result = atManager.getSelfPermissionStatus(permissionNameSystem);
      hilog.info(domain, tag, "Test_getSelfPermissionStatus_002 result: " + result);
      expect(result).assertEqual(abilityAccessCtrl.PermissionStatus.GRANTED);
      done();
    })

    /**
     * @tc.name   Test_getSelfPermissionStatus_003
     * @tc.number Test_getSelfPermissionStatus_003
     * @tc.desc   Call getSelfPermissionStatus with invalid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Test_getSelfPermissionStatus_003", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "Test_getSelfPermissionStatus_003 start");
      try {
        let permissionName: Permissions = "" as Permissions;
        let result = atManager.getSelfPermissionStatus(permissionName);
      } catch (error) {
        error = error as BusinessError;
        hilog.error(domain, tag, "Test_getSelfPermissionStatus_003 error " + JSON.stringify(error));
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
     * @tc.level  LEVEL0
     */
    it("Test_getSelfPermissionStatus_004", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "Test_getSelfPermissionStatus_004 start");
      try {
        let permissionName: Permissions = 'a'.repeat(257) as Permissions;
        let result = atManager.getSelfPermissionStatus(permissionName);
      } catch (error) {
        error = error as BusinessError;
        hilog.error(domain, tag, "Test_getSelfPermissionStatus_004 error code " + JSON.stringify(error));
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
     * @tc.level  LEVEL0
     */
    it("Test_getSelfPermissionStatus_005", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "Test_getSelfPermissionStatus_005 start");
      let permissionName: Permissions = "ohos.permission.INVALID_PERM" as Permissions;
      let result = atManager.getSelfPermissionStatus(permissionName);
      hilog.info(domain, tag, "Test_getSelfPermissionStatus_005 result: " + result);
      expect(result).assertEqual(abilityAccessCtrl.PermissionStatus.INVALID);

      let result2 = atManager.getSelfPermissionStatus("ohos.permission.LOCATION");
      hilog.info(domain, tag, "Test_getSelfPermissionStatus_005 result2: " + result2);
      expect(result2).assertEqual(abilityAccessCtrl.PermissionStatus.INVALID);
      done();
    })

    /**
     * @tc.name   Test_getSelfPermissionStatus_006
     * @tc.number Test_getSelfPermissionStatus_006
     * @tc.desc   Call enum DENIED value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Test_getSelfPermissionStatus_006", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "Test_getSelfPermissionStatus_006 start");
      let result = abilityAccessCtrl.PermissionStatus.DENIED;
      hilog.info(domain, tag, "Test_getSelfPermissionStatus_006 result: " + result);
      expect(result).assertEqual(-1);
      done();
    })

    /**
     * @tc.name   Test_getSelfPermissionStatus_007
     * @tc.number Test_getSelfPermissionStatus_007
     * @tc.desc   Call enum GRANTED value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Test_getSelfPermissionStatus_007", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "Test_getSelfPermissionStatus_007 start");
      let result = abilityAccessCtrl.PermissionStatus.GRANTED;
      hilog.info(domain, tag, "Test_getSelfPermissionStatus_007 result: " + result);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   Test_getSelfPermissionStatus_008
     * @tc.number Test_getSelfPermissionStatus_008
     * @tc.desc   Call enum NOT_DETERMINED value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Test_getSelfPermissionStatus_008", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "Test_getSelfPermissionStatus_008 start");
      let result = abilityAccessCtrl.PermissionStatus.NOT_DETERMINED;
      hilog.info(domain, tag, "Test_getSelfPermissionStatus_008 result: " + result);
      expect(result).assertEqual(1);
      done();
    })

    /**
     * @tc.name   Test_getSelfPermissionStatus_009
     * @tc.number Test_getSelfPermissionStatus_009
     * @tc.desc   Call enum INVALID value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Test_getSelfPermissionStatus_009", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "Test_getSelfPermissionStatus_009 start");
      let result = abilityAccessCtrl.PermissionStatus.INVALID;
      hilog.info(domain, tag, "Test_getSelfPermissionStatus_009 result: " + result);
      expect(result).assertEqual(2);
      done();
    })

    /**
     * @tc.name   Test_getSelfPermissionStatus_010
     * @tc.number Test_getSelfPermissionStatus_010
     * @tc.desc   Call enum RESTRICTED value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Test_getSelfPermissionStatus_010", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "Test_getSelfPermissionStatus_010 start");
      let result = abilityAccessCtrl.PermissionStatus.RESTRICTED;
      hilog.info(domain, tag, "Test_getSelfPermissionStatus_010 result: " + result);
      expect(result).assertEqual(3);
      done();
    })

  })
  hilog.info(domain, tag, '%{public}s', 'abilityTest end');

}