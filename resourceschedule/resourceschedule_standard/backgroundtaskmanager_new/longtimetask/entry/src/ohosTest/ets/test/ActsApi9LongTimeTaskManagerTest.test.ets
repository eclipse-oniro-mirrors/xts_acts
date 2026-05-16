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

export default function ActsApi9LongTimeTaskManagerTest() {
  describe('ActsApi9LongTimeTaskManagerTest', () => {

    let wantAgentInfo: wantAgent.WantAgentInfo;
    let wantAgentInfos: wantAgent.WantAgentInfo;

    const sleep = (ms: number): Promise<void> => {
      return new Promise(resolve => setTimeout(resolve, ms));
    }

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

      try {
        wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
          let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          delegator.getCurrentTopAbility().then((ability: UIAbility) => {

            backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
              console.info("ActsApi9LongTimeTaskManagerTest beforeAll stopBackgroundRunning promise run success");
            }).catch((error: BusinessError) => {
              console.error(`ActsLongTimeTaskManagerTest beforeAll Operation stopBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
            });

          }).catch((error: BusinessError) => {
            hilog.info(DOMAIN, TAG, 'ActsApi9LongTimeTaskManagerTest beforeAll getCurrentTopAbility error: %{public}s', JSON.stringify(error));
          });
          }).catch((error: BusinessError) => {
            hilog.info(DOMAIN, TAG, 'ActsApi9LongTimeTaskManagerTest beforeAll getWantAgent error: %{public}s', JSON.stringify(error));
          })
        }catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'ActsApi9LongTimeTaskManagerTest beforeAll aa error: %{public}s', JSON.stringify(error));
        }
      })

    afterAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'afterAll called');
      try {
        wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
          let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          delegator.getCurrentTopAbility().then((ability: UIAbility) => {

            backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
              console.info("ActsApi9LongTimeTaskManagerTest afterAll stopBackgroundRunning promise run success");
            }).catch((error: BusinessError) => {
              console.error(`ActsApi9LongTimeTaskManagerTest afterAll Operation stopBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
            });

          }).catch((error: BusinessError) => {
            hilog.info(DOMAIN, TAG, 'ActsApi9LongTimeTaskManagerTest afterAll getCurrentTopAbility error: %{public}s', JSON.stringify(error));
          });
        }).catch((error: BusinessError) => {
          hilog.info(DOMAIN, TAG, 'ActsApi9LongTimeTaskManagerTest afterAll getWantAgent error: %{public}s', JSON.stringify(error));
        })
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'ActsApi9LongTimeTaskManagerTest afterAll aa error: %{public}s', JSON.stringify(error));
      }
    })

    beforeEach(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'ActsApi9LongTimeTaskManagerTest beforeEach called');
    })

    afterEach(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'ActsApi9LongTimeTaskManagerTest afterEach called');

      try {
        wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
          let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          delegator.getCurrentTopAbility().then((ability: UIAbility) => {

            backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
              console.info("ActsApi9LongTimeTaskManagerTest afterEach stopBackgroundRunning promise run success");
            }).catch((error: BusinessError) => {
              console.error(`ActsApi9LongTimeTaskManagerTest afterEach Operation stopBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
            });

          }).catch((error: BusinessError) => {
            hilog.info(DOMAIN, TAG, 'ActsApi9LongTimeTaskManagerTest afterEach getCurrentTopAbility error: %{public}s', JSON.stringify(error));
          });
        }).catch((error: BusinessError) => {
          hilog.info(DOMAIN, TAG, 'ActsApi9LongTimeTaskManagerTest afterEach getWantAgent error: %{public}s', JSON.stringify(error));
        })
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'ActsApi9LongTimeTaskManagerTest afterEach aa error: %{public}s', JSON.stringify(error));
      }
    })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_001
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_001
     * @tc.desc   Test that the startBackgroundRunning function normal call with bgModeList and first parmeater is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_001 begin---');

        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let bgMode = backgroundTaskManager.BackgroundMode.AUDIO_PLAYBACK;
              try{
                backgroundTaskManager.startBackgroundRunning(null, bgMode, want,
                  (error: BusinessError,data: void) => {
                  if (error) {
                    hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_001 startBackgroundRunning callback error: %{public}s', JSON.stringify(error));
                    expect(error.code == 401).assertTrue();
                    done();
                  } else {
                    hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_001 startBackgroundRunning callback run success.');
                    hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_001 startBackgroundRunning callback res: %{public}s', JSON.stringify(data));

                    backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
                      console.info(" SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_001 stopBackgroundRunning promise run success");
                    }).catch((error: BusinessError) => {
                      console.error(` SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_001 stopBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                    });
                  }
                  done();
                })
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_001 startBackgroundRunning error: %{public}s', JSON.stringify(error));
                expect(error.code == 401).assertTrue();
                done();
              }
            }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_001 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
              done();
            });
          }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_001 getwantAgent error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_001 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_001 end---');
      });

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_002
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_002
     * @tc.desc   Test that the startBackgroundRunning function normal call with bgModeList and first parmeater is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_002 begin---');

        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let bgMode = backgroundTaskManager.BackgroundMode.AUDIO_PLAYBACK;
              try{
                backgroundTaskManager.startBackgroundRunning(undefined, bgMode, want,
                  (error: BusinessError,data: void) => {
                  if (error) {
                    hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_002 startBackgroundRunning callback error: %{public}s', JSON.stringify(error));
                    expect(error.code == 401).assertTrue();
                    done();
                  } else {
                    hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_002 startBackgroundRunning callback run success.');
                    hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_002 startBackgroundRunning callback res: %{public}s', JSON.stringify(data));

                    backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
                      console.info(" SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_002 stopBackgroundRunning promise run success");
                    }).catch((error: BusinessError) => {
                      console.error(` SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_002 stopBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                    });
                  }
                  done();
                })
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_002 startBackgroundRunning error: %{public}s', JSON.stringify(error));
                expect(error.code == 401).assertTrue();
                done();
              }
            }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_002 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
              done();
            });
          }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_002 getwantAgent error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_002 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_002 end---');
      });

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_003
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_003
     * @tc.desc   Test that the startBackgroundRunning function normal call with bgModeList and third parmeater is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_003 begin---');

        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let bgMode = backgroundTaskManager.BackgroundMode.AUDIO_PLAYBACK;
              try{
                backgroundTaskManager.startBackgroundRunning(ability.context, bgMode, null,
                  (error: BusinessError,data: void) => {
                  if (error) {
                    hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_003 startBackgroundRunning callback error: %{public}s', JSON.stringify(error));
                    expect(error.code == 401).assertTrue();
                    done();
                  } else {
                    hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_003 startBackgroundRunning callback run success.');
                    hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_003 startBackgroundRunning callback res: %{public}s', JSON.stringify(data));

                    backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
                      console.info(" SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_003 stopBackgroundRunning promise run success");
                    }).catch((error: BusinessError) => {
                      console.error(` SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_003 stopBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                    });
                  }
                  done();
                })
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_003 startBackgroundRunning error: %{public}s', JSON.stringify(error));
                expect(error.code == 401).assertTrue();
                done();
              }
            }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_003 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
              done();
            });
          }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_003 getwantAgent error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_003 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_003 end---');
      });

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_004
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_004
     * @tc.desc   Test that the startBackgroundRunning function normal call with bgModeList and third parmeater is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_004 begin---');

        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let bgMode = backgroundTaskManager.BackgroundMode.AUDIO_PLAYBACK;
              try{
                backgroundTaskManager.startBackgroundRunning(ability.context, bgMode, undefined,
                  (error: BusinessError,data: void) => {
                  if (error) {
                    hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_004 startBackgroundRunning callback error: %{public}s', JSON.stringify(error));
                    expect(error.code == 401).assertTrue();
                    done();
                  } else {
                    hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_004 startBackgroundRunning callback run success.');
                    hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_004 startBackgroundRunning callback res: %{public}s', JSON.stringify(data));

                    backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
                      console.info(" SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_004 stopBackgroundRunning promise run success");
                    }).catch((error: BusinessError) => {
                      console.error(` SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_004 stopBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                    });
                  }
                  done();
                })
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_004 startBackgroundRunning error: %{public}s', JSON.stringify(error));
                expect(error.code == 401).assertTrue();
                done();
              }
            }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_004 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
              done();
            });
          }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_004 getwantAgent error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_004 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_004 end---');
      });

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_005
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_005
     * @tc.desc   bgMode is DATA_TRANSFER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_005 begin---');

        await sleep(1500);

        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let bgMode = backgroundTaskManager.BackgroundMode.DATA_TRANSFER;
                backgroundTaskManager.startBackgroundRunning(ability.context, bgMode, want,
                  (error: BusinessError,data: void) => {
                  if (error) {
                    hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_005 startBackgroundRunning callback error: %{public}s', JSON.stringify(error));
                  } else {
                    hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_005 startBackgroundRunning callback run success.');
                    hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_005 startBackgroundRunning callback res: %{public}s', JSON.stringify(data));
                    expect(data).assertEqual(0);

                    backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
                      console.info(" SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_005 stopBackgroundRunning promise run success");
                    }).catch((error: BusinessError) => {
                      console.error(` SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_005 stopBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                    });

                    done();
                  }
                })
            }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_005 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
              done();
            });
          }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_005 getwantAgent error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_005 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_005 end---');
      });

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_006
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_006
     * @tc.desc   bgMode is AUDIO_RECORDING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_006 begin---');

        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let bgMode = backgroundTaskManager.BackgroundMode.AUDIO_RECORDING;
                backgroundTaskManager.startBackgroundRunning(ability.context, bgMode, want,
                  (error: BusinessError,data: void) => {
                  if (error) {
                    hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_006 startBackgroundRunning callback error: %{public}s', JSON.stringify(error));
                  } else {
                    hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_006 startBackgroundRunning callback run success.');
                    hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_006 startBackgroundRunning callback res: %{public}s', JSON.stringify(data));
                    expect(data).assertEqual(0);

                    backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
                      console.info(" SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_006 stopBackgroundRunning promise run success");
                    }).catch((error: BusinessError) => {
                      console.error(` SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_006 stopBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                    });

                    done();
                  }
                })
            }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_006 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
              done();
            });
          }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_006 getwantAgent error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_006 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_006 end---');
      });

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_007
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_007
     * @tc.desc   bgMode is TASK_KEPPING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_007 begin---');

        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let bgMode = backgroundTaskManager.BackgroundMode.TASK_KEEPING;
                backgroundTaskManager.startBackgroundRunning(ability.context, bgMode, want,
                  (error: BusinessError,data: void) => {
                  if (error) {
                    hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_007 startBackgroundRunning callback error: %{public}s', JSON.stringify(error));
                    expect(error.code == 9800005).assertTrue();
                    done();
                  } else {
                    hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_007 startBackgroundRunning callback run success.');
                    hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_007 startBackgroundRunning callback res: %{public}s', JSON.stringify(data));
                    expect(data).assertEqual(0);

                    backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
                      console.info(" SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_007 stopBackgroundRunning promise run success");
                    }).catch((error: BusinessError) => {
                      console.error(` SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_007 stopBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                    });

                    done();
                  }
                })
            }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_007 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
              done();
            });
          }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_007 getwantAgent error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_004 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_007 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_008
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_008
     * @tc.desc   bgMode is LOCATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_008 begin---');

        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let bgMode = backgroundTaskManager.BackgroundMode.LOCATION;
                backgroundTaskManager.startBackgroundRunning(ability.context, bgMode, want,
                  (error: BusinessError,data: void) => {
                  if (error) {
                    hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_008 startBackgroundRunning callback error: %{public}s', JSON.stringify(error));
                  } else {
                    hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_008 startBackgroundRunning callback run success.');
                    hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_008 startBackgroundRunning callback res: %{public}s', JSON.stringify(data));
                    expect(data).assertEqual(0);

                    backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
                      console.info(" SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_008 stopBackgroundRunning promise run success");
                    }).catch((error: BusinessError) => {
                      console.error(` SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_008 stopBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                    });

                    done();
                  }
                })
            }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_008 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
              done();
            });
          }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_008 getwantAgent error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_008 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_008 end---');
      });

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_012
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_012
     * @tc.desc   Test that the startBackgroundRunning promise function normal call and first parmeater is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_012 begin---');

        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let bgMode = backgroundTaskManager.BackgroundMode.AUDIO_PLAYBACK;
              try {
                backgroundTaskManager.startBackgroundRunning(null, bgMode, want).then(() => {
                    console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_012 startBackgroundRunning promise run success.');

                    backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
                      console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_012 stopBackgroundRunning promise run success.');
                    }).catch((error: BusinessError) => {
                      console.error(` SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_012 stopBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                    });
                  }).catch((error: BusinessError) => {
                    console.error(` SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_012 startBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                  });
                 } catch (error) {
                let e: BusinessError = error as BusinessError;
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_012 startBackgroundRunning error: %{public}s', JSON.stringify(error));
                expect(error.code == 401).assertTrue();
                done();
              }
            }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_012 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
              done();
            });
          }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_012 getwantAgent error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_012 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_012 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_013
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_013
     * @tc.desc   Test that the startBackgroundRunning promise function normal call and first parmeater is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_013 begin---');

        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let bgMode = backgroundTaskManager.BackgroundMode.AUDIO_PLAYBACK;
              let flag = 1;
              try {
                backgroundTaskManager.startBackgroundRunning(undefined, bgMode, want).then(() => {
                    console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_013 startBackgroundRunning promise run success.');
                    expect(flag == 1).assertTrue();

                    backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
                      console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_013 stopBackgroundRunning promise run success.');
                    }).catch((error: BusinessError) => {
                      console.error(` SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_013 stopBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                    });
                  }).catch((error: BusinessError) => {
                    console.error(` SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_013 startBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                  });
                 } catch (error) {
                let e: BusinessError = error as BusinessError;
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_013 startBackgroundRunning error: %{public}s', JSON.stringify(error));
                expect(error.code == 401).assertTrue();
                done();
              }
            }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_013 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
              done();
            });
          }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_013 getwantAgent error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_013 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_013 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_014
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_014
     * @tc.desc   Test that the startBackgroundRunning promise function normal call and third parmeater is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_014 begin---');

        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let bgMode = backgroundTaskManager.BackgroundMode.AUDIO_PLAYBACK;
              let flag = 1;
              try {
                backgroundTaskManager.startBackgroundRunning(ability.context, bgMode, null).then(() => {
                    console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_014 startBackgroundRunning promise run success.');
                    expect(flag == 1).assertTrue();

                    backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
                      console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_014 stopBackgroundRunning promise run success.');
                    }).catch((error: BusinessError) => {
                      console.error(` SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_014 stopBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                    });
                  }).catch((error: BusinessError) => {
                    console.error(` SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_014 startBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                  });
                 } catch (error) {
                let e: BusinessError = error as BusinessError;
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_014 startBackgroundRunning error: %{public}s', JSON.stringify(error));
                expect(error.code == 401).assertTrue();
                done();
              }
            }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_014 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
              done();
            });
          }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_014 getwantAgent error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_014 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_014 end---');
      });

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_015
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_015
     * @tc.desc   Test that the startBackgroundRunning promise function normal call and third parmeater is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_015 begin---');

        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let bgMode = backgroundTaskManager.BackgroundMode.AUDIO_PLAYBACK;
              let flag = 1;
              try {
                backgroundTaskManager.startBackgroundRunning(ability.context, bgMode, undefined).then(() => {
                    console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_015 startBackgroundRunning promise run success.');
                    expect(flag == 1).assertTrue();

                    backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
                      console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_015 stopBackgroundRunning promise run success.');
                    }).catch((error: BusinessError) => {
                      console.error(` SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_015 stopBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                    });
                  }).catch((error: BusinessError) => {
                    console.error(` SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_015 startBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                  });
                 } catch (error) {
                let e: BusinessError = error as BusinessError;
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_015 startBackgroundRunning error: %{public}s', JSON.stringify(error));
                expect(error.code == 401).assertTrue();
                done();
              }
            }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_015 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
              done();
            });
          }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_015 getwantAgent error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_015 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_015 end---');
      });

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_016
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_016
     * @tc.desc   startBackgroundRunning promise bgMode is DATA_TRANSFER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_016 begin---');

        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let bgMode = backgroundTaskManager.BackgroundMode.DATA_TRANSFER;
              let flag = 1;
                backgroundTaskManager.startBackgroundRunning(ability.context, bgMode, want).then(() => {
                    console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_016 startBackgroundRunning promise run success.');
                    expect(flag == 1).assertTrue();

                    backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
                      console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_016 stopBackgroundRunning promise run success.');
                      expect(flag).assertEqual(1);
                      done();
                    }).catch((error: BusinessError) => {
                      console.error(` SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_016 stopBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                    });
                  }).catch((error: BusinessError) => {
                    console.error(` SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_016 startBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                  });
               }).catch((error: BusinessError) => {
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_016 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
                 expect(false).assertTrue();
                 done();
               });
          }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_016 getwantAgent error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_016 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_016 end---');
      })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_017
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_017
     * @tc.desc   startBackgroundRunning promise bgMode is AUDIO_PLAYBACK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_017 begin---');

        await sleep(1500);

        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let bgMode = backgroundTaskManager.BackgroundMode.AUDIO_PLAYBACK;
              let flag = 1;
                backgroundTaskManager.startBackgroundRunning(ability.context, bgMode, want).then(() => {
                    console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_017 startBackgroundRunning promise run success.');
                    expect(flag == 1).assertTrue();

                    backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
                      console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_017 stopBackgroundRunning promise run success.');
                      expect(flag).assertEqual(1);
                      done();
                    }).catch((error: BusinessError) => {
                      console.error(` SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_017 stopBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                    });
                  }).catch((error: BusinessError) => {
                    console.error(` SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_017 startBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                  });
               }).catch((error: BusinessError) => {
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_017 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
                 expect(false).assertTrue();
                 done();
               });
          }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_017 getwantAgent error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_017 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_017 end---');
      });

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_018
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_018
     * @tc.desc   startBackgroundRunning promise bgMode is AUDIO_RECORDING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_018 begin---');

        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let bgMode = backgroundTaskManager.BackgroundMode.AUDIO_RECORDING;
              let flag = 1;
                backgroundTaskManager.startBackgroundRunning(ability.context, bgMode, want).then(() => {
                    console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_018 startBackgroundRunning promise run success.');
                    expect(flag == 1).assertTrue();

                    backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
                      console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_018 stopBackgroundRunning promise run success.');
                      expect(flag).assertEqual(1);
                      done();
                    }).catch((error: BusinessError) => {
                      console.error(` SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_018 stopBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                    });
                  }).catch((error: BusinessError) => {
                    console.error(` SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_018 startBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                  });
               }).catch((error: BusinessError) => {
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_018 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
                 expect(false).assertTrue();
                 done();
               });
          }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_018 getwantAgent error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_018 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_018 end---');
      });

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_019
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_019
     * @tc.desc   startBackgroundRunning promise bgMode is TASK_KEEPING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_019 begin---');

        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let bgMode = backgroundTaskManager.BackgroundMode.TASK_KEEPING;
              let flag = 1;
                backgroundTaskManager.startBackgroundRunning(ability.context, bgMode, want).then(() => {
                    console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_019 startBackgroundRunning promise run success.');
                    expect(flag == 1).assertTrue();

                    backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
                      console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_019 stopBackgroundRunning promise run success.');
                    }).catch((error: BusinessError) => {
                      console.error(` SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_019 stopBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                    });
                  }).catch((error: BusinessError) => {
                    console.error(` SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_019 startBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                    expect(error.code == 9800005).assertTrue();
                    done();
                  });
               }).catch((error: BusinessError) => {
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_019 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
                 expect(false).assertTrue();
                 done();
               });
          }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_019 getwantAgent error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_019 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_019 end---');
      });

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_020
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_020
     * @tc.desc   stopBackgroundRunning promise context is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_020 begin---');

        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
                try{
                backgroundTaskManager.stopBackgroundRunning(null).then(() => {
                  console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_020 stopBackgroundRunning promise run success.');
                }).catch((error: BusinessError) => {
                  console.error(` SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_019 stopBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                })} catch (error) {
                  let e: BusinessError = error as BusinessError;
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_020 aa error: %{public}s', JSON.stringify(error));
                  expect(error.code == 401).assertTrue();
                  done();
                }
               }).catch((error: BusinessError) => {
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_020 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
                 expect(false).assertTrue();
                 done();
               });
          }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_020 getwantAgent error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_020 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_020 end---');
      });

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_021
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_021
     * @tc.desc   stopBackgroundRunning promise context is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_021 begin---');

        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
                try{
                backgroundTaskManager.stopBackgroundRunning(undefined).then(() => {
                  console.info('SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_021 stopBackgroundRunning promise run success.');
                }).catch((error: BusinessError) => {
                  console.error(` SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_021 stopBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                })} catch (error) {
                  let e: BusinessError = error as BusinessError;
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_021 aa error: %{public}s', JSON.stringify(error));
                  expect(error.code == 401).assertTrue();
                  done();
                }
               }).catch((error: BusinessError) => {
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_021 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
                 expect(false).assertTrue();
                 done();
               });
          }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_021 getwantAgent error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_021 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_API9_XTS_021 end---');
      });

  })
}