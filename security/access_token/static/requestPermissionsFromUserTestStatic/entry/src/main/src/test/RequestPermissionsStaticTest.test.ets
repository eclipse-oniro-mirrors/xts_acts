/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import Utils from './Util.test';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import { Permissions } from 'permissions';
import PermissionRequestResult from 'security.PermissionRequestResult';
import { BusinessError } from '@ohos.base'
import { Driver, ON } from '@ohos.UiTest'

let domain: int = 0x0000;
let tag: string = 'testTag';

let testAbilityContext: common.UIAbilityContext | undefined;
let tokenID: int;

const ERR_PARAM_ILLEGAL = 401;
const ERR_PARAM_INVALID = 12100001;

//Do NOT ALLOW/Prohibit/cancel ---- Both mean Prohibit
function clickRequest(driver: Driver, name: string): boolean {
  waitForCompletion(async () => {await Utils.msSleep(2000);})
  try {
    hilog.error(domain, tag, ` 11111111111111111111111 error, ${ JSON.stringify(name) }`);
    return waitForCompletion<boolean>(async (): Promise<boolean> => {
      let button = await driver.findComponent(ON.text(name));
      await Utils.msSleep(1000);
      if (button !== null) {
        hilog.error(domain, tag, ` 2222222222222222 error, ${ JSON.stringify(name) }`);
        await button.click();
        return true;
      }
      return false;
    })
  } catch (error) {
    hilog.error(domain, tag, ` findcomponent error, ${ JSON.stringify(error) }`);
    return false;
  }
}

