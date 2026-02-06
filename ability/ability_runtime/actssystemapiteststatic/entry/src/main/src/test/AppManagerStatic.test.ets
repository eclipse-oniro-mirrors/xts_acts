/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import { describe, it, beforeAll, expect, TestType, Size, Level } from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog'
import appManager from "@ohos.app.ability.appManager"
import { Driver, ON } from '@ohos.UiTest';

let domain: int = 0x0000;
let tag: string = 'testTag';

class CustomApplicationStateObserver implements appManager.ApplicationStateObserver {
  public appStateData?: appManager.AppStateData;
  public abilityStateData?: appManager.AbilityStateData;
  public processData?: appManager.ProcessData;

  onForegroundApplicationChanged(appStateData: appManager.AppStateData): void {
    this.appStateData = appStateData;
    hilog.info(domain, tag, `ApplicationStateObserver onForegroundApplicationChanged`);
  }

  onAbilityStateChanged(abilityStateData: appManager.AbilityStateData): void {
    this.abilityStateData = abilityStateData;
    hilog.info(domain, tag, `ApplicationStateObserver onAbilityStateChanged`);
  }

  onProcessCreated(processData: appManager.ProcessData): void {
    this.processData = processData;
    hilog.info(domain, tag, `ApplicationStateObserver onProcessCreated`);
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

export default function appManagerStaticTest() {
  describe('appManagerStaticTest', () => {
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
    })
    
    /**
     * @tc.name   System_API_Test_App_Manager_Static_1700
     * @tc.number System_API_Test_App_Manager_Static_1700
     * @tc.desc   Test the third-party application without permission call killProcessesByBundleName will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('System_API_Test_App_Manager_Static_1700', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      let bundleName = "com.ohos.application";
      try {
        appManager.killProcessesByBundleName(bundleName, false).then(() => {
          hilog.info(domain, tag, 'System_API_Test_App_Manager_Static_1700 killProcessesByBundleName success.');
          expect().assertFail();
          done();
        }).catch((err: Error): void => {
          hilog.info(domain, tag, `System_API_Test_App_Manager_Static_1700 killProcessesByBundleName fail, err: ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(201);
          done();
        });
      } catch (paramError) {
        let code = (paramError as BusinessError).code;
        let message = (paramError as BusinessError).message;
        hilog.info(domain, tag, `System_API_Test_App_Manager_Static_1700 [appManager] error: ${code}, ${message}`);
        expect(paramError.code).assertEqual(201);
        done();
      }
    });

    /**
     * @tc.name   System_API_Test_App_Manager_Static_1800
     * @tc.number System_API_Test_App_Manager_Static_1800
     * @tc.desc   Test the third-party application without permission call killProcessesByBundleName will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('System_API_Test_App_Manager_Static_1800', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      let bundleName = "com.ohos.application";
      try {
        appManager.killProcessesByBundleName(bundleName, false, 0).then(() => {
          hilog.info(domain, tag, 'System_API_Test_App_Manager_Static_1800 killProcessesByBundleName success.');
          expect().assertFail();
          done();
        }).catch((err: Error): void => {
          hilog.info(domain, tag, `System_API_Test_App_Manager_Static_1800 killProcessesByBundleName fail, err: ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(201);
          done();
        });
      } catch (paramError) {
        let code = (paramError as BusinessError).code;
        let message = (paramError as BusinessError).message;
        hilog.info(domain, tag, `System_API_Test_App_Manager_Static_1800 [appManager] error: ${code}, ${message}`);
        expect(paramError.code).assertEqual(201);
        done();
      }
    });

    /**
     * @tc.name   Public_API_Test_App_Manager_Static_0100
     * @tc.number Public_API_Test_App_Manager_Static_0100
     * @tc.desc   Test the third-party application get ProcessState enum will be right
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Public_API_Test_App_Manager_Static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect(appManager.ProcessState.STATE_CREATE + '').assertEqual('0');
      expect(appManager.ProcessState.STATE_FOREGROUND + '').assertEqual('1');
      expect(appManager.ProcessState.STATE_ACTIVE + '').assertEqual('2');
      expect(appManager.ProcessState.STATE_BACKGROUND + '').assertEqual('3');
      expect(appManager.ProcessState.STATE_DESTROY + '').assertEqual('4');
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AppManager_Static_0100
     * @tc.number SUB_Ability_AbilityBase_AppManager_Static_0100
     * @tc.desc   Test the return value of the isRunningInStabilityTest interface(Promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityBase_AppManager_Static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      let tag = `SUB_Ability_AbilityBase_AppManager_Static_0100`;
      hilog.info(domain, tag, 'SUB_Ability_AbilityBase_AppManager_0100 begin');
      try {
        appManager.isRunningInStabilityTest().then((data: boolean)=>{
          hilog.info(domain, tag, 'isRunningInStabilityTest success, pid: ' + data);
          expect(data).assertFalse();
          done();
        }).catch((err: Error): void => {
          hilog.info(domain, tag, ' isRunningInStabilityTest error, err: ' + err?.code);
          expect().assertFail();
          done();
        });
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, ' isRunningInStabilityTest error, errorCode: ' + err?.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_AppManager_Static_0200
     * @tc.number SUB_Ability_AbilityBase_AppManager_Static_0200
     * @tc.desc   Test the return value of the isRunningInStabilityTest interface(CallBack).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityBase_AppManager_Static_0200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      let tag = `SUB_Ability_AbilityBase_AppManager_Static_0200`;
      hilog.info(domain, tag, 'SUB_Ability_AbilityBase_AppManager_Static_0200 begin');
      try {
        appManager.isRunningInStabilityTest((err, data)=>{
          hilog.info(domain, tag, 'isRunningInStabilityTest success, pid: ' + data);
          expect(data).assertFalse();
          done();
        })
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, ' isRunningInStabilityTest error, err: ' + err?.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_AppManager_Static_0400
     * @tc.number SUB_Ability_AbilityBase_AppManager_Static_0400
     * @tc.desc   Verify that isAppRunning is called when no permission is available(appCloneIndex).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityBase_AppManager_Static_0400', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3,  async (done: () => void): Promise<void> => {
      let tag = `SUB_Ability_AbilityBase_AppManager_Static_0400`;
      hilog.info(domain, tag, `SUB_Ability_AbilityBase_AppManager_Static_0400 begin`);
      try {
        appManager.isAppRunning('com.example.systemapitest.static', 0).then((data: boolean)=>{
          hilog.info(domain, tag, `isAppRunning success, data: ${data}`);
          expect(data).assertFalse();
          done();
        }).catch((err: Error): void=>{
          hilog.info(domain, tag, `isAppRunning error, err: ${err?.code}`);
          expect(err?.code).assertEqual(201);
          done();
        });
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, `isAppRunning error, errorCode: ${err?.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_AppManager_Static_0500
     * @tc.number SUB_Ability_AbilityBase_AppManager_Static_0500
     * @tc.desc   Verify that isAppRunning is called when no permission is available(no appCloneIndex)).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityBase_AppManager_Static_0500', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3,  async (done: () => void): Promise<void> => {
      let tag = `SUB_Ability_AbilityBase_AppManager_Static_0500`;
      hilog.info(domain, tag, `SUB_Ability_AbilityBase_AppManager_Static_0500 begin`);
      try {
        appManager.isAppRunning('com.example.systemapitest.static').then((data: boolean)=>{
          hilog.info(domain, tag, `isAppRunning success, data: ${data}`);
          expect(data).assertFalse();
          done();
        }).catch((err: Error): void=>{
          hilog.info(domain, tag, `isAppRunning error, err: ${err?.code}`);
          expect(err?.code).assertEqual(201);
          done();
        });
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, `isAppRunning error, errorCode: ${err?.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_AppManager_Static_0900
     * @tc.number SUB_Ability_AbilityBase_AppManager_Static_0900
     * @tc.desc   Verify isRamConstrainedDevice(callback).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityBase_AppManager_Static_0900', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      let tag = `SUB_Ability_AbilityBase_AppManager_Static_0900`;
      hilog.info(domain, tag, 'SUB_Ability_AbilityBase_AppManager_Static_0900 begin');
      try {
        appManager.isRamConstrainedDevice((err, data)=>{
          expect(typeof data).assertEqual('boolean');
          done();
        })
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, 'isRunningInStabilityTest error, err: ' + err?.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_AppManager_Static_1000
     * @tc.number SUB_Ability_AbilityBase_AppManager_Static_1000
     * @tc.desc   Verify isRamConstrainedDevice(promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityBase_AppManager_Static_1000', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      let tag = `SUB_Ability_AbilityBase_AppManager_Static_1000`;
      hilog.info(domain, tag, 'SUB_Ability_AbilityBase_AppManager_Static_1000 begin');
      try {
        appManager.isRamConstrainedDevice().then((data: boolean)=>{
          expect(typeof data).assertEqual('boolean');
          done();
        }).catch((err: Error): void => {
          expect().assertFail();
          done();
        })
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, ' isRunningInStabilityTest error, err: ' + err?.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_AppManager_Static_1100
     * @tc.number SUB_Ability_AbilityBase_AppManager_Static_1100
     * @tc.desc   Verify getAppMemorySize(promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityBase_AppManager_Static_1100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      let tag = `SUB_Ability_AbilityBase_AppManager_Static_1100`;
      hilog.info(domain, tag, 'SUB_Ability_AbilityBase_AppManager_Static_1100 begin');
      try {
        appManager.getAppMemorySize().then((data: int) => {
          console.log(`The size of app memory is: ${JSON.stringify(data)}`);
          expect(typeof (data)).assertEqual("int");
          expect(data).assertLarger(0);
          done();
        }).catch((err: Error): void => {
          expect().assertFail();
          done();
        })
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, ' isRunningInStabilityTest error, err: ' + err?.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_AppManager_Static_1200
     * @tc.number SUB_Ability_AbilityBase_AppManager_Static_1200
     * @tc.desc   Verify getAppMemorySize(callback).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityBase_AppManager_Static_1200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      let tag = `SUB_Ability_AbilityBase_AppManager_Static_1200`;
      hilog.info(domain, tag, 'SUB_Ability_AbilityBase_AppManager_Static_1200 begin');
      try {
        appManager.getAppMemorySize((err: BusinessError| null, data: int | undefined)=>{
          expect(typeof (data)).assertEqual("int");
          expect(data).assertLarger(0);
          done();
        })
      } catch (err) {
        err = err as BusinessError;
        hilog.info(domain, tag, 'isRunningInStabilityTest error, err: ' + err?.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   System_API_Test_App_Manager_Static_0100
     * @tc.number System_API_Test_App_Manager_Static_0100
     * @tc.desc   Test the third-party application without permission call appManager.on will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('System_API_Test_App_Manager_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const itName = 'System_API_Test_App_Manager_Static_0100';
        hilog.info(domain, tag, `${itName} start`);
        try {
          const observer = new CustomApplicationStateObserver();
          const observerId = appManager.onApplicationStateChange(observer);
          hilog.info(domain, tag, `${itName} observerId: ${observerId}`);
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, `${itName} err: code ${err.code}, message ${err.message}`);
          expect(`${err.code}`).assertEqual(`201`);
        }
        done();
        hilog.info(domain, tag, `${itName} end`);
      })

    /**
     * @tc.name   System_API_Test_App_Manager_Static_0200
     * @tc.number System_API_Test_App_Manager_Static_0200
     * @tc.desc   Test the third-party application without permission call appManager.on will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('System_API_Test_App_Manager_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const itName = 'System_API_Test_App_Manager_Static_0200';
        hilog.info(domain, tag, `${itName} start`);
        let bundleNameList = ['bundleName1', 'bundleName2'];
        try {
          const observer = new CustomApplicationStateObserver();
          const observerId = appManager.onApplicationStateChange(observer, bundleNameList);
          hilog.info(domain, tag, `${itName} observerId: ${observerId}`);
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, `${itName} err: code ${err.code}, message ${err.message}`);
          expect(`${err.code}`).assertEqual(`201`);
        }
        done();
        hilog.info(domain, tag, `${itName} end`);
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AppManager_Static_0600
     * @tc.number SUB_Ability_AbilityBase_AppManager_Static_0600
     * @tc.desc   Verify that off is called when no permission is available(promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityBase_AppManager_Static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const itName = 'SUB_Ability_AbilityBase_AppManager_Static_0600';
        hilog.info(domain, tag, `${itName} start`);
        try {
          hilog.info(domain, tag, `${itName} off applicationState`);
          appManager.offApplicationStateChange(1).then(() => {
            hilog.info(domain, tag, `${itName} off success`);
            expect().assertFail();
            done();
            hilog.info(domain, tag, `${itName} end`);
          }).catch((e: Error) => {
            const err = e as BusinessError;
            hilog.info(domain, tag, `${itName} off err: code ${err.code}, message ${err.message}`);
            expect(`${err.code}`).assertEqual('401');
            done();
            hilog.info(domain, tag, `${itName} end`);
          })
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, `${itName} err: code ${err.code}, message ${err.message}`);
          expect(`${err.code}`).assertEqual('401');
          done();
          hilog.info(domain, tag, `${itName} end`);
        }
      })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AppManager_Static_0700
     * @tc.number SUB_Ability_AbilityBase_AppManager_Static_0700
     * @tc.desc   Verify that off is called when no permission is available(callback).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityBase_AppManager_Static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const itName = 'SUB_Ability_AbilityBase_AppManager_Static_0700';
        hilog.info(domain, tag, `${itName} start`);
        try {
          hilog.info(domain, tag, `${itName} off applicationState`);
          appManager.offApplicationStateChange(1, (err: BusinessError<void> | null): void => {
            hilog.info(domain, tag, `${itName} off err: code ${err?.code}, message ${err?.message}`);
            expect(`${err?.code}`).assertEqual('401');
            done();
            hilog.info(domain, tag, `${itName} end`);
          })
        } catch (err) {
          err = err as BusinessError;
          hilog.info(domain, tag, `${itName} err: code ${err.code}, message ${err.message}`);
          expect(`${err?.code}`).assertEqual('401');
          done();
          hilog.info(domain, tag, `${itName} end`);
        }
      })
  })
}
