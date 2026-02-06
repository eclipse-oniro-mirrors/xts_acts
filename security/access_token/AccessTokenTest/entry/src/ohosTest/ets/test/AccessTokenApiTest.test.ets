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
import bundleManager from '@ohos.bundle.bundleManager'
import { abilityAccessCtrl, common, Permissions } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { UiDriver, BY, Driver, ON } from "@ohos.UiTest";


let tokenID = 0;

export default function AccessTokenApiTest() {
  describe('AccessTokenApiTest', () => {
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
        console.error('AccessTokenTest getBundleInfoForSelf error is: ' + error.code)
      }
    })
    afterEach(() => {
    })


    /**
     * @tc.number Test_requestGlobalSwitch_0100
     * @tc.name Test_requestGlobalSwitch_001.
     * @tc.desc requestGlobalSwitch Permissions.
     * @tc.level: Level3
     * @tc.size: MediumTest
     * @tc.type: Function
     */
    it('Test_requestGlobalSwitch_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("Test_requestGlobalSwitch_001 start ");
      let atManager = abilityAccessCtrl.createAtManager();
      let context: Context = getContext(globalThis) as common.UIAbilityContext;
      try {
        atManager.requestGlobalSwitch(context, null).then((data) => {
          console.info('Test_requestGlobalSwitch_001 data:' + data);
        }).catch((err: BusinessError) => {
          console.error('Test_requestGlobalSwitch_001 err.code:' + JSON.stringify(err));
        });
      } catch (error) {
        console.info('Test_requestGlobalSwitch_001 error.code: ' + error.code);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number Test_requestGlobalSwitch_0200
     * @tc.name Test_requestGlobalSwitch_002.
     * @tc.desc requestGlobalSwitch Permissions Abnormal parameter type undefined.
     * @tc.level: Level3
     * @tc.size: MediumTest
     * @tc.type: Function
     */
    it('Test_requestGlobalSwitch_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("Test_requestGlobalSwitch_002 start ");
      let atManager = abilityAccessCtrl.createAtManager();
      let context: Context = getContext(globalThis) as common.UIAbilityContext;
      try {
        atManager.requestGlobalSwitch(context, undefined).then((data) => {
          console.info('Test_requestGlobalSwitch_002 data:' + data);
        }).catch((err: BusinessError) => {
          console.error('Test_requestGlobalSwitch_002 err.code:' + JSON.stringify(err));
        });
      } catch (error) {
        console.info('Test_requestGlobalSwitch_002 error.code: ' + error.code);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number Test_requestGlobalSwitch_0300
     * @tc.name Test_requestGlobalSwitch_003.
     * @tc.desc requestGlobalSwitch Permissions SwitchType.CAMERA.
     * @tc.level: Level3
     * @tc.size: MediumTest
     * @tc.type: Function
     */
    it('Test_requestGlobalSwitch_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("Test_requestGlobalSwitch_003 start ");
      let atManager = abilityAccessCtrl.createAtManager();
      let context: Context = getContext(globalThis) as common.UIAbilityContext;
      let type = abilityAccessCtrl.SwitchType.CAMERA;
      try {
        let flag = false;
        atManager.requestGlobalSwitch(context, type).then((data) => {
          console.info('Test_requestGlobalSwitch_003 data:' + data);
        }).catch((err: BusinessError) => {
          console.error('Test_requestGlobalSwitch_003 err.code:' + JSON.stringify(err));
          if (flag = err.code == 12100013 || err.code == 12100001) {
            expect(flag).assertTrue();
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
      } catch (error) {
        console.error('Test_requestGlobalSwitch_003 error.code: ' + error.code);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number Test_requestGlobalSwitch_0400
     * @tc.name Test_requestGlobalSwitch_004.
     * @tc.desc requestGlobalSwitch Permissions SwitchType.MICROPHONE.
     * @tc.level: Level3
     * @tc.size: MediumTest
     * @tc.type: Function
     */
    it('Test_requestGlobalSwitch_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("Test_requestGlobalSwitch_004 start ");
      let atManager = abilityAccessCtrl.createAtManager();
      let context: Context = getContext(globalThis) as common.UIAbilityContext;
      let type = abilityAccessCtrl.SwitchType.MICROPHONE;
      try {
        let flag = false;
        atManager.requestGlobalSwitch(context, type).then((data) => {
          console.info('Test_requestGlobalSwitch_004 data:' + data);
        }).catch((err: BusinessError) => {
          console.error('Test_requestGlobalSwitch_004 err.code:' + JSON.stringify(err));
          if (flag = err.code == 12100013 || err.code == 12100001) {
            expect(flag).assertTrue();
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
      } catch (error) {
        console.info('Test_requestGlobalSwitch_004 error.code: ' + error.code);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number Test_requestGlobalSwitch_0500
     * @tc.name Test_requestGlobalSwitch_005.
     * @tc.desc requestGlobalSwitch Permissions SwitchType.LOCATION.
     * @tc.level: Level3
     * @tc.size: MediumTest
     * @tc.type: Function
     */
    it('Test_requestGlobalSwitch_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info("Test_requestGlobalSwitch_005 start ");
      let atManager = abilityAccessCtrl.createAtManager();
      let context: Context = getContext(globalThis) as common.UIAbilityContext;
      let type = abilityAccessCtrl.SwitchType.LOCATION;
      try {
        let flag = false;
        atManager.requestGlobalSwitch(context, type).then((data) => {
          console.info('Test_requestGlobalSwitch_005 data:' + data);
          expect(data).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.error('Test_requestGlobalSwitch_005 err.code:' + JSON.stringify(err));
          if (flag = err.code == 12100013 || err.code == 12100001) {
            expect(flag).assertTrue();
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });

        let driver = Driver.create();
        console.info("Test_requestGlobalSwitch_005 come in driverFn");
        let toggle = await driver.findComponent(ON.type("Toggle"));
        let button = await driver.findComponent(ON.text("确定"));
        await toggle.click();
        await button.click();
        console.info("Test_requestGlobalSwitch_005 click over");
        
      } catch (error) {
        console.info('Test_requestGlobalSwitch_005 error.code: ' + error.code);
        expect(error.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number:Test_SwitchType_0100
     * @tc.name: Test_SwitchType_001
     * @tc.desc: abilityAccessCtrl SwitchType CAMERA
     * @tc.level: Level0
     * @tc.size: MediumTest
     * @tc.type: Function
     */
    it("Test_SwitchType_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('Test_SwitchType_001 start');
      let value = abilityAccessCtrl.SwitchType.CAMERA;
      console.info('Test_SwitchType_001 value is: ' + value);
      expect(value).assertEqual(0);
      done();
    })

    /**
     * @tc.number:Test_SwitchType_0200
     * @tc.name: Test_SwitchType_002
     * @tc.desc: abilityAccessCtrl SwitchType MICROPHONE
     * @tc.level: Level0
     * @tc.size: MediumTest
     * @tc.type: Function
     */
    it("Test_SwitchType_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('Test_SwitchType_002 start');
      let value = abilityAccessCtrl.SwitchType.MICROPHONE;
      console.info('Test_SwitchType_002 value is: ' + value);
      expect(value).assertEqual(1);
      done();
    })

    /**
     * @tc.number:Test_SwitchType_0300
     * @tc.name: Test_SwitchType_003
     * @tc.desc: abilityAccessCtrl SwitchType LOCATION
     * @tc.level: Level0
     * @tc.size: MediumTest
     * @tc.type: Function
     */
    it("Test_SwitchType_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('Test_SwitchType_003 start');
      let value = abilityAccessCtrl.SwitchType.LOCATION;
      console.info('Test_SwitchType_003 value is: ' + value);
      expect(value).assertEqual(2);
      done();
    })

    /**
     * @tc.number: Test_PermissionStateChangeType_001
     * @tc.name: Test AT on PERMISSION_REVOKED_OPER Const Attribute
     * @tc.desc: Test PermissionStateChangeType const PERMISSION_REVOKED_OPER
     * @tc.level: Level0
     * @tc.size: MediumTest
     * @tc.type: Function
     */
    it("Test_PermissionStateChangeType_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.info('Test_PermissionStateChangeType_001 start');
        let value = abilityAccessCtrl.PermissionStateChangeType.PERMISSION_REVOKED_OPER;
        console.info('Test_PermissionStateChangeType_001 value is: ' + value);
        expect(value).assertEqual(0);
        done();
      })

    /**
     * @tc.number:Test_PermissionStateChangeType_002
     * @tc.name: Test AT on PERMISSION_GRANTED_OPER Const Attribute
     * @tc.desc: Test PermissionStateChangeType const PERMISSION_GRANTED_OPER
     * @tc.level: Level0
     * @tc.size: MediumTest
     * @tc.type: Function
     */
    it("Test_PermissionStateChangeType_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.info('Test_PermissionStateChangeType_002 start');
        let value = abilityAccessCtrl.PermissionStateChangeType.PERMISSION_GRANTED_OPER;
        console.info('Test_PermissionStateChangeType_002 value is: ' + value);
        expect(value).assertEqual(1);
        done();
      })

    /**
     * @tc.number:Test_PermissionRequestToggleStatus_0100
     * @tc.name: Test_PermissionRequestToggleStatus_001
     * @tc.desc: abilityAccessCtrl PermissionRequestToggleStatus CLOSED
     * @tc.level: Level1
     * @tc.size: MediumTest
     * @tc.type: Function
     */
    it("Test_PermissionRequestToggleStatus_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        console.info('Test_PermissionRequestToggleStatus_001 start');
        let value = abilityAccessCtrl.PermissionRequestToggleStatus.CLOSED;
        console.info('Test_PermissionRequestToggleStatus_001 value is: ' + value);
        expect(value).assertEqual(0);
        done();
      })

    /**
     * @tc.number:Test_PermissionRequestToggleStatus_0200
     * @tc.name: Test_PermissionRequestToggleStatus_002
     * @tc.desc: abilityAccessCtrl PermissionRequestToggleStatus OPEN
     * @tc.level: Level2
     * @tc.size: MediumTest
     * @tc.type: Function
     */
    it("Test_PermissionRequestToggleStatus_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        console.info('Test_PermissionRequestToggleStatus_002 start');
        let value = abilityAccessCtrl.PermissionRequestToggleStatus.OPEN;
        console.info('Test_PermissionRequestToggleStatus_002 value is: ' + value);
        expect(value).assertEqual(1);
        done();
      })

    /**
     * @tc.number:Test_PermissionStatus_0100
     * @tc.name: Test_PermissionStatus_001
     * @tc.desc: abilityAccessCtrl PermissionStatus DENIED
     * @tc.level: Level2
     * @tc.size: MediumTest
     * @tc.type: Function
     */
    it("Test_PermissionStatus_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('Test_PermissionStatus_001 start');
      let value = abilityAccessCtrl.PermissionStatus.DENIED;
      console.info('Test_PermissionStatus_001 value is: ' + value);
      expect(value).assertEqual(-1);
      done();
    })

    /**
     * @tc.number:Test_PermissionStatus_0200
     * @tc.name: Test_PermissionStatus_002
     * @tc.desc: abilityAccessCtrl PermissionStatus GRANTED
     * @tc.level: Level2
     * @tc.size: MediumTest
     * @tc.type: Function
     */
    it("Test_PermissionStatus_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('Test_PermissionStatus_002 start');
      let value = abilityAccessCtrl.PermissionStatus.GRANTED;
      console.info('Test_PermissionStatus_002 value is: ' + value);
      expect(value).assertEqual(0);
      done();
    })

    /**
     * @tc.number:Test_PermissionStatus_0300
     * @tc.name: Test_PermissionStatus_003
     * @tc.desc: abilityAccessCtrl PermissionStatus NOT_DETERMINED
     * @tc.level: Level2
     * @tc.size: MediumTest
     * @tc.type: Function
     */
    it("Test_PermissionStatus_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('Test_PermissionStatus_003 start');
      let value = abilityAccessCtrl.PermissionStatus.NOT_DETERMINED;
      console.info('Test_PermissionStatus_003 value is: ' + value);
      expect(value).assertEqual(1);
      done();
    })

    /*
     * @tc.number:Test_PermissionStatus_0400
     * @tc.name: Test_PermissionStatus_004
     * @tc.desc: abilityAccessCtrl PermissionStatus INVALID
     * @tc.level: Level2
     * @tc.size: MediumTest
     * @tc.type: Function
     */
    it("Test_PermissionStatus_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('Test_PermissionStatus_004 start');
      let value = abilityAccessCtrl.PermissionStatus.INVALID;
      console.info('Test_PermissionStatus_004 value is: ' + value);
      expect(value).assertEqual(2);
      done();
    })

    /*
     * @tc.number:Test_PermissionStatus_0500
     * @tc.name: Test_PermissionStatus_005
     * @tc.desc: abilityAccessCtrl PermissionStatus RESTRICTED
     * @tc.level: Level2
     * @tc.size: MediumTest
     * @tc.type: Function
     */
    it("Test_PermissionStatus_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('Test_PermissionStatus_005 start');
      let value = abilityAccessCtrl.PermissionStatus.RESTRICTED;
      console.info('Test_PermissionStatus_005 value is: ' + value);
      expect(value).assertEqual(3);
      done();
    })

  })
}
