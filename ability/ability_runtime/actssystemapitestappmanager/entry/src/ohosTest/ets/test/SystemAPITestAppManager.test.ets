/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { appManager, common } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';

let context = getContext(this) as common.UIAbilityContext;

export default function systemAPITestAppManagerTest() {
  describe('systemAPITestAppManagerTest', () => {

    beforeAll(() => {
      context = globalThis.context
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StateInfo_SystemAPITestAppManager_0500
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StateInfo_SystemAPITestAppManager_0500
     * @tc.desc   appManager.getProcessMemoryByPid callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StateInfo_SystemAPITestAppManager_0500', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_ABILITY_StateInfo_SystemAPITestAppManager_0500`;
      console.log(`${tag}, it begin`);
      let pid:number = 0;
      let getProcessMemoryByPidCallback = (err: BusinessError, data: number)=>{
        if (err) {
          console.error(`getProcessMemoryByPidCallback fail, err: ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(202)
          done();
        } else {
          console.log(`${tag} appManager.getProcessMemoryByPid success, data is: ${data}`);
        }
      }
      try {
        appManager.getProcessMemoryByPid(pid, getProcessMemoryByPidCallback);
      } catch (err) {
        console.error(`${tag} appManager.getProcessMemoryByPid error: ${err.code}, ${err.message} `);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StateInfo_SystemAPITestAppManager_0600
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StateInfo_SystemAPITestAppManager_0600
     * @tc.desc   appManager.getProcessMemoryByPid promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StateInfo_SystemAPITestAppManager_0600', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_ABILITY_StateInfo_SystemAPITestAppManager_0600`;
      console.log(`${tag}, it begin`);
      let pid:number = 0;
      try {
        appManager.getProcessMemoryByPid(pid).then((data) => {
          console.log(`${tag} appManager.getProcessMemoryByPid success,data is: ${data}`);
        }).catch((err: BusinessError) => {
          console.error(`getProcessMemoryByPid fail, err: ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(202)
          done();
        });
      } catch (err) {
        console.error(`${tag} appManager.getProcessMemoryByPid error: ${err.code}, ${err.message} `);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StateInfo_SystemAPITestAppManager_0700
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StateInfo_SystemAPITestAppManager_0700
     * @tc.desc   appManager.getRunningProcessInfoByBundleName callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StateInfo_SystemAPITestAppManager_0700', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_ABILITY_StateInfo_SystemAPITestAppManager_0700`;
      console.log(`${tag}, it begin`);
      let bundleName = 'com.test.actssystemapitestappmanager'
      let getRunningProcessInfoByBundleNameCallback = (err: BusinessError, data: Array<appManager.ProcessInformation>) =>{
        if (err) {
          console.error(`getRunningProcessInfoByBundleNameCallback fail, err: ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(202)
          done();
        } else {
          console.log('getRunningProcessInfoByBundleNameCallback success.');
        }
      }
      try {
        appManager.getRunningProcessInfoByBundleName(bundleName, getRunningProcessInfoByBundleNameCallback);
        console.log(`${tag} appManager.getRunningProcessInfoByBundleName success`);
      } catch (err) {
        console.error(`${tag} appManager.getRunningProcessInfoByBundleName error: ${err.code}, ${err.message} `);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StateInfo_SystemAPITestAppManager_0800
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StateInfo_SystemAPITestAppManager_0800
     * @tc.desc   appManager.getRunningProcessInfoByBundleName promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StateInfo_SystemAPITestAppManager_0800', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_ABILITY_StateInfo_SystemAPITestAppManager_0800`;
      console.log(`${tag}, it begin`);
      let bundleName = 'com.test.actssystemapitestappmanager'
      try {
        appManager.getRunningProcessInfoByBundleName(bundleName).then((data) => {
          console.log(`${tag} appManager.getRunningProcessInfoByBundleName success`);
        }).catch((err: BusinessError) => {
          console.error(`${tag} getRunningProcessInfoByBundleName fail, err: ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(202)
          done();
        });
      } catch (err) {
        console.error(`${tag} appManager.getRunningProcessInfoByBundleName error: ${err.code}, ${err.message} `);
        expect().assertFail();
        done();
      }
    });


    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StateInfo_SystemAPITestAppManager_0900
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StateInfo_SystemAPITestAppManager_0900
     * @tc.desc   appManager.getRunningProcessInfoByBundleName callback with userId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StateInfo_SystemAPITestAppManager_0900', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_ABILITY_StateInfo_SystemAPITestAppManager_0900`;
      console.log(`${tag}, it begin`);
      let bundleName = 'com.test.actssystemapitestappmanager'
      let userId = 0;
      let getRunningProcessInfoByBundleNameCallback = (err: BusinessError, data: Array<appManager.ProcessInformation>) =>{
        if (err) {
          console.error(`getRunningProcessInfoByBundleNameCallback fail, err: ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(202)
          done();
        } else {
          console.log('getRunningProcessInfoByBundleNameCallback success.');
        }
      }
      try {
        appManager.getRunningProcessInfoByBundleName(bundleName, userId, getRunningProcessInfoByBundleNameCallback);
        console.log(`${tag} appManager.getRunningProcessInfoByBundleName success`);
      } catch (err) {
        console.error(`${tag} appManager.getRunningProcessInfoByBundleName error: ${err.code}, ${err.message} `);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ABILITY_StateInfo_SystemAPITestAppManager_1000
     * @tc.number SUB_Ability_AbilityRuntime_ABILITY_StateInfo_SystemAPITestAppManager_1000
     * @tc.desc   appManager.getRunningProcessInfoByBundleName promise with userId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StateInfo_SystemAPITestAppManager_1000', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_ABILITY_StateInfo_SystemAPITestAppManager_1000`;
      console.log(`${tag}, it begin`);
      let bundleName = 'com.test.actssystemapitestappmanager'
      let userId = 0;
      try {
        appManager.getRunningProcessInfoByBundleName(bundleName,userId).then((data) => {
          console.log(`${tag} appManager.getRunningProcessInfoByBundleName success`);
        }).catch((err: BusinessError) => {
          console.error(`${tag} getRunningProcessInfoByBundleName fail, err: ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(202)
          done();
        });
      } catch (err) {
        console.error(`${tag} appManager.getRunningProcessInfoByBundleName error: ${err.code}, ${err.message} `);
        expect().assertFail();
        done();
      }
    });

  })
}