import { describe, it, expect } from '@ohos/hypium';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError } from '@kit.BasicServicesKit';
import { commonEventManager } from '@kit.BasicServicesKit';
import { Driver, Component, ON } from '@kit.TestKit';

async function sleep(time: number) {
  return new Promise<void>((resolve, reject) => {
    setTimeout(resolve, time)
  });
}

let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

export default function ActsLifeCycleMainBackgroundTest() {
  describe('ActsLifeCycleMainBackgroundTest', () => {

    /*
    * @tc.number : SUB_Ability_AbilityRuntime_OnWillBackground_0100
    * @tc.name   : To Verify whether the OnWillBackground lifecycle is callback
    * @tc.desc   : Expect: call success
    * @tc.type   : Function
    * @tc.size   : MediumTest
    * @tc.level  : 3
    */
    it('SUB_Ability_AbilityRuntime_OnWillBackground_0100', 0, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_OnWillBackground_0100';
      let subscriber: commonEventManager.CommonEventSubscriber;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['0100']
      };
      commonEventManager.createSubscriber(subscribeInfo)
        .then(async (commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          console.info(`${tag}-createSubscriber success`);
          subscriber = commonEventSubscriber;
          commonEventManager.subscribe(commonEventSubscriber, subscribeCallBack)
          abilityDelegator.startAbility({
            bundleName: 'com.example.myapplication',
            abilityName: 'EntryAbility1',
            parameters: {
              parameter: '0100'
            }
          }, async (err: BusinessError) => {
            console.info(`${tag}-startAbility err:` + JSON.stringify(err));
            try {
              let driver = Driver.create();
              await driver.pressHome();
              await sleep(2000)
            } catch (e) {
              console.error(`${tag}-pressHome error`, e)
            }
          });
        })
        .catch((err: BusinessError) => {
          console.error(`${tag}-createSubscriber failed, code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done();
        });
      let subscribeCallBack = async (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info(`${tag}-subscribeCallBack success1-${data.data}`);
        expect(data.data)
          .assertEqual("onWillBackground,onBackground,hidden event,onDidBackground");
        commonEventManager.unsubscribe(subscriber);
        done()
      };
    })
    /*
     * @tc.number : SUB_Ability_AbilityRuntime_OnWillBackground_0200
     * @tc.name   : To Verify whether the OnWillBackground lifecycle is callback
     * @tc.desc   : Expect: call success
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_OnWillBackground_0200', 0, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_OnWillBackground_0200';
      let subscriber: commonEventManager.CommonEventSubscriber;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['0200']
      };
      commonEventManager.createSubscriber(subscribeInfo)
        .then(async (commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          console.info(`${tag}-createSubscriber success`);
          subscriber = commonEventSubscriber;
          commonEventManager.subscribe(commonEventSubscriber, subscribeCallBack)
          abilityDelegator.startAbility({
            bundleName: 'com.example.myapplication',
            abilityName: 'EntryAbility2',
            parameters: {
              parameter: '0200'
            }
          }, async (err: BusinessError) => {
            console.info(`${tag}-startAbility err:` + JSON.stringify(err));
          });
          await sleep(2000)
          try {
            let driver: Driver = Driver.create();
            let button: Component = await driver.findComponent(ON.text('Close App'));
            await button.click();
          } catch (e) {
            console.error(`${tag}-background 0200 error=>`, JSON.stringify(e))
          }
        })
        .catch((err: BusinessError) => {
          console.error(`${tag}-createSubscriber failed, code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done();
        });
      let subscribeCallBack = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info(`${tag}-subscribeCallBack success1-${data.data}`);
        expect(data.data)
          .assertEqual("onWillBackground,onBackground,hidden event,onDidBackground,onWindowStageWillDestroy,onWindowStageDestroy,onDestroy");
        commonEventManager.unsubscribe(subscriber);
        done()
      };
    })

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_OnWillBackground_1300
     * @tc.name   : To Verify whether the OnWillBackground lifecycle is callback
     * @tc.desc   : Expect: call success
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_OnWillBackground_1300', 0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_OnWillBackground_1300';
      let subscriber: commonEventManager.CommonEventSubscriber;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['1300']
      };
      commonEventManager.createSubscriber(subscribeInfo)
        .then(async (commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          console.info(`${tag}-createSubscriber success`);
          subscriber = commonEventSubscriber;
          commonEventManager.subscribe(subscriber, subscribeCallBack)
          abilityDelegator.startAbility({
            bundleName: 'com.example.myapplication',
            abilityName: 'EntryAbility13',
            parameters: {
              parameter: '1300'
            }
          }, async (err: BusinessError) => {
            console.info(`${tag}-startAbility err:` + JSON.stringify(err));
          });

          await sleep(3000)
          try {
            let driver: Driver = Driver.create();
            let button: Component = await driver.findComponent(ON.text('Close App'));
            if (button) {
              await button.click();
            }
          } catch (e) {
            console.error(`${tag}-background 1300 error=>`, JSON.stringify(e))
          }
        })
        .catch((err: BusinessError) => {
          console.error(`${tag}-createSubscriber failed, code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done();
        });
      let subscribeCallBack = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info(`${tag}-subscribeCallBack success1- ${data.data}`);
        expect(data.data)
          .assertEqual("onWillBackground,onBackground,hidden event,onDidBackground,onWindowStageWillDestroy,onWindowStageDestroy,onDestroy");
        commonEventManager.unsubscribe(subscriber);
        done()
      };
    })

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_OnWillBackground_1400
     * @tc.name   : To Verify whether the OnWillBackground lifecycle is callback
     * @tc.desc   : Expect: call success
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_Ability_AbilityRuntime_OnWillBackground_1400', 0, async (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_OnWillBackground_1400';
      let subscriber: commonEventManager.CommonEventSubscriber;
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['1400']
      };
      commonEventManager.createSubscriber(subscribeInfo)
        .then(async (commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          console.info(`${tag}-createSubscriber success`);
          subscriber = commonEventSubscriber;
          commonEventManager.subscribe(subscriber, subscribeCallBack)
          abilityDelegator.startAbility({
            bundleName: 'com.example.myapplication',
            abilityName: 'EntryAbility14',
            parameters: {
              parameter: '1400'
            }
          }, async (err: BusinessError) => {
            console.info(`${tag}-startAbility err:` + JSON.stringify(err));
          });
          await sleep(2000)
          try {
            let driver: Driver = Driver.create();
            let button: Component = await driver.findComponent(ON.text('Close App'));
            await button.click();
          } catch (e) {
            console.error(`${tag}-background 1400 error=> ${JSON.stringify(e)}`);
          }

        })
        .catch((err: BusinessError) => {
          console.error(`${tag} createSubscriber failed, code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
          done();
        });
      let subscribeCallBack = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info(`${tag}-subscribeCallBack success1- ${data.data}`);
        expect(data.data)
          .assertEqual("onWillBackground,onBackground,hidden event,onDidBackground,onWindowStageWillDestroy,onWindowStageDestroy,onDestroy");
        commonEventManager.unsubscribe(subscriber);
        done()
      };
    })
  })
}