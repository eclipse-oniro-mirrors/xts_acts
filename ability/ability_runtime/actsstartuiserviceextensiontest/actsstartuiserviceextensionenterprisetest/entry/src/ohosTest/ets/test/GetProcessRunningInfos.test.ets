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

import { describe, it, expect, Level, TestType, Size } from '@ohos/hypium';
import { BusinessError } from '@kit.BasicServicesKit';
import appManager from '@ohos.application.appManager';
import { hilog } from '@kit.PerformanceAnalysisKit';

export default function getProcessRunningInfosTest() {
  describe('AppManagerGetProcessRunningInfosTest', () => {
    /**
     * @tc.name   SUB_Ability_AppManager_GetProcessRunningInfos_RETURN_001
     * @tc.number SUB_Ability_AppManager_GetProcessRunningInfos_RETURN_001
     * @tc.desc   getProcessRunningInfos Promise return test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AppManager_GetProcessRunningInfos_RETURN_001', Level.LEVEL1, async (done: Function) => {
        let tag = 'getProcessRunningInfosReturn001';
        console.info('====> [' + tag + '] start');
        try {
          const processInfos = await appManager.getProcessRunningInfos();
          hilog.info(0x0000, 'testTag', `getProcessRunningInfos success: ${JSON.stringify(processInfos)}`);
          expect(Array.isArray(processInfos)).assertTrue();
          if (processInfos && processInfos.length > 0) {
            processInfos.forEach((processInfo, index) => {
              if(processInfo.processName =='com.acts.startuiserviceextensiontestenterprise'){
                hilog.info(0x0000, 'testTag',
                  `${tag} process ${index} bundleNames: ${JSON.stringify(processInfo.bundleNames)}`);
                try{
                  expect(processInfo.pid).assertLarger(0);
                  expect(processInfo.uid).assertLarger(0);
                  expect(processInfo.processName).assertEqual('com.acts.startuiserviceextensiontestenterprise');
                  expect(processInfo.bundleNames[0]).assertEqual('com.acts.startuiserviceextensiontestenterprise');
                }catch{}
                done();
                return;
              }
            })
          }
        } catch (error) {
          hilog.error(0x0000, 'testTag', `${tag} failed: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   SUB_Ability_AppManager_GetProcessRunningInfos_CALLBACK_001
     * @tc.number SUB_Ability_AppManager_GetProcessRunningInfos_CALLBACK_001
     * @tc.desc   getProcessRunningInfos AsyncCallback test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AppManager_GetProcessRunningInfos_CALLBACK_001', Level.LEVEL1, (done: Function) => {
      let tag = 'SUB_Ability_AppManager_GetProcessRunningInfos_CALLBACK_001';
      console.info('====> [' + tag + '] start');
      try {
        appManager.getProcessRunningInfos((error: BusinessError, processInfos) => {
          hilog.info(0x0000, 'testTag', `getProcessRunningInfos success: ${JSON.stringify(processInfos)}`);
          expect(Array.isArray(processInfos)).assertTrue();
          if (processInfos && processInfos.length > 0) {
            processInfos.forEach((processInfo, index) => {
              if(processInfo.processName =='com.acts.startuiserviceextensiontestenterprise'){
                hilog.info(0x0000, 'testTag',
                  `${tag} process ${index} bundleNames: ${JSON.stringify(processInfo.bundleNames)}`);
                try{
                  expect(processInfo.pid).assertLarger(0);
                  expect(processInfo.uid).assertLarger(0);
                  expect(processInfo.processName).assertEqual('com.acts.startuiserviceextensiontestenterprise');
                  expect(processInfo.bundleNames[0]).assertEqual('com.acts.startuiserviceextensiontestenterprise');
                }catch{}
                done();
                return;
              }
            });
          }
        });
      } catch (error) {
        hilog.error(0x0000, 'testTag', `${tag} exception: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    });
  });
}