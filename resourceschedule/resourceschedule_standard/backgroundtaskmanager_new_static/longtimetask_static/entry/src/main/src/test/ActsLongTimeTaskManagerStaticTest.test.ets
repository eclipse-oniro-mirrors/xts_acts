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
                  done();
                }).catch((error: Error) => {
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_025 updateBackgroundRunning promise error: %{public}s', JSON.stringify(error));

                });
                backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_025 stopBackgroundRunning promise run success');
                }).catch((error: Error) => {
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_025 Operation stopBackgroundRunning failed error: %{public}s', JSON.stringify(error));
                })
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