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

    /**
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_004
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_004
     * @tc.desc   Test that the getAllContinuousTasks function interface does not request ohos.permission.KEEP_BACKGROUND_RUNNING permission
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_004 begin---');
      
      let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_004 startBackgroundRunning delegator success.');

      try {
        wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_004 startBackgroundRunning getWantAgent success.');

          delegator.getCurrentTopAbility().then((ability: UIAbility) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_004 startBackgroundRunning getCurrentTopAbility success.');
            backgroundTaskManager.getAllContinuousTasks(ability.context).then((res: backgroundTaskManager.ContinuousTaskInfo[]) => {
              console.info(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_004 Operation getAllContinuousTasks succeeded. data: ` + JSON.stringify(res));
            }).catch((error: Error) => {
              console.error(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_004 Operation getAllContinuousTasks failed. code is ${error.code} message is ${error.message}`);
              expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
              done();
            });

          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_004 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          });
        }).catch((error: Error) => {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_004 getWantAgent error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        })
      } catch (error) {
        error = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_004 aa error: %{public}s', JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_004 end---');
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_005
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_005
     * @tc.desc   Test that the getAllContinuousTasks function parameter is includeSuspended interface does not request ohos.permission.KEEP_BACKGROUND_RUNNING permission
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_005 begin---');
      
      let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_005 startBackgroundRunning delegator success.');

      try {
        wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_005 startBackgroundRunning getWantAgent success.');

          delegator.getCurrentTopAbility().then((ability: UIAbility) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_005 startBackgroundRunning getCurrentTopAbility success.');
            let includeSuspended = true;
            backgroundTaskManager.getAllContinuousTasks(ability.context, includeSuspended).then((res: backgroundTaskManager.ContinuousTaskInfo[]) => {
              console.info(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_005 Operation getAllContinuousTasks succeeded. data: ` + JSON.stringify(res));
              done();
            }).catch((error: Error) => {
              console.error(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_005 Operation getAllContinuousTasks failed. code is ${error.code} message is ${error.message}`);
              expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
              done();
            });

          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_005 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          });
        }).catch((error: Error) => {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_005 getWantAgent error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        })
      } catch (error) {
        error = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_005 aa error: %{public}s', JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_005 end---');
    })

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

    /**
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_007
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_007
     * @tc.desc   Test that the onContinuousTaskCancel function interface does not request ohos.permission.KEEP_BACKGROUND_RUNNING permission
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_007 begin---')
      try {
        let onContinuousTaskCancel = (res: backgroundTaskManager.ContinuousTaskCancelInfo) => {
          console.info(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_007 onContinuousTaskCancel ` + res);
        };
        backgroundTaskManager.onContinuousTaskCancel(onContinuousTaskCancel);
        console.info(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_007 onContinuousTaskCancel callback succeeded. `);
        done();
      } catch (error) {
        console.error("SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_007 promise err code:" + error?.code + " message:" + error?.message);
        expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
        done();

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_007 end---');
      }
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_008
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_008
     * @tc.desc   Test that the offContinuousTaskCancel function interface does not request ohos.permission.KEEP_BACKGROUND_RUNNING permission
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_008 begin---')
      try {
        let offContinuousTaskCancel = (res: backgroundTaskManager.ContinuousTaskCancelInfo) => {
          console.info(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_008 offContinuousTaskCancel ` + res);
        };
        backgroundTaskManager.offContinuousTaskCancel(offContinuousTaskCancel);
        console.info(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_008 offContinuousTaskCancel callback succeeded. `);
        done();
      } catch (error) {
        console.error("SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_008 promise err code:" + error?.code + " message:" + error?.message);
        expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
        done();

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_008 end---');
      }
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_009
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_009
     * @tc.desc   Test that the onContinuousTaskActive function interface does not request ohos.permission.KEEP_BACKGROUND_RUNNING permission
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_009 begin---')
      try {
        let onContinuousTaskActive = (res: backgroundTaskManager.ContinuousTaskActiveInfo) => {
          console.info(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_009 onContinuousTaskActive ` + res);
        };
        backgroundTaskManager.onContinuousTaskActive(onContinuousTaskActive);
        console.info(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_009 onContinuousTaskActive callback succeeded. `);
        done();
      } catch (error) {
        console.error("SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_009 promise err code:" + error?.code + " message:" + error?.message);
        expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
        done();

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_009 end---');
      }
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_010
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_010
     * @tc.desc   Test that the offContinuousTaskActive function interface does not request ohos.permission.KEEP_BACKGROUND_RUNNING permission
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_010 begin---')
      try {
        let offContinuousTaskActive = (res: backgroundTaskManager.ContinuousTaskActiveInfo) => {
          console.info(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_010 offContinuousTaskActive ` + res);
        };
        backgroundTaskManager.offContinuousTaskActive(offContinuousTaskActive);
        console.info(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_010 offContinuousTaskActive callback succeeded. `);
        done();
      } catch (error) {
        console.error("SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_010 promise err code:" + error?.code + " message:" + error?.message);
        expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
        done();

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_010 end---');
      }
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_011
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_011
     * @tc.desc   Test that the onContinuousTaskSuspend function interface does not request ohos.permission.KEEP_BACKGROUND_RUNNING permission
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_011 begin---')
      try {
        let onContinuousTaskSuspend = (res: backgroundTaskManager.ContinuousTaskSuspendInfo) => {
          console.info(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_011 onContinuousTaskSuspend ` + res);
        };
        backgroundTaskManager.onContinuousTaskSuspend(onContinuousTaskSuspend);
        console.info(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_011 onContinuousTaskSuspend callback succeeded. `);
        done();
      } catch (error) {
        console.error("SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_011 promise err code:" + error?.code + " message:" + error?.message);
        expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
        done();
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_011 end---');
      }
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_012
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_012
     * @tc.desc   Test that the offContinuousTaskSuspend function interface does not request ohos.permission.KEEP_BACKGROUND_RUNNING permission
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_012 begin---')
      try {
        let offContinuousTaskSuspend = (res: backgroundTaskManager.ContinuousTaskSuspendInfo) => {
          console.info(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_012 offContinuousTaskSuspend ` + res);
        };
        backgroundTaskManager.offContinuousTaskSuspend(offContinuousTaskSuspend);
        console.info(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_012 offContinuousTaskSuspend callback succeeded. `);
        done();
      } catch (error) {
        console.error("SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_012 promise err code:" + error?.code + " message:" + error?.message);
        expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
        done();

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_012 end---');
      }
    })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_1300
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_1300
     * @tc.desc   Test that the backgroundTaskManager isModeSupported function res is true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done:() => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_1300 begin---');

        let isModeSupported: boolean = false;
        let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
        let modeList: Array<backgroundTaskManager.BackgroundTaskMode> = [backgroundTaskManager.BackgroundTaskMode.MODE_SPECIAL_SCENARIO_PROCESSING];
        continuousTaskRequest.backgroundTaskModes = modeList;
        try {
          isModeSupported = continuousTaskRequest.isModeSupported();
          console.info(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_1300 Operation isModeSupported succeeded. isModeSupported is ${isModeSupported}`);
          expect(isModeSupported == false).assertTrue();
          done();
        } catch (error) {
          console.error(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_1300 Operation startBackgroundRunning failed. code is ${(error as BusinessError).code} message is ${(error as BusinessError).message}`);
          expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
          done();
        }

      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_1400
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_1400
     * @tc.desc   Test that the continuousTaskRequest function requestAuthFromUser error call and errocode is 9800005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done:() => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_1400 begin---');

        try {
          let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
          wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              continuousTaskRequest.checkSpecialScenarioAuth(ability.context).then((res: backgroundTaskManager.UserAuthResult) => {
                console.info("SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_1400 Operation checkSpecialScenarioAuth succeeded. data: " + JSON.stringify(res));
              }).catch((error: Error) => {
                console.error(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_1400 Operation checkSpecialScenarioAuth failed. code is ${error.code} message is ${error.message}`);
                expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
                done();
              });
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_1400 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_1400 getWantAgent error: %{public}s', JSON.stringify(error));
          })
        } catch (error) {
          console.error(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_1400 Operation checkSpecialScenarioAuth failed. code is ${(error as BusinessError).code} message is ${(error as BusinessError).message}`);
        }
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_1500
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_1500
     * @tc.desc   Test that the continuousTaskRequest function requestAuthFromUser error call and errocode is 9800005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done:() => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_1500 begin---');

        let callbackAuth = (authResult: backgroundTaskManager.UserAuthResult) => {
          console.info("SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_1500 Operation requestAuthFromUser success. auth result: " + JSON.stringify(authResult));
        };

        let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
        let modeList: Array<backgroundTaskManager.BackgroundTaskMode> = [backgroundTaskManager.BackgroundTaskMode.MODE_SPECIAL_SCENARIO_PROCESSING];
        let subModeList: Array<backgroundTaskManager.BackgroundTaskSubmode> = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_MEDIA_PROCESS_NORMAL_NOTIFICATION];
        continuousTaskRequest.backgroundTaskModes = modeList;
        continuousTaskRequest.backgroundTaskSubmodes = subModeList;
        continuousTaskRequest.combinedTaskNotification = false;
        continuousTaskRequest.continuousTaskId = -1;
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_1500 try begin---');
        wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
          let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          delegator.getCurrentTopAbility().then((ability: UIAbility) => {
            try {
              hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_1500 requestAuthFromUser try begin---');
              continuousTaskRequest.requestAuthFromUser(ability.context, callbackAuth);
            } catch (error) {
              console.error(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_1500 Operation requestAuthFromUser failed. code is ${(error as BusinessError).code} message is ${(error as BusinessError).message}`);
              expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
              done();
              hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_1500 requestAuthFromUser try end---');
            }
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_1500 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
          });
        }).catch((error: Error) => {
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_1500 getWantAgent error: %{public}s', JSON.stringify(error));
        })

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_1500 end---');
      })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_1600
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_1600
     * @tc.desc   Test that the api21 startBackgroundRunning function interface
     * @tc.level  Level 3
     * @tc.type   Function
     * @tc.size   MediumTest
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done:() => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_1600 begin---');

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
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_1600 startBackgroundRunning promise run success.');
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_1600 startBackgroundRunning promise res: %{public}s', JSON.stringify(res));
              }).catch((error: Error) => {
                console.error(`SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_1600 startBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
                done();
              })
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_1600 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_1600 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_1600 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_1600 end---');
      });

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_1700
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_1700
     * @tc.desc   Test that the  api12 updateBackgroundRunning function interface does not request ohos.permission.KEEP_BACKGROUND_RUNNING permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done:() => void): Promise<void> => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_1700 begin---');

        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: _WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let modeList: Array<backgroundTaskManager.BackgroundTaskMode> = [backgroundTaskManager.BackgroundTaskMode.MODE_BLUETOOTH_INTERACTION];
              let subModeList: Array<backgroundTaskManager.BackgroundTaskSubmode> = [backgroundTaskManager.BackgroundTaskSubmode.SUBMODE_CAR_KEY_NORMAL_NOTIFICATION];
              let continuousTaskRequest = new backgroundTaskManager.ContinuousTaskRequest();
              continuousTaskRequest.backgroundTaskModes =  modeList;
              continuousTaskRequest.backgroundTaskSubmodes = subModeList;
              continuousTaskRequest.wantAgent = want;
              continuousTaskRequest.combinedTaskNotification = false;
              continuousTaskRequest.continuousTaskId = 1000;
              backgroundTaskManager.updateBackgroundRunning(ability.context, continuousTaskRequest).then((res: backgroundTaskManager.ContinuousTaskNotification) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_1700 updateBackgroundRunning promise res: %{public}s', JSON.stringify(res));
                console.info("SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_1700 Operation updateBackgroundRunning succeeded");
              }).catch((error: Error) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_1700 updateBackgroundRunning promise error: %{public}s', JSON.stringify(error));
                expect(error.code).assertEqual(PERMISSION_DENIED_CODE);
                done();
              });
            }).catch((error: Error) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_1700 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: Error) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_1700 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_1700 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_MANAGER_NOP_STATIC_XTS_1700 end---');
      })

  })
}

