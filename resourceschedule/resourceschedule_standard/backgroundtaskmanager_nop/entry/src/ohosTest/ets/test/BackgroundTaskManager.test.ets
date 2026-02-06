/*
 * Copyright (C) 2024-2025 Huawei Device Co., Ltd.
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

const PERMISSION_DENIED_CODE = 201

export default function BackgroundTaskManagerTest() {
  describe('ActsBackgroundTaskManagerTest', () => {

    let wantAgentInfo: wantAgent.WantAgentInfo;

    beforeAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'beforeAll called');
      wantAgentInfo = {
        wants: [
          {
            bundleName: "ohos.acts.resourceschedule.taskmgr.nop.function",
            abilityName: "ohos.acts.resourceschedule.taskmgr.nop.function.TestAbility"
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
     * @tc.number:SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_001
     * @tc.name:SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_001
     * @tc.desc:Test that the startBackgroundRunning function interface does not request ohos.permission.KEEP_BACKGROUND_RUNNING permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_001 begin---');

        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let bgMode = backgroundTaskManager.BackgroundMode.AUDIO_PLAYBACK;
              backgroundTaskManager.startBackgroundRunning(ability.context, bgMode, want).then(() => {
                hilog.info(DOMAIN, TAG, 'startBackgroundRunning promise run success.');
                expect(false).assertTrue();
                done();
              }).catch((error: BusinessError) => {
                hilog.info(DOMAIN, TAG, 'startBackgroundRunning promise error: %{public}s', JSON.stringify(error));
                expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
                done();
              })
            }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: BusinessError) => {
            hilog.info(DOMAIN, TAG, 'getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_001 end---');
      })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_002
     * @tc.name:SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_002
     * @tc.desc:Test that the startBackgroundRunning function interface does not request ohos.permission.KEEP_BACKGROUND_RUNNING permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_002 begin---');

        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let bgMode = backgroundTaskManager.BackgroundMode.AUDIO_PLAYBACK;
              backgroundTaskManager.startBackgroundRunning(ability.context, bgMode, want,
                (error: BusinessError, data: void) => {
                  if (error) {
                    hilog.info(DOMAIN, TAG, 'startBackgroundRunning callback error: %{public}s', JSON.stringify(error));
                    expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
                  } else {
                    hilog.info(DOMAIN, TAG, 'startBackgroundRunning callback run success.');
                    expect(false).assertTrue();
                  }
                  done();
                })
            })
              .catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'getCurrentTopAbility error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
              done();
            });
          }).catch((error: BusinessError) => {
            hilog.info(DOMAIN, TAG, 'getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_002 end---');
      })

      /*
     * @tc.number:SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_003
     * @tc.name:SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_003
     * @tc.desc:Test that the updateBackgroundRunning function interface does not request ohos.permission.KEEP_BACKGROUND_RUNNING permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_003 begin---');

        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let list = ["audioPlayback"];
              backgroundTaskManager.updateBackgroundRunning(ability.context, list).then(() => {
                hilog.info(DOMAIN, TAG, 'updateBackgroundRunning promise run success.');
                expect(false).assertTrue();
                done();
              }).catch((error: BusinessError) => {
                hilog.info(DOMAIN, TAG, 'updateBackgroundRunning promise error: %{public}s', JSON.stringify(error));
                expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
                done();
              })
            }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: BusinessError) => {
            hilog.info(DOMAIN, TAG, 'getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_003 end---');
      })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_004
     * @tc.name:SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_004
     * @tc.desc:Test that the on function interface does not request ohos.permission.KEEP_BACKGROUND_RUNNING permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_004 begin---');

        try {
          let callback = (ContinuousTaskCancelInfo: backgroundTaskManager.ContinuousTaskCancelInfo) => {
            console.info('continuousTaskCancel callback id ' + ContinuousTaskCancelInfo.id);
            console.info('continuousTaskCancel callback reason ' + ContinuousTaskCancelInfo.reason);
          }

          try {
            backgroundTaskManager.on("continuousTaskCancel", callback);
          } catch (error) {
            console.error(`Operation onContinuousTaskCancel failed. code is ${(error as BusinessError).code} message is ${(error as BusinessError).message}`);
            expect(error.code == 201).assertTrue();
            done();
          }
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_004 end---');
      })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_005
     * @tc.name:SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_005
     * @tc.desc:Test that the off function interface does not request ohos.permission.KEEP_BACKGROUND_RUNNING permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_005 begin---');

        try {
          let callback = (ContinuousTaskCancelInfo: backgroundTaskManager.ContinuousTaskCancelInfo) => {
            console.info('continuousTaskCancel callback id ' + ContinuousTaskCancelInfo.id);
            console.info('continuousTaskCancel callback reason ' + ContinuousTaskCancelInfo.reason);
          }

          try {
            backgroundTaskManager.off("continuousTaskCancel", callback);
          } catch (error) {
            console.error(`Operation offContinuousTaskCancel failed. code is ${(error as BusinessError).code} message is ${(error as BusinessError).message}`);
            expect(error.code == 201).assertTrue();
            done();
          }
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_005 end---');
      })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_006
     * @tc.name:SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_006
     * @tc.desc:Test that the startBackgroundRunning function interface does not request ohos.permission.KEEP_BACKGROUND_RUNNING permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_006 begin---');

        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let bgModeList = ["location"]
              backgroundTaskManager.startBackgroundRunning(ability.context, bgModeList, want).then(() => {
                hilog.info(DOMAIN, TAG, 'startBackgroundRunning12 promise run success.');
                expect(false).assertTrue();
                done();
              }).catch((error: BusinessError) => {
                hilog.info(DOMAIN, TAG, 'startBackgroundRunning12 promise error: %{public}s', JSON.stringify(error));
                expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
                done();
              })
            }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: BusinessError) => {
            hilog.info(DOMAIN, TAG, 'getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_006 end---');
      })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_007
     * @tc.name:SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_007
     * @tc.desc:Test that the suspend on function interface does not request ohos.permission.KEEP_BACKGROUND_RUNNING permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_007 begin---');

        try {
          let callback = (ContinuousTaskSuspendInfo: backgroundTaskManager.ContinuousTaskSuspendInfo) => {
            console.info('continuousTaskSuspend callback continuousTaskId: ' + ContinuousTaskSuspendInfo.continuousTaskId);
            console.info('continuousTaskSuspend callback suspendState: ' + ContinuousTaskSuspendInfo.suspendState);
            console.info('continuousTaskSuspend callback suspendReason: ' + ContinuousTaskSuspendInfo.suspendReason);
          }

          try {
            backgroundTaskManager.on("continuousTaskSuspend", callback);
          } catch (error) {
            console.error(`SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_007 Operation continuousTaskSuspend failed. code is ${(error as BusinessError).code} message is ${(error as BusinessError).message}`);
            expect(error.code == 201).assertTrue();
            done();
          }
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_007 end---');
      })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_008
     * @tc.name:SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_008
     * @tc.desc:Test that the suspend off function interface does not request ohos.permission.KEEP_BACKGROUND_RUNNING permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_008 begin---');

        try {
          let callback = (ContinuousTaskSuspendInfo: backgroundTaskManager.ContinuousTaskSuspendInfo) => {
            console.info('continuousTaskSuspend callback continuousTaskId: ' + ContinuousTaskSuspendInfo.continuousTaskId);
            console.info('continuousTaskSuspend callback suspendState: ' + ContinuousTaskSuspendInfo.suspendState);
            console.info('continuousTaskSuspend callback suspendReason: ' + ContinuousTaskSuspendInfo.suspendReason);
          }

          try {
            backgroundTaskManager.off("continuousTaskSuspend", callback);
          } catch (error) {
            console.error(`SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_008 Operation offContinuousTaskSuspend failed. code is ${(error as BusinessError).code} message is ${(error as BusinessError).message}`);
            expect(error.code == 201).assertTrue();
            done();
          }
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_008 end---');
      })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_009
     * @tc.name:SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_009
     * @tc.desc:Test that the active on function interface does not request ohos.permission.KEEP_BACKGROUND_RUNNING permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_009 begin---');

        try {
          let callback = (ContinuousTaskActiveInfo: backgroundTaskManager.ContinuousTaskActiveInfo) => {
            console.info('continuousTaskActive callback id: ' + ContinuousTaskActiveInfo.id);
          }

          try {
            backgroundTaskManager.on("continuousTaskActive", callback);
          } catch (error) {
            console.error(`SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_009 Operation continuousTaskActive failed. code is ${(error as BusinessError).code} message is ${(error as BusinessError).message}`);
            expect(error.code == 201).assertTrue();
            done();
          }
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_009 end---');
      })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_010
     * @tc.name:SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_010
     * @tc.desc:Test that the active off function interface does not request ohos.permission.KEEP_BACKGROUND_RUNNING permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_010 begin---');

        try {
          let callback = (ContinuousTaskActiveInfo: backgroundTaskManager.ContinuousTaskActiveInfo) => {
            console.info('continuousTaskActive callback id: ' + ContinuousTaskActiveInfo.id);
          }

          try {
            backgroundTaskManager.off("continuousTaskActive", callback);
          } catch (error) {
            console.error(`SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_010 Operation offContinuousTaskActive failed. code is ${(error as BusinessError).code} message is ${(error as BusinessError).message}`);
            expect(error.code == 201).assertTrue();
            done();
          }
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_010 end---');
      })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_011
     * @tc.name:SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_011
     * @tc.desc:Test that the startBackgroundRunning function interface does not request ohos.permission.KEEP_BACKGROUND_RUNNING permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_011 begin---');

        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              backgroundTaskManager.getAllContinuousTasks(ability.context).then(() => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_011 startBackgroundRunning promise run success.');
                expect(false).assertTrue();
                done();
              }).catch((error: BusinessError) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_011 startBackgroundRunning promise error: %{public}s', JSON.stringify(error));
                expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
                done();
              })
            }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_011 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: BusinessError) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_011 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_011 end---');
      })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_012
     * @tc.name:SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_012
     * @tc.desc:Test that the startBackgroundRunning function interface does not request ohos.permission.KEEP_BACKGROUND_RUNNING permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_012 begin---');

        try {
          let includeSuspended = true
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              backgroundTaskManager.getAllContinuousTasks(ability.context, includeSuspended).then(() => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_012 startBackgroundRunning promise run success.');
                expect(false).assertTrue();
                done();
              }).catch((error: BusinessError) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_012 startBackgroundRunning promise error: %{public}s', JSON.stringify(error));
                expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
                done();
              })
            }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_012 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: BusinessError) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_012 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_012 end---');
      })

  })
}

