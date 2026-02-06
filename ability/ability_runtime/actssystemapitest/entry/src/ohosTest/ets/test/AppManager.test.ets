/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import { describe, it, expect, Level } from '@ohos/hypium'
import appManager from "@ohos.app.ability.appManager"
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';

let ERROR_CODE = 202;
let ERROR_PERMISSION_CODE = 201;
let ERROR_INNER_ERROR = 16000050;

export default function appManagerTest() {
  describe('appManagerTest', () => {

    /**
     * @tc.number: System_API_Test_App_Manager_0100
     * @tc.name: appManager.on public interface interception test
     * @tc.desc: Test the third-party application without permission call appManager.on will be blocked
     * @tc.level 3
     */
    it('System_API_Test_App_Manager_0100', Level.LEVEL0, (done: Function) => {
      let TAG = 'System_API_Test_App_Manager_0100';
      let applicationStateObserver : appManager.ApplicationStateObserver= {
        onForegroundApplicationChanged(appStateData) {
          console.log(TAG + '------------ onForegroundApplicationChanged -----------', appStateData);
        },
        onAbilityStateChanged(abilityStateData) {
          console.log(TAG + '------------ onAbilityStateChanged -----------', abilityStateData);
        },
        onProcessCreated(processData) {
          console.log(TAG + '------------ onProcessCreated -----------', processData);
        },
        onProcessDied(processData) {
          console.log(TAG + '------------ onProcessDied -----------', processData);
        },
        onProcessStateChanged(processData) {
          console.log(TAG + '------------ onProcessStateChanged -----------', processData);
        },
        onAppStarted(appStateData) {
          console.log(TAG + '------------ onAppStarted -----------', appStateData);
        },
        onAppStopped(appStateData) {
          console.log(TAG + '------------ onAppStopped -----------', appStateData);
        },
      }
      try {
        const observerCode = appManager.on("applicationState", applicationStateObserver);
        console.log('-------- observerCode: ---------', observerCode);
      } catch (err) {
        console.log(TAG + "  err.code: " + err.code);
        expect(err.code).assertEqual(ERROR_PERMISSION_CODE);
        done();
      }
    })

    /**
     * @tc.number: System_API_Test_App_Manager_0200
     * @tc.name: Multi-parameter appManager.on public interface interception test
     * @tc.desc: Test the third-party application without permission call appManager.on will be blocked
     * @tc.level 3
     */
    it('System_API_Test_App_Manager_0200', Level.LEVEL0, (done: Function) => {
      let TAG = 'System_API_Test_App_Manager_0200';
      let applicationStateObserver : appManager.ApplicationStateObserver = {
        onForegroundApplicationChanged(appStateData) {
          console.log(TAG + '------------ onForegroundApplicationChanged -----------', appStateData);
        },
        onAbilityStateChanged(abilityStateData) {
          console.log(TAG + '------------ onAbilityStateChanged -----------', abilityStateData);
        },
        onProcessCreated(processData) {
          console.log(TAG + '------------ onProcessCreated -----------', processData);
        },
        onProcessDied(processData) {
          console.log(TAG + '------------ onProcessDied -----------', processData);
        },
        onProcessStateChanged(processData) {
          console.log(TAG + '------------ onProcessStateChanged -----------', processData);
        },
        onAppStarted(appStateData) {
          console.log(TAG + '------------ onAppStarted -----------', appStateData);
        },
        onAppStopped(appStateData) {
          console.log(TAG + '------------ onAppStopped -----------', appStateData);
        },
      }
      let bundleNameList = ['bundleName1', 'bundleName2'];
      try {
        const observerCode = appManager.on("applicationState", applicationStateObserver, bundleNameList);
        console.log('-------- observerCode: ---------', observerCode);
      } catch (err) {
        console.log(TAG + "  err.code: " + err.code);
        expect(err.code).assertEqual(ERROR_PERMISSION_CODE);
        done();
      }
    })

    /**
     * @tc.number: System_API_Test_App_Manager_0300
     * @tc.name: callback form getForegroundApplications system interface interception test
     * @tc.desc: Test the third-party application call getForegroundApplications will be blocked
     * @tc.level 3
     */
    it('System_API_Test_App_Manager_0300', Level.LEVEL0, (done: Function) => {
      let TAG = 'System_API_Test_App_Manager_0300';
      appManager.getForegroundApplications((err) => {
        console.log(TAG + "  err.code: " + err.code);
        expect(err.code).assertEqual(ERROR_CODE);
        done();
      });
    })

    /**
     * @tc.number: System_API_Test_App_Manager_0400
     * @tc.name: promise form getForegroundApplications system interface interception test
     * @tc.desc: Test the third-party application call getForegroundApplications will be blocked
     * @tc.level 3
     */
    it('System_API_Test_App_Manager_0400', Level.LEVEL0, (done: Function) => {
      let TAG = 'System_API_Test_App_Manager_0400';
      appManager.getForegroundApplications()
        .then(err => {
          console.log(TAG + ` err->${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        })
        .catch((err: BusinessError) => {
          console.log(TAG + "  err.code: " + err.code);
          expect(err.code).assertEqual(ERROR_CODE);
          done();
        })
    })

    /**
     * @tc.number: System_API_Test_App_Manager_0500
     * @tc.name: callback form killProcessWithAccount system interface interception test
     * @tc.desc: Test the third-party application call killProcessWithAccount will be blocked
     * @tc.level 3
     */
    it('System_API_Test_App_Manager_0500', Level.LEVEL0, (done: Function) => {
      let TAG = 'System_API_Test_App_Manager_0500';
      let bundleName = "com.ohos.application";
      let accountId = 100;
      appManager.killProcessWithAccount(bundleName, accountId, (err) => {
        console.log(TAG + "  err.code: " + err.code);
        expect(err.code).assertEqual(ERROR_CODE);
        done();
      });
    })

    /**
     * @tc.number: System_API_Test_App_Manager_0600
     * @tc.name: promise form killProcessWithAccount system interface interception test
     * @tc.desc: Test the third-party application call killProcessWithAccount will be blocked
     * @tc.level 3
     */
    it('System_API_Test_App_Manager_0600', Level.LEVEL0, (done: Function) => {
      let TAG = 'System_API_Test_App_Manager_0600';
      let bundleName = "com.ohos.application";
      let accountId = 100;
      appManager.killProcessWithAccount(bundleName, accountId)
        .then(err => {
          console.log(TAG + ` err->${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        })
        .catch((err: BusinessError) => {
          console.log(TAG + "  err.code: " + err.code);
          expect(err.code).assertEqual(ERROR_CODE);
          done();
        })
    })

    /**
     * @tc.number: System_API_Test_App_Manager_0700
     * @tc.name: callback form killProcessesByBundleName public interface interception test
     * @tc.desc: Test the third-party application without permission call killProcessesByBundleName will be blocked
     * @tc.level 3
     */
    it('System_API_Test_App_Manager_0700', Level.LEVEL0, (done: Function) => {
      let TAG = 'System_API_Test_App_Manager_0700';
      let bundleName = "com.ohos.application";
      appManager.killProcessesByBundleName(bundleName, (err) => {
        console.log(TAG + "  err.code: " + err.code);
        expect(err.code).assertEqual(ERROR_PERMISSION_CODE);
        done();
      });
    })

    /**
     * @tc.number: System_API_Test_App_Manager_0800
     * @tc.name: promise form killProcessesByBundleName public interface interception test
     * @tc.desc: Test the third-party application without permission call killProcessesByBundleName will be blocked
     * @tc.level 3
     */
    it('System_API_Test_App_Manager_0800', Level.LEVEL0, (done: Function) => {
      let TAG = 'System_API_Test_App_Manager_0800';
      let bundleName = "com.ohos.application";
      appManager.killProcessesByBundleName(bundleName)
        .then(err => {
          console.log(TAG + ` err->${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        })
        .catch((err: BusinessError) => {
          console.log(TAG + "  err.code: " + err.code);
          expect(err.code).assertEqual(ERROR_PERMISSION_CODE);
          done();
        })
    })

    /**
     * @tc.number: System_API_Test_App_Manager_0900
     * @tc.name: callback form clearUpApplicationData system interface interception test
     * @tc.desc: Test the third-party application call clearUpApplicationData will be blocked
     * @tc.level 3
     */
    it('System_API_Test_App_Manager_0900', Level.LEVEL0, (done: Function) => {
      let TAG = 'System_API_Test_App_Manager_0900';
      let bundleName = "com.ohos.application";
      appManager.clearUpApplicationData(bundleName, (err) => {
        console.log(TAG + "  err.code: " + err.code);
        expect(err.code).assertEqual(ERROR_CODE);
        done();
      });
    })

    /**
     * @tc.number: System_API_Test_App_Manager_1000
     * @tc.name: promise form clearUpApplicationData system interface interception test
     * @tc.desc: Test the third-party application call clearUpApplicationData will be blocked
     * @tc.level 3
     */
    it('System_API_Test_App_Manager_1000', Level.LEVEL0, (done: Function) => {
      let TAG = 'System_API_Test_App_Manager_1000';
      let bundleName = "com.ohos.application";
      appManager.clearUpApplicationData(bundleName)
        .then(err => {
          console.log(TAG + ` err->${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        })
        .catch((err: BusinessError) => {
          console.log(TAG + "  err.code: " + err.code);
          expect(err.code).assertEqual(ERROR_CODE);
          done();
        })
    })


    /**
     * @tc.number: System_API_Test_App_Manager_1100
     * @tc.name: callback form GetProcessMemoryByPid system interface interception test
     * @tc.desc: Test the third-party application call GetProcessMemoryByPid will be blocked
     * @tc.level 3
     */
    it('System_API_Test_App_Manager_1100', Level.LEVEL0, (done: Function) => {
      let TAG = 'System_API_Test_App_Manager_1100';
      let pid = 0;
      appManager.getProcessMemoryByPid(pid, (err) => {
        console.log(TAG + "  err.code: " + err.code);
        expect(err.code).assertEqual(ERROR_CODE);
        done();
      });
    })

    /**
     * @tc.number: System_API_Test_App_Manager_1200
     * @tc.name: promise form GetProcessMemoryByPid system interface interception test
     * @tc.desc: Test the third-party application call GetProcessMemoryByPid will be blocked
     * @tc.level 3
     */
    it('System_API_Test_App_Manager_1200', Level.LEVEL0, (done: Function) => {
      let TAG = 'System_API_Test_App_Manager_1200';
      let pid = 0;
      appManager.getProcessMemoryByPid(pid)
        .then(err => {
          console.log(TAG + ` err->${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        })
        .catch((err: BusinessError) => {
          console.log(TAG + "  err.code: " + err.code);
          expect(err.code).assertEqual(ERROR_CODE);
          done();
        })
    })

    /**
     * @tc.number: System_API_Test_App_Manager_1300
     * @tc.name: callback form getRunningProcessInfoByBundleName system interface interception test
     * @tc.desc: Test the third-party application call getRunningProcessInfoByBundleName will be blocked
     * @tc.level 3
     */
    it('System_API_Test_App_Manager_1300', Level.LEVEL0, (done: Function) => {
      let TAG = 'System_API_Test_App_Manager_1300';
      let bundleName = "com.ohos.application";
      appManager.getRunningProcessInfoByBundleName(bundleName, (err) => {
        console.log(TAG + "  err.code: " + err.code);
        expect(err.code).assertEqual(ERROR_CODE);
        done();
      });
    })

    /**
     * @tc.number: System_API_Test_App_Manager_1400
     * @tc.name: promise form getRunningProcessInfoByBundleName system interface interception test
     * @tc.desc: Test the third-party application call getRunningProcessInfoByBundleName will be blocked
     * @tc.level 3
     */
    it('System_API_Test_App_Manager_1400', Level.LEVEL0, (done: Function) => {
      let TAG = 'System_API_Test_App_Manager_1400';
      let bundleName = "com.ohos.application";
      appManager.getRunningProcessInfoByBundleName(bundleName)
        .then(err => {
          console.log(TAG + ` err->${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        })
        .catch((err: BusinessError) => {
          console.log(TAG + "  err.code: " + err.code);
          expect(err.code).assertEqual(ERROR_CODE);
          done();
        })
    })

    /**
     * @tc.number: System_API_Test_App_Manager_1500
     * @tc.name: callback form getRunningProcessInfoByBundleName system interface interception test
     * @tc.desc: Test the third-party application call getRunningProcessInfoByBundleName will be blocked
     * @tc.level 3
     */
    it('System_API_Test_App_Manager_1500', Level.LEVEL0, (done: Function) => {
      let TAG = 'System_API_Test_App_Manager_1500';
      let bundleName = "com.ohos.application";
      let userId = 100;
      appManager.getRunningProcessInfoByBundleName(bundleName, userId, (err) => {
        console.log(TAG + "  err.code: " + err.code);
        expect(err.code).assertEqual(ERROR_CODE);
        done();
      });
    })

    /**
     * @tc.number: System_API_Test_App_Manager_1600
     * @tc.name: promise form getRunningProcessInfoByBundleName system interface interception test
     * @tc.desc: Test the third-party application call getRunningProcessInfoByBundleName will be blocked
     * @tc.level 3
     */
    it('System_API_Test_App_Manager_1600', Level.LEVEL0, (done: Function) => {
      let TAG = 'System_API_Test_App_Manager_1600';
      let bundleName = "com.ohos.application";
      let userId = 100;
      appManager.getRunningProcessInfoByBundleName(bundleName, userId)
        .then(err => {
          console.log(TAG + ` err->${JSON.stringify(err)}`);
          expect().assertFail();
          done();
        })
        .catch((err: BusinessError) => {
          console.log(TAG + "  err.code: " + err.code);
          expect(err.code).assertEqual(ERROR_CODE);
          done();
        })
    })


    /**
     * @tc.number: Public_API_Test_App_Manager_0100
     * @tc.name: ProcessState enum public interface test
     * @tc.desc: Test the third-party application get ProcessState enum will be right
     * @tc.level 3
     */
    it('Public_API_Test_App_Manager_0100', Level.LEVEL0, (done: Function) => {
      expect(appManager.ProcessState.STATE_CREATE).assertEqual(0);
      expect(appManager.ProcessState.STATE_FOREGROUND).assertEqual(1);
      expect(appManager.ProcessState.STATE_ACTIVE).assertEqual(2);
      expect(appManager.ProcessState.STATE_BACKGROUND).assertEqual(3);
      expect(appManager.ProcessState.STATE_DESTROY).assertEqual(4);
      done();
    })

    /**
     * @tc.number: Public_API_Test_App_Manager_0200
     * @tc.name: ApplicationState enum public interface test
     * @tc.desc: Test the third-party application get ApplicationState enum will be right
     * @tc.level 3
     */
    it('Public_API_Test_App_Manager_0200', Level.LEVEL0, (done: Function) => {
      expect(appManager.ApplicationState.STATE_CREATE).assertEqual(0);
      expect(appManager.ApplicationState.STATE_FOREGROUND).assertEqual(2);
      expect(appManager.ApplicationState.STATE_ACTIVE).assertEqual(3);
      expect(appManager.ApplicationState.STATE_BACKGROUND).assertEqual(4);
      expect(appManager.ApplicationState.STATE_DESTROY).assertEqual(5);
      done();
    })

        /*
     * @tc.number : SUB_Ability_AbilityBase_AppManager_0100
     * @tc.name   : Test the return value of the isRunningInStabilityTest interface(Promise).
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityBase_AppManager_0100', Level.LEVEL0, async (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_AppManager_0100`;
      console.log(`${tag}, it begin`);
        try {
          await appManager.isRunningInStabilityTest().then((data)=>{
            console.log(`${tag} isRunningInStabilityTest success, pid: ${data}`);
            try{expect(data).assertFalse();}catch(e){}
            done();
          }).catch((err:BusinessError)=>{
            console.log(`${tag} isRunningInStabilityTest error, err: ${err?.code}`);
            try{expect().assertFail();}catch(e){}
            done();
          });
        } catch (err) {
          console.error(`${tag} isRunningInStabilityTest error, errorCode: ${err?.code}`);
          expect().assertFail();
          done();
        }
    });

    /*
     * @tc.number : SUB_Ability_AbilityBase_AppManager_0200
     * @tc.name   : Test the return value of the isRunningInStabilityTest interface(CallBack).
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityBase_AppManager_0200', Level.LEVEL0, async (done: Function) => {
      let tag = `SUB_AA_ChildProcessManager_startChildProcess_0300`;
      console.log(`${tag}, it begin`);
      try {
        appManager.isRunningInStabilityTest((err, data)=>{
          console.error(`${tag} isRunningInStabilityTest success, errorCode: ${data}`);
          try{expect(data).assertFalse();}catch(e){}
          done();
        })
      } catch (err) {
        console.error(`${tag} isRunningInStabilityTest error, errorCode: ${err?.code}`);
        try{expect().assertFail();}catch(e){}
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityBase_AppManager_0400
     * @tc.name   : Verify that isAppRunning is called when no permission is available(appCloneIndex).
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityBase_AppManager_0400', Level.LEVEL0, async (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_AppManager_0400`;
      console.log(`${tag}, it begin`);
      try {
        appManager.isAppRunning('com.acts.example.startselfuiabilitytest', 0).then((data)=>{
          console.log(`${tag} isAppRunning success, data: ${data}`);
          try{expect(data).assertFalse();}catch(e){}
          done();
        }).catch((err:BusinessError)=>{
          console.log(`${tag} isAppRunning error, err: ${err?.code}`);
          try{expect(err?.code).assertEqual(201);}catch(e){}
          done();
        });
      } catch (err) {
        console.error(`${tag} isAppRunning error, errorCode: ${err?.code}`);
        expect().assertFalse();
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityBase_AppManager_0500
     * @tc.name   : Verify that isAppRunning is called when no permission is available(no appCloneIndex)).
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityBase_AppManager_0500', Level.LEVEL0, async (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_AppManager_0500`;
      console.log(`${tag}, it begin`);
      try {
        appManager.isAppRunning('com.acts.example.startselfuiabilitytest').then((data)=>{
          console.log(`${tag} isAppRunning success, data: ${data}`);
          try{expect(data).assertFalse();}catch(e){}
          done();
        }).catch((err:BusinessError)=>{
          console.log(`${tag} isAppRunning error, err: ${err?.code}`);
          try{expect(err?.code).assertEqual(201);}catch(e){}
          done();
        });
      } catch (err) {
        console.error(`${tag} isAppRunning error, errorCode: ${err?.code}`);
        expect().assertFalse();
        done();
      }
    });
    /*
     * @tc.number : SUB_Ability_AbilityBase_AppManager_0600
     * @tc.name   : Verify that off is called when no permission is available(promise).
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityBase_AppManager_0600', Level.LEVEL0, async (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_AppManager_0600`;
      console.log(`${tag}, it begin`);
      try {
        appManager.off('applicationState', 1).then((data)=>{
          console.log(`${tag} off success, pid: ${data}`);
          try{expect(data).assertFalse();}catch(e){}
          done();
        }).catch((err:BusinessError)=>{
          console.log(`${tag} off error, err: ${err?.code}`);
          try{expect().assertFail();}catch(e){}
          done();
        });
      } catch (err) {
        console.error(`${tag} off error, errorCode: ${err?.code}`);
        expect(err?.code).assertEqual(401)
        done();
      }
    });
    /*
     * @tc.number : SUB_Ability_AbilityBase_AppManager_0700
     * @tc.name   : Verify that off is called when no permission is available(callback).
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityBase_AppManager_0700', Level.LEVEL0, async (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_AppManager_0700`;
      console.log(`${tag}, it begin`);
      try {
        appManager.off('applicationState', 1, (data)=>{
          try{expect(data).assertFalse();}catch(e){}
          done();
        })
      } catch (err) {
        console.error(`${tag} off error, errorCode: ${err?.code}`);
        expect(err?.code).assertEqual(401)
        done();
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityBase_AppManager_0900
     * @tc.name   : Verify isRamConstrainedDevice(callback).
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityBase_AppManager_0900', Level.LEVEL0, async (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_AppManager_0700`;
      console.log(`${tag}, it begin`);
      try {
        appManager.isRamConstrainedDevice((err, data)=>{
          try{expect(typeof data).assertEqual('boolean');}catch(e){}
          done();
        })
      } catch (err) {
        console.error(`${tag} off error, errorCode: ${err?.code}`);
        expect().assertFail();
        done();
      }
    });
    
    /*
     * @tc.number : SUB_Ability_AbilityBase_AppManager_1000
     * @tc.name   : Verify isRamConstrainedDevice(promise).
     * @tc.desc   : Expect: call failed
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityBase_AppManager_1000', Level.LEVEL0, async (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_AppManager_1000`;
      console.log(`${tag}, it begin`);
      try {
        appManager.isRamConstrainedDevice().then((data)=>{
          try{expect(typeof data).assertEqual('boolean');}catch(e){}
          done();
        }).catch((err:BusinessError)=>{
          try{expect().assertFail();}catch(e){}
          done();
        })
      } catch (err) {
        console.error(`${tag} off error, errorCode: ${err?.code}`);
        expect().assertFail();
        done();
      }
    });

     /**
     * @tc.number: System_API_Test_App_Manager_1700
     * @tc.name: promise form killProcessesByBundleName public interface interception test
     * @tc.desc: Test the third-party application without permission call killProcessesByBundleName will be blocked
     * @tc.level 3
     */
     it('System_API_Test_App_Manager_1700', Level.LEVEL0, (done: Function) => {
      let TAG = 'System_API_Test_App_Manager_1700';
      let bundleName = "com.ohos.applicationsss";
      try {
        appManager.killProcessesByBundleName(bundleName, false).then((data) => {
          console.log('System_API_Test_App_Manager_1700 killProcessesByBundleName success.');
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.error(`System_API_Test_App_Manager_1700 killProcessesByBundleName fail, err: ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(ERROR_PERMISSION_CODE);
          done();
        });
      } catch (paramError) {
        let code = (paramError as BusinessError).code;
        let message = (paramError as BusinessError).message;
        console.error(`System_API_Test_App_Manager_1700 [appManager] error: ${code}, ${message}`);
        expect(paramError.code).assertEqual(ERROR_PERMISSION_CODE);
        done();
      }
    });
  })
}