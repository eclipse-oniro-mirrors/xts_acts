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

export default function ActsApi12LongTimeTaskManagerTest() {
  describe('ActsApi12LongTimeTaskManagerTest', () => {

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

      try {
        wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
          let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          delegator.getCurrentTopAbility().then((ability: UIAbility) => {

            backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
              console.info("ActsApi12LongTimeTaskManagerTest beforeAll stopBackgroundRunning promise run success");
            }).catch((error: BusinessError) => {
              console.error(`ActsApi12LongTimeTaskManagerTest beforeAll Operation startBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
            });

          }).catch((error: BusinessError) => {
            hilog.info(DOMAIN, TAG, 'ActsApi12LongTimeTaskManagerTest beforeAll getCurrentTopAbility error: %{public}s', JSON.stringify(error));
          });
          }).catch((error: BusinessError) => {
            hilog.info(DOMAIN, TAG, 'ActsApi12LongTimeTaskManagerTest beforeAll getWantAgent error: %{public}s', JSON.stringify(error));
          })
        }catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'ActsApi12LongTimeTaskManagerTest beforeAll aa error: %{public}s', JSON.stringify(error));
        }
      })

    afterAll(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'afterAll called');
      try {
        wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
          let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
          delegator.getCurrentTopAbility().then((ability: UIAbility) => {

            backgroundTaskManager.stopBackgroundRunning(ability.context).then(() => {
              console.info("ActsApi12LongTimeTaskManagerTest afterAll stopBackgroundRunning promise run success");
            }).catch((error: BusinessError) => {
              console.error(`ActsApi9LongTimeTaskManagerTest afterAll Operation stopBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
            });

          }).catch((error: BusinessError) => {
            hilog.info(DOMAIN, TAG, 'ActsApi12LongTimeTaskManagerTest afterAll getCurrentTopAbility error: %{public}s', JSON.stringify(error));
          });
        }).catch((error: BusinessError) => {
          hilog.info(DOMAIN, TAG, 'ActsApi12LongTimeTaskManagerTest afterAll getWantAgent error: %{public}s', JSON.stringify(error));
        })
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'ActsApi12LongTimeTaskManagerTest afterAll aa error: %{public}s', JSON.stringify(error));
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
              console.info("ActsApi12LongTimeTaskManagerTest afterEach stopBackgroundRunning promise run success");
            }).catch((error: BusinessError) => {
              console.error(`ActsApi9LongTimeTaskManagerTest afterEach Operation stopBackgroundRunning failed. code is ${error.code} message is ${error.message}`);
            });

          }).catch((error: BusinessError) => {
            hilog.info(DOMAIN, TAG, 'ActsApi12LongTimeTaskManagerTest afterEach getCurrentTopAbility error: %{public}s', JSON.stringify(error));
          });
        }).catch((error: BusinessError) => {
          hilog.info(DOMAIN, TAG, 'ActsApi12LongTimeTaskManagerTest afterEach getWantAgent error: %{public}s', JSON.stringify(error));
        })
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        hilog.info(DOMAIN, TAG, 'ActsApi12LongTimeTaskManagerTest afterEach aa error: %{public}s', JSON.stringify(error));
      }
    })

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_001
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_001
     * @tc.desc   Test that the startBackgroundRunning function normal call with bgModeList and first parmeater is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_001 begin---');

        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let bgModelist = ["location"];
              try{
                backgroundTaskManager.startBackgroundRunning(null, bgModelist, want).then((res) => {
                   hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_001 startBackgroundRunning promise run success');
                   hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_001 startBackgroundRunning promise res: %{public}s',JSON.stringify(res));

                   done();
                    }).catch((error: BusinessError) => {
                       hilog.info(DOMAIN, TAG,` SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_001 startBackgroundRunning promise error: %{public}s`,JSON.stringify(error));
                    })
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_001 aa error: %{public}s', JSON.stringify(error));
                expect(error.code == 401).assertTrue();
                done();
              }
            }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_001 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
              done();
            });
          }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_001 getWantAgent error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_001 aa error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_001 end---');
      });

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_002
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_002
     * @tc.desc   Test that the startBackgroundRunning function normal call with bgModeList and first parmeater is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_002 begin---');

        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let bgModelist = ["location"];
              try{
                backgroundTaskManager.startBackgroundRunning(undefined, bgModelist, want).then((res) => {
                   hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_002 startBackgroundRunning promise run success');
                   hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_002 startBackgroundRunning promise res: %{public}s',JSON.stringify(res));

                   done();
                    }).catch((error: BusinessError) => {
                      hilog.info(DOMAIN, TAG,` SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_002 startBackgroundRunning promise error: %{public}s`,JSON.stringify(error));
                    })
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_002 aa error: %{public}s', JSON.stringify(error));
                expect(error.code == 401).assertTrue();
                done();
              }
            }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_002 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
              done();
            });
          }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_002 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_002 getWantAgent error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_002 end---');
      });

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_003
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_003
     * @tc.desc   Test that the startBackgroundRunning function normal call with bgModeList and third parmeater is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_003 begin---');

        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let bgModelist = ["location"];
              try{
                backgroundTaskManager.startBackgroundRunning(ability.context, bgModelist, null).then((res) => {
                   hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_003 startBackgroundRunning promise run success');
                   hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_003 startBackgroundRunning promise res: %{public}s',JSON.stringify(res));

                   done();
                    }).catch((error: BusinessError) => {
                      hilog.info(DOMAIN, TAG,` SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_003 startBackgroundRunning promise error: %{public}s`,JSON.stringify(error));
                    })
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_003 aa error: %{public}s', JSON.stringify(error));
                expect(error.code == 401).assertTrue();
                done();
              }
            }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_003 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
              done();
            });
          }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_003 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_003 getWantAgent error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_003 end---');
      });

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_004
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_004
     * @tc.desc   Test that the startBackgroundRunning function normal call with bgModeList and third parmeater is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_004 begin---');

        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let bgModelist = ["location"];
              try{
                backgroundTaskManager.startBackgroundRunning(ability.context, bgModelist, undefined).then((res) => {
                   hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_004 startBackgroundRunning promise run success');
                   hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_004 startBackgroundRunning promise res: %{public}s',JSON.stringify(res));

                   done();
                    }).catch((error: BusinessError) => {
                      hilog.info(DOMAIN, TAG,` SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_004 startBackgroundRunning promise error: %{public}s`,JSON.stringify(error));
                    })
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_004 aa error: %{public}s', JSON.stringify(error));
                expect(error.code == 401).assertTrue();
                done();
              }
            }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_004 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
              done();
            });
          }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_004 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_004 getWantAgent error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_004 end---');
      });

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_005
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_005
     * @tc.desc   Test that the startBackgroundRunning function normal call with bgModeList and second parmeater is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_005 begin---');

        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let bgModelist = ["location"];
              try{
                backgroundTaskManager.startBackgroundRunning(ability.context, undefined, want).then((res) => {
                   hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_005 startBackgroundRunning promise run success');
                   hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_005 startBackgroundRunning promise res: %{public}s',JSON.stringify(res));

                   done();
                    }).catch((error: BusinessError) => {
                      hilog.info(DOMAIN, TAG,` SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_005 startBackgroundRunning promise error: %{public}s`,JSON.stringify(error));
                    })
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_005 aa error: %{public}s', JSON.stringify(error));
                expect(error.code == 401).assertTrue();
                done();
              }
            }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_005 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
              done();
            });
          }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_005 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_005 getWantAgent error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_005 end---');
      });

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_006
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_006
     * @tc.desc   Test that the startBackgroundRunning function normal call with bgModeList and second parmeater is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_006 begin---');

        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let bgModelist = ["location"];
              try{
                backgroundTaskManager.startBackgroundRunning(ability.context, null, want).then((res) => {
                   hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_006 startBackgroundRunning promise run success');
                   hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_006 startBackgroundRunning promise res: %{public}s',JSON.stringify(res));

                   done();
                    }).catch((error: BusinessError) => {
                      hilog.info(DOMAIN, TAG,`SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_006 startBackgroundRunning promise error: %{public}s`,JSON.stringify(error));
                    })
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_006 aa error: %{public}s', JSON.stringify(error));
                expect(error.code == 401).assertTrue();
                done();
              }
            }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_006 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
              done();
            });
          }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_006 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_006 getWantAgent error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_006 end---');
      });

    /**
     * @tc.name   SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_007
     * @tc.number SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_007
     * @tc.desc   bgMode is []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_007 begin---');

        try {
          wantAgent.getWantAgent(wantAgentInfo).then((want: WantAgent) => {
            let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
            delegator.getCurrentTopAbility().then((ability: UIAbility) => {
              let bgModelist = [];
              try{
                backgroundTaskManager.startBackgroundRunning(ability.context, bgModelist, want).then((res) => {
                   hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_007 startBackgroundRunning promise run success');
                   hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_007 startBackgroundRunning promise res: %{public}s',JSON.stringify(res));

                   done();
                    }).catch((error: BusinessError) => {
                      hilog.info(DOMAIN, TAG, `SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_007 startBackgroundRunning promise error: %{public}s`,JSON.stringify(error));
                    })
              } catch (error) {
                let e: BusinessError = error as BusinessError;
                hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_007 aa error: %{public}s', JSON.stringify(error));
                expect(error.code == 401).assertTrue();
                done();
              }
            }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_007 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
                expect(false).assertTrue();
              done();
            });
          }).catch((error: BusinessError) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_007 getCurrentTopAbility error: %{public}s', JSON.stringify(error));
              expect(false).assertTrue();
              done();
            })
        } catch (error) {
          let e: BusinessError = error as BusinessError;
          hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_007 getWantAgent error: %{public}s', JSON.stringify(error));
          expect(false).assertTrue();
          done();
        }

        hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_LONGTIME_TASK_API12_XTS_007 end---');
      });

  })
}