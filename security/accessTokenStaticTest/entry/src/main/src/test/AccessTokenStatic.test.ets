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
let domain: number = 0x0000;
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
        let accessTokenId: double = bundleInfo.appInfo.accessTokenId;
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
     * @tc.number Test_verifyAccessTokenSync_001
     * @tc.name Test_verifyAccessTokenSync_001
     * @tc.desc Test verifyAccessTokenSync, After the installation, user_grant permission is not granted by default.
     * @tc.level: Level0
     * @tc.size: MediumTest
     * @tc.type: Function
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
     * @tc.number Test_verifyAccessTokenSync_002
     * @tc.name Test_verifyAccessTokenSync_002
     * @tc.desc Test verifyAccessTokenSync, After the installation, system_grant permission is granted by default.
     * @tc.level: Level1
     * @tc.size: MediumTest
     * @tc.type: Function
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
     * @tc.number Test_verifyAccessTokenSync_003
     * @tc.name Test_verifyAccessTokenSync_003
     * @tc.desc Test verifyAccessTokenSync, invalid TokenID(0).
     * @tc.level: Level2
     * @tc.size: MediumTest
     * @tc.type: Function
     */
    it('Test_verifyAccessTokenSync_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, 'testTag', "Test_verifyAccessTokenSync_003 start");
      try {
        atManager.verifyAccessTokenSync(0, permissionNameUser);
      } catch (error: BusinessError<void>) {
        hilog.info(domain, 'testTag', "Test_verifyAccessTokenSync_003 error" + JSON.stringify(error));
        expect(error.code).assertEqual(ERR_PARAM_INVALID);
        done();
      }
    })

    /**
     * @tc.number Test_verifyAccessTokenSync_004
     * @tc.name Test_verifyAccessTokenSync_004
     * @tc.desc Test verifyAccessTokenSync, permissionName is empty.
     * @tc.level: Level3
     * @tc.size: MediumTest
     * @tc.type: Function
     */
    it('Test_verifyAccessTokenSync_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, 'testTag', "Test_verifyAccessTokenSync_004 start");
      // empty permission
      let permissionName: Permissions = "" as Permissions;
      try {
        atManager.verifyAccessTokenSync(tokenID, permissionName);
      } catch (error: BusinessError<void>) {
        hilog.info(domain, 'testTag', "Test_verifyAccessTokenSync_004 error" + JSON.stringify(error));
        expect(error.code).assertEqual(ERR_PARAM_INVALID);
        done();
      }
    })

    /**
     * @tc.number Test_verifyAccessTokenSync_005
     * @tc.name Test_verifyAccessTokenSync_005
     * @tc.desc Test verifyAccessTokenSync, permissionName exceeds 256 characters.
     * @tc.level: Level1
     * @tc.size: MediumTest
     * @tc.type: Function
     */
    it('Test_verifyAccessTokenSync_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, 'testTag', "Test_verifyAccessTokenSync_005 start");
      // length of permission is 257
      let permissionName = 'a'.repeat(257) as Permissions;
      try {
        atManager.verifyAccessTokenSync(tokenID, permissionName);
      } catch (error: BusinessError<void>) {
        hilog.info(domain, 'testTag', "Test_verifyAccessTokenSync_005 error" + JSON.stringify(error));
        expect(error.code).assertEqual(ERR_PARAM_INVALID);
        done();
      }
    })

    /**
     * @tc.number Test_verifyAccessTokenSync_006
     * @tc.name Test_verifyAccessTokenSync_006
     * @tc.desc Test verifyAccessTokenSync, noexist tokenid.
     * @tc.level: Level1
     * @tc.size: MediumTest
     * @tc.type: Function
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
     * @tc.number Test_verifyAccessTokenSync_007
     * @tc.name Test_verifyAccessTokenSync_007
     * @tc.desc Test verifyAccessTokenSync, noexist permission.
     * @tc.level: Level2
     * @tc.size: MediumTest
     * @tc.type: Function
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
     * @tc.number Test_checkAccessTokenSync_001
     * @tc.name Test_checkAccessTokenSync_001
     * @tc.desc Test checkAccessTokenSync, After the installation, user_grant permission is not granted by default.
     * @tc.level: Level0
     * @tc.size: MediumTest
     * @tc.type: Function
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
     * @tc.number Test_checkAccessTokenSync_002
     * @tc.name Test_checkAccessTokenSync_002
     * @tc.desc Test checkAccessTokenSync, After the installation, system_grant permission is granted by default.
     * @tc.level: Level1
     * @tc.size: MediumTest
     * @tc.type: Function
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
     * @tc.number Test_checkAccessTokenSync_003
     * @tc.name Test_checkAccessTokenSync_003
     * @tc.desc Test checkAccessTokenSync, invalid TokenID(0).
     * @tc.level: Level2
     * @tc.size: MediumTest
     * @tc.type: Function
     */
    it('Test_checkAccessTokenSync_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, 'testTag', "Test_checkAccessTokenSync_003 start");
      try {
        atManager.checkAccessTokenSync(0, permissionNameUser);
      } catch (error: BusinessError<void>) {
        hilog.info(domain, 'testTag', "Test_checkAccessTokenSync_003 error" + JSON.stringify(error));
        expect(error.code).assertEqual(ERR_PARAM_INVALID);
        done();
      }
    })

    /**
     * @tc.number Test_checkAccessTokenSync_004
     * @tc.name Test_checkAccessTokenSync_004
     * @tc.desc Test checkAccessTokenSync, permissionName is empty.
     * @tc.level: Level3
     * @tc.size: MediumTest
     * @tc.type: Function
     */
    it('Test_checkAccessTokenSync_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, 'testTag', "Test_checkAccessTokenSync_004 start");
      // empty permission
      let permissionName: Permissions = "" as Permissions;
      try {
        atManager.checkAccessTokenSync(tokenID, permissionName);
      } catch (error: BusinessError<void>) {
        hilog.info(domain, 'testTag', "Test_checkAccessTokenSync_004 error" + JSON.stringify(error));
        expect(error.code).assertEqual(ERR_PARAM_INVALID);
        done();
      }
    })

    /**
     * @tc.number Test_checkAccessTokenSync_005
     * @tc.name Test_checkAccessTokenSync_005
     * @tc.desc Test checkAccessTokenSync, permissionName exceeds 256 characters.
     * @tc.level: Level1
     * @tc.size: MediumTest
     * @tc.type: Function
     */
    it('Test_checkAccessTokenSync_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, 'testTag', "Test_checkAccessTokenSync_005 start");
      // length of permission is 257
      let permissionName = 'a'.repeat(257) as Permissions;
      try {
        atManager.checkAccessTokenSync(tokenID, permissionName);
      } catch (error: BusinessError<void>) {
        hilog.info(domain, 'testTag', "Test_checkAccessTokenSync_005 error" + JSON.stringify(error));
        expect(error.code).assertEqual(ERR_PARAM_INVALID);
        done();
      }
    })

    /**
     * @tc.number Test_checkAccessTokenSync_006
     * @tc.name Test_checkAccessTokenSync_006
     * @tc.desc Test checkAccessTokenSync, noexist tokenid.
     * @tc.level: Level1
     * @tc.size: MediumTest
     * @tc.type: Function
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
     * @tc.number Test_checkAccessTokenSync_007
     * @tc.name Test_checkAccessTokenSync_007
     * @tc.desc Test checkAccessTokenSync, noexist permission.
     * @tc.level: Level2
     * @tc.size: MediumTest
     * @tc.type: Function
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
     * @tc.number Test_checkAccessToken_Promise_001
     * @tc.name Test_checkAccessToken_Promise_001
     * @tc.desc After the installation, user_grant permission is not granted by default(Promise).
     * @tc.level: Level0
     * @tc.size: MediumTest
     * @tc.type: Function
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
     * @tc.number Test_checkAccessToken_Promise_002
     * @tc.name Test_checkAccessToken_Promise_002
     * @tc.desc After the installation, system_grant permission is granted by default(Promise).
     * @tc.level: Level1
     * @tc.size: MediumTest
     * @tc.type: Function
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
     * @tc.number Test_checkAccessToken_Promise_003
     * @tc.name Test_checkAccessToken_Promise_003
     * @tc.desc Test checkAccessToken(promise), invalid TokenID(0).
     * @tc.level: Level2
     * @tc.size: MediumTest
     * @tc.type: Function
     */
    it('Test_checkAccessToken_Promise_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, 'testTag', "Test_checkAccessToken_Promise_003 start");
      try {
        atManager.checkAccessToken(0, permissionNameUser).catch((error: BusinessError): void => {
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
     * @tc.number Test_checkAccessToken_Promise_004
     * @tc.name Test_checkAccessToken_Promise_004
     * @tc.desc Test checkAccessToken(promise), permissionName is empty.
     * @tc.level: Level3
     * @tc.size: MediumTest
     * @tc.type: Function
     */
    it('Test_checkAccessToken_Promise_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, 'testTag', "Test_checkAccessToken_Promise_004 start");
      // empty permission
      let permissionName: Permissions = "" as Permissions;
      try {
        atManager.checkAccessToken(tokenID, permissionName).catch((error: BusinessError): void => {
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
     * @tc.number Test_checkAccessToken_Promise_005
     * @tc.name Test_checkAccessToken_Promise_005
     * @tc.desc Test checkAccessToken(promise), permissionName exceeds 256 characters.
     * @tc.level: Level1
     * @tc.size: MediumTest
     * @tc.type: Function
     */
    it('Test_checkAccessToken_Promise_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, 'testTag', "Test_checkAccessToken_Promise_005 start");
      // length of permission is 257
      let permissionName = 'a'.repeat(257) as Permissions;
      try {
        atManager.checkAccessToken(tokenID, permissionName).catch((error: BusinessError): void => {
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
     * @tc.number Test_checkAccessToken_Promise_006
     * @tc.name Test_checkAccessToken_Promise_006
     * @tc.desc Test checkAccessToken(promise), noexist tokenid.
     * @tc.level: Level1
     * @tc.size: MediumTest
     * @tc.type: Function
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
     * @tc.number Test_checkAccessToken_Promise_007
     * @tc.name Test_checkAccessToken_Promise_007
     * @tc.desc Test checkAccessToken(promise), noexist permission.
     * @tc.level: Level2
     * @tc.size: MediumTest
     * @tc.type: Function
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
     * @tc.number Test_verifyAccessToken_Promise_001
     * @tc.name Test_verifyAccessToken_Promise_001
     * @tc.desc After the installation, user_grant permission is not granted by default(Promise).
     * @tc.level: Level0
     * @tc.size: MediumTest
     * @tc.type: Function
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
     * @tc.number Test_verifyAccessToken_Promise_002
     * @tc.name Test_verifyAccessToken_Promise_002
     * @tc.desc After the installation, system_grant permission is granted by default(Promise).
     * @tc.level: Level1
     * @tc.size: MediumTest
     * @tc.type: Function
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
     * @tc.number Test_verifyAccessToken_Promise_003
     * @tc.name Test_verifyAccessToken_Promise_003
     * @tc.desc Test verifyAccessToken(promise), invalid TokenID(0).
     * @tc.level: Level2
     * @tc.size: MediumTest
     * @tc.type: Function
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
     * @tc.number Test_verifyAccessToken_Promise_004
     * @tc.name Test_verifyAccessToken_Promise_004
     * @tc.desc Test verifyAccessToken(promise), permissionName is empty.
     * @tc.level: Level3
     * @tc.size: MediumTest
     * @tc.type: Function
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
     * @tc.number Test_verifyAccessToken_Promise_005
     * @tc.name Test_verifyAccessToken_Promise_005
     * @tc.desc Test verifyAccessToken(promise), permissionName exceeds 256 characters.
     * @tc.level: Level1
     * @tc.size: MediumTest
     * @tc.type: Function
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
     * @tc.number Test_verifyAccessToken_Promise_006
     * @tc.name Test_verifyAccessToken_Promise_006
     * @tc.desc Test verifyAccessToken(promise), noexist tokenid.
     * @tc.level: Level1
     * @tc.size: MediumTest
     * @tc.type: Function
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
     * @tc.number Test_verifyAccessToken_Promise_007
     * @tc.name Test_verifyAccessToken_Promise_007
     * @tc.desc Test verifyAccessToken(promise), noexist permission.
     * @tc.level: Level2
     * @tc.size: MediumTest
     * @tc.type: Function
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
  })
  hilog.info(domain, tag, '%{public}s', 'abilityTest end');

}