export default function requestPermissionsStaticTest() {
  let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
  let atManager = abilityAccessCtrl.createAtManager();
  describe("requestPermissionsStaticTest", (): void => {
    hilog.info(domain, tag, '##########start requestPermissionsStaticTest');
    beforeAll(async (): Promise<void> => {
      hilog.info(domain, tag, 'beforeAll start');
      abilityDelegator.addAbilityMonitor({
        abilityName: "EntryAbility",
        moduleName:"entry",
        onAbilityCreate: (abilitys : UIAbility) : void => {
          if (abilitys.context) {
            testAbilityContext = abilitys.context;
            hilog.info(domain, tag, 'onAbilityCreate end');
          }
        },
      }, (err: BusinessError<void> | null) : void => {
        if (err?.code ) {
          hilog.info(domain, tag, 'err.code - '+ err?.code);
        }
        hilog.info(domain, tag, 'BusinessError end');
      });
      await Utils.msSleep(1000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.acts.requestPermissionsTest.static")
      await Utils.msSleep(2000)
      try {
        await Utils.msSleep(2000)
      } catch (err) {
        hilog.info(domain, tag, 'err.code - '+ err.code);
      }
      hilog.info(domain, tag, 'beforeAll end');
    })

    /**
     * @tc.name   Test_requestPermissionsFromUser_001
     * @tc.number Test_requestPermissionsFromUser_001
     * @tc.desc   test requestPermissionsFromUser with invalid context, throw 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Test_requestPermissionsFromUser_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, tag, "Test_requestPermissionsFromUser_001 start");
      let context: common.UIAbilityContext | undefined;
      let permissionList: Array<Permissions> = new Array<Permissions>("ohos.permission.CAMERA");
      try {
        await atManager.requestPermissionsFromUser(context!, permissionList);
      } catch (error) {
        error = error as BusinessError;
        hilog.info(domain, tag, "Test_requestPermissionsFromUser_001 catch err" + JSON.stringify(error));
        expect(error.code).assertEqual(ERR_PARAM_ILLEGAL);
        done();
      }
    })

    /**
     * @tc.name   Test_requestPermissionsFromUser_002
     * @tc.number Test_requestPermissionsFromUser_002
     * @tc.desc   test requestPermissionsFromUser with empty permissionList, throw 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Test_requestPermissionsFromUser_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, tag, "Test_requestPermissionsFromUser_002 start");
      let permissionList: Array<Permissions> = new Array<Permissions>();
      try {
        await atManager.requestPermissionsFromUser(testAbilityContext!, permissionList);
      } catch (error) {
        error = error as BusinessError;
        hilog.info(domain, tag, "Test_requestPermissionsFromUser_002 catch err" + JSON.stringify(error));
        expect(error.code).assertEqual(ERR_PARAM_ILLEGAL);
        done();
      }
    })

    /**
     * @tc.name   Test_requestPermissionsFromUser_003
     * @tc.number Test_requestPermissionsFromUser_003
     * @tc.desc   test requestPermissionsFromUser with invalid permissionList.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Test_requestPermissionsFromUser_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, tag, "Test_requestPermissionsFromUser_003 start");
      let invalidPermission: Permissions = "ohos.permission.1111" as Permissions;
      let permissionList: Array<Permissions> = new Array<Permissions>(invalidPermission);
      if (testAbilityContext) {
        try {
          atManager.requestPermissionsFromUser(testAbilityContext!, permissionList).then((data: PermissionRequestResult): void => {
            hilog.info(domain, tag, "Test_requestPermissionsFromUser_003 data");
            expect(data.permissions.length).assertEqual(permissionList.length);
            expect(data.authResults[0]).assertEqual(2); // 2-invalid
            expect(data.dialogShownResults?.[0]).assertEqual(false);
            done();
          }).catch((error: Error): void => {
            hilog.info(domain, tag, "Test_requestPermissionsFromUser_003 error" + JSON.stringify(error));
            expect(false).assertFail();
            done();
          });

        } catch (error) {
          hilog.info(domain, tag, "Test_requestPermissionsFromUser_003 catch err" + JSON.stringify(error));
          expect(false).assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   Test_requestPermissionsFromUser_004
     * @tc.number Test_requestPermissionsFromUser_004
     * @tc.desc   test requestPermissionsFromUser with system_grant permission.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Test_requestPermissionsFromUser_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, tag, "Test_requestPermissionsFromUser_004 start");
      let permissionList: Array<Permissions> = new Array<Permissions>('ohos.permission.USE_BLUETOOTH');
      if (testAbilityContext) {
        try {
          atManager.requestPermissionsFromUser(testAbilityContext!, permissionList).then((data: PermissionRequestResult): void => {
            hilog.info(domain, tag, "Test_requestPermissionsFromUser_004 data");
            expect(data.permissions.length).assertEqual(permissionList.length);
            expect(data.authResults[0]).assertEqual(0); // 0: granted
            expect(data.dialogShownResults?.[0]).assertEqual(false);
            done();
          }).catch((error: Any): void => {
            hilog.info(domain, tag, "Test_requestPermissionsFromUser_004 error" + JSON.stringify(error));
            expect(false).assertFail();
            done();
          });
        } catch (error) {
          hilog.info(domain, tag, "Test_requestPermissionsFromUser_004 catch err" + JSON.stringify(error));
          expect(false).assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   Test_requestPermissionsFromUser_005
     * @tc.number Test_requestPermissionsFromUser_005
     * @tc.desc   request multiple permissions in the same permission group.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Test_requestPermissionsFromUser_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, tag, "Test_requestPermissionsFromUser_005 start");
      let permissionList: Array<Permissions> = new Array<Permissions>('ohos.permission.WRITE_CALENDAR', 'ohos.permission.READ_CALENDAR');
      if (testAbilityContext) {
        try {
          let driver: Driver = Driver.create();
          await Utils.msSleep(1000);
          atManager.requestPermissionsFromUser(testAbilityContext!, permissionList).then((data: PermissionRequestResult): void => {
            hilog.info(domain, tag, "Test_requestPermissionsFromUser_005 data1 ");
            expect(data.permissions.length).assertEqual(permissionList.length);
            expect(data.authResults[0]).assertEqual(0); // 0: granted
            expect(data.dialogShownResults?.[0]).assertEqual(true);
            expect(data.authResults[1]).assertEqual(0); // 0: granted
            expect(data.dialogShownResults?.[1]).assertEqual(true);

            atManager.requestPermissionsFromUser(testAbilityContext!, permissionList).then((data: PermissionRequestResult): void => {
              hilog.info(domain, tag, "Test_requestPermissionsFromUser_005 data2 ");
              expect(data.permissions.length).assertEqual(permissionList.length);
              expect(data.authResults[0]).assertEqual(0); // 0: granted
              expect(data.dialogShownResults?.[0]).assertEqual(false);
              expect(data.authResults[1]).assertEqual(0); // 0: granted
              expect(data.dialogShownResults?.[1]).assertEqual(false);
              done();
            }).catch((error: Error): void => {
              hilog.info(domain, tag,
                "Test_requestPermissionsFromUser_005 error2" + JSON.stringify(error));
              expect(false).assertFail();
              done();
            });
          }).catch((error: Error): void => {
            hilog.info(domain, tag,
              "Test_requestPermissionsFromUser_005 error2" + JSON.stringify(error));
            expect(false).assertFail();
            done();
          });
          await Utils.msSleep(2000);
          clickRequest(driver, '允许');
        } catch (error) {
          hilog.info(domain, tag, "Test_requestPermissionsFromUser_005 catch err " + JSON.stringify(error));
          expect(false).assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   Test_requestPermissionsFromUser_006
     * @tc.number Test_requestPermissionsFromUser_006
     * @tc.desc   request multiple permissions in the different permission group.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Test_requestPermissionsFromUser_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, tag, "Test_requestPermissionsFromUser_006 start");
      let permissionList: Array<Permissions> = new Array<Permissions>('ohos.permission.APPROXIMATELY_LOCATION', 'ohos.permission.CAMERA');
      if (testAbilityContext) {
        try {
          let driver: Driver = Driver.create();
          await Utils.msSleep(1000);
          atManager.requestPermissionsFromUser(testAbilityContext!, permissionList).then((data: PermissionRequestResult): void => {
            hilog.info(domain, tag, "Test_requestPermissionsFromUser_006 data1 ");
            expect(data.permissions.length).assertEqual(permissionList.length);
            expect(data.authResults[0]).assertEqual(0); // 0: granted
            expect(data.dialogShownResults?.[0]).assertEqual(true);
            expect(data.authResults[1]).assertEqual(-1); // -1: not granted
            expect(data.dialogShownResults?.[1]).assertEqual(true);

            atManager.requestPermissionsFromUser(testAbilityContext!, permissionList).then((data: PermissionRequestResult): void => {
              hilog.info(domain, tag, "Test_requestPermissionsFromUser_006 data2 ");
              expect(data.permissions.length).assertEqual(permissionList.length);
              expect(data.authResults[0]).assertEqual(0); // 0: granted
              expect(data.dialogShownResults?.[0]).assertEqual(false);
              expect(data.authResults[1]).assertEqual(-1); // -1: not granted
              expect(data.dialogShownResults?.[1]).assertEqual(false);
              done();
            }).catch((error: Error): void => {
              hilog.info(domain, tag, "Test_requestPermissionsFromUser_006 error2" + JSON.stringify(error));
              expect(false).assertFail();
              done();
            });
          }).catch((error: Error): void => {
            hilog.info(domain, tag, "Test_requestPermissionsFromUser_007 error1" + JSON.stringify(error));
            expect(false).assertFail();
            done();
          });
          await Utils.msSleep(2000);
          // click first permission
          if(!clickRequest(driver, '仅使用期间允许')) {
              clickRequest(driver, '始终允许');
            }

          // click second permission
          if(!clickRequest(driver, '禁止')) {
            if(!clickRequest(driver, '不允许')) {
              clickRequest(driver, '取消');
            }
          }
        } catch (error) {
          hilog.info(domain, tag, "Test_requestPermissionsFromUser_006 catch err " + JSON.stringify(error));
          expect(false).assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   Test_requestPermissionsFromUser_007
     * @tc.number Test_requestPermissionsFromUser_007
     * @tc.desc   request permission with not declare in module.json.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Test_requestPermissionsFromUser_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, tag, "Test_requestPermissionsFromUser_007 start");
      let permissionList: Array<Permissions> = new Array<Permissions>('ohos.permission.APP_TRACKING_CONSENT');
      if (testAbilityContext) {
        try {
          atManager.requestPermissionsFromUser(testAbilityContext!, permissionList).then((data: PermissionRequestResult): void => {
            hilog.info(domain, tag, "Test_requestPermissionsFromUser_007 data ");
            expect(data.permissions.length).assertEqual(permissionList.length);
            expect(data.authResults[0]).assertEqual(2); // 2: invalid
            expect(data.dialogShownResults?.[0]).assertEqual(false);
            done();
          }).catch((error: Error): void => {
            hilog.info(domain, tag, "Test_requestPermissionsFromUser_007 error" + JSON.stringify(error));
            expect(false).assertFail();
            done();
          });
        } catch (error) {
          hilog.info(domain, tag, "Test_requestPermissionsFromUser_007 catch err " + JSON.stringify(error));
          expect(false).assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   Test_requestPermissionsFromUser_008
     * @tc.number Test_requestPermissionsFromUser_008
     * @tc.desc   Apply for the same permission twice in a row
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Test_requestPermissionsFromUser_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, tag, "Test_requestPermissionsFromUser_008 start");
      let permissionList: Array<Permissions> = new Array<Permissions>('ohos.permission.MICROPHONE');
      let firstCallback: boolean = false;
      let secondCallback: boolean = false;
      if (testAbilityContext) {
        try {
          let driver: Driver = Driver.create();
          await Utils.msSleep(1000);
          atManager.requestPermissionsFromUser(testAbilityContext!, permissionList).then((data: PermissionRequestResult): void => {
            hilog.info(domain, tag, "Test_requestPermissionsFromUser_008 first data ");
            firstCallback = true;
            expect(data.permissions.length).assertEqual(permissionList.length);
            expect(data.authResults[0]).assertEqual(0); // 0: granted
            expect(data.dialogShownResults?.[0] != undefined).assertEqual(true);
            if (firstCallback && secondCallback) {
              done();
            }
          });
          atManager.requestPermissionsFromUser(testAbilityContext!, permissionList).then((data: PermissionRequestResult): void => {
            hilog.info(domain, tag, "Test_requestPermissionsFromUser_008 second data ");
            secondCallback = true;
            expect(data.permissions.length).assertEqual(permissionList.length);
            expect(data.authResults[0]).assertEqual(0); // 0: granted
            expect(data.dialogShownResults?.[0] != undefined).assertEqual(true);
            if (firstCallback && secondCallback) {
              done();
            }
          });
          await Utils.msSleep(2000);
          clickRequest(driver, '允许');
        } catch (error) {
          hilog.info(domain, tag, "Test_requestPermissionsFromUser_008 catch err " + JSON.stringify(error));
          expect(false).assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   Test_requestPermissionsFromUser_009
     * @tc.number Test_requestPermissionsFromUser_009
     * @tc.desc   Different permissions are applied for twice consecutively
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Test_requestPermissionsFromUser_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, tag, "Test_requestPermissionsFromUser_009 start");
      let permissionList1: Array<Permissions> = new Array<Permissions>('ohos.permission.ACCESS_BLUETOOTH');
      let permissionList2: Array<Permissions> = new Array<Permissions>('ohos.permission.DISTRIBUTED_DATASYNC');
      let firstCallback: boolean = false;
      let secondCallback: boolean = false;
      if (testAbilityContext) {
        try {
          let driver: Driver = Driver.create();
          await Utils.msSleep(1000);
          atManager.requestPermissionsFromUser(testAbilityContext!, permissionList1).then((data: PermissionRequestResult): void => {
            hilog.info(domain, tag, "Test_requestPermissionsFromUser_009 first data ");
            firstCallback = true;
            expect(data.permissions.length).assertEqual(permissionList1.length);
            expect(data.authResults[0]).assertEqual(0); // 0: granted
            expect(data.dialogShownResults?.[0] != undefined).assertEqual(true);
            if (firstCallback && secondCallback) {
              done();
            }
          });
          atManager.requestPermissionsFromUser(testAbilityContext!, permissionList2).then((data: PermissionRequestResult): void => {
            hilog.info(domain, tag, "Test_requestPermissionsFromUser_009 second data ");
            secondCallback = true;
            expect(data.permissions.length).assertEqual(permissionList2.length);
            expect(data.authResults[0]).assertEqual(0); // 0: granted
            expect(data.dialogShownResults?.[0] != undefined).assertEqual(true);
            if (firstCallback && secondCallback) {
              done();
            }
          });
          await Utils.msSleep(2000);
          clickRequest(driver, '允许');
          clickRequest(driver, '允许');
        } catch (error) {
          hilog.info(domain, tag, "Test_requestPermissionsFromUser_009 catch err " + JSON.stringify(error));
          expect(false).assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   Test_requestPermissionsFromUser_010
     * @tc.number Test_requestPermissionsFromUser_010
     * @tc.desc   test requestPermissionsFromUser callbck with invalid context, throw 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Test_requestPermissionsFromUser_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, tag, "Test_requestPermissionsFromUser_010 start");
      let context: common.UIAbilityContext | undefined;
      let permissionList: Array<Permissions> = new Array<Permissions>("ohos.permission.CAMERA");
      
      try {
        atManager.requestPermissionsFromUser(context!, permissionList, (error: BusinessError<void>|null, data: PermissionRequestResult|undefined):void => {
          expect(false).assertFail();
          done();
        });
      } catch (error) {
        hilog.info(domain, tag, "Test_requestPermissionsFromUser_010 error" + JSON.stringify(error));
        expect(error.code).assertEqual(ERR_PARAM_ILLEGAL);
        done();
      }
    })
    
    /**
     * @tc.name   Test_requestPermissionsFromUser_011
     * @tc.number Test_requestPermissionsFromUser_011
     * @tc.desc   test requestPermissionsFromUser callback with empty permissionList, throw 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Test_requestPermissionsFromUser_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, tag, "Test_requestPermissionsFromUser_011 start");
      let permissionList: Array<Permissions> = new Array<Permissions>();
      try {
        atManager.requestPermissionsFromUser(testAbilityContext!, permissionList, (error: BusinessError<void>|null, data: PermissionRequestResult|undefined):void => {
          expect(false).assertFail();
          done();
        });
      } catch (error) {
        hilog.info(domain, tag, "Test_requestPermissionsFromUser_011 error" + JSON.stringify(error));
        expect(error?.code).assertEqual(ERR_PARAM_ILLEGAL);
        done();
      }
    })

  })
  hilog.info(domain, tag, 'abilityTest end');
}