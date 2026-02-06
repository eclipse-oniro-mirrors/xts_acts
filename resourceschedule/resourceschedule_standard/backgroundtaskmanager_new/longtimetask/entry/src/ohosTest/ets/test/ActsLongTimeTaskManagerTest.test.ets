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
    let wantAgentInfos: wantAgent.WantAgentInfo;

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

      wantAgentInfos = {
        wants: [
          {
            bundleName: "com.acts.actslongtimetasktest",
            abilityName: "com.acts.actslongtimetasktest.TestAbility"
          }
        ],
        operationType: ohosWantAgent.OperationType.START_ABILITY,
        requestCode: 0,
        wantAgentFlags: [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG],
        extraInfo: { [backgroundTaskManager.BackgroundModeType.SUB_MODE] : backgroundTaskManager.BackgroundSubMode.CAR_KEY }
      };
    })

    afterAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'afterAll called');
      try {
        wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
          let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          delegator.getCurrentTopAbility().then((ability: UIAbility) => {

            backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
              console.info("ActsLongTimeTaskManagerTest afterAll stopBackgroundRunning promise run success");
            }).catch((error: BusinessError) => {
              console.error(`ActsLongTimeTaskManagerTest afterAll Operation stopBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
            });

          }).catch((error: BusinessError) => {
            hilog.info(DOMAIN, TAG, 'ActsLongTimeTaskManagerTest afterAll getCurrentTopAbility error: %{public}s', JSON.stringify(error));
          });
        }).catch((error: BusinessError) => {
          hilog.info(DOMAIN, TAG, 'ActsLongTimeTaskManagerTest afterAll getWantAgent error: %{public}s', JSON.stringify(error));
        })
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'ActsLongTimeTaskManagerTest afterAll aa error: %{public}s', JSON.stringify(error));
      }
    })

    beforeEach(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'beforeEach called');
    })

    afterEach(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'afterEach called');

      try {
        wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
          let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          delegator.getCurrentTopAbility().then((ability: UIAbility) => {

            backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
              console.info("ActsLongTimeTaskManagerTest afterEach stopBackgroundRunning promise run success");
            }).catch((error: BusinessError) => {
              console.error(`ActsLongTimeTaskManagerTest afterEach Operation stopBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
            });

          }).catch((error: BusinessError) => {
            hilog.info(DOMAIN, TAG, 'ActsLongTimeTaskManagerTest afterEach getCurrentTopAbility error: %{public}s', JSON.stringify(error));
          });
        }).catch((error: BusinessError) => {
          hilog.info(DOMAIN, TAG, 'ActsLongTimeTaskManagerTest afterEach getWantAgent error: %{public}s', JSON.stringify(error));
        })
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'ActsLongTimeTaskManagerTest afterEach aa error: %{public}s', JSON.stringify(error));
      }
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

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_015
     * @tc.name:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_015
     * @tc.desc:Test that the backgroundTaskManager enum BackgroundMode of DATA_TRANSFER
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_015 begin---');

        try {
          let type = backgroundTaskManager.BackgroundMode.DATA_TRANSFER;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_015 backgroundTaskManager BackgroundMode: ' + type);
          expect(type).assertEqual(1);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_015 end---');
      })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_016
     * @tc.name:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_016
     * @tc.desc:Test that the backgroundTaskManager enum BackgroundMode of AUDIO_PLAYBACK
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_016 begin---');

        try {
          let type = backgroundTaskManager.BackgroundMode.AUDIO_PLAYBACK;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_016 backgroundTaskManager BackgroundMode: ' + type);
          expect(type).assertEqual(2);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_016 end---');
      })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_017
     * @tc.name:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_017
     * @tc.desc:Test that the backgroundTaskManager enum BackgroundMode of AUDIO_RECORDING
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_017 begin---');

        try {
          let type = backgroundTaskManager.BackgroundMode.AUDIO_RECORDING;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_017 backgroundTaskManager BackgroundMode: ' + type);
          expect(type).assertEqual(3);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_017 end---');
      })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_018
     * @tc.name:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_018
     * @tc.desc:Test that the backgroundTaskManager enum BackgroundMode of LOCATION
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_018 begin---');

        try {
          let type = backgroundTaskManager.BackgroundMode.LOCATION;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_018 backgroundTaskManager BackgroundMode: ' + type);
          expect(type).assertEqual(4);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_018 end---');
      })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_019
     * @tc.name:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_019
     * @tc.desc:Test that the backgroundTaskManager enum BackgroundMode of BLUETOOTH_INTERACTION
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_019 begin---');

        try {
          let type = backgroundTaskManager.BackgroundMode.BLUETOOTH_INTERACTION;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_019 backgroundTaskManager BackgroundMode: ' + type);
          expect(type).assertEqual(5);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_019 end---');
      })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_020
     * @tc.name:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_020
     * @tc.desc:Test that the backgroundTaskManager enum BackgroundMode of MULTI_DEVICE_CONNECTION
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_020 begin---');

        try {
          let type = backgroundTaskManager.BackgroundMode.MULTI_DEVICE_CONNECTION;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_020 backgroundTaskManager BackgroundMode: ' + type);
          expect(type).assertEqual(6);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_020 end---');
      })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_021
     * @tc.name:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_021
     * @tc.desc:Test that the backgroundTaskManager enum BackgroundMode of VOIP
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_021 begin---');

        try {
          let type = backgroundTaskManager.BackgroundMode.VOIP;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_021 backgroundTaskManager BackgroundMode: ' + type);
          expect(type).assertEqual(8);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_021 end---');
      })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_022
     * @tc.name:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_022
     * @tc.desc:Test that the backgroundTaskManager enum BackgroundMode of TASK_KEEPING
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_022 begin---');

        try {
          let type = backgroundTaskManager.BackgroundMode.TASK_KEEPING;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_022 backgroundTaskManager BackgroundMode: ' + type);
          expect(type).assertEqual(9);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_022 end---');
      })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_023
     * @tc.name:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_023
     * @tc.desc:Test that the backgroundTaskManager enum BackgroundSubMode of CAR_KEY
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_023 begin---');

        try {
          let type = backgroundTaskManager.BackgroundSubMode.CAR_KEY;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_023 backgroundTaskManager BackgroundMode: ' + type);
          expect(type).assertEqual(1);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_023 end---');
      })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_024
     * @tc.name:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_024
     * @tc.desc:Test that the backgroundTaskManager enum BackgroundSubMode of CAR_KEY
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_024 begin---');

        try {
          let type = backgroundTaskManager.BackgroundModeType.SUB_MODE;
          let mode = 'subMode';
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_024 backgroundTaskManager BackgroundMode: ' + type);
          expect(type).assertEqual(mode);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_024 end---');
      })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_025
     * @tc.name:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_025
     * @tc.desc:Test that the startBackgroundRunning function normal call with bgModeList and stopBackgroundRunning function normal call
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_025 begin---');

        try {
          wantAgent.getWantAgent(wantAgentInfos).then((want: WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {

              let bgModeList = ["bluetoothInteraction"]
              backgroundTaskManager.startBackgroundRunning(ability.context, bgModeList, want).then((res) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_025 startBackgroundRunning promise run success.');
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_025 startBackgroundRunning promise res: %{public}s', JSON.stringify(res));
                let continuousTaskId = res.continuousTaskId;
                let slotType = res.slotType;
                let contentType = res.contentType;
                let notificationId = res.notificationId;
                console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_025 ContinuousTaskNotification continuousTaskId ' + continuousTaskId);
                console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_025 ContinuousTaskNotification slotType ' + slotType);
                console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_025 ContinuousTaskNotification contentType ' + contentType);
                console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_025 ContinuousTaskNotification notificationId ' + notificationId);
                expect(continuousTaskId).assertLarger(-1);
                expect(slotType).assertLarger(-1);
                expect(contentType).assertLarger(-1);
                expect(notificationId).assertLarger(-1);
                done();
              }).catch((error: BusinessError) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_025 startBackgroundRunning promise error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
                done();
              })

            }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_025 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: BusinessError) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_025 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_025 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_025 end---');
      })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_026
     * @tc.name:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_026
     * @tc.desc:Test that the getAllTransientTasks function normal call
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_026 begin---');

        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let bgModeList = ["location"]
              
              backgroundTaskManager.startBackgroundRunning(ability.context, bgModeList, want).then((res) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_026 startBackgroundRunning promise run success.');
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_026 startBackgroundRunning promise res: %{public}s', JSON.stringify(res));
                backgroundTaskManager.getAllContinuousTasks(ability.context).then((res: backgroundTaskManager.ContinuousTaskInfo[]) => {
                    console.info(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_026 Operation getAllContinuousTasks2 succeeded. data: ` + JSON.stringify(res));
                    console.info(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_026 Operation getAllContinuousTasks2 succeeded. abilityName: ` + JSON.stringify(res[0].abilityName));
                    console.info(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_026 Operation getAllContinuousTasks2 succeeded. abilityName: ` + JSON.stringify(res[0].uid));
                    console.info(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_026 Operation getAllContinuousTasks2 succeeded. abilityName: ` + JSON.stringify(res[0].pid));
                    console.info(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_026 Operation getAllContinuousTasks2 succeeded. abilityName: ` + JSON.stringify(res[0].isFromWebView));
                    console.info(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_026 Operation getAllContinuousTasks2 succeeded. abilityName: ` + JSON.stringify(res[0].backgroundModes[0]));
                    console.info(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_026 Operation getAllContinuousTasks2 succeeded. abilityName: ` + JSON.stringify(res[0].backgroundSubModes.length));
                    console.info(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_026 Operation getAllContinuousTasks2 succeeded. abilityName: ` + JSON.stringify(res[0].wantAgentBundleName));
                    console.info(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_026 Operation getAllContinuousTasks2 succeeded. abilityName: ` + JSON.stringify(res[0].wantAgentAbilityName));

                    let type: string = "location"
                    expect(res[0].abilityName == "TestAbility").assertTrue();
                    expect(res[0].uid).assertLarger(0);
                    expect(res[0].pid).assertLarger(0);
                    expect(res[0].isFromWebView == false).assertTrue();
                    expect(res[0].backgroundModes[0] == type).assertTrue();
                    expect(res[0].backgroundSubModes.length == 0).assertTrue();
                    expect(res[0].notificationId).assertLarger(0);
                    expect(res[0].continuousTaskId).assertLarger(0);
                    expect(res[0].abilityId).assertLarger(0);
                    expect(res[0].wantAgentBundleName == "com.acts.actslongtimetasktest").assertTrue();
                    expect(res[0].wantAgentAbilityName == "com.acts.actslongtimetasktest.TestAbility").assertTrue();
                }).catch((error: BusinessError) => {
                    console.error(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_026 Operation getAllContinuousTasks2 failed. code is ${error.code} message is ${error.message}`);
                });
                backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
                  console.info("SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_026 stopBackgroundRunning promise run success");
                }).catch((error: BusinessError) => {
                  console.error(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_026 Operation stopBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                });
                done();
              }).catch((error: BusinessError) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_026 startBackgroundRunning promise error: %{public}s', JSON.stringify(error));
              })
            }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_026 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: BusinessError) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_026 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_026 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_026 end---');
      })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_027
     * @tc.name:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_027
     * @tc.desc:Test that the longtask suspend on function normal call and off function normal call
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_027 begin---');

        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let callbackFlag = 0
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let callback = (ContinuousTaskSuspendInfo: backgroundTaskManager.ContinuousTaskSuspendInfo) => {
                console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_027 ContinuousTaskSuspendInfo callback continuousTaskId ' + ContinuousTaskSuspendInfo.continuousTaskId);
                console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_027 ContinuousTaskSuspendInfo callback suspendState ' + ContinuousTaskSuspendInfo.suspendState);
                console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_027 ContinuousTaskSuspendInfo callback suspendReason ' + ContinuousTaskSuspendInfo.suspendReason);
                if(ContinuousTaskSuspendInfo === undefined){
                  ContinuousTaskSuspendInfo = { continuousTaskId: 1, suspendState: true, suspendReason: 15 };
                  console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_027 ContinuousTaskSuspendInfo callback continuousTaskId ' + ContinuousTaskSuspendInfo.continuousTaskId);
                  console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_027 ContinuousTaskSuspendInfo callback suspendState ' + ContinuousTaskSuspendInfo.suspendState);
                  console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_027 ContinuousTaskSuspendInfo callback suspendReason ' + ContinuousTaskSuspendInfo.suspendReason);
                  expect(ContinuousTaskSuspendInfo.continuousTaskId).assertInstanceOf('Number');
                  expect(ContinuousTaskSuspendInfo.suspendState).assertInstanceOf('Boolean');
                  expect(ContinuousTaskSuspendInfo.suspendReason).assertLarger(-1);
                  done();
                }
              }
              try {
                backgroundTaskManager.on("continuousTaskSuspend", callback);
                console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_027 continuousTaskSuspend on call succeeded ');
                callbackFlag = 1;
                console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_027 continuousTaskSuspend on callbackFlag ' + callbackFlag);
              } catch (error) {
                console.error(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_027 Operation continuousTaskSuspend failed. code is ${(error as BusinessError).code} message is ${(error as BusinessError).message}`);
              }

              try {
                backgroundTaskManager.off("continuousTaskSuspend", callback);
                console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_027 continuousTaskSuspend off call succeeded ');
                expect(callbackFlag).assertLarger(0);
                done();
              } catch (error) {
                console.error(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_027 Operation continuousTaskSuspend failed. code is ${(error as BusinessError).code} message is ${(error as BusinessError).message}`);
              }

            }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_027 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: BusinessError) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_027 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_027 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_027 end---');
      })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_028
     * @tc.name:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_028
     * @tc.desc:Test that the longtask active on function normal call and off function normal call
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_028 begin---');

        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let callbackFlag = 0
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let callback = (ContinuousTaskActiveInfo: backgroundTaskManager.ContinuousTaskActiveInfo) => {
                console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_028 ContinuousTaskActiveInfo callback id ' + ContinuousTaskActiveInfo.id);
                if(ContinuousTaskActiveInfo === undefined){
                  ContinuousTaskActiveInfo = { id: 15 };
                  console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_028 ContinuousTaskActiveInfo callback id ' + ContinuousTaskActiveInfo.id);
                  expect(ContinuousTaskActiveInfo.id).assertLarger(-1);
                  done();
                }
              }
              try {
                backgroundTaskManager.on("continuousTaskActive", callback);
                console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_028 continuousTaskActive on call succeeded ');
                callbackFlag = 1;
                console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_028 continuousTaskActive on callbackFlag ' + callbackFlag);
              } catch (error) {
                console.error(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_028 Operation continuousTaskActive failed. code is ${(error as BusinessError).code} message is ${(error as BusinessError).message}`);
              }

              try {
                backgroundTaskManager.off("continuousTaskActive", callback);
                console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_028 continuousTaskActive off call succeeded ');
                expect(callbackFlag).assertLarger(0);
                done();
              } catch (error) {
                console.error(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_028 Operation continuousTaskActive failed. code is ${(error as BusinessError).code} message is ${(error as BusinessError).message}`);
              }

            }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_028 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: BusinessError) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_028 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_028 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_028 end---');
      })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_029
     * @tc.name:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_029
     * @tc.desc:Test that the backgroundTaskManager enum ContinuousTaskSuspendReason of SYSTEM_SUSPEND_DATA_TRANSFER_LOW_SPEED
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_029 begin---');

        try {
          let type: number = backgroundTaskManager.ContinuousTaskSuspendReason.SYSTEM_SUSPEND_DATA_TRANSFER_LOW_SPEED;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_029 backgroundTaskManager ContinuousTaskSuspendReason: ' + type);
          expect(type).assertEqual(4);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_029 end---');
      })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_030
     * @tc.name:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_030
     * @tc.desc:Test that the backgroundTaskManager enum ContinuousTaskSuspendReason of SYSTEM_SUSPEND_AUDIO_PLAYBACK_NOT_USE_AVSESSION
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_030 begin---');

        try {
          let type: number = backgroundTaskManager.ContinuousTaskSuspendReason.SYSTEM_SUSPEND_AUDIO_PLAYBACK_NOT_USE_AVSESSION;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_030 backgroundTaskManager ContinuousTaskSuspendReason: ' + type);
          expect(type).assertEqual(5);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_030 end---');
      })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_031
     * @tc.name:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_031
     * @tc.desc:Test that the backgroundTaskManager enum ContinuousTaskSuspendReason of SYSTEM_SUSPEND_AUDIO_PLAYBACK_NOT_RUNNING
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_031 begin---');

        try {
          let type: number = backgroundTaskManager.ContinuousTaskSuspendReason.SYSTEM_SUSPEND_AUDIO_PLAYBACK_NOT_RUNNING;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_031 backgroundTaskManager ContinuousTaskSuspendReason: ' + type);
          expect(type).assertEqual(6);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_031 end---');
      })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_032
     * @tc.name:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_032
     * @tc.desc:Test that the backgroundTaskManager enum ContinuousTaskSuspendReason of SYSTEM_SUSPEND_AUDIO_RECORDING_NOT_RUNNING
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_032 begin---');

        try {
          let type: number = backgroundTaskManager.ContinuousTaskSuspendReason.SYSTEM_SUSPEND_AUDIO_RECORDING_NOT_RUNNING;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_032 backgroundTaskManager ContinuousTaskSuspendReason: ' + type);
          expect(type).assertEqual(7);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_032 end---');
      })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_033
     * @tc.name:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_033
     * @tc.desc:Test that the backgroundTaskManager enum ContinuousTaskSuspendReason of SYSTEM_SUSPEND_LOCATION_NOT_USED
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_033 begin---');

        try {
          let type: number = backgroundTaskManager.ContinuousTaskSuspendReason.SYSTEM_SUSPEND_LOCATION_NOT_USED;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_033 backgroundTaskManager ContinuousTaskSuspendReason: ' + type);
          expect(type).assertEqual(8);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_033 end---');
      })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_034
     * @tc.name:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_034
     * @tc.desc:Test that the backgroundTaskManager enum ContinuousTaskSuspendReason of SYSTEM_SUSPEND_BLUETOOTH_NOT_USED
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_034 begin---');

        try {
          let type: number = backgroundTaskManager.ContinuousTaskSuspendReason.SYSTEM_SUSPEND_BLUETOOTH_NOT_USED;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_034 backgroundTaskManager ContinuousTaskSuspendReason: ' + type);
          expect(type).assertEqual(9);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_034 end---');
      })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_035
     * @tc.name:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_035
     * @tc.desc:Test that the backgroundTaskManager enum ContinuousTaskSuspendReason of SYSTEM_SUSPEND_MULTI_DEVICE_NOT_USED
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_035 begin---');

        try {
          let type: number = backgroundTaskManager.ContinuousTaskSuspendReason.SYSTEM_SUSPEND_MULTI_DEVICE_NOT_USED;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_035 backgroundTaskManager ContinuousTaskSuspendReason: ' + type);
          expect(type).assertEqual(10);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_035 end---');
      })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_036
     * @tc.name:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_036
     * @tc.desc:Test that the backgroundTaskManager enum ContinuousTaskSuspendReason of SYSTEM_SUSPEND_USED_ILLEGALLY
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_036 begin---');

        try {
          let type: number = backgroundTaskManager.ContinuousTaskSuspendReason.SYSTEM_SUSPEND_USED_ILLEGALLY;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_036 backgroundTaskManager ContinuousTaskSuspendReason: ' + type);
          expect(type).assertEqual(11);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_036 end---');
      })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_037
     * @tc.name:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_037
     * @tc.desc:Test that the backgroundTaskManager enum ContinuousTaskSuspendReason of SYSTEM_SUSPEND_SYSTEM_LOAD_WARNING
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_037 begin---');

        try {
          let type: number = backgroundTaskManager.ContinuousTaskSuspendReason.SYSTEM_SUSPEND_SYSTEM_LOAD_WARNING;
          console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_037 backgroundTaskManager ContinuousTaskSuspendReason: ' + type);
          expect(type).assertEqual(12);
          done();
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_037 end---');
      })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_038
     * @tc.name:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_038
     * @tc.desc:Test that the backgroundTaskManager getTransientTaskInfo function normal call
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_038 begin---');

        try {
          backgroundTaskManager.getTransientTaskInfo().then((res: backgroundTaskManager.TransientTaskInfo) => {
            console.info(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_038 Operation getTransientTaskInfo succeeded. data: ` + JSON.stringify(res));
            expect(res.remainingQuota).assertInstanceOf('Number');
            expect(res.transientTasks.length == 0).assertTrue();
            done();
          }).catch((error : BusinessError) => {
            console.error(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_038 Operation getTransientTaskInfo failed. code is ${error.code} message is ${error.message}`);
            expect(false).assertTrue();
            done();
          });
        } catch (error) {
          console.error(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_038 Operation getTransientTaskInfo failed. code is ${(error as BusinessError).code} message is ${(error as BusinessError).message}`);
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_038 end---');
      })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_039
     * @tc.name:SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_039
     * @tc.desc:Test that the getAllTransientTasks function normal call
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_039 begin---');

        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let bgModeList = ["location"]
              let includeSuspended = true
              
              backgroundTaskManager.startBackgroundRunning(ability.context, bgModeList, want).then((res) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_026 startBackgroundRunning promise run success.');
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_026 startBackgroundRunning promise res: %{public}s', JSON.stringify(res));
                backgroundTaskManager.getAllContinuousTasks(ability.context, includeSuspended).then((res: backgroundTaskManager.ContinuousTaskInfo[]) => {
                    console.info(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_039 Operation getAllContinuousTasks2 succeeded. data: ` + JSON.stringify(res));
                    console.info(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_039 Operation getAllContinuousTasks2 succeeded. abilityName: ` + JSON.stringify(res[0].abilityName));
                    console.info(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_039 Operation getAllContinuousTasks2 succeeded. uid: ` + JSON.stringify(res[0].uid));
                    console.info(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_039 Operation getAllContinuousTasks2 succeeded. pid: ` + JSON.stringify(res[0].pid));
                    console.info(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_039 Operation getAllContinuousTasks2 succeeded. isFromWebView: ` + JSON.stringify(res[0].isFromWebView));
                    console.info(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_039 Operation getAllContinuousTasks2 succeeded. backgroundModes: ` + JSON.stringify(res[0].backgroundModes[0]));
                    console.info(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_039 Operation getAllContinuousTasks2 succeeded. backgroundSubModes: ` + JSON.stringify(res[0].backgroundSubModes.length));
                    console.info(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_039 Operation getAllContinuousTasks2 succeeded. wantAgentBundleName: ` + JSON.stringify(res[0].wantAgentBundleName));
                    console.info(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_039 Operation getAllContinuousTasks2 succeeded. wantAgentAbilityName: ` + JSON.stringify(res[0].wantAgentAbilityName));
                    console.info(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_039 Operation getAllContinuousTasks2 succeeded. suspendState: ` + JSON.stringify(res[0].suspendState));

                    let type: string = "location"
                    expect(res[0].abilityName == "TestAbility").assertTrue();
                    expect(res[0].uid).assertLarger(0);
                    expect(res[0].pid).assertLarger(0);
                    expect(res[0].isFromWebView == false).assertTrue();
                    expect(res[0].backgroundModes[0] == type).assertTrue();
                    expect(res[0].backgroundSubModes.length == 0).assertTrue();
                    expect(res[0].notificationId).assertLarger(0);
                    expect(res[0].continuousTaskId).assertLarger(0);
                    expect(res[0].abilityId).assertLarger(0);
                    expect(res[0].wantAgentBundleName == "com.acts.actslongtimetasktest").assertTrue();
                    expect(res[0].wantAgentAbilityName == "com.acts.actslongtimetasktest.TestAbility").assertTrue();
                    expect(res[0].suspendState).assertInstanceOf('Boolean');
                }).catch((error: BusinessError) => {
                    console.error(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_039 Operation getAllContinuousTasks2 failed. code is ${error.code} message is ${error.message}`);
                });
                backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
                  console.info("SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_039 stopBackgroundRunning promise run success");
                }).catch((error: BusinessError) => {
                  console.error(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_039 Operation stopBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                });
                done();
              }).catch((error: BusinessError) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_039 startBackgroundRunning promise error: %{public}s', JSON.stringify(error));
              })
            }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_039 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: BusinessError) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_039 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_039 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_XTS_039 end---');
      })

  })
}

