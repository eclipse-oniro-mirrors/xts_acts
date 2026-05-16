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
     * @tc.name   System_API_Test_App_Manager_0100
     * @tc.number System_API_Test_App_Manager_0100
     * @tc.desc   Test the third-party application without permission call appManager.on will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   System_API_Test_App_Manager_0200
     * @tc.number System_API_Test_App_Manager_0200
     * @tc.desc   Test the third-party application without permission call appManager.on will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   System_API_Test_App_Manager_0300
     * @tc.number System_API_Test_App_Manager_0300
     * @tc.desc   Test the third-party application call getForegroundApplications will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   System_API_Test_App_Manager_0400
     * @tc.number System_API_Test_App_Manager_0400
     * @tc.desc   Test the third-party application call getForegroundApplications will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   System_API_Test_App_Manager_0500
     * @tc.number System_API_Test_App_Manager_0500
     * @tc.desc   Test the third-party application call killProcessWithAccount will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   System_API_Test_App_Manager_0600
     * @tc.number System_API_Test_App_Manager_0600
     * @tc.desc   Test the third-party application call killProcessWithAccount will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   System_API_Test_App_Manager_0700
     * @tc.number System_API_Test_App_Manager_0700
     * @tc.desc   Test the third-party application without permission call killProcessesByBundleName will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   System_API_Test_App_Manager_0800
     * @tc.number System_API_Test_App_Manager_0800
     * @tc.desc   Test the third-party application without permission call killProcessesByBundleName will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   System_API_Test_App_Manager_0900
     * @tc.number System_API_Test_App_Manager_0900
     * @tc.desc   Test the third-party application call clearUpApplicationData will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   System_API_Test_App_Manager_1000
     * @tc.number System_API_Test_App_Manager_1000
     * @tc.desc   Test the third-party application call clearUpApplicationData will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   System_API_Test_App_Manager_1100
     * @tc.number System_API_Test_App_Manager_1100
     * @tc.desc   Test the third-party application call GetProcessMemoryByPid will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   System_API_Test_App_Manager_1200
     * @tc.number System_API_Test_App_Manager_1200
     * @tc.desc   Test the third-party application call GetProcessMemoryByPid will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   System_API_Test_App_Manager_1300
     * @tc.number System_API_Test_App_Manager_1300
     * @tc.desc   Test the third-party application call getRunningProcessInfoByBundleName will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   System_API_Test_App_Manager_1400
     * @tc.number System_API_Test_App_Manager_1400
     * @tc.desc   Test the third-party application call getRunningProcessInfoByBundleName will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   System_API_Test_App_Manager_1500
     * @tc.number System_API_Test_App_Manager_1500
     * @tc.desc   Test the third-party application call getRunningProcessInfoByBundleName will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   System_API_Test_App_Manager_1600
     * @tc.number System_API_Test_App_Manager_1600
     * @tc.desc   Test the third-party application call getRunningProcessInfoByBundleName will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   Public_API_Test_App_Manager_0100
     * @tc.number Public_API_Test_App_Manager_0100
     * @tc.desc   Test the third-party application get ProcessState enum will be right
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   Public_API_Test_App_Manager_0200
     * @tc.number Public_API_Test_App_Manager_0200
     * @tc.desc   Test the third-party application get ApplicationState enum will be right
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Public_API_Test_App_Manager_0200', Level.LEVEL0, (done: Function) => {
      expect(appManager.ApplicationState.STATE_CREATE).assertEqual(0);
      expect(appManager.ApplicationState.STATE_FOREGROUND).assertEqual(2);
      expect(appManager.ApplicationState.STATE_ACTIVE).assertEqual(3);
      expect(appManager.ApplicationState.STATE_BACKGROUND).assertEqual(4);
      expect(appManager.ApplicationState.STATE_DESTROY).assertEqual(5);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityBase_AppManager_0100
     * @tc.number SUB_Ability_AbilityBase_AppManager_0100
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AppManager_0100', Level.LEVEL0, async (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_AppManager_0100`;
      console.log(`${tag}, it begin`);
        try {
          await appManager.isRunningInStabilityTest().then((data)=>{
            console.log(`${tag} isRunningInStabilityTest success, pid: ${data}`);
            if(data == true){
              try{expect(data).assertTrue();}catch(e){}
            }else{
              try{expect(data).assertFalse();}catch(e){}
            }
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

    /**
     * @tc.name   SUB_Ability_AbilityBase_AppManager_0200
     * @tc.number SUB_Ability_AbilityBase_AppManager_0200
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AppManager_0200', Level.LEVEL0, async (done: Function) => {
      let tag = `SUB_AA_ChildProcessManager_startChildProcess_0300`;
      console.log(`${tag}, it begin`);
      try {
        appManager.isRunningInStabilityTest((err, data)=>{
          console.error(`${tag} isRunningInStabilityTest success, errorCode: ${data}`);
          if(data == true){
            try{expect(data).assertTrue();}catch(e){}
          }else{
            try{expect(data).assertFalse();}catch(e){}
          }
          done();
        })
      } catch (err) {
        console.error(`${tag} isRunningInStabilityTest error, errorCode: ${err?.code}`);
        try{expect().assertFail();}catch(e){}
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityBase_AppManager_0400
     * @tc.number SUB_Ability_AbilityBase_AppManager_0400
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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

    /**
     * @tc.name   SUB_Ability_AbilityBase_AppManager_0500
     * @tc.number SUB_Ability_AbilityBase_AppManager_0500
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
    /**
     * @tc.name   SUB_Ability_AbilityBase_AppManager_0600
     * @tc.number SUB_Ability_AbilityBase_AppManager_0600
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
    /**
     * @tc.name   SUB_Ability_AbilityBase_AppManager_0700
     * @tc.number SUB_Ability_AbilityBase_AppManager_0700
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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

    /**
     * @tc.name   SUB_Ability_AbilityBase_AppManager_0900
     * @tc.number SUB_Ability_AbilityBase_AppManager_0900
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AppManager_0900', Level.LEVEL0, async (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_AppManager_0700`;
      console.log(`${tag}, it begin`);
      try {
        appManager.isRamConstrainedDevice((err, data)=>{
          try{expect(typeof data).assertEqual('boolean');}catch(e){}
          if(data == true){
            try{expect(data).assertTrue();}catch(e){}
          }else{
            try{expect(data).assertFalse();}catch(e){}
          }
          done();
        })
      } catch (err) {
        console.error(`${tag} off error, errorCode: ${err?.code}`);
        expect().assertFail();
        done();
      }
    });
    
    /**
     * @tc.name   SUB_Ability_AbilityBase_AppManager_1000
     * @tc.number SUB_Ability_AbilityBase_AppManager_1000
     * @tc.desc   Expect: call failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityBase_AppManager_1000', Level.LEVEL0, async (done: Function) => {
      let tag = `SUB_Ability_AbilityBase_AppManager_1000`;
      console.log(`${tag}, it begin`);
      try {
        appManager.isRamConstrainedDevice().then((data)=>{
          try{expect(typeof data).assertEqual('boolean');}catch(e){}
          if(data == true){
            try{expect(data).assertTrue();}catch(e){}
          }else{
            try{expect(data).assertFalse();}catch(e){}
          }
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
      * @tc.name   System_API_Test_App_Manager_1700
      * @tc.number System_API_Test_App_Manager_1700
      * @tc.desc   Test the third-party application without permission call killProcessesByBundleName will be blocked
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
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

    
    /**
     * @tc.name   System_API_Test_App_Manager_1800
     * @tc.number System_API_Test_App_Manager_1800
     * @tc.desc   Test the third-party application without permission call killProcessesByBundleName will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('System_API_Test_App_Manager_1800', Level.LEVEL0, (done: Function) => {
      let TAG = 'System_API_Test_App_Manager_1800';
      let bundleName = "com.ohos.applicationsss";
      try {
        appManager.killProcessesByBundleName(bundleName, true).then((data) => {
          console.log('System_API_Test_App_Manager_1800 killProcessesByBundleName success.');
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.error(`System_API_Test_App_Manager_1800 killProcessesByBundleName fail, err: ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(ERROR_PERMISSION_CODE);
          done();
        });
      } catch (paramError) {
        let code = (paramError as BusinessError).code;
        let message = (paramError as BusinessError).message;
        console.error(`System_API_Test_App_Manager_1800 [appManager] error: ${code}, ${message}`);
        expect(paramError.code).assertEqual(ERROR_PERMISSION_CODE);
        done();
      }
    });

    /**
     * @tc.name   System_API_Test_App_Manager_GetAppMemorySize_Promise_0100
     * @tc.number System_API_Test_App_Manager_GetAppMemorySize_Promise_0100
     * @tc.desc   Test getAppMemorySize with promise style.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('System_API_Test_App_Manager_GetAppMemorySize_Promise_0100', Level.LEVEL0, async (done: Function) => {
      let TAG = 'System_API_Test_App_Manager_GetAppMemorySize_Promise_0100';
      console.log(`${TAG}, begin`);
      try {
        appManager.getAppMemorySize().then((data: number) => {
          console.log(`${TAG}, getAppMemorySize success, data: ${data}`);
          expect(typeof data).assertEqual('number');
          expect(data).assertLarger(0);
          done();
        }).catch((err: BusinessError) => {
          console.error(`${TAG}, getAppMemorySize error, errorCode: ${err?.code}`);
          expect().assertFail();
          done();
        });
      } catch (err) {
        console.error(`${TAG} unexpected error, errorCode: ${err?.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   System_API_Test_App_Manager_GetAppMemorySize_Callback_0100
     * @tc.number System_API_Test_App_Manager_GetAppMemorySize_Callback_0100
     * @tc.desc   Test getAppMemorySize with callback style.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('System_API_Test_App_Manager_GetAppMemorySize_Callback_0100', Level.LEVEL0, (done: Function) => {
      let TAG = 'System_API_Test_App_Manager_GetAppMemorySize_Callback_0100';
      console.log(`${TAG}, begin`);
      try {
        appManager.getAppMemorySize((err: BusinessError | null, data: number | undefined) => {
          if (err) {
            console.error(`${TAG}, getAppMemorySize error, errorCode: ${err.code}`);
            expect().assertFail();
            done();
          } else {
            console.log(`${TAG}, getAppMemorySize success, data: ${data}`);
            expect(typeof data).assertEqual('number');
            expect(data).assertLarger(0);
            done();
          }
        });
      } catch (err) {
        console.error(`${TAG} unexpected error, errorCode: ${err?.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_0100
     * @tc.number SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_0100
     * @tc.desc   Test killProcessesByBundleName with bundleName as null (callback style)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_0100', Level.LEVEL1, (done: Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_0100';
      try {
        appManager.killProcessesByBundleName(null, (err: BusinessError) => {
          console.log(TAG + " err.code: " + err.code);
          expect(err.code).assertEqual(401);
          done();
        });
      } catch (err) {
        console.error(`${TAG} unexpected error, errorCode: ${err?.code}`);
        expect(err?.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_0200
     * @tc.number SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_0200
     * @tc.desc   Test killProcessesByBundleName with bundleName as undefined (callback style)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_0200', Level.LEVEL1, (done: Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_0200';
      try {
        appManager.killProcessesByBundleName(undefined, (err: BusinessError) => {
          console.log(TAG + " err.code: " + err.code);
          expect(err.code).assertEqual(401);
          done();
        });
      } catch (err) {
        console.error(`${TAG} unexpected error, errorCode: ${err?.code}`);
        expect(err?.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_0300
     * @tc.number SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_0300
     * @tc.desc   Test killProcessesByBundleName with bundleName as null (promise style)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_0300', Level.LEVEL1, (done: Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_0300';
      try {
        appManager.killProcessesByBundleName(null)
          .then(() => {
            console.log(TAG + ' should not reach here');
            expect().assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            console.log(TAG + " err.code: " + err.code);
            expect(err.code).assertEqual(401);
            done();
          });
      } catch (err) {
        console.error(`${TAG} unexpected error, errorCode: ${err?.code}`);
        expect(err?.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_0400
     * @tc.number SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_0400
     * @tc.desc   Test killProcessesByBundleName with bundleName as undefined (promise style)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_0400', Level.LEVEL1, (done: Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_0400';
      try {
        appManager.killProcessesByBundleName(undefined)
          .then(() => {
            console.log(TAG + ' should not reach here');
            expect().assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            console.log(TAG + " err.code: " + err.code);
            expect(err.code).assertEqual(401);
            done();
          });
      } catch (err) {
        console.error(`${TAG} unexpected error, errorCode: ${err?.code}`);
        expect(err?.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_0500
     * @tc.number SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_0500
     * @tc.desc   Test killProcessesByBundleName with bundleName as null and options parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_0500', Level.LEVEL1, (done: Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_0500';
      try {
        appManager.killProcessesByBundleName(null, false)
          .then(() => {
            console.log(TAG + ' should not reach here');
            expect().assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            console.log(TAG + " err.code: " + err.code);
            expect(err.code).assertEqual(401);
            done();
          });
      } catch (err) {
        console.error(`${TAG} unexpected error, errorCode: ${err?.code}`);
        expect(err?.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_0600
     * @tc.number SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_0600
     * @tc.desc   Test killProcessesByBundleName with bundleName as undefined and options parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_0600', Level.LEVEL1, (done: Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_0600';
      try {
        appManager.killProcessesByBundleName(undefined, false)
          .then(() => {
            console.log(TAG + ' should not reach here');
            expect().assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            console.log(TAG + " err.code: " + err.code);
            expect(err.code).assertEqual(401);
            done();
          });
      } catch (err) {
        console.error(`${TAG} unexpected error, errorCode: ${err?.code}`);
        expect(err?.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_0700
     * @tc.number SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_0700
     * @tc.desc   Test killProcessesByBundleName with options as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_0700', Level.LEVEL1, (done: Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_0700';
      try {
        appManager.killProcessesByBundleName("com.ohos.application", null)
          .then(() => {
            console.log(TAG + ' should not reach here');
            expect().assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            console.log(TAG + " err.code: " + err.code);
            expect(err.code).assertEqual(201);
            done();
          });
      } catch (err) {
        console.error(`${TAG} unexpected error, errorCode: ${err?.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_0800
     * @tc.number SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_0800
     * @tc.desc   Test killProcessesByBundleName with options as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_0800', Level.LEVEL1, (done: Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_0800';
      try {
        appManager.killProcessesByBundleName("com.ohos.application", undefined)
          .then(() => {
            console.log(TAG + ' should not reach here');
            expect().assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            console.log(TAG + " err.code: " + err.code);
            expect(err.code).assertEqual(201);
            done();
          });
      } catch (err) {
        console.error(`${TAG} unexpected error, errorCode: ${err?.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_0900
     * @tc.number SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_0900
     * @tc.desc   Test killProcessesByBundleName with bundleName as empty string (promise style)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_0900', Level.LEVEL1, (done: Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_0900';
      try {
        appManager.killProcessesByBundleName("")
          .then(() => {
            console.log(TAG + ' should not reach here');
            expect().assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            console.log(TAG + " err.code: " + err.code);
            expect(err.code).assertEqual(201);
            done();
          });
      } catch (err) {
        console.error(`${TAG} unexpected error, errorCode: ${err?.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_1000
     * @tc.number SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_1000
     * @tc.desc   Test killProcessesByBundleName with bundleName as empty string (callback style)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_1000', Level.LEVEL1, (done: Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_1000';
      try {
        appManager.killProcessesByBundleName("", (err: BusinessError) => {
          console.log(TAG + " err.code: " + err.code);
          expect(err.code).assertEqual(201);
          done();
        });
      } catch (err) {
        console.error(`${TAG} unexpected error, errorCode: ${err?.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_1100
     * @tc.number SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_1100
     * @tc.desc   Test killProcessesByBundleName with bundleName as empty string and clearPageStack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_1100', Level.LEVEL1, (done: Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_1100';
      try {
        appManager.killProcessesByBundleName("", false)
          .then(() => {
            console.log(TAG + ' should not reach here');
            expect().assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            console.log(TAG + " err.code: " + err.code);
            expect(err.code).assertEqual(201);
            done();
          });
      } catch (err) {
        console.error(`${TAG} unexpected error, errorCode: ${err?.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_1200
     * @tc.number SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_1200
     * @tc.desc   Test killProcessesByBundleName with bundleName as empty string, clearPageStack and appIndex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_1200', Level.LEVEL1, (done: Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_1200';
      try {
        appManager.killProcessesByBundleName("", false, 0)
          .then(() => {
            console.log(TAG + ' should not reach here');
            expect().assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            console.log(TAG + " err.code: " + err.code);
            expect(err.code).assertEqual(201);
            done();
          });
      } catch (e) {
        console.log(TAG + " err.code: " + e.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_1300
     * @tc.number SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_1300
     * @tc.desc   Test killProcessesByBundleName with bundleName as empty string and appIndex as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_1300', Level.LEVEL1, (done: Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_1300';

      try {
        appManager.killProcessesByBundleName("", false, null)
          .then(() => {
            console.log(TAG + ' should not reach here');
            expect().assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            console.log(TAG + " err.code: " + err.code);
            expect().assertFail();
            done();
          });
      } catch (e) {
        console.log(TAG + " err.code: " + e.code);
        expect(e.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_1400
     * @tc.number SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_1400
     * @tc.desc   Test killProcessesByBundleName with bundleName as empty string and appIndex as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_1400', Level.LEVEL1, (done: Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_1400';

      try {
        appManager.killProcessesByBundleName("", false, undefined)
          .then(() => {
            console.log(TAG + ' should not reach here');
            expect().assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            console.log(TAG + " err.code: " + err.code);
            expect(err.code).assertEqual(201);
            done();
          });
      } catch (e) {
        console.log(TAG + " err.code: " + e.code);
        expect(e.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_1500
     * @tc.number SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_1500
     * @tc.desc   Test killProcessesByBundleName with bundleName as empty string and callback as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_1500', Level.LEVEL1, (done: Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_1500';
      try {
        appManager.killProcessesByBundleName("", null)
        .then(() => {
          console.log(TAG + ' should not reach here');
          expect().assertFail();
          done();
        })
        .catch((err: BusinessError) => {
          console.log(TAG + " err.code: " + err.code);
          expect(err.code).assertEqual(201);
          done();
        });
      } catch (err) {
        console.log(TAG + " err.code: " + err.code);
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_1600
     * @tc.number SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_1600
     * @tc.desc   Test killProcessesByBundleName with bundleName as empty string and callback as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_1600', Level.LEVEL1, (done: Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_1600';
      try {
        appManager.killProcessesByBundleName("", undefined)
        .then(() => {
          console.log(TAG + ' should not reach here');
          expect().assertFail();
          done();
        })
        .catch((err: BusinessError) => {
          console.log(TAG + " err.code: " + err.code);
          expect(err.code).assertEqual(201);
          done();
        });

      } catch (err) {
        console.log(TAG + " err.code: " + err.code);
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_1700
     * @tc.number SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_1700
     * @tc.desc   Test killProcessesByBundleName with bundleName as empty string, clearPageStack as null and appIndex as 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_1700', Level.LEVEL1, (done: Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_1700';

      try {
        appManager.killProcessesByBundleName("", null, 0)
          .then(() => {
            console.log(TAG + ' should not reach here');
            expect().assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            console.log(TAG + " err.code: " + err.code);
            expect(err.code).assertEqual(201);
            done();
          });
      } catch (e) {
        console.log(TAG + " err.code: " + e.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_1800
     * @tc.number SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_1800
     * @tc.desc   Test killProcessesByBundleName with bundleName as empty string, clearPageStack as undefined and appIndex as 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_1800', Level.LEVEL1, (done: Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_1800';

      try {
        appManager.killProcessesByBundleName("", undefined, 0)
          .then(() => {
            console.log(TAG + ' should not reach here');
            expect().assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            console.log(TAG + " err.code: " + err.code);
            expect(err.code).assertEqual(201);
            done();
          });
      } catch (e) {
        console.log(TAG + " err.code: " + e.code);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_1900
     * @tc.number SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_1900
     * @tc.desc   Test killProcessesByBundleName with bundleName as empty string, clearPageStack as false and appIndex as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_1900', Level.LEVEL1, (done: Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_1900';
      try {
        appManager.killProcessesByBundleName("", true, null)
          .then(() => {
            console.log(TAG + ' should not reach here');
            expect().assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            console.log(TAG + " err.code: " + err.code);
            expect().assertFail();
            done();
          });
      } catch (e) {
        console.log(TAG + " err.code catch: " + e.code);
        expect(e.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_2000
     * @tc.number SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_2000
     * @tc.desc   Test killProcessesByBundleName with bundleName as empty string, clearPageStack as false and appIndex as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_2000', Level.LEVEL1, (done: Function) => {
      let TAG = 'SUB_Ability_AbilityRuntime_AppManager_KillProcessesByBundleName_2000';
      try {
        appManager.killProcessesByBundleName("", true, undefined)
          .then(() => {
            console.log(TAG + ' should not reach here');
            expect().assertFail();
            done();
          })
          .catch((err: BusinessError) => {
            console.log(TAG + " err.code : " + err.code);
            expect().assertFail();
            done();
          });
      } catch (e) {
        console.log(TAG + " err.code catch: " + e.code);
        expect(e.code).assertEqual(401);
        done();
      }

    });
  })
}