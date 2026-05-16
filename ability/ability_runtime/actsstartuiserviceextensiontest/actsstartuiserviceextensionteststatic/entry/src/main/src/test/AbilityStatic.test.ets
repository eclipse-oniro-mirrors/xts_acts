/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import wantConstant from "@ohos.app.ability.wantConstant";
import { BusinessError, RecordData } from '@ohos.base';
import appManager from '@ohos.app.ability.appManager';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';
import common from '@ohos.app.ability.common';
import { AppStorage } from '@ohos.arkui.stateManagement';
import Want from '@ohos.app.ability.Want';
import { Driver, ON } from '@ohos.UiTest';
import systemParameterEnhance from '@ohos.systemParameterEnhance';
import abilityManager from "@ohos.app.ability.abilityManager"

let domain: int = 0x0000;
let tag: string = 'testTag';

class CustomApplicationStateObserver implements appManager.ApplicationStateObserver {
  public appStateData?: appManager.AppStateData;
  public abilityStateData?: appManager.AbilityStateData;
  public processData?: appManager.ProcessData;
  private RELY_BUNDLE_NAME: string = 'com.acts.startuiserviceextensionrely.static';

  onForegroundApplicationChanged(appStateData: appManager.AppStateData): void {
    if (this.RELY_BUNDLE_NAME === appStateData?.bundleName) {
      this.appStateData = appStateData;
      hilog.info(domain, tag, `ApplicationStateObserver onForegroundApplicationChanged`);
    }
  }

  onAbilityStateChanged(abilityStateData: appManager.AbilityStateData): void {
    if (this.RELY_BUNDLE_NAME === abilityStateData?.bundleName) {
      this.abilityStateData = abilityStateData;
      hilog.info(domain, tag, `ApplicationStateObserver onAbilityStateChanged`);
    }
  }

  onProcessCreated(processData: appManager.ProcessData): void {
    if (this.RELY_BUNDLE_NAME === processData?.bundleName) {
      this.processData = processData;
      hilog.info(domain, tag, `ApplicationStateObserver onProcessCreated`);
    }
  }

  onProcessDied(processData: appManager.ProcessData): void {
    hilog.info(domain, tag, `ApplicationStateObserver onProcessDied`);
  }

  onProcessStateChanged(processData: appManager.ProcessData) {
    hilog.info(domain, tag, `ApplicationStateObserver onProcessStateChanged`);
  }

  onAppStarted(appStateData: appManager.AppStateData) {
    hilog.info(domain, tag, `ApplicationStateObserver onAppStarted`);
  }

  onAppStopped(appStateData: appManager.AppStateData) {
    hilog.info(domain, tag, `ApplicationStateObserver onAppStopped`);
  }
}

class CustomDataCallBack implements common.UIServiceExtensionConnectCallback {
  onData(data: Record<string, RecordData>) {
  }

  onDisconnect(): void {
  }
}

class CustomUIServiceProxy implements common.UIServiceProxy {
  sendData(data: Record<string, RecordData>): void {

  }
}

