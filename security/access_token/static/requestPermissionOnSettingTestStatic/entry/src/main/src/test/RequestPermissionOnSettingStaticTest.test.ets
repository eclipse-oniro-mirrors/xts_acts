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

import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import Utils from './Util.test';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import { Permissions } from 'permissions';
import PermissionRequestResult from 'security.PermissionRequestResult';
import { BusinessError } from '@ohos.base';
import { Driver, ON } from '@ohos.UiTest';
import bundleManager from '@ohos.bundle.bundleManager';

let domain: int = 0x0000;
let tag: string = 'testTag';

let testAbilityContext: common.UIAbilityContext;
let tokenID: int;

const ERR_PARAM_ILLEGAL = 401;
const ERR_PARAM_INVALID = 12100001;
const ERR_NOT_USE_TOGETHER = 12100004;
const ERR_REQUEST_IS_ALREADY_EXIST = 12100010;
const ERR_ALL_PERM_GRANTED = 12100011;
const ERR_PERM_NOT_REVOKE_BY_USER = 12100012;

function clickRequest(driver: Driver, name: string): boolean {
  await Utils.msSleep(2000);
  try {
    hilog.error(domain, tag, ` 11111111111111111111111 error, ${ JSON.stringify(name) }`);
    let button = await driver.findComponent(ON.text(name));
    await Utils.msSleep(1000);
    if (button) {
      hilog.error(domain, tag, ` 2222222222222222 error, ${ JSON.stringify(name) }`);
      await button.click();
      return true;
    }
    return false;
  } catch (error: BusinessError<void>) {
    hilog.error(domain, tag, ` findcomponent error, ${ JSON.stringify(error) }`);
    return false;
  }
}

