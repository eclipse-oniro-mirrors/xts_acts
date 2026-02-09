/**
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

import { describe, it, expect, TestType, Size, Level, beforeAll, afterAll, beforeEach, afterEach} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import { WantAgent as _WantAgent } from '@ohos.app.ability.wantAgent';
import wantAgent from '@ohos.app.ability.wantAgent';
import Want from '@ohos.app.ability.Want';
import UIAbility from '@ohos.app.ability.UIAbility'
import backgroundTaskManager from '@ohos.resourceschedule.backgroundTaskManager'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { BusinessError } from "@ohos.base"
import Utils from './Util.test';

let DOMAIN: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let TAG: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

const PERMISSION_DENIED_CODE = 201

export default function ActsLongTimeTaskNopStaticTest() {
  describe('ActsLongTimeTaskNopStaticTest', () => {

    let wantAgentFlags: Array<wantAgent.WantAgentFlags> = new Array<wantAgent.WantAgentFlags>();

    let wantAgentInfo: wantAgent.WantAgentInfo = {
      wants: [
        {
          bundleName: "com.acts.actslongtimetasknoptest.static",
          abilityName: "EntryAbility"
        }
      ],
      requestCode: 0,
      actionFlags: wantAgentFlags,
      actionType: wantAgent.OperationType.START_ABILITY
    };

    beforeAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'beforeAll called');
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
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_001
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_001
     * @tc.desc   Test that the startBackgroundRunning function interface does not request ohos.permission.KEEP_BACKGROUND_RUNNING permission
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done:() => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_001 begin---');

        let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_STATIC_XTS_001 startBackgroundRunning delegator success.');

        delegator.executeShellCommand("aa start -a EntryAbility -b com.acts.actslongtimetasknoptest.static")

        await Utils.msSleep(3000);

        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let bgMode = backgroundTaskManager.BackgroundMode.AUDIO_PLAYBACK;
              backgroundTaskManager.startBackgroundRunning(ability.context, bgMode, want).then(() => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_001 startBackgroundRunning promise run success.');
                expect(false).assertTrue();
                done();
              }).catch((error: Error) => {
                console.error(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_001 startBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
                done();
              })
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_001 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_001 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_001 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_001 end---');
      })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_002
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_002
     * @tc.desc   Test that the startBackgroundRunning function interface does not request ohos.permission.KEEP_BACKGROUND_RUNNING permission
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done:() => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_002 begin---');

        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let bgMode = backgroundTaskManager.BackgroundMode.AUDIO_PLAYBACK;
              backgroundTaskManager.startBackgroundRunning(ability.context, bgMode, want,
                (error: BusinessError | null) => {
                  if (error) {
                    console.error(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_002 startBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                    expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
                  } else {
                    hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_002 startBackgroundRunning callback run success.');
                    expect(false).assertTrue();
                  }
                  done();
                })
            }).catch((error: Error) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_002 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
                done();
              });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_002 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_002 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_002 end---');
      })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_003
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_003
     * @tc.desc   Test that the updateBackgroundRunning function interface does not request ohos.permission.KEEP_BACKGROUND_RUNNING permission
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done:() => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_003 begin---');

        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let list = ["audioPlayback"];
              backgroundTaskManager.updateBackgroundRunning(ability.context, list).then(() => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_003 updateBackgroundRunning promise run success.');
                expect(false).assertTrue();
                done();
              }).catch((error: Error) => {
                console.error(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_003 startBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
                done();
              })
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_003 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_003 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          error = error as BusinessError;
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_003 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_003 end---');
      })

    // /**
    //  * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_004
    //  * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_004
    //  * @tc.desc   Test that the on function interface does not request ohos.permission.KEEP_BACKGROUND_RUNNING permission
    //  * @tc.level:Level 3
    //  * @tc.type:Function
    //  * @tc.size:MediumTest
    //  */
    // it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
    //   async (done:() => void): Promise<void> => {
    //     hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_004 begin---');
    //
    //     try {
    //       let callback = (ContinuousTaskCancelInfo: backgroundTaskManager.ContinuousTaskCancelInfo) => {
    //         console.info('continuousTaskCancel callback id ' + ContinuousTaskCancelInfo.id);
    //         console.info('continuousTaskCancel callback reason ' + ContinuousTaskCancelInfo.reason);
    //       }
    //
    //       try {
    //         backgroundTaskManager.on("continuousTaskCancel", callback);
    //       } catch (error) {
    //         console.error(`Operation onContinuousTaskCancel failed. code is ${(error as BusinessError).code} message is ${(error as BusinessError).message}`);
    //         expect(error.code == 201).assertTrue();
    //         done();
    //       }
    //     } catch (error) {
    //       let e: BusinessError = error as BusinessError;
    //       hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
    //       expect(false).assertTrue();
    //       done();
    //     }
    //
    //     hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_004 end---');
    //   })
    //
    // /**
    //  * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_005
    //  * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_005
    //  * @tc.desc   Test that the off function interface does not request ohos.permission.KEEP_BACKGROUND_RUNNING permission
    //  * @tc.level:Level 3
    //  * @tc.type:Function
    //  * @tc.size:MediumTest
    //  */
    // it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
    //   async (done:() => void): Promise<void> => {
    //     hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_005 begin---');
    //
    //     try {
    //       let callback = (ContinuousTaskCancelInfo: backgroundTaskManager.ContinuousTaskCancelInfo) => {
    //         console.info('continuousTaskCancel callback id ' + ContinuousTaskCancelInfo.id);
    //         console.info('continuousTaskCancel callback reason ' + ContinuousTaskCancelInfo.reason);
    //       }
    //
    //       try {
    //         backgroundTaskManager.off("continuousTaskCancel", callback);
    //       } catch (error) {
    //         console.error(`Operation offContinuousTaskCancel failed. code is ${(error as BusinessError).code} message is ${(error as BusinessError).message}`);
    //         expect(error.code == 201).assertTrue();
    //         done();
    //       }
    //     } catch (error) {
    //       let e: BusinessError = error as BusinessError;
    //       hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
    //       expect(false).assertTrue();
    //       done();
    //     }
    //
    //     hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_005 end---');
    //   })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_006
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_006
     * @tc.desc   Test that the startBackgroundRunning function interface does not request ohos.permission.KEEP_BACKGROUND_RUNNING permission
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done:() => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_006 begin---');

        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let bgModeList = ["location"]
              backgroundTaskManager.startBackgroundRunning(ability.context, bgModeList, want).then(() => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_006 startBackgroundRunning12 promise run success.');
                expect(false).assertTrue();
                done();
              }).catch((error: Error) => {
                console.error(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_006 startBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
                done();
              })
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_006 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_006 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_006 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_006 end---');
      })

    // /**
    //  * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_007
    //  * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_007
    //  * @tc.desc   Test that the suspend on function interface does not request ohos.permission.KEEP_BACKGROUND_RUNNING permission
    //  * @tc.level:Level 3
    //  * @tc.type:Function
    //  * @tc.size:MediumTest
    //  */
    // it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
    //   async (done:() => void): Promise<void> => {
    //     hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_007 begin---');
    //
    //     try {
    //       let callback = (ContinuousTaskSuspendInfo: backgroundTaskManager.ContinuousTaskSuspendInfo) => {
    //         console.info('continuousTaskSuspend callback continuousTaskId: ' +
    //         ContinuousTaskSuspendInfo.continuousTaskId);
    //         console.info('continuousTaskSuspend callback suspendState: ' + ContinuousTaskSuspendInfo.suspendState);
    //         console.info('continuousTaskSuspend callback suspendReason: ' + ContinuousTaskSuspendInfo.suspendReason);
    //       }
    //
    //       try {
    //         backgroundTaskManager.on("continuousTaskSuspend", callback);
    //       } catch (error) {
    //         console.error(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_007 Operation continuousTaskSuspend failed. code is ${(error as BusinessError).code} message is ${(error as BusinessError).message}`);
    //         expect(error.code == 201).assertTrue();
    //         done();
    //       }
    //     } catch (error) {
    //       let e: BusinessError = error as BusinessError;
    //       hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
    //       expect(false).assertTrue();
    //       done();
    //     }
    //
    //     hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_007 end---');
    //   })
    //
    // /**
    //  * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_008
    //  * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_008
    //  * @tc.desc   Test that the suspend off function interface does not request ohos.permission.KEEP_BACKGROUND_RUNNING permission
    //  * @tc.level:Level 3
    //  * @tc.type:Function
    //  * @tc.size:MediumTest
    //  */
    // it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
    //   async (done:() => void): Promise<void> => {
    //     hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_008 begin---');
    //
    //     try {
    //       let callback = (ContinuousTaskSuspendInfo: backgroundTaskManager.ContinuousTaskSuspendInfo) => {
    //         console.info('continuousTaskSuspend callback continuousTaskId: ' +
    //         ContinuousTaskSuspendInfo.continuousTaskId);
    //         console.info('continuousTaskSuspend callback suspendState: ' + ContinuousTaskSuspendInfo.suspendState);
    //         console.info('continuousTaskSuspend callback suspendReason: ' + ContinuousTaskSuspendInfo.suspendReason);
    //       }
    //
    //       try {
    //         backgroundTaskManager.off("continuousTaskSuspend", callback);
    //       } catch (error) {
    //         console.error(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_008 Operation offContinuousTaskSuspend failed. code is ${(error as BusinessError).code} message is ${(error as BusinessError).message}`);
    //         expect(error.code == 201).assertTrue();
    //         done();
    //       }
    //     } catch (error) {
    //       let e: BusinessError = error as BusinessError;
    //       hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
    //       expect(false).assertTrue();
    //       done();
    //     }
    //
    //     hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_008 end---');
    //   })
    //
    // /**
    //  * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_009
    //  * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_009
    //  * @tc.desc   Test that the active on function interface does not request ohos.permission.KEEP_BACKGROUND_RUNNING permission
    //  * @tc.level:Level 3
    //  * @tc.type:Function
    //  * @tc.size:MediumTest
    //  */
    // it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
    //   async (done:() => void): Promise<void> => {
    //     hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_009 begin---');
    //
    //     try {
    //       let callback = (ContinuousTaskActiveInfo: backgroundTaskManager.ContinuousTaskActiveInfo) => {
    //         console.info('continuousTaskActive callback id: ' + ContinuousTaskActiveInfo.id);
    //       }
    //
    //       try {
    //         backgroundTaskManager.on("continuousTaskActive", callback);
    //       } catch (error) {
    //         console.error(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_009 Operation continuousTaskActive failed. code is ${(error as BusinessError).code} message is ${(error as BusinessError).message}`);
    //         expect(error.code == 201).assertTrue();
    //         done();
    //       }
    //     } catch (error) {
    //       let e: BusinessError = error as BusinessError;
    //       hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
    //       expect(false).assertTrue();
    //       done();
    //     }
    //
    //     hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_009 end---');
    //   })
    //
    // /**
    //  * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_010
    //  * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_010
    //  * @tc.desc   Test that the active off function interface does not request ohos.permission.KEEP_BACKGROUND_RUNNING permission
    //  * @tc.level:Level 3
    //  * @tc.type:Function
    //  * @tc.size:MediumTest
    //  */
    // it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
    //   async (done:() => void): Promise<void> => {
    //     hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_010 begin---');
    //
    //     try {
    //       let callback = (ContinuousTaskActiveInfo: backgroundTaskManager.ContinuousTaskActiveInfo) => {
    //         console.info('continuousTaskActive callback id: ' + ContinuousTaskActiveInfo.id);
    //       }
    //
    //       try {
    //         backgroundTaskManager.off("continuousTaskActive", callback);
    //       } catch (error) {
    //         console.error(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_010 Operation offContinuousTaskActive failed. code is ${(error as BusinessError).code} message is ${(error as BusinessError).message}`);
    //         expect(error.code == 201).assertTrue();
    //         done();
    //       }
    //     } catch (error) {
    //       let e: BusinessError = error as BusinessError;
    //       hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
    //       expect(false).assertTrue();
    //       done();
    //     }
    //
    //     hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_010 end---');
    //   })

    // /**
    //  * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_011
    //  * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_011
    //  * @tc.desc   Test that the startBackgroundRunning function interface does not request ohos.permission.KEEP_BACKGROUND_RUNNING permission
    //  * @tc.level:Level 3
    //  * @tc.type:Function
    //  * @tc.size:MediumTest
    //  */
    // it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
    //   async (done:() => void): Promise<void> => {
    //     hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_011 begin---');
    //
    //     try {
    //       wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
    //         let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
    //         delegator.getCurrentTopAbility().then((ability: UIAbility) => {
    //           backgroundTaskManager.getAllContinuousTasks(ability.context).then(() => {
    //             hilog.info(DOMAIN, TAG,
    //               'SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_011 startBackgroundRunning promise run success.');
    //             expect(false).assertTrue();
    //             done();
    //           }).catch((error: Error) => {
    //             hilog.info(DOMAIN, TAG,
    //               'SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_011 startBackgroundRunning promise error: %{public}s',
    //               JSON.stringify(error));
    //             expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
    //             done();
    //           })
    //         }).catch((error: Error) => {
    //           hilog.info(DOMAIN, TAG,
    //             'SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_011 getCurrentTopAbility error: %{public}s',
    //             JSON.stringify(error));
    //           expect(false).assertTrue();
    //           done();
    //         });
    //       }).catch((error: Error) => {
    //         hilog.info(DOMAIN, TAG,
    //           'SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_011 getWantAgent error: %{public}s',
    //           JSON.stringify(error));
    //         expect(false).assertTrue();
    //         done();
    //       })
    //     } catch (error) {
    //       let e: BusinessError = error as BusinessError;
    //       hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
    //       expect(false).assertTrue();
    //       done();
    //     }
    //
    //     hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_011 end---');
    //   })
    //
    // /**
    //  * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_012
    //  * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_012
    //  * @tc.desc   Test that the startBackgroundRunning function interface does not request ohos.permission.KEEP_BACKGROUND_RUNNING permission
    //  * @tc.level:Level 3
    //  * @tc.type:Function
    //  * @tc.size:MediumTest
    //  */
    // it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
    //   async (done:() => void): Promise<void> => {
    //     hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_012 begin---');
    //
    //     try {
    //       let includeSuspended: boolean = true
    //       wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
    //         let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
    //         delegator.getCurrentTopAbility().then((ability: UIAbility) => {
    //           backgroundTaskManager.getAllContinuousTasks(ability.context, includeSuspended).then(() => {
    //             hilog.info(DOMAIN, TAG,
    //               'SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_012 startBackgroundRunning promise run success.');
    //             expect(false).assertTrue();
    //             done();
    //           }).catch((error: Error) => {
    //             hilog.info(DOMAIN, TAG,
    //               'SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_012 startBackgroundRunning promise error: %{public}s',
    //               JSON.stringify(error));
    //             expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
    //             done();
    //           })
    //         }).catch((error: Error) => {
    //           hilog.info(DOMAIN, TAG,
    //             'SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_012 getCurrentTopAbility error: %{public}s',
    //             JSON.stringify(error));
    //           expect(false).assertTrue();
    //           done();
    //         });
    //       }).catch((error: Error) => {
    //         hilog.info(DOMAIN, TAG,
    //           'SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_012 getWantAgent error: %{public}s',
    //           JSON.stringify(error));
    //         expect(false).assertTrue();
    //         done();
    //       })
    //     } catch (error) {
    //       let e: BusinessError = error as BusinessError;
    //       hilog.info(DOMAIN, TAG, 'aa error: %{public}s', JSON.stringify(error));
    //       expect(false).assertTrue();
    //       done();
    //     }
    //
    //     hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_012 end---');
    //   })
    //
    // /**
    //  * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_013
    //  * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_013
    //  * @tc.desc   Test that the  api12 updateBackgroundRunning function interface does not request ohos.permission.KEEP_BACKGROUND_RUNNING permission
    //  * @tc.level:Level 3
    //  * @tc.type:Function
    //  * @tc.size:MediumTest
    //  */
    // it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
    //   async (done:() => void): Promise<void> => {
    //     hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_013 begin---');
    //
    //     try {
    //       wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
    //         let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
    //         delegator.getCurrentTopAbility().then((ability: UIAbility) => {
    //           let modeList: Array<number> = [backgroundTaskManager.BackgroundTaskMode.MODE_LOCATION];
    //           let subModeList: Array<number> =
    //             [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_NORMAL_NOTIFICATION];
    //           let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
    //           continuousTaskRequest.backgroundTaskModes = modeList;
    //           continuousTaskRequest.backgroundTaskSubmodes = subModeList;
    //           continuousTaskRequest.wantAgent = want;
    //           continuousTaskRequest.combinedTaskNotification = false;
    //           continuousTaskRequest.continuousTaskId = 1000;
    //           backgroundTaskManager.updateBackgroundRunning(ability.context, continuousTaskRequest)
    //             .then((res: backgroundTaskManager.ContinuousTaskNotification) => {
    //               hilog.info(DOMAIN, TAG,
    //                 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_013 updateBackgroundRunning promise res: %{public}s',
    //                 JSON.stringify(res));
    //               console.info("SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_013 Operation updateBackgroundRunning succeeded");
    //             })
    //             .catch((error: Error) => {
    //               hilog.info(DOMAIN, TAG,
    //                 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_013 updateBackgroundRunning promise error: %{public}s',
    //                 JSON.stringify(error));
    //               expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
    //               done();
    //             });
    //         }).catch((error: Error) => {
    //           hilog.info(DOMAIN, TAG,
    //             'SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_013 getCurrentTopAbility error: %{public}s',
    //             JSON.stringify(error));
    //           expect(false).assertTrue();
    //           done();
    //         });
    //       }).catch((error: Error) => {
    //         hilog.info(DOMAIN, TAG,
    //           'SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_013 getWantAgent error: %{public}s',
    //           JSON.stringify(error));
    //         expect(false).assertTrue();
    //         done();
    //       })
    //     } catch (error) {
    //       let e: BusinessError = error as BusinessError;
    //       hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_013 aa error: %{public}s',
    //         JSON.stringify(error));
    //       expect(false).assertTrue();
    //       done();
    //     }
    //
    //     hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_013 end---');
    //   })

    // /**
    //  * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_014
    //  * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_014
    //  * @tc.desc   Test that the api12 startBackgroundRunning function interface does not request ohos.permission.KEEP_BACKGROUND_RUNNING permission
    //  * @tc.level:Level 3
    //  * @tc.type:Function
    //  * @tc.size:MediumTest
    //  */
    // it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
    //   async (done:() => void): Promise<void> => {
    //     hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_014 begin---');
    //
    //     try {
    //       wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
    //         let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
    //         delegator.getCurrentTopAbility().then((ability: UIAbility) => {
    //           let modeList: Array<number> = [backgroundTaskManager.BackgroundTaskMode.MODE_LOCATION];
    //           let subModeList: Array<number> =
    //             [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_NORMAL_NOTIFICATION];
    //           let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
    //           continuousTaskRequest.backgroundTaskModes = modeList;
    //           continuousTaskRequest.backgroundTaskSubmodes = subModeList;
    //           continuousTaskRequest.wantAgent = want;
    //           continuousTaskRequest.combinedTaskNotification = false;
    //           continuousTaskRequest.continuousTaskId = 0;
    //           backgroundTaskManager.startBackgroundRunning(ability.context, continuousTaskRequest)
    //             .then((res: backgroundTaskManager.ContinuousTaskNotification) => {
    //               hilog.info(DOMAIN, TAG,
    //                 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_014 startBackgroundRunning promise run success.');
    //               hilog.info(DOMAIN, TAG,
    //                 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_014 startBackgroundRunning promise res: %{public}s',
    //                 JSON.stringify(res));
    //             })
    //             .catch((error: Error) => {
    //               hilog.info(DOMAIN, TAG,
    //                 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_014 startBackgroundRunning promise error: %{public}s',
    //                 JSON.stringify(error));
    //               expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
    //               done();
    //             })
    //         }).catch((error: Error) => {
    //           hilog.info(DOMAIN, TAG,
    //             'SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_014 getCurrentTopAbility error: %{public}s',
    //             JSON.stringify(error));
    //           expect(false).assertTrue();
    //           done();
    //         });
    //       }).catch((error: Error) => {
    //         hilog.info(DOMAIN, TAG,
    //           'SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_014 getWantAgent error: %{public}s',
    //           JSON.stringify(error));
    //         expect(false).assertTrue();
    //         done();
    //       })
    //     } catch (error) {
    //       let e: BusinessError = error as BusinessError;
    //       hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_014 aa error: %{public}s',
    //         JSON.stringify(error));
    //       expect(false).assertTrue();
    //       done();
    //     }
    //
    //     hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_014 end---');
    //   })
    //
    // /**
    //  * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_015
    //  * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_015
    //  * @tc.desc   Test that the backgroundTaskManager isModeSupported function interface does not request ohos.permission.KEEP_BACKGROUND_RUNNING permission
    //  * @tc.level:Level 3
    //  * @tc.type:Function
    //  * @tc.size:MediumTest
    //  */
    // it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
    //   async (done:() => void): Promise<void> => {
    //     hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_015 begin---');
    //
    //     let isModeSupported: boolean = false;
    //     let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
    //     let modeList: Array<number> = [backgroundTaskManager.BackgroundTaskMode.MODE_TASK_KEEPING];
    //     continuousTaskRequest.backgroundTaskModes = modeList;
    //     try {
    //       isModeSupported = continuousTaskRequest.isModeSupported();
    //       console.info(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_015 Operation isModeSupported succeeded. isModeSupported is ${isModeSupported}`);
    //     } catch (error) {
    //       console.error(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_015 Operation startBackgroundRunning failed. code is ${(error as BusinessError).code} message is ${(error as BusinessError).message}`);
    //       expect(error.code == PERMISSION_DENIED_CODE).assertTrue();
    //       done();
    //     }
    //   })

  })
}

