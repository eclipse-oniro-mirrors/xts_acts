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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { application, common } from '@kit.AbilityKit';
import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import{ BusinessError, commonEventManager } from '@kit.BasicServicesKit';

let context = getContext(this) as common.UIAbilityContext;

function sleep(ms: number) {
  return new Promise<string>(resolve => setTimeout(resolve, ms));
}

export default function abilityTest() {
  describe('ActsRestartAppTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      context = globalThis.context;
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_restartApp_0100
     * @tc.name   : SUB_Ability_AbilityRuntime_restartApp_0100
     * @tc.desc   : The parameter 'ableName' is not Uiability, and calling the RestartApp interface returns 16000063
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_restartApp_0100', Level.LEVEL3, async (done:Function) => {
      let caseName = 'SUB_Ability_AbilityRuntime_restartApp_0100';
      console.log(`${caseName} starts.`);
      let want: Want = {
        bundleName: 'com.test.actsrestartapptest',
        abilityName: 'Ability001'
      };
      let errCode: string | undefined = '';
      try {
        context.startAbility(want, (err: BusinessError) => {
          if (err.code) {
            console.error(`${caseName} Failed to startAbility.Code: ${err.code}, message: ${err.message}`);
          }
          console.info(`${caseName} Succeed to startAbility.`);
        });
        let subscriber: commonEventManager.CommonEventSubscriber;
        let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ['restartapp0100'],
        };
        commonEventManager.createSubscriber(subscribeInfo,
          async (err: BusinessError, data: commonEventManager.CommonEventSubscriber) => {
            if (err) {
              console.error(`${caseName} Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
            }
            console.info(`${caseName} Succeeded in creating subscriber.`);
            subscriber = data;
            console.log(`${caseName} the subsciber is ${JSON.stringify(subscriber)}`);

            commonEventManager.subscribe(subscriber, (err: BusinessError, data: commonEventManager.CommonEventData) => {
              console.log(caseName + ' subscribe__' + JSON.stringify(data));
              if (err) {
                console.error(`${caseName} Failed to subscribe common event. Code is ${err.code}, message is ${err.message}`);
              } else {
                console.info(`${caseName} CommenEventData.data is ${data.data}`);
                errCode = data.data;
              }
            });
          });
        await sleep(2000);
        expect(errCode).assertEqual('16000063');
        console.log(`${caseName} ends.`);
        done();
      } catch (err) {
        console.info(`${caseName} Failed to running this case.Code: ${err.code}, message: ${err.message}`);
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_restartApp_0200
     * @tc.name   : SUB_Ability_AbilityRuntime_restartApp_0200
     * @tc.desc   : The parameter 'ableName' is ' ', calling the RestartApp interface returns 401
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_restartApp_0200', Level.LEVEL3, async (done:Function) => {
      let caseName = 'SUB_Ability_AbilityRuntime_restartApp_0200';
      console.log(`${caseName} starts.`);
      let want: Want = {
        bundleName: 'com.test.actsrestartapptest',
        abilityName: 'Ability002'
      };
      let errCode: string | undefined = '';
      try {
        context.startAbility(want, (err: BusinessError) => {
          if (err.code) {
            console.error(`${caseName} Failed to startAbility.Code: ${err.code}, message: ${err.message}`);
          }
          console.info(`${caseName} Succeed to startAbility.`);
        });
        let subscriber: commonEventManager.CommonEventSubscriber;
        let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ['restartapp0200'],
        };
        commonEventManager.createSubscriber(subscribeInfo,
          async (err: BusinessError, data: commonEventManager.CommonEventSubscriber) => {
            if (err) {
              console.error(`${caseName} Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
            }
            console.info(`${caseName} Succeeded in creating subscriber.`);
            subscriber = data;
            console.log(`${caseName} the subsciber is ${JSON.stringify(subscriber)}`);

            commonEventManager.subscribe(subscriber, (err: BusinessError, data: commonEventManager.CommonEventData) => {
              console.log(caseName + ' subscribe__' + JSON.stringify(data));
              if (err) {
                console.error(`${caseName} Failed to subscribe common event. Code is ${err.code}, message is ${err.message}`);
              } else {
                console.info(`${caseName} CommenEventData.data is ${data.data}`);
                errCode = data.data;
              }
            });
          });
        await sleep(2000);
        expect(errCode).assertEqual('401');
        console.log(`${caseName} ends.`);
        done();
      } catch (err) {
        console.info(`${caseName} Failed to running this case.Code: ${err.code}, message: ${err.message}`);
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_restartApp_0300
     * @tc.name   : SUB_Ability_AbilityRuntime_restartApp_0300
     * @tc.desc   : The parameter 'ableName' is an illegal value. Calling the RestartApp interface returns 16000063
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_restartApp_0300', Level.LEVEL3, async (done:Function) => {
      let caseName = 'SUB_Ability_AbilityRuntime_restartApp_0300';
      console.log(`${caseName} starts.`);
      let want: Want = {
        bundleName: 'com.test.actsrestartapptest',
        abilityName: 'Ability003'
      };
      let errCode: string | undefined = '';
      try {
        context.startAbility(want, (err: BusinessError) => {
          if (err.code) {
            console.error(`${caseName} Failed to startAbility.Code: ${err.code}, message: ${err.message}`);
          }
          console.info(`${caseName} Succeed to startAbility.`);
        });
        let subscriber: commonEventManager.CommonEventSubscriber;
        let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ['restartapp0300'],
        };
        commonEventManager.createSubscriber(subscribeInfo,
          async (err: BusinessError, data: commonEventManager.CommonEventSubscriber) => {
            if (err) {
              console.error(`${caseName} Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
              return;
            }
            console.info(`${caseName} Succeeded in creating subscriber.`);
            subscriber = data;
            console.log(`${caseName} the subsciber is ${JSON.stringify(subscriber)}`);

            commonEventManager.subscribe(subscriber, (err: BusinessError, data: commonEventManager.CommonEventData) => {
              console.log(caseName + ' subscribe__' + JSON.stringify(data));
              if (err) {
                console.error(`${caseName} Failed to subscribe common event. Code is ${err.code}, message is ${err.message}`);
                return;
              } else {
                console.info(`${caseName} CommenEventData.data is ${data.data}`);
                errCode = data.data;
              }
            });
          });
        await sleep(2000);
        expect(errCode).assertEqual('16000063');
        console.log(`${caseName} ends.`);
        done();
      } catch (err) {
        console.info(`${caseName} Filed to running this case.Code: ${err.code}, message: ${err.message}`);
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_restartApp_0400
     * @tc.name   : SUB_Ability_AbilityRuntime_restartApp_0400
     * @tc.desc   : Parameter ableName is undefined, calling the RestartApp interface returns 401
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_restartApp_0400', Level.LEVEL3, async (done:Function) => {
      let caseName = 'SUB_Ability_AbilityRuntime_restartApp_0400';
      console.log(`${caseName} starts.`);
      let want: Want = {
        bundleName: 'com.test.actsrestartapptest',
        abilityName: 'Ability004'
      };
      let errCode: string | undefined = '';
      try {
        context.startAbility(want, (err: BusinessError) => {
          if (err.code) {
            console.error(`${caseName} Failed to startAbility.Code: ${err.code}, message: ${err.message}`);
          }
          console.info(`${caseName} Succeed to startAbility.`);
        });
        let subscriber: commonEventManager.CommonEventSubscriber;
        let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ['restartapp0400'],
        };
        commonEventManager.createSubscriber(subscribeInfo,
          async (err: BusinessError, data: commonEventManager.CommonEventSubscriber) => {
            if (err) {
              console.error(`${caseName} Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
              return;
            }
            console.info(`${caseName} Succeeded in creating subscriber.`);
            subscriber = data;
            console.log(`${caseName} the subsciber is ${JSON.stringify(subscriber)}`);

            commonEventManager.subscribe(subscriber, (err: BusinessError, data: commonEventManager.CommonEventData) => {
              console.log(caseName + ' subscribe__' + JSON.stringify(data));
              if (err) {
                console.error(`${caseName} Failed to subscribe common event. Code is ${err.code}, message is ${err.message}`);
                return;
              } else {
                console.info(`${caseName} CommenEventData.data is ${data.data}`);
                errCode = data.data;
              }
            });
          });
        await sleep(2000);
        expect(errCode).assertEqual('401');
        console.log(`${caseName} ends.`);
        done();
      } catch (err) {
        console.info(`${caseName} Filed to running this case.Code: ${err.code}, message: ${err.message}`);
      }
    });

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_restartApp_0500
     * @tc.name   : SUB_Ability_AbilityRuntime_restartApp_0500
     * @tc.desc   : Parameter Want is empty, calling the RestartApp interface returns 401
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_restartApp_0500', Level.LEVEL3, async (done:Function) => {
      let caseName = 'SUB_Ability_AbilityRuntime_restartApp_0500';
      console.log(`${caseName} starts.`);
      let want: Want = {
        bundleName: 'com.test.actsrestartapptest',
        abilityName: 'Ability005'
      };
      let errCode: string | undefined = '';
      try {
        context.startAbility(want, (err: BusinessError) => {
          if (err.code) {
            console.error(`${caseName} Failed to startAbility.Code: ${err.code}, message: ${err.message}`);
          }
          console.info(`${caseName} Succeed to startAbility.`);
        });
        let subscriber: commonEventManager.CommonEventSubscriber;
        let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ['restartapp0500'],
        };
        commonEventManager.createSubscriber(subscribeInfo,
          async (err: BusinessError, data: commonEventManager.CommonEventSubscriber) => {
            if (err) {
              console.error(`${caseName} Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
              return;
            }
            console.info(`${caseName} Succeeded in creating subscriber.`);
            subscriber = data;
            console.log(`${caseName} the subsciber is ${JSON.stringify(subscriber)}`);

            commonEventManager.subscribe(subscriber, (err: BusinessError, data: commonEventManager.CommonEventData) => {
              console.log(caseName + ' subscribe__' + JSON.stringify(data));
              if (err) {
                console.error(`${caseName} Failed to subscribe common event. Code is ${err.code}, message is ${err.message}`);
                return;
              } else {
                console.info(`${caseName} CommenEventData.data is ${data.data}`);
                errCode = data.data;
              }
            });
          });
        await sleep(2000);
        expect(errCode).assertEqual('401');
        console.log(`${caseName} ends.`);
        done();
      } catch (err) {
        console.info(`${caseName} Filed to running this case.Code: ${err.code}, message: ${err.message}`);
      }
    });
  })
}