/*
 * Copyright (C) 2024 HiHope Open Source Organization
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

import { describe, it, expect, beforeEach, beforeAll, Level } from '@ohos/hypium';
import { common, Want } from '@kit.AbilityKit';
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { data } from '@kit.TelephonyKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';

let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

function sleep(time: number){
  return new Promise<void>((resolve) => setTimeout(resolve, time))
}

export default function startAbilityByCallTest(){
  describe('ACTS_StartAbilityByCall_Test', () => {

    const TAG: string = 'TerminateselfWithResult';
    const TEST_SUITE_NAME: string = 'TerminateselfWithResultTest';
    let context: common.UIAbilityContext;
    beforeEach(async () => {
      let cmda = 'aa force-stop com.acts.systemappa';
      let cmdb = 'aa force-stop com.acts.systemappb';
      await abilityDelegator.executeShellCommand(cmda).catch((error: BusinessError) => {
        console.log("====> executeShellCommand error : " + JSON.stringify(error));
      });
      await abilityDelegator.executeShellCommand(cmdb).catch((error: BusinessError) => {
        console.log("====> executeShellCommand error : " + JSON.stringify(error));
      });
    })

    beforeAll(() =>{
      context = AppStorage.get<common.UIAbilityContext>('TestAbilityContext') as common.UIAbilityContext;
    })


    /*
     * @tc.number    : SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_5500
     * @tc.name      : SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_5500
     * @tc.desc      : Test CreateModuleContext function when context is null
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_5500', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_5500';
      await sleep(1000);

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['MainAbility_onForegroundCallBack']
      }
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then(async (subscribe) => {
        hilog.info(0x0000, 'testTag', '%{public}s', `createSubscribe OK` + JSON.stringify(commonEventSubscribeInfo));

        commonEventManager.subscribe(subscribe, async (err, commonEventData: commonEventManager.CommonEventData) => {
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribe successful,result: ${JSON.stringify(commonEventData)}`);
          try {
            expect(commonEventData.event).assertEqual('MainAbility_onForegroundCallBack');
            expect(Object.keys(commonEventData.parameters)[0]).assertEqual('error');
          } catch (err) {
          }
          await sleep(500);
          commonEventManager.unsubscribe(subscribe, (err, data) => {
            hilog.info(0x0000, TAG, '%{public}s', 'unsubscribe OK')
          });
          done();
        })

        let want: Want = {
          deviceId: '',
          bundleName: 'com.acts.systemappa',
          abilityName: 'MainAbility26'
        }
        try {
          context.startAbility(want, (err: BusinessError) => {
            if (err.code) {
              hilog.info(0x0000, TAG, '%{public}s',
                `${TEST_SUITE_NAME}#${TEST_CASE_NAME} sstartAbility failed, code is ${err.code}, message is ${err.message}`);
              expect().assertFail();
              done();
            }
          })
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
          expect().assertFail();
          done();
        }
      })
    })

    /*
     * @tc.number    : SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_0200
     * @tc.name      : SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_0200
     * @tc.desc      : Test CreateModuleContext function when context is null
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_0200', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_0200';
      await sleep(1000);

      let count_ability_onCreate: number = 0;
      let count_ability_onBackground: number = 0;
      let count_callOn: number = 0;
      let count_release: number = 0;
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [
          'SecondAbility_onCreateCallBack', 'SecondAbility_onBackgroundCallBack',
          'SecondAbility_calleeOnCallBack', 'MainAbility_releaseCallBack'
        ]
      }
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then(async (subscribe) => {
        hilog.info(0x0000, 'testTag', '%{public}s', `createSubscribe OK` + JSON.stringify(commonEventSubscribeInfo));

        commonEventManager.subscribe(subscribe, async (err, commonEventData: commonEventManager.CommonEventData) => {
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribe successful,result: ${JSON.stringify(commonEventData)}`);

          switch (commonEventData.event) {
            case 'SecondAbility_onCreateCallBack':
              try {
                expect(commonEventData?.parameters?.data).assertEqual('SecondAbility_onCreateCallBack_data');
                count_ability_onCreate++;
                hilog.info(0x0000, TAG, '%{public}s', 'SecondAbility_onCreateCallBack success')
              } catch (error) {
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
                expect().assertFail();
                done();
              }
              break;
            case 'SecondAbility_onBackgroundCallBack':
              try {
                expect(commonEventData?.parameters?.data).assertEqual('SecondAbility_onBackgroundCallBack_data');
                count_ability_onBackground++;
                hilog.info(0x0000, TAG, '%{public}s', 'SecondAbility_onBackgroundCallBack success');
              } catch (error) {
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
                expect().assertFail();
                done();
              }
              break;
            case 'SecondAbility_calleeOnCallBack':
              try {
                expect(commonEventData?.parameters?.data).assertEqual(TEST_CASE_NAME);
                count_callOn++;
                hilog.info(0x0000, TAG, '%{public}s', 'SecondAbility_calleeOnCallBack success');
              } catch (error) {
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
                expect().assertFail();
                done();
              }
              break;
            case 'MainAbility_releaseCallBack':
              try {
                expect(commonEventData?.parameters?.data)
                  .assertEqual(TEST_CASE_NAME + '_back'); // 确认发起方得到的返回值与服务方的返回值一致
                count_release++;
                hilog.info(0x0000, TAG, '%{public}s', 'MainAbility_releaseCallBack success');
              } catch (error) {
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
                expect().assertFail();
                done();
              }
              break;
          }

          setTimeout(() => {
            commonEventManager.unsubscribe(subscribe, (err, data) => {
              hilog.info(0x0000, TAG, '%{public}s', 'unsubscribe OK')
              expect(count_ability_onCreate).assertEqual(1);
              expect(count_ability_onBackground).assertEqual(1);
              expect(count_callOn).assertEqual(1);
              expect(count_release).assertEqual(1);
            });
            done();
          }, 4000);
        })

        try {
          let want: Want = {
            deviceId: '',
            bundleName: 'com.acts.systemappa',
            abilityName: 'MainAbility23',
            parameters: {
              data: TEST_CASE_NAME
            }
          }
          await context.startAbilityForResult(want).then((result: common.AbilityResult) => {
            // 执行正常业务
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful,result: ${JSON.stringify(result)}`);
            done();
          }).catch((err: BusinessError) => {
            // 处理业务逻辑错误
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
            expect().assertFail();
            done();
          })
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
          expect().assertFail();
          done();
        }
      })
    })

    /*
     * @tc.number    : SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_4700
     * @tc.name      : SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_4700
     * @tc.desc      : Test CreateModuleContext function when context is null
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_4700', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_4700';
      await sleep(1000);

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['MainAbility_onForegroundCallBack']
      }
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then(async (subscribe) => {
        hilog.info(0x0000, 'testTag', '%{public}s', `createSubscribe OK` + JSON.stringify(commonEventSubscribeInfo));

        commonEventManager.subscribe(subscribe, async (err, commonEventData: commonEventManager.CommonEventData) => {
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribe successful,result: ${JSON.stringify(commonEventData)}`);
          expect(commonEventData.event).assertEqual('MainAbility_onForegroundCallBack');
          expect(Object.keys(commonEventData.parameters)[0]).assertEqual('error');
          expect(commonEventData?.parameters?.error).assertEqual('16000050');
          await sleep(500);
          commonEventManager.unsubscribe(subscribe, (err, data) => {
            hilog.info(0x0000, TAG, '%{public}s', 'unsubscribe OK')
          });
          done();
        })

        let want: Want = {
          deviceId: '',
          bundleName: 'com.acts.systemappa',
          abilityName: 'MainAbility24'
        }
        try {
          await context.startAbilityForResult(want).then((result: common.AbilityResult) => {
            // 执行正常业务
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful,result: ${JSON.stringify(result)}`);
            done();
          }).catch((err: BusinessError) => {
            // 处理业务逻辑错误
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
            expect().assertFail();
            done();
          })
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
          expect().assertFail();
          done();
        }
      })
    })

    /*
     * @tc.number    : SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_1900
     * @tc.name      : SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_1900
     * @tc.desc      : Test CreateModuleContext function when context is null
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_1900', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_1900';
      await sleep(1000);

      let count_callOn_1: number = 0;
      let count_callOn_2: number = 0;
      let count_callOn_3: number = 0;
      let count_release: number = 0;

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [
          'SecondAbility_calleeOnCallBack_1', 'SecondAbility_calleeOnCallBack_2',
          'SecondAbility_calleeOnCallBack_3', 'MainAbility_releaseCallBack'
        ]
      }
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then(async (subscribe) => {
        hilog.info(0x0000, 'testTag', '%{public}s', `createSubscribe OK` + JSON.stringify(commonEventSubscribeInfo));

        commonEventManager.subscribe(subscribe, async (err, commonEventData: commonEventManager.CommonEventData) => {
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribe successful,result: ${JSON.stringify(commonEventData)}`);

          switch (commonEventData.event) {
            case 'SecondAbility_calleeOnCallBack_1':
              try {
                expect(commonEventData?.parameters?.data).assertEqual(TEST_CASE_NAME + '_1');
                hilog.info(0x0000, TAG, '%{public}s', 'SecondAbility_calleeOnCallBack_1 success');
                count_callOn_1++;
              } catch (error) {
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
                expect().assertFail();
                done();
              }
              break;
            case 'SecondAbility_calleeOnCallBack_2':
              try {
                expect(commonEventData?.parameters?.data).assertEqual(TEST_CASE_NAME + '_2');
                hilog.info(0x0000, TAG, '%{public}s', 'SecondAbility_calleeOnCallBack_2 success');
                count_callOn_2++;
              } catch (error) {
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
                expect().assertFail();
                done();
              }
              break;
            case 'SecondAbility_calleeOnCallBack_3':
              try {
                expect(commonEventData?.parameters?.data).assertEqual(TEST_CASE_NAME + '_3');
                hilog.info(0x0000, TAG, '%{public}s', 'SecondAbility_calleeOnCallBack_3 success');
                count_callOn_3++;
              } catch (error) {
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
                expect().assertFail();
                done();
              }
              break;
            case 'MainAbility_releaseCallBack':
              try {
                expect(commonEventData?.parameters?.data).assertEqual(TEST_CASE_NAME + '_3_back');
                hilog.info(0x0000, TAG, '%{public}s', 'MainAbility_releaseCallBack success');
                count_release++;
              } catch (error) {
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
                expect().assertFail();
                done();
              }
              break;
          }

          setTimeout(() => {
            commonEventManager.unsubscribe(subscribe, (err, data) => {
              hilog.info(0x0000, TAG, '%{public}s', 'unsubscribe OK');
              expect(count_callOn_1).assertEqual(1); //确认SecondAbility的Callee.on被调用
              expect(count_callOn_2).assertEqual(1);
              expect(count_callOn_3).assertEqual(1);
              expect(count_release).assertEqual(1);
            })
            done();
          }, 4000);
        })

        try {
          let want: Want = {
            deviceId: '',
            bundleName: 'com.acts.systemappa',
            abilityName: 'MainAbility22',
            parameters: {
              data: TEST_CASE_NAME
            }
          }

          context.startAbility(want, (err: BusinessError) => {
            if (err.code) {
              // 处理业务逻辑错误
              console.error(`startAbility failed, code is ${err.code}, message is ${err.message}`);
            }
          })
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
          expect().assertFail();
          done();
        }
      })
    })

    /*
     * @tc.number    : SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_4900
     * @tc.name      : SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_4900
     * @tc.desc      : Test CreateModuleContext function when context is null
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_4900', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_ABILITY_StartAbility_CommonComponent_Call_4900';
      await sleep(1000);

      let count_ability_onCreate: number = 0;
      let count_ability_onBackground: number = 0;
      let count_callOn: number = 0;
      let count_release: number = 0;
      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [
          'SecondAbility_onCreateCallBack', 'SecondAbility_onBackgroundCallBack',
          'SecondAbility_calleeOnCallBack', 'MainAbility_releaseCallBack'
        ]
      }
      await commonEventManager.createSubscriber(commonEventSubscribeInfo).then(async (subscribe) => {
        hilog.info(0x0000, 'testTag', '%{public}s', `createSubscribe OK` + JSON.stringify(commonEventSubscribeInfo));

        commonEventManager.subscribe(subscribe, async (err, commonEventData: commonEventManager.CommonEventData) => {
          hilog.info(0x0000, TAG, '%{public}s',
            `${TEST_SUITE_NAME}#${TEST_CASE_NAME} subscribe successful,result: ${JSON.stringify(commonEventData)}`);

          switch (commonEventData.event) {
            case 'SecondAbility_onCreateCallBack':
              try {
                expect(commonEventData?.parameters?.data).assertEqual('SecondAbility_onCreateCallBack_data');
                count_ability_onCreate++;
                hilog.info(0x0000, TAG, '%{public}s', 'SecondAbility_onCreateCallBack success')
              } catch (error) {
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
                expect().assertFail();
                done();
              }
              break;
            case 'SecondAbility_onBackgroundCallBack':
              try {
                expect(commonEventData?.parameters?.data).assertEqual('SecondAbility_onBackgroundCallBack_data');
                count_ability_onBackground++;
                hilog.info(0x0000, TAG, '%{public}s', 'SecondAbility_onBackgroundCallBack success');
              } catch (error) {
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
                expect().assertFail();
                done();
              }
              break;
            case 'SecondAbility_calleeOnCallBack':
              try {
                expect(commonEventData?.parameters?.data).assertEqual(TEST_CASE_NAME);
                count_callOn++;
                hilog.info(0x0000, TAG, '%{public}s', 'SecondAbility_calleeOnCallBack success');
              } catch (error) {
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
                expect().assertFail();
                done();
              }
              break;
            case 'MainAbility_releaseCallBack':
              try {
                expect(commonEventData?.parameters?.data)
                  .assertEqual(TEST_CASE_NAME + '_back'); // 确认发起方得到的返回值与服务方的返回值一致
                count_release++;
                hilog.info(0x0000, TAG, '%{public}s', 'MainAbility_releaseCallBack success');
              } catch (error) {
                hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
                expect().assertFail();
                done();
              }
              break;
          }

          setTimeout(() => {
            commonEventManager.unsubscribe(subscribe, (err, data) => {
              hilog.info(0x0000, TAG, '%{public}s', 'unsubscribe OK')
              expect(count_ability_onCreate).assertEqual(1);
              expect(count_ability_onBackground).assertEqual(1);
              expect(count_callOn).assertEqual(1);
              expect(count_release).assertEqual(1);
            })
            done();
          }, 3000);
        })

        try {
          let want: Want = {
            deviceId: '',
            bundleName: 'com.acts.systemappa',
            abilityName: 'MainAbility25',
            parameters: {
              data: TEST_CASE_NAME
            }
          }
          await context.startAbilityForResult(want).then(async (result: common.AbilityResult) => {
            // 执行正常业务
            hilog.info(0x0000, TAG, '%{public}s',
              `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ability successful,result: ${JSON.stringify(result)}`);
            await sleep(2000);
            done();
          }).catch((err: BusinessError) => {
            // 处理业务逻辑错误
            hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start ablility err : ${err}`);
            expect().assertFail();
            done();
          })
        } catch (error) {
          hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start fail : ${error}`);
          expect().assertFail();
          done();
        }
      })
    })
  })
}