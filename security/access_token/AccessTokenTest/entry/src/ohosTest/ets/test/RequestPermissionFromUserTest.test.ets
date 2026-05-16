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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { abilityAccessCtrl, PermissionRequestResult, Permissions } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { common } from '@kit.AbilityKit';

const ERR_PARAM_ERROR = 401;

let permissionNameUser: Permissions = "ohos.permission.DISTRIBUTED_DATASYNC";

export default function RequestPermissionFromUserTest() {
  describe('RequestPermissionFromUserTest', () => {
    console.info('##########start RequestPermissionFromUserTest');

    /**
     * @tc.name   Test_requestPermissionsFromUser_001
     * @tc.number Test_requestPermissionsFromUser_001
     * @tc.desc   Test requestPermissionsFromUser, permissionList is null, expect parameter type error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Test_requestPermissionsFromUser_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("Test_requestPermissionsFromUser_001 start");
      let atManager = abilityAccessCtrl.createAtManager();
      try {
        let testContext: Context = getContext(globalThis) as common.UIAbilityContext;
        let testPermissionList: Array<Permissions> | null = null;
        atManager.requestPermissionsFromUser(testContext, testPermissionList, (err: BusinessError, data: PermissionRequestResult) => {
          console.info(`Test_requestPermissionsFromUser_001 callback err->${JSON.stringify(err)} data->${JSON.stringify(data)}`);
        });
        expect(false).assertFail();
        done();
      } catch (err) {
        console.error(`Test_requestPermissionsFromUser_001 catch parameter type error, code->${err.code} message->${err.message}`);
        expect(err.code).assertEqual(ERR_PARAM_ERROR);
        done();
      }
    })

    /**
     * @tc.name   Test_requestPermissionsFromUser_002
     * @tc.number Test_requestPermissionsFromUser_002
     * @tc.desc   Test requestPermissionsFromUser, permissionList is undefined, expect parameter type error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Test_requestPermissionsFromUser_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("Test_requestPermissionsFromUser_002 start");
      let atManager = abilityAccessCtrl.createAtManager();
      try {
        let testContext: Context = getContext(globalThis) as common.UIAbilityContext;
        let testPermissionList: Array<Permissions> | undefined = undefined;
        atManager.requestPermissionsFromUser(testContext, testPermissionList, (err: BusinessError, data: PermissionRequestResult) => {
          console.info(`Test_requestPermissionsFromUser_002 callback err->${JSON.stringify(err)} data->${JSON.stringify(data)}`);
        });
        expect(false).assertFail();
        done();
      } catch (err) {
        console.error(`Test_requestPermissionsFromUser_002 catch parameter type error, code->${err.code} message->${err.message}`);
        expect(err.code).assertEqual(ERR_PARAM_ERROR);
        done();
      }
    })

    /**
     * @tc.name   Test_requestPermissionsFromUser_003
     * @tc.number Test_requestPermissionsFromUser_003
     * @tc.desc   Test requestPermissionsFromUser, context is null, expect parameter type error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Test_requestPermissionsFromUser_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("Test_requestPermissionsFromUser_003 start");
      let atManager = abilityAccessCtrl.createAtManager();
      try {
        let testContext: common.UIAbilityContext | null = null;
        let permissionList: Array<Permissions> = [permissionNameUser];
        atManager.requestPermissionsFromUser(testContext, permissionList, (err: BusinessError, data: PermissionRequestResult) => {
          console.info(`Test_requestPermissionsFromUser_003 callback err->${JSON.stringify(err)} data->${JSON.stringify(data)}`);
        });
        expect(false).assertFail();
        done();
      } catch (err) {
        console.error(`Test_requestPermissionsFromUser_003 catch parameter type error, code->${err.code} message->${err.message}`);
        expect(err.code).assertEqual(ERR_PARAM_ERROR);
        done();
      }
    })

    /**
     * @tc.name   Test_requestPermissionsFromUser_004
     * @tc.number Test_requestPermissionsFromUser_004
     * @tc.desc   Test requestPermissionsFromUser, context is undefined, expect parameter type error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Test_requestPermissionsFromUser_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("Test_requestPermissionsFromUser_004 start");
      let atManager = abilityAccessCtrl.createAtManager();
      try {
        let testContext: common.UIAbilityContext | undefined = undefined;
        let permissionList: Array<Permissions> = [permissionNameUser];
        atManager.requestPermissionsFromUser(testContext, permissionList, (err: BusinessError, data: PermissionRequestResult) => {
          console.info(`Test_requestPermissionsFromUser_004 callback err->${JSON.stringify(err)} data->${JSON.stringify(data)}`);
        });
        expect(false).assertFail();
        done();
      } catch (err) {
        console.error(`Test_requestPermissionsFromUser_004 catch parameter type error, code->${err.code} message->${err.message}`);
        expect(err.code).assertEqual(ERR_PARAM_ERROR);
        done();
      }
    })

    /**
     * @tc.name   Test_requestPermissionsFromUser_005
     * @tc.number Test_requestPermissionsFromUser_005
     * @tc.desc   Test requestPermissionsFromUser(Promise), context is null, expect parameter type error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Test_requestPermissionsFromUser_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("Test_requestPermissionsFromUser_005 start");
      let atManager = abilityAccessCtrl.createAtManager();
      try {
        let testContext: common.UIAbilityContext | null = null;
        let permissionList: Array<Permissions> = [permissionNameUser];
        atManager.requestPermissionsFromUser(testContext, permissionList).then((data: PermissionRequestResult) => {
          console.info(`Test_requestPermissionsFromUser_005 success, data->${JSON.stringify(data)}`);
          expect(false).assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.error(`Test_requestPermissionsFromUser_005 fail, err code->${err.code} message->${err.message}`);
          expect(err.code).assertEqual(ERR_PARAM_ERROR);
          done();
        });
      } catch (err) {
        console.error(`Test_requestPermissionsFromUser_005 catch parameter type error, code->${err.code} message->${err.message}`);
        expect(err.code).assertEqual(ERR_PARAM_ERROR);
        done();
      }
    })

    /**
     * @tc.name   Test_requestPermissionsFromUser_006
     * @tc.number Test_requestPermissionsFromUser_006
     * @tc.desc   Test requestPermissionsFromUser(Promise), context is undefined, expect parameter type error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Test_requestPermissionsFromUser_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("Test_requestPermissionsFromUser_006 start");
      let atManager = abilityAccessCtrl.createAtManager();
      try {
        let testContext: common.UIAbilityContext | undefined = undefined;
        let permissionList: Array<Permissions> = [permissionNameUser];
        atManager.requestPermissionsFromUser(testContext, permissionList).then((data: PermissionRequestResult) => {
          console.info(`Test_requestPermissionsFromUser_006 success, data->${JSON.stringify(data)}`);
          expect(false).assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.error(`Test_requestPermissionsFromUser_006 fail, err code->${err.code} message->${err.message}`);
          expect(err.code).assertEqual(ERR_PARAM_ERROR);
          done();
        });
      } catch (err) {
        console.error(`Test_requestPermissionsFromUser_006 catch parameter type error, code->${err.code} message->${err.message}`);
        expect(err.code).assertEqual(ERR_PARAM_ERROR);
        done();
      }
    })

    /**
     * @tc.name   Test_requestPermissionsFromUser_007
     * @tc.number Test_requestPermissionsFromUser_007
     * @tc.desc   Test requestPermissionsFromUser(Promise), permissionList is null, expect parameter type error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Test_requestPermissionsFromUser_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("Test_requestPermissionsFromUser_007 start");
      let atManager = abilityAccessCtrl.createAtManager();
      try {
        let testContext: Context = getContext(globalThis) as common.UIAbilityContext;
        let testPermissionList: Array<Permissions> | null = null;
        atManager.requestPermissionsFromUser(testContext, testPermissionList).then((data: PermissionRequestResult) => {
          console.info(`Test_requestPermissionsFromUser_007 success, data->${JSON.stringify(data)}`);
          expect(false).assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.error(`Test_requestPermissionsFromUser_007 fail, err code->${err.code} message->${err.message}`);
          expect(err.code).assertEqual(ERR_PARAM_ERROR);
          done();
        });
      } catch (err) {
        console.error(`Test_requestPermissionsFromUser_007 catch parameter type error, code->${err.code} message->${err.message}`);
        expect(err.code).assertEqual(ERR_PARAM_ERROR);
        done();
      }
    })

    /**
     * @tc.name   Test_requestPermissionsFromUser_008
     * @tc.number Test_requestPermissionsFromUser_008
     * @tc.desc   Test requestPermissionsFromUser(Promise), permissionList is undefined, expect parameter type error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Test_requestPermissionsFromUser_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("Test_requestPermissionsFromUser_008 start");
      let atManager = abilityAccessCtrl.createAtManager();
      try {
        let testContext: Context = getContext(globalThis) as common.UIAbilityContext;
        let testPermissionList: Array<Permissions> | undefined = undefined;
        atManager.requestPermissionsFromUser(testContext, testPermissionList).then((data: PermissionRequestResult) => {
          console.info(`Test_requestPermissionsFromUser_008 success, data->${JSON.stringify(data)}`);
          expect(false).assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.error(`Test_requestPermissionsFromUser_008 fail, err code->${err.code} message->${err.message}`);
          expect(err.code).assertEqual(ERR_PARAM_ERROR);
          done();
        });
      } catch (err) {
        console.error(`Test_requestPermissionsFromUser_008 catch parameter type error, code->${err.code} message->${err.message}`);
        expect(err.code).assertEqual(ERR_PARAM_ERROR);
        done();
      }
    })

    /**
     * @tc.name   Test_requestPermissionsFromUser_009
     * @tc.number Test_requestPermissionsFromUser_009
     * @tc.desc   Test requestPermissionsFromUser(Promise), permissionList is empty array, expect parameter type error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Test_requestPermissionsFromUser_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("Test_requestPermissionsFromUser_009 start");
      let atManager = abilityAccessCtrl.createAtManager();
      try {
        let testContext: Context = getContext(globalThis) as common.UIAbilityContext;
        let testPermissionList: Array<Permissions> = [];
        atManager.requestPermissionsFromUser(testContext, testPermissionList).then((data: PermissionRequestResult) => {
          console.info(`Test_requestPermissionsFromUser_009 success, data->${JSON.stringify(data)}`);
          expect(false).assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.error(`Test_requestPermissionsFromUser_009 fail, err code->${err.code} message->${err.message}`);
          expect(err.code).assertEqual(ERR_PARAM_ERROR);
          done();
        });
      } catch (err) {
        console.error(`Test_requestPermissionsFromUser_009 catch parameter type error, code->${err.code} message->${err.message}`);
        expect(err.code).assertEqual(ERR_PARAM_ERROR);
        done();
      }
    })

    /**
     * @tc.name   Test_requestPermissionsFromUser_010
     * @tc.number Test_requestPermissionsFromUser_010
     * @tc.desc   Test requestPermissionsFromUser(callback), permissionList is empty array, expect parameter type error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Test_requestPermissionsFromUser_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("Test_requestPermissionsFromUser_010 start");
      let atManager = abilityAccessCtrl.createAtManager();
      try {
        let testContext: Context = getContext(globalThis) as common.UIAbilityContext;
        let testPermissionList: Array<Permissions> = [];
        atManager.requestPermissionsFromUser(testContext, testPermissionList, (err: BusinessError, data: PermissionRequestResult) => {
          console.info(`Test_requestPermissionsFromUser_010 callback err->${JSON.stringify(err)} data->${JSON.stringify(data)}`);
        });
        expect(false).assertFail();
        done();
      } catch (err) {
        console.error(`Test_requestPermissionsFromUser_010 catch parameter type error, code->${err.code} message->${err.message}`);
        expect(err.code).assertEqual(ERR_PARAM_ERROR);
        done();
      }
    })

    console.info('##########end RequestPermissionFromUserTest');
  })
}
