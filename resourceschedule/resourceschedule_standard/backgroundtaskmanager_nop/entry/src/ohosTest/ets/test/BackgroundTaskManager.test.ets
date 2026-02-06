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


    /**
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_001
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_001
     * @tc.desc   Test that the startBackgroundRunning function interface does not request ohos.permission.KEEP_BACKGROUND_RUNNING permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_002
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_002
     * @tc.desc   Test that the startBackgroundRunning function interface does not request ohos.permission.KEEP_BACKGROUND_RUNNING permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_003
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_003
     * @tc.desc   Test that the updateBackgroundRunning function interface does not request ohos.permission.KEEP_BACKGROUND_RUNNING permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_004
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_004
     * @tc.desc   Test that the on function interface does not request ohos.permission.KEEP_BACKGROUND_RUNNING permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_005
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_005
     * @tc.desc   Test that the off function interface does not request ohos.permission.KEEP_BACKGROUND_RUNNING permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_006
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_006
     * @tc.desc   Test that the startBackgroundRunning function interface does not request ohos.permission.KEEP_BACKGROUND_RUNNING permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_007
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_007
     * @tc.desc   Test that the suspend on function interface does not request ohos.permission.KEEP_BACKGROUND_RUNNING permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_008
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_008
     * @tc.desc   Test that the suspend off function interface does not request ohos.permission.KEEP_BACKGROUND_RUNNING permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_009
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_009
     * @tc.desc   Test that the active on function interface does not request ohos.permission.KEEP_BACKGROUND_RUNNING permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_010
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_010
     * @tc.desc   Test that the active off function interface does not request ohos.permission.KEEP_BACKGROUND_RUNNING permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_011
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_011
     * @tc.desc   Test that the startBackgroundRunning function interface does not request ohos.permission.KEEP_BACKGROUND_RUNNING permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_012
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_012
     * @tc.desc   Test that the startBackgroundRunning function interface does not request ohos.permission.KEEP_BACKGROUND_RUNNING permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
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

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_013
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_013
     * @tc.desc   Test that the  api12 updateBackgroundRunning function interface does not request ohos.permission.KEEP_BACKGROUND_RUNNING permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_013 begin---');

        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let modeList: Array<number> = [backgroundTaskManager.BackgroundTaskMode.MODE_LOCATION];
              let subModeList: Array<number> = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_NORMAL_NOTIFICATION];
              let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
              continuousTaskRequest.backgroundTaskModes =  modeList;
              continuousTaskRequest.backgroundTaskSubmodes = subModeList;
              continuousTaskRequest.wantAgent = want;
              continuousTaskRequest.combinedTaskNotification = false;
              continuousTaskRequest.continuousTaskId = 1000;
              backgroundTaskManager.updateBackgroundRunning(ability.context, continuousTaskRequest).then((res: backgroundTaskManager.ContinuousTaskNotification) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_013 updateBackgroundRunning promise res: %{public}s', JSON.stringify(res));
                console.info("SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_013 Operation updateBackgroundRunning succeeded");
              }).catch((error: BusinessError) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_013 updateBackgroundRunning promise error: %{public}s', JSON.stringify(error));
                expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
                done();
              });
            }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_013 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: BusinessError) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_013 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_013 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_013 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_014
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_014
     * @tc.desc   Test that the api12 startBackgroundRunning function interface does not request ohos.permission.KEEP_BACKGROUND_RUNNING permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_014 begin---');

        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let modeList: Array<number> = [backgroundTaskManager.BackgroundTaskMode.MODE_LOCATION];
              let subModeList: Array<number> = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_NORMAL_NOTIFICATION];
              let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
              continuousTaskRequest.backgroundTaskModes =  modeList;
              continuousTaskRequest.backgroundTaskSubmodes = subModeList;
              continuousTaskRequest.wantAgent = want;
              continuousTaskRequest.combinedTaskNotification = false;
              continuousTaskRequest.continuousTaskId = 0;
              backgroundTaskManager.startBackgroundRunning(ability.context, continuousTaskRequest).then((res: backgroundTaskManager.ContinuousTaskNotification) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_014 startBackgroundRunning promise run success.');
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_014 startBackgroundRunning promise res: %{public}s', JSON.stringify(res));
              }).catch((error: BusinessError) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_014 startBackgroundRunning promise error: %{public}s', JSON.stringify(error));
                expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
                done();
              })
            }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_014 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: BusinessError) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_014 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_014 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_014 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_015
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_015
     * @tc.desc   Test that the backgroundTaskManager isModeSupported function interface does not request ohos.permission.KEEP_BACKGROUND_RUNNING permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_015 begin---');

        let isModeSupported: boolean = false;
        let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
        let modeList: Array<number> = [backgroundTaskManager.BackgroundTaskMode.MODE_TASK_KEEPING];
        continuousTaskRequest.backgroundTaskModes = modeList;
        try {
          isModeSupported = continuousTaskRequest.isModeSupported();
          console.info(`SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_015 Operation isModeSupported succeeded. isModeSupported is ${isModeSupported}`);
        } catch (error) {
          console.error(`SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_015 Operation startBackgroundRunning failed. code is ${(error as BusinessError).code} message is ${(error as BusinessError).message}`);
          expect(error.code == PERMISSION_DENIED_CODE).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_016
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_016
     * @tc.desc   Test that the continuousTaskRequest function requestAuthFromUser does not request ohos.permission.KEEP_BACKGROUND_RUNNING permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_016 begin---');

        try {
          let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              continuousTaskRequest.checkSpecialScenarioAuth(ability.context).then((res: backgroundTaskManager.UserAuthResult) => {
                console.info("SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_016 Operation checkSpecialScenarioAuth succeeded. data: " + JSON.stringify(res));
              }).catch((error: BusinessError) => {
                console.error(`SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_016 Operation checkSpecialScenarioAuth failed. code is ${error.code} message is ${error.message}`);
                expect(error.code == PERMISSION_DENIED_CODE).assertTrue();
                done();
            });
            }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_016 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
            });
        }).catch((error: BusinessError) => {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_016 getWantAgent error: %{public}s', JSON.stringify(error));
        })
        } catch (error) {
          console.error(`SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_016 Operation checkSpecialScenarioAuth failed. code is ${(error as BusinessError).code} message is ${(error as BusinessError).message}`);
        }
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_017
     * @tc.number SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_017
     * @tc.desc   Test that the continuousTaskRequest function requestAuthFromUser does not request ohos.permission.KEEP_BACKGROUND_RUNNING permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_017 begin---');

        let callbackAuth = (authResult: backgroundTaskManager.UserAuthResult) => {
          console.info("SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_017 Operation requestAuthFromUser success. auth result: " + JSON.stringify(authResult));
        };

        let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
        let modeList: Array<number> = [backgroundTaskManager.BackgroundTaskMode.MODE_SPECIAL_SCENARIO_PROCESSING];
        continuousTaskRequest.backgroundTaskModes = modeList;
        let subModeList: Array<number> = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_MEDIA_PROCESS_NORMAL_NOTIFICATION];
        continuousTaskRequest.backgroundTaskSubmodes = subModeList;
        wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
          let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          delegator.getCurrentTopAbility().then((ability: UIAbility) => {
            try {
              hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_017 requestAuthFromUser try begin---');
              continuousTaskRequest.requestAuthFromUser(ability.context, callbackAuth);
            } catch (error) {
              console.error(`SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_017 Operation requestAuthFromUser failed. code is ${(error as BusinessError).code} message is ${(error as BusinessError).message}`);
              expect(error.code == PERMISSION_DENIED_CODE).assertTrue();
              done();
              hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_017 requestAuthFromUser try end---');
            }
          }).catch((error: BusinessError) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_017 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
          });
        }).catch((error: BusinessError) => {
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_017 getWantAgent error: %{public}s', JSON.stringify(error));
        })

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_BACKGROUND_TASK_MANAGER_NOP_XTS_017 end---');
      })

  })
}