export default function requestPermissionOnSettingStaticTest() {
  let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
  let atManager = abilityAccessCtrl.createAtManager();
  describe("requestPermissionOnSettingStaticTest", (): void => {
    hilog.info(domain, tag, '##########start requestPermissionOnSettingStaticTest');
    beforeAll((): void => {
      hilog.info(domain, tag, 'beforeAll start');
      let bundleFlags = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
      try {
        hilog.info(domain, 'testTag', "Start getBundleInfoForSelf");
        let bundleInfo = bundleManager.getBundleInfoForSelfSync(bundleFlags)
        //let accessTokenId: long = bundleInfo.appInfo?.accessTokenId as long;
        //tokenID = accessTokenId as int;
        //hilog.info(domain, 'testTag', 'tokenID:' + tokenID);
      } catch (error: BusinessError<void>) {
        hilog.info(domain, 'testTag', 'AccessTokenTest getBundleInfoForSelf error is: ' + error.code);
      }

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
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.acts.requestPermissionsonsettingTest.static")
      await Utils.msSleep(2000)
      try {
        await Utils.msSleep(2000)
      } catch (err: BusinessError) {
        hilog.info(domain, tag, 'err.code - '+ err.code);
      }
      hilog.info(domain, tag, 'beforeAll end');
    })

    /**
     * @tc.name   Test_requestPermissionOnSetting_001
     * @tc.number Test_requestPermissionOnSetting_001
     * @tc.desc   The Context is undefined, throw 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Test_requestPermissionOnSetting_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, tag, "Test_requestPermissionOnSetting_001 start");
      let context: common.UIAbilityContext;
      let permissionList: Array<Permissions> = new Array<Permissions>("ohos.permission.CAMERA");
      try {
        await atManager.requestPermissionOnSetting(context, permissionList);
      } catch (error: BusinessError<void>) {
        hilog.info(domain, tag, "Test_requestPermissionOnSetting_001 catch err" + JSON.stringify(error));
        expect(error.code).assertEqual(ERR_PARAM_ILLEGAL);
        done();
      }
    })

    /**
     * @tc.name   Test_requestPermissionOnSetting_002
     * @tc.number Test_requestPermissionOnSetting_002
     * @tc.desc   The permissionList is empty, throw 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Test_requestPermissionOnSetting_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, tag, "Test_requestPermissionOnSetting_002 start");
      let permissionList: Array<Permissions> = new Array<Permissions>();
      try {
        await atManager.requestPermissionOnSetting(testAbilityContext, permissionList);
      } catch (error: BusinessError<void>) {
        hilog.info(domain, tag, "Test_requestPermissionOnSetting_002 catch err" + JSON.stringify(error));
        expect(error.code).assertEqual(ERR_PARAM_ILLEGAL);
        done();
      }
    })

    /**
     * @tc.name   Test_requestPermissionOnSetting_003
     * @tc.number Test_requestPermissionOnSetting_003
     * @tc.desc   Invalid permission, throw 12100001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Test_requestPermissionOnSetting_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, tag, "Test_requestPermissionOnSetting_003 start");
      let invalidPermission: Permissions = "ohos.permission.1111" as Permissions;
      let permissionList: Array<Permissions> = new Array<Permissions>(invalidPermission);
      if (testAbilityContext) {
        try {
          atManager.requestPermissionOnSetting(testAbilityContext, permissionList).catch((error: Error): void => {
            hilog.info(domain, 'testTag', "Test_requestPermissionOnSetting_003 error" + JSON.stringify(error));
            expect(error.code).assertEqual(ERR_PARAM_INVALID);
            done();
          });
        } catch (error: BusinessError<void>) {
          hilog.info(domain, tag, "Test_requestPermissionOnSetting_003 catch err" + JSON.stringify(error));
          expect(false).assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   Test_requestPermissionOnSetting_004
     * @tc.number Test_requestPermissionOnSetting_004
     * @tc.desc   Apply permission not be declared in module.json, throw 12100001.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Test_requestPermissionOnSetting_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, tag, "Test_requestPermissionOnSetting_004 start");
      let permissionList: Array<Permissions> = new Array<Permissions>("ohos.permission.APP_TRACKING_CONSENT");
      if (testAbilityContext) {
        try {
          atManager.requestPermissionOnSetting(testAbilityContext, permissionList).catch((error: Error): void => {
            hilog.info(domain, 'testTag', "Test_requestPermissionOnSetting_004 error" + JSON.stringify(error));
            expect(error.code).assertEqual(ERR_PARAM_INVALID);
            done();
          });
        } catch (error: BusinessError<void>) {
          hilog.info(domain, tag, "Test_requestPermissionOnSetting_004 catch err" + JSON.stringify(error));
          expect(false).assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   Test_requestPermissionOnSetting_005
     * @tc.number Test_requestPermissionOnSetting_005
     * @tc.desc   Apply for the system_grant permission, throw 12100001.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Test_requestPermissionOnSetting_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, tag, "Test_requestPermissionOnSetting_005 start");
      let permissionList: Array<Permissions> = new Array<Permissions>("ohos.permission.USE_BLUETOOTH");
      if (testAbilityContext) {
        try {
          atManager.requestPermissionOnSetting(testAbilityContext, permissionList).catch((error: Error): void => {
            hilog.info(domain, 'testTag', "Test_requestPermissionOnSetting_005 error" + JSON.stringify(error));
            expect(error.code).assertEqual(ERR_PARAM_INVALID);
            done();
          });
        } catch (error: BusinessError<void>) {
          hilog.info(domain, tag, "Test_requestPermissionOnSetting_005 catch err" + JSON.stringify(error));
          expect(false).assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   Test_requestPermissionOnSetting_006
     * @tc.number Test_requestPermissionOnSetting_006
     * @tc.desc   apply for permissions of different permission groups, throw 12100001.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Test_requestPermissionOnSetting_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, tag, "Test_requestPermissionOnSetting_006 start");
      let permissionList: Array<Permissions> = new Array<Permissions>("ohos.permission.CAMERA", "ohos.permission.MICROPHONE");
      if (testAbilityContext) {
        try {
          atManager.requestPermissionOnSetting(testAbilityContext, permissionList).catch((error: Error): void => {
            hilog.info(domain, 'testTag', "Test_requestPermissionOnSetting_006 error" + JSON.stringify(error));
            expect(error.code).assertEqual(ERR_PARAM_INVALID);
            done();
          });
        } catch (error: BusinessError<void>) {
          hilog.info(domain, tag, "Test_requestPermissionOnSetting_006 catch err" + JSON.stringify(error));
          expect(false).assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   Test_requestPermissionOnSetting_007
     * @tc.number Test_requestPermissionOnSetting_007
     * @tc.desc   test requestPermissionOnSetting error.code 12100011 and 12100012
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_requestPermissionOnSetting_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, tag, "Test_requestPermissionOnSetting_007 start");
      let permissionList: Array<Permissions> = new Array<Permissions>("ohos.permission.CAMERA");
      if (testAbilityContext) {
        try {
          // 1. 申请的权限未被操作过
          atManager.requestPermissionOnSetting(testAbilityContext, permissionList).catch((error: Error): void => {
            hilog.info(domain, 'testTag', "Test_requestPermissionOnSetting_007 error1" + JSON.stringify(error));
            expect(error.code).assertEqual(ERR_PERM_NOT_REVOKE_BY_USER);

            let driver: Driver = Driver.create();
            await Utils.msSleep(1000);
            // 2. 申请权限弹框，并选择允许
            hilog.info(domain, 'testTag', "Test_requestPermissionOnSetting_007 begin request permisson from user");
            atManager.requestPermissionsFromUser(testAbilityContext, permissionList).then((data: PermissionRequestResult): void => {
              hilog.info(domain, tag, "requestPermissionsFromUser data " + JSON.stringify(data));
              expect(data.permissions.length).assertEqual(permissionList.length);
              expect(data.authResults[0]).assertEqual(0); // 0: granted
              expect(data.dialogShownResults?.[0]).assertEqual(true);
              expect(data.errorReasons?.[0]).assertEqual(0);
              hilog.info(domain, tag, "requestPermissionsFromUser expect ");

              // 3. 申请已经被用户授予的权限
              atManager.requestPermissionOnSetting(testAbilityContext, permissionList).catch((error: Error): void => {
                hilog.info(domain, 'testTag', "Test_requestPermissionOnSetting_007 error2" + JSON.stringify(error));
                expect(error.code).assertEqual(ERR_ALL_PERM_GRANTED);
                done();
              });
            });
            await Utils.msSleep(3000);
            clickRequest(driver, '允许');
          });
        } catch (error: BusinessError<void>) {
          hilog.info(domain, tag, "Test_requestPermissionOnSetting_007 catch err" + JSON.stringify(error));
          expect(false).assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   Test_requestPermissionOnSetting_008
     * @tc.number Test_requestPermissionOnSetting_008
     * @tc.desc   test requestPermissionOnSetting error.code 12100011 and 12100012
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_requestPermissionOnSetting_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, tag, 'Test_requestPermissionOnSetting_008 start');
      let permissionList: Array<Permissions> = new Array<Permissions>('ohos.permission.WRITE_CALENDAR', 'ohos.permission.READ_CALENDAR');
      let isSupportGrantByGroup = true; // 默认支持以权限组授权
      if (testAbilityContext) {
        try {
          // 1. 申请的权限未被操作过
          atManager.requestPermissionOnSetting(testAbilityContext, permissionList).catch((error: Error): void => {
            hilog.info(domain, 'testTag', "Test_requestPermissionOnSetting_008 error1 " + JSON.stringify(error));
            expect(error.code).assertEqual(ERR_PERM_NOT_REVOKE_BY_USER);

            let driver1: Driver = Driver.create();
            await Utils.msSleep(1000);
            // 申请WRITE_CALENDAR权限弹框，并选择禁止
            atManager.requestPermissionsFromUser(testAbilityContext, new Array<Permissions>('ohos.permission.WRITE_CALENDAR')).then((data: PermissionRequestResult): void => {
              hilog.info(domain, tag, "requestPermissionsFromUser data1 ");
              expect(data.authResults[0]).assertEqual(-1); // -1: not granted
              expect(data.dialogShownResults?.[0]).assertEqual(true);

              // 2. 申请权限，禁止一个权限，另外一个未操作, throw 12100012
              atManager.requestPermissionOnSetting(testAbilityContext, permissionList).catch((error: Error): void => {
                hilog.info(domain, 'testTag', "Test_requestPermissionOnSetting_008 error2 " + JSON.stringify(error));
                expect(error.code).assertEqual(ERR_PERM_NOT_REVOKE_BY_USER);

                let driver2: Driver = Driver.create();
                await Utils.msSleep(1000);
                // 申请权限，选择允许
                atManager.requestPermissionsFromUser(testAbilityContext, new Array<Permissions>('ohos.permission.READ_CALENDAR')).then((data: PermissionRequestResult): void => {
                  hilog.info(domain, tag, "requestPermissionsFromUser data2 " + JSON.stringify(data));
                  expect(data.authResults[0]).assertEqual(0); // 0: granted
                  expect(data.dialogShownResults?.[0]).assertEqual(true);

                  let driver3: Driver = Driver.create();
                  await Utils.msSleep(1000);
                  // 3. 1个被允许，一个被禁止，正常弹框(选择允许)
                  atManager.requestPermissionOnSetting(testAbilityContext, permissionList).then((data: Array<abilityAccessCtrl.GrantStatus>): void => {
                    // hilog.info(domain, 'testTag', "Test_requestPermissionOnSetting_008 data " + JSON.stringify(data));
                    expect(data.length).assertEqual(permissionList.length);
                    expect(data[0]).assertEqual(abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED); // 0: granted
                    expect(data[1]).assertEqual(abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED); // 0: granted

                    atManager.requestPermissionOnSetting(testAbilityContext, permissionList).catch((error: Error): void => {
                      hilog.info(domain, 'testTag', "Test_requestPermissionOnSetting_008 error3 " + JSON.stringify(error));
                      expect(error.code).assertEqual(ERR_ALL_PERM_GRANTED);

                      done();
                    });
                  });
                  await Utils.msSleep(2000);
                  if (clickRequest(driver3, '允许') || clickRequest(driver3, '禁止')) {
                    if (clickRequest(driver3, '仅此应用日程'))
                    clickRequest(driver3, '确定');
                  }
                });
                await Utils.msSleep(2000);
                clickRequest(driver2, '允许');
              });
            });
            // click second permission
            await Utils.msSleep(2000);
            if(!clickRequest(driver1, '禁止')) {
              if(!clickRequest(driver1, '不允许')) {
                clickRequest(driver1, '取消');
              }
            }
          });
        } catch (error: BusinessError<void>) {
          hilog.info(domain, tag, "Test_requestPermissionOnSetting_008 catch err" + JSON.stringify(error));
          expect(false).assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   Test_requestPermissionOnSetting_009
     * @tc.number Test_requestPermissionOnSetting_009
     * @tc.desc   Apply for 1 permission and be prohibited, and next pop-up box again (repeat 4 times)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_requestPermissionOnSetting_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, tag, "Test_requestPermissionOnSetting_009 start");
      let permissionList: Array<Permissions> = new Array<Permissions>("ohos.permission.MICROPHONE");

      if (testAbilityContext) {
        try {
          let driver1: Driver = Driver.create();
          await Utils.msSleep(1000);
          // 1. 申请权限弹框，并选择禁止
          atManager.requestPermissionsFromUser(testAbilityContext, permissionList).then((data: PermissionRequestResult): void => {
            hilog.info(domain, tag, "requestPermissionsFromUser data ");
            expect(data.permissions.length).assertEqual(permissionList.length);
            expect(data.authResults[0]).assertEqual(-1); // -1: granted
            expect(data.dialogShownResults?.[0]).assertEqual(true);

            let driver2: Driver = Driver.create();
            await Utils.msSleep(1000);
            // 2. 嵌套式重复调用
            atManager.requestPermissionOnSetting(testAbilityContext, permissionList).then((data: Array<abilityAccessCtrl.GrantStatus>): void => {
              // hilog.info(domain, tag, "Test_requestPermissionOnSetting_009 data1 " + JSON.stringify(data));
              expect(data[0]).assertEqual(abilityAccessCtrl.GrantStatus.PERMISSION_DENIED); // -1: not granted
              expect(data[0] != null).assertTrue();

              let driver3: Driver = Driver.create();
              await Utils.msSleep(1000);
              atManager.requestPermissionOnSetting(testAbilityContext, permissionList).then((data: Array<abilityAccessCtrl.GrantStatus>): void => {
                // hilog.info(domain, tag, "Test_requestPermissionOnSetting_009 data2 " + JSON.stringify(data));
                expect(data[0]).assertEqual(abilityAccessCtrl.GrantStatus.PERMISSION_DENIED); // -1: not granted
                expect(data[0] != null).assertTrue();

                let driver4: Driver = Driver.create();
                await Utils.msSleep(1000);
                atManager.requestPermissionOnSetting(testAbilityContext, permissionList).then((data: Array<abilityAccessCtrl.GrantStatus>): void => {
                  // hilog.info(domain, tag, "Test_requestPermissionOnSetting_009 data3 " + JSON.stringify(data));
                  expect(data[0]).assertEqual(abilityAccessCtrl.GrantStatus.PERMISSION_DENIED); // -1: not granted
                  expect(data[0] != null).assertTrue();

                  let driver5: Driver = Driver.create();
                  await Utils.msSleep(1000);
                  atManager.requestPermissionOnSetting(testAbilityContext, permissionList).then((data: Array<abilityAccessCtrl.GrantStatus>): void => {
                    // hilog.info(domain, tag, "Test_requestPermissionOnSetting_009 data4 " + JSON.stringify(data));
                    expect(data[0]).assertEqual(abilityAccessCtrl.GrantStatus.PERMISSION_DENIED); // -1: not granted
                    expect(data[0] != null).assertTrue();
                    done();
                  });
                  // click second permission
                  await Utils.msSleep(2000);
                  if(!clickRequest(driver5, '禁止')) {
                    if(!clickRequest(driver5, '不允许')) {
                      clickRequest(driver5, '取消');
                    } else {
                      clickRequest(driver5, '确定');
                    }
                  }
                });
                // click second permission
                await Utils.msSleep(2000);
                if(!clickRequest(driver4, '禁止')) {
                  if(!clickRequest(driver4, '不允许')) {
                    clickRequest(driver4, '取消');
                  } else {
                    clickRequest(driver4, '确定');
                  }
                }
              });
              // click second permission
              await Utils.msSleep(2000);
              if(!clickRequest(driver3, '禁止')) {
                if(!clickRequest(driver3, '不允许')) {
                  clickRequest(driver3, '取消');
                } else {
                  clickRequest(driver3, '确定');
                }
              }
            });
            // click second permission
            await Utils.msSleep(2000);
            if(!clickRequest(driver2, '禁止')) {
              if(!clickRequest(driver2, '不允许')) {
                clickRequest(driver2, '取消');
              } else {
                clickRequest(driver2, '确定');
              }
            }
          });
          await Utils.msSleep(2000);
          if(!clickRequest(driver1, '禁止')) {
            if(!clickRequest(driver1, '不允许')) {
              clickRequest(driver1, '取消');
            } else {
              clickRequest(driver1, '确定');
            }
          }
        } catch (error: BusinessError<void>) {
          hilog.info(domain, tag, "Test_requestPermissionOnSetting_009 catch err" + JSON.stringify(error));
          expect(false).assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   Test_requestPermissionOnSetting_010
     * @tc.number Test_requestPermissionOnSetting_010
     * @tc.desc   call request twice and different permissions, there will be one pop-up boxes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_requestPermissionOnSetting_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, tag, "Test_requestPermissionOnSetting_010 start");
      let permissionList: Array<Permissions> = new Array<Permissions>("ohos.permission.APPROXIMATELY_LOCATION");
      let firstCallback: boolean = false;
      let secondCallback: boolean = false;
      if (testAbilityContext) {
        try {
          let driver1: Driver = Driver.create();
          await Utils.msSleep(1000);
          atManager.requestPermissionsFromUser(testAbilityContext, permissionList).then((data: PermissionRequestResult): void => {
            hilog.info(domain, 'testTag', "requestPermissionsFromUser data " + JSON.stringify(data));

            let driver2: Driver = Driver.create();
            await Utils.msSleep(1000);
            atManager.requestPermissionOnSetting(testAbilityContext, permissionList).then((data: Array<abilityAccessCtrl.GrantStatus>): void => {
              // hilog.info(domain, tag, "Test_requestPermissionOnSetting_010 data1 " + JSON.stringify(data));
              expect(data[0]).assertEqual(abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED); // 0: granted
              firstCallback = true;
              if (firstCallback && secondCallback) {
                done();
              }
            });
            atManager.requestPermissionOnSetting(testAbilityContext, permissionList).then((data: Array<abilityAccessCtrl.GrantStatus>): void => {
              // hilog.info(domain, tag, "Test_requestPermissionOnSetting_010 data2 " + JSON.stringify(data));
              expect(data[0]).assertEqual(abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED); // 0: granted
              secondCallback = true;
              if (firstCallback && secondCallback) {
                done();
              }
            });
            await Utils.msSleep(2000);
            if (clickRequest(driver2, '始终允许') || clickRequest(driver2, '仅使用期间允许')) {
              clickRequest(driver2, '确定');
            }
          });
          await Utils.msSleep(2000);
          if(!clickRequest(driver1, '禁止')) {
            if(!clickRequest(driver1, '不允许')) {
              clickRequest(driver1, '取消');
            }
          }
        } catch (error: BusinessError<void>) {
          hilog.info(domain, tag, "Test_requestPermissionOnSetting_010 catch err" + JSON.stringify(error));
          expect(false).assertFail();
          done();
        }
      }
    })

    /**
     * @tc.name   Test_requestPermissionOnSetting_011
     * @tc.number Test_requestPermissionOnSetting_011
     * @tc.desc   call request twice and different permissions, there will be two pop-up boxes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Test_requestPermissionOnSetting_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: ()=>void): Promise<void> => {
      hilog.info(domain, tag, "Test_requestPermissionOnSetting_011 start");
      let permissionList: Array<Permissions> = new Array<Permissions>('ohos.permission.MICROPHONE', 'ohos.permission.ACCESS_BLUETOOTH');
      let firstCallback: boolean = false;
      let secondCallback: boolean = false;
      if (testAbilityContext) {
        try {
          let driver1: Driver = Driver.create();
          await Utils.msSleep(1000);
          // 1. 申请权限弹框，并选择禁止
          atManager.requestPermissionsFromUser(testAbilityContext, permissionList).then((data: PermissionRequestResult): void => {
            hilog.info(domain, tag, "requestPermissionsFromUser data ");

            let driver2: Driver = Driver.create();
            await Utils.msSleep(1000);
            let permissionList1: Array<Permissions> = new Array<Permissions>('ohos.permission.MICROPHONE');
            atManager.requestPermissionOnSetting(testAbilityContext, permissionList1).then((data: Array<abilityAccessCtrl.GrantStatus>): void => {
              // hilog.info(domain, tag, "Test_requestPermissionOnSetting_010 data1 " + JSON.stringify(data));
              firstCallback = true;
              if (firstCallback && secondCallback) {
                done();
              }
            });
            let permissionList2: Array<Permissions> = new Array<Permissions>('ohos.permission.ACCESS_BLUETOOTH');
            atManager.requestPermissionOnSetting(testAbilityContext, permissionList2).then((data: Array<abilityAccessCtrl.GrantStatus>): void => {
              // hilog.info(domain, tag, "Test_requestPermissionOnSetting_010 data2 " + JSON.stringify(data));
              secondCallback = true;
              if (firstCallback && secondCallback) {
                done();
              }
            });
            await Utils.msSleep(2000);
            if (clickRequest(driver2, '允许')) {
              clickRequest(driver2, '确定');
            }
            await Utils.msSleep(2000);
            if (clickRequest(driver2, '允许')) {
              clickRequest(driver2, '确定');
            }
          });
          await Utils.msSleep(2000);
          if(!clickRequest(driver1, '禁止')) {
            if(!clickRequest(driver1, '不允许')) {
              clickRequest(driver1, '取消');
            }
          }
          await Utils.msSleep(2000);
          if(!clickRequest(driver1, '禁止')) {
            if(!clickRequest(driver1, '不允许')) {
              clickRequest(driver1, '取消');
            }
          }
        } catch (error: BusinessError<void>) {
          hilog.info(domain, tag, "Test_requestPermissionOnSetting_010 catch err" + JSON.stringify(error));
          expect(false).assertFail();
          done();
        }
      }
    })
  })
  hilog.info(domain, tag, 'abilityTest end');
}