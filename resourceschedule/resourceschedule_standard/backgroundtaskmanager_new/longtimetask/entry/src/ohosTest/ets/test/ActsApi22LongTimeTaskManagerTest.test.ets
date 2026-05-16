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

export default function ActsApi22LongTimeTaskManagerTest() {
  describe('ActsApi22LongTimeTaskManagerTest', () => {

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
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_001
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_001
     * @tc.desc   Test that the backgroundTaskManager enum BackgroundTaskMode of MODE_AV_PLAYBACK_AND_RECORD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_001 begin---');

        try {
          let type: number = backgroundTaskManager.BackgroundTaskMode.MODE_AV_PLAYBACK_AND_RECORD;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_001 backgroundTaskManager BackgroundTaskMode: ' +
            type);
          expect(type).assertEqual(12);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_001 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_002
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_002
     * @tc.desc   Test that the backgroundTaskManager enum BackgroundTaskMode of MODE_SPECIAL_SCENARIO_PROCESSING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---MODE_SPECIAL_SCENARIO_PROCESSING begin---');

        try {
          let type: number = backgroundTaskManager.BackgroundTaskMode.MODE_SPECIAL_SCENARIO_PROCESSING;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_002 backgroundTaskManager BackgroundTaskMode: ' +
            type);
          expect(type).assertEqual(13);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_002 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_003
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_003
     * @tc.desc   Test that the backgroundTaskManager enum BackgroundTaskSubmode of SUBMODE_AUDIO_PLAYBACK_NORMAL_NOTIFICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_003 begin---');

        try {
          let type: number = backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_AUDIO_PLAYBACK_NORMAL_NOTIFICATION;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_003 backgroundTaskManager BackgroundTaskSubmode: ' +
            type);
          expect(type).assertEqual(4);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_003 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_004
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_004
     * @tc.desc   Test that the backgroundTaskManager enum BackgroundTaskSubmode of SUBMODE_AVSESSION_AUDIO_PLAYBACK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_004 begin---');

        try {
          let type: number = backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_AVSESSION_AUDIO_PLAYBACK;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_004 backgroundTaskManager BackgroundTaskSubmode: ' +
            type);
          expect(type).assertEqual(5);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_004 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_005
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_005
     * @tc.desc   Test that the backgroundTaskManager enum BackgroundTaskSubmode of SUBMODE_AUDIO_RECORD_NORMAL_NOTIFICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_005 begin---');

        try {
          let type: number = backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_AUDIO_RECORD_NORMAL_NOTIFICATION;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_005 backgroundTaskManager BackgroundTaskSubmode: ' +
            type);
          expect(type).assertEqual(6);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_005 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_006
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_006
     * @tc.desc   Test that the backgroundTaskManager enum BackgroundTaskSubmode of SUBMODE_SCREEN_RECORD_NORMAL_NOTIFICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_006 begin---');

        try {
          let type: number = backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_SCREEN_RECORD_NORMAL_NOTIFICATION;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_006 backgroundTaskManager BackgroundTaskSubmode: ' +
            type);
          expect(type).assertEqual(7);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_006 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_007
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_007
     * @tc.desc   Test that the backgroundTaskManager enum BackgroundTaskSubmode of SUBMODE_VOICE_CHAT_NORMAL_NOTIFICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_007 begin---');

        try {
          let type: number = backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_VOICE_CHAT_NORMAL_NOTIFICATION;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_007 backgroundTaskManager BackgroundTaskSubmode: ' +
            type);
          expect(type).assertEqual(8);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_007 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_008
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_008
     * @tc.desc   Test that the backgroundTaskManager enum BackgroundTaskSubmode of SUBMODE_MEDIA_PROCESS_NORMAL_NOTIFICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_008 begin---');

        try {
          let type: number = backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_MEDIA_PROCESS_NORMAL_NOTIFICATION;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_008 backgroundTaskManager BackgroundTaskSubmode: ' +
            type);
          expect(type).assertEqual(9);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_008 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_009
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_009
     * @tc.desc   Test that the backgroundTaskManager enum BackgroundTaskSubmode of SUBMODE_VIDEO_BROADCAST_NORMAL_NOTIFICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_009 begin---');

        try {
          let type: number = backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_VIDEO_BROADCAST_NORMAL_NOTIFICATION;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_009 backgroundTaskManager BackgroundTaskSubmode: ' +
            type);
          expect(type).assertEqual(10);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_009 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_010
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_010
     * @tc.desc   Test that the backgroundTaskManager enum UserAuthResult of NOT_SUPPORTED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_010 begin---');

        try {
          let type: number = backgroundTaskManager.UserAuthResult.NOT_SUPPORTED;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_010 backgroundTaskManager UserAuthResult: ' +
            type);
          expect(type).assertEqual(0);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_010 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_011
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_011
     * @tc.desc   Test that the backgroundTaskManager enum UserAuthResult of NOT_DETERMINED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_011 begin---');

        try {
          let type: number = backgroundTaskManager.UserAuthResult.NOT_DETERMINED;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_011 backgroundTaskManager UserAuthResult: ' +
            type);
          expect(type).assertEqual(1);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_011 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_012
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_012
     * @tc.desc   Test that the backgroundTaskManager enum UserAuthResult of DENIED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_012 begin---');

        try {
          let type: number = backgroundTaskManager.UserAuthResult.DENIED;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_012 backgroundTaskManager UserAuthResult: ' +
            type);
          expect(type).assertEqual(2);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_012 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_013
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_013
     * @tc.desc   Test that the backgroundTaskManager enum UserAuthResult of GRANTED_ONCE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_013 begin---');

        try {
          let type: number = backgroundTaskManager.UserAuthResult.GRANTED_ONCE;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_013 backgroundTaskManager UserAuthResult: ' +
            type);
          expect(type).assertEqual(3);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_013 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_014
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_014
     * @tc.desc   Test that the backgroundTaskManager enum GRANTED_ALWAYS of GRANTED_ALWAYS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_014 begin---');

        try {
          let type: number = backgroundTaskManager.UserAuthResult.GRANTED_ALWAYS;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_014 backgroundTaskManager UserAuthResult: ' +
            type);
          expect(type).assertEqual(4);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_014 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_015
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_015
     * @tc.desc   Test that the backgroundTaskManager enum GRANTED_ALWAYS of GRANTED_ALWAYS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_015 begin---');

        try {
          let type: number = backgroundTaskManager.UserAuthResult.GRANTED_ALWAYS;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_015 backgroundTaskManager UserAuthResult: ' +
            type);
          expect(type).assertEqual(4);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_015 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_016
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_016
     * @tc.desc   Test that the backgroundTaskManager enum BackgroundTaskSubmode of SUBMODE_WORK_OUT_NORMAL_NOTIFICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
    async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_016 begin---');

      try {
        let type: number = backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_WORK_OUT_NORMAL_NOTIFICATION;
        console.info('SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_016 backgroundTaskManager BackgroundTaskSubmode: ' +
          type);
        expect(type).assertEqual(11);
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_API22_TASK_XTS_016 end---');
    })
    
  })
}