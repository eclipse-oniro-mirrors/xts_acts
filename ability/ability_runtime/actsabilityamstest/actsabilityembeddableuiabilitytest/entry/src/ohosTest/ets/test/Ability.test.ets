/*
 * Copyright (C) 2024 HiHope Open Source Organization.
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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import{ appManager, common, StartOptions, Want, wantConstant } from '@kit.AbilityKit';
import{ BusinessError, commonEventManager } from '@kit.BasicServicesKit';
import{ data } from '@kit.TelephonyKit';
import { systemParameterEnhance } from '@kit.BasicServicesKit';
import { Driver, ON ,Component } from '@kit.TestKit';
import startability from '../../../main/ets/startability/startAbility';
const DOMAIN_NUMBER: number = 0xFF00;

function sleep(time: number){
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function abilityTest() {
  describe('SUB_Ability_AbilityRuntime_deeplink', () => {
    const TEST_SUITE_NAME: string = 'SUB_Ability_AbilityRuntime_deeplink_Tset';
    const TAG: string = 'SUB_Ability_AbilityRuntime_deeplink';
    let context: common.UIAbilityContext;
    beforeAll(() => {
      context = AppStorage.get<Context>('abilityContext') as common.UIAbilityContext;
      let want1: Want = {
        deviceId: '',
        bundleName: 'com.example.appa',
        abilityName: 'TestAbility',
      }
      context.startAbility(want1);
    })
    beforeEach(async (done:Function) => {
      await sleep(2000);
      done();
    })


    afterAll(() => {
    })
    /**
     * @tc.number SUB_Ability_AbilityRuntime_EmbeddableUIAbility_3100
     * @tc.name SUB_Ability_AbilityRuntime_EmbeddableUIAbility_3100
     * @tc.desc Verify the jump start EmbeddableUIAbility invoking isTerminating.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_EmbeddableUIAbility_3100', Level.LEVEL0, async (done:Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_EmbeddableUIAbility_3100';
      console.info('enter into test');
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} =========`);
      let subscriber: commonEventManager.CommonEventSubscriber | null = null;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['isTerminating'],
      };
      commonEventManager.createSubscriber(subscribeInfo, async (err: BusinessError, subscriberdata: commonEventManager.CommonEventSubscriber) => {
        console .log(TAG, '%{public}s',`createSubscriber data1: state ${JSON.stringify(subscriberdata) },${JSON.stringify(err)}`);
        if (err) {
          hilog.error(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
          return;
        }
        hilog.info(0x0000, TAG, '%{public}s', ' Succeeded in creating subscriber.');
        subscriber = subscriberdata;

        commonEventManager.subscribe(subscriber, (err: BusinessError, data: commonEventManager.CommonEventData) => {
          console .log(  TAG, '%{public}s',JSON.stringify(data));
          console.log('this subscribe is success2');

          if (err) {
            hilog.error(0x0000, TAG, '%{public}s', `Failed to subscribe common event. Code is ${err.code}, message is ${err.message}`);
            return;
          }else {
            hilog.info(0x0000, TAG, '%{public}s', 'this push data is isTerminating', '%{public}s', data.data);
            expect(JSON.stringify('false')).assertEqual(JSON.stringify(data.data));
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              hilog.info(0x0000, TAG, '%{public}s', 'unsubscribe OK');
            });
            done();
          }
        })
        let want: Want = {
          deviceId: '',
          bundleName: 'com.example.appa',
          abilityName: 'embeddableUIAbility',
        }
        context.startAbility(want);
      })

    })
    /**
     * @tc.number SUB_Ability_AbilityRuntime_EmbeddableUIAbility_3200.
     * @tc.name SUB_Ability_AbilityRuntime_EmbeddableUIAbility_3200.
     * @tc.desc Verify the jump start EmbeddableUIAbility invoking moveAbilityToBackground.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_EmbeddableUIAbility_3200', Level.LEVEL0, async (done:Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_EmbeddableUIAbility_3200';
      console.info('enter into test');
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME}  =========`);
      let subscriber: commonEventManager.CommonEventSubscriber | null = null;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['moveAbilityToBackground'],
      };
      commonEventManager.createSubscriber(subscribeInfo, async (err: BusinessError, subscriberdata: commonEventManager.CommonEventSubscriber) => {
        if (err) {
          hilog.error(0x0000, TAG, '%{public}s', `Failed to create subscriber. Code is ${JSON.stringify(err.code)}, message is ${JSON.stringify(err.message)}`);
          return;
        }
        hilog.info(0x0000, TAG, '%{public}s', 'Succeeded in creating subscriber.');
        subscriber = subscriberdata;
        commonEventManager.subscribe(subscriber, (err: BusinessError, data: commonEventManager.CommonEventData) => {
          console .log('this push data is a'+JSON.stringify(data));
          console.log('this subscribe is success2');
          if (err) {
            hilog.error(0x0000, TAG, '%{public}s', `Failed to subscribe common event. Code is ${err.code}, message is ${err.message}`);
            return;
          }else {
            hilog.info(0x0000, TAG, '%{public}s', 'this push data is moveAbilityToBackground success', '%{public}s', data.data);
            if(data.code == 16000061){
              hilog.info(0x0000, TAG, '%{public}s', 'current device not support moveAbilityToBackground');
              done();
            }else{
              expect(JSON.stringify('1')).assertEqual(JSON.stringify(data.data));
              commonEventManager.unsubscribe(subscriber, (err, data) => {
                hilog.info(0x0000, TAG, '%{public}s', 'unsubscribe OK');
              });
              done();
            }
          }
        })
        let want: Want = {
          deviceId: '',
          bundleName: 'com.example.appa',
          abilityName: 'moveabilitytobackground',
        }
        context.startAbility(want);
      })
    })
    /**
     * @tc.number SUB_Ability_AbilityRuntime_EmbeddableUIAbility_2600.
     * @tc.name SUB_Ability_AbilityRuntime_EmbeddableUIAbility_2600.
     * @tc.desc Verify the jump start EmbeddableUIAbility invoking reportDrawnCompleted.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_EmbeddableUIAbility_2600', Level.LEVEL0, async (done:Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_EmbeddableUIAbility_2600';
      console.info('enter into test');
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME}  =========`);
      let subscriber: commonEventManager.CommonEventSubscriber | null = null;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['reportDrawn'],
      };
      commonEventManager.createSubscriber(subscribeInfo, async (err: BusinessError, subscriberdata: commonEventManager.CommonEventSubscriber) => {
        if (err) {
          hilog.error(0x0000, TAG, '%{public}s', `Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
          return;
        }
        hilog.info(0x0000, TAG, '%{public}s', 'Succeeded in creating subscriber.');
        subscriber = subscriberdata;
        commonEventManager.subscribe(subscriber, (err: BusinessError, data: commonEventManager.CommonEventData) => {
          console .log('this push data is a'+JSON.stringify(data));
          console.log('this subscribe is success2');
          if (err) {
            hilog.error(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} Failed to subscribe common event. Code is ${err.code}, message is ${err.message}`);
            return;
          }else {
            hilog.info(0x0000, TAG, '%{public}s', 'this push data is reportDrawn success', '%{public}s', data.data);
            expect(JSON.stringify('1')).assertEqual(JSON.stringify(data.data));
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              hilog.info(0x0000, TAG, '%{public}s', 'unsubscribe OK');
            });
            done();
          }
        })
        let want: Want = {
          deviceId: '',
          bundleName: 'com.example.appa',
          abilityName: 'reportDrawnCompleted',
        }
        context.startAbility(want);
      })

    })
    /**
     * @tc.number SUB_Ability_AbilityRuntime_EmbeddableUIAbility_3000.
     * @tc.name SUB_Ability_AbilityRuntime_EmbeddableUIAbility_3000.
     * @tc.desc Verify the jump start EmbeddableUIAbility invoking restoreWindowStage.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_EmbeddableUIAbility_3000', Level.LEVEL0, async (done:Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_EmbeddableUIAbility_3000';
      console.info('enter into test');
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME}  =========`);
      let subscriber: commonEventManager.CommonEventSubscriber | null = null;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['restoreWindowStage'],
      };
      commonEventManager.createSubscriber(subscribeInfo, async (err: BusinessError, subscriberdata: commonEventManager.CommonEventSubscriber) => {
        if (err) {
          hilog.error(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} Failed to create subscriber. Code is ${JSON.stringify(err.code)}, message is ${JSON.stringify(err.message)}`);
          return;
        }
        hilog.info(0x0000, TAG, '%{public}s', 'Succeeded in creating subscriber.');
        subscriber = subscriberdata;
        commonEventManager.subscribe(subscriber, (err: BusinessError, data: commonEventManager.CommonEventData) => {
          console .log('this push data is a'+JSON.stringify(data));
          console.log('this subscribe is success2');
          if (err) {
            hilog.error(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} Failed to subscribe common event. Code is ${err.code}, message is ${err.message}`);
            return;
          }else {
            hilog.info(0x0000, 'this push data is restoreWindowStage success', '%{public}s', data.data);
            expect(JSON.stringify('1')).assertEqual(JSON.stringify(data.data));
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              hilog.info(0x0000, TAG, '%{public}s', '%{public}s', 'unsubscribe OK');
            });
            done();
          }
        })
        let want: Want = {
          deviceId: '',
          bundleName: 'com.example.appa',
          abilityName: 'restoreWindowStage',
        }
        context.startAbility(want);
      })

    })
    /**
     * @tc.number SUB_Ability_AbilityRuntime_EmbeddableUIAbility_2900
     * @tc.name SUB_Ability_AbilityRuntime_EmbeddableUIAbility_2900
     * @tc.desc Verify the jump start EmbeddableUIAbility invoking setMissionContinueState.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_EmbeddableUIAbility_2900', Level.LEVEL0, async (done:Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_EmbeddableUIAbility_2900';
      console.info('enter into test');
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} =========`);
      let subscriber: commonEventManager.CommonEventSubscriber | null = null;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['setMissionContinue'],
      };
      commonEventManager.createSubscriber(subscribeInfo, async (err: BusinessError, subscriberdata: commonEventManager.CommonEventSubscriber) => {
        console .log('createSubscriber data1: state',`${TEST_SUITE_NAME}#${TEST_CASE_NAME} ${JSON.stringify(subscriberdata) },${JSON.stringify(err)}`);
        if (err) {
          hilog.error(0x0000, TAG, '%{public}s', `Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
          return;
        }
        hilog.info(0x0000, TAG, '%{public}s', 'Succeeded in creating subscriber.');
        subscriber = subscriberdata;
        commonEventManager.subscribe(subscriber, (err: BusinessError, data: commonEventManager.CommonEventData) => {
          console .log('this push data is a'+JSON.stringify(data));
          console.log('this subscribe is success2');
          if (err) {
            hilog.error(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} Failed to subscribe common event. Code is ${err.code}, message is ${err.message}`);
            return;
          }else {
            hilog.info(0x0000, 'this push data is setMissionContinue success', '%{public}s', data.data);
            expect(JSON.stringify('1')).assertEqual(JSON.stringify(data.data));
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              hilog.info(0x0000, TAG, '%{public}s', 'unsubscribe OK');
            });
            done();
          }
        })
        let want: Want = {
          deviceId: '',
          bundleName: 'com.example.appa',
          abilityName: 'setMissionContinueState',
        }
        context.startAbility(want);
      })

    })
    /**
     * @tc.number SUB_Ability_AbilityRuntime_EmbeddableUIAbility_2800
     * @tc.name SUB_Ability_AbilityRuntime_EmbeddableUIAbility_2800
     * @tc.desc Verify the jump start EmbeddableUIAbility invoking setMissionLabel.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_EmbeddableUIAbility_2800', Level.LEVEL0, async (done:Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_EmbeddableUIAbility_2800';
      console.info('enter into test');
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_CASE_NAME}  =========`);
      let subscriber: commonEventManager.CommonEventSubscriber | null = null;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['setMissionLabel'],
      };
      commonEventManager.createSubscriber(subscribeInfo, async (err: BusinessError, subscriberdata: commonEventManager.CommonEventSubscriber) => {
        console .log('createSubscriber data1: state',`${JSON.stringify(subscriberdata) },${JSON.stringify(err)}`);
        if (err) {
          hilog.error(0x0000, TAG, '%{public}s', `Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
          return;
        }
        hilog.info(0x0000, TAG, '%{public}s', 'Succeeded in creating subscriber.');
        subscriber = subscriberdata;
        commonEventManager.subscribe(subscriber, (err: BusinessError, data: commonEventManager.CommonEventData) => {
          if (err) {
            hilog.error(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} Failed to subscribe common event. Code is ${err.code}, message is ${err.message}`);
            return;
          }else {
            hilog.info(0x0000, 'this push data is setMissionLabel success', '%{public}s', data.data);
            expect(JSON.stringify('1')).assertEqual(JSON.stringify(data.data));
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              hilog.info(0x0000, TAG, '%{public}s', 'unsubscribe OK');
            });
            done();
          }
        })
        let want: Want = {
          deviceId: '',
          bundleName: 'com.example.appa',
          abilityName: 'setMissionLabel',
        }
        context.startAbility(want);
      })

    })
    /**
     * @tc.number SUB_Ability_AbilityRuntime_EmbeddableUIAbility_2300
     * @tc.name SUB_Ability_AbilityRuntime_EmbeddableUIAbility_2300
     * @tc.desc Verify the jump start EmbeddableUIAbility invoking startability.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_EmbeddableUIAbility_2300', Level.LEVEL0, async (done:Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_EmbeddableUIAbility_2300';
      console.info('enter into test');
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME}  =========`);
      let subscriber: commonEventManager.CommonEventSubscriber | null = null;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['startAbility'],
      };
      commonEventManager.createSubscriber(subscribeInfo, async (err: BusinessError, subscriberdata: commonEventManager.CommonEventSubscriber) => {
        console .log('createSubscriber data1: state',`${JSON.stringify(subscriberdata) },${JSON.stringify(err)}`);
        if (err) {
          hilog.error(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
          return;
        }
        hilog.info(0x0000, TAG, '%{public}s', 'Succeeded in creating subscriber.');
        subscriber = subscriberdata;
        commonEventManager.subscribe(subscriber, (err: BusinessError, data: commonEventManager.CommonEventData) => {
          console .log('this push data is a'+JSON.stringify(data));
          if (err) {
            hilog.error(0x0000, TAG, '%{public}s', `Failed to subscribe common event. Code is ${err.code}, message is ${err.message}`);
            return;
          }else {
            hilog.info(0x0000, 'this push data is startAbility success', '%{public}s', data.data);
            expect(JSON.stringify('1')).assertEqual(JSON.stringify(data.data));
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              hilog.info(0x0000, TAG, '%{public}s', 'unsubscribe OK');
            });
            done();
          }
        })
        let want: Want = {
          deviceId: '',
          bundleName: 'com.example.appa',
          abilityName: 'startAbility',
        }
        context.startAbility(want);
      })

    })
    /**
     * @tc.number SUB_Ability_AbilityRuntime_EmbeddableUIAbility_2400
     * @tc.name SUB_Ability_AbilityRuntime_EmbeddableUIAbility_2400
     * @tc.desc Verify the jump start EmbeddableUIAbility invoking startAbilityForResult.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_EmbeddableUIAbility_2400', Level.LEVEL0, async (done:Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_EmbeddableUIAbility_2400';
      console.info('enter into test');
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} =========`);
      let subscriber: commonEventManager.CommonEventSubscriber | null = null;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['startAbilityForResult'],
      };
      commonEventManager.createSubscriber(subscribeInfo, async (err: BusinessError, subscriberdata: commonEventManager.CommonEventSubscriber) => {
        console .log('createSubscriber data1: state',`${TEST_SUITE_NAME}#${TEST_CASE_NAME} ${JSON.stringify(subscriberdata) },${JSON.stringify(err)}`);
        if (err) {
          hilog.error(0x0000, TAG, '%{public}s', `Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
          return;
        }
        hilog.info(0x0000, TAG, '%{public}s', 'Succeeded in creating subscriber.');
        subscriber = subscriberdata;
        commonEventManager.subscribe(subscriber, (err: BusinessError, data: commonEventManager.CommonEventData) => {
          console .log('this push data is a'+JSON.stringify(data));
          if (err) {
            hilog.error(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} Failed to subscribe common event. Code is ${err.code}, message is ${err.message}`);
            return;
          }else {
            hilog.info(0x0000, 'this push data is startAbilityForResult success', '%{public}s', data.data);
            expect(JSON.stringify('1')).assertEqual(JSON.stringify(data.data));
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              hilog.info(0x0000, TAG, '%{public}s', 'unsubscribe OK');
            });
            done();
          }
        })
        let want: Want = {
          deviceId: '',
          bundleName: 'com.example.appa',
          abilityName: 'startAbilityForResult',
        }
        context.startAbilityForResult(want);
      })

    })
    /**
     * @tc.number SUB_Ability_AbilityRuntime_EmbeddableUIAbility_2700
     * @tc.name SUB_Ability_AbilityRuntime_EmbeddableUIAbility_2700
     * @tc.desc Verify the jump start EmbeddableUIAbility invoking terminateSelfWithResult.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_EmbeddableUIAbility_2700', Level.LEVEL0, async (done:Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_EmbeddableUIAbility_2700';
      console.info('enter into test');
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME}  =========`);
      let want: Want = {
        deviceId: '',
        bundleName: 'com.example.appa',
        abilityName: 'terminateSelfWithResult',
      }
      let options: StartOptions = {
        displayId: 0
      };
      console.log('success want');
      try {
        context.startAbilityForResult(want, options, (err: BusinessError, result: common.AbilityResult) => {
          if (err.code) {
            console.error(`startAbilityForResult failed, code is ${err.code}, message is ${err.message}`);
            return;
          }
          console.info('startAbilityForResult succeed');
          console.info('result.resultCode:'+JSON.stringify(result.resultCode));
          expect(JSON.stringify(100)).assertEqual(JSON.stringify(result.resultCode));
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
        console.error(` ${TEST_SUITE_NAME}#${TEST_CASE_NAME} startAbilityForResult failed, code is ${code}, message is ${message}`);
      }

    })
    /**
     * @tc.number SUB_Ability_AbilityRuntime_EmbeddableUIAbility_1800
     * @tc.name SUB_Ability_AbilityRuntime_EmbeddableUIAbility_1800
     * @tc.desc Verify the jump start EmbeddableUIAbility invoking isTerminating.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_EmbeddableUIAbility_1800', Level.LEVEL0, async (done:Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_EmbeddableUIAbility_1800';
      console.info('enter into test');
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME}  =========`);
      let subscriber: commonEventManager.CommonEventSubscriber | null = null;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['startAbility'],
      };
      commonEventManager.createSubscriber(subscribeInfo, async (err: BusinessError, subscriberdata: commonEventManager.CommonEventSubscriber) => {
        if (err) {
          hilog.error(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME}Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
          return;
        }
        hilog.info(0x0000, TAG, '%{public}s', 'Succeeded in creating subscriber.');
        subscriber = subscriberdata;
        commonEventManager.subscribe(subscriber, (err: BusinessError, data: commonEventManager.CommonEventData) => {
          console .log('this push data is a'+JSON.stringify(data));
          if (err) {
            hilog.error(0x0000, TAG, '%{public}s', `Failed to subscribe common event. Code is ${err.code}, message is ${err.message}`);
            return;
          }else {
            hilog.info(0x0000, TAG, '%{public}s', 'this push data is pstartAbility success', '%{public}s', data.data);
            expect(JSON.stringify('1')).assertEqual(JSON.stringify(data.data));
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              hilog.info(0x0000, TAG, '%{public}s', 'unsubscribe OK');
            });
            done();
          }
        })
        let want: Want = {
          deviceId: '',
          bundleName: 'com.example.appa',
          abilityName: 'startAbility',
          parameters:{
            'wantConstant.Params.SHOW_MODE_KEY':wantConstant.ShowMode.EMBEDDED_FULL
          }

        }
        context.startAbilityForResult(want);
      })

    })
    /**
     * @tc.number SUB_Ability_AbilityRuntime_EmbeddableUIAbility_1900
     * @tc.name SUB_Ability_AbilityRuntime_EmbeddableUIAbility_1900
     * @tc.desc Verify the jump start EmbeddableUIAbility invoking isTerminating.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_EmbeddableUIAbility_1900', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_EmbeddableUIAbility_1900';
      console.info('enter into test');
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME}  =========`);
      let subscriber: commonEventManager.CommonEventSubscriber | null = null;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['startAbilityForResult'],
      };
      commonEventManager.createSubscriber(subscribeInfo, async (err: BusinessError, subscriberdata: commonEventManager.CommonEventSubscriber) => {
        console .log('createSubscriber data1: state',`${JSON.stringify(subscriberdata) },${JSON.stringify(err)}`);
        if (err) {
          hilog.error(0x0000, TAG, '%{public}s', `Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
          return;
        }
        hilog.info(0x0000, TAG, '%{public}s', 'Succeeded in creating subscriber.');
        subscriber = subscriberdata;
        commonEventManager.subscribe(subscriber, (err: BusinessError, data: commonEventManager.CommonEventData) => {
          console .log('this data:'+JSON.stringify(data));
          if (err) {
            hilog.error(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} Failed to subscribe common event. Code is ${err.code}, message is ${err.message}`);
            return;
          }else {
            hilog.info(0x0000, 'this push data is pstartAbilityForResult success', '%{public}s', data.data);
            expect(JSON.stringify('1')).assertEqual(JSON.stringify(data.data));
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              hilog.info(0x0000, TAG, '%{public}s', 'unsubscribe OK');
            });
            done();
          }
        })
        let want: Want = {
          deviceId: '',
          bundleName: 'com.example.appa',
          abilityName: 'startAbilityForResult',
          parameters:{
            'wantConstant.Params.SHOW_MODE_KEY':wantConstant.ShowMode.EMBEDDED_FULL
          }
        }
        context.startAbility(want);
      })

    })
    /**
     * @tc.number SUB_Ability_AbilityRuntime_EmbeddableUIAbility_2200
     * @tc.name SUB_Ability_AbilityRuntime_EmbeddableUIAbility_2200
     * @tc.desc Verify the jump start EmbeddableUIAbility invoking isTerminating.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_EmbeddableUIAbility_2200', Level.LEVEL0, async (done: Function) => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_EmbeddableUIAbility_2200';
      console.info('enter into test');
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} =========`);
      let want: Want = {
        deviceId: '',
        bundleName: 'com.example.appa',
        abilityName: 'terminateSelfWithResult',
        parameters:{
          'wantConstant.Params.SHOW_MODE_KEY':wantConstant.ShowMode.EMBEDDED_FULL
        }
      }
      let options: StartOptions = {
        displayId: 0
      };
      console.log('success want');
      try {
        context.startAbilityForResult(want, options, (err: BusinessError, result: common.AbilityResult) => {
          if (err.code) {
            console.error(`startAbilityForResult failed, code is ${err.code}, message is ${err.message}`);
            return;
          }
          console.info('startAbilityForResult succeed');
          console.info('startAbilityForResult succeed'+ JSON.stringify(result.resultCode));
          expect(JSON.stringify(100)).assertEqual(JSON.stringify(result.resultCode));
          done();
        });
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message;
      }
    })
  })

}