export default function abilitystaticTest() {
  describe('ActsAbilityStaticTest', (): void => {
    let testAbilityContext: common.UIAbilityContext | undefined;
    const BUNDLE_NAME: string = 'com.example.startuiserviceextensiontest.static';
    const RELY_BUNDLE_NAME: string = 'com.acts.startuiserviceextensionrely.static';
    let isSupportCapability: Boolean = false;

    beforeAll(async () => {
      let driver = Driver.create();
      try {
        let allowed = await driver.findComponent(ON.id('advanced_dialog_button_0'));
        if (allowed) {
          await allowed.click();
        }
      } catch (err) {
        console.error('findComponent failed: ' + JSON.stringify(err));
      }
      hilog.info(domain, tag, 'beforeAll start');
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      hilog.info(domain, tag, 'beforeAll AbilityDelegator');
      await abilityDelegator.executeShellCommand(`aa start -a EntryAbility -b ${BUNDLE_NAME}`);
      await Utils.msSleep(2000);
      testAbilityContext = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext;
      isSupportCapability = systemParameterEnhance.getSync('const.abilityms.enable_uiservice') == 'true';
      hilog.info(domain, tag, 'beforeAll end');
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_WantConstant_Static_0100
     * @tc.number SUB_Ability_AbilityRuntime_WantConstant_Static_0100
     * @tc.desc   Get APP_INSTANCE_KEY CREATE_APP_INSTANCE_KEY CALLER_APP_CLONE_INDEX.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_WantConstant_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        tag = "SUB_Ability_AbilityRuntime_WantConstant_Static_0100";
        hilog.info(domain, tag, '====> [SUB_Ability_AbilityRuntime_WantConstant_Static_0100] start');
        expect(wantConstant.Params.APP_INSTANCE_KEY + '').assertEqual("ohos.extra.param.key.appInstance")
        expect(wantConstant.Params.CREATE_APP_INSTANCE_KEY + '').assertEqual("ohos.extra.param.key.createAppInstance")
        expect(wantConstant.Params.CALLER_APP_CLONE_INDEX + '').assertEqual("ohos.param.callerAppCloneIndex")
        hilog.info(domain, tag, '====> [SUB_Ability_AbilityRuntime_WantConstant_Static_0100] end');
        done();
      })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_getAllRunningInstanceKeys_Static_0100
     * @tc.number SUB_Ability_AbilityRuntime_getAllRunningInstanceKeys_Static_0100
     * @tc.desc   When app not support capability, an error code is returned.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_getAllRunningInstanceKeys_Static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let tag = "SUB_Ability_AbilityRuntime_getAllRunningInstanceKeys_Static_0100";
        console.info('====> [SUB_Ability_AbilityRuntime_getAllRunningInstanceKeys_Static_0100] start');
        try {
          testAbilityContext?.getApplicationContext().getAllRunningInstanceKeys()
        } catch (error) {
          let code = (error as BusinessError).code;
          let message = (error as BusinessError).message;
          console.error(`getAllRunningInstanceKeys fail, code: ${code}, msg: ${message}`);
          expect(code).assertEqual(16000078)
        }
        console.info('====> [SUB_Ability_AbilityRuntime_getAllRunningInstanceKeys_Static_0100] end');
        done();
      })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_getCurrentInstanceKey_Static_0100
     * @tc.number SUB_Ability_AbilityRuntime_getCurrentInstanceKey_Static_0100
     * @tc.desc   When app not support capability, an error code is returned.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_getCurrentInstanceKey_Static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let tag = "SUB_Ability_AbilityRuntime_getCurrentInstanceKey_Static_0100";
        console.info('====> [SUB_Ability_AbilityRuntime_getCurrentInstanceKey_Static_0100] start');
        try {
          testAbilityContext?.getApplicationContext().getCurrentInstanceKey()
        } catch (error) {
          let code = (error as BusinessError).code;
          let message = (error as BusinessError).message;
          console.error(`getAllRunningInstanceKeys fail, code: ${code}, msg: ${message}`);
          expect(code).assertEqual(16000078)
        }
        console.info('====> [SUB_Ability_AbilityRuntime_getCurrentInstanceKey_Static_0100] end');
        done();
      })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppManager_Static_0100
     * @tc.number SUB_Ability_AbilityRuntime_AppManager_Static_0100
     * @tc.desc   Call the interface to return whether the current application is running
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AppManager_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let tag = `SUB_Ability_AbilityRuntime_AppManager_Static_0100`;
        hilog.info(domain, tag, `SUB_Ability_AbilityRuntime_AppManager_Static_0100 begin`);
        try {
          appManager.isAppRunning('com.example.systemapitest.static', 1001).then((data: boolean) => {
            hilog.info(domain, tag, `isAppRunning success, data: ${data}`);
            expect().assertFail();
            done();
          }).catch((err): void => {
            if (err instanceof BusinessError) {
              hilog.info(domain, tag, `isAppRunning error, err: ${err?.code}`);
              expect(err?.code).assertEqual(16000073);
              done();
            }
          });
        } catch (err) {
          if (err instanceof BusinessError) {
            hilog.info(domain, tag, `isAppRunning error, errorCode: ${err?.code}`);
            expect().assertFail();
            done();
          }
        }
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppManager_Static_0200
     * @tc.number SUB_Ability_AbilityRuntime_AppManager_Static_0200
     * @tc.desc   Registering an Application Status Listener.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AppManager_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const itName = 'SUB_Ability_AbilityRuntime_AppManager_Static_0200';
        hilog.info(domain, tag, `${itName} start`);
        let offInvokeSuccess = false;
        try {
          const observer = new CustomApplicationStateObserver();
          const observerId = appManager.onApplicationStateChange(observer);
          hilog.info(domain, tag, `${itName} observerId: ${observerId}`);

          hilog.info(domain, tag, `${itName} start reply ability`);
          const want: Want = {
            bundleName: `${RELY_BUNDLE_NAME}`,
            abilityName: 'EntryAbility'
          }
          await testAbilityContext!.startAbility(want);
          await Utils.msSleep(2000);

          hilog.info(domain, tag, `${itName} AppStateData assert start`);
          console.log(`${domain} ${tag} ${itName} appStateData: `, observer.appStateData);
          expect(observer.appStateData?.bundleName).assertEqual(`${RELY_BUNDLE_NAME}`);
          expect(observer.appStateData?.uid).assertLarger(0);
          expect(observer.appStateData?.state).assertLarger(0);
          expect(observer.appStateData?.isSplitScreenMode).assertFalse();
          expect(observer.appStateData?.isFloatingWindowMode).assertFalse();
          hilog.info(domain, tag, `${itName} AppStateData assert end`);

          hilog.info(domain, tag, `${itName} AbilityStateData assert start`);
          console.log(`${domain} ${tag} ${itName} abilityStateData: `, observer.abilityStateData);
          expect(observer.abilityStateData?.bundleName).assertEqual(`${RELY_BUNDLE_NAME}`);
          expect(observer.abilityStateData?.uid).assertLarger(0);
          expect(typeof (observer.abilityStateData?.state)).assertEqual('int');
          expect(observer.abilityStateData?.abilityName).assertEqual('EntryAbility');
          expect(observer.abilityStateData?.pid).assertEqual(observer.processData?.pid);
          expect(observer.abilityStateData?.moduleName).assertEqual('entry');
          expect(`${observer.abilityStateData?.abilityType}`).assertEqual('1');
          expect(observer.abilityStateData?.isAtomicService).assertFalse();
          expect(observer.abilityStateData?.appCloneIndex).assertUndefined();
          expect(observer.abilityStateData?.callerBundleName).assertEqual(`${BUNDLE_NAME}`);
          hilog.info(domain, tag, `${itName} AbilityStateData assert end`);

          hilog.info(domain, tag, `${itName} ProcessData assert start`);
          console.log(`${domain} ${tag} ${itName} processData: `, observer.processData);
          expect(observer.processData?.pid).assertLarger(0);
          expect(observer.processData?.bundleName).assertEqual(`${RELY_BUNDLE_NAME}`);
          expect(observer.processData?.uid).assertLarger(0);
          expect(observer.processData?.isContinuousTask).assertFalse();
          expect(observer.processData?.isKeepAlive).assertFalse();
          expect(typeof (observer.processData?.state)).assertEqual('int');
          hilog.info(domain, tag, `${itName} ProcessData assert End`);

          hilog.info(domain, tag, `${itName} off applicationState`);
          await appManager.offApplicationStateChange(observerId).then(() => {
            hilog.info(domain, tag, `${itName} offApplicationStateChange success`);
            offInvokeSuccess = true;
          }).catch((e: Error) => {
            const err = e as BusinessError;
            hilog.info(domain, tag, `${itName} off err: code ${err.code}, message ${err.message}`);
            expect().assertFail();
          })
          expect(offInvokeSuccess).assertTrue();
        } catch (err) {
          if (err instanceof BusinessError) {
            hilog.info(domain, tag, `${itName} err: code ${err.code}, message ${err.message}`);
            expect().assertFail();
          }
        }
        hilog.info(domain, tag, `${itName} end`);
        done()
      })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppManager_Static_0600
     * @tc.number SUB_Ability_AbilityRuntime_AppManager_Static_0600
     * @tc.desc   Registering an Application Status Listener.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AppManager_Static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const itName = 'SUB_Ability_AbilityRuntime_AppManager_Static_0600';
        hilog.info(domain, tag, `${itName} start`);
        try {
          hilog.info(domain, tag, `${itName} off applicationState`);
          appManager.offApplicationStateChange(-1, (err: BusinessError<void> | null): void => {
            hilog.info(domain, tag, `${itName} off err: code ${err?.code}, message ${err?.message}`);
            expect(err?.code).assertEqual(401);
            done();
          })
        } catch (err) {
          if (err instanceof BusinessError) {
            hilog.info(domain, tag, `${itName} err: code ${err?.code}, message ${err?.message}`);
            expect(err?.code).assertEqual(401);
            done();
          }
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppManager_Static_0700
     * @tc.number SUB_Ability_AbilityRuntime_AppManager_Static_0700
     * @tc.desc   Registering an Application Status Listener.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AppManager_Static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const itName = 'SUB_Ability_AbilityRuntime_AppManager_Static_0700';
        hilog.info(domain, tag, `${itName} start`);
        let bundleNameList = ['bundleName1', 'bundleName2'];
        try {
          const observer = new CustomApplicationStateObserver();
          const observerId = appManager.onApplicationStateChange(observer, bundleNameList);
          hilog.info(domain, tag, `${itName} observerId: ${observerId}`);
          expect(observerId).assertLarger(0);
          done();
        } catch (err) {
          if (err instanceof BusinessError) {
            hilog.info(domain, tag, `${itName} err: code ${err?.code}, message ${err?.message}`);
            expect().assertFail();
            done();
          }
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppManager_Static_0300
     * @tc.number SUB_Ability_AbilityRuntime_AppManager_Static_0300
     * @tc.desc   Test the third-party application with permission call killProcessesByBundleName will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AppManager_Static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let bundleName = "com.ohos.application";
        try {
          appManager.killProcessesByBundleName(bundleName, false).then(() => {
            hilog.info(domain, tag,
              'SUB_Ability_AbilityRuntime_AppManager_Static_0300 killProcessesByBundleName success.');
            expect().assertFail();
            done();
          }).catch((err): void => {
            hilog.info(domain, tag,
              `SUB_Ability_AbilityRuntime_AppManager_Static_0300 killProcessesByBundleName fail, code is ${err.code}`);
            expect(err.code).assertEqual(16000050);
            done();
          });
        } catch (paramError) {
          if (paramError instanceof BusinessError) {
            let code = paramError.code;
            let message = paramError.message;
            hilog.info(domain, tag,
              `SUB_Ability_AbilityRuntime_AppManager_Static_0300 [appManager] error: ${code}, ${message}`);
            expect(paramError.code).assertEqual(16000050);
            done();
          }
        }
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppManager_Static_0400
     * @tc.number SUB_Ability_AbilityRuntime_AppManager_Static_0400
     * @tc.desc   Test the third-party application with permission call killProcessesByBundleName will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_AppManager_Static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let bundleName = "com.ohos.application";
        try {
          appManager.killProcessesByBundleName(bundleName, true).then(() => {
            hilog.info(domain, tag,
              'SUB_Ability_AbilityRuntime_AppManager_Static_0400 killProcessesByBundleName success.');
            expect().assertFail();
            done();
          }).catch((err): void => {
            hilog.info(domain, tag,
              `SUB_Ability_AbilityRuntime_AppManager_Static_0400 killProcessesByBundleName fail, code is ${err.code}`);
            expect(err.code).assertEqual(16000050);
            done();
          });
        } catch (paramError) {
          if (paramError instanceof BusinessError) {
            let code = paramError.code;
            let message = paramError.message;
            hilog.info(domain, tag,
              `SUB_Ability_AbilityRuntime_AppManager_Static_0400 [appManager] error: ${code}, ${message}`);
            expect().assertFail();
            done();
          }
        }
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppManager_Static_0500
     * @tc.number SUB_Ability_AbilityRuntime_AppManager_Static_0500
     * @tc.desc   Test the third-party application with permission call killProcessesByBundleName will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_AppManager_Static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let bundleName = "";
        try {
          appManager.killProcessesByBundleName(bundleName, false).then(() => {
            hilog.info(domain, tag,
              'SUB_Ability_AbilityRuntime_AppManager_Static_0500 killProcessesByBundleName success.');
            expect().assertFail();
            done();
          }).catch((err): void => {
            hilog.info(domain, tag,
              `SUB_Ability_AbilityRuntime_AppManager_Static_0500 killProcessesByBundleName fail, code is ${err.code}`);
            expect(err.code).assertEqual(16000050);
            done();
          });
        } catch (paramError) {
          if (paramError instanceof BusinessError) {
            let code = paramError.code;
            let message = paramError.message;
            hilog.info(domain, tag,
              `SUB_Ability_AbilityRuntime_AppManager_Static_0500 [appManager] error: ${code}, ${message}`);
            expect().assertFail();
            done();
          }
        }
      });
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIServiceExtension_Static_1000
     * @tc.number SUB_Ability_AbilityRuntime_UIServiceExtension_Static_1000
     * @tc.desc   When the input parameter want is null, an error code is returned.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIServiceExtension_Static_1000', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let tag = "SUB_Ability_AbilityRuntime_UIServiceExtension_Static_1000";
        hilog.info(domain, tag,
          `====> [SUB_Ability_AbilityRuntime_UIServiceExtension_Static_1000] isSupportCapability: ${isSupportCapability}`);
        try {
          testAbilityContext?.startUIServiceExtensionAbility({
            bundleName: "com.example.startuiserviceextensiontest.static",
            abilityName: "abilityerror"
          }).then((data) => {
            hilog.info(domain, tag, `====> startUIServiceExtensionAbility success.`);
            expect().assertFail();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, `====> startUIServiceExtensionAbility error. code: ${err?.code}`);
            if (isSupportCapability) {
              expect(`${err?.code}`).assertEqual(`16000001`);
            } else {
              expect(`${err?.code}`).assertEqual(`801`);
            }
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, `====> startUIServiceExtensionAbility faill. err code: ${err?.code}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIServiceExtension_Static_1100
     * @tc.number SUB_Ability_AbilityRuntime_UIServiceExtension_Static_1100
     * @tc.desc   When the input parameter want is null, an error code is returned.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIServiceExtension_Static_1100', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let tag = "SUB_Ability_AbilityRuntime_UIServiceExtension_Static_1100";
        console.info('====> [SUB_Ability_AbilityRuntime_UIServiceExtension_Static_1100] isSupportCapability: ' +
          isSupportCapability);
        try {
          const dataCallback = new CustomDataCallBack();
          testAbilityContext?.connectUIServiceExtensionAbility({
            bundleName: "com.acts.startuiserviceextensiontest",
            abilityName: "abilityerror"
          }, dataCallback).then((proxy: common.UIServiceProxy) => {
            hilog.info(domain, tag, `====> connectUIServiceExtensionAbility success.`);
            expect().assertFail();
            done();
          }).catch((err) => {
            hilog.info(domain, tag, `====> connectUIServiceExtensionAbility error. code: ${err?.code}`);
            expect(`${err?.code}`).assertEqual(`16000001`);
            done();
          })
        } catch (err) {
          hilog.info(domain, tag, `====> connectUIServiceExtensionAbility faill. err code: ${err?.code}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIServiceExtension_Static_0300
     * @tc.number SUB_Ability_AbilityRuntime_UIServiceExtension_Static_0300
     * @tc.desc   When the input parameter want is null, an error code is returned.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIServiceExtension_Static_0300', Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let tag = "SUB_Ability_AbilityRuntime_UIServiceExtension_Static_0300";
        console.info('====> [SUB_Ability_AbilityRuntime_UIServiceExtension_Static_0300] isSupportCapability: ' +
          isSupportCapability);
        if (isSupportCapability) {
          try {
            const uiServiceProxy = new CustomUIServiceProxy();
            testAbilityContext?.disconnectUIServiceExtensionAbility(uiServiceProxy).then(() => {
              hilog.info(domain, tag, `====> disconnectUIServiceExtensionAbility success.`);
              expect().assertFail();
              done();
            }).catch((err) => {
              hilog.info(domain, tag, `====> disconnectUIServiceExtensionAbility error. code: ${err?.code}`);
              expect(`${err?.code}`).assertEqual(`401`);
              done();
            });
          } catch (err) {
            hilog.info(domain, tag, `====> disconnectUIServiceExtensionAbility fail. code: ${err?.code}`);
            expect(`${err?.code}`).assertEqual(`401`);
            done();
          }
        } else {
          hilog.info(domain, tag, `====> disconnectUIServiceExtensionAbility function not enable.`);
          expect(isSupportCapability).assertFalse();
          done();
        }
      })
    
    /**
     * @tc.name   SUB_Ability_AbilityManager_GetAbilityRunningInfos_PROMISE_static_001
     * @tc.number SUB_Ability_AbilityManager_GetAbilityRunningInfos_PROMISE_static_001
     * @tc.desc   getAbilityRunningInfos Promise with Permissions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_Ability_AbilityManager_GetAbilityRunningInfos_PROMISE_static_001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      let tag = 'SUB_Ability_AbilityManager_GetAbilityRunningInfos_PROMISE_static_001';
      abilityManager.getAbilityRunningInfos()
      .then((data: abilityManager.AbilityRunningInfo[]): void => {
        hilog.info(domain, tag, 'data: ' + JSON.stringify(data[0]));
        expect(data[0].ability.bundleName).assertEqual('com.acts.startuiserviceextensionrely.static');
        expect(data[0].pid).assertLargerOrEqual(0);
        expect(data[0].uid).assertLargerOrEqual(0);
        expect(data[0].processName).assertEqual("com.acts.startuiserviceextensionrely.static");
        expect(data[0].abilityState).not().assertNull();
        expect(data[0].startTime).assertLarger(0);
        done();
      })
      .catch((err): void => {
        if (err instanceof BusinessError) {
          hilog.info(domain, tag, ' err:' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })
    })
  })
}
