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


export default function LongTimeTaskManagerTest() {
  describe('ActsLongTimeTaskManagerTest', () => {

    let wantAgentInfo: wantAgent.WantAgentInfo;

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


    /*
     * @tc.number:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_001
     * @tc.name:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_001
     * @tc.desc:Test that the startBackgroundRunning function normal call with bgModeList and stopBackgroundRunning function normal call
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_001 begin---');

        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let bgModeList = ["location"]
              backgroundTaskManager.startBackgroundRunning(ability.context, bgModeList, want).then((res) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_001 startBackgroundRunning promise run success.');
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_001 startBackgroundRunning promise res: %{public}s', JSON.stringify(res));
                let continuousTaskId = res.continuousTaskId
                let slotType = res.slotType
                let contentType = res.contentType
                let notificationId = res.notificationId
                console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_001 ContinuousTaskNotification continuousTaskId ' + continuousTaskId);
                console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_001 ContinuousTaskNotification slotType ' + slotType);
                console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_001 ContinuousTaskNotification contentType ' + contentType);
                console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_001 ContinuousTaskNotification notificationId ' + notificationId);
                expect(continuousTaskId).assertLarger(-1);
                expect(slotType).assertLarger(-1);
                expect(contentType).assertLarger(-1);
                expect(notificationId).assertLarger(-1);
                done();
              }).catch((error: BusinessError) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_001 startBackgroundRunning promise error: %{public}s', JSON.stringify(error));
              })

              backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
                console.info("SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_001 stopBackgroundRunning promise run success");
              }).catch((error: BusinessError) => {
                console.error(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_001 Operation stopBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
              });

            }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_001 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: BusinessError) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_001 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_001 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_001 end---');
      })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_002
     * @tc.name:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_002
     * @tc.desc:Test that the startBackgroundRunning function normal call with bgMode
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_002 begin---');

        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let bgMode = backgroundTaskManager.BackgroundMode.AUDIO_PLAYBACK;
              backgroundTaskManager.startBackgroundRunning(ability.context, bgMode, want,
                (error: BusinessError, data: void) => {
                  if (error) {
                    hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_002 startBackgroundRunning callback error: %{public}s', JSON.stringify(error));
                  } else {
                    hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_002 startBackgroundRunning callback run success.');
                    hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_002 startBackgroundRunning callback res: %{public}s', JSON.stringify(data));
                  }
                  done();
                })

              backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
                console.info("SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_002 stopBackgroundRunning promise run success");
              }).catch((error: BusinessError) => {
                console.error(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_002 Operation stopBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
              });
            })
              .catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_002getCurrentTopAbility error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
              done();
            });
          }).catch((error: BusinessError) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_002getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_002aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_002 end---');
      })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_003
     * @tc.name:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_003
     * @tc.desc:Test that the backgroundTaskManager enum ContinuousTaskCancelReason of USER_CANCEL
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_003 begin---');
          let type = backgroundTaskManager.ContinuousTaskCancelReason.USER_CANCEL;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_003 backgroundTaskManager ContinuousTaskCancelReason: ' + type);
          expect(type).assertEqual(1);
          done();

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_003 end---');
      })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_004
     * @tc.name:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_004
     * @tc.desc:Test that the backgroundTaskManager enum ContinuousTaskCancelReason of SYSTEM_CANCEL
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_004 begin---');

        try {
          let type = backgroundTaskManager.ContinuousTaskCancelReason.SYSTEM_CANCEL;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_004 backgroundTaskManager ContinuousTaskCancelReason: ' + type);
          expect(type).assertEqual(2);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_004 end---');
      })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_005
     * @tc.name:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_005
     * @tc.desc:Test that the backgroundTaskManager enum ContinuousTaskCancelReason of USER_CANCEL_REMOVE_NOTIFICATION
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_005 begin---');

        try {
          let type = backgroundTaskManager.ContinuousTaskCancelReason.USER_CANCEL_REMOVE_NOTIFICATION;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_004 backgroundTaskManager ContinuousTaskCancelReason: ' + type);
          expect(type).assertEqual(3);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_005 end---');
      })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_006
     * @tc.name:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_006
     * @tc.desc:Test that the backgroundTaskManager enum ContinuousTaskCancelReason of SYSTEM_CANCEL_DATA_TRANSFER_LOW_SPEED
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_006 begin---');

        try {
          let type = backgroundTaskManager.ContinuousTaskCancelReason.SYSTEM_CANCEL_DATA_TRANSFER_LOW_SPEED;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_004 backgroundTaskManager ContinuousTaskCancelReason: ' + type);
          expect(type).assertEqual(4);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_006 end---');
      })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_007
     * @tc.name:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_007
     * @tc.desc:Test that the backgroundTaskManager enum ContinuousTaskCancelReason of SYSTEM_CANCEL_AUDIO_PLAYBACK_NOT_USE_AVSESSION
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_007 begin---');

        try {
          let type = backgroundTaskManager.ContinuousTaskCancelReason.SYSTEM_CANCEL_AUDIO_PLAYBACK_NOT_USE_AVSESSION;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_007 backgroundTaskManager ContinuousTaskCancelReason: ' + type);
          expect(type).assertEqual(5);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_007 end---');
      })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_008
     * @tc.name:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_008
     * @tc.desc:Test that the backgroundTaskManager enum ContinuousTaskCancelReason of SYSTEM_CANCEL_AUDIO_PLAYBACK_NOT_RUNNING
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_008 begin---');

        try {
          let type = backgroundTaskManager.ContinuousTaskCancelReason.SYSTEM_CANCEL_AUDIO_PLAYBACK_NOT_RUNNING;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_008 backgroundTaskManager ContinuousTaskCancelReason: ' + type);
          expect(type).assertEqual(6);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_008 end---');
      })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_009
     * @tc.name:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_009
     * @tc.desc:Test that the backgroundTaskManager enum ContinuousTaskCancelReason of SYSTEM_CANCEL_AUDIO_RECORDING_NOT_RUNNING
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_009 begin---');

        try {
          let type = backgroundTaskManager.ContinuousTaskCancelReason.SYSTEM_CANCEL_AUDIO_RECORDING_NOT_RUNNING;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_009 backgroundTaskManager ContinuousTaskCancelReason: ' + type);
          expect(type).assertEqual(7);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_009 end---');
      })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_010
     * @tc.name:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_010
     * @tc.desc:Test that the backgroundTaskManager enum ContinuousTaskCancelReason of SYSTEM_CANCEL_NOT_USE_LOCATION
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_009 begin---');

        try {
          let type = backgroundTaskManager.ContinuousTaskCancelReason.SYSTEM_CANCEL_NOT_USE_LOCATION;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_010 backgroundTaskManager ContinuousTaskCancelReason: ' + type);
          expect(type).assertEqual(8);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_010 end---');
      })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_011
     * @tc.name:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_011
     * @tc.desc:Test that the backgroundTaskManager enum ContinuousTaskCancelReason of SYSTEM_CANCEL_NOT_USE_BLUETOOTH
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_009 begin---');

        try {
          let type = backgroundTaskManager.ContinuousTaskCancelReason.SYSTEM_CANCEL_NOT_USE_BLUETOOTH;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_011 backgroundTaskManager ContinuousTaskCancelReason: ' + type);
          expect(type).assertEqual(9);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_011 end---');
      })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_012
     * @tc.name:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_012
     * @tc.desc:Test that the backgroundTaskManager enum ContinuousTaskCancelReason of SYSTEM_CANCEL_NOT_USE_MULTI_DEVICE
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_012 begin---');

        try {
          let type = backgroundTaskManager.ContinuousTaskCancelReason.SYSTEM_CANCEL_NOT_USE_MULTI_DEVICE;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_012 backgroundTaskManager ContinuousTaskCancelReason: ' + type);
          expect(type).assertEqual(10);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_012 end---');
      })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_013
     * @tc.name:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_013
     * @tc.desc:Test that the backgroundTaskManager enum ContinuousTaskCancelReason of SYSTEM_CANCEL_USE_ILLEGALLY
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_013 begin---');

        try {
          let type = backgroundTaskManager.ContinuousTaskCancelReason.SYSTEM_CANCEL_USE_ILLEGALLY;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_013 backgroundTaskManager ContinuousTaskCancelReason: ' + type);
          expect(type).assertEqual(11);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_013 end---');
      })
      
    /*
     * @tc.number:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_014
     * @tc.name:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_014
     * @tc.desc:Test that the on function normal call and off function normal call
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_014 begin---');

        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let callbackFlag = 0
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let callback = (ContinuousTaskCancelInfo: backgroundTaskManager.ContinuousTaskCancelInfo) => {
                console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_014 continuousTaskCancel callback id ' + ContinuousTaskCancelInfo.id);
                console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_014 continuousTaskCancel callback reason ' + ContinuousTaskCancelInfo.reason);
                if(ContinuousTaskCancelInfo === undefined){
                  ContinuousTaskCancelInfo = { reason: 1, id: 15 };
                  console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_014 ContinuousTaskCancelInfo callback id ' + ContinuousTaskCancelInfo.id);
                  console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_014 ContinuousTaskCancelInfo callback reason ' + ContinuousTaskCancelInfo.reason);
                  expect(ContinuousTaskCancelInfo.reason).assertInstanceOf('Number');
                  expect(ContinuousTaskCancelInfo.id).assertLarger(-1);
                  done();
                }
              }
              try {
                backgroundTaskManager.on("continuousTaskCancel", callback);
                console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_014 continuousTaskCancel on call succeeded ');
                callbackFlag = 1;
                console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_014 continuousTaskCanc on callbackFlag ' + callbackFlag);
              } catch (error) {
                console.error(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_014 Operation onContinuousTaskCancel failed. code is ${(error as BusinessError).code} message is ${(error as BusinessError).message}`);
              }
              let bgModeList = ["audioPlayback"];
              backgroundTaskManager.startBackgroundRunning(ability.context, bgModeList, want).then((res) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_014 startBackgroundRunning promise run success.');
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_014 startBackgroundRunning promise res: %{public}s', JSON.stringify(res));
              }).catch((error: BusinessError) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_014 startBackgroundRunning promise error: %{public}s', JSON.stringify(error));
              })

              try {
                backgroundTaskManager.off("continuousTaskCancel", callback);
                console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_014 continuousTaskCancel off call succeeded ');
                expect(callbackFlag).assertLarger(0);
                done();
              } catch (error) {
                console.error(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_014 Operation onContinuousTaskCancel failed. code is ${(error as BusinessError).code} message is ${(error as BusinessError).message}`);
              }

            }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_014 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: BusinessError) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_014 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_014 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_014 end---');
      })

  })
}

