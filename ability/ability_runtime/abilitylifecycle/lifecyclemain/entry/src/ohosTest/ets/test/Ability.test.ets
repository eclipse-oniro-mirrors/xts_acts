import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError, power } from '@kit.BasicServicesKit';
import { commonEventManager } from '@kit.BasicServicesKit';
import { common, UIAbility, application } from '@kit.AbilityKit';
import { Driver, Component, ON, UiWindow, abilityDelegatorRegistry } from '@kit.TestKit';

async function sleep(time: number) {
  return new Promise<void>((resolve, reject) => {
    setTimeout(resolve, time)
  });
}

let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
let delegator = abilityDelegatorRegistry.getAbilityDelegator();

export default function ActsLifeCycleMainTest() {
  describe('ActsLifeCycleMainTest', () => {

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_OnWillForeground_0100
     * @tc.name   : To Verify whether the OnWillForeground lifecycle is callback
     * @tc.desc   : Expect: call success
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_OnWillForeground_0100', 0, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_OnWillForeground_0100';
      let subscriber: commonEventManager.CommonEventSubscriber;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['0100']
      };
      commonEventManager.createSubscriber(subscribeInfo)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          console.info(`${tag}-createSubscriber success`);
          subscriber = commonEventSubscriber;
          commonEventManager.subscribe(commonEventSubscriber, subscribeCallBack)
          abilityDelegator.startAbility({
            bundleName: 'com.example.myapplication',
            abilityName: 'EntryAbility',
            parameters: {
              parameter: '0100'
            }
          }, (err: BusinessError) => {
            console.info(`${tag}-startAbility err:` + JSON.stringify(err));
          });
        })
        .catch((err: BusinessError) => {
          console.error(`${tag}-createSubscriber failed, code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done();
        });
      let subscribeCallBack = async (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info(`${tag}-subscribeCallBack success1- ${data.data}`);
        expect(data.data)
          .assertEqual("onCreate,onWindowStageCreate,onWillForeground,onForeground,show event,onDidForeground");
        commonEventManager.unsubscribe(subscriber);
        let driver: Driver = Driver.create();
        let button: Component = await driver.findComponent(ON.text('Close App'));
        await button.click();
        await sleep(1000);
        done()
      };
    })

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_OnWillForeground_0200
     * @tc.name   : To Verify whether the OnWillForeground lifecycle is callback
     * @tc.desc   : Expect: call success
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_OnWillForeground_0200', 0, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_OnWillForeground_0200';
      let subscriber: commonEventManager.CommonEventSubscriber;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['0200']
      };
      commonEventManager.createSubscriber(subscribeInfo)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          console.info(`${tag}-createSubscriber success`);
          subscriber = commonEventSubscriber;
          commonEventManager.subscribe(commonEventSubscriber, subscribeCallBack)
          abilityDelegator.startAbility({
            bundleName: 'com.example.myapplication',
            abilityName: 'EntryAbility',
          }, (err: BusinessError) => {
            console.info(`${tag}-startAbility err:` + JSON.stringify(err));
          });

          setTimeout(async () => {
            try {
              console.info('setTimeout')
              let driver = Driver.create();
              await driver.pressHome();
              abilityDelegator.startAbility({
                bundleName: 'com.example.myapplication',
                abilityName: 'EntryAbility',
                parameters: {
                  parameter: '0200'
                }
              }, (err: BusinessError) => {
                console.info(`${tag}-startAbility err:` + JSON.stringify(err));
              });

            } catch (e) {
              console.error(`${tag}-pressHome error`, e)
            }
          }, 2000)
        })
        .catch((err: BusinessError) => {
          console.error(`${tag}-createSubscriber failed, code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done();
        });
      let subscribeCallBack = async (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info(`${tag}-subscribeCallBack success1- ${data.data}`);
        expect(data.data).assertEqual("onWillForeground,onForeground,show event,onDidForeground");
        commonEventManager.unsubscribe(subscriber);
        let driver: Driver = Driver.create();
        let button: Component = await driver.findComponent(ON.text('Close App'));
        await button.click();
        await sleep(1000);
        done()
      };
    })


    /*
     * @tc.number : SUB_Ability_AbilityRuntime_OnWillForeground_0900
     * @tc.name   : To Verify whether the OnWillForeground lifecycle is callback
     * @tc.desc   : Expect: call success
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_OnWillForeground_0900', 0, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_OnWillForeground_0900';
      let subscriber: commonEventManager.CommonEventSubscriber;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['0900']
      };
      commonEventManager.createSubscriber(subscribeInfo)
        .then(async (commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          console.info(`${tag}-createSubscriber success`);
          subscriber = commonEventSubscriber;
          commonEventManager.subscribe(commonEventSubscriber, subscribeCallBack)
          abilityDelegator.startAbility({
            bundleName: 'com.example.myapplication',
            abilityName: 'EntryAbility',
            parameters: {
              parameter: '0900'
            }
          }, (err: BusinessError) => {
            console.info(`${tag}-startAbility err:` + JSON.stringify(err));
          });
        })
        .catch((err: BusinessError) => {
          console.error(`${tag}-createSubscriber failed, code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done();
        });
      let subscribeCallBack = async (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info(`${tag}-subscribeCallBack success1- ${data.data}`);
        expect(data.data)
          .assertEqual("onCreate,onWindowStageCreate,onWillForeground,onForeground,show event,onDidForeground");
        let driver: Driver = Driver.create();
        let button: Component = await driver.findComponent(ON.text('Close App'));
        await button.click();
        await sleep(1000);
        commonEventManager.unsubscribe(subscriber);
        done()
      };
    })

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_OnWillForeground_1000
     * @tc.name   : To Verify whether the OnWillForeground lifecycle is callback
     * @tc.desc   : Expect: call success
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_OnWillForeground_1000', 0, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_OnWillForeground_1000';
      let subscriber: commonEventManager.CommonEventSubscriber;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['1000']
      };
      commonEventManager.createSubscriber(subscribeInfo)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          console.info(`${tag}-createSubscriber success`);
          subscriber = commonEventSubscriber;
          commonEventManager.subscribe(commonEventSubscriber, subscribeCallBack)
          abilityDelegator.startAbility({
            bundleName: 'com.example.myapplication',
            abilityName: 'EntryAbility',
            parameters: {
              parameter: '1000'
            }
          }, (err: BusinessError) => {
            console.info(`${tag}-startAbility err:` + JSON.stringify(err));
          });
        })
        .catch((err: BusinessError) => {
          console.error(`${tag}-createSubscriber failed, code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done();
        });
      let subscribeCallBack = async (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info(`${tag}-subscribeCallBack success1- ${data.data}`);
        expect(data.data)
          .assertEqual("onCreate,onWindowStageCreate,onWillForeground,onForeground,show event,onDidForeground");
        commonEventManager.unsubscribe(subscriber);
        let driver: Driver = Driver.create();
        let button: Component = await driver.findComponent(ON.text('Close App'));
        await button.click();
        await sleep(1000);
        done()
      };
    })
  })
}