/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import bundleManager from '@ohos.bundle.bundleManager';
import { abilityAccessCtrl, Permissions } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';

const ERR_PARAM_INVALID = 12100001;
const ERR_NOT_USE_TOGETHER = 12100004;
const ERR_REGISTERS_EXCEED_LIMITATION = 12100005;

let permissionNameUser: Permissions = "ohos.permission.DISTRIBUTED_DATASYNC";
let permissionNameSystem: Permissions = "ohos.permission.GET_BUNDLE_INFO";
let tokenID = 0;

export default function AccessTokenDynamicTest() {
  describe('AccessTokenDynamicTest', () => {
    console.info('##########start AccessTokenDynamicTest');
    beforeAll(async (done: Function) => {
      let bundleFlags = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
      console.info('AccessTokenDynamicTest bundleFlags is: ' + bundleFlags);
      try {
        bundleManager.getBundleInfoForSelf(bundleFlags).then((data) => {
          console.info('AccessTokenDynamicTest data is: ' + JSON.stringify(data));
          tokenID = data.appInfo.accessTokenId;
          console.info('AccessTokenDynamicTest tokenID is: ' + data.appInfo.accessTokenId);
          done();
        }).catch((err: BusinessError) => {
          console.error('AccessTokenDynamicTest getBundleInfoForSelf err is: ' + err.code);
        })
      } catch (error) {
        console.error('AccessTokenDynamicTest getBundleInfoForSelf error is: ' + error.code);
      }
    })
    afterEach(() => {
    })

    /**
     * @tc.name   SUB_accessctrl_accesstoken_verifyAccessTokenSync_0100
     * @tc.number SUB_accessctrl_accesstoken_verifyAccessTokenSync_0100
     * @tc.desc   Test verifyAccessTokenSync, After the installation, user_grant permission is not granted by default.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_accessctrl_accesstoken_verifyAccessTokenSync_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info("SUB_accessctrl_accesstoken_verifyAccessTokenSync_0100 start");
      let atManager = abilityAccessCtrl.createAtManager();
      try {
        let status = atManager.verifyAccessTokenSync(tokenID, permissionNameUser);
        expect(status).assertEqual(abilityAccessCtrl.GrantStatus.PERMISSION_DENIED);
        done();
      } catch (error) {
        console.error("SUB_accessctrl_accesstoken_verifyAccessTokenSync_0100 error" + JSON.stringify(error));
        expect(false).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_accessctrl_accesstoken_verifyAccessTokenSync_0200
     * @tc.number SUB_accessctrl_accesstoken_verifyAccessTokenSync_0200
     * @tc.desc   Test verifyAccessTokenSync, After the installation, system_grant permission is granted by default.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_accessctrl_accesstoken_verifyAccessTokenSync_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info("SUB_accessctrl_accesstoken_verifyAccessTokenSync_0200 start");
      let atManager = abilityAccessCtrl.createAtManager();
      try {
        let status = atManager.verifyAccessTokenSync(tokenID, permissionNameSystem);
        expect(status).assertEqual(abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED);
        done();
      } catch (error) {
        console.error("SUB_accessctrl_accesstoken_verifyAccessTokenSync_0200 error" + JSON.stringify(error));
        expect(false).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_accessctrl_accesstoken_verifyAccessTokenSync_0300
     * @tc.number SUB_accessctrl_accesstoken_verifyAccessTokenSync_0300
     * @tc.desc   Test verifyAccessTokenSync, invalid TokenID(0).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_accessctrl_accesstoken_verifyAccessTokenSync_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_accessctrl_accesstoken_verifyAccessTokenSync_0300 start");
      let atManager = abilityAccessCtrl.createAtManager();
      try {
        atManager.verifyAccessTokenSync(0, permissionNameUser);
        expect(false).assertFail();
        done();
      } catch (error) {
        console.error("SUB_accessctrl_accesstoken_verifyAccessTokenSync_0300 error" + JSON.stringify(error));
        expect((error as BusinessError).code).assertEqual(ERR_PARAM_INVALID);
        done();
      }
    })

    /**
     * @tc.name   SUB_accessctrl_accesstoken_verifyAccessTokenSync_0400
     * @tc.number SUB_accessctrl_accesstoken_verifyAccessTokenSync_0400
     * @tc.desc   Test verifyAccessTokenSync, permissionName is empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_accessctrl_accesstoken_verifyAccessTokenSync_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("SUB_accessctrl_accesstoken_verifyAccessTokenSync_0400 start");
      let atManager = abilityAccessCtrl.createAtManager();
      let permissionName: Permissions = "" as Permissions;
      try {
        atManager.verifyAccessTokenSync(tokenID, permissionName);
        expect(false).assertFail();
        done();
      } catch (error) {
        console.error("SUB_accessctrl_accesstoken_verifyAccessTokenSync_0400 error" + JSON.stringify(error));
        expect((error as BusinessError).code).assertEqual(ERR_PARAM_INVALID);
        done();
      }
    })

    /**
     * @tc.name   SUB_accessctrl_accesstoken_verifyAccessTokenSync_0500
     * @tc.number SUB_accessctrl_accesstoken_verifyAccessTokenSync_0500
     * @tc.desc   Test verifyAccessTokenSync, permissionName exceeds 256 characters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_accessctrl_accesstoken_verifyAccessTokenSync_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info("SUB_accessctrl_accesstoken_verifyAccessTokenSync_0500 start");
      let atManager = abilityAccessCtrl.createAtManager();
      let permissionName = 'a'.repeat(257) as Permissions;
      try {
        atManager.verifyAccessTokenSync(tokenID, permissionName);
        expect(false).assertFail();
        done();
      } catch (error) {
        console.error("SUB_accessctrl_accesstoken_verifyAccessTokenSync_0500 error" + JSON.stringify(error));
        expect((error as BusinessError).code).assertEqual(ERR_PARAM_INVALID);
        done();
      }
    })

    /**
     * @tc.name   SUB_accessctrl_accesstoken_verifyAccessTokenSync_0600
     * @tc.number SUB_accessctrl_accesstoken_verifyAccessTokenSync_0600
     * @tc.desc   Test verifyAccessTokenSync, noexist tokenid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_accessctrl_accesstoken_verifyAccessTokenSync_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info("SUB_accessctrl_accesstoken_verifyAccessTokenSync_0600 start");
      let atManager = abilityAccessCtrl.createAtManager();
      let noExistId = 111111;
      try {
        let status = atManager.verifyAccessTokenSync(noExistId, permissionNameSystem);
        expect(status).assertEqual(abilityAccessCtrl.GrantStatus.PERMISSION_DENIED);
        done();
      } catch (error) {
        console.error("SUB_accessctrl_accesstoken_verifyAccessTokenSync_0600 error" + JSON.stringify(error));
        expect(false).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_accessctrl_accesstoken_verifyAccessTokenSync_0700
     * @tc.number SUB_accessctrl_accesstoken_verifyAccessTokenSync_0700
     * @tc.desc   Test verifyAccessTokenSync, noexist permission.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_accessctrl_accesstoken_verifyAccessTokenSync_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_accessctrl_accesstoken_verifyAccessTokenSync_0700 start");
      let atManager = abilityAccessCtrl.createAtManager();
      try {
        let permissionName: Permissions = "ohos.test.test" as Permissions;
        let status = atManager.verifyAccessTokenSync(tokenID, permissionName);
        expect(status).assertEqual(abilityAccessCtrl.GrantStatus.PERMISSION_DENIED);
        done();
      } catch (error) {
        console.error("SUB_accessctrl_accesstoken_verifyAccessTokenSync_0700 error" + JSON.stringify(error));
        expect(false).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_accessctrl_accesstoken_checkAccessTokenSync_0100
     * @tc.number SUB_accessctrl_accesstoken_checkAccessTokenSync_0100
     * @tc.desc   Test checkAccessTokenSync, After the installation, user_grant permission is not granted by default.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_accessctrl_accesstoken_checkAccessTokenSync_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info("SUB_accessctrl_accesstoken_checkAccessTokenSync_0100 start");
      let atManager = abilityAccessCtrl.createAtManager();
      try {
        let status = atManager.checkAccessTokenSync(tokenID, permissionNameUser);
        expect(status).assertEqual(abilityAccessCtrl.GrantStatus.PERMISSION_DENIED);
        done();
      } catch (error) {
        console.error("SUB_accessctrl_accesstoken_checkAccessTokenSync_0100 error" + JSON.stringify(error));
        expect(false).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_accessctrl_accesstoken_checkAccessTokenSync_0200
     * @tc.number SUB_accessctrl_accesstoken_checkAccessTokenSync_0200
     * @tc.desc   Test checkAccessTokenSync, After the installation, system_grant permission is granted by default.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_accessctrl_accesstoken_checkAccessTokenSync_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info("SUB_accessctrl_accesstoken_checkAccessTokenSync_0200 start");
      let atManager = abilityAccessCtrl.createAtManager();
      try {
        let status = atManager.checkAccessTokenSync(tokenID, permissionNameSystem);
        expect(status).assertEqual(abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED);
        done();
      } catch (error) {
        console.error("SUB_accessctrl_accesstoken_checkAccessTokenSync_0200 error" + JSON.stringify(error));
        expect(false).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_accessctrl_accesstoken_checkAccessTokenSync_0300
     * @tc.number SUB_accessctrl_accesstoken_checkAccessTokenSync_0300
     * @tc.desc   Test checkAccessTokenSync, invalid TokenID(0).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_accessctrl_accesstoken_checkAccessTokenSync_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_accessctrl_accesstoken_checkAccessTokenSync_0300 start");
      let atManager = abilityAccessCtrl.createAtManager();
      try {
        atManager.checkAccessTokenSync(0, permissionNameUser);
        expect(false).assertFail();
        done();
      } catch (error) {
        console.error("SUB_accessctrl_accesstoken_checkAccessTokenSync_0300 error" + JSON.stringify(error));
        expect((error as BusinessError).code).assertEqual(ERR_PARAM_INVALID);
        done();
      }
    })

    /**
     * @tc.name   SUB_accessctrl_accesstoken_checkAccessTokenSync_0400
     * @tc.number SUB_accessctrl_accesstoken_checkAccessTokenSync_0400
     * @tc.desc   Test checkAccessTokenSync, permissionName is empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_accessctrl_accesstoken_checkAccessTokenSync_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("SUB_accessctrl_accesstoken_checkAccessTokenSync_0400 start");
      let atManager = abilityAccessCtrl.createAtManager();
      let permissionName: Permissions = "" as Permissions;
      try {
        atManager.checkAccessTokenSync(tokenID, permissionName);
        expect(false).assertFail();
        done();
      } catch (error) {
        console.error("SUB_accessctrl_accesstoken_checkAccessTokenSync_0400 error" + JSON.stringify(error));
        expect((error as BusinessError).code).assertEqual(ERR_PARAM_INVALID);
        done();
      }
    })

    /**
     * @tc.name   SUB_accessctrl_accesstoken_checkAccessTokenSync_0500
     * @tc.number SUB_accessctrl_accesstoken_checkAccessTokenSync_0500
     * @tc.desc   Test checkAccessTokenSync, permissionName exceeds 256 characters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_accessctrl_accesstoken_checkAccessTokenSync_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info("SUB_accessctrl_accesstoken_checkAccessTokenSync_0500 start");
      let atManager = abilityAccessCtrl.createAtManager();
      let permissionName = 'a'.repeat(257) as Permissions;
      try {
        atManager.checkAccessTokenSync(tokenID, permissionName);
        expect(false).assertFail();
        done();
      } catch (error) {
        console.error("SUB_accessctrl_accesstoken_checkAccessTokenSync_0500 error" + JSON.stringify(error));
        expect((error as BusinessError).code).assertEqual(ERR_PARAM_INVALID);
        done();
      }
    })

    /**
     * @tc.name   SUB_accessctrl_accesstoken_checkAccessTokenSync_0600
     * @tc.number SUB_accessctrl_accesstoken_checkAccessTokenSync_0600
     * @tc.desc   Test checkAccessTokenSync, noexist tokenid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_accessctrl_accesstoken_checkAccessTokenSync_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info("SUB_accessctrl_accesstoken_checkAccessTokenSync_0600 start");
      let atManager = abilityAccessCtrl.createAtManager();
      let noExistId = 111111;
      try {
        let status = atManager.checkAccessTokenSync(noExistId, permissionNameSystem);
        expect(status).assertEqual(abilityAccessCtrl.GrantStatus.PERMISSION_DENIED);
        done();
      } catch(error) {
        console.error("SUB_accessctrl_accesstoken_checkAccessTokenSync_0600 error" + JSON.stringify(error));
        expect(false).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_accessctrl_accesstoken_checkAccessTokenSync_0700
     * @tc.number SUB_accessctrl_accesstoken_checkAccessTokenSync_0700
     * @tc.desc   Test checkAccessTokenSync, noexist permission.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_accessctrl_accesstoken_checkAccessTokenSync_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_accessctrl_accesstoken_checkAccessTokenSync_0700 start");
      let atManager = abilityAccessCtrl.createAtManager();
      try {
        let permissionName: Permissions = "ohos.test.test" as Permissions;
        let status = atManager.checkAccessTokenSync(tokenID, permissionName);
        expect(status).assertEqual(abilityAccessCtrl.GrantStatus.PERMISSION_DENIED);
        done();
      } catch(error) {
        console.error("SUB_accessctrl_accesstoken_checkAccessTokenSync_0700 error" + JSON.stringify(error));
        expect(false).assertFail();
        done();
      }
    })  

    /**
     * @tc.name   SUB_accessctrl_accesstoken_checkAccessToken_Promise_0100
     * @tc.number SUB_accessctrl_accesstoken_checkAccessToken_Promise_0100
     * @tc.desc   After the installation, user_grant permission is not granted by default(Promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_accessctrl_accesstoken_checkAccessToken_Promise_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info("SUB_accessctrl_accesstoken_checkAccessToken_Promise_0100 start");
      let atManager = abilityAccessCtrl.createAtManager();
      try {
        let status = await atManager.checkAccessToken(tokenID, permissionNameUser);
        expect(status).assertEqual(abilityAccessCtrl.GrantStatus.PERMISSION_DENIED);
        done();
      } catch(error) {
        console.error("SUB_accessctrl_accesstoken_checkAccessToken_Promise_0100 error" + JSON.stringify(error));
        expect(false).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_accessctrl_accesstoken_checkAccessToken_Promise_0200
     * @tc.number SUB_accessctrl_accesstoken_checkAccessToken_Promise_0200
     * @tc.desc   After the installation, system_grant permission is granted by default(Promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_accessctrl_accesstoken_checkAccessToken_Promise_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info("SUB_accessctrl_accesstoken_checkAccessToken_Promise_0200 start");
      let atManager = abilityAccessCtrl.createAtManager();
      try {
        let status = await atManager.checkAccessToken(tokenID, permissionNameSystem);
        expect(status).assertEqual(abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED);
        done();
      } catch(error) {
        console.error("SUB_accessctrl_accesstoken_checkAccessToken_Promise_0200 error" + JSON.stringify(error));
        expect(false).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_accessctrl_accesstoken_checkAccessToken_Promise_0300
     * @tc.number SUB_accessctrl_accesstoken_checkAccessToken_Promise_0300
     * @tc.desc   Test checkAccessToken(promise), invalid TokenID(0).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_accessctrl_accesstoken_checkAccessToken_Promise_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_accessctrl_accesstoken_checkAccessToken_Promise_0300 start");
      let atManager = abilityAccessCtrl.createAtManager();
      try {
        atManager.checkAccessToken(0, permissionNameUser).catch((error: BusinessError) => {
          console.error("SUB_accessctrl_accesstoken_checkAccessToken_Promise_0300 error" + JSON.stringify(error));
          expect(error.code).assertEqual(ERR_PARAM_INVALID);
          done();
        });
      } catch(error) {
        console.error("catch SUB_accessctrl_accesstoken_checkAccessToken_Promise_0300 failed" + JSON.stringify(error));
        expect(false).assertFail();
      }
    })

    /**
     * @tc.name   SUB_accessctrl_accesstoken_checkAccessToken_Promise_0400
     * @tc.number SUB_accessctrl_accesstoken_checkAccessToken_Promise_0400
     * @tc.desc   Test checkAccessToken(promise), permissionName is empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_accessctrl_accesstoken_checkAccessToken_Promise_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("SUB_accessctrl_accesstoken_checkAccessToken_Promise_0400 start");
      let atManager = abilityAccessCtrl.createAtManager();
      let permissionName: Permissions = "" as Permissions;
      try {
        atManager.checkAccessToken(tokenID, permissionName).catch((error: BusinessError) => {
          console.error("SUB_accessctrl_accesstoken_checkAccessToken_Promise_0400 error" + JSON.stringify(error));
          expect(error.code).assertEqual(ERR_PARAM_INVALID);
          done();
        });
      } catch(error) {
        console.error("catch SUB_accessctrl_accesstoken_checkAccessToken_Promise_0400 failed" + JSON.stringify(error));
        expect(false).assertFail();
      }
    })

    /**
     * @tc.name   SUB_accessctrl_accesstoken_checkAccessToken_Promise_0500
     * @tc.number SUB_accessctrl_accesstoken_checkAccessToken_Promise_0500
     * @tc.desc   Test checkAccessToken(promise), permissionName exceeds 256 characters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_accessctrl_accesstoken_checkAccessToken_Promise_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info("SUB_accessctrl_accesstoken_checkAccessToken_Promise_0500 start");
      let atManager = abilityAccessCtrl.createAtManager();
      let permissionName = 'a'.repeat(257) as Permissions;
      try {
        atManager.checkAccessToken(tokenID, permissionName).catch((error: BusinessError) => {
          console.error("SUB_accessctrl_accesstoken_checkAccessToken_Promise_0500 error" + JSON.stringify(error));
          expect(error.code).assertEqual(ERR_PARAM_INVALID);
          done();
        });
      } catch(error) {
        console.error("catch SUB_accessctrl_accesstoken_checkAccessToken_Promise_0500 failed" + JSON.stringify(error));
        expect(false).assertFail();
      }
    })

    /**
     * @tc.name   SUB_accessctrl_accesstoken_checkAccessToken_Promise_0600
     * @tc.number SUB_accessctrl_accesstoken_checkAccessToken_Promise_0600
     * @tc.desc   Test checkAccessToken(promise), noexist tokenid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_accessctrl_accesstoken_checkAccessToken_Promise_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info("SUB_accessctrl_accesstoken_checkAccessToken_Promise_0600 start");
      let atManager = abilityAccessCtrl.createAtManager();
      let noExistId = 111111;
      try {
        atManager.checkAccessToken(noExistId, permissionNameSystem).then((status: abilityAccessCtrl.GrantStatus) => {
          expect(status).assertEqual(abilityAccessCtrl.GrantStatus.PERMISSION_DENIED);
          done();
        });
      } catch (error) {
        console.error("SUB_accessctrl_accesstoken_checkAccessToken_Promise_0600 failed" + JSON.stringify(error));
        expect(false).assertFail();
      }
    })

    /**
     * @tc.name   SUB_accessctrl_accesstoken_checkAccessToken_Promise_0700
     * @tc.number SUB_accessctrl_accesstoken_checkAccessToken_Promise_0700
     * @tc.desc   Test checkAccessToken(promise), noexist permission.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_accessctrl_accesstoken_checkAccessToken_Promise_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_accessctrl_accesstoken_checkAccessToken_Promise_0700 start");
      let atManager = abilityAccessCtrl.createAtManager();
      let permissionName: Permissions = "ohos.test.test" as Permissions;
      try {
        atManager.checkAccessToken(tokenID, permissionName).then((status: abilityAccessCtrl.GrantStatus) => {
          expect(status).assertEqual(abilityAccessCtrl.GrantStatus.PERMISSION_DENIED);
          done();
        });
      } catch (error) {
        console.error("SUB_accessctrl_accesstoken_checkAccessToken_Promise_0700 failed" + JSON.stringify(error));
        expect(false).assertFail();
      }
    })

    /**
     * @tc.name   SUB_accessctrl_accesstoken_SwitchType_0100
     * @tc.number SUB_accessctrl_accesstoken_SwitchType_0100
     * @tc.desc   abilityAccessCtrl SwitchType CAMERA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_accessctrl_accesstoken_SwitchType_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      console.info('----------------------SUB_accessctrl_accesstoken_SwitchType_0100---------------------------');
      let value = abilityAccessCtrl.SwitchType.CAMERA;
      console.info('SUB_accessctrl_accesstoken_SwitchType_0100 value is: ' + value);
      expect(value).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_accessctrl_accesstoken_SwitchType_0200
     * @tc.number SUB_accessctrl_accesstoken_SwitchType_0200
     * @tc.desc   abilityAccessCtrl SwitchType MICROPHONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_accessctrl_accesstoken_SwitchType_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      console.info('----------------------SUB_accessctrl_accesstoken_SwitchType_0200---------------------------');
      let value = abilityAccessCtrl.SwitchType.MICROPHONE;
      console.info('SUB_accessctrl_accesstoken_SwitchType_0200 value is: ' + value);
      expect(value).assertEqual(1);
      done();
    })

    /**
     * @tc.name   SUB_accessctrl_accesstoken_SwitchType_0300
     * @tc.number SUB_accessctrl_accesstoken_SwitchType_0300
     * @tc.desc   abilityAccessCtrl SwitchType LOCATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_accessctrl_accesstoken_SwitchType_0300", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      console.info('----------------------SUB_accessctrl_accesstoken_SwitchType_0300---------------------------');
      let value = abilityAccessCtrl.SwitchType.LOCATION;
      console.info('SUB_accessctrl_accesstoken_SwitchType_0300 value is: ' + value);
      expect(value).assertEqual(2);
      done();
    })

    /**
     * @tc.name   SUB_accessctrl_accesstoken_PermissionStateChangeType_0100
     * @tc.number SUB_accessctrl_accesstoken_PermissionStateChangeType_0100
     * @tc.desc   abilityAccessCtrl PermissionStateChangeType PERMISSION_GRANTED_OPER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_accessctrl_accesstoken_PermissionStateChangeType_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      console.info('----------------------SUB_accessctrl_accesstoken_PermissionStateChangeType_0100---------------------------');
      let value = abilityAccessCtrl.PermissionStateChangeType.PERMISSION_GRANTED_OPER;
      console.info('SUB_accessctrl_accesstoken_PermissionStateChangeType_0100 value is: ' + value);
      expect(value).assertEqual(1);
      done();
    })

    /**
     * @tc.name   SUB_accessctrl_accesstoken_PermissionStateChangeType_0200
     * @tc.number SUB_accessctrl_accesstoken_PermissionStateChangeType_0200
     * @tc.desc   abilityAccessCtrl PermissionStateChangeType PERMISSION_REVOKED_OPER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_accessctrl_accesstoken_PermissionStateChangeType_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      console.info('----------------------SUB_accessctrl_accesstoken_PermissionStateChangeType_0200---------------------------');
      let value = abilityAccessCtrl.PermissionStateChangeType.PERMISSION_REVOKED_OPER;
      console.info('SUB_accessctrl_accesstoken_PermissionStateChangeType_0200 value is: ' + value);
      expect(value).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_accessctrl_accesstoken_PermissionStatus_0100
     * @tc.number SUB_accessctrl_accesstoken_PermissionStatus_0100
     * @tc.desc   abilityAccessCtrl PermissionStatus DENIED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_accessctrl_accesstoken_PermissionStatus_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      console.info('----------------------SUB_accessctrl_accesstoken_PermissionStatus_0100---------------------------');
      let value = abilityAccessCtrl.PermissionStatus.DENIED;
      console.info('SUB_accessctrl_accesstoken_PermissionStatus_0100 value is: ' + value);
      expect(value).assertEqual(-1);
      done();
    })

    /**
     * @tc.name   SUB_accessctrl_accesstoken_PermissionStatus_0200
     * @tc.number SUB_accessctrl_accesstoken_PermissionStatus_0200
     * @tc.desc   abilityAccessCtrl PermissionStatus GRANTED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_accessctrl_accesstoken_PermissionStatus_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      console.info('----------------------SUB_accessctrl_accesstoken_PermissionStatus_0200---------------------------');
      let value = abilityAccessCtrl.PermissionStatus.GRANTED;
      console.info('SUB_accessctrl_accesstoken_PermissionStatus_0200 value is: ' + value);
      expect(value).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_accessctrl_accesstoken_PermissionStatus_0300
     * @tc.number SUB_accessctrl_accesstoken_PermissionStatus_0300
     * @tc.desc   abilityAccessCtrl PermissionStatus NOT_DETERMINED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_accessctrl_accesstoken_PermissionStatus_0300", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      console.info('----------------------SUB_accessctrl_accesstoken_PermissionStatus_0300---------------------------');
      let value = abilityAccessCtrl.PermissionStatus.NOT_DETERMINED;
      console.info('SUB_accessctrl_accesstoken_PermissionStatus_0300 value is: ' + value);
      expect(value).assertEqual(1);
      done();
    })

    /**
     * @tc.name   SUB_accessctrl_accesstoken_PermissionStatus_0400
     * @tc.number SUB_accessctrl_accesstoken_PermissionStatus_0400
     * @tc.desc   abilityAccessCtrl PermissionStatus INVALID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_accessctrl_accesstoken_PermissionStatus_0400", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: Function) => {
      console.info('----------------------SUB_accessctrl_accesstoken_PermissionStatus_0400---------------------------');
      let value = abilityAccessCtrl.PermissionStatus.INVALID;
      console.info('SUB_accessctrl_accesstoken_PermissionStatus_0400 value is: ' + value);
      expect(value).assertEqual(2);
      done();
    })

    /**
     * @tc.name   SUB_accessctrl_accesstoken_PermissionStatus_0500
     * @tc.number SUB_accessctrl_accesstoken_PermissionStatus_0500
     * @tc.desc   abilityAccessCtrl PermissionStatus RESTRICTED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_accessctrl_accesstoken_PermissionStatus_0500", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      console.info('----------------------SUB_accessctrl_accesstoken_PermissionStatus_0500---------------------------');
      let value = abilityAccessCtrl.PermissionStatus.RESTRICTED;
      console.info('SUB_accessctrl_accesstoken_PermissionStatus_0500 value is: ' + value);
      expect(value).assertEqual(3);
      done();
    })

    /**
     * @tc.name   SUB_accessctrl_accesstoken_verifyAccessToken_Promise_0100
     * @tc.number SUB_accessctrl_accesstoken_verifyAccessToken_Promise_0100
     * @tc.desc   After the installation, user_grant permission is not granted by default(Promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_accessctrl_accesstoken_verifyAccessToken_Promise_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info("SUB_accessctrl_accesstoken_verifyAccessToken_Promise_0100 start");
      let atManager = abilityAccessCtrl.createAtManager();
      try {
        let status = await atManager.verifyAccessToken(tokenID, permissionNameUser);
        expect(status).assertEqual(abilityAccessCtrl.GrantStatus.PERMISSION_DENIED);
        done();
      } catch(error) {
        console.error("SUB_accessctrl_accesstoken_verifyAccessToken_Promise_0100 error" + JSON.stringify(error));
        expect(false).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_accessctrl_accesstoken_verifyAccessToken_Promise_0200
     * @tc.number SUB_accessctrl_accesstoken_verifyAccessToken_Promise_0200
     * @tc.desc   After the installation, system_grant permission is granted by default(Promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_accessctrl_accesstoken_verifyAccessToken_Promise_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info("SUB_accessctrl_accesstoken_verifyAccessToken_Promise_0200 start");
      let atManager = abilityAccessCtrl.createAtManager();
      try {
        let status = await atManager.verifyAccessToken(tokenID, permissionNameSystem);
        expect(status).assertEqual(abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED);
        done();
      } catch(error) {
        console.error("SUB_accessctrl_accesstoken_verifyAccessToken_Promise_0200 error" + JSON.stringify(error));
        expect(false).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_accessctrl_accesstoken_verifyAccessToken_Promise_0300
     * @tc.number SUB_accessctrl_accesstoken_verifyAccessToken_Promise_0300
     * @tc.desc   Test verifyAccessToken(promise), invalid TokenID(0).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_accessctrl_accesstoken_verifyAccessToken_Promise_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_accessctrl_accesstoken_verifyAccessToken_Promise_0300 start");
      let atManager = abilityAccessCtrl.createAtManager();
      try {
        let status = await atManager.verifyAccessToken(0, permissionNameUser);
        expect(status).assertEqual(abilityAccessCtrl.GrantStatus.PERMISSION_DENIED);
        done();
      } catch(error) {
        console.error("SUB_accessctrl_accesstoken_verifyAccessToken_Promise_0300 error" + JSON.stringify(error));
        expect(false).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_accessctrl_accesstoken_verifyAccessToken_Promise_0400
     * @tc.number SUB_accessctrl_accesstoken_verifyAccessToken_Promise_0400
     * @tc.desc   Test verifyAccessToken(promise), permissionName is empty.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_accessctrl_accesstoken_verifyAccessToken_Promise_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("SUB_accessctrl_accesstoken_verifyAccessToken_Promise_0400 start");
      let atManager = abilityAccessCtrl.createAtManager();
      let permissionName: Permissions = "" as Permissions;
      try {
        let status = await atManager.verifyAccessToken(tokenID, permissionName);
        expect(status).assertEqual(abilityAccessCtrl.GrantStatus.PERMISSION_DENIED);
        done();
      } catch(error) {
        console.error("SUB_accessctrl_accesstoken_verifyAccessToken_Promise_0400 error" + JSON.stringify(error));
        expect(false).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_accessctrl_accesstoken_verifyAccessToken_Promise_0500
     * @tc.number SUB_accessctrl_accesstoken_verifyAccessToken_Promise_0500
     * @tc.desc   Test verifyAccessToken(promise), permissionName exceeds 256 characters.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_accessctrl_accesstoken_verifyAccessToken_Promise_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info("SUB_accessctrl_accesstoken_verifyAccessToken_Promise_0500 start");
      let atManager = abilityAccessCtrl.createAtManager();
      let permissionName = 'a'.repeat(257) as Permissions;
      try {
        let status = await atManager.verifyAccessToken(tokenID, permissionName);
        expect(status).assertEqual(abilityAccessCtrl.GrantStatus.PERMISSION_DENIED);
        done();
      } catch(error) {
        console.error("SUB_accessctrl_accesstoken_verifyAccessToken_Promise_0500 error" + JSON.stringify(error));
        expect(false).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_accessctrl_accesstoken_verifyAccessToken_Promise_0600
     * @tc.number SUB_accessctrl_accesstoken_verifyAccessToken_Promise_0600
     * @tc.desc   Test verifyAccessToken(promise), noexist tokenid.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_accessctrl_accesstoken_verifyAccessToken_Promise_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info("SUB_accessctrl_accesstoken_verifyAccessToken_Promise_0600 start");
      let atManager = abilityAccessCtrl.createAtManager();
      let noExistId = 111111;
      try {
        atManager.verifyAccessToken(noExistId, permissionNameSystem).then((status: abilityAccessCtrl.GrantStatus) => {
          expect(status).assertEqual(abilityAccessCtrl.GrantStatus.PERMISSION_DENIED);
          done();
        });
      } catch (error) {
        console.error("SUB_accessctrl_accesstoken_verifyAccessToken_Promise_0600 failed" + JSON.stringify(error));
        expect(false).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_accessctrl_accesstoken_verifyAccessToken_Promise_0700
     * @tc.number SUB_accessctrl_accesstoken_verifyAccessToken_Promise_0700
     * @tc.desc   Test verifyAccessToken(promise), noexist permission.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_accessctrl_accesstoken_verifyAccessToken_Promise_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_accessctrl_accesstoken_verifyAccessToken_Promise_0700 start");
      let atManager = abilityAccessCtrl.createAtManager();
      let permissionName: Permissions = "ohos.test.test" as Permissions;
      try {
        atManager.verifyAccessToken(tokenID, permissionName).then((status: abilityAccessCtrl.GrantStatus) => {
          expect(status).assertEqual(abilityAccessCtrl.GrantStatus.PERMISSION_DENIED);
          done();
        });
      } catch (error) {
        console.error("SUB_accessctrl_accesstoken_verifyAccessToken_Promise_0700 failed" + JSON.stringify(error));
        expect(false).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_accessctrl_accesstoken_Off_0100
     * @tc.number SUB_accessctrl_accesstoken_Off_0100
     * @tc.desc   abilityAccessCtrl Off The permission list does not exist
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_accessctrl_accesstoken_Off_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('----------------------SUB_accessctrl_accesstoken_Off_0100---------------------------');
      let atManager = abilityAccessCtrl.createAtManager();
      try {
        let testPermissionName: Permissions = "ohos.permission.DISTRIBUTED_DATASYNC" as Permissions;
        let fn: (data: abilityAccessCtrl.PermissionStateChangeInfo) => void =
          (data: abilityAccessCtrl.PermissionStateChangeInfo) => {
            console.info('SUB_accessctrl_accesstoken_Off_0100 Callback received: ' + JSON.stringify(data));
            let PermissionStateChangeInfo: abilityAccessCtrl.PermissionStateChangeInfo = data;
            expect(abilityAccessCtrl.PermissionStateChangeType.PERMISSION_REVOKED_OPER).assertEqual(PermissionStateChangeInfo.change);
            expect(tokenID).assertEqual(PermissionStateChangeInfo.tokenID);
            expect(testPermissionName).assertEqual(PermissionStateChangeInfo.permissionName);
            done();
          }
        
        let permissionList: Array<Permissions> = [testPermissionName];
        atManager.off('selfPermissionStateChange', permissionList, fn);
        console.info('SUB_accessctrl_accesstoken_Off_0100 success');
        expect(false).assertFail();
        done();
      } catch (error) {
        error = error as BusinessError;
        console.error("SUB_accessctrl_accesstoken_Off_0100 error" + JSON.stringify(error));
        expect(ERR_NOT_USE_TOGETHER).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.name   SUB_accessctrl_accesstoken_Off_0200
     * @tc.number SUB_accessctrl_accesstoken_Off_0200
     * @tc.desc   abilityAccessCtrl On Off The permission list does not exist
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_accessctrl_accesstoken_Off_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('----------------------SUB_accessctrl_accesstoken_Off_0200---------------------------');
      let atManager = abilityAccessCtrl.createAtManager();
      let testPermissionName: Permissions = "ohos.permission.DISTRIBUTED_DATASYNC" as Permissions;
      let permissionList: Array<Permissions> = [testPermissionName];
      try {
        atManager.on('selfPermissionStateChange', permissionList,
          (data: abilityAccessCtrl.PermissionStateChangeInfo) => {
            console.info(`SUB_accessctrl_accesstoken_Off_0200 on callback data: ${JSON.stringify(data)}`);
          });
        atManager.off('selfPermissionStateChange', permissionList, (data: abilityAccessCtrl.PermissionStateChangeInfo) => {
            console.info(`SUB_accessctrl_accesstoken_Off_0200 off callback data: ${JSON.stringify(data)}`);
          });
        console.info('SUB_accessctrl_accesstoken_Off_0200 success');
        expect(false).assertFail();
        done();
      } catch (error) {
        error = error as BusinessError;
        console.error("SUB_accessctrl_accesstoken_Off_0200 error" + JSON.stringify(error));
        expect(ERR_NOT_USE_TOGETHER).assertEqual(error.code);
        atManager.off('selfPermissionStateChange', permissionList);
        done();
      }
    })

    /**
     * @tc.name   SUB_accessctrl_accesstoken_Off_0300
     * @tc.number SUB_accessctrl_accesstoken_Off_0300
     * @tc.desc   abilityAccessCtrl On Off The permission list does not exist
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_accessctrl_accesstoken_Off_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('----------------------SUB_accessctrl_accesstoken_Off_0300---------------------------');
      let atManager = abilityAccessCtrl.createAtManager();
      let permissionList: Array<Permissions> = [];
      try {
        atManager.on('selfPermissionStateChange', permissionList,
          (data: abilityAccessCtrl.PermissionStateChangeInfo) => {
            console.info(`SUB_accessctrl_accesstoken_Off_0300 on callback data: ${JSON.stringify(data)}`);
          });
        atManager.off('selfPermissionStateChange', permissionList, (data: abilityAccessCtrl.PermissionStateChangeInfo) => {
            console.info(`SUB_accessctrl_accesstoken_Off_0300 off callback data: ${JSON.stringify(data)}`);
          });
        console.info('SUB_accessctrl_accesstoken_Off_0300 success');
        expect(false).assertTrue();
        done();
      } catch (error) {
        error = error as BusinessError;
        console.error("SUB_accessctrl_accesstoken_Off_0300 error" + JSON.stringify(error));
        expect(ERR_NOT_USE_TOGETHER).assertEqual(error.code);
        atManager.off('selfPermissionStateChange', permissionList);
        done();
      }
    })

    /**
     * @tc.name   SUB_accessctrl_accesstoken_On_0100
     * @tc.number SUB_accessctrl_accesstoken_On_0100
     * @tc.desc   abilityAccessCtrl On The size of the permission list exceeds the limit of 1024
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_accessctrl_accesstoken_On_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('----------------------SUB_accessctrl_accesstoken_On_0100---------------------------');
      let atManager = abilityAccessCtrl.createAtManager();
      let testPermissionName2: Permissions = 'ohos.permission.DISTRIBUTED_DATASYNC' as Permissions;
      let permissionList: Array<Permissions> = [testPermissionName2];
      try {
        let fn: (data: abilityAccessCtrl.PermissionStateChangeInfo) => void =
        (data: abilityAccessCtrl.PermissionStateChangeInfo) => {
            console.info('Callback received: ' + JSON.stringify(data));
          }
        for (let i = 0; i < 1025; i++) {
          permissionList.push(testPermissionName2);
        }
        atManager.on('selfPermissionStateChange', permissionList, fn);
        console.info('SUB_accessctrl_accesstoken_On_0100 success');
        expect(false).assertFail();
        done();
      } catch (error) {
        error = error as BusinessError;
        console.error("SUB_accessctrl_accesstoken_On_0100 error" + JSON.stringify(error));
        expect(ERR_PARAM_INVALID).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.name   SUB_accessctrl_accesstoken_On_0200
     * @tc.number SUB_accessctrl_accesstoken_On_0200
     * @tc.desc   abilityAccessCtrl On Duplicate registration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_accessctrl_accesstoken_On_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('----------------------SUB_accessctrl_accesstoken_On_0200---------------------------');
      let atManager = abilityAccessCtrl.createAtManager();
      let testPermissionName: Permissions = "ohos.permission.DISTRIBUTED_DATASYNC" as Permissions;
      let permissionList: Array<Permissions> = [testPermissionName];
      try {
        let fn: (data: abilityAccessCtrl.PermissionStateChangeInfo) => void =
        (data: abilityAccessCtrl.PermissionStateChangeInfo) => {
            console.info('SUB_accessctrl_accesstoken_On_0200 Callback received: ' + JSON.stringify(data));
          }
        atManager.on('selfPermissionStateChange', permissionList, fn);
        atManager.on('selfPermissionStateChange', permissionList, fn);
        console.info('SUB_accessctrl_accesstoken_On_0200 success');
        expect(false).assertFail();
        done();

      } catch (error) {
        error = error as BusinessError;
        console.error("SUB_accessctrl_accesstoken_On_0200 error" + JSON.stringify(error));
        expect(ERR_NOT_USE_TOGETHER).assertEqual(error.code);
        atManager.off('selfPermissionStateChange', permissionList);
        done();
      }
    })

    /**
     * @tc.name   SUB_accessctrl_accesstoken_On_0300
     * @tc.number SUB_accessctrl_accesstoken_On_0300
     * @tc.desc   abilityAccessCtrl On The length of the permission name exceeds 256
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_accessctrl_accesstoken_On_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('----------------------SUB_accessctrl_accesstoken_On_0300---------------------------');
      let atManager = abilityAccessCtrl.createAtManager();
      try {
        let fn: (data: abilityAccessCtrl.PermissionStateChangeInfo) => void =
          (data: abilityAccessCtrl.PermissionStateChangeInfo) => {
            console.log('Callback received: ' + JSON.stringify(data));
          }
        let testPermissionName2: Permissions = 'a'.repeat(257) as Permissions;
        let permissionList: Array<Permissions> = [testPermissionName2];
        atManager.on('selfPermissionStateChange', permissionList, fn);
        console.info('SUB_accessctrl_accesstoken_On_0300 success');
        expect(false).assertFail();
        done();
      } catch (error) {
        error = error as BusinessError;
        console.error("SUB_accessctrl_accesstoken_On_0300 error" + JSON.stringify(error));
        expect(ERR_PARAM_INVALID).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.name   SUB_accessctrl_accesstoken_On_0400
     * @tc.number SUB_accessctrl_accesstoken_On_0400
     * @tc.desc   abilityAccessCtrl On The number of registered callbacks exceeds the limit of 200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_accessctrl_accesstoken_On_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('----------------------SUB_accessctrl_accesstoken_On_0400---------------------------');
      let atManager = abilityAccessCtrl.createAtManager();
      let testPermissionName: Permissions = "ohos.permission.DISTRIBUTED_DATASYNC" as Permissions;
      let permissionList: Array<Permissions> = [testPermissionName];
      try {
        for (let i = 0; i < 201; i++) {
          atManager.on('selfPermissionStateChange', permissionList,
            (data: abilityAccessCtrl.PermissionStateChangeInfo) => {
              console.info(`SUB_accessctrl_accesstoken_On_0400 monitor#${i}trigger: ${JSON.stringify(data)}`);
            });
        }
        console.info('SUB_accessctrl_accesstoken_On_0400 success');
        expect(false).assertFail();
        done();
      } catch (error) {
        error = error as BusinessError;
        console.error("SUB_accessctrl_accesstoken_On_0400 error" + JSON.stringify(error));
        expect(ERR_REGISTERS_EXCEED_LIMITATION).assertEqual(error.code);
        atManager.off('selfPermissionStateChange', permissionList);
        done();
      }
    })

    /**
     * @tc.name   SUB_accessctrl_accesstoken_getSelfPermissionStatus_0100
     * @tc.number SUB_accessctrl_accesstoken_getSelfPermissionStatus_0100
     * @tc.desc   After the installation, user_grant permission is not granted by default(Promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_accessctrl_accesstoken_getSelfPermissionStatus_0100", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      console.info("SUB_accessctrl_accesstoken_getSelfPermissionStatus_0100 start");
      let atManager = abilityAccessCtrl.createAtManager();
      let result = atManager.getSelfPermissionStatus(permissionNameUser);
      console.info("SUB_accessctrl_accesstoken_getSelfPermissionStatus_0100 result: " + result);
      expect(result).assertEqual(abilityAccessCtrl.PermissionStatus.NOT_DETERMINED);
      done();
    })

    /**
     * @tc.name   SUB_accessctrl_accesstoken_getSelfPermissionStatus_0200
     * @tc.number SUB_accessctrl_accesstoken_getSelfPermissionStatus_0200
     * @tc.desc   After the installation, system_grant permission is granted by default(Promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_accessctrl_accesstoken_getSelfPermissionStatus_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      console.info("SUB_accessctrl_accesstoken_getSelfPermissionStatus_0200 start");
      let atManager = abilityAccessCtrl.createAtManager();
      let result = atManager.getSelfPermissionStatus(permissionNameSystem);
      console.info("SUB_accessctrl_accesstoken_getSelfPermissionStatus_0200 result: " + result);
      expect(result).assertEqual(abilityAccessCtrl.PermissionStatus.GRANTED);
      done();
    })

    /**
     * @tc.name   SUB_accessctrl_accesstoken_getSelfPermissionStatus_0300
     * @tc.number SUB_accessctrl_accesstoken_getSelfPermissionStatus_0300
     * @tc.desc   Call getSelfPermissionStatus with invalid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_accessctrl_accesstoken_getSelfPermissionStatus_0300", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      console.info("SUB_accessctrl_accesstoken_getSelfPermissionStatus_0300 start");
      let atManager = abilityAccessCtrl.createAtManager();
      try {
        let permissionName: Permissions = "" as Permissions;
        let result = atManager.getSelfPermissionStatus(permissionName);
      } catch (error) {
        error = error as BusinessError;
        console.error("SUB_accessctrl_accesstoken_getSelfPermissionStatus_0300 error " + JSON.stringify(error));
        expect(error.code).assertEqual(ERR_PARAM_INVALID);
        done();
      }
    })

    /**
     * @tc.name   SUB_accessctrl_accesstoken_getSelfPermissionStatus_0400
     * @tc.number SUB_accessctrl_accesstoken_getSelfPermissionStatus_0400
     * @tc.desc   Call getSelfPermissionStatus with invalid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_accessctrl_accesstoken_getSelfPermissionStatus_0400", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      console.info("SUB_accessctrl_accesstoken_getSelfPermissionStatus_0400 start");
      let atManager = abilityAccessCtrl.createAtManager();
      try {
        let permissionName: Permissions = 'a'.repeat(257) as Permissions;
        let result = atManager.getSelfPermissionStatus(permissionName);
      } catch (error) {
        error = error as BusinessError;
        console.error("SUB_accessctrl_accesstoken_getSelfPermissionStatus_0400 error code " + JSON.stringify(error));
        expect(error.code).assertEqual(ERR_PARAM_INVALID);
        done();
      }
    })

    /**
     * @tc.name   SUB_accessctrl_accesstoken_getSelfPermissionStatus_0500
     * @tc.number SUB_accessctrl_accesstoken_getSelfPermissionStatus_0500
     * @tc.desc   Call getSelfPermissionStatus with invalid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_accessctrl_accesstoken_getSelfPermissionStatus_0500", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      console.info("SUB_accessctrl_accesstoken_getSelfPermissionStatus_0500 start");
      let atManager = abilityAccessCtrl.createAtManager();
      let permissionName: Permissions = "ohos.permission.INVALID_PERM" as Permissions;
      let result = atManager.getSelfPermissionStatus(permissionName);
      console.info("SUB_accessctrl_accesstoken_getSelfPermissionStatus_0500 result: " + result);
      expect(result).assertEqual(abilityAccessCtrl.PermissionStatus.INVALID);

      let result2 = atManager.getSelfPermissionStatus("ohos.permission.LOCATION");
      console.info("SUB_accessctrl_accesstoken_getSelfPermissionStatus_0500 result2: " + result2);
      expect(result2).assertEqual(abilityAccessCtrl.PermissionStatus.INVALID);
      done();
    })

    /**
     * @tc.name   SUB_accessctrl_accesstoken_getSelfPermissionStatus_0600
     * @tc.number SUB_accessctrl_accesstoken_getSelfPermissionStatus_0600
     * @tc.desc   Call enum DENIED value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_accessctrl_accesstoken_getSelfPermissionStatus_0600", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      console.info("SUB_accessctrl_accesstoken_getSelfPermissionStatus_0600 start");
      let result = abilityAccessCtrl.PermissionStatus.DENIED;
      console.info("SUB_accessctrl_accesstoken_getSelfPermissionStatus_0600 result: " + result);
      expect(result).assertEqual(-1);
      done();
    })

    /**
     * @tc.name   SUB_accessctrl_accesstoken_getSelfPermissionStatus_0700
     * @tc.number SUB_accessctrl_accesstoken_getSelfPermissionStatus_0700
     * @tc.desc   Call enum GRANTED value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_accessctrl_accesstoken_getSelfPermissionStatus_0700", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      console.info("SUB_accessctrl_accesstoken_getSelfPermissionStatus_0700 start");
      let result = abilityAccessCtrl.PermissionStatus.GRANTED;
      console.info("SUB_accessctrl_accesstoken_getSelfPermissionStatus_0700 result: " + result);
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_accessctrl_accesstoken_getSelfPermissionStatus_0800
     * @tc.number SUB_accessctrl_accesstoken_getSelfPermissionStatus_0800
     * @tc.desc   Call enum NOT_DETERMINED value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_accessctrl_accesstoken_getSelfPermissionStatus_0800", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      console.info("SUB_accessctrl_accesstoken_getSelfPermissionStatus_0800 start");
      let result = abilityAccessCtrl.PermissionStatus.NOT_DETERMINED;
      console.info("SUB_accessctrl_accesstoken_getSelfPermissionStatus_0800 result: " + result);
      expect(result).assertEqual(1);
      done();
    })

    /**
     * @tc.name   SUB_accessctrl_accesstoken_getSelfPermissionStatus_0900
     * @tc.number SUB_accessctrl_accesstoken_getSelfPermissionStatus_0900
     * @tc.desc   Call enum INVALID value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_accessctrl_accesstoken_getSelfPermissionStatus_0900", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      console.info("SUB_accessctrl_accesstoken_getSelfPermissionStatus_0900 start");
      let result = abilityAccessCtrl.PermissionStatus.INVALID;
      console.info("SUB_accessctrl_accesstoken_getSelfPermissionStatus_0900 result: " + result);
      expect(result).assertEqual(2);
      done();
    })

    /**
     * @tc.name   SUB_accessctrl_accesstoken_getSelfPermissionStatus_1000
     * @tc.number SUB_accessctrl_accesstoken_getSelfPermissionStatus_1000
     * @tc.desc   Call enum RESTRICTED value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_accessctrl_accesstoken_getSelfPermissionStatus_1000", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      console.info("SUB_accessctrl_accesstoken_getSelfPermissionStatus_1000 start");
      let result = abilityAccessCtrl.PermissionStatus.RESTRICTED;
      console.info("SUB_accessctrl_accesstoken_getSelfPermissionStatus_1000 result: " + result);
      expect(result).assertEqual(3);
      done();
    })
  })
  console.info('AccessTokenDynamicTest end');
}