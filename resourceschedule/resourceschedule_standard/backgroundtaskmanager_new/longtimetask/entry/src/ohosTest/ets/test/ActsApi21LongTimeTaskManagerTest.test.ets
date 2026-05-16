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

import { BusinessError } from '@kit.BasicServicesKit'
import { WantAgent, wantAgent, UIAbility } from '@kit.AbilityKit'
import ohosWantAgent from '@ohos.wantAgent'
import { backgroundTaskManager } from '@kit.BackgroundTasksKit'
import { abilityDelegatorRegistry } from '@kit.TestKit'
import hilog from '@ohos.hilog';
import { describe, it, TestType, Size, Level, beforeAll, afterAll, beforeEach, afterEach, expect } from '@ohos/hypium'

const TAG = "testTag";
const DOMAIN: number = 0x0000;

export default function ActsApi21LongTimeTaskManagerTest() {
  describe('ActsApi21LongTimeTaskManagerTest', () => {

    let wantAgentInfo: wantAgent.WantAgentInfo;
    let notificationId: number = 0;
    let continuousTaskId: number | undefined = -1;

    beforeAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'beforeAll called');
      wantAgentInfo = {
        wants: [
          {
            bundleName: "com.acts.actslongtimetasktest",
            abilityName: "com.acts.actslongtimetasktest.TestAbility"
          }
        ],
        operationType: ohosWantAgent.OperationType.START_ABILITY,
        requestCode: 0,
        wantAgentFlags: [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG]
      };
    })
    afterAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'afterAll called');
    })

    beforeEach(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'beforeEach called');
    })

    afterEach(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'afterEach called');
    })


    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_001
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_001
     * @tc.desc   Test that the backgroundTaskManager enum BackgroundTaskMode of MODE_DATA_TRANSFER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_001 begin---');

        try {
          let type: number = backgroundTaskManager.BackgroundTaskMode.MODE_DATA_TRANSFER;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_001 backgroundTaskManager BackgroundTaskMode: ' +
            type);
          expect(type).assertEqual(1);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_001 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_002
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_002
     * @tc.desc   Test that the backgroundTaskManager enum BackgroundTaskMode of MODE_AUDIO_PLAYBACK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_002 begin---');

        try {
          let type: number = backgroundTaskManager.BackgroundTaskMode.MODE_AUDIO_PLAYBACK;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_002 backgroundTaskManager BackgroundTaskMode: ' +
            type);
          expect(type).assertEqual(2);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_002 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_003
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_003
     * @tc.desc   Test that the backgroundTaskManager enum BackgroundTaskMode of MODE_AUDIO_RECORDING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_003 begin---');

        try {
          let type: number = backgroundTaskManager.BackgroundTaskMode.MODE_AUDIO_RECORDING;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_003 backgroundTaskManager BackgroundTaskMode: ' +
            type);
          expect(type).assertEqual(3);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_003 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_004
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_004
     * @tc.desc   Test that the backgroundTaskManager enum BackgroundTaskMode of MODE_LOCATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_004 begin---');

        try {
          let type: number = backgroundTaskManager.BackgroundTaskMode.MODE_LOCATION;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_004 backgroundTaskManager BackgroundTaskMode: ' +
            type);
          expect(type).assertEqual(4);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_004 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_005
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_005
     * @tc.desc   Test that the backgroundTaskManager enum BackgroundTaskMode of MODE_BLUETOOTH_INTERACTION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_005 begin---');

        try {
          let type: number = backgroundTaskManager.BackgroundTaskMode.MODE_BLUETOOTH_INTERACTION;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_005 backgroundTaskManager BackgroundTaskMode: ' +
            type);
          expect(type).assertEqual(5);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_005 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_006
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_006
     * @tc.desc   Test that the backgroundTaskManager enum BackgroundTaskMode of MODE_MULTI_DEVICE_CONNECTION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_006 begin---');

        try {
          let type: number = backgroundTaskManager.BackgroundTaskMode.MODE_MULTI_DEVICE_CONNECTION;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_006 backgroundTaskManager BackgroundTaskMode: ' +
            type);
          expect(type).assertEqual(6);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_006 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_007
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_007
     * @tc.desc   Test that the backgroundTaskManager enum BackgroundTaskMode of MODE_VOIP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_007 begin---');

        try {
          let type: number = backgroundTaskManager.BackgroundTaskMode.MODE_VOIP;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_007 backgroundTaskManager BackgroundTaskMode: ' +
            type);
          expect(type).assertEqual(8);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_007 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_008
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_008
     * @tc.desc   Test that the backgroundTaskManager enum BackgroundTaskMode of MODE_TASK_KEEPING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_008 begin---');

        try {
          let type: number = backgroundTaskManager.BackgroundTaskMode.MODE_TASK_KEEPING;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_008 backgroundTaskManager BackgroundTaskMode: ' +
            type);
          expect(type).assertEqual(9);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_008 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_009
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_009
     * @tc.desc   Test that the backgroundTaskManager enum BackgroundTaskSubmode of SUBMODE_CAR_KEY_NORMAL_NOTIFICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_009 begin---');

        try {
          let type: number = backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_CAR_KEY_NORMAL_NOTIFICATION;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_009 backgroundTaskManager BackgroundTaskMode: ' +
            type);
          expect(type).assertEqual(1);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_009 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_010
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_010
     * @tc.desc   Test that the backgroundTaskManager enum BackgroundTaskSubmode of SUBMODE_NORMAL_NOTIFICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_010 begin---');

        try {
          let type: number = backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_NORMAL_NOTIFICATION;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_010 backgroundTaskManager BackgroundTaskMode: ' +
            type);
          expect(type).assertEqual(2);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_010 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_011
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_011
     * @tc.desc   Test that the backgroundTaskManager enum BackgroundTaskSubmode of SUBMODE_LIVE_VIEW_NOTIFICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_011 begin---');

        try {
          let type: number = backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_LIVE_VIEW_NOTIFICATION;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_011 backgroundTaskManager BackgroundTaskMode: ' +
            type);
          expect(type).assertEqual(3);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_011 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_012
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_012
     * @tc.desc   Test that the startBackgroundRunning function and stopBackgroundRunning and updateBackgroundRunning function normal call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_012 begin---');

        try {
          let want = await wantAgent.getWantAgent(wantAgentInfo);
          let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          let ability = await delegator.getCurrentTopAbility();

          let modeList: Array<number> = [backgroundTaskManager.BackgroundTaskMode.MODE_LOCATION];
          let subModeList: Array<number> = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_NORMAL_NOTIFICATION];
          let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
          continuousTaskRequest.backgroundTaskModes = modeList;
          continuousTaskRequest.backgroundTaskSubmodes = subModeList;
          continuousTaskRequest.wantAgent = want;
          continuousTaskRequest.combinedTaskNotification = false;
          continuousTaskRequest.continuousTaskId = -1;
          let res = await backgroundTaskManager.startBackgroundRunning(ability.context, continuousTaskRequest);

          hilog.info(DOMAIN, TAG,
            'SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_012 startBackgroundRunning promise run success.');
          hilog.info(DOMAIN, TAG,
            'SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_012 startBackgroundRunning promise res: %{public}s',
            JSON.stringify(res));
          let continuousTaskId = res.continuousTaskId
          let slotType = res.slotType
          let contentType = res.contentType
          let notificationId = res.notificationId
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_012 updateBackgroundRunning ContinuousTaskNotification continuousTaskId ' +
            continuousTaskId);
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_012 updateBackgroundRunning ContinuousTaskNotification slotType ' +
            slotType);
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_012 updateBackgroundRunning ContinuousTaskNotification contentType ' +
            contentType);
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_012 updateBackgroundRunning ContinuousTaskNotification notificationId ' +
            notificationId);
          expect(continuousTaskId).assertLarger(-1);
          expect(slotType).assertLarger(-1);
          expect(contentType).assertLarger(-1);
          expect(notificationId).assertLarger(-1);
          continuousTaskRequest.continuousTaskId = res.continuousTaskId
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_012 startBackgroundRunning ContinuousTaskNotification continuousTaskId ' +
          continuousTaskRequest.continuousTaskId);

          let updateRes = await backgroundTaskManager.updateBackgroundRunning(ability.context, continuousTaskRequest);

          hilog.info(DOMAIN, TAG,
            'SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_012 updateBackgroundRunning promise res: %{public}s',
            JSON.stringify(res));
          console.info("SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_012 Operation updateBackgroundRunning succeeded");

          let updateContinuousTaskId = updateRes.continuousTaskId
          let updateSlotType = updateRes.slotType
          let updateContentType = updateRes.contentType
          let updateNotificationId = updateRes.notificationId
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_012 updateBackgroundRunning ContinuousTaskNotification continuousTaskId ' +
            updateContinuousTaskId);
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_012 updateBackgroundRunning ContinuousTaskNotification slotType ' +
            updateSlotType);
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_012 updateBackgroundRunning ContinuousTaskNotification contentType ' +
            updateContentType);
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_012 updateBackgroundRunning ContinuousTaskNotification notificationId ' +
            updateNotificationId);
          expect(updateContinuousTaskId).assertLarger(-1);
          expect(updateSlotType).assertLarger(-1);
          expect(updateContentType).assertLarger(-1);
          expect(updateNotificationId).assertLarger(-1);

          backgroundTaskManager.stopBackgroundRunning(ability.context, res.continuousTaskId).then(() => {
            console.info("SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_012 Operation stopBackgroundRunning succeeded");
            expect(true).assertTrue();
            done();
          }).catch((error: BusinessError) => {
            console.error(`SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_012 Operation stopBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
            expect(false).assertTrue();
            done();
          });
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_012 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_012 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_013
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_013
     * @tc.desc   Test that the backgroundTaskManager isModeSupported function res is true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_013 begin---');

        let isModeSupported: boolean = false;
        let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
        let modeList: Array<number> = [backgroundTaskManager.BackgroundTaskMode.MODE_LOCATION];
        continuousTaskRequest.backgroundTaskModes = modeList;
        try {
          isModeSupported = continuousTaskRequest.isModeSupported();
          console.info(`SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_013 Operation isModeSupported succeeded. isModeSupported is ${isModeSupported}`);
          expect(isModeSupported == true).assertTrue();
          done();
        } catch (error) {
          console.error(`SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_013 Operation startBackgroundRunning failed. code is ${(error as BusinessError).code} message is ${(error as BusinessError).message}`);
          expect(false).assertTrue();
          done();
        }

      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_014
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_014
     * @tc.desc   Test that the startBackgroundRunning input BackgroundTaskMode is MODE_SPECIAL_SCENARIO_PROCESSING and BackgroundTaskSubmode is SUBMODE_MEDIA_PROCESS_NORMAL_NOTIFICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_014 begin---');

        try {
          let want = await wantAgent.getWantAgent(wantAgentInfo);
          let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          let ability = await delegator.getCurrentTopAbility();

          let modeList: Array<number> = [backgroundTaskManager.BackgroundTaskMode.MODE_SPECIAL_SCENARIO_PROCESSING];
          let subModeList: Array<number> = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_MEDIA_PROCESS_NORMAL_NOTIFICATION];
          let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
          continuousTaskRequest.backgroundTaskModes = modeList;
          continuousTaskRequest.backgroundTaskSubmodes = subModeList;
          continuousTaskRequest.wantAgent = want;
          continuousTaskRequest.combinedTaskNotification = false;
          continuousTaskRequest.continuousTaskId = -1;
          backgroundTaskManager.startBackgroundRunning(ability.context, continuousTaskRequest).then((res: backgroundTaskManager.ContinuousTaskNotification) => {
            console.info(`SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_014 Operation startBackgroundRunning succeeded. notificationId is ${res.notificationId} continuousTaskId is ${res.continuousTaskId}`);
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_014 startBackgroundRunning promise run success.');
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_014 startBackgroundRunning promise res: %{public}s', JSON.stringify(res));
            let continuousTaskId = res.continuousTaskId
            let slotType = res.slotType
            let contentType = res.contentType
            let notificationId = res.notificationId
            console.info('SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_014 startBackgroundRunning ContinuousTaskNotification continuousTaskId ' +
              continuousTaskId);
            console.info('SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_014 startBackgroundRunning ContinuousTaskNotification slotType ' +
              slotType);
            console.info('SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_014 startBackgroundRunning ContinuousTaskNotification contentType ' +
              contentType);
            console.info('SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_014 startBackgroundRunning ContinuousTaskNotification notificationId ' +
              notificationId);
            expect(continuousTaskId).assertLarger(-1);
            expect(slotType).assertLarger(-1);
            expect(contentType).assertLarger(-1);
            expect(notificationId).assertLarger(-1);
            done();
          }).catch((error: BusinessError) => {
            console.error(`SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_014 Operation startBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
            if (error.code == 9800005) {
              expect(error.code == 9800005).assertTrue();
              done();
            }else{
              expect(false).assertTrue();
              done();
            }
          });
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_014 aa error: %{public}s', JSON.stringify(error));
          if (error.code == 9800005) {
            expect(error.code == 9800005).assertTrue();
            done();
          }else{
            expect(false).assertTrue();
            done();
          }}        

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_014 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_015
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_015
     * @tc.desc   Test that the startBackgroundRunning input BackgroundTaskMode is MODE_SPECIAL_SCENARIO_PROCESSING and BackgroundTaskSubmode is SUBMODE_VIDEO_BROADCAST_NORMAL_NOTIFICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
    async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_015 begin---');

      try {
        let want = await wantAgent.getWantAgent(wantAgentInfo);
        let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
        let ability = await delegator.getCurrentTopAbility();

        let modeList: Array<number> = [backgroundTaskManager.BackgroundTaskMode.MODE_SPECIAL_SCENARIO_PROCESSING];
        let subModeList: Array<number> = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_VIDEO_BROADCAST_NORMAL_NOTIFICATION];
        let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
        continuousTaskRequest.backgroundTaskModes = modeList;
        continuousTaskRequest.backgroundTaskSubmodes = subModeList;
        continuousTaskRequest.wantAgent = want;
        continuousTaskRequest.combinedTaskNotification = false;
        continuousTaskRequest.continuousTaskId = -1;
        backgroundTaskManager.startBackgroundRunning(ability.context, continuousTaskRequest).then((res: backgroundTaskManager.ContinuousTaskNotification) => {
          console.info(`SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_015 Operation startBackgroundRunning succeeded. notificationId is ${res.notificationId} continuousTaskId is ${res.continuousTaskId}`);
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_015 startBackgroundRunning promise run success.');
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_015 startBackgroundRunning promise res: %{public}s', JSON.stringify(res));
          let continuousTaskId = res.continuousTaskId
          let slotType = res.slotType
          let contentType = res.contentType
          let notificationId = res.notificationId
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_015 startBackgroundRunning ContinuousTaskNotification continuousTaskId ' +
            continuousTaskId);
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_015 startBackgroundRunning ContinuousTaskNotification slotType ' +
            slotType);
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_015 startBackgroundRunning ContinuousTaskNotification contentType ' +
            contentType);
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_015 startBackgroundRunning ContinuousTaskNotification notificationId ' +
            notificationId);
          expect(continuousTaskId).assertLarger(-1);
          expect(slotType).assertLarger(-1);
          expect(contentType).assertLarger(-1);
          expect(notificationId).assertLarger(-1);
          done();
        }).catch((error: BusinessError) => {
          console.error(`SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_015 Operation startBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
          if (error.code == 9800005) {
            expect(error.code == 9800005).assertTrue();
            done();
          }else{
            expect(false).assertTrue();
            done();
          }
        });
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_015 aa error: %{public}s', JSON.stringify(error));
        if (error.code == 9800005) {
          expect(error.code == 9800005).assertTrue();
          done();
        }else{
          expect(false).assertTrue();
          done();
        }}        

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_015 end---');
    })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_016
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_016
     * @tc.desc   Test that the startBackgroundRunning input BackgroundTaskMode is MODE_SPECIAL_SCENARIO_PROCESSING and BackgroundTaskSubmode is SUBMODE_WORK_OUT_NORMAL_NOTIFICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
    async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_016 begin---');

      try {
        let want = await wantAgent.getWantAgent(wantAgentInfo);
        let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
        let ability = await delegator.getCurrentTopAbility();

        let modeList: Array<number> = [backgroundTaskManager.BackgroundTaskMode.MODE_SPECIAL_SCENARIO_PROCESSING];
        let subModeList: Array<number> = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_WORK_OUT_NORMAL_NOTIFICATION];
        let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
        continuousTaskRequest.backgroundTaskModes = modeList;
        continuousTaskRequest.backgroundTaskSubmodes = subModeList;
        continuousTaskRequest.wantAgent = want;
        continuousTaskRequest.combinedTaskNotification = false;
        continuousTaskRequest.continuousTaskId = -1;
        backgroundTaskManager.startBackgroundRunning(ability.context, continuousTaskRequest).then((res: backgroundTaskManager.ContinuousTaskNotification) => {
          console.info(`SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_016 Operation startBackgroundRunning succeeded. notificationId is ${res.notificationId} continuousTaskId is ${res.continuousTaskId}`);
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_016 startBackgroundRunning promise run success.');
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_016 startBackgroundRunning promise res: %{public}s', JSON.stringify(res));
          let continuousTaskId = res.continuousTaskId
          let slotType = res.slotType
          let contentType = res.contentType
          let notificationId = res.notificationId
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_016 startBackgroundRunning ContinuousTaskNotification continuousTaskId ' +
            continuousTaskId);
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_016 startBackgroundRunning ContinuousTaskNotification slotType ' +
            slotType);
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_016 startBackgroundRunning ContinuousTaskNotification contentType ' +
            contentType);
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_016 startBackgroundRunning ContinuousTaskNotification notificationId ' +
            notificationId);
          expect(continuousTaskId).assertLarger(-1);
          expect(slotType).assertLarger(-1);
          expect(contentType).assertLarger(-1);
          expect(notificationId).assertLarger(-1);
          done();
        }).catch((error: BusinessError) => {
          console.error(`SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_016 Operation startBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
          if (error.code == 9800005) {
            expect(error.code == 9800005).assertTrue();
            done();
          }else{
            expect(false).assertTrue();
            done();
          }
        });
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_016 aa error: %{public}s', JSON.stringify(error));
        if (error.code == 9800005) {
          expect(error.code == 9800005).assertTrue();
          done();
        }else{
          expect(false).assertTrue();
          done();
        }}        

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API21_TASK_XTS_016 end---');
    })

  })
}