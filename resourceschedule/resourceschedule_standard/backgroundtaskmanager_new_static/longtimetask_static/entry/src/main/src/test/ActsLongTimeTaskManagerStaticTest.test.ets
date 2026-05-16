/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level, beforeAll, afterAll, afterEach} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import { WantAgent as _WantAgent } from '@ohos.app.ability.wantAgent';
import wantAgent from '@ohos.app.ability.wantAgent';
import Want from '@ohos.app.ability.Want';
import UIAbility from '@ohos.app.ability.UIAbility'
import backgroundTaskManager from '@ohos.resourceschedule.backgroundTaskManager'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { BusinessError } from "@ohos.base"
import Utils from './Util.test';
import { RecordData } from '@ohos.base';
let DOMAIN: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let TAG: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function ActsLongTimeTaskManagerStaticTest() {
  describe('ActsLongTimeTaskManagerStaticTest', () => {

    let wantAgentFlags: Array<wantAgent.WantAgentFlags> = new Array<wantAgent.WantAgentFlags>();

    let wantAgentInfo: wantAgent.WantAgentInfo = {
      wants: [
        {
          bundleName: "com.acts.actslongtimetasktest.static",
          abilityName: "EntryAbility"
        }
      ],
      requestCode: 0,
      actionFlags: wantAgentFlags,
      actionType: wantAgent.OperationType.START_ABILITY
    };

    let key: int = backgroundTaskManager.BackgroundSubMode.CAR_KEY;

    let wantAgentInfos: wantAgent.WantAgentInfo = {
      wants: [
        {
          bundleName: "com.acts.actslongtimetasktest.static",
          abilityName: "EntryAbility"
        }
      ],
      requestCode: 0,
      actionFlags: wantAgentFlags,
      actionType: wantAgent.OperationType.START_ABILITY,
      extraInfo: { "subMode": key } as Record<String,RecordData>
    };

    beforeAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'beforeAll called');
    })

    afterAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'afterAll called');
      try {
        wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
          let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          delegator.getCurrentTopAbility().then((ability: UIAbility) => {

            backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
              hilog.info(DOMAIN, TAG, '%{public}s', 'ActsLongTimeTaskManagerTest afterAll stopBackgroundRunning promise run success');
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'ActsLongTimeTaskManagerTest afterAll Operation stopBackgroundRunning failed: %{public}s' + JSON.stringify(error));
            });

          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'ActsLongTimeTaskManagerTest afterAll getCurrentTopAbility error: %{public}s' + JSON.stringify(error));
          });
        }).catch((error: Error) => {
          hilog.info(DOMAIN, TAG, 'ActsLongTimeTaskManagerTest afterAll getWantAgent error: %{public}s' + JSON.stringify(error));
        })
      } catch (error) {
        error = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'ActsLongTimeTaskManagerTest afterAll aa error: %{public}s' + JSON.stringify(error));
      }
    })

    afterEach(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'afterEach called');
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_001
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_001
     * @tc.desc   Test that the startBackgroundRunning function normal call with bgModeList and stopBackgroundRunning function normal call
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_001 begin---');

      let callbackFlag = 0;
      let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_001 startBackgroundRunning delegator success.');

      delegator.executeShellCommand("aa start -a EntryAbility -b com.acts.actslongtimetasktest.static")

      await Utils.msSleep(3500);

      try {
        wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_001 startBackgroundRunning getWantAgent success.');

          delegator.getCurrentTopAbility().then((ability: UIAbility) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_001 startBackgroundRunning getCurrentTopAbility success.');
            let bgModeList = ["location"]
            backgroundTaskManager.startBackgroundRunning(ability.context, bgModeList, want).then((res: backgroundTaskManager.ContinuousTaskNotification) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_001 startBackgroundRunning promise run success.');
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_001 startBackgroundRunning promise res: %{public}s' + JSON.stringify(res));
              let continuousTaskId = res.continuousTaskId
              let slotType = res.slotType
              let contentType = res.contentType
              let notificationId = res.notificationId
              hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_001 ContinuousTaskNotification continuousTaskId: '+ continuousTaskId);
              hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_001 ContinuousTaskNotification slotType: '+ slotType);
              hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_001 ContinuousTaskNotification contentType: '+ contentType);
              hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_001 ContinuousTaskNotification notificationId: '+ notificationId);
              expect(res.continuousTaskId).assertLarger(-1);
              expect(res.slotType).assertEqual(4);
              expect(res.contentType).assertEqual(4);
              expect(res.notificationId).assertLarger(-1);
              callbackFlag = 1;
              backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_001 stopBackgroundRunning promise run success.');
                expect(callbackFlag).assertEqual(1);
                done();
              }).catch((error: Error) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_001 Operation stopBackgroundRunning promise failed: %{public}s', JSON.stringify(error));
              });
              done();
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_001 startBackgroundRunning promise error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            })

          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_001 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          });
        }).catch((error: Error) => {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_001 getWantAgent error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        })
      } catch (error) {
        error = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_001 aa error: %{public}s', JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_001 end---');
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_002
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_002
     * @tc.desc   Test that the startBackgroundRunning callback function normal call with bgMode and stopBackgroundRunning callback function
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_002 begin---');

      let callbackFlag = 0;

      try {
        wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
          let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          delegator.getCurrentTopAbility().then((ability: UIAbility) => {
            let bgMode = backgroundTaskManager.BackgroundMode.AUDIO_PLAYBACK;
            backgroundTaskManager.startBackgroundRunning(ability.context, bgMode, want,
              (error: BusinessError | null) => {
                callbackFlag = 1;
                if (error) {
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_002 startBackgroundRunning callback error: %{public}s', JSON.stringify(error));
                } else {
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_002 startBackgroundRunning callback run success.');
                  expect(callbackFlag).assertEqual(1);

                  backgroundTaskManager.stopBackgroundRunning(ability.context, (error: BusinessError | null) => {
                    callbackFlag = 2;
                    if (error) {
                      hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_002 stopBackgroundRunning callback error: %{public}s', JSON.stringify(error));
                    } else {
                      hilog.info(DOMAIN, TAG,
                        'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_002 stopBackgroundRunning callback run success.');
                      expect(callbackFlag).assertEqual(2);
                      done();
                    }
                  })
                }
              })

          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_002 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          });
        }).catch((error: Error) => {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_002 getWantAgent error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        })
      } catch (error) {
        error = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_002 aa error: %{public}s', JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_002 end---');
    })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_003
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_003
     * @tc.desc   Test that the backgroundTaskManager enum ContinuousTaskSuspendReason of SYSTEM_SUSPEND_DATA_TRANSFER_LOW_SPEED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_003 begin---');

      try {
        let type: number = backgroundTaskManager.ContinuousTaskSuspendReason.SYSTEM_SUSPEND_DATA_TRANSFER_LOW_SPEED;
        console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_003 backgroundTaskManager ContinuousTaskSuspendReason: ' + type);
        expect(type).assertEqual(4);
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_003 aa error: %{public}s', JSON.stringify(error));
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_003 end---');
    })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_004
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_004
     * @tc.desc   Test that the backgroundTaskManager enum ContinuousTaskSuspendReason of SYSTEM_SUSPEND_AUDIO_PLAYBACK_NOT_USE_AVSESSION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_004 begin---');

      try {
        let type: number = backgroundTaskManager.ContinuousTaskSuspendReason.SYSTEM_SUSPEND_AUDIO_PLAYBACK_NOT_USE_AVSESSION;
        console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_004 backgroundTaskManager ContinuousTaskSuspendReason: ' + type);
        expect(type).assertEqual(5);
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_004 aa error: %{public}s', JSON.stringify(error));
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_004 end---');
    })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_005
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_005
     * @tc.desc   Test that the backgroundTaskManager enum ContinuousTaskSuspendReason of SYSTEM_SUSPEND_AUDIO_PLAYBACK_NOT_RUNNING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_005 begin---');

      try {
        let type: number = backgroundTaskManager.ContinuousTaskSuspendReason.SYSTEM_SUSPEND_AUDIO_PLAYBACK_NOT_RUNNING;
        console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_005 backgroundTaskManager ContinuousTaskSuspendReason: ' + type);
        expect(type).assertEqual(6);
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_005 aa error: %{public}s', JSON.stringify(error));
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_005 end---');
    })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_006
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_006
     * @tc.desc   Test that the backgroundTaskManager enum ContinuousTaskSuspendReason of SYSTEM_SUSPEND_AUDIO_RECORDING_NOT_RUNNING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_006 begin---');

      try {
        let type: number = backgroundTaskManager.ContinuousTaskSuspendReason.SYSTEM_SUSPEND_AUDIO_RECORDING_NOT_RUNNING;
        console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_006 backgroundTaskManager ContinuousTaskSuspendReason: ' + type);
        expect(type).assertEqual(7);
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_006 aa error: %{public}s', JSON.stringify(error));
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_006 end---');
    })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_007
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_007
     * @tc.desc   Test that the backgroundTaskManager enum ContinuousTaskSuspendReason of SYSTEM_SUSPEND_LOCATION_NOT_USED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_007 begin---');

      try {
        let type: number = backgroundTaskManager.ContinuousTaskSuspendReason.SYSTEM_SUSPEND_LOCATION_NOT_USED;
        console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_007 backgroundTaskManager ContinuousTaskSuspendReason: ' + type);
        expect(type).assertEqual(8);
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_007 aa error: %{public}s', JSON.stringify(error));
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_007 end---');
    })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_008
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_008
     * @tc.desc   Test that the backgroundTaskManager enum ContinuousTaskSuspendReason of SYSTEM_SUSPEND_BLUETOOTH_NOT_USED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_008 begin---');

      try {
        let type: number = backgroundTaskManager.ContinuousTaskSuspendReason.SYSTEM_SUSPEND_BLUETOOTH_NOT_USED;
        console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_008 backgroundTaskManager ContinuousTaskSuspendReason: ' + type);
        expect(type).assertEqual(9);
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_008 aa error: %{public}s', JSON.stringify(error));
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_008 end---');
    })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_009
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_009
     * @tc.desc   Test that the backgroundTaskManager enum ContinuousTaskSuspendReason of SYSTEM_SUSPEND_MULTI_DEVICE_NOT_USED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_009 begin---');

      try {
        let type: number = backgroundTaskManager.ContinuousTaskSuspendReason.SYSTEM_SUSPEND_MULTI_DEVICE_NOT_USED;
        console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_009 backgroundTaskManager ContinuousTaskSuspendReason: ' + type);
        expect(type).assertEqual(10);
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_009 aa error: %{public}s', JSON.stringify(error));
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_009 end---');
    })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_010
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_010
     * @tc.desc   Test that the backgroundTaskManager enum ContinuousTaskSuspendReason of SYSTEM_SUSPEND_USED_ILLEGALLY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_010 begin---');

      try {
        let type: number = backgroundTaskManager.ContinuousTaskSuspendReason.SYSTEM_SUSPEND_USED_ILLEGALLY;
        console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_010 backgroundTaskManager ContinuousTaskSuspendReason: ' + type);
        expect(type).assertEqual(11);
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_010 aa error: %{public}s', JSON.stringify(error));
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_010 end---');
    })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_011
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_011
     * @tc.desc   Test that the backgroundTaskManager enum ContinuousTaskSuspendReason of SYSTEM_SUSPEND_SYSTEM_LOAD_WARNING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_011 begin---');

      try {
        let type: number = backgroundTaskManager.ContinuousTaskSuspendReason.SYSTEM_SUSPEND_SYSTEM_LOAD_WARNING;
        console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_011 backgroundTaskManager ContinuousTaskSuspendReason: ' + type);
        expect(type).assertEqual(12);
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_011 aa error: %{public}s', JSON.stringify(error));
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_011 end---');
    })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_012
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_012
     * @tc.desc   Test that the backgroundTaskManager enum ContinuousTaskCancelReason of USER_CANCEL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_012 begin---');

      try {
        let type = backgroundTaskManager.ContinuousTaskCancelReason.USER_CANCEL;
        console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_012 backgroundTaskManager ContinuousTaskCancelReason: ' + type);
        expect(type).assertEqual(1);
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_012 aa error: %{public}s', JSON.stringify(error));
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_012 end---');
    })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_013
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_013
     * @tc.desc   Test that the backgroundTaskManager enum ContinuousTaskCancelReason of SYSTEM_CANCEL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_013 begin---');

      try {
        let type = backgroundTaskManager.ContinuousTaskCancelReason.SYSTEM_CANCEL;
        console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_013 backgroundTaskManager ContinuousTaskCancelReason: ' + type);
        expect(type).assertEqual(2);
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_013 aa error: %{public}s', JSON.stringify(error));
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_013 end---');
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_014
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_014
     * @tc.desc   Test that the startBackgroundRunning promise function normal call with bgMode and stopBackgroundRunning promise function
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_014 begin---');

      try {
        wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
          let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          delegator.getCurrentTopAbility().then((ability: UIAbility) => {

            backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
              hilog.info(DOMAIN, TAG, '%{public}s', 'ActsLongTimeTaskManagerTest afterAll stopBackgroundRunning promise run success');
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'ActsLongTimeTaskManagerTest afterAll Operation stopBackgroundRunning failed: %{public}s' + JSON.stringify(error));
            });

            let bgMode = backgroundTaskManager.BackgroundMode.AUDIO_PLAYBACK;
            backgroundTaskManager.startBackgroundRunning(ability.context, bgMode, want).then(() => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_014 startBackgroundRunning promise run success.');
              backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_014 stopBackgroundRunning promise run success.');
              }).catch((error: Error) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_014 Operation stopBackgroundRunning promise failed: %{public}s', JSON.stringify(error));
              });
              done();
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_014 startBackgroundRunning promise error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            })

          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_014 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          });
        }).catch((error: Error) => {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_014 getWantAgent error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        })
      } catch (error) {
        error = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_014 aa error: %{public}s', JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_014 end---');
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_015
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_015
     * @tc.desc   Test that the backgroundTaskManager enum BackgroundMode of DATA_TRANSFER
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_015 begin---');

      try {
        let type = backgroundTaskManager.BackgroundMode.DATA_TRANSFER;
        hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_015 backgroundTaskManager BackgroundMode: ' + type);
        expect(type).assertEqual(1);
        done();
      } catch (error) {
        error = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_015 aa error: %{public}s', JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_015 end---');
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_016
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_016
     * @tc.desc   Test that the backgroundTaskManager enum BackgroundMode of AUDIO_PLAYBACK
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_016 begin---');

      try {
        let type = backgroundTaskManager.BackgroundMode.AUDIO_PLAYBACK;
        hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_016 backgroundTaskManager BackgroundMode: ' + type);
        expect(type).assertEqual(2);
        done();
      } catch (error) {
        error = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_016 aa error: %{public}s', JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_016 end---');
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_017
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_017
     * @tc.desc   Test that the backgroundTaskManager enum BackgroundMode of AUDIO_RECORDING
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_017 begin---');

      try {
        let type = backgroundTaskManager.BackgroundMode.AUDIO_RECORDING;
        hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_017 backgroundTaskManager BackgroundMode: ' + type);
        expect(type).assertEqual(3);
        done();
      } catch (error) {
        error = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_017 aa error: %{public}s', JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_017 end---');
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_018
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_018
     * @tc.desc   Test that the backgroundTaskManager enum BackgroundMode of LOCATION
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_018 begin---');

      try {
        let type = backgroundTaskManager.BackgroundMode.LOCATION;
        hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_018 backgroundTaskManager BackgroundMode: ' + type);
        expect(type).assertEqual(4);
        done();
      } catch (error) {
        error = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_018 aa error: %{public}s', JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_018 end---');
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_019
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_019
     * @tc.desc   Test that the backgroundTaskManager enum BackgroundMode of BLUETOOTH_INTERACTION
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_019 begin---');

      try {
        let type = backgroundTaskManager.BackgroundMode.BLUETOOTH_INTERACTION;
        hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_019 backgroundTaskManager BackgroundMode: ' + type);
        expect(type).assertEqual(5);
        done();
      } catch (error) {
        error = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_019 aa error: %{public}s', JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_019 end---');
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_020
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_020
     * @tc.desc   Test that the backgroundTaskManager enum BackgroundMode of MULTI_DEVICE_CONNECTION
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_020 begin---');

      try {
        let type = backgroundTaskManager.BackgroundMode.MULTI_DEVICE_CONNECTION;
        hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_020 backgroundTaskManager BackgroundMode: ' + type);
        expect(type).assertEqual(6);
        done();
      } catch (error) {
        error = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_020 aa error: %{public}s', JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_020 end---');
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_021
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_021
     * @tc.desc   Test that the backgroundTaskManager enum BackgroundMode of VOIP
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_021 begin---');

      try {
        let type = backgroundTaskManager.BackgroundMode.VOIP;
        hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_021 backgroundTaskManager BackgroundMode: ' + type);
        expect(type).assertEqual(8);
        done();
      } catch (error) {
        error = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_021 aa error: %{public}s', JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_021 end---');
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_022
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_022
     * @tc.desc   Test that the backgroundTaskManager enum BackgroundMode of TASK_KEEPING
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_022 begin---');

      try {
        let type = backgroundTaskManager.BackgroundMode.TASK_KEEPING;
        hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_022 backgroundTaskManager BackgroundMode: ' + type);
        expect(type).assertEqual(9);
        done();
      } catch (error) {
        error = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_022 aa error: %{public}s', JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_022 end---');
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_023
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_023
     * @tc.desc   Test that the backgroundTaskManager enum BackgroundSubMode of CAR_KEY
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_023 begin---');

      try {
        let type = backgroundTaskManager.BackgroundSubMode.CAR_KEY;
        hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_023 backgroundTaskManager BackgroundMode: ' + type);
        expect(type).assertEqual(1);
        done();
      } catch (error) {
        error = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_023 aa error: %{public}s', JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_023 end---');
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_024
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_024
     * @tc.desc   Test that the backgroundTaskManager enum BackgroundSubMode of CAR_KEY
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_024 begin---');

      try {
        let type = backgroundTaskManager.BackgroundModeType.SUB_MODE;
        let mode = 'subMode';
        hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_024 backgroundTaskManager BackgroundMode: ' + type);
        expect(type).assertEqual(mode);
        done();
      } catch (error) {
        error = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_024 aa error: %{public}s', JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_024 end---');
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_025
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_025
     * @tc.desc   Test that the updateBackgroundRunning function normal
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_025 begin---');

      try {
        wantAgent.getWantAgent(wantAgentInfos).then((want: _WantAgent) => {
          let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          delegator.getCurrentTopAbility().then((ability: UIAbility) => {

            backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
              hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_025 stopBackgroundRunning promise run success');
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_025 Operation stopBackgroundRunning failed error: %{public}s', JSON.stringify(error));
            });

            let bgModes = ["bluetoothInteraction"]
            let callBackFlag = 0;
            backgroundTaskManager.startBackgroundRunning(ability.context, bgModes, want).then((res: backgroundTaskManager.ContinuousTaskNotification) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_025 startBackgroundRunning promise run success.');
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_025 startBackgroundRunning promise res: %{public}s', JSON.stringify(res));

              let list = ["audioPlayback"];
              backgroundTaskManager.updateBackgroundRunning(ability.context, list).then((res: backgroundTaskManager.ContinuousTaskNotification) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_025 Operation updateBackgroundRunning succeeded');
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_025 updateBackgroundRunning promise res: %{public}s', JSON.stringify(res));
                let continuousTaskId = res.continuousTaskId
                let slotType = res.slotType
                let contentType = res.contentType
                let notificationId = res.notificationId
                hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_025 ContinuousTaskNotification continuousTaskId: '+ continuousTaskId);
                hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_025 ContinuousTaskNotification slotType: '+ slotType);
                hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_025 ContinuousTaskNotification contentType: '+ contentType);
                hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_025 ContinuousTaskNotification notificationId: '+ notificationId);
                expect(res.continuousTaskId).assertLarger(-1);
                expect(res.slotType).assertEqual(4);
                expect(res.contentType).assertEqual(4);
                expect(res.notificationId).assertLarger(-1);

                backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_025 stopBackgroundRunning promise run success');
                }).catch((error: Error) => {
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_025 Operation stopBackgroundRunning failed error: %{public}s', JSON.stringify(error));
                })
                done();
              }).catch((error: Error) => {
                console.error(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_025 updateBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                done();
              });
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_025 startBackgroundRunning promise error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            })

          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_025 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          });
        }).catch((error: Error) => {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_025 getWantAgent error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        })
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_025 aa error: %{public}s', JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_025 end---');
    })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_026
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_026
     * @tc.desc   Test that the backgroundTaskManager enum ContinuousTaskCancelReason of USER_CANCEL_REMOVE_NOTIFICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_026 begin---');

      try {
        let type = backgroundTaskManager.ContinuousTaskCancelReason.USER_CANCEL_REMOVE_NOTIFICATION;
        console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_026 backgroundTaskManager ContinuousTaskCancelReason: ' + type);
        expect(type).assertEqual(3);
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_026 aa error: %{public}s', JSON.stringify(error));
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_026 end---');
    })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_027
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_027
     * @tc.desc   Test that the backgroundTaskManager enum ContinuousTaskCancelReason of SYSTEM_CANCEL_DATA_TRANSFER_LOW_SPEED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_027 begin---');

      try {
        let type = backgroundTaskManager.ContinuousTaskCancelReason.SYSTEM_CANCEL_DATA_TRANSFER_LOW_SPEED;
        console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_027 backgroundTaskManager ContinuousTaskCancelReason: ' + type);
        expect(type).assertEqual(4);
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_027 aa error: %{public}s', JSON.stringify(error));
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_027 end---');
    })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_028
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_028
     * @tc.desc   Test that the backgroundTaskManager enum ContinuousTaskCancelReason of SYSTEM_CANCEL_AUDIO_PLAYBACK_NOT_USE_AVSESSION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_028 begin---');

      try {
        let type = backgroundTaskManager.ContinuousTaskCancelReason.SYSTEM_CANCEL_AUDIO_PLAYBACK_NOT_USE_AVSESSION;
        console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_028 backgroundTaskManager ContinuousTaskCancelReason: ' + type);
        expect(type).assertEqual(5);
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_028 aa error: %{public}s', JSON.stringify(error));
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_028 end---');
    })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_029
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_029
     * @tc.desc   Test that the backgroundTaskManager enum ContinuousTaskCancelReason of SYSTEM_CANCEL_AUDIO_PLAYBACK_NOT_RUNNING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_029 begin---');

      try {
        let type = backgroundTaskManager.ContinuousTaskCancelReason.SYSTEM_CANCEL_AUDIO_PLAYBACK_NOT_RUNNING;
        console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_029 backgroundTaskManager ContinuousTaskCancelReason: ' + type);
        expect(type).assertEqual(6);
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_029 aa error: %{public}s', JSON.stringify(error));
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_029 end---');
    })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_030
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_030
     * @tc.desc   Test that the backgroundTaskManager enum ContinuousTaskCancelReason of SYSTEM_CANCEL_AUDIO_RECORDING_NOT_RUNNING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_030 begin---');

      try {
        let type = backgroundTaskManager.ContinuousTaskCancelReason.SYSTEM_CANCEL_AUDIO_RECORDING_NOT_RUNNING;
        console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_030 backgroundTaskManager ContinuousTaskCancelReason: ' + type);
        expect(type).assertEqual(7);
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_030 aa error: %{public}s', JSON.stringify(error));
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_030 end---');
    })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_031
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_031
     * @tc.desc   Test that the backgroundTaskManager enum ContinuousTaskCancelReason of SYSTEM_CANCEL_NOT_USE_LOCATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_031 begin---');

      try {
        let type = backgroundTaskManager.ContinuousTaskCancelReason.SYSTEM_CANCEL_NOT_USE_LOCATION;
        console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_031 backgroundTaskManager ContinuousTaskCancelReason: ' + type);
        expect(type).assertEqual(8);
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_031 aa error: %{public}s', JSON.stringify(error));
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_031 end---');
    })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_032
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_032
     * @tc.desc   Test that the backgroundTaskManager enum ContinuousTaskCancelReason of SYSTEM_CANCEL_NOT_USE_BLUETOOTH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_032 begin---');

      try {
        let type = backgroundTaskManager.ContinuousTaskCancelReason.SYSTEM_CANCEL_NOT_USE_BLUETOOTH;
        console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_032 backgroundTaskManager ContinuousTaskCancelReason: ' + type);
        expect(type).assertEqual(9);
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_032 aa error: %{public}s', JSON.stringify(error));
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_032 end---');
    })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_033
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_033
     * @tc.desc   Test that the backgroundTaskManager enum ContinuousTaskCancelReason of SYSTEM_CANCEL_NOT_USE_MULTI_DEVICE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_033 begin---');

      try {
        let type = backgroundTaskManager.ContinuousTaskCancelReason.SYSTEM_CANCEL_NOT_USE_MULTI_DEVICE;
        console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_033 backgroundTaskManager ContinuousTaskCancelReason: ' + type);
        expect(type).assertEqual(10);
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_033 aa error: %{public}s', JSON.stringify(error));
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_033 end---');
    })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_034
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_034
     * @tc.desc   Test that the backgroundTaskManager enum ContinuousTaskCancelReason of SYSTEM_CANCEL_USE_ILLEGALLY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_034 begin---');

      try {
        let type = backgroundTaskManager.ContinuousTaskCancelReason.SYSTEM_CANCEL_USE_ILLEGALLY;
        console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_034 backgroundTaskManager ContinuousTaskCancelReason: ' + type);
        expect(type).assertEqual(11);
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_034 aa error: %{public}s', JSON.stringify(error));
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_034 end---');
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_035
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_035
     * @tc.desc   Test that the startBackgroundRunning function normal call with bgModeList and stopBackgroundRunning function normal call
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_035 begin---');

      let callbackFlag = 0;
      let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_035 startBackgroundRunning delegator success.');

      try {
        wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_035 startBackgroundRunning getWantAgent success.');

          delegator.getCurrentTopAbility().then((ability: UIAbility) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_035 startBackgroundRunning getCurrentTopAbility success.');
            let bgModeList = ["location"]
            backgroundTaskManager.startBackgroundRunning(ability.context, bgModeList, want).then((res) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_035 startBackgroundRunning promise run success.');
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_035 startBackgroundRunning promise res: %{public}s', JSON.stringify(res));
              backgroundTaskManager.getAllContinuousTasks(ability.context).then((res: backgroundTaskManager.ContinuousTaskInfo[]) => {
                console.info(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_035 Operation getAllContinuousTasks2 succeeded. data: ` + JSON.stringify(res));
                console.info(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_035 Operation getAllContinuousTasks2 succeeded. abilityName: ` + JSON.stringify(res[0].abilityName));
                console.info(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_035 Operation getAllContinuousTasks2 succeeded. abilityName: ` + JSON.stringify(res[0].uid));
                console.info(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_035 Operation getAllContinuousTasks2 succeeded. abilityName: ` + JSON.stringify(res[0].pid));
                console.info(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_035 Operation getAllContinuousTasks2 succeeded. abilityName: ` + JSON.stringify(res[0].isFromWebView));
                console.info(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_035 Operation getAllContinuousTasks2 succeeded. abilityName: ` + JSON.stringify(res[0].backgroundModes[0]));
                console.info(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_035 Operation getAllContinuousTasks2 succeeded. abilityName: ` + JSON.stringify(res[0].backgroundSubModes.length));
                console.info(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_035 Operation getAllContinuousTasks2 succeeded. abilityName: ` + JSON.stringify(res[0].wantAgentBundleName));
                console.info(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_035 Operation getAllContinuousTasks2 succeeded. abilityName: ` + JSON.stringify(res[0].wantAgentAbilityName));
                let type: string = "location"
                expect(res.length).assertLarger(0);
                expect(res[0].abilityName == "EntryAbility").assertTrue();
                expect(res[0].uid).assertLarger(0);
                expect(res[0].pid).assertLarger(0);
                expect(res[0].isFromWebView == false).assertTrue();
                expect(res[0].backgroundModes[0] == type).assertTrue();
                expect(res[0].backgroundSubModes.length == 0).assertTrue();
                expect(res[0].notificationId).assertLarger(0);
                expect(res[0].continuousTaskId).assertLarger(0);
                expect(res[0].abilityId).assertLarger(0);
                expect(res[0].wantAgentBundleName == "com.acts.actslongtimetasktest.static").assertTrue();
                expect(res[0].wantAgentAbilityName == "EntryAbility").assertTrue();
                backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
                  console.info("SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_035 stopBackgroundRunning promise run success");
                }).catch((error: Error) => {
                  console.error(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_035 Operation stopBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                });
                done();
              }).catch((error: Error) => {
                console.error(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_035 Operation getAllContinuousTasks2 failed. code is ${error.code} message is ${error.message}`);
              });
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_035 startBackgroundRunning promise error: %{public}s', JSON.stringify(error));
            })

          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_035 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          });
        }).catch((error: Error) => {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_035 getWantAgent error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        })
      } catch (error) {
        error = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_035 aa error: %{public}s', JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_035 end---');
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_036
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_036
     * @tc.desc   Test that the startBackgroundRunning function normal call with bgModeList and stopBackgroundRunning function normal call
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_036 begin---');

      let callbackFlag = 0;
      let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_036 startBackgroundRunning delegator success.');

      try {
        wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_036 startBackgroundRunning getWantAgent success.');

          delegator.getCurrentTopAbility().then((ability: UIAbility) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_036 startBackgroundRunning getCurrentTopAbility success.');
            let bgModeList = ["location"];
            let includeSuspended = true;
            backgroundTaskManager.startBackgroundRunning(ability.context, bgModeList, want).then((res) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_036 startBackgroundRunning promise run success.');
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_036 startBackgroundRunning promise res: %{public}s', JSON.stringify(res));
              backgroundTaskManager.getAllContinuousTasks(ability.context, includeSuspended).then((res: backgroundTaskManager.ContinuousTaskInfo[]) => {
                console.info(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_036 Operation getAllContinuousTasks2 succeeded. data: ` + JSON.stringify(res));
                console.info(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_036 Operation getAllContinuousTasks2 succeeded. abilityName: ` + JSON.stringify(res[0].abilityName));
                console.info(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_036 Operation getAllContinuousTasks2 succeeded. uid: ` + JSON.stringify(res[0].uid));
                console.info(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_036 Operation getAllContinuousTasks2 succeeded. pid: ` + JSON.stringify(res[0].pid));
                console.info(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_036 Operation getAllContinuousTasks2 succeeded. isFromWebView: ` + JSON.stringify(res[0].isFromWebView));
                console.info(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_036 Operation getAllContinuousTasks2 succeeded. backgroundModes: ` + JSON.stringify(res[0].backgroundModes[0]));
                console.info(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_036 Operation getAllContinuousTasks2 succeeded. backgroundSubModes: ` + JSON.stringify(res[0].backgroundSubModes.length));
                console.info(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_036 Operation getAllContinuousTasks2 succeeded. wantAgentBundleName: ` + JSON.stringify(res[0].wantAgentBundleName));
                console.info(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_036 Operation getAllContinuousTasks2 succeeded. wantAgentAbilityName: ` + JSON.stringify(res[0].wantAgentAbilityName));
                let type: string = "location"
                expect(res.length).assertLarger(0);
                expect(res[0].abilityName == "EntryAbility").assertTrue();
                expect(res[0].uid).assertLarger(0);
                expect(res[0].pid).assertLarger(0);
                expect(res[0].isFromWebView == false).assertTrue();
                expect(res[0].backgroundModes[0] == type).assertTrue();
                expect(res[0].backgroundSubModes.length == 0).assertTrue();
                expect(res[0].notificationId).assertLarger(0);
                expect(res[0].continuousTaskId).assertLarger(0);
                expect(res[0].abilityId).assertLarger(0);
                expect(res[0].wantAgentBundleName == "com.acts.actslongtimetasktest.static").assertTrue();
                expect(res[0].wantAgentAbilityName == "EntryAbility").assertTrue();
                expect(res[0].suspendState).assertInstanceOf('Boolean');
                expect(res[0].bundleName == "com.acts.actslongtimetasktest.static").assertTrue();
                expect(res[0].appIndex).assertLarger(-1);

                backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
                  console.info("SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_036 stopBackgroundRunning promise run success");
                }).catch((error: Error) => {
                  console.error(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_036 Operation stopBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                });
                done();
              }).catch((error: Error) => {
                console.error(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_036 Operation getAllContinuousTasks2 failed. code is ${error.code} message is ${error.message}`);
              });
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_036 startBackgroundRunning promise error: %{public}s', JSON.stringify(error));
            })

          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_036 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          });
        }).catch((error: Error) => {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_036 getWantAgent error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        })
      } catch (error) {
        error = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_036 aa error: %{public}s', JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_036 end---');
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_037
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_037
     * @tc.desc   Test that the onContinuousTaskCancel callback function normal call
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_037 begin---')
      try {
        let onContinuousTaskCancel = (res: backgroundTaskManager.ContinuousTaskCancelInfo) => {
          console.info(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_037 onContinuousTaskCancel ` + res);
        };
        let callbackFlag = 0
        backgroundTaskManager.onContinuousTaskCancel(onContinuousTaskCancel);
        console.info(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_037 onContinuousTaskCancel callback succeeded. `);
        callbackFlag = 1
        expect(callbackFlag).assertEqual(1);
        done();
      } catch (error) {
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_037 aa error: %{public}s', JSON.stringify(error));
        expect(false).assertTrue();
        done();

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_037 end---');
      }
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_038
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_038
     * @tc.desc   Test that the offContinuousTaskCancel callback function normal call
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_038 begin---')
      try {
        let offContinuousTaskCancel = (res: backgroundTaskManager.ContinuousTaskCancelInfo) => {
          console.info(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_038 offContinuousTaskCancel ` + res);
        };
        let callbackFlag = 0
        backgroundTaskManager.offContinuousTaskCancel(offContinuousTaskCancel);
        console.info(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_038 offContinuousTaskCancel callback succeeded. `);
        callbackFlag = 1
        expect(callbackFlag).assertEqual(1);
        done();
      } catch (error) {
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_038 aa error: %{public}s', JSON.stringify(error));
        expect(false).assertTrue();
        done();

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_038 end---');
      }
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_039
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_039
     * @tc.desc   Test that the onContinuousTaskActive callback function normal call
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_039 begin---')
      try {
        let onContinuousTaskActive = (res: backgroundTaskManager.ContinuousTaskActiveInfo) => {
          console.info(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_039 onContinuousTaskActive ` + res);
        };
        let callbackFlag = 0
        backgroundTaskManager.onContinuousTaskActive(onContinuousTaskActive);
        console.info(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_039 onContinuousTaskActive callback succeeded. `);
        callbackFlag = 1
        expect(callbackFlag).assertEqual(1);
        done();
      } catch (error) {
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_039 aa error: %{public}s', JSON.stringify(error));
        expect(false).assertTrue();
        done();

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_039 end---');
      }
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_040
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_040
     * @tc.desc   Test that the offContinuousTaskActive callback function normal call
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_040 begin---')
      try {
        let offContinuousTaskActive = (res: backgroundTaskManager.ContinuousTaskActiveInfo) => {
          console.info(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_040 offContinuousTaskActive ` + res);
        };
        let callbackFlag = 0
        backgroundTaskManager.offContinuousTaskActive(offContinuousTaskActive);
        console.info(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_040 offContinuousTaskActive callback succeeded. `);
        callbackFlag = 1
        expect(callbackFlag).assertEqual(1);
        done();
      } catch (error) {
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_040 aa error: %{public}s', JSON.stringify(error));
        expect(false).assertTrue();
        done();

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_040 end---');
      }
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_041
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_041
     * @tc.desc   Test that the onContinuousTaskSuspend callback function normal call
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_041 begin---')
      try {
        let onContinuousTaskSuspend = (res: backgroundTaskManager.ContinuousTaskSuspendInfo) => {
          console.info(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_041 onContinuousTaskSuspend ` + res);
        };
        let callbackFlag = 0
        backgroundTaskManager.onContinuousTaskSuspend(onContinuousTaskSuspend);
        console.info(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_041 onContinuousTaskSuspend callback succeeded. `);
        callbackFlag = 1
        expect(callbackFlag).assertEqual(1);
        done();
      } catch (error) {
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_041 aa error: %{public}s', JSON.stringify(error));
        expect(false).assertTrue();
        done();
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_041 end---');
      }
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_042
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_042
     * @tc.desc   Test that the offContinuousTaskSuspend callback function normal call
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_042 begin---')
      try {
        let offContinuousTaskSuspend = (res: backgroundTaskManager.ContinuousTaskSuspendInfo) => {
          console.info(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_042 offContinuousTaskSuspend ` + res);
        };
        let callbackFlag = 0
        backgroundTaskManager.offContinuousTaskSuspend(offContinuousTaskSuspend);
        console.info(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_042 offContinuousTaskSuspend callback succeeded. `);
        callbackFlag = 1
        expect(callbackFlag).assertEqual(1);
        done();
      } catch (error) {
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_042 aa error: %{public}s', JSON.stringify(error));
        expect(false).assertTrue();
        done();

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_042 end---');
      }
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_043
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_043
     * @tc.desc   Test that the startBackgroundRunning callback function normal call with bgMode and stopBackgroundRunning callback function
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_043 begin---');

      let callbackFlag = 0;

      try {
        wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
          let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          delegator.getCurrentTopAbility().then((ability: UIAbility) => {
            let bgMode = backgroundTaskManager.BackgroundMode.AUDIO_RECORDING;
            backgroundTaskManager.startBackgroundRunning(ability.context, bgMode, want,
              (error: BusinessError | null) => {
                callbackFlag = 1;
                if (error) {
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_043 startBackgroundRunning callback error: %{public}s', JSON.stringify(error));
                } else {
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_043 startBackgroundRunning callback run success.');
                  expect(callbackFlag).assertEqual(1);

                  backgroundTaskManager.stopBackgroundRunning(ability.context, (error: BusinessError | null) => {
                    callbackFlag = 2;
                    if (error) {
                      hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_043 stopBackgroundRunning callback error: %{public}s', JSON.stringify(error));
                    } else {
                      hilog.info(DOMAIN, TAG,
                        'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_043 stopBackgroundRunning callback run success.');
                      expect(callbackFlag).assertEqual(2);
                      done();
                    }
                  })
                }
              })

          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_043 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          });
        }).catch((error: Error) => {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_043 getWantAgent error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        })
      } catch (error) {
        error = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_043 aa error: %{public}s', JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_043 end---');
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_044
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_044
     * @tc.desc   Test that the startBackgroundRunning callback function normal call with DATA_TRANSFER and stopBackgroundRunning callback function
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_044 begin---');

      let callbackFlag = 0;

      try {
        wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
          let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          delegator.getCurrentTopAbility().then((ability: UIAbility) => {
            let bgMode = backgroundTaskManager.BackgroundMode.DATA_TRANSFER;
            backgroundTaskManager.startBackgroundRunning(ability.context, bgMode, want,
              (error: BusinessError | null) => {
                callbackFlag = 1;
                if (error) {
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_044 startBackgroundRunning callback error: %{public}s', JSON.stringify(error));
                } else {
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_044 startBackgroundRunning callback run success.');
                  expect(callbackFlag).assertEqual(1);

                  backgroundTaskManager.stopBackgroundRunning(ability.context, (error: BusinessError | null) => {
                    callbackFlag = 2;
                    if (error) {
                      hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_044 stopBackgroundRunning callback error: %{public}s', JSON.stringify(error));
                    } else {
                      hilog.info(DOMAIN, TAG,
                        'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_044 stopBackgroundRunning callback run success.');
                      expect(callbackFlag).assertEqual(2);
                      done();
                    }
                  })
                }
              })

          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_044 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          });
        }).catch((error: Error) => {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_044 getWantAgent error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        })
      } catch (error) {
        error = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_044 aa error: %{public}s', JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_044 end---');
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_045
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_045
     * @tc.desc   Test that the startBackgroundRunning callback function normal call with LOCATION and stopBackgroundRunning callback function
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_045 begin---');

      await Utils.msSleep(1500);

      let callbackFlag = 0;

      try {
        wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
          let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          delegator.getCurrentTopAbility().then((ability: UIAbility) => {
            let bgMode = backgroundTaskManager.BackgroundMode.LOCATION;
            backgroundTaskManager.startBackgroundRunning(ability.context, bgMode, want,
              (error: BusinessError | null) => {
                callbackFlag = 1;
                if (error) {
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_045 startBackgroundRunning callback error: %{public}s', JSON.stringify(error));
                } else {
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_045 startBackgroundRunning callback run success.');
                  expect(callbackFlag).assertEqual(1);

                  backgroundTaskManager.stopBackgroundRunning(ability.context, (error: BusinessError | null) => {
                    callbackFlag = 2;
                    if (error) {
                      hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_045 stopBackgroundRunning callback error: %{public}s', JSON.stringify(error));
                    } else {
                      hilog.info(DOMAIN, TAG,
                        'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_045 stopBackgroundRunning callback run success.');
                      expect(callbackFlag).assertEqual(2);
                      done();
                    }
                  })
                }
              })

          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_045 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          });
        }).catch((error: Error) => {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_045 getWantAgent error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        })
      } catch (error) {
        error = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_045 aa error: %{public}s', JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_045 end---');
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_046
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_046
     * @tc.desc   Test that the startBackgroundRunning callback function normal call with BLUETOOTH_INTERACTION and stopBackgroundRunning callback function
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_046 begin---');

      let callbackFlag = 0;

      try {
        wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
          let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          delegator.getCurrentTopAbility().then((ability: UIAbility) => {
            let bgMode = backgroundTaskManager.BackgroundMode.BLUETOOTH_INTERACTION;
            backgroundTaskManager.startBackgroundRunning(ability.context, bgMode, want,
              (error: BusinessError | null) => {
                callbackFlag = 1;
                if (error) {
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_046 startBackgroundRunning callback error: %{public}s', JSON.stringify(error));
                } else {
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_046 startBackgroundRunning callback run success.');
                  expect(callbackFlag).assertEqual(1);

                  backgroundTaskManager.stopBackgroundRunning(ability.context, (error: BusinessError | null) => {
                    callbackFlag = 2;
                    if (error) {
                      hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_046 stopBackgroundRunning callback error: %{public}s', JSON.stringify(error));
                    } else {
                      hilog.info(DOMAIN, TAG,
                        'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_046 stopBackgroundRunning callback run success.');
                      expect(callbackFlag).assertEqual(2);
                      done();
                    }
                  })
                }
              })

          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_046 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          });
        }).catch((error: Error) => {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_046 getWantAgent error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        })
      } catch (error) {
        error = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_046 aa error: %{public}s', JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_046 end---');
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_047
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_047
     * @tc.desc   Test that the startBackgroundRunning callback function normal call with MULTI_DEVICE_CONNECTION and stopBackgroundRunning callback function
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_047 begin---');

      let callbackFlag = 0;

      try {
        wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
          let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          delegator.getCurrentTopAbility().then((ability: UIAbility) => {
            let bgMode = backgroundTaskManager.BackgroundMode.MULTI_DEVICE_CONNECTION;
            backgroundTaskManager.startBackgroundRunning(ability.context, bgMode, want,
              (error: BusinessError | null) => {
                callbackFlag = 1;
                if (error) {
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_047 startBackgroundRunning callback error: %{public}s', JSON.stringify(error));
                } else {
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_047 startBackgroundRunning callback run success.');
                  expect(callbackFlag).assertEqual(1);

                  backgroundTaskManager.stopBackgroundRunning(ability.context, (error: BusinessError | null) => {
                    callbackFlag = 2;
                    if (error) {
                      hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_047 stopBackgroundRunning callback error: %{public}s', JSON.stringify(error));
                    } else {
                      hilog.info(DOMAIN, TAG,
                        'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_047 stopBackgroundRunning callback run success.');
                      expect(callbackFlag).assertEqual(2);
                      done();
                    }
                  })
                }
              })

          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_047 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          });
        }).catch((error: Error) => {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_047 getWantAgent error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        })
      } catch (error) {
        error = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_047 aa error: %{public}s', JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_047 end---');
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_048
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_048
     * @tc.desc   Test that the startBackgroundRunning callback function normal call with VOIP and stopBackgroundRunning callback function
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_048 begin---');

      let callbackFlag = 0;

      try {
        wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
          let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          delegator.getCurrentTopAbility().then((ability: UIAbility) => {
            let bgMode = backgroundTaskManager.BackgroundMode.VOIP;
            backgroundTaskManager.startBackgroundRunning(ability.context, bgMode, want,
              (error: BusinessError | null) => {
                callbackFlag = 1;
                if (error) {
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_048 startBackgroundRunning callback error: %{public}s', JSON.stringify(error));
                } else {
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_048 startBackgroundRunning callback run success.');
                  expect(callbackFlag).assertEqual(1);

                  backgroundTaskManager.stopBackgroundRunning(ability.context, (error: BusinessError | null) => {
                    callbackFlag = 2;
                    if (error) {
                      hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_048 stopBackgroundRunning callback error: %{public}s', JSON.stringify(error));
                    } else {
                      hilog.info(DOMAIN, TAG,
                        'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_048 stopBackgroundRunning callback run success.');
                      expect(callbackFlag).assertEqual(2);
                      done();
                    }
                  })
                }
              })

          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_048 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          });
        }).catch((error: Error) => {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_048 getWantAgent error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        })
      } catch (error) {
        error = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_048 aa error: %{public}s', JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_048 end---');
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_049
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_049
     * @tc.desc   Test that the startBackgroundRunning callback function normal call with TASK_KEEPING and stopBackgroundRunning callback function
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_049 begin---');

      let callbackFlag = 0;

      try {
        wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
          let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          delegator.getCurrentTopAbility().then((ability: UIAbility) => {
            let bgMode = backgroundTaskManager.BackgroundMode.TASK_KEEPING;
            backgroundTaskManager.startBackgroundRunning(ability.context, bgMode, want,
              (error: BusinessError | null) => {
                callbackFlag = 1;
                if (error) {
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_049 startBackgroundRunning callback error: %{public}s', JSON.stringify(error));
                  expect(error.code).assertEqual(9800005);
                  done();
                } else {
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_049 startBackgroundRunning callback run success.');
                  expect(callbackFlag).assertEqual(1);

                  backgroundTaskManager.stopBackgroundRunning(ability.context, (error: BusinessError | null) => {
                    callbackFlag = 2;
                    if (error) {
                      hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_049 stopBackgroundRunning callback error: %{public}s', JSON.stringify(error));
                    } else {
                      hilog.info(DOMAIN, TAG,
                        'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_049 stopBackgroundRunning callback run success.');
                      expect(callbackFlag).assertEqual(2);
                      done();
                    }
                  })
                }
              })

          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_049 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          });
        }).catch((error: Error) => {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_049 getWantAgent error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        })
      } catch (error) {
        error = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_049 aa error: %{public}s', JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_049 end---');
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_050
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_050
     * @tc.desc   Test that the startBackgroundRunning promise function normal call with DATA_TRANSFER and stopBackgroundRunning promise function
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_050 begin---');

      await Utils.msSleep(1500);

      try {
        wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
          let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          delegator.getCurrentTopAbility().then((ability: UIAbility) => {

            backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
              hilog.info(DOMAIN, TAG, '%{public}s', 'ActsLongTimeTaskManagerTest afterAll stopBackgroundRunning promise run success');
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'ActsLongTimeTaskManagerTest afterAll Operation stopBackgroundRunning failed: %{public}s' + JSON.stringify(error));
            });

            let bgMode = backgroundTaskManager.BackgroundMode.DATA_TRANSFER;
            backgroundTaskManager.startBackgroundRunning(ability.context, bgMode, want).then(() => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_050 startBackgroundRunning promise run success.');
              backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_050 stopBackgroundRunning promise run success.');
              }).catch((error: Error) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_050 Operation stopBackgroundRunning promise failed: %{public}s', JSON.stringify(error));
              });
              done();
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_050 startBackgroundRunning promise error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            })

          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_050 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          });
        }).catch((error: Error) => {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_050 getWantAgent error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        })
      } catch (error) {
        error = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_050 aa error: %{public}s', JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_050 end---');
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_051
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_051
     * @tc.desc   Test that the startBackgroundRunning promise function normal call with AUDIO_RECORDING and stopBackgroundRunning promise function
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_051 begin---');

      try {
        wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
          let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          delegator.getCurrentTopAbility().then((ability: UIAbility) => {

            backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
              hilog.info(DOMAIN, TAG, '%{public}s', 'ActsLongTimeTaskManagerTest afterAll stopBackgroundRunning promise run success');
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'ActsLongTimeTaskManagerTest afterAll Operation stopBackgroundRunning failed: %{public}s' + JSON.stringify(error));
            });

            let bgMode = backgroundTaskManager.BackgroundMode.AUDIO_RECORDING;
            backgroundTaskManager.startBackgroundRunning(ability.context, bgMode, want).then(() => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_051 startBackgroundRunning promise run success.');
              backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_051 stopBackgroundRunning promise run success.');
              }).catch((error: Error) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_051 Operation stopBackgroundRunning promise failed: %{public}s', JSON.stringify(error));
              });
              done();
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_051 startBackgroundRunning promise error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            })

          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_051 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          });
        }).catch((error: Error) => {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_051 getWantAgent error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        })
      } catch (error) {
        error = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_051 aa error: %{public}s', JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_051 end---');
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_052
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_052
     * @tc.desc   Test that the startBackgroundRunning promise function normal call with LOCATION and stopBackgroundRunning promise function
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_052 begin---');

      try {
        wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
          let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          delegator.getCurrentTopAbility().then((ability: UIAbility) => {

            backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
              hilog.info(DOMAIN, TAG, '%{public}s', 'ActsLongTimeTaskManagerTest afterAll stopBackgroundRunning promise run success');
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'ActsLongTimeTaskManagerTest afterAll Operation stopBackgroundRunning failed: %{public}s' + JSON.stringify(error));
            });

            let bgMode = backgroundTaskManager.BackgroundMode.LOCATION;
            backgroundTaskManager.startBackgroundRunning(ability.context, bgMode, want).then(() => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_052 startBackgroundRunning promise run success.');
              backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_052 stopBackgroundRunning promise run success.');
              }).catch((error: Error) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_052 Operation stopBackgroundRunning promise failed: %{public}s', JSON.stringify(error));
              });
              done();
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_052 startBackgroundRunning promise error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            })

          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_052 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          });
        }).catch((error: Error) => {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_052 getWantAgent error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        })
      } catch (error) {
        error = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_052 aa error: %{public}s', JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_052 end---');
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_053
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_053
     * @tc.desc   Test that the startBackgroundRunning promise function normal call with BLUETOOTH_INTERACTION and stopBackgroundRunning promise function
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_053 begin---');

      try {
        wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
          let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          delegator.getCurrentTopAbility().then((ability: UIAbility) => {

            backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
              hilog.info(DOMAIN, TAG, '%{public}s', 'ActsLongTimeTaskManagerTest afterAll stopBackgroundRunning promise run success');
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'ActsLongTimeTaskManagerTest afterAll Operation stopBackgroundRunning failed: %{public}s' + JSON.stringify(error));
            });

            let bgMode = backgroundTaskManager.BackgroundMode.BLUETOOTH_INTERACTION;
            backgroundTaskManager.startBackgroundRunning(ability.context, bgMode, want).then(() => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_053 startBackgroundRunning promise run success.');
              backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_053 stopBackgroundRunning promise run success.');
              }).catch((error: Error) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_053 Operation stopBackgroundRunning promise failed: %{public}s', JSON.stringify(error));
              });
              done();
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_053 startBackgroundRunning promise error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            })

          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_053 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          });
        }).catch((error: Error) => {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_053 getWantAgent error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        })
      } catch (error) {
        error = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_053 aa error: %{public}s', JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_053 end---');
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_054
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_054
     * @tc.desc   Test that the startBackgroundRunning promise function normal call with MULTI_DEVICE_CONNECTION and stopBackgroundRunning promise function
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_054 begin---');

      try {
        wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
          let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          delegator.getCurrentTopAbility().then((ability: UIAbility) => {

            backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
              hilog.info(DOMAIN, TAG, '%{public}s', 'ActsLongTimeTaskManagerTest afterAll stopBackgroundRunning promise run success');
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'ActsLongTimeTaskManagerTest afterAll Operation stopBackgroundRunning failed: %{public}s' + JSON.stringify(error));
            });

            let bgMode = backgroundTaskManager.BackgroundMode.MULTI_DEVICE_CONNECTION;
            backgroundTaskManager.startBackgroundRunning(ability.context, bgMode, want).then(() => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_054 startBackgroundRunning promise run success.');
              backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_054 stopBackgroundRunning promise run success.');
              }).catch((error: Error) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_054 Operation stopBackgroundRunning promise failed: %{public}s', JSON.stringify(error));
              });
              done();
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_054 startBackgroundRunning promise error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            })

          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_054 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          });
        }).catch((error: Error) => {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_054 getWantAgent error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        })
      } catch (error) {
        error = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_054 aa error: %{public}s', JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_054 end---');
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_055
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_055
     * @tc.desc   Test that the startBackgroundRunning promise function normal call with VOIP and stopBackgroundRunning promise function
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_055 begin---');

      await Utils.msSleep(1500);

      try {
        wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
          let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          delegator.getCurrentTopAbility().then((ability: UIAbility) => {

            backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
              hilog.info(DOMAIN, TAG, '%{public}s', 'ActsLongTimeTaskManagerTest afterAll stopBackgroundRunning promise run success');
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'ActsLongTimeTaskManagerTest afterAll Operation stopBackgroundRunning failed: %{public}s' + JSON.stringify(error));
            });

            let bgMode = backgroundTaskManager.BackgroundMode.VOIP;
            backgroundTaskManager.startBackgroundRunning(ability.context, bgMode, want).then(() => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_055 startBackgroundRunning promise run success.');
              backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_055 stopBackgroundRunning promise run success.');
              }).catch((error: Error) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_055 Operation stopBackgroundRunning promise failed: %{public}s', JSON.stringify(error));
              });
              done();
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_055 startBackgroundRunning promise error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            })

          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_055 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          });
        }).catch((error: Error) => {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_055 getWantAgent error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        })
      } catch (error) {
        error = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_055 aa error: %{public}s', JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_055 end---');
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_056
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_056
     * @tc.desc   Test that the startBackgroundRunning promise function normal call with TASK_KEEPING and stopBackgroundRunning promise function
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_056 begin---');

      try {
        wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
          let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          delegator.getCurrentTopAbility().then((ability: UIAbility) => {

            backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
              hilog.info(DOMAIN, TAG, '%{public}s', 'ActsLongTimeTaskManagerTest afterAll stopBackgroundRunning promise run success');
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'ActsLongTimeTaskManagerTest afterAll Operation stopBackgroundRunning failed: %{public}s' + JSON.stringify(error));
            });

            let bgMode = backgroundTaskManager.BackgroundMode.TASK_KEEPING;
            backgroundTaskManager.startBackgroundRunning(ability.context, bgMode, want).then(() => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_056 startBackgroundRunning promise run success.');
              backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_056 stopBackgroundRunning promise run success.');
              }).catch((error: Error) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_056 Operation stopBackgroundRunning promise failed: %{public}s', JSON.stringify(error));
              });
              done();
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_056 startBackgroundRunning promise error: %{public}s', JSON.stringify(error));
              expect(error.code).assertEqual(9800005);
              done();
            })

          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_056 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          });
        }).catch((error: Error) => {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_056 getWantAgent error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        })
      } catch (error) {
        error = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_056 aa error: %{public}s', JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_056 end---');
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_5700
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_5700
     * @tc.desc   Test that the api21 startBackgroundRunning function interface with MODE_LOCATION
     * @tc.level  Level 3
     * @tc.type   Function
     * @tc.size   MediumTest
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done:() => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_5700 begin---');

        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let modeList: Array<backgroundTaskManager.BackgroundTaskMode> = [backgroundTaskManager.BackgroundTaskMode.MODE_LOCATION];
              let subModeList: Array<backgroundTaskManager.BackgroundTaskSubmode> = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_NORMAL_NOTIFICATION];
              let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
              continuousTaskRequest.backgroundTaskModes = modeList;
              continuousTaskRequest.backgroundTaskSubmodes = subModeList;
              continuousTaskRequest.wantAgent = want;
              continuousTaskRequest.combinedTaskNotification = false;
              continuousTaskRequest.continuousTaskId = -1;
              backgroundTaskManager.startBackgroundRunning(ability.context, continuousTaskRequest).then((res: backgroundTaskManager.ContinuousTaskNotification) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_5700 startBackgroundRunning promise run success.');
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_5700 startBackgroundRunning promise res: %{public}s', JSON.stringify(res));
                continuousTaskRequest.continuousTaskId = res.continuousTaskId
                expect(res.continuousTaskId).assertLarger(-1);
                expect(res.slotType).assertEqual(4);
                expect(res.contentType).assertEqual(4);
                expect(res.notificationId).assertLarger(-1);

                backgroundTaskManager.updateBackgroundRunning(ability.context, continuousTaskRequest).then((res: backgroundTaskManager.ContinuousTaskNotification) => {
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_5700 updateBackgroundRunning promise res: %{public}s', JSON.stringify(res));
                  console.info("SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_5700 Operation updateBackgroundRunning succeeded");
                  expect(res.continuousTaskId).assertLarger(-1);
                  expect(res.slotType).assertEqual(4);
                  expect(res.contentType).assertEqual(4);
                  expect(res.notificationId).assertLarger(-1);

                  backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
                    hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_5700 stopBackgroundRunning promise run success.');
                  }).catch((error: Error) => {
                    console.error(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_5700 stopBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                    done();
                  });
                  done();
                }).catch((error: Error) => {
                  console.error(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_5700 updateBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                  backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
                    hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_5700 stopBackgroundRunning promise catch run success.');
                  }).catch((error: Error) => {
                    hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_5700 Operation stopBackgroundRunning promise catch failed: %{public}s', JSON.stringify(error));
                    done();
                  });
                });
              }).catch((error: Error) => {
                console.error(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_5700 startBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                expect(false).assertTrue();
                done();
              })
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_5700 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_5700 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_5700 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_5700 end---');
      });

    /**
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_5800
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_5800
     * @tc.desc   Test that the api21 startBackgroundRunning function interface with MODE_AUDIO_PLAYBACK
     * @tc.level  Level 3
     * @tc.type   Function
     * @tc.size   MediumTest
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done:() => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_5800 begin---');

        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let modeList: Array<backgroundTaskManager.BackgroundTaskMode> = [backgroundTaskManager.BackgroundTaskMode.MODE_AUDIO_PLAYBACK];
              let subModeList: Array<backgroundTaskManager.BackgroundTaskSubmode> = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_NORMAL_NOTIFICATION];
              let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
              continuousTaskRequest.backgroundTaskModes = modeList;
              continuousTaskRequest.backgroundTaskSubmodes = subModeList;
              continuousTaskRequest.wantAgent = want;
              continuousTaskRequest.combinedTaskNotification = false;
              continuousTaskRequest.continuousTaskId = -1;
              backgroundTaskManager.startBackgroundRunning(ability.context, continuousTaskRequest).then((res: backgroundTaskManager.ContinuousTaskNotification) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_5800 startBackgroundRunning promise run success.');
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_5800 startBackgroundRunning promise res: %{public}s', JSON.stringify(res));
                continuousTaskRequest.continuousTaskId = res.continuousTaskId
                expect(res.continuousTaskId).assertLarger(-1);
                expect(res.slotType).assertEqual(4);
                expect(res.contentType).assertEqual(4);
                expect(res.notificationId).assertLarger(-1);

                backgroundTaskManager.updateBackgroundRunning(ability.context, continuousTaskRequest).then((res: backgroundTaskManager.ContinuousTaskNotification) => {
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_5800 updateBackgroundRunning promise res: %{public}s', JSON.stringify(res));
                  console.info("SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_5800 Operation updateBackgroundRunning succeeded");
                  expect(res.continuousTaskId).assertLarger(-1);
                  expect(res.slotType).assertEqual(4);
                  expect(res.contentType).assertEqual(4);
                  expect(res.notificationId).assertLarger(-1);

                  backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
                    hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_5800 stopBackgroundRunning promise run success.');
                  }).catch((error: Error) => {
                    console.error(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_5800 stopBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                    done();
                  });
                  done();
                }).catch((error: Error) => {
                  console.error(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_5800 updateBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                  backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
                    hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_5800 stopBackgroundRunning promise catch run success.');
                  }).catch((error: Error) => {
                    hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_5800 Operation stopBackgroundRunning promise catch failed: %{public}s', JSON.stringify(error));
                    done();
                  });
                });
              }).catch((error: Error) => {
                console.error(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_5800 startBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                expect(false).assertTrue();
                done();
              })
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_5800 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_5800 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_5800 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_5800 end---');
      });

    /**
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_5900
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_5900
     * @tc.desc   Test that the api21 startBackgroundRunning function interface with MODE_AUDIO_RECORDING
     * @tc.level  Level 3
     * @tc.type   Function
     * @tc.size   MediumTest
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done:() => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_5900 begin---');

        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let modeList: Array<backgroundTaskManager.BackgroundTaskMode> = [backgroundTaskManager.BackgroundTaskMode.MODE_AUDIO_RECORDING];
              let subModeList: Array<backgroundTaskManager.BackgroundTaskSubmode> = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_NORMAL_NOTIFICATION];
              let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
              continuousTaskRequest.backgroundTaskModes = modeList;
              continuousTaskRequest.backgroundTaskSubmodes = subModeList;
              continuousTaskRequest.wantAgent = want;
              continuousTaskRequest.combinedTaskNotification = false;
              continuousTaskRequest.continuousTaskId = -1;
              backgroundTaskManager.startBackgroundRunning(ability.context, continuousTaskRequest).then((res: backgroundTaskManager.ContinuousTaskNotification) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_5900 startBackgroundRunning promise run success.');
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_5900 startBackgroundRunning promise res: %{public}s', JSON.stringify(res));
                continuousTaskRequest.continuousTaskId = res.continuousTaskId
                expect(res.continuousTaskId).assertLarger(-1);
                expect(res.slotType).assertEqual(4);
                expect(res.contentType).assertEqual(4);
                expect(res.notificationId).assertLarger(-1);

                backgroundTaskManager.updateBackgroundRunning(ability.context, continuousTaskRequest).then((res: backgroundTaskManager.ContinuousTaskNotification) => {
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_5900 updateBackgroundRunning promise res: %{public}s', JSON.stringify(res));
                  console.info("SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_5900 Operation updateBackgroundRunning succeeded");
                  expect(res.continuousTaskId).assertLarger(-1);
                  expect(res.slotType).assertEqual(4);
                  expect(res.contentType).assertEqual(4);
                  expect(res.notificationId).assertLarger(-1);

                  backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
                    hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_5900 stopBackgroundRunning promise run success.');
                  }).catch((error: Error) => {
                    console.error(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_5900 stopBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                    done();
                  });
                  done();
                }).catch((error: Error) => {
                  console.error(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_5900 updateBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                  backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
                    hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_5900 stopBackgroundRunning promise catch run success.');
                  }).catch((error: Error) => {
                    hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_5900 Operation stopBackgroundRunning promise catch failed: %{public}s', JSON.stringify(error));
                    done();
                  });
                });
              }).catch((error: Error) => {
                console.error(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_5900 startBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                expect(false).assertTrue();
                done();
              })
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_5900 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_5900 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_5900 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_5900 end---');
      });

    /**
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6000
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6000
     * @tc.desc   Test that the api21 startBackgroundRunning function interface with MODE_AUDIO_RECORDING
     * @tc.level  Level 3
     * @tc.type   Function
     * @tc.size  MediumTest
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done:() => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6000 begin---');

        await Utils.msSleep(1500);

        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let modeList: Array<backgroundTaskManager.BackgroundTaskMode> = [backgroundTaskManager.BackgroundTaskMode.MODE_DATA_TRANSFER];
              let subModeList: Array<backgroundTaskManager.BackgroundTaskSubmode> = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_LIVE_VIEW_NOTIFICATION];
              let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
              continuousTaskRequest.backgroundTaskModes = modeList;
              continuousTaskRequest.backgroundTaskSubmodes = subModeList;
              continuousTaskRequest.wantAgent = want;
              continuousTaskRequest.combinedTaskNotification = false;
              continuousTaskRequest.continuousTaskId = -1;
              backgroundTaskManager.startBackgroundRunning(ability.context, continuousTaskRequest).then((res: backgroundTaskManager.ContinuousTaskNotification) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6000 startBackgroundRunning promise run success.');
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6000 startBackgroundRunning promise res: %{public}s', JSON.stringify(res));
                expect(res.continuousTaskId).assertLarger(-1);
                expect(res.slotType).assertEqual(4);
                expect(res.contentType).assertEqual(4);
                expect(res.notificationId).assertLarger(-1);

                backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6000 stopBackgroundRunning promise run success.');
                  done();
                }).catch((error: Error) => {
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6000 Operation stopBackgroundRunning promise catch failed: %{public}s', JSON.stringify(error));
                  done();
                });
              }).catch((error: Error) => {
                console.error(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6000 startBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                expect(false).assertTrue();
                done();
              })
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6000 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6000 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6000 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6000 end---');
      });

    /**
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6100
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6100
     * @tc.desc   Test that the api21 startBackgroundRunning function interface with MODE_BLUETOOTH_INTERACTION and BackgroundTaskSubmode is SUBMODE_NORMAL_NOTIFICATION
     * @tc.level  Level 3
     * @tc.type   Function
     * @tc.size  MediumTest
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done:() => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6100 begin---');

        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let modeList: Array<backgroundTaskManager.BackgroundTaskMode> = [backgroundTaskManager.BackgroundTaskMode.MODE_BLUETOOTH_INTERACTION];
              let subModeList: Array<backgroundTaskManager.BackgroundTaskSubmode> = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_NORMAL_NOTIFICATION];
              let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
              continuousTaskRequest.backgroundTaskModes = modeList;
              continuousTaskRequest.backgroundTaskSubmodes = subModeList;
              continuousTaskRequest.wantAgent = want;
              continuousTaskRequest.combinedTaskNotification = false;
              continuousTaskRequest.continuousTaskId = -1;
              backgroundTaskManager.startBackgroundRunning(ability.context, continuousTaskRequest).then((res: backgroundTaskManager.ContinuousTaskNotification) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6100 startBackgroundRunning promise run success.');
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6100 startBackgroundRunning promise res: %{public}s', JSON.stringify(res));
                continuousTaskRequest.continuousTaskId = res.continuousTaskId
                expect(res.continuousTaskId).assertLarger(-1);
                expect(res.slotType).assertEqual(4);
                expect(res.contentType).assertEqual(4);
                expect(res.notificationId).assertLarger(-1);

                backgroundTaskManager.updateBackgroundRunning(ability.context, continuousTaskRequest).then((res: backgroundTaskManager.ContinuousTaskNotification) => {
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6100 updateBackgroundRunning promise res: %{public}s', JSON.stringify(res));
                  console.info("SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6100 Operation updateBackgroundRunning succeeded");
                  expect(res.continuousTaskId).assertLarger(-1);
                  expect(res.slotType).assertEqual(4);
                  expect(res.contentType).assertEqual(4);
                  expect(res.notificationId).assertLarger(-1);

                  backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
                    hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6100 stopBackgroundRunning promise run success.');
                  }).catch((error: Error) => {
                    console.error(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6100 stopBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                    done();
                  });
                  done();
                }).catch((error: Error) => {
                  console.error(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6100 updateBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                  backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
                    hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6100 stopBackgroundRunning promise catch run success.');
                  }).catch((error: Error) => {
                    hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6100 Operation stopBackgroundRunning promise catch failed: %{public}s', JSON.stringify(error));
                    done();
                  });
                });
              }).catch((error: Error) => {
                console.error(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6100 startBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                expect(false).assertTrue();
                done();
              })
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6100 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6100 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6100 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6100 end---');
      });

    /**
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6200
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6200
     * @tc.desc   Test that the api21 startBackgroundRunning function interface with MODE_BLUETOOTH_INTERACTION and BackgroundTaskSubmode is SUBMODE_CAR_KEY_NORMAL_NOTIFICATION
     * @tc.level  Level 3
     * @tc.type   Function
     * @tc.size  MediumTest
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done:() => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6200 begin---');

        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let modeList: Array<backgroundTaskManager.BackgroundTaskMode> = [backgroundTaskManager.BackgroundTaskMode.MODE_BLUETOOTH_INTERACTION];
              let subModeList: Array<backgroundTaskManager.BackgroundTaskSubmode> = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_CAR_KEY_NORMAL_NOTIFICATION];
              let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
              continuousTaskRequest.backgroundTaskModes = modeList;
              continuousTaskRequest.backgroundTaskSubmodes = subModeList;
              continuousTaskRequest.wantAgent = want;
              continuousTaskRequest.combinedTaskNotification = false;
              continuousTaskRequest.continuousTaskId = -1;
              backgroundTaskManager.startBackgroundRunning(ability.context, continuousTaskRequest).then((res: backgroundTaskManager.ContinuousTaskNotification) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6200 startBackgroundRunning promise run success.');
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6200 startBackgroundRunning promise res: %{public}s', JSON.stringify(res));
                continuousTaskRequest.continuousTaskId = res.continuousTaskId
                expect(res.continuousTaskId).assertLarger(-1);
                expect(res.slotType).assertEqual(4);
                expect(res.contentType).assertEqual(4);
                expect(res.notificationId).assertLarger(-1);

                backgroundTaskManager.updateBackgroundRunning(ability.context, continuousTaskRequest).then((res: backgroundTaskManager.ContinuousTaskNotification) => {
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6200 updateBackgroundRunning promise res: %{public}s', JSON.stringify(res));
                  console.info("SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6200 Operation updateBackgroundRunning succeeded");
                  expect(res.continuousTaskId).assertLarger(-1);
                  expect(res.slotType).assertEqual(4);
                  expect(res.contentType).assertEqual(4);
                  expect(res.notificationId).assertLarger(-1);

                  backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
                    hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6200 stopBackgroundRunning promise run success.');
                  }).catch((error: Error) => {
                    console.error(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6200 stopBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                    done();
                  });
                  done();
                }).catch((error: Error) => {
                  console.error(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6200 updateBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                  backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
                    hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6200 stopBackgroundRunning promise catch run success.');
                  }).catch((error: Error) => {
                    hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6200 Operation stopBackgroundRunning promise catch failed: %{public}s', JSON.stringify(error));
                    done();
                  });
                });
              }).catch((error: Error) => {
                console.error(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6200 startBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                expect(false).assertTrue();
                done();
              })
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6200 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6200 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6200 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6200 end---');
      });

    /**
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6300
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6300
     * @tc.desc   Test that the api21 startBackgroundRunning function interface with MODE_MULTI_DEVICE_CONNECTION
     * @tc.level  Level 3
     * @tc.type   Function
     * @tc.size  MediumTest
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done:() => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6300 begin---');

        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let modeList: Array<backgroundTaskManager.BackgroundTaskMode> = [backgroundTaskManager.BackgroundTaskMode.MODE_MULTI_DEVICE_CONNECTION];
              let subModeList: Array<backgroundTaskManager.BackgroundTaskSubmode> = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_NORMAL_NOTIFICATION];
              let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
              continuousTaskRequest.backgroundTaskModes = modeList;
              continuousTaskRequest.backgroundTaskSubmodes = subModeList;
              continuousTaskRequest.wantAgent = want;
              continuousTaskRequest.combinedTaskNotification = false;
              continuousTaskRequest.continuousTaskId = -1;
              backgroundTaskManager.startBackgroundRunning(ability.context, continuousTaskRequest).then((res: backgroundTaskManager.ContinuousTaskNotification) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6300 startBackgroundRunning promise run success.');
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6300 startBackgroundRunning promise res: %{public}s', JSON.stringify(res));
                continuousTaskRequest.continuousTaskId = res.continuousTaskId
                expect(res.continuousTaskId).assertLarger(-1);
                expect(res.slotType).assertEqual(4);
                expect(res.contentType).assertEqual(4);
                expect(res.notificationId).assertLarger(-1);

                backgroundTaskManager.updateBackgroundRunning(ability.context, continuousTaskRequest).then((res: backgroundTaskManager.ContinuousTaskNotification) => {
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6300 updateBackgroundRunning promise res: %{public}s', JSON.stringify(res));
                  console.info("SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6300 Operation updateBackgroundRunning succeeded");
                  expect(res.continuousTaskId).assertLarger(-1);
                  expect(res.slotType).assertEqual(4);
                  expect(res.contentType).assertEqual(4);
                  expect(res.notificationId).assertLarger(-1);

                  backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
                    hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6300 stopBackgroundRunning promise run success.');
                  }).catch((error: Error) => {
                    console.error(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6300 stopBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                    done();
                  });
                  done();
                }).catch((error: Error) => {
                  console.error(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6300 updateBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                  backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
                    hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6300 stopBackgroundRunning promise catch run success.');
                  }).catch((error: Error) => {
                    hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6300 Operation stopBackgroundRunning promise catch failed: %{public}s', JSON.stringify(error));
                    done();
                  });
                });
              }).catch((error: Error) => {
                console.error(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6300 startBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                expect(false).assertTrue();
                done();
              })
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6300 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6300 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6300 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6300 end---');
      });

    /**
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6400
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6400
     * @tc.desc   Test that the api21 startBackgroundRunning function interface with MODE_VOIP
     * @tc.level  Level 3
     * @tc.type   Function
     * @tc.size  MediumTest
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done:() => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6400 begin---');

        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let modeList: Array<backgroundTaskManager.BackgroundTaskMode> = [backgroundTaskManager.BackgroundTaskMode.MODE_VOIP];
              let subModeList: Array<backgroundTaskManager.BackgroundTaskSubmode> = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_NORMAL_NOTIFICATION];
              let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
              continuousTaskRequest.backgroundTaskModes = modeList;
              continuousTaskRequest.backgroundTaskSubmodes = subModeList;
              continuousTaskRequest.wantAgent = want;
              continuousTaskRequest.combinedTaskNotification = false;
              continuousTaskRequest.continuousTaskId = -1;
              backgroundTaskManager.startBackgroundRunning(ability.context, continuousTaskRequest).then((res: backgroundTaskManager.ContinuousTaskNotification) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6400 startBackgroundRunning promise run success.');
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6400 startBackgroundRunning promise res: %{public}s', JSON.stringify(res));
                continuousTaskRequest.continuousTaskId = res.continuousTaskId
                expect(res.continuousTaskId).assertLarger(-1);
                expect(res.slotType).assertEqual(4);
                expect(res.contentType).assertEqual(4);
                expect(res.notificationId).assertLarger(-1);

                backgroundTaskManager.updateBackgroundRunning(ability.context, continuousTaskRequest).then((res: backgroundTaskManager.ContinuousTaskNotification) => {
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6400 updateBackgroundRunning promise res: %{public}s', JSON.stringify(res));
                  console.info("SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6400 Operation updateBackgroundRunning succeeded");
                  expect(res.continuousTaskId).assertLarger(-1);
                  expect(res.slotType).assertEqual(4);
                  expect(res.contentType).assertEqual(4);
                  expect(res.notificationId).assertLarger(-1);

                  backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
                    hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6400 stopBackgroundRunning promise run success.');
                  }).catch((error: Error) => {
                    console.error(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6400 stopBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                    done();
                  });
                  done();
                }).catch((error: Error) => {
                  console.error(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6400 updateBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                  backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
                    hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6400 stopBackgroundRunning promise catch run success.');
                  }).catch((error: Error) => {
                    hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6400 Operation stopBackgroundRunning promise catch failed: %{public}s', JSON.stringify(error));
                    done();
                  });
                });
              }).catch((error: Error) => {
                console.error(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6400 startBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                expect(false).assertTrue();
                done();
              })
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6400 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6400 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6400 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6400 end---');
      });

    /**
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6500
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6500
     * @tc.desc   Test that the api21 startBackgroundRunning function interface with BackgroundTaskMode is MODE_TASK_KEEPING
     * @tc.level  Level 3
     * @tc.type   Function
     * @tc.size   MediumTest
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done:() => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6500 begin---');

        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let modeList: Array<backgroundTaskManager.BackgroundTaskMode> = [backgroundTaskManager.BackgroundTaskMode.MODE_TASK_KEEPING];
              let subModeList: Array<backgroundTaskManager.BackgroundTaskSubmode> = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_NORMAL_NOTIFICATION];
              let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
              continuousTaskRequest.backgroundTaskModes = modeList;
              continuousTaskRequest.backgroundTaskSubmodes = subModeList;
              continuousTaskRequest.wantAgent = want;
              continuousTaskRequest.combinedTaskNotification = false;
              continuousTaskRequest.continuousTaskId = -1;
              backgroundTaskManager.startBackgroundRunning(ability.context, continuousTaskRequest).then((res: backgroundTaskManager.ContinuousTaskNotification) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6500 startBackgroundRunning promise run success.');
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6500 startBackgroundRunning promise res: %{public}s', JSON.stringify(res));

                expect(res.continuousTaskId).assertLarger(-1);
                expect(res.slotType).assertEqual(4);
                expect(res.contentType).assertEqual(4);
                expect(res.notificationId).assertLarger(-1);
                backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6500 stopBackgroundRunning promise run success.');
                }).catch((error: Error) => {
                  console.error(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6500 stopBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                  done();
                });
                done();
              }).catch((error: Error) => {
                console.error(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6500 startBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                expect(error.code === 9800005).assertTrue();
                done();
              })
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6500 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6500 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6500 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6500 end---');
      });

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6600
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6600
     * @tc.desc   Test that the continuousTaskRequest function checkSpecialScenarioAuth error call and errocode is 9800005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done:() => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6600 begin---');

        try {
          let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
          wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              continuousTaskRequest.checkSpecialScenarioAuth(ability.context).then((res: backgroundTaskManager.UserAuthResult) => {
                console.info("SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6600 Operation checkSpecialScenarioAuth succeeded. data: " + JSON.stringify(res));
              }).catch((error: Error) => {
                console.error(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6600 Operation checkSpecialScenarioAuth failed. code is ${error.code} message is ${error.message}`);
                expect(error.code).assertEqual(9800005);
                done();
              });
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6600 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6600 getWantAgent error: %{public}s', JSON.stringify(error));
          })
        } catch (error) {
          console.error(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6600 Operation checkSpecialScenarioAuth failed. code is ${(error as BusinessError).code} message is ${(error as BusinessError).message}`);
        }
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6700
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6700
     * @tc.desc   Test that the continuousTaskRequest function requestAuthFromUser error call and errocode is 9800005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done:() => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6700 begin---');

        let callbackAuth = (authResult: backgroundTaskManager.UserAuthResult) => {
          console.info("SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6700 Operation requestAuthFromUser success. auth result: " + JSON.stringify(authResult));
        };

        let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6700 try begin---');
        wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
          let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          delegator.getCurrentTopAbility().then((ability: UIAbility) => {
            try {
              hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6700 requestAuthFromUser try begin---');
              continuousTaskRequest.requestAuthFromUser(ability.context, callbackAuth);
            } catch (error) {
              console.error(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6700 Operation requestAuthFromUser failed. code is ${(error as BusinessError).code} message is ${(error as BusinessError).message}`);
              expect(error.code === 9800005).assertTrue();
              done();
              hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6700 requestAuthFromUser try end---');
            }
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6700 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
          });
        }).catch((error: Error) => {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6700 getWantAgent error: %{public}s', JSON.stringify(error));
        })

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6700 end---');
      })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6800
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6800
     * @tc.desc   Test that the api21 startBackgroundRunning function interface with continuousTaskId is invalid
     * @tc.level  Level 3
     * @tc.type   Function
     * @tc.size   MediumTest
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done:() => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6800 begin---');

        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let modeList: Array<backgroundTaskManager.BackgroundTaskMode> = [backgroundTaskManager.BackgroundTaskMode.MODE_SPECIAL_SCENARIO_PROCESSING];
              let subModeList: Array<backgroundTaskManager.BackgroundTaskSubmode> = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_MEDIA_PROCESS_NORMAL_NOTIFICATION];
              let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
              continuousTaskRequest.backgroundTaskModes = modeList;
              continuousTaskRequest.backgroundTaskSubmodes = subModeList;
              continuousTaskRequest.wantAgent = want;
              continuousTaskRequest.combinedTaskNotification = true;
              continuousTaskRequest.continuousTaskId = 10000;
              backgroundTaskManager.startBackgroundRunning(ability.context, continuousTaskRequest).then((res: backgroundTaskManager.ContinuousTaskNotification) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6800 startBackgroundRunning promise run success.');
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6800 startBackgroundRunning promise res: %{public}s', JSON.stringify(res));

              }).catch((error: Error) => {
                console.error(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6800 startBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                expect(error.code === 9800005).assertTrue();
                done();
              })
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6800 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6800 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6800 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6800 end---');
      });

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6900
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6900
     * @tc.desc   Test that the backgroundTaskManager isModeSupported function res is true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done:() => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6900 begin---');

        let isModeSupported: boolean = false;
        let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
        let modeList: Array<backgroundTaskManager.BackgroundTaskMode> = [backgroundTaskManager.BackgroundTaskMode.MODE_LOCATION];
        continuousTaskRequest.backgroundTaskModes = modeList;
        try {
          isModeSupported = continuousTaskRequest.isModeSupported();
          console.info(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6900 Operation isModeSupported succeeded. isModeSupported is ${isModeSupported}`);
          expect(isModeSupported === true).assertTrue();
          done();
        } catch (error) {
          console.error(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_6900 Operation startBackgroundRunning failed. code is ${(error as BusinessError).code} message is ${(error as BusinessError).message}`);
          expect(false).assertTrue();
          done();
        }

      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7000
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7000
     * @tc.desc   Test that the backgroundTaskManager isModeSupported function res is false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done:() => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7000 begin---');

        let isModeSupported: boolean = false;
        let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
        let modeList: Array<backgroundTaskManager.BackgroundTaskMode> = [backgroundTaskManager.BackgroundTaskMode.MODE_SPECIAL_SCENARIO_PROCESSING];
        continuousTaskRequest.backgroundTaskModes = modeList;
        try {
          isModeSupported = continuousTaskRequest.isModeSupported();
          console.info(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7000 Operation isModeSupported succeeded. isModeSupported is ${isModeSupported}`);
          expect(isModeSupported === false).assertTrue();
          done();
        } catch (error) {
          console.error(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7000 Operation startBackgroundRunning failed. code is ${(error as BusinessError).code} message is ${(error as BusinessError).message}`);
          expect(error.code === 9800005).assertTrue();
          done();
        }

      })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7100
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7100
     * @tc.desc   Test that the api21 startBackgroundRunning function interface with BackgroundTaskMode is MODE_SPECIAL_SCENARIO_PROCESSING and BackgroundTaskSubmode is SUBMODE_MEDIA_PROCESS_NORMAL_NOTIFICATION
     * @tc.level  Level 3
     * @tc.type   Function
     * @tc.size   MediumTest
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done:() => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7100 begin---');

        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let modeList: Array<backgroundTaskManager.BackgroundTaskMode> = [backgroundTaskManager.BackgroundTaskMode.MODE_SPECIAL_SCENARIO_PROCESSING];
              let subModeList: Array<backgroundTaskManager.BackgroundTaskSubmode> = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_MEDIA_PROCESS_NORMAL_NOTIFICATION];
              let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
              continuousTaskRequest.backgroundTaskModes = modeList;
              continuousTaskRequest.backgroundTaskSubmodes = subModeList;
              continuousTaskRequest.wantAgent = want;
              continuousTaskRequest.combinedTaskNotification = false;
              continuousTaskRequest.continuousTaskId = -1;
              backgroundTaskManager.startBackgroundRunning(ability.context, continuousTaskRequest).then((res: backgroundTaskManager.ContinuousTaskNotification) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7100 startBackgroundRunning promise run success.');
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7100 startBackgroundRunning promise res: %{public}s', JSON.stringify(res));

              }).catch((error: Error) => {
                console.error(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7100 startBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                expect(error.code === 9800005).assertTrue();
                done();
              })
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7100 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7100 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7100 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7100 end---');
      });

    /**
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7200
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7200
     * @tc.desc   Test that the api21 startBackgroundRunning function interface with BackgroundTaskMode is MODE_SPECIAL_SCENARIO_PROCESSING and BackgroundTaskSubmode is SUBMODE_VIDEO_BROADCAST_NORMAL_NOTIFICATION
     * @tc.level  Level 3
     * @tc.type   Function
     * @tc.size   MediumTest
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done:() => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7200 begin---');

        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let modeList: Array<backgroundTaskManager.BackgroundTaskMode> = [backgroundTaskManager.BackgroundTaskMode.MODE_SPECIAL_SCENARIO_PROCESSING];
              let subModeList: Array<backgroundTaskManager.BackgroundTaskSubmode> = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_VIDEO_BROADCAST_NORMAL_NOTIFICATION];
              let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
              continuousTaskRequest.backgroundTaskModes = modeList;
              continuousTaskRequest.backgroundTaskSubmodes = subModeList;
              continuousTaskRequest.wantAgent = want;
              continuousTaskRequest.combinedTaskNotification = false;
              continuousTaskRequest.continuousTaskId = -1;
              backgroundTaskManager.startBackgroundRunning(ability.context, continuousTaskRequest).then((res: backgroundTaskManager.ContinuousTaskNotification) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7200 startBackgroundRunning promise run success.');
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7200 startBackgroundRunning promise res: %{public}s', JSON.stringify(res));
              }).catch((error: Error) => {
                console.error(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7200 startBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                expect(error.code === 9800005).assertTrue();
                done();
              })
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7200 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7200 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7200 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7200 end---');
      });

    /**
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7300
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7300
     * @tc.desc   Test that the api21 startBackgroundRunning function interface with BackgroundTaskMode is MODE_SPECIAL_SCENARIO_PROCESSING and BackgroundTaskSubmode is SUBMODE_WORK_OUT_NORMAL_NOTIFICATION
     * @tc.level  Level 3
     * @tc.type   Function
     * @tc.size   MediumTest
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done:() => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7300 begin---');

        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let modeList: Array<backgroundTaskManager.BackgroundTaskMode> = [backgroundTaskManager.BackgroundTaskMode.MODE_SPECIAL_SCENARIO_PROCESSING];
              let subModeList: Array<backgroundTaskManager.BackgroundTaskSubmode> = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_WORK_OUT_NORMAL_NOTIFICATION];
              let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
              continuousTaskRequest.backgroundTaskModes = modeList;
              continuousTaskRequest.backgroundTaskSubmodes = subModeList;
              continuousTaskRequest.wantAgent = want;
              continuousTaskRequest.combinedTaskNotification = false;
              continuousTaskRequest.continuousTaskId = -1;
              backgroundTaskManager.startBackgroundRunning(ability.context, continuousTaskRequest).then((res: backgroundTaskManager.ContinuousTaskNotification) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7300 startBackgroundRunning promise run success.');
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7300 startBackgroundRunning promise res: %{public}s', JSON.stringify(res));
              }).catch((error: Error) => {
                console.error(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7300 startBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                expect(error.code === 9800005).assertTrue();
                done();
              })
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7300 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7300 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7300 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7300 end---');
      });

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7400
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7400
     * @tc.desc   Test that the backgroundTaskManager enum UserAuthResult of NOT_SUPPORTED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7400 begin---');

      try {
        let type = backgroundTaskManager.UserAuthResult.NOT_SUPPORTED;
        console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7400 backgroundTaskManager UserAuthResult: ' + type);
        expect(type).assertEqual(0);
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7400 end---');
    })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7500
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7500
     * @tc.desc   Test that the backgroundTaskManager enum UserAuthResult of NOT_DETERMINED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7500 begin---');

      try {
        let type = backgroundTaskManager.UserAuthResult.NOT_DETERMINED;
        console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7500 backgroundTaskManager UserAuthResult: ' +
          type);
        expect(type).assertEqual(1);
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7500 end---');
    })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7600
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7600
     * @tc.desc   Test that the backgroundTaskManager enum UserAuthResult of DENIED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7600 begin---');

      try {
        let type = backgroundTaskManager.UserAuthResult.DENIED;
        console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7600 backgroundTaskManager UserAuthResult: ' +
          type);
        expect(type).assertEqual(2);
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7600 end---');
    })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7700
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7700
     * @tc.desc   Test that the backgroundTaskManager enum GRANTED_ALWAYS of GRANTED_ALWAYS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7700 begin---');

      try {
        let type: number = backgroundTaskManager.UserAuthResult.GRANTED_ONCE;
        console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7700 backgroundTaskManager UserAuthResult: ' +
          type);
        expect(type).assertEqual(3);
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7700 end---');
    })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7800
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7800
     * @tc.desc   Test that the backgroundTaskManager enum UserAuthResult of GRANTED_ONCE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7800 begin---');

      try {
        let type = backgroundTaskManager.UserAuthResult.GRANTED_ALWAYS;
        console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7800 backgroundTaskManager UserAuthResult: ' +
          type);
        expect(type).assertEqual(4);
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7800 end---');
    })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7900
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7900
     * @tc.desc   Test that the backgroundTaskManager enum BackgroundTaskMode of MODE_AV_PLAYBACK_AND_RECORD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7900 begin---');

      try {
        let type = backgroundTaskManager.BackgroundTaskMode.MODE_AV_PLAYBACK_AND_RECORD;
        console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7900 backgroundTaskManager BackgroundTaskMode: ' +
          type);
        expect(type).assertEqual(12);
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_7900 end---');
    })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_8000
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_8000
     * @tc.desc   Test that the backgroundTaskManager enum BackgroundTaskSubmode of SUBMODE_AUDIO_PLAYBACK_NORMAL_NOTIFICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_8000 begin---');

      try {
        let type = backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_AUDIO_PLAYBACK_NORMAL_NOTIFICATION;
        console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_8000 backgroundTaskManager BackgroundTaskSubmode: ' +
          type);
        expect(type).assertEqual(4);
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_8000 end---');
    })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_8100
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_8100
     * @tc.desc   Test that the backgroundTaskManager enum BackgroundTaskSubmode of SUBMODE_AUDIO_PLAYBACK_NORMAL_NOTIFICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_8100 begin---');

      try {
        let type = backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_AVSESSION_AUDIO_PLAYBACK;
        console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_8100 backgroundTaskManager BackgroundTaskSubmode: ' +
          type);
        expect(type).assertEqual(5);
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_8100 end---');
    })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_8200
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_8200
     * @tc.desc   Test that the backgroundTaskManager enum BackgroundTaskSubmode of SUBMODE_AUDIO_RECORD_NORMAL_NOTIFICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_8200 begin---');

      try {
        let type = backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_AUDIO_RECORD_NORMAL_NOTIFICATION;
        console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_8200 backgroundTaskManager BackgroundTaskSubmode: ' +
          type);
        expect(type).assertEqual(6);
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_8200 end---');
    })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_8300
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_8300
     * @tc.desc   Test that the backgroundTaskManager enum BackgroundTaskSubmode of SUBMODE_SCREEN_RECORD_NORMAL_NOTIFICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_8300 begin---');

      try {
        let type = backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_SCREEN_RECORD_NORMAL_NOTIFICATION;
        console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_8300 backgroundTaskManager BackgroundTaskSubmode: ' +
          type);
        expect(type).assertEqual(7);
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_8300 end---');
    })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_8400
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_8400
     * @tc.desc   Test that the backgroundTaskManager enum BackgroundTaskSubmode of SUBMODE_VOICE_CHAT_NORMAL_NOTIFICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_8400 begin---');

      try {
        let type = backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_VOICE_CHAT_NORMAL_NOTIFICATION;
        console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_8400 backgroundTaskManager BackgroundTaskSubmode: ' +
          type);
        expect(type).assertEqual(8);
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_8400 end---');
    })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_8500
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_8500
     * @tc.desc   Test that the backgroundTaskManager enum BackgroundTaskSubmode of SUBMODE_MEDIA_PROCESS_NORMAL_NOTIFICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_8500 begin---');

      try {
        let type = backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_MEDIA_PROCESS_NORMAL_NOTIFICATION;
        console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_8500 backgroundTaskManager BackgroundTaskSubmode: ' +
          type);
        expect(type).assertEqual(9);
        done();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_8500 end---');
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_001
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_001
     * @tc.desc   Test that the stopBackgroundRunning callback function and errocode is 9800005
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_001 begin---');

      try {
        wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
          let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          delegator.getCurrentTopAbility().then((ability: UIAbility) => {
            backgroundTaskManager.stopBackgroundRunning(ability.context,
              (error: BusinessError | null) => {
                if (error) {
                  console.error(`SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_001 stopBackgroundRunning callback failed. code is ${error.code} message is ${error.message}`);
                  expect(error.code).assertEqual(9800005);
                  done();
                } else {
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_001 stopBackgroundRunning callback run success.');
                  expect(false).assertTrue();
                  done();
                }
              })
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_001 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          });
        }).catch((error: Error) => {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_001 getWantAgent error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        })
      } catch (error) {
        let e: Error = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_001 aa error: %{public}s', JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_001 end---');
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_002
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_002
     * @tc.desc   Test that the startBackgroundRunning callback function error call with bgMode and errocode is 202
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_002 begin---');

      try {
        wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
          let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          delegator.getCurrentTopAbility().then((ability: UIAbility) => {
            let bgMode =backgroundTaskManager.BackgroundMode.WIFI_INTERACTION;
            backgroundTaskManager.startBackgroundRunning(ability.context, bgMode, want,
              (error: BusinessError | null) => {
                if (error) {
                  console.error(`SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_002 startBackgroundRunning promise failed. code is ${error.code} message is ${error.message}`);
                  expect(error.code == 202).assertTrue();
                  done();
                } else {
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_002 startBackgroundRunning callback run success.');
                }
              })
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_002 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          });
        }).catch((error: Error) => {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_002 getWantAgent error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        })
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_002 aa error: %{public}s', JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_002 end---');
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_003
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_003
     * @tc.desc   Test that the startBackgroundRunning promise function error call with bgMode and errocode is 202
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_003 begin---');

      try {
        wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
          let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          delegator.getCurrentTopAbility().then((ability: UIAbility) => {
            let bgMode =backgroundTaskManager.BackgroundMode.WIFI_INTERACTION;
            backgroundTaskManager.startBackgroundRunning(ability.context, bgMode, want).then(() => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_003 startBackgroundRunning promise run success.');
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_003 startBackgroundRunning promise error: %{public}s', JSON.stringify(error));
              console.error(`SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_003 startBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
              expect(error.code == 202).assertTrue();
              done();
            })
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_003 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          });
        }).catch((error: Error) => {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_003 getWantAgent error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        })
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_003 aa error: %{public}s', JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_003 end---');
    })


    /**
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_004
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_004
     * @tc.desc   Test that the startBackgroundRunning promise function error call with bgModeList and errocode is 9800005
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_004 begin---');

      try {
        wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
          let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          delegator.getCurrentTopAbility().then((ability: UIAbility) => {
            let bgModeList = ["location"]
            backgroundTaskManager.startBackgroundRunning(ability.context, bgModeList, want).then((res) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_004 startBackgroundRunning promise run success.');

              backgroundTaskManager.startBackgroundRunning(ability.context, bgModeList, want).then((res) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_004 startBackgroundRunning2 promise run success.');
              }).catch((error: Error) => {
                console.error(`SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_004 startBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                expect(error.code).assertEqual(9800005);
                backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
                  console.info("SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_004 stopBackgroundRunning promise run success");
                }).catch((error: Error) => {
                  console.error(`SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_004 Operation stopBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                });
                done();
              })
              done();
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_004 startBackgroundRunning promise error: %{public}s', JSON.stringify(error));
            })

          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_004 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          });
        }).catch((error: Error) => {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_004 getWantAgent error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        })
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_004 aa error: %{public}s', JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_004 end---');
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_005
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_005
     * @tc.desc   Test that the startBackgroundRunning callback function error call with bgMode and errocode is 9800005
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_005 begin---');

      try {
        wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
          let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          delegator.getCurrentTopAbility().then((ability: UIAbility) => {
            let bgMode = backgroundTaskManager.BackgroundMode.AUDIO_PLAYBACK;
            backgroundTaskManager.startBackgroundRunning(ability.context, bgMode, want,
              (error: BusinessError | null, data) => {
                if (error) {
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_005 startBackgroundRunning callback error: %{public}s', JSON.stringify(error));
                } else {
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_005 startBackgroundRunning callback run success.');
                  backgroundTaskManager.startBackgroundRunning(ability.context, bgMode, want,
                    (error: BusinessError | null, data) => {
                      if (error) {
                        console.error(`SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_005 startBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                        expect(error.code).assertEqual(9800005);
                        backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
                          console.info("SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_005 stopBackgroundRunning promise run success");
                        }).catch((error: Error) => {
                          console.error(`SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_005 Operation stopBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                        });
                        done();
                      } else {
                        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_005 startBackgroundRunning2 callback run success.');
                        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_005 startBackgroundRunning2 callback res: %{public}s', JSON.stringify(data));
                      }
                    })
                }
                done();
              })
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_005 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          });
        }).catch((error: Error) => {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_005 getWantAgent error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        })
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_005 aa error: %{public}s', JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_005 end---');
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_006
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_006
     * @tc.desc   Test that the updateBackgroundRunning promise function error call with bgModeList and errocode is 9800005
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_006 begin---');

      try {
        wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
          let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          delegator.getCurrentTopAbility().then((ability: UIAbility) => {
            backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
              console.info("SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_006 stopBackgroundRunning promise run success");
            }).catch((error: Error) => {
              console.error(`SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_006 Operation stopBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
            });

            let bgModeList = ["location"]
            backgroundTaskManager.updateBackgroundRunning(ability.context, bgModeList).then((res) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_006 updateBackgroundRunning promise run success.');
            }).catch((error: Error) => {
              console.error(`SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_006 startBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
              expect(error.code == 9800005).assertTrue();
              done();
            })

          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_006 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          });
        }).catch((error: Error) => {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_006 getWantAgent error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        })
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_006 aa error: %{public}s', JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_006 end---');
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_007
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_007
     * @tc.desc   Test that the stopBackgroundRunning promise function error call and errocode is 9800005
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_007 begin---');

      try {
        wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
          let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          delegator.getCurrentTopAbility().then((ability: UIAbility) => {
            backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
              console.info("SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_007 stopBackgroundRunning promise run success");
            }).catch((error: Error) => {
              console.error(`SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_007 Operation stopBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
            });
            backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
              console.info("SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_007 stopBackgroundRunning2 promise run success");
            }).catch((error: Error) => {
              console.error(`SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_007 Operation stopBackgroundRunning2 failed. code is ${error.code} message is ${error.message}`);
              expect(error.code == 9800005).assertTrue();
              done();
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_007 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          });
        }).catch((error: Error) => {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_007 getWantAgent error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        })
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_007 aa error: %{public}s', JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_007 end---');
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_008
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_008
     * @tc.desc   Test that the startBackgroundRunning promise function error call with bgMode and errocode is 9800005
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_008 begin---');

      try {
        wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
          let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          delegator.getCurrentTopAbility().then((ability: UIAbility) => {
            let bgMode = backgroundTaskManager.BackgroundMode.AUDIO_PLAYBACK;
            backgroundTaskManager.startBackgroundRunning(ability.context, bgMode, want).then(() => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_008 startBackgroundRunning promise run success.');

              backgroundTaskManager.startBackgroundRunning(ability.context, bgMode, want).then(() => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_008 startBackgroundRunning promise run success.');
              }).catch((error: Error) => {
                console.error(`SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_008 startBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                expect(error.code == 9800005).assertTrue();
                backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
                  console.info("SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_008 stopBackgroundRunning promise run success");
                }).catch((error: Error) => {
                  console.error(`SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_008 Operation stopBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                  done();
                });
                done();
              })
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_008 startBackgroundRunning promise error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            })
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_008 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          });
        }).catch((error: Error) => {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_008 getWantAgent error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        })
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_008 aa error: %{public}s', JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_STATIC_XTS_008 end---');
    })

  })
}