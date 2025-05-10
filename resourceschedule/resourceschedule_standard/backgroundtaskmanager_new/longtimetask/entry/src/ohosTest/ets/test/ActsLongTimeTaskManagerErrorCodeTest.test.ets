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

export default function LongTimeTaskManagerErrorCodeTest() {
  describe('ActsLongTimeTaskManagerErrorCodeTest', () => {

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

      try {
        wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
          let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          delegator.getCurrentTopAbility().then((ability: UIAbility) => {

            backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
              console.info("ActsLongTimeTaskManagerErrorCodeTest beforeAll stopBackgroundRunning promise run success");
            }).catch((error: BusinessError) => {
              console.error(`ActsLongTimeTaskManagerErrorCodeTest beforeAll Operation stopBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
            });

          }).catch((error: BusinessError) => {
            hilog.info(DOMAIN, TAG, 'ActsLongTimeTaskManagerErrorCodeTest beforeAll getCurrentTopAbility error: %{public}s', JSON.stringify(error));
          });
        }).catch((error: BusinessError) => {
          hilog.info(DOMAIN, TAG, 'ActsLongTimeTaskManagerErrorCodeTest beforeAll getWantAgent error: %{public}s', JSON.stringify(error));
        })
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'ActsLongTimeTaskManagerErrorCodeTest beforeAll aa error: %{public}s', JSON.stringify(error));
      }
    })

    afterAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'afterAll called');
      try {
        wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
          let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          delegator.getCurrentTopAbility().then((ability: UIAbility) => {

            backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
              console.info("ActsLongTimeTaskManagerErrorCodeTest afterAll stopBackgroundRunning promise run success");
            }).catch((error: BusinessError) => {
              console.error(`ActsLongTimeTaskManagerErrorCodeTest afterAll Operation stopBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
            });

          }).catch((error: BusinessError) => {
            hilog.info(DOMAIN, TAG, 'ActsLongTimeTaskManagerErrorCodeTest afterAll getCurrentTopAbility error: %{public}s', JSON.stringify(error));
          });
        }).catch((error: BusinessError) => {
          hilog.info(DOMAIN, TAG, 'ActsLongTimeTaskManagerErrorCodeTest afterAll getWantAgent error: %{public}s', JSON.stringify(error));
        })
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'ActsLongTimeTaskManagerErrorCodeTest afterAll aa error: %{public}s', JSON.stringify(error));
      }
    })

    beforeEach(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'beforeEach called');
    })

    afterEach(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'afterEach called');
    })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_001
     * @tc.name:SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_001
     * @tc.desc:Test that the stopBackgroundRunning function interface does not request ohos.permission.KEEP_BACKGROUND_RUNNING permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_001 begin---');

        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              backgroundTaskManager.stopBackgroundRunning(ability.context,
                (error: BusinessError, data: void) => {
                  if (error) {
                    hilog.info(DOMAIN, TAG, 'stopBackgroundRunning callback error: %{public}s', JSON.stringify(error));
                    expect(error.code).assertEqual(9800005);
                    done();
                  } else {
                    hilog.info(DOMAIN, TAG, 'stopBackgroundRunning callback run success.');
                    expect(false).assertTrue();
                    done();
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

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_001 end---');
      })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_002
     * @tc.name:SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_002
     * @tc.desc:Test that the startBackgroundRunning callback function error call with bgMode and errocode is 202
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_002 begin---');

        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let bgMode = 7;
              backgroundTaskManager.startBackgroundRunning(ability.context, bgMode, want,
                (error: BusinessError, data: void) => {
                  if (error) {
                    hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_002 startBackgroundRunning callback error: %{public}s', JSON.stringify(error));
                    expect(error.code == 202).assertTrue();
                    done();
                  } else {
                    hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_002 startBackgroundRunning callback run success.');
                    hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_002 startBackgroundRunning callback res: %{public}s', JSON.stringify(data));
                  }
                  done();
                })
            })
              .catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_002 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
              done();
            });
          }).catch((error: BusinessError) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_002 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_002 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_002 end---');
      })

      /*
     * @tc.number:SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_003
     * @tc.name:SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_003
     * @tc.desc:Test that the startBackgroundRunning promise function error call with bgMode and errocode is 202
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_003 begin---');

        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let bgMode = 7;
              backgroundTaskManager.startBackgroundRunning(ability.context, bgMode, want).then(() => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_003 startBackgroundRunning promise run success.');
                expect(false).assertTrue();
                done();
              }).catch((error: BusinessError) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_003 startBackgroundRunning promise error: %{public}s', JSON.stringify(error));
                expect(error.code == 202).assertTrue();
                done();
              })
            }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_003 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: BusinessError) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_003 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_003 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_003 end---');
      })
      

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_004
     * @tc.name:SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_004
     * @tc.desc:Test that the startBackgroundRunning promise function error call with bgModeList and errocode is 9800005
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_004 begin---');

        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let bgModeList = ["location"]
              backgroundTaskManager.startBackgroundRunning(ability.context, bgModeList, want).then((res) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_004 startBackgroundRunning promise run success.');
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_004 startBackgroundRunning promise res: %{public}s', JSON.stringify(res));
                let continuousTaskId = res.continuousTaskId
                let slotType = res.slotType
                let contentType = res.contentType
                let notificationId = res.notificationId
                console.info('SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_004 ContinuousTaskNotification continuousTaskId ' + continuousTaskId);
                console.info('SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_004 ContinuousTaskNotification slotType ' + slotType);
                console.info('SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_004 ContinuousTaskNotification contentType ' + contentType);
                console.info('SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_004 ContinuousTaskNotification notificationId ' + notificationId);
                expect(continuousTaskId).assertLarger(-1);
                expect(slotType).assertLarger(-1);
                expect(contentType).assertLarger(-1);
                expect(notificationId).assertLarger(-1);

                backgroundTaskManager.startBackgroundRunning(ability.context, bgModeList, want).then((res) => {
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_004 startBackgroundRunning2 promise run success.');
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_004 startBackgroundRunning2 promise res: %{public}s', JSON.stringify(res));
                }).catch((error: BusinessError) => {
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_004 startBackgroundRunning2 promise error: %{public}s', JSON.stringify(error));
                  expect(error.code).assertEqual(9800005);
                  backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
                    console.info("SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_004 stopBackgroundRunning promise run success");
                  }).catch((error: BusinessError) => {
                    console.error(`SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_004 Operation stopBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                  });
                  done();
              })
                done();
              }).catch((error: BusinessError) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_004 startBackgroundRunning promise error: %{public}s', JSON.stringify(error));
              })

            }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_004 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: BusinessError) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_004 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_004 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_004 end---');
      })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_005
     * @tc.name:SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_005
     * @tc.desc:Test that the startBackgroundRunning callback function error call with bgMode and errocode is 9800005
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_005 begin---');

        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let bgMode = backgroundTaskManager.BackgroundMode.AUDIO_PLAYBACK;
              backgroundTaskManager.startBackgroundRunning(ability.context, bgMode, want,
                (error: BusinessError, data: void) => {
                  if (error) {
                    hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_005 startBackgroundRunning callback error: %{public}s', JSON.stringify(error));
                  } else {
                    hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_005 startBackgroundRunning callback run success.');
                    hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_005 startBackgroundRunning callback res: %{public}s', JSON.stringify(data));
                    backgroundTaskManager.startBackgroundRunning(ability.context, bgMode, want,
                    (error: BusinessError, data: void) => {
                      if (error) {
                        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_005 startBackgroundRunning2 callback error: %{public}s', JSON.stringify(error));
                        expect(error.code).assertEqual(9800005);
                        backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
                          console.info("SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_005 stopBackgroundRunning promise run success");
                        }).catch((error: BusinessError) => {
                          console.error(`SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_005 Operation stopBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                        });
                        done();
                      } else {
                        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_005 startBackgroundRunning2 callback run success.');
                        hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_005 startBackgroundRunning2 callback res: %{public}s', JSON.stringify(data));
                      }
                        done();
                    })
                  }
                  done();
                })
            })
              .catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_005 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
              done();
            });
          }).catch((error: BusinessError) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_005 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_005 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_005 end---');
      })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_006
     * @tc.name:SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_006
     * @tc.desc:Test that the updateBackgroundRunning promise function error call with bgModeList and errocode is 9800005
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_006 begin---');

        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
                console.info("SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_006 stopBackgroundRunning promise run success");
              }).catch((error: BusinessError) => {
                console.error(`SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_006 Operation stopBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
              });

              let bgModeList = ["location"]
              backgroundTaskManager.updateBackgroundRunning(ability.context, bgModeList).then((res) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_006 updateBackgroundRunning promise run success.');
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_006 updateBackgroundRunning promise res: %{public}s', JSON.stringify(res));
              }).catch((error: BusinessError) => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_006 updateBackgroundRunning promise error: %{public}s', JSON.stringify(error));
                expect(error.code).assertEqual(9800005);
                done();
              })

              backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
                console.info("SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_006 stopBackgroundRunning2 promise run success");
              }).catch((error: BusinessError) => {
                console.error(`SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_006 Operation stopBackgroundRunning2 failed. code is ${error.code} message is ${error.message}`);
              });
            }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_006 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: BusinessError) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_006 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_006 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_006 end---');
      })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_007
     * @tc.name:SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_007
     * @tc.desc:Test that the stopBackgroundRunning promise function error call and errocode is 9800005
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_007 begin---');

        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
                console.info("SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_007 stopBackgroundRunning promise run success");
              }).catch((error: BusinessError) => {
                console.error(`SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_007 Operation stopBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                done();
              });
              backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
                console.info("SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_007 stopBackgroundRunning promise run success");
              }).catch((error: BusinessError) => {
                console.error(`SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_007 Operation stopBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                expect(error.code).assertEqual(9800005);
                done();
              });
            }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_007 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: BusinessError) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_007 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_007 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_007 end---');
      })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_008
     * @tc.name:SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_008
     * @tc.desc:Test that the startBackgroundRunning promise function error call with bgMode and errocode is 9800005
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_008 begin---');

        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let bgMode = backgroundTaskManager.BackgroundMode.AUDIO_PLAYBACK;
              backgroundTaskManager.startBackgroundRunning(ability.context, bgMode, want).then(() => {
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_008 startBackgroundRunning promise run success.');

                backgroundTaskManager.startBackgroundRunning(ability.context, bgMode, want).then(() => {
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_008 startBackgroundRunning promise run success.');
                  expect(false).assertTrue();
                  done();
                }).catch((error: BusinessError) => {
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_008 startBackgroundRunning2 promise error: %{public}s', JSON.stringify(error));
                  expect(error.code == 9800005).assertTrue();
                  backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
                    console.info("SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_007 stopBackgroundRunning promise run success");
                  }).catch((error: BusinessError) => {
                    console.error(`SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_007 Operation stopBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
                    done();
                  });
                  done();
                })
                }).catch((error: BusinessError) => {
                  hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_008 startBackgroundRunning promise error: %{public}s', JSON.stringify(error));
                  expect(false).assertTrue();
                  done();
                })
            }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_008 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            });
          }).catch((error: BusinessError) => {
            hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_008 getWantAgent error: %{public}s', JSON.stringify(error));
            expect(false).assertTrue();
            done();
          })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_008 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_008 end---');
      })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_009
     * @tc.name:SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_009
     * @tc.desc:Test that the requestSuspendDelay callback function error call and errocode is 9900002
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_009 begin---');

        try {
          let myReason = 'test requestSuspendDelay';
          try {
            let delayInfo = backgroundTaskManager.requestSuspendDelay(myReason, () => {
            console.info("SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_009 Request1 suspension delay will time out.");
          });
          let id = delayInfo.requestId;
          let time = delayInfo.actualDelayTime;
          console.info("SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_009 The requestId1 is: " + id);
          console.info("SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_009 The actualDelayTime1 is: " + time);
          } catch (error) {
            console.error(`SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_009 requestSuspendDelay1 failed. code is ${(error as BusinessError).code} message is ${(error as BusinessError).message}`);
          };
          
          try {
            let delayInfo = backgroundTaskManager.requestSuspendDelay(myReason, () => {
            console.info("SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_009 Request2 suspension delay will time out.");
          });
          let id = delayInfo.requestId;
          let time = delayInfo.actualDelayTime;
          console.info("SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_009 The requestId2 is: " + id);
          console.info("SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_009 The actualDelayTime2 is: " + time);
          } catch (error) {
            console.error(`SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_009 requestSuspendDelay2 failed. code is ${(error as BusinessError).code} message is ${(error as BusinessError).message}`);
          };

          try {
            let delayInfo = backgroundTaskManager.requestSuspendDelay(myReason, () => {
            console.info("SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_009 Request3 suspension delay will time out.");
          });
          let id = delayInfo.requestId;
          let time = delayInfo.actualDelayTime;
          console.info("SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_009 The requestId3 is: " + id);
          console.info("SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_009 The actualDelayTime3 is: " + time);
          } catch (error) {
            console.error(`SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_009 requestSuspendDelay3 failed. code is ${(error as BusinessError).code} message is ${(error as BusinessError).message}`);
          };

          try {
            let delayInfo = backgroundTaskManager.requestSuspendDelay(myReason, () => {
            console.info("SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_009 Request4 suspension delay will time out.");
          });
          let id = delayInfo.requestId;
          let time = delayInfo.actualDelayTime;
          console.info("SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_009 The requestId4 is: " + id);
          console.info("SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_009 The actualDelayTime4 is: " + time);
          } catch (error) {
            console.error(`SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_009 requestSuspendDelay4 failed. code is ${(error as BusinessError).code} message is ${(error as BusinessError).message}`);
            expect(Number(error.code)).assertEqual(9900002);
            done();
          };

          } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_009 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_006 end---');
      }) 

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_010
     * @tc.name:SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_010
     * @tc.desc:Test that the getRemainingDelayTime promise function error call and errocode is 9900001
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_010 begin---');

        try {
          let id = 100;
          backgroundTaskManager.getRemainingDelayTime(id).then((res: number) => {
            console.log('promise => Operation getRemainingDelayTime succeeded. Data: ' + JSON.stringify(res));
          }).catch((error: BusinessError) => {
            console.error(`SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_010 Operation getRemainingDelayTime failed. code is ${error.code} message is ${error.message}`);
            expect(Number(error.code)).assertEqual(9900001);
            done();
          })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_010 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_010 end---');
      })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_011
     * @tc.name:SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_011
     * @tc.desc:Test that the getRemainingDelayTime callback function error call and errocode is 9900001
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_011 begin---');

        try {
          let id = 100;
          backgroundTaskManager.getRemainingDelayTime(id, (error: BusinessError, res: number) => {
            if(error) {
              console.error(`SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_012 getRemainingDelayTime failed. code is ${error.code} message is ${error.message}`);
              expect(Number(error.code)).assertEqual(9900001);
              done();
            } else {
              console.log('SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_011 Operation getRemainingDelayTime succeeded. Data: ' + JSON.stringify(res));
            }
          })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_011 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_011 end---');
      }) 

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_012
     * @tc.name:SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_012
     * @tc.desc:Test that the cancelSuspendDelay callback function error call and errocode is 9900001
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_012 begin---');

        try {
          let id = 123;
          try {
            backgroundTaskManager.cancelSuspendDelay(id);
          } catch (error) {
            console.error(`SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_012 cancelSuspendDelay failed. code is ${(error as BusinessError).code} message is ${(error as BusinessError).message}`);
            expect(Number(error.code)).assertEqual(9900001);
            done();
          }
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_012 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_ERR_TASK_XTS_012 end---');
      })

  })
}