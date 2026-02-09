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
import { Driver, ON, Component } from '@ohos.UiTest'
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';

let context = getContext(this) as common.UIAbilityContext;

function sleep(ms: number) {
  return new Promise<string>(resolve => setTimeout(resolve, ms));
}

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    beforeAll(async() => {
      let driver = Driver.create();	
      try {
        let allowed = await driver.findComponent(ON.id('advanced_dialog_button_0'));
        if (allowed) {
          await allowed.click();
        }
      } catch (err) {
        console.error('findComponent failed: ' + JSON.stringify(err));
      }
      context = globalThis.context;
    })
    beforeEach(() => {
    })
    afterEach(async () => {
      await sleep(3000)
    })
    afterAll(() => {
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_setFontSizeAtApp_0100
     * @tc.number SUB_Ability_AbilityRuntime_setFontSizeAtApp_0100
     * @tc.desc   Call context.getApplicationcontext().setFontSizeScale, pass the parameter fontSize as -1, and return 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_setFontSizeAtApp_0100', Level.LEVEL3, async (done:Function) => {
      let caseName = 'SUB_Ability_AbilityRuntime_setFontSizeAtApp_0100';
      console.log(`${caseName} starts.`);
      let want: Want = {
        bundleName: 'com.test.actssetfontsizetest',
        abilityName: 'setFontSizeAbility001'
      };
      let subscriber: commonEventManager.CommonEventSubscriber | undefined;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['setFontSize0100']
      };
      try {
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
                expect(data.data).assertEqual('401');
                globalThis.context1.terminateSelf();
                commonEventManager.unsubscribe(subscriber, (err: BusinessError) => {
                  if (err) {
                    console.error(`${caseName} Failed to unsubscribe. Code is ${err.code}, message is ${err.message}`);
                  }
                  subscriber = undefined;
                  console.info(`${caseName} Succeeded in unsubscribing.`);
                  console.log(`${caseName} ends.`);
                  done();
                });
              }
            });
          });
        context.startAbility(want, (err: BusinessError) => {
          if(err.code) {
            console.error(`${caseName} Failed to startAbility.Code: ${err.code}, message: ${err.message}`);
          } else {
            console.info(`${caseName} Succeed to startAbility.`);
          }
        });
        await sleep(1000);
        let driver:Driver = Driver.create();
        let button1: Component = await driver.waitForComponent(ON.id('set and show'), 3000);
        await button1.click();
      } catch (e) {
        console.error(`${caseName} Failed to running this case.e is ${JSON.stringify(e)}`);
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_setFontSizeAtApp_0200
     * @tc.number SUB_Ability_AbilityRuntime_setFontSizeAtApp_0200
     * @tc.desc   Call context.getApplicationcontext().setFontSizeScale, pass the parameter fontSize as 0, and return success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_setFontSizeAtApp_0200', Level.LEVEL3, async (done:Function) => {
      let caseName = 'SUB_Ability_AbilityRuntime_setFontSizeAtApp_0200';
      await sleep(1000);
      console.log(`${caseName} starts.`);
      let want: Want = {
        bundleName: 'com.test.actssetfontsizetest',
        abilityName: 'setFontSizeAbility002'
      };
      let subscriber: commonEventManager.CommonEventSubscriber | undefined;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['setFontSize0200'],
      };
      try {
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
                expect(data.data).assertEqual('0');
                globalThis.context2.terminateSelf();
                commonEventManager.unsubscribe(subscriber, (err: BusinessError) => {
                  if (err) {
                    console.error(`${caseName} Failed to unsubscribe. Code is ${err.code}, message is ${err.message}`);
                  }
                  subscriber = undefined;
                  console.info(`${caseName} Succeeded in unsubscribing.`);
                  console.log(`${caseName} ends.`);
                  done();
                });
              }
            });
          });
        context.startAbility(want, (err: BusinessError) => {
          if(err.code) {
            console.error(`${caseName} Failed to startAbility.Code: ${err.code}, message: ${err.message}`);
          } else {
            console.info(`${caseName} Succeed to startAbility.`);
          }
        });
        await sleep(1000);
        let driver:Driver = Driver.create();
        let button1: Component = await driver.waitForComponent(ON.id('set'), 3000);
        await button1.click();
        await sleep(2000);
        let button2: Component = await driver.waitForComponent(ON.id('show'), 3000);
        await button2.click();
      } catch (e) {
        console.error(`${caseName} Failed to running this case.e is ${JSON.stringify(e)}`);
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_setFontSizeAtApp_0300
     * @tc.number SUB_Ability_AbilityRuntime_setFontSizeAtApp_0300
     * @tc.desc   Call context.getApplicationcontext().setFontSizeScale, pass parameter fontSize as 2, return success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_setFontSizeAtApp_0300', Level.LEVEL3, async (done:Function) => {
      let caseName = 'SUB_Ability_AbilityRuntime_setFontSizeAtApp_0300';
      console.log(`${caseName} starts.`);
      let want: Want = {
        bundleName: 'com.test.actssetfontsizetest',
        abilityName: 'setFontSizeAbility003'
      };
      let subscriber: commonEventManager.CommonEventSubscriber | undefined;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['setFontSize0300'],
      };
      try {
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
                expect(data.data).assertEqual('2');
                globalThis.context3.terminateSelf();
                commonEventManager.unsubscribe(subscriber, (err: BusinessError) => {
                  if (err) {
                    console.error(`${caseName} Failed to unsubscribe. Code is ${err.code}, message is ${err.message}`);
                  }
                  subscriber = undefined;
                  console.info(`${caseName} Succeeded in unsubscribing.`);
                  console.log(`${caseName} ends.`);
                  done();
                });
              }
            });
          });

        context.startAbility(want, (err: BusinessError) => {
          if(err.code) {
            console.error(`${caseName} Failed to startAbility.Code: ${err.code}, message: ${err.message}`);
          } else {
            console.info(`${caseName} Succeed to startAbility.`);
          }
        });
        await sleep(1000);
        let driver:Driver = Driver.create();
        let button1: Component = await driver.waitForComponent(ON.id('set'), 3000);
        await button1.click();
        await sleep(2000);
        let button2: Component = await driver.waitForComponent(ON.id('show'), 3000);
        await button2.click();
      } catch (e) {
        console.error(`${caseName} Failed to running this case.e is ${JSON.stringify(e)}`);
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_setFontSizeAtApp_0400
     * @tc.number SUB_Ability_AbilityRuntime_setFontSizeAtApp_0400
     * @tc.desc   Call context.getApplicationcontext().setFontSizeScale, pass parameter fontSize as 9999999, return success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_setFontSizeAtApp_0400', Level.LEVEL3, async (done:Function) => {
      let caseName = 'SUB_Ability_AbilityRuntime_setFontSizeAtApp_0400';
      console.log(`${caseName} starts.`);
      let want: Want = {
        bundleName: 'com.test.actssetfontsizetest',
        abilityName: 'setFontSizeAbility004'
      };
      let subscriber: commonEventManager.CommonEventSubscriber | undefined;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['setFontSize0400'],
      };
      try {
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
                expect(data.data).assertEqual('9999999');
                globalThis.context4.terminateSelf();
                commonEventManager.unsubscribe(subscriber, (err: BusinessError) => {
                  if (err) {
                    console.error(`${caseName} Failed to unsubscribe. Code is ${err.code}, message is ${err.message}`);
                  }
                  subscriber = undefined;
                  console.info(`${caseName} Succeeded in unsubscribing.`);

                  console.log(`${caseName} ends.`);
                  done();
                });
              }
            });
          });
        context.startAbility(want, (err: BusinessError) => {
          if(err.code) {
            console.error(`${caseName} Failed to startAbility.Code: ${err.code}, message: ${err.message}`);
          } else {
            console.info(`${caseName} Succeed to startAbility.`);
          }
        });
        await sleep(1000);
        let driver:Driver = Driver.create();
        let button1: Component = await driver.waitForComponent(ON.id('set'), 3000);
        await button1.click();
        await sleep(2000);
        let button2: Component = await driver.waitForComponent(ON.id('show'), 3000);
        await button2.click();
        await sleep(4000);
      } catch (e) {
        console.error(`${caseName} Failed to running this case.e is ${JSON.stringify(e)}`);
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_setFontSizeAtApp_0500
     * @tc.number SUB_Ability_AbilityRuntime_setFontSizeAtApp_0500
     * @tc.desc   Call context.getApplicationcontext().setFontSizeScale, pass the parameter fontSize as null, and return 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_setFontSizeAtApp_0500', Level.LEVEL3, async (done:Function) => {
      let caseName = 'SUB_Ability_AbilityRuntime_setFontSizeAtApp_0500';
      console.log(`${caseName} starts.`);
      let want: Want = {
        bundleName: 'com.test.actssetfontsizetest',
        abilityName: 'setFontSizeAbility005'
      };
      let subscriber: commonEventManager.CommonEventSubscriber | undefined;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['setFontSize0500'],
      };
      try {
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
                expect(data.data).assertEqual('401');
                globalThis.context5.terminateSelf();
                commonEventManager.unsubscribe(subscriber, (err: BusinessError) => {
                  if (err) {
                    console.error(`${caseName} Failed to unsubscribe. Code is ${err.code}, message is ${err.message}`);
                  }
                  subscriber = undefined;
                  console.info(`${caseName} Succeeded in unsubscribing.`);
                  console.log(`${caseName} ends.`);
                  done();
                });
              }
            });
          });
        context.startAbility(want, (err: BusinessError) => {
          if(err.code) {
            console.error(`${caseName} Failed to startAbility.Code: ${err.code}, message: ${err.message}`);
          } else {
            console.info(`${caseName} Succeed to startAbility.`);
          }
        });
        await sleep(1000);
        let driver:Driver = Driver.create();
        let button1: Component = await driver.waitForComponent(ON.id('set and show'), 3000);
        await button1.click();
      } catch (e) {
        console.error(`${caseName} Failed to running this case.e is ${JSON.stringify(e)}`);
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_setFontSizeAtApp_0600
     * @tc.number SUB_Ability_AbilityRuntime_setFontSizeAtApp_0600
     * @tc.desc   Call context.getApplicationcontext().setFontSizeScale, pass the parameter fontSize as undefined, and return 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_setFontSizeAtApp_0600', Level.LEVEL3, async (done:Function) => {
      let caseName = 'SUB_Ability_AbilityRuntime_setFontSizeAtApp_0600';
      console.log(`${caseName} starts.`);
      let want: Want = {
        bundleName: 'com.test.actssetfontsizetest',
        abilityName: 'setFontSizeAbility006'
      };
      let subscriber: commonEventManager.CommonEventSubscriber | undefined;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['setFontSize0600'],
      };
      try {
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
                expect(data.data).assertEqual('401');
                globalThis.context6.terminateSelf();
                commonEventManager.unsubscribe(subscriber, (err: BusinessError) => {
                  if (err) {
                    console.error(`${caseName} Failed to unsubscribe. Code is ${err.code}, message is ${err.message}`);
                  }
                  subscriber = undefined;
                  console.info(`${caseName} Succeeded in unsubscribing.`);

                  console.log(`${caseName} ends.`);
                  done();
                });
              }
            });
          });
        context.startAbility(want, (err: BusinessError) => {
          if(err.code) {
            console.error(`${caseName} Failed to startAbility.Code: ${err.code}, message: ${err.message}`);
          } else {
            console.info(`${caseName} Succeed to startAbility.`);
          }
        });
        await sleep(1000);
        let driver:Driver = Driver.create();
        let button1: Component = await driver.waitForComponent(ON.id('set and show'), 3000);
        await button1.click();
      } catch (e) {
        console.error(`${caseName} Failed to running this case.e is ${JSON.stringify(e)}`);
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_setFontSizeAtApp_0700
     * @tc.number SUB_Ability_AbilityRuntime_setFontSizeAtApp_0700
     * @tc.desc   Call application to get the applicationcontext, call setFontSizeScale, and return 401 when the parameter fontSize is -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_setFontSizeAtApp_0700', Level.LEVEL3, async (done:Function) => {
      let caseName = 'SUB_Ability_AbilityRuntime_setFontSizeAtApp_0700';
      console.log(`${caseName} starts.`)
      let want: Want = {
        bundleName: 'com.test.actssetfontsizetest',
        abilityName: 'setFontSizeAbility007'
      };
      let subscriber: commonEventManager.CommonEventSubscriber | undefined;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['setFontSize0700'],
      };
      try {
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
                expect(data.data).assertEqual('401');
                globalThis.context7.terminateSelf();
                commonEventManager.unsubscribe(subscriber, (err: BusinessError) => {
                  if (err) {
                    console.error(`${caseName} Failed to unsubscribe. Code is ${err.code}, message is ${err.message}`);
                  }
                  subscriber = undefined;
                  console.info(`${caseName} Succeeded in unsubscribing.`);

                  console.log(`${caseName} ends.`);
                  done();
                });
              }
            });

          });
        context.startAbility(want, (err: BusinessError) => {
          if(err.code) {
            console.error(`${caseName} Failed to startAbility.Code: ${err.code}, message: ${err.message}`);
          } else {
            console.info(`${caseName} Succeed to startAbility.`);
          }
        });
        await sleep(1000);
        let driver:Driver = Driver.create();
        let button: Component = await driver.waitForComponent(ON.id('set and show'), 3000);
        await button.click();
      } catch (e) {
        console.error(`${caseName} Failed to running this case.e is ${JSON.stringify(e)}`);
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_setFontSizeAtApp_0800
     * @tc.number SUB_Ability_AbilityRuntime_setFontSizeAtApp_0800
     * @tc.desc   Call application to get the applicationcontext, call setFontSizeScale, and return success when the parameter fontSize is 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_setFontSizeAtApp_0800', Level.LEVEL3, async (done:Function) => {
      let caseName = 'SUB_Ability_AbilityRuntime_setFontSizeAtApp_0800';
      console.log(`${caseName} starts.`);
      let want: Want = {
        bundleName: 'com.test.actssetfontsizetest',
        abilityName: 'setFontSizeAbility008'
      };
      let subscriber: commonEventManager.CommonEventSubscriber | undefined;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['setFontSize0800'],
      };
      try {
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
                expect(data.data).assertEqual('0');
                globalThis.context8.terminateSelf();
                commonEventManager.unsubscribe(subscriber, (err: BusinessError) => {
                  if (err) {
                    console.error(`${caseName} Failed to unsubscribe. Code is ${err.code}, message is ${err.message}`);
                  }
                  subscriber = undefined;
                  console.info(`${caseName} Succeeded in unsubscribing.`);
                  console.log(`${caseName} ends.`);
                  done();
                });
              }
            });
          });
        context.startAbility(want, (err: BusinessError) => {
          if(err.code) {
            console.error(`${caseName} Failed to startAbility.Code: ${err.code}, message: ${err.message}`);
          } else {
            console.info(`${caseName} Succeed to startAbility.`);
          }
        });
        await sleep(1000);
        let driver:Driver = Driver.create();
        let button1: Component = await driver.waitForComponent(ON.id('set'), 3000);
        await button1.click();
        await sleep(2000);
        let button2: Component = await driver.waitForComponent(ON.id('show'), 3000);
        await button2.click();
      } catch (e) {
        console.error(`${caseName} Failed to running this case.e is ${JSON.stringify(e)}`);
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_setFontSizeAtApp_0900
     * @tc.number SUB_Ability_AbilityRuntime_setFontSizeAtApp_0900
     * @tc.desc   Call application to get the applicationcontext, call setFontSizeScale, and return success when the parameter fontSize is 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_setFontSizeAtApp_0900', Level.LEVEL3, async (done:Function) => {
      let caseName = 'SUB_Ability_AbilityRuntime_setFontSizeAtApp_0900';
      console.log(`${caseName} starts.`);
      let want: Want = {
        bundleName: 'com.test.actssetfontsizetest',
        abilityName: 'setFontSizeAbility009'
      };
      let subscriber: commonEventManager.CommonEventSubscriber | undefined;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['setFontSize0900'],
      };
      try {
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
                expect(data.data).assertEqual('2');
                globalThis.context9.terminateSelf();
                commonEventManager.unsubscribe(subscriber, (err: BusinessError) => {
                  if (err) {
                    console.error(`${caseName} Failed to unsubscribe. Code is ${err.code}, message is ${err.message}`);
                  }
                  subscriber = undefined;
                  console.info(`${caseName} Succeeded in unsubscribing.`);
                  console.log(`${caseName} ends.`);
                  done();
                });
              }
            });
          });
        context.startAbility(want, (err: BusinessError) => {
          if(err.code) {
            console.error(`${caseName} Failed to startAbility.Code: ${err.code}, message: ${err.message}`);
          } else {
            console.info(`${caseName} Succeed to startAbility.`);
          }
        });
        await sleep(1000);
        let driver:Driver = Driver.create();
        let button1: Component = await driver.waitForComponent(ON.id('set'), 3000);
        await button1.click();
        await sleep(2000);
        let button2: Component = await driver.waitForComponent(ON.id('show'), 3000);
        await button2.click();
      } catch (e) {
        console.error(`${caseName} Failed to running this case.e is ${JSON.stringify(e)}`);
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_setFontSizeAtApp_1000
     * @tc.number SUB_Ability_AbilityRuntime_setFontSizeAtApp_1000
     * @tc.desc   Call application to get the applicationcontext, call setFontSizeScale, and return success when the parameter fontSize is 9999999
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_setFontSizeAtApp_1000', Level.LEVEL3, async (done:Function) => {
      let caseName = 'SUB_Ability_AbilityRuntime_setFontSizeAtApp_1000';
      console.log(`${caseName} starts.`);
      let want: Want = {
        bundleName: 'com.test.actssetfontsizetest',
        abilityName: 'setFontSizeAbility010'
      };
      let subscriber: commonEventManager.CommonEventSubscriber | undefined;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['setFontSize1000'],
      };
      try {
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
                expect(data.data).assertEqual('9999999');
                globalThis.context10.terminateSelf();
                commonEventManager.unsubscribe(subscriber, (err: BusinessError) => {
                  if (err) {
                    console.error(`${caseName} Failed to unsubscribe. Code is ${err.code}, message is ${err.message}`);
                  }
                  subscriber = undefined;
                  console.info(`${caseName} Succeeded in unsubscribing.`);
                  console.log(`${caseName} ends.`);
                  done();
                });
              }
            });
          });
        context.startAbility(want, (err: BusinessError) => {
          if(err.code) {
            console.error(`${caseName} Failed to startAbility.Code: ${err.code}, message: ${err.message}`);
          } else {
            console.info(`${caseName} Succeed to startAbility.`);
          }
        });
        await sleep(1000);
        let driver:Driver = Driver.create();
        let button1: Component = await driver.waitForComponent(ON.id('set'), 3000);
        await button1.click();
        await sleep(2000);
        let button2: Component = await driver.waitForComponent(ON.id('show'), 3000);
        await button2.click();
      } catch (e) {
        console.error(`${caseName} Failed to running this case.e is ${JSON.stringify(e)}`);
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_setFontSizeAtApp_1100
     * @tc.number SUB_Ability_AbilityRuntime_setFontSizeAtApp_1100
     * @tc.desc   Call application to get the applicationcontext, call setFontSizeScale, and return 401 when the parameter fontSize is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_setFontSizeAtApp_1100', Level.LEVEL3, async (done:Function) => {
      let caseName = 'SUB_Ability_AbilityRuntime_setFontSizeAtApp_1100';
      console.log(`${caseName} starts.`);
      let want: Want = {
        bundleName: 'com.test.actssetfontsizetest',
        abilityName: 'setFontSizeAbility011'
      };
      let subscriber: commonEventManager.CommonEventSubscriber | undefined;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['setFontSize1100'],
      };
      try {
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
                expect(data.data).assertEqual('401');
                globalThis.context11.terminateSelf();
                commonEventManager.unsubscribe(subscriber, (err: BusinessError) => {
                  if (err) {
                    console.error(`${caseName} Failed to unsubscribe. Code is ${err.code}, message is ${err.message}`);
                  }
                  subscriber = undefined;
                  console.info(`${caseName} Succeeded in unsubscribing.`);
                  console.log(`${caseName} ends.`);
                  done();
                });
              }
            });
          });
        context.startAbility(want, (err: BusinessError) => {
          if(err.code) {
            console.error(`${caseName} Failed to startAbility.Code: ${err.code}, message: ${err.message}`);
          } else {
            console.info(`${caseName} Succeed to startAbility.`);
          }
        });
        await sleep(1000);
        let driver:Driver = Driver.create();
        let button1: Component = await driver.waitForComponent(ON.id('set and show'), 3000);
        await button1.click();
      } catch (e) {
        console.error(`${caseName} Failed to running this case.e is ${JSON.stringify(e)}`);
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_setFontSizeAtApp_1200
     * @tc.number SUB_Ability_AbilityRuntime_setFontSizeAtApp_1200
     * @tc.desc   Call application to get the applicationcontext, call setFontSizeScale, and return 401 when the parameter fontSize is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_setFontSizeAtApp_1200', Level.LEVEL3, async (done:Function) => {
      let caseName = 'SUB_Ability_AbilityRuntime_setFontSizeAtApp_1200';
      console.log(`${caseName} starts.`);
      let want: Want = {
        bundleName: 'com.test.actssetfontsizetest',
        abilityName: 'setFontSizeAbility012'
      };
      let subscriber: commonEventManager.CommonEventSubscriber | undefined;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['setFontSize1200'],
      };
      try {
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
                expect(data.data).assertEqual('401');
                globalThis.context12.terminateSelf();
                commonEventManager.unsubscribe(subscriber, (err: BusinessError) => {
                  if (err) {
                    console.error(`${caseName} Failed to unsubscribe. Code is ${err.code}, message is ${err.message}`);
                  }
                  subscriber = undefined;
                  console.info(`${caseName} Succeeded in unsubscribing.`);
                  console.log(`${caseName} ends.`);
                  done();
                });
              }
            });
          });
        context.startAbility(want, (err: BusinessError) => {
          if(err.code) {
            console.error(`${caseName} Failed to startAbility.Code: ${err.code}, message: ${err.message}`);
          } else {
            console.info(`${caseName} Succeed to startAbility.`);
          }
        });
        await sleep(1000);
        let driver:Driver = Driver.create();
        let button1: Component = await driver.waitForComponent(ON.id('set and show'), 3000);
        await button1.click();
      } catch (e) {
        console.error(`${caseName} Failed to running this case.e is ${JSON.stringify(e)}`);
      }
    });
  })
}