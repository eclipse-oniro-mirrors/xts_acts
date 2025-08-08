/*
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
import { describe, beforeAll, it, expect, beforeEach, afterEach, Level } from '@ohos/hypium';
import { BusinessError, commonEventManager, systemParameterEnhance } from '@kit.BasicServicesKit';
import { appManager, common } from '@kit.AbilityKit';
import { abilityDelegatorRegistry, Driver, ON, MatchPattern } from '@kit.TestKit';

function sleep(time: number): Promise<void> {
  return new Promise((resolve) => setTimeout(resolve, time))
}

let driver: Driver;
let context: common.UIAbilityContext;
let want: Want = {
  bundleName: "com.example.startabilityerrorcode2",
  abilityName: 'EntryAbility1',
  parameters: {
    pageName: 'UIExtAbilityPage'
  }
};
let delegator = abilityDelegatorRegistry.getAbilityDelegator();
let mpEnable: string

export default function startAbilityOptions() {
  describe('startAbilityOptions', () => {
    beforeAll(() => {
      driver = Driver.create();
      context = AppStorage.get<common.UIAbilityContext>('testAbilityContext') as common.UIAbilityContext;
      try {
        console.info('codeError2 beforeAll mpEnable')
        mpEnable = systemParameterEnhance.getSync('persist.sys.abilityms.multi_process_model');
      } catch (e) {
        console.error('codeError2 beforeAll mpEnable')
        mpEnable = 'fail'
      }
    })
    afterEach(async () => {
      delegator.executeShellCommand('aa force-stop com.example.startabilityerrorcode2');
      await sleep(2000);
    })
    

    /**
     * @tc.number: startAbilityStartOptions_16000001
     * @tc.name: startAbilityStartOptions_16000001
     * @tc.desc: StartAbility code
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('startAbilityStartOptions_16000001', Level.LEVEL0, async (done: Function) => {
      console.info(`startAbilityStartOptions_16000001-is begin`)
      if (mpEnable != 'true') {
        done();
        return;
      }
      let subscriber: commonEventManager.CommonEventSubscriber;
      // 订阅者信息
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['StartAbility']
      };
      // 创建订阅者回调
      let createCB = async (err: BusinessError, commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
        if (!err) {
          console.info(`Succeeded in creating subscriber. 000`);
          subscriber = commonEventSubscriber;
          try {
            commonEventManager.subscribe(subscriber, SubscribeCB);
          } catch (error) {
          }
          context.startAbility(want, (err: BusinessError) => {
            if (err.code) {
            }
            console.info('startAbility succeed');
          });
          await sleep(2000)
          let buttons = await driver.findComponent(ON.text('startAbilityStartOptions_16000001'));
          buttons.click();
        } else {
          console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
        }
      }

      try {
        commonEventManager.createSubscriber(subscribeInfo, createCB);
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
      }

      let SubscribeCB = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        if (err) {
        } else {
          try {
            expect(data.code).assertEqual(16000001);
          } catch (e) {
            console.error(`startAbilityStartOptions_16000001-except error`, JSON.stringify(e))
          }

          commonEventManager.unsubscribe(subscriber, () => {
            done();
          })
        }
      }
    })

    /**
     * @tc.number: startAbilityStartOptions_16000004
     * @tc.name: startAbilityStartOptions_16000004
     * @tc.desc: StartAbility code
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('startAbilityStartOptions_16000004', Level.LEVEL0, async (done: Function) => {
      console.info(`startAbilityStartOptions_16000004-is begin`)
      if (mpEnable != 'true') {
        done();
        return;
      }
      let subscriber: commonEventManager.CommonEventSubscriber;
      // 订阅者信息
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['StartAbility']
      };
      // 创建订阅者回调
      let createCB = async (err: BusinessError, commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
        if (!err) {
          console.info(`Succeeded in creating subscriber. 000`);
          subscriber = commonEventSubscriber;
          try {
            commonEventManager.subscribe(subscriber, SubscribeCB);
          } catch (error) {
          }
          context.startAbility(want, (err: BusinessError) => {
            if (err.code) {
            }
            console.info('startAbility succeed');
          });
          await sleep(2000)
          let buttons = await driver.findComponent(ON.text('startAbilityStartOptions_16000004'));
          buttons.click();
        } else {
          console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
        }
      }

      try {
        commonEventManager.createSubscriber(subscribeInfo, createCB);
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
      }

      let SubscribeCB = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        if (err) {
        } else {
          try {
            expect(data.code).assertEqual(16000004);
          } catch (e) {
            console.error(`startAbilityStartOptions_16000004-except error`, JSON.stringify(e))
          }

          commonEventManager.unsubscribe(subscriber, () => {
            done();
          })
        }
      }
    })

    /**
     * @tc.number: startAbilityStartOptions_16000019
     * @tc.name: startAbilityStartOptions_16000019
     * @tc.desc: StartAbility code
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('startAbilityStartOptions_16000019', Level.LEVEL0, async (done: Function) => {
      console.info(`startAbilityStartOptions_16000019-is begin`)
      if (mpEnable != 'true') {
        done();
        return;
      }
      let subscriber: commonEventManager.CommonEventSubscriber;
      // 订阅者信息
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['StartAbility']
      };
      // 创建订阅者回调
      let createCB = async (err: BusinessError, commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
        if (!err) {
          console.info(`Succeeded in creating subscriber. 000`);
          subscriber = commonEventSubscriber;
          try {
            commonEventManager.subscribe(subscriber, SubscribeCB);
          } catch (error) {
          }
          context.startAbility(want, (err: BusinessError) => {
            if (err.code) {
            }
            console.info('startAbility succeed');
          });
          await sleep(2000)
          let buttons1 = await driver.findComponent(ON.text('startAbilityStartOptions_16000019'));
          buttons1.click();
        } else {
          console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
        }
      }

      try {
        commonEventManager.createSubscriber(subscribeInfo, createCB);
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
      }

      let SubscribeCB = async (err: BusinessError, data: commonEventManager.CommonEventData) => {
        if (err) {
        } else {
          try {
            expect(data.code).assertEqual(16000019);
            let allowed = await driver.waitForComponent(ON.text('暂无可用打开方式', MatchPattern.CONTAINS), 1000)
            console.log(`startAbilityStartOptions_16000019-is need to click ` + JSON.stringify(allowed));
            if (allowed) {
              let buttons = await driver.findComponents(ON.text('知道了', MatchPattern.CONTAINS))
              if (buttons && buttons.length > 0) {
                await buttons[buttons.length - 1].click()
              }
            }

          } catch (e) {
            console.error(`startAbilityStartOptions_16000004-except error`, JSON.stringify(e))
          }
          commonEventManager.unsubscribe(subscriber, () => {
            done();
          })
        }
      }
    })

    /**
     * @tc.number: startAbilityStartOptions_16000050
     * @tc.name: startAbilityStartOptions_16000050
     * @tc.desc: StartAbility code
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('startAbilityStartOptions_16000050', Level.LEVEL0, async (done: Function) => {
      console.info(`startAbilityStartOptions_16000050-is begin`)
      if (mpEnable != 'true') {
        done();
        return;
      }
      let subscriber: commonEventManager.CommonEventSubscriber;
      // 订阅者信息
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['StartAbility']
      };
      // 创建订阅者回调
      let createCB = async (err: BusinessError, commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
        if (!err) {
          console.info(`Succeeded in creating subscriber. 000`);
          subscriber = commonEventSubscriber;
          try {
            commonEventManager.subscribe(subscriber, SubscribeCB);
          } catch (error) {
          }
          context.startAbility(want, (err: BusinessError) => {
            if (err.code) {
            }
            console.info('startAbility succeed');
          });
          await sleep(2000)
          let buttons = await driver.findComponent(ON.text('startAbilityStartOptions_16000050'));
          buttons.click();
        } else {
          console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
        }
      }

      try {
        commonEventManager.createSubscriber(subscribeInfo, createCB);
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
      }

      let SubscribeCB = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        if (err) {
        } else {

          try {
            expect(data.code).assertEqual(16000050);
          } catch (e) {
            console.error(`startAbilityStartOptions_16000050-UIExtensionContext-except error`, JSON.stringify(e))
          }
          commonEventManager.unsubscribe(subscriber, () => {
            done();
          })
        }
      }
    })
    /**
     * @tc.number: startAbilityStartOptions_16000073
     * @tc.name: startAbilityStartOptions_16000073
     * @tc.desc: StartAbility code
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('startAbilityStartOptions_16000073', Level.LEVEL0, async (done: Function) => {
      console.info(`startAbilityStartOptions_16000073-is begin`)
      if (mpEnable != 'true') {
        done();
        return;
      }
      let subscriber: commonEventManager.CommonEventSubscriber;
      // 订阅者信息
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['StartAbility']
      };
      // 创建订阅者回调
      let createCB = async (err: BusinessError, commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
        if (!err) {
          console.info(`Succeeded in creating subscriber. 000`);
          subscriber = commonEventSubscriber;
          try {
            commonEventManager.subscribe(subscriber, SubscribeCB);
          } catch (error) {
          }
          context.startAbility(want, (err: BusinessError) => {
            if (err.code) {
            }
            console.info('startAbility succeed');
          });
          await sleep(2000)
          let buttons = await driver.findComponent(ON.text('startAbilityStartOptions_16000073'));
          buttons.click();
        } else {
          console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
        }
      }

      try {
        commonEventManager.createSubscriber(subscribeInfo, createCB);
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
      }

      let SubscribeCB = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        if (err) {
        } else {

          try {
            expect(data.code).assertEqual(16000073);
          } catch (e) {
            console.error(`startAbilityStartOptions_16000073-UIExtensionContext-except error`, JSON.stringify(e))
          }
          commonEventManager.unsubscribe(subscriber, () => {
            done();
          })
        }
      }
    })
    /**
     * @tc.number: openLink_16000004
     * @tc.name: openLink_16000004
     * @tc.desc: StartAbility code
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('openLink_16000004', Level.LEVEL0, async (done: Function) => {
      console.info(`openLink_16000004-is begin`)
      if (mpEnable != 'true') {
        done();
        return;
      }
      let subscriber: commonEventManager.CommonEventSubscriber;
      // 订阅者信息
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['StartAbility']
      };
      // 创建订阅者回调
      let createCB = async (err: BusinessError, commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
        if (!err) {
          console.info(`Succeeded in creating subscriber. 000`);
          subscriber = commonEventSubscriber;
          try {
            commonEventManager.subscribe(subscriber, SubscribeCB);
          } catch (error) {
          }
          context.startAbility(want, (err: BusinessError) => {
            if (err.code) {
            }
            console.info('startAbility succeed');
          });
          await sleep(2000)
          let buttons = await driver.findComponent(ON.text('openLink_16000004'));
          buttons.click();
        } else {
          console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
        }
      }

      try {
        commonEventManager.createSubscriber(subscribeInfo, createCB);
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
      }

      let SubscribeCB = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        if (err) {
        } else {
          try {
            expect(data.code).assertEqual(16000004);
          } catch (e) {
            console.error(`openLink_16000004-UIExtensionContext-except error`, JSON.stringify(e))
          }
          commonEventManager.unsubscribe(subscriber, () => {
            done();
          })
        }
      }
    })
    /**
     * @tc.number: openLink_16000019
     * @tc.name: openLink_16000019
     * @tc.desc: StartAbility code
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('openLink_16000019', Level.LEVEL0, async (done: Function) => {
      console.info(`openLink_16000019-is begin`)
      if (mpEnable != 'true') {
        done();
        return;
      }
      let subscriber: commonEventManager.CommonEventSubscriber;
      // 订阅者信息
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['StartAbility']
      };
      // 创建订阅者回调
      let createCB = async (err: BusinessError, commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
        if (!err) {
          console.info(`Succeeded in creating subscriber. 000`);
          subscriber = commonEventSubscriber;
          try {
            commonEventManager.subscribe(subscriber, SubscribeCB);
          } catch (error) {
          }
          context.startAbility(want, (err: BusinessError) => {
            if (err.code) {
            }
            console.info('startAbility succeed');
          });
          await sleep(2000)
          let buttons = await driver.findComponent(ON.text('openLink_16000019'));
          buttons.click();
        } else {
          console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
        }
      }

      try {
        commonEventManager.createSubscriber(subscribeInfo, createCB);
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
      }

      let SubscribeCB = async (err: BusinessError, data: commonEventManager.CommonEventData) => {
        if (err) {
        } else {
          try {
            expect(data.code).assertEqual(16000019);
            let allowed = await driver.waitForComponent(ON.text('暂无可用打开方式', MatchPattern.CONTAINS), 1000)
            console.log(`startAbilityStartOptions_16000019-is need to click ` + JSON.stringify(allowed));
            if (allowed) {
              let buttons = await driver.findComponents(ON.text('知道了', MatchPattern.CONTAINS))
              if (buttons && buttons.length > 0) {
                await buttons[buttons.length - 1].click()
              }
            }
          } catch (e) {
            console.error(`openLink_16000019-UIExtensionContext-except error`, JSON.stringify(e))
          }
          commonEventManager.unsubscribe(subscriber, () => {
            done();
          })
        }
      }
    })

    /**
     * @tc.number: startAbilityForResultCallback_16000001
     * @tc.name: startAbilityForResultCallback_16000001
     * @tc.desc: StartAbility code
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('startAbilityForResultCallback_16000001', Level.LEVEL0, async (done: Function) => {
      console.info(`startAbilityForResultCallback_16000001-is begin`)
      if (mpEnable != 'true') {
        done();
        return;
      }
      let subscriber: commonEventManager.CommonEventSubscriber;
      // 订阅者信息
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['StartAbility']
      };
      // 创建订阅者回调
      let createCB = async (err: BusinessError, commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
        if (!err) {
          console.info(`Succeeded in creating subscriber. 000`);
          subscriber = commonEventSubscriber;
          try {
            commonEventManager.subscribe(subscriber, SubscribeCB);
          } catch (error) {
          }
          context.startAbility(want, (err: BusinessError) => {
            if (err.code) {
            }
            console.info('startAbility succeed');
          });
          await sleep(2000)
          let buttons = await driver.findComponent(ON.text('startAbilityForResultCallback_16000001'));
          buttons.click();
        } else {
          console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
        }
      }

      try {
        commonEventManager.createSubscriber(subscribeInfo, createCB);
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
      }

      let SubscribeCB = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        if (err) {
        } else {
          try {
            expect(data.code).assertEqual(16000001);
          } catch (e) {
            console.error(`startAbilityForResultCallback_16000001-UIExtensionContext-except error`, JSON.stringify(e))
          }

          commonEventManager.unsubscribe(subscriber, () => {
            done();
          })
        }
      }
    })
    /**
     * @tc.number: startAbilityForResultCallback_16000004
     * @tc.name: startAbilityForResultCallback_16000004
     * @tc.desc: StartAbility code
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('startAbilityForResultCallback_16000004', Level.LEVEL0, async (done: Function) => {
      console.info(`startAbilityForResultCallback_16000004-is begin`)
      if (mpEnable != 'true') {
        done();
        return;
      }
      let subscriber: commonEventManager.CommonEventSubscriber;
      // 订阅者信息
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['StartAbility']
      };
      // 创建订阅者回调
      let createCB = async (err: BusinessError, commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
        if (!err) {
          console.info(`Succeeded in creating subscriber. 000`);
          subscriber = commonEventSubscriber;
          try {
            commonEventManager.subscribe(subscriber, SubscribeCB);
          } catch (error) {
          }
          context.startAbility(want, (err: BusinessError) => {
            if (err.code) {
            }
            console.info('startAbility succeed');
          });
          await sleep(2000)
          let buttons = await driver.findComponent(ON.text('startAbilityForResultCallback_16000004'));
          buttons.click();
        } else {
          console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
        }
      }

      try {
        commonEventManager.createSubscriber(subscribeInfo, createCB);
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
      }

      let SubscribeCB = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        if (err) {
        } else {
          try {
            expect(data.code).assertEqual(16000004);
          } catch (e) {
            console.error(`startAbilityForResultCallback_16000004-UIExtensionContext-except error`, JSON.stringify(e))
          }

          commonEventManager.unsubscribe(subscriber, () => {
            done();
          })
        }
      }
    })
    /**
     * @tc.number: startAbilityForResultCallback_16000019
     * @tc.name: startAbilityForResultCallback_16000019
     * @tc.desc: StartAbility code
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('startAbilityForResultCallback_16000019', Level.LEVEL0, async (done: Function) => {
      console.info(`startAbilityForResultCallback_16000019-is begin`)
      if (mpEnable != 'true') {
        done();
        return;
      }
      let subscriber: commonEventManager.CommonEventSubscriber;
      // 订阅者信息
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['StartAbility']
      };
      // 创建订阅者回调
      let createCB = async (err: BusinessError, commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
        if (!err) {
          console.info(`Succeeded in creating subscriber. 000`);
          subscriber = commonEventSubscriber;
          try {
            commonEventManager.subscribe(subscriber, SubscribeCB);
          } catch (error) {
          }
          context.startAbility(want, (err: BusinessError) => {
            if (err.code) {
            }
            console.info('startAbility succeed');
          });
          await sleep(2000)
          let buttons1 = await driver.findComponent(ON.text('startAbilityForResultCallback_16000019'));
          buttons1.click();
        } else {
          console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
        }
      }

      try {
        commonEventManager.createSubscriber(subscribeInfo, createCB);
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
      }

      let SubscribeCB = async (err: BusinessError, data: commonEventManager.CommonEventData) => {
        if (err) {
        } else {
          try {
            expect(data.code).assertEqual(16000019);
            let allowed = await driver.waitForComponent(ON.text('暂无可用打开方式', MatchPattern.CONTAINS), 1000)
            console.log(`startAbilityStartOptions_16000019-is need to click ` + JSON.stringify(allowed));
            if (allowed) {
              let buttons = await driver.findComponents(ON.text('知道了', MatchPattern.CONTAINS))
              if (buttons && buttons.length > 0) {
                await buttons[buttons.length - 1].click()
              }
            }
          } catch (e) {
            console.error(`startAbilityForResultCallback_16000019-UIExtensionContext-except error`, JSON.stringify(e))
          }
          commonEventManager.unsubscribe(subscriber, () => {
            done();
          })
        }
      }
    })

    /**
     * @tc.number: startAbilityForResultCallback_16000050
     * @tc.name: startAbilityForResultCallback_16000050
     * @tc.desc: StartAbility code
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('startAbilityForResultCallback_16000050', Level.LEVEL0, async (done: Function) => {
      console.info(`startAbilityForResultCallback_16000050-is begin`)
      if (mpEnable != 'true') {
        done();
        return;
      }
      let subscriber: commonEventManager.CommonEventSubscriber;
      // 订阅者信息
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['StartAbility']
      };
      // 创建订阅者回调
      let createCB = async (err: BusinessError, commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
        if (!err) {
          console.info(`Succeeded in creating subscriber. 000`);
          subscriber = commonEventSubscriber;
          try {
            commonEventManager.subscribe(subscriber, SubscribeCB);
          } catch (error) {
          }
          context.startAbility(want, (err: BusinessError) => {
            if (err.code) {
            }
            console.info('startAbility succeed');
          });
          await sleep(2000)
          let buttons = await driver.findComponent(ON.text('startAbilityForResultCallback_16000050'));
          buttons.click();
        } else {
          console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
        }
      }

      try {
        commonEventManager.createSubscriber(subscribeInfo, createCB);
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
      }

      let SubscribeCB = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        if (err) {
        } else {
          try {
            expect(data.code).assertEqual(16000050);
          } catch (e) {
            console.error(`startAbilityForResultCallback_16000050-UIExtensionContext-except error`, JSON.stringify(e))
          }
          commonEventManager.unsubscribe(subscriber, () => {
            done();
          })
        }
      }
    })

    /**
     * @tc.number: startAbilityForResultCallback_16000073
     * @tc.name: startAbilityForResultCallback_16000073
     * @tc.desc: StartAbility code
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('startAbilityForResultCallback_16000073', Level.LEVEL0, async (done: Function) => {
      console.info(`startAbilityForResultCallback_16000073-is begin`)
      if (mpEnable != 'true') {
        done();
        return;
      }
      let subscriber: commonEventManager.CommonEventSubscriber;
      // 订阅者信息
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['StartAbility']
      };
      // 创建订阅者回调
      let createCB = async (err: BusinessError, commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
        if (!err) {
          console.info(`Succeeded in creating subscriber. 000`);
          subscriber = commonEventSubscriber;
          try {
            commonEventManager.subscribe(subscriber, SubscribeCB);
          } catch (error) {
          }
          context.startAbility(want, (err: BusinessError) => {
            if (err.code) {
            }
            console.info('startAbility succeed');
          });
          await sleep(2000)
          let buttons = await driver.findComponent(ON.text('startAbilityForResultCallback_16000073'));
          buttons.click();
        } else {
          console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
        }
      }

      try {
        commonEventManager.createSubscriber(subscribeInfo, createCB);
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
      }

      let SubscribeCB = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        if (err) {
        } else {
          try {
            expect(data.code).assertEqual(16000073);
          } catch (e) {
            console.error(`startAbilityForResultCallback_16000073-UIExtensionContext-except error`, JSON.stringify(e))
          }
          commonEventManager.unsubscribe(subscriber, () => {
            done();
          })
        }
      }
    })


    /**
     * @tc.number: startAbilityForResultOptions_16000001
     * @tc.name: startAbilityForResultOptions_16000001
     * @tc.desc: StartAbility code
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('startAbilityForResultOptions_16000001', Level.LEVEL0, async (done: Function) => {
      console.info(`startAbilityForResultOptions_16000001-is begin`)
      if (mpEnable != 'true') {
        done();
        return;
      }
      let subscriber: commonEventManager.CommonEventSubscriber;
      // 订阅者信息
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['StartAbility']
      };
      // 创建订阅者回调
      let createCB = async (err: BusinessError, commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
        if (!err) {
          console.info(`Succeeded in creating subscriber. 000`);
          subscriber = commonEventSubscriber;
          try {
            commonEventManager.subscribe(subscriber, SubscribeCB);
          } catch (error) {
          }
          want.parameters = {
            pageName: 'page3'
          }
          context.startAbility(want, (err: BusinessError) => {
            if (err.code) {
            }
            console.info('startAbility succeed');
          });
          await sleep(2000)
          let buttons = await driver.findComponent(ON.text('startAbilityForResultOptions_16000001'));
          buttons.click();
        } else {
          console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
        }
      }

      try {
        commonEventManager.createSubscriber(subscribeInfo, createCB);
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
      }

      let SubscribeCB = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        if (err) {
        } else {
          try {
            expect(data.code).assertEqual(16000001);
          } catch (e) {
            console.error(`startAbilityForResultOptions_16000001-UIExtensionContext-except error`, JSON.stringify(e))
          }
          commonEventManager.unsubscribe(subscriber, () => {
            done();
          })
        }
      }
    })
    /**
     * @tc.number: startAbilityForResultOptions_16000004
     * @tc.name: startAbilityForResultOptions_16000004
     * @tc.desc: StartAbility code
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('startAbilityForResultOptions_16000004', Level.LEVEL0, async (done: Function) => {
      console.info(`startAbilityForResultOptions_16000004-is begin`)
      if (mpEnable != 'true') {
        done();
        return;
      }
      let subscriber: commonEventManager.CommonEventSubscriber;
      // 订阅者信息
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['StartAbility']
      };
      // 创建订阅者回调
      let createCB = async (err: BusinessError, commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
        if (!err) {
          console.info(`Succeeded in creating subscriber. 000`);
          subscriber = commonEventSubscriber;
          try {
            commonEventManager.subscribe(subscriber, SubscribeCB);
          } catch (error) {
          }
          want.parameters = {
            pageName: 'page3'
          }
          context.startAbility(want, (err: BusinessError) => {
            if (err.code) {
            }
            console.info('startAbility succeed');
          });
          await sleep(2000)
          let buttons = await driver.findComponent(ON.text('startAbilityForResultOptions_16000004'));
          buttons.click();
        } else {
          console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
        }
      }

      try {
        commonEventManager.createSubscriber(subscribeInfo, createCB);
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
      }

      let SubscribeCB = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        if (err) {
        } else {
          try {
            expect(data.code).assertEqual(16000004);
          } catch (e) {
            console.error(`startAbilityForResultOptions_16000004-UIExtensionContext-except error`, JSON.stringify(e))
          }
          commonEventManager.unsubscribe(subscriber, () => {
            done();
          })
        }
      }
    })
    /**
     * @tc.number: startAbilityForResultOptions_16000019
     * @tc.name: startAbilityForResultOptions_16000019
     * @tc.desc: StartAbility code
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('startAbilityForResultOptions_16000019', Level.LEVEL0, async (done: Function) => {
      console.info(`startAbilityForResultOptions_16000019-is begin`)
      if (mpEnable != 'true') {
        done();
        return;
      }
      let subscriber: commonEventManager.CommonEventSubscriber;
      // 订阅者信息
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['StartAbility']
      };
      // 创建订阅者回调
      let createCB = async (err: BusinessError, commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
        if (!err) {
          console.info(`Succeeded in creating subscriber. 000`);
          subscriber = commonEventSubscriber;
          try {
            commonEventManager.subscribe(subscriber, SubscribeCB);
          } catch (error) {
          }
          want.parameters = {
            pageName: 'page3'
          }
          context.startAbility(want, (err: BusinessError) => {
            if (err.code) {
            }
            console.info('startAbility succeed');
          });
          await sleep(2000)
          let buttons1 = await driver.findComponent(ON.text('startAbilityForResultOptions_16000019'));
          buttons1.click();
        } else {
          console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
        }
      }

      try {
        commonEventManager.createSubscriber(subscribeInfo, createCB);
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
      }

      let SubscribeCB = async (err: BusinessError, data: commonEventManager.CommonEventData) => {
        if (err) {
        } else {
          try {
            expect(data.code).assertEqual(16000019);
            let allowed = await driver.waitForComponent(ON.text('暂无可用打开方式', MatchPattern.CONTAINS), 1000)
            console.log(`startAbilityStartOptions_16000019-is need to click ` + JSON.stringify(allowed));
            if (allowed) {
              let buttons = await driver.findComponents(ON.text('知道了', MatchPattern.CONTAINS))
              if (buttons && buttons.length > 0) {
                await buttons[buttons.length - 1].click()
              }
            }
          } catch (e) {
            console.error(`startAbilityForResultOptions_16000019-UIExtensionContext-except error`, JSON.stringify(e))
          }
          commonEventManager.unsubscribe(subscriber, () => {
            done();
          })
        }
      }
    })

    /**
     * @tc.number: startAbilityForResultOptions_16000050
     * @tc.name: startAbilityForResultOptions_16000050
     * @tc.desc: StartAbility code
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('startAbilityForResultOptions_16000050', Level.LEVEL0, async (done: Function) => {
      console.info(`startAbilityForResultOptions_16000050-is begin`)
      if (mpEnable != 'true') {
        done();
        return;
      }
      let subscriber: commonEventManager.CommonEventSubscriber;
      // 订阅者信息
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['StartAbility']
      };
      // 创建订阅者回调
      let createCB = async (err: BusinessError, commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
        if (!err) {
          console.info(`Succeeded in creating subscriber. 000`);
          subscriber = commonEventSubscriber;
          try {
            commonEventManager.subscribe(subscriber, SubscribeCB);
          } catch (error) {
          }
          want.parameters = {
            pageName: 'page3'
          }
          context.startAbility(want, (err: BusinessError) => {
            if (err.code) {
            }
            console.info('startAbility succeed');
          });
          await sleep(2000)
          let buttons = await driver.findComponent(ON.text('startAbilityForResultOptions_16000050'));
          buttons.click();
        } else {
          console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
        }
      }

      try {
        commonEventManager.createSubscriber(subscribeInfo, createCB);
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
      }

      let SubscribeCB = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        if (err) {
        } else {
          try {
            expect(data.code).assertEqual(16000050);
          } catch (e) {
            console.error(`startAbilityForResultOptions_16000050-UIExtensionContext-except error`, JSON.stringify(e))
          }
          commonEventManager.unsubscribe(subscriber, () => {
            done();
          })
        }
      }
    })

    /**
     * @tc.number: startAbilityForResultOptions_16000073
     * @tc.name: startAbilityForResultOptions_16000073
     * @tc.desc: StartAbility code
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('startAbilityForResultOptions_16000073', Level.LEVEL0, async (done: Function) => {
      console.info(`startAbilityForResultOptions_16000073-is begin`)
      if (mpEnable != 'true') {
        done();
        return;
      }
      let subscriber: commonEventManager.CommonEventSubscriber;
      // 订阅者信息
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['StartAbility']
      };
      // 创建订阅者回调
      let createCB = async (err: BusinessError, commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
        if (!err) {
          console.info(`Succeeded in creating subscriber. 000`);
          subscriber = commonEventSubscriber;
          try {
            commonEventManager.subscribe(subscriber, SubscribeCB);
          } catch (error) {
          }
          want.parameters = {
            pageName: 'page3'
          }
          context.startAbility(want, (err: BusinessError) => {
            if (err.code) {
            }
            console.info('startAbility succeed');
          });
          await sleep(2000)
          let buttons = await driver.findComponent(ON.text('startAbilityForResultOptions_16000073'));
          buttons.click();
        } else {
          console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
        }
      }

      try {
        commonEventManager.createSubscriber(subscribeInfo, createCB);
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
      }

      let SubscribeCB = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        if (err) {
        } else {
          try {
            expect(data.code).assertEqual(16000073);
          } catch (e) {
            console.error(`startAbilityForResultOptions_16000073-UIExtensionContext-except error`, JSON.stringify(e))
          }
          commonEventManager.unsubscribe(subscriber, () => {
            done();
          })
        }
      }
    })


    /**
     * @tc.number: startAbilityForResultOptions_16000001
     * @tc.name: startAbilityForResultOptions_16000001
     * @tc.desc: StartAbility code
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('startAbilityForResultPromise_16000001', Level.LEVEL0, async (done: Function) => {
      console.info(`startAbilityForResultPromise_16000001-is begin`)
      if (mpEnable != 'true') {
        done();
        return;
      }
      let subscriber: commonEventManager.CommonEventSubscriber;
      // 订阅者信息
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['StartAbility']
      };
      // 创建订阅者回调
      let createCB = async (err: BusinessError, commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
        if (!err) {
          console.info(`Succeeded in creating subscriber. 000`);
          subscriber = commonEventSubscriber;
          try {
            commonEventManager.subscribe(subscriber, SubscribeCB);
          } catch (error) {
          }
          want.parameters = {
            pageName: 'page3'
          }
          context.startAbility(want, (err: BusinessError) => {
            if (err.code) {
            }
            console.info('startAbility succeed');
          });
          await sleep(2000)
          let buttons = await driver.findComponent(ON.text('startAbilityForResultPromise_16000001'));
          buttons.click();
        } else {
          console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
        }
      }

      try {
        commonEventManager.createSubscriber(subscribeInfo, createCB);
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
      }

      let SubscribeCB = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        if (err) {
        } else {
          try {
            expect(data.code).assertEqual(16000001);
          } catch (e) {
            console.error(`startAbilityForResultPromise_16000001-UIExtensionContext-except error`, JSON.stringify(e))
          }
          commonEventManager.unsubscribe(subscriber, () => {
            done();
          })
        }
      }
    })
    /**
     * @tc.number: startAbilityForResultPromise_16000004
     * @tc.name: startAbilityForResultPromise_16000004
     * @tc.desc: StartAbility code
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('startAbilityForResultPromise_16000004', Level.LEVEL0, async (done: Function) => {
      console.info(`startAbilityForResultPromise_16000004-is begin`)
      if (mpEnable != 'true') {
        done();
        return;
      }
      let subscriber: commonEventManager.CommonEventSubscriber;
      // 订阅者信息
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['StartAbility']
      };
      // 创建订阅者回调
      let createCB = async (err: BusinessError, commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
        if (!err) {
          console.info(`Succeeded in creating subscriber. 000`);
          subscriber = commonEventSubscriber;
          try {
            commonEventManager.subscribe(subscriber, SubscribeCB);
          } catch (error) {
          }
          want.parameters = {
            pageName: 'page3'
          }
          context.startAbility(want, (err: BusinessError) => {
            if (err.code) {
            }
            console.info('startAbility succeed');
          });
          await sleep(2000)
          let buttons = await driver.findComponent(ON.text('startAbilityForResultPromise_16000004'));
          buttons.click();
        } else {
          console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
        }
      }

      try {
        commonEventManager.createSubscriber(subscribeInfo, createCB);
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
      }

      let SubscribeCB = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        if (err) {
        } else {
          try {
            expect(data.code).assertEqual(16000004);
          } catch (e) {
            console.error(`startAbilityForResultPromise_16000004-UIExtensionContext-except error`, JSON.stringify(e))
          }
          commonEventManager.unsubscribe(subscriber, () => {
            done();
          })
        }
      }
    })
    /**
     * @tc.number: startAbilityForResultPromise_16000019
     * @tc.name: startAbilityForResultPromise_16000019
     * @tc.desc: StartAbility code
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('startAbilityForResultPromise_16000019', Level.LEVEL0, async (done: Function) => {
      console.info(`startAbilityForResultPromise_16000019-is begin`)
      if (mpEnable != 'true') {
        done();
        return;
      }
      let subscriber: commonEventManager.CommonEventSubscriber;
      // 订阅者信息
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['StartAbility']
      };
      // 创建订阅者回调
      let createCB = async (err: BusinessError, commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
        if (!err) {
          console.info(`Succeeded in creating subscriber. 000`);
          subscriber = commonEventSubscriber;
          try {
            commonEventManager.subscribe(subscriber, SubscribeCB);
          } catch (error) {
          }
          want.parameters = {
            pageName: 'page3'
          }
          context.startAbility(want, (err: BusinessError) => {
            if (err.code) {
            }
            console.info('startAbility succeed');
          });
          await sleep(2000)
          let buttons1 = await driver.findComponent(ON.text('startAbilityForResultPromise_16000019'));
          buttons1.click();
        } else {
          console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
        }
      }

      try {
        commonEventManager.createSubscriber(subscribeInfo, createCB);
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
      }

      let SubscribeCB = async (err: BusinessError, data: commonEventManager.CommonEventData) => {
        if (err) {
        } else {
          try {
            expect(data.code).assertEqual(16000019);
            let allowed = await driver.waitForComponent(ON.text('暂无可用打开方式', MatchPattern.CONTAINS), 1000)
            console.log(`startAbilityStartOptions_16000019-is need to click ` + JSON.stringify(allowed));
            if (allowed) {
              let buttons = await driver.findComponents(ON.text('知道了', MatchPattern.CONTAINS))
              if (buttons && buttons.length > 0) {
                await buttons[buttons.length - 1].click()
              }
            }
          } catch (e) {
            console.error(`startAbilityForResultPromise_16000019-UIExtensionContext-except error`, JSON.stringify(e))
          }
          commonEventManager.unsubscribe(subscriber, () => {
            done();
          })
        }
      }
    })

    /**
     * @tc.number: startAbilityForResultPromise_16000050
     * @tc.name: startAbilityForResultPromise_16000050
     * @tc.desc: StartAbility code
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('startAbilityForResultPromise_16000050', Level.LEVEL0, async (done: Function) => {
      console.info(`startAbilityForResultPromise_16000050-is begin`)
      if (mpEnable != 'true') {
        done();
        return;
      }
      let subscriber: commonEventManager.CommonEventSubscriber;
      // 订阅者信息
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['StartAbility']
      };
      // 创建订阅者回调
      let createCB = async (err: BusinessError, commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
        if (!err) {
          console.info(`Succeeded in creating subscriber. 000`);
          subscriber = commonEventSubscriber;
          try {
            commonEventManager.subscribe(subscriber, SubscribeCB);
          } catch (error) {
          }
          want.parameters = {
            pageName: 'page3'
          }
          context.startAbility(want, (err: BusinessError) => {
            if (err.code) {
            }
            console.info('startAbility succeed');
          });
          await sleep(2000)
          let buttons = await driver.findComponent(ON.text('startAbilityForResultPromise_16000050'));
          buttons.click();
        } else {
          console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
        }
      }

      try {
        commonEventManager.createSubscriber(subscribeInfo, createCB);
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
      }

      let SubscribeCB = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        if (err) {
        } else {
          try {
            expect(data.code).assertEqual(16000050);
          } catch (e) {
            console.error(`startAbilityForResultPromise_16000050-UIExtensionContext-except error`, JSON.stringify(e))
          }
          commonEventManager.unsubscribe(subscriber, () => {
            done();
          })
        }
      }
    })

    /**
     * @tc.number: startAbilityForResultPromise_16000073
     * @tc.name: startAbilityForResultPromise_16000073
     * @tc.desc: StartAbility code
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('startAbilityForResultPromise_16000073', Level.LEVEL0, async (done: Function) => {
      console.info(`startAbilityForResultPromise_16000073-is begin`)
      if (mpEnable != 'true') {
        done();
        return;
      }
      let subscriber: commonEventManager.CommonEventSubscriber;
      // 订阅者信息
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['StartAbility']
      };
      // 创建订阅者回调
      let createCB = async (err: BusinessError, commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
        if (!err) {
          console.info(`Succeeded in creating subscriber. 000`);
          subscriber = commonEventSubscriber;
          try {
            commonEventManager.subscribe(subscriber, SubscribeCB);
          } catch (error) {
          }
          want.parameters = {
            pageName: 'page3'
          }
          context.startAbility(want, (err: BusinessError) => {
            if (err.code) {
            }
            console.info('startAbility succeed');
          });
          await sleep(2000)
          let buttons = await driver.findComponent(ON.text('startAbilityForResultPromise_16000073'));
          buttons.click();
        } else {
          console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
        }
      }

      try {
        commonEventManager.createSubscriber(subscribeInfo, createCB);
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
      }

      let SubscribeCB = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        if (err) {
        } else {
          try {
            expect(data.code).assertEqual(16000073);
          } catch (e) {
            console.error(`startAbilityForResultPromise_16000073-UIExtensionContext-except error`, JSON.stringify(e))
          }
          commonEventManager.unsubscribe(subscriber, () => {
            done();
          })
        }
      }
    })


    /**
     * @tc.number: connectServiceExtensionAbilityOptions_16000001
     * @tc.name: connectServiceExtensionAbilityOptions_16000001
     * @tc.desc: StartAbility code
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('connectServiceExtensionAbilityOptions_16000001', Level.LEVEL0, async (done: Function) => {
      console.info(`connectServiceExtensionAbilityOptions_16000001-is begin`)
      if (mpEnable != 'true') {
        done();
        return;
      }
      let subscriber: commonEventManager.CommonEventSubscriber;
      // 订阅者信息
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['StartAbility']
      };
      // 创建订阅者回调
      let createCB = async (err: BusinessError, commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
        if (!err) {
          console.info(`Succeeded in creating subscriber. 000`);
          subscriber = commonEventSubscriber;
          try {
            commonEventManager.subscribe(subscriber, SubscribeCB);
          } catch (error) {
          }
          want.parameters = {
            pageName: 'page2'
          }
          context.startAbility(want, (err: BusinessError) => {
            if (err.code) {
            }
            console.info('startAbility succeed');
          });
          await sleep(2000)
          let buttons = await driver.findComponent(ON.text('connectServiceExtensionAbilityOptions_16000001'));
          buttons.click();
        } else {
          console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
        }
      }

      try {
        commonEventManager.createSubscriber(subscribeInfo, createCB);
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
      }

      let SubscribeCB = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        if (err) {
        } else {
          try {
            expect(data.code).assertEqual(16000001);
          } catch (e) {
            console.error(`connectServiceExtensionAbilityOptions_16000001-UIExtensionContext-except error`,
              JSON.stringify(e))
          }
          commonEventManager.unsubscribe(subscriber, () => {
            done();
          })
        }
      }
    })

    /**
     * @tc.number: disconnectServiceExtensionAbilityCallback_16000050
     * @tc.name: disconnectServiceExtensionAbilityCallback_16000050
     * @tc.desc: StartAbility code
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('disconnectServiceExtensionAbilityCallback_16000050', Level.LEVEL0, async (done: Function) => {
      console.info(`disconnectServiceExtensionAbilityCallback_16000050-is begin`)
      if (mpEnable != 'true') {
        done();
        return;
      }
      let subscriber: commonEventManager.CommonEventSubscriber;
      // 订阅者信息
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['StartAbility']
      };
      // 创建订阅者回调
      let createCB = async (err: BusinessError, commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
        if (!err) {
          console.info(`Succeeded in creating subscriber. 000`);
          subscriber = commonEventSubscriber;
          try {
            commonEventManager.subscribe(subscriber, SubscribeCB);
          } catch (error) {
          }
          want.parameters = {
            pageName: 'page2'
          }
          context.startAbility(want, (err: BusinessError) => {
            if (err.code) {
            }
            console.info('startAbility succeed');
          });
          await sleep(2000)
          let buttons = await driver.findComponent(ON.text('disconnectServiceExtensionAbilityCallback_16000050'));
          buttons.click();
        } else {
          console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
        }
      }

      try {
        commonEventManager.createSubscriber(subscribeInfo, createCB);
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
      }

      let SubscribeCB = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        if (err) {
        } else {
          try {
            expect(data.code).assertEqual(16000050);
          } catch (e) {
            console.error(`disconnectServiceExtensionAbilityCallback_16000050-UIExtensionContext-except error`,
              JSON.stringify(e))
          }
          commonEventManager.unsubscribe(subscriber, () => {
            done();
          })
        }
      }
    })

    /**
     * @tc.number: disconnectServiceExtensionAbilityPromise_16000050
     * @tc.name: disconnectServiceExtensionAbilityPromise_16000050
     * @tc.desc: StartAbility code
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('disconnectServiceExtensionAbilityPromise_16000050', Level.LEVEL0, async (done: Function) => {
      console.info(`disconnectServiceExtensionAbilityPromise_16000050-is begin`)
      if (mpEnable != 'true') {
        done();
        return;
      }
      let subscriber: commonEventManager.CommonEventSubscriber;
      // 订阅者信息
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['StartAbility']
      };
      // 创建订阅者回调
      let createCB = async (err: BusinessError, commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
        if (!err) {
          console.info(`Succeeded in creating subscriber. 000`);
          subscriber = commonEventSubscriber;
          try {
            commonEventManager.subscribe(subscriber, SubscribeCB);
          } catch (error) {
          }
          want.parameters = {
            pageName: 'page2'
          }
          context.startAbility(want, (err: BusinessError) => {
            if (err.code) {
            }
            console.info('startAbility succeed');
          });
          await sleep(2000)
          let buttons = await driver.findComponent(ON.text('disconnectServiceExtensionAbilityPromise_16000050'));
          buttons.click();
        } else {
          console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
        }
      }

      try {
        commonEventManager.createSubscriber(subscribeInfo, createCB);
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
      }

      let SubscribeCB = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        if (err) {
        } else {
          try {
            expect(data.code).assertEqual(16000050);
          } catch (e) {
            console.error(`disconnectServiceExtensionAbilityPromise_16000050-UIExtensionContext-except error`,
              JSON.stringify(e))
          }
          commonEventManager.unsubscribe(subscriber, () => {
            done();
          })
        }
      }
    })


    /**
     * @tc.number: startAbilityStartOptions_16000072
     * @tc.name: startAbilityStartOptions_16000072
     * @tc.desc: StartAbility code
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('startAbilityStartOptions_16000072', Level.LEVEL0, async (done: Function) => {
      console.info(`startAbilityStartOptions_16000072-is begin`)
      if (mpEnable != 'true') {
        done();
        return;
      }
      let subscriber: commonEventManager.CommonEventSubscriber;
      // 订阅者信息
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['StartAbility']
      };
      // 创建订阅者回调
      let createCB = async (err: BusinessError, commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
        if (!err) {
          console.info(`Succeeded in creating subscriber. 000`);
          subscriber = commonEventSubscriber;
          try {
            commonEventManager.subscribe(subscriber, SubscribeCB);
          } catch (error) {
          }
          want.parameters = {
            pageName: 'page2'
          }
          context.startAbility(want, (err: BusinessError) => {
            if (err.code) {
            }
            console.info('startAbility succeed');
          });
          await sleep(2000)
          let buttons = await driver.findComponent(ON.text('startAbilityStartOptions_16000072'));
          buttons.click();
        } else {
          console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
        }
      }

      try {
        commonEventManager.createSubscriber(subscribeInfo, createCB);
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
      }

      let SubscribeCB = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        if (err) {
        } else {
          try {
            expect(data.code).assertEqual(16000072);
          } catch (e) {
            console.error(`startAbilityStartOptions_16000072-UIExtensionContext-except error`, JSON.stringify(e))
          }
          commonEventManager.unsubscribe(subscriber, () => {
            done();
          })
        }
      }
    })


    /**
     * @tc.number: startAbilityStartOptions_16000076
     * @tc.name: startAbilityStartOptions_16000076
     * @tc.desc: StartAbility code
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('startAbilityStartOptions_16000076', Level.LEVEL0, async (done: Function) => {
      console.info(`startAbilityStartOptions_16000076-is begin`)
      if (mpEnable != 'true') {
        done();
        return;
      }
      let subscriber: commonEventManager.CommonEventSubscriber;
      // 订阅者信息
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['StartAbility']
      };
      // 创建订阅者回调
      let createCB = async (err: BusinessError, commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
        if (!err) {
          console.info(`Succeeded in creating subscriber. 000`);
          subscriber = commonEventSubscriber;
          try {
            commonEventManager.subscribe(subscriber, SubscribeCB);
          } catch (error) {
          }
          want.parameters = {
            pageName: 'page2'
          }
          context.startAbility(want, (err: BusinessError) => {
            if (err.code) {
            }
            console.info('startAbility succeed');
          });
          await sleep(2000)
          let buttons = await driver.findComponent(ON.text('startAbilityStartOptions_16000076'));
          buttons.click();
        } else {
          console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
        }
      }

      try {
        commonEventManager.createSubscriber(subscribeInfo, createCB);
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
      }

      let SubscribeCB = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        if (err) {
        } else {
          try {
            expect(data.code).assertEqual(16000076);
          } catch (e) {
            console.error(`startAbilityStartOptions_16000076-UIExtensionContext-except error`, JSON.stringify(e))
          }
          commonEventManager.unsubscribe(subscriber, () => {
            done();
          })
        }
      }
    })

    /**
     * @tc.number: startAbilityStartOptions_16000077
     * @tc.name: startAbilityStartOptions_16000077
     * @tc.desc: StartAbility code
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('startAbilityStartOptions_16000077', Level.LEVEL0, async (done: Function) => {
      console.info(`startAbilityStartOptions_16000077-is begin`)
      if (mpEnable != 'true') {
        done();
        return;
      }
      let subscriber: commonEventManager.CommonEventSubscriber;
      // 订阅者信息
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['StartAbility']
      };
      // 创建订阅者回调
      let createCB = async (err: BusinessError, commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
        if (!err) {
          console.info(`Succeeded in creating subscriber. 000`);
          subscriber = commonEventSubscriber;
          try {
            commonEventManager.subscribe(subscriber, SubscribeCB);
          } catch (error) {
          }
          want.parameters = {
            pageName: 'page2'
          }
          context.startAbility(want, (err: BusinessError) => {
            if (err.code) {
            }
            console.info('startAbility succeed');
          });
          await sleep(2000)
          let buttons = await driver.findComponent(ON.text('startAbilityStartOptions_16000077'));
          buttons.click();
          await sleep(2000)
          delegator.getCurrentTopAbility().then((ability) => {
            delegator.doAbilityBackground(ability).then(async (data) => {
              let buttons = await driver.findComponent(ON.text('startAbilityStartOptions_16000077'));
              buttons.click();
            }).catch((err: BusinessError) => {
            });
          })
        } else {
          console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
        }
      }

      try {
        commonEventManager.createSubscriber(subscribeInfo, createCB);
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
      }

      let SubscribeCB = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        if (err) {
        } else {
          try {
            expect(data.code).assertEqual(16000077);
          } catch (e) {
            console.error(`startAbilityStartOptions_16000077-UIExtensionContext-except error`, JSON.stringify(e))
          }
          commonEventManager.unsubscribe(subscriber, () => {
            done();
          })
        }
      }
    })

    /**
     * @tc.number: startAbilityStartOptions_16000078
     * @tc.name: startAbilityStartOptions_16000078
     * @tc.desc: StartAbility code
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('startAbilityStartOptions_16000078', Level.LEVEL0, async (done: Function) => {
      console.info(`startAbilityStartOptions_16000078-is begin`)
      if (mpEnable != 'true') {
        done();
        return;
      }
      let subscriber: commonEventManager.CommonEventSubscriber;
      // 订阅者信息
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['StartAbility']
      };
      // 创建订阅者回调
      let createCB = async (err: BusinessError, commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
        if (!err) {
          console.info(`Succeeded in creating subscriber. 000`);
          subscriber = commonEventSubscriber;
          try {
            commonEventManager.subscribe(subscriber, SubscribeCB);
          } catch (error) {
          }
          want.parameters = {
            pageName: 'page2'
          }
          context.startAbility(want, (err: BusinessError) => {
            if (err.code) {
            }
            console.info('startAbility succeed');
          });
          await sleep(2000)
          let buttons = await driver.findComponent(ON.text('startAbilityStartOptions_16000078'));
          buttons.click();
        } else {
          console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
        }
      }

      try {
        commonEventManager.createSubscriber(subscribeInfo, createCB);
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
      }

      let SubscribeCB = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        if (err) {
        } else {
          try {
            expect(data.code).assertEqual(16000078);
          } catch (e) {
            console.error(`startAbilityStartOptions_16000078-UIExtensionContext-except error`, JSON.stringify(e))
          }
          commonEventManager.unsubscribe(subscriber, () => {
            done();
          })
        }
      }
    })


    /**
     * @tc.number: startAbilityStartOptions_16000079
     * @tc.name: startAbilityStartOptions_16000079
     * @tc.desc: StartAbility code
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('startAbilityStartOptions_16000079', Level.LEVEL0, async (done: Function) => {
      console.info(`startAbilityStartOptions_16000079-is begin`)
      if (mpEnable != 'true') {
        done();
        return;
      }
      let subscriber: commonEventManager.CommonEventSubscriber;
      // 订阅者信息
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['StartAbility']
      };
      // 创建订阅者回调
      let createCB = async (err: BusinessError, commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
        if (!err) {
          console.info(`Succeeded in creating subscriber. 000`);
          subscriber = commonEventSubscriber;
          try {
            commonEventManager.subscribe(subscriber, SubscribeCB);
          } catch (error) {
          }
          want.parameters = {
            pageName: 'page2'
          }
          context.startAbility(want, (err: BusinessError) => {
            if (err.code) {
            }
            console.info('startAbility succeed');
          });
          await sleep(2000)
          let buttons = await driver.findComponent(ON.text('startAbilityStartOptions_16000079'));
          buttons.click();
        } else {
          console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
        }
      }

      try {
        commonEventManager.createSubscriber(subscribeInfo, createCB);
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
      }

      let SubscribeCB = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        if (err) {
        } else {
          try {
            expect(data.code).assertEqual(16000079);
          } catch (e) {
            console.error(`startAbilityStartOptions_16000079-UIExtensionContext-except error`, JSON.stringify(e))
          }
          commonEventManager.unsubscribe(subscriber, () => {
            done();
          })
        }
      }
    })

    /**
     * @tc.number: startAbilityStartOptions_16000080
     * @tc.name: startAbilityStartOptions_16000080
     * @tc.desc: StartAbility code
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('startAbilityStartOptions_16000080', Level.LEVEL0, async (done: Function) => {
      console.info(`startAbilityStartOptions_16000080-is begin`)
      if (mpEnable != 'true') {
        done();
        return;
      }
      let subscriber: commonEventManager.CommonEventSubscriber;
      // 订阅者信息
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['StartAbility']
      };
      // 创建订阅者回调
      let createCB = async (err: BusinessError, commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
        if (!err) {
          console.info(`Succeeded in creating subscriber. 000`);
          subscriber = commonEventSubscriber;
          try {
            commonEventManager.subscribe(subscriber, SubscribeCB);
          } catch (error) {
          }
          want.parameters = {
            pageName: 'page2'
          }
          context.startAbility(want, (err: BusinessError) => {
            if (err.code) {
            }
            console.info('startAbility succeed');
          });
          await sleep(2000)
          let buttons = await driver.findComponent(ON.text('startAbilityStartOptions_16000080'));
          buttons.click();
        } else {
          console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
        }
      }

      try {
        commonEventManager.createSubscriber(subscribeInfo, createCB);
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
      }

      let SubscribeCB = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        if (err) {
        } else {
          try {
            expect(data.code).assertEqual(16000080);
          } catch (e) {
            console.error(`startAbilityStartOptions_16000080-UIExtensionContext-except error`, JSON.stringify(e))
          }
          commonEventManager.unsubscribe(subscriber, () => {
            done();
          })
        }
      }
    })


    /**
     * @tc.number: startAbilityForResultCallback_16000072
     * @tc.name: startAbilityForResultCallback_16000072
     * @tc.desc: StartAbility code
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('startAbilityForResultCallback_16000072', Level.LEVEL0, async (done: Function) => {
      console.info(`startAbilityForResultCallback_16000072-is begin`)
      if (mpEnable != 'true') {
        done();
        return;
      }
      let subscriber: commonEventManager.CommonEventSubscriber;
      // 订阅者信息
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['StartAbility']
      };
      // 创建订阅者回调
      let createCB = async (err: BusinessError, commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
        if (!err) {
          console.info(`Succeeded in creating subscriber. 000`);
          subscriber = commonEventSubscriber;
          try {
            commonEventManager.subscribe(subscriber, SubscribeCB);
          } catch (error) {
          }
          want.parameters = {
            pageName: 'page4'
          }
          context.startAbility(want, (err: BusinessError) => {
            if (err.code) {
            }
            console.info('startAbility succeed');
          });
          await sleep(2000)
          let buttons = await driver.findComponent(ON.text('startAbilityForResultCallback_16000072'));
          buttons.click();
        } else {
          console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
        }
      }

      try {
        commonEventManager.createSubscriber(subscribeInfo, createCB);
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
      }

      let SubscribeCB = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        if (err) {
        } else {
          try {
            expect(data.code).assertEqual(16000072);
          } catch (e) {
            console.error(`startAbilityForResultCallback_16000072-UIExtensionContext-except error`, JSON.stringify(e))
          }
          commonEventManager.unsubscribe(subscriber, () => {
            done();
          })
        }
      }
    })


    /**
     * @tc.number: startAbilityForResultCallback_16000076
     * @tc.name: startAbilityForResultCallback_16000076
     * @tc.desc: StartAbility code
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('startAbilityForResultCallback_16000076', Level.LEVEL0, async (done: Function) => {
      console.info(`startAbilityForResultCallback_16000076-is begin`)
      if (mpEnable != 'true') {
        done();
        return;
      }
      let subscriber: commonEventManager.CommonEventSubscriber;
      // 订阅者信息
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['StartAbility']
      };
      // 创建订阅者回调
      let createCB = async (err: BusinessError, commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
        if (!err) {
          console.info(`Succeeded in creating subscriber. 000`);
          subscriber = commonEventSubscriber;
          try {
            commonEventManager.subscribe(subscriber, SubscribeCB);
          } catch (error) {
          }
          want.parameters = {
            pageName: 'page4'
          }
          context.startAbility(want, (err: BusinessError) => {
            if (err.code) {
            }
            console.info('startAbility succeed');
          });
          await sleep(2000)
          let buttons = await driver.findComponent(ON.text('startAbilityForResultCallback_16000076'));
          buttons.click();
        } else {
          console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
        }
      }

      try {
        commonEventManager.createSubscriber(subscribeInfo, createCB);
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
      }

      let SubscribeCB = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        if (err) {
        } else {
          try {
            expect(data.code).assertEqual(16000076);
          } catch (e) {
            console.error(`startAbilityForResultCallback_16000076-UIExtensionContext-except error`, JSON.stringify(e))
          }
          commonEventManager.unsubscribe(subscriber, () => {
            done();
          })
        }
      }
    })

    /**
     * @tc.number: startAbilityForResultCallback_16000077
     * @tc.name: startAbilityForResultCallback_16000077
     * @tc.desc: StartAbility code
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('startAbilityForResultCallback_16000077', Level.LEVEL0, async (done: Function) => {
      console.info(`startAbilityForResultCallback_16000077-is begin`)
      if (mpEnable != 'true') {
        done();
        return;
      }
      let subscriber: commonEventManager.CommonEventSubscriber;
      // 订阅者信息
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['StartAbility']
      };
      // 创建订阅者回调
      let createCB = async (err: BusinessError, commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
        if (!err) {
          console.info(`Succeeded in creating subscriber. 000`);
          subscriber = commonEventSubscriber;
          try {
            commonEventManager.subscribe(subscriber, SubscribeCB);
          } catch (error) {
          }
          want.parameters = {
            pageName: 'page4'
          }
          context.startAbility(want, (err: BusinessError) => {
            if (err.code) {
            }
            console.info('startAbility succeed');
          });
          await sleep(2000)
          let buttons = await driver.findComponent(ON.text('startAbilityForResultCallback_16000077'));
          buttons.click();
          await sleep(2000)
          delegator.getCurrentTopAbility().then((ability) => {
            delegator.doAbilityBackground(ability).then(async (data) => {
              let buttons = await driver.findComponent(ON.text('startAbilityForResultCallback_16000077'));
              buttons.click();
            }).catch((err: BusinessError) => {
            });
          })
        } else {
          console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
        }
      }

      try {
        commonEventManager.createSubscriber(subscribeInfo, createCB);
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
      }

      let SubscribeCB = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        if (err) {
        } else {
          try {
            expect(data.code).assertEqual(16000077);
          } catch (e) {
            console.error(`startAbilityForResultCallback_16000077-UIExtensionContext-except error`, JSON.stringify(e))
          }
          commonEventManager.unsubscribe(subscriber, () => {
            done();
          })
        }
      }
    })

    /**
     * @tc.number: startAbilityForResultCallback_16000078
     * @tc.name: startAbilityForResultCallback_16000078
     * @tc.desc: StartAbility code
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('startAbilityForResultCallback_16000078', Level.LEVEL0, async (done: Function) => {
      console.info(`startAbilityForResultCallback_16000078-is begin`)
      if (mpEnable != 'true') {
        done();
        return;
      }
      let subscriber: commonEventManager.CommonEventSubscriber;
      // 订阅者信息
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['StartAbility']
      };
      // 创建订阅者回调
      let createCB = async (err: BusinessError, commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
        if (!err) {
          console.info(`Succeeded in creating subscriber. 000`);
          subscriber = commonEventSubscriber;
          try {
            commonEventManager.subscribe(subscriber, SubscribeCB);
          } catch (error) {
          }
          want.parameters = {
            pageName: 'page4'
          }
          context.startAbility(want, (err: BusinessError) => {
            if (err.code) {
            }
            console.info('startAbility succeed');
          });
          await sleep(2000)
          let buttons = await driver.findComponent(ON.text('startAbilityForResultCallback_16000078'));
          buttons.click();
        } else {
          console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
        }
      }

      try {
        commonEventManager.createSubscriber(subscribeInfo, createCB);
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
      }

      let SubscribeCB = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        if (err) {
        } else {
          try {
            expect(data.code).assertEqual(16000078);
          } catch (e) {
            console.error(`startAbilityForResultCallback_16000078-UIExtensionContext-except error`, JSON.stringify(e))
          }
          commonEventManager.unsubscribe(subscriber, () => {
            done();
          })
        }
      }
    })


    /**
     * @tc.number: startAbilityForResultCallback_16000079
     * @tc.name: startAbilityForResultCallback_16000079
     * @tc.desc: StartAbility code
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('startAbilityForResultCallback_16000079', Level.LEVEL0, async (done: Function) => {
      console.info(`startAbilityForResultCallback_16000079-is begin`)
      if (mpEnable != 'true') {
        done();
        return;
      }
      let subscriber: commonEventManager.CommonEventSubscriber;
      // 订阅者信息
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['StartAbility']
      };
      // 创建订阅者回调
      let createCB = async (err: BusinessError, commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
        if (!err) {
          console.info(`Succeeded in creating subscriber. 000`);
          subscriber = commonEventSubscriber;
          try {
            commonEventManager.subscribe(subscriber, SubscribeCB);
          } catch (error) {
          }
          want.parameters = {
            pageName: 'page4'
          }
          context.startAbility(want, (err: BusinessError) => {
            if (err.code) {
            }
            console.info('startAbility succeed');
          });
          await sleep(2000)
          let buttons = await driver.findComponent(ON.text('startAbilityForResultCallback_16000079'));
          buttons.click();
        } else {
          console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
        }
      }

      try {
        commonEventManager.createSubscriber(subscribeInfo, createCB);
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
      }

      let SubscribeCB = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        if (err) {
        } else {
          try {
            expect(data.code).assertEqual(16000079);
          } catch (e) {
            console.error(`startAbilityForResultCallback_16000079-UIExtensionContext-except error`, JSON.stringify(e))
          }
          commonEventManager.unsubscribe(subscriber, () => {
            done();
          })
        }
      }
    })

    /**
     * @tc.number: startAbilityForResultCallback_16000080
     * @tc.name: startAbilityForResultCallback_16000080
     * @tc.desc: StartAbility code
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('startAbilityForResultCallback_16000080', Level.LEVEL0, async (done: Function) => {
      console.info(`startAbilityForResultCallback_16000080-is begin`)
      if (mpEnable != 'true') {
        done();
        return;
      }
      let subscriber: commonEventManager.CommonEventSubscriber;
      // 订阅者信息
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['StartAbility']
      };
      // 创建订阅者回调
      let createCB = async (err: BusinessError, commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
        if (!err) {
          console.info(`Succeeded in creating subscriber. 000`);
          subscriber = commonEventSubscriber;
          try {
            commonEventManager.subscribe(subscriber, SubscribeCB);
          } catch (error) {
          }
          want.parameters = {
            pageName: 'page4'
          }
          context.startAbility(want, (err: BusinessError) => {
            if (err.code) {
            }
            console.info('startAbility succeed');
          });
          await sleep(2000)
          let buttons = await driver.findComponent(ON.text('startAbilityForResultCallback_16000080'));
          buttons.click();
        } else {
          console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
        }
      }

      try {
        commonEventManager.createSubscriber(subscribeInfo, createCB);
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
      }

      let SubscribeCB = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        if (err) {
        } else {
          try {
            expect(data.code).assertEqual(16000080);
          } catch (e) {
            console.error(`startAbilityForResultCallback_16000080-UIExtensionContext-except error`, JSON.stringify(e))
          }
          commonEventManager.unsubscribe(subscriber, () => {
            done();
          })
        }
      }
    })


    /**
     * @tc.number: startAbilityForResultOptions_16000072
     * @tc.name: startAbilityForResultOptions_16000072
     * @tc.desc: StartAbility code
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('startAbilityForResultOptions_16000072', Level.LEVEL0, async (done: Function) => {
      console.info(`startAbilityForResultOptions_16000072-is begin`)
      if (mpEnable != 'true') {
        done();
        return;
      }
      let subscriber: commonEventManager.CommonEventSubscriber;
      // 订阅者信息
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['StartAbility']
      };
      // 创建订阅者回调
      let createCB = async (err: BusinessError, commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
        if (!err) {
          console.info(`Succeeded in creating subscriber. 000`);
          subscriber = commonEventSubscriber;
          try {
            commonEventManager.subscribe(subscriber, SubscribeCB);
          } catch (error) {
          }
          want.parameters = {
            pageName: 'page4'
          }
          context.startAbility(want, (err: BusinessError) => {
            if (err.code) {
            }
            console.info('startAbility succeed');
          });
          await sleep(2000)
          let buttons = await driver.findComponent(ON.text('startAbilityForResultOptions_16000072'));
          buttons.click();
        } else {
          console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
        }
      }

      try {
        commonEventManager.createSubscriber(subscribeInfo, createCB);
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
      }

      let SubscribeCB = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        if (err) {
        } else {
          try {
            expect(data.code).assertEqual(16000072);
          } catch (e) {
            console.error(`startAbilityForResultOptions_16000072-UIExtensionContext-except error`, JSON.stringify(e))
          }
          commonEventManager.unsubscribe(subscriber, () => {
            done();
          })
        }
      }
    })


    /**
     * @tc.number: startAbilityForResultOptions_16000076
     * @tc.name: startAbilityForResultOptions_16000076
     * @tc.desc: StartAbility code
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('startAbilityForResultOptions_16000076', Level.LEVEL0, async (done: Function) => {
      console.info(`startAbilityForResultOptions_16000076-is begin`)
      if (mpEnable != 'true') {
        done();
        return;
      }
      let subscriber: commonEventManager.CommonEventSubscriber;
      // 订阅者信息
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['StartAbility']
      };
      // 创建订阅者回调
      let createCB = async (err: BusinessError, commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
        if (!err) {
          console.info(`Succeeded in creating subscriber. 000`);
          subscriber = commonEventSubscriber;
          try {
            commonEventManager.subscribe(subscriber, SubscribeCB);
          } catch (error) {
          }
          want.parameters = {
            pageName: 'page4'
          }
          context.startAbility(want, (err: BusinessError) => {
            if (err.code) {
            }
            console.info('startAbility succeed');
          });
          await sleep(2000)
          let buttons = await driver.findComponent(ON.text('startAbilityForResultOptions_16000076'));
          buttons.click();
        } else {
          console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
        }
      }

      try {
        commonEventManager.createSubscriber(subscribeInfo, createCB);
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
      }

      let SubscribeCB = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        if (err) {
        } else {
          try {
            expect(data.code).assertEqual(16000076);
          } catch (e) {
            console.error(`startAbilityForResultOptions_16000076-UIExtensionContext-except error`, JSON.stringify(e))
          }
          commonEventManager.unsubscribe(subscriber, () => {
            done();
          })
        }
      }
    })

    /**
     * @tc.number: startAbilityForResultOptions_16000077
     * @tc.name: startAbilityForResultOptions_16000077
     * @tc.desc: StartAbility code
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('startAbilityForResultOptions_16000077', Level.LEVEL0, async (done: Function) => {
      console.info(`startAbilityForResultOptions_16000077-is begin`)
      if (mpEnable != 'true') {
        done();
        return;
      }
      let subscriber: commonEventManager.CommonEventSubscriber;
      // 订阅者信息
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['StartAbility']
      };
      // 创建订阅者回调
      let createCB = async (err: BusinessError, commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
        if (!err) {
          console.info(`Succeeded in creating subscriber. 000`);
          subscriber = commonEventSubscriber;
          try {
            commonEventManager.subscribe(subscriber, SubscribeCB);
          } catch (error) {
          }
          want.parameters = {
            pageName: 'page4'
          }
          context.startAbility(want, (err: BusinessError) => {
            if (err.code) {
            }
            console.info('startAbility succeed');
          });
          await sleep(2000)
          let buttons = await driver.findComponent(ON.text('startAbilityForResultOptions_16000077'));
          buttons.click();
          await sleep(2000)
          delegator.getCurrentTopAbility().then((ability) => {
            delegator.doAbilityBackground(ability).then(async (data) => {
              let buttons = await driver.findComponent(ON.text('startAbilityForResultOptions_16000077'));
              buttons.click();
            }).catch((err: BusinessError) => {
            });
          })
        } else {
          console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
        }
      }

      try {
        commonEventManager.createSubscriber(subscribeInfo, createCB);
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
      }

      let SubscribeCB = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        if (err) {
        } else {
          try {
            expect(data.code).assertEqual(16000077);
          } catch (e) {
            console.error(`startAbilityForResultOptions_16000077-UIExtensionContext-except error`, JSON.stringify(e))
          }
          commonEventManager.unsubscribe(subscriber, () => {
            done();
          })
        }
      }
    })

    /**
     * @tc.number: startAbilityForResultOptions_16000078
     * @tc.name: startAbilityForResultOptions_16000078
     * @tc.desc: StartAbility code
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('startAbilityForResultOptions_16000078', Level.LEVEL0, async (done: Function) => {
      console.info(`startAbilityForResultOptions_16000078-is begin`)
      if (mpEnable != 'true') {
        done();
        return;
      }
      let subscriber: commonEventManager.CommonEventSubscriber;
      // 订阅者信息
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['StartAbility']
      };
      // 创建订阅者回调
      let createCB = async (err: BusinessError, commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
        if (!err) {
          console.info(`Succeeded in creating subscriber. 000`);
          subscriber = commonEventSubscriber;
          try {
            commonEventManager.subscribe(subscriber, SubscribeCB);
          } catch (error) {
          }
          want.parameters = {
            pageName: 'page4'
          }
          context.startAbility(want, (err: BusinessError) => {
            if (err.code) {
            }
            console.info('startAbility succeed');
          });
          await sleep(2000)
          let buttons = await driver.findComponent(ON.text('startAbilityForResultOptions_16000078'));
          buttons.click();
        } else {
          console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
        }
      }

      try {
        commonEventManager.createSubscriber(subscribeInfo, createCB);
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
      }

      let SubscribeCB = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        if (err) {
        } else {
          try {
            expect(data.code).assertEqual(16000078);
          } catch (e) {
            console.error(`startAbilityForResultOptions_16000078-UIExtensionContext-except error`, JSON.stringify(e))
          }
          commonEventManager.unsubscribe(subscriber, () => {
            done();
          })
        }
      }
    })


    /**
     * @tc.number: startAbilityForResultOptions_16000079
     * @tc.name: startAbilityForResultOptions_16000079
     * @tc.desc: StartAbility code
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('startAbilityForResultOptions_16000079', Level.LEVEL0, async (done: Function) => {
      console.info(`startAbilityForResultOptions_16000079-is begin`)
      if (mpEnable != 'true') {
        done();
        return;
      }
      let subscriber: commonEventManager.CommonEventSubscriber;
      // 订阅者信息
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['StartAbility']
      };
      // 创建订阅者回调
      let createCB = async (err: BusinessError, commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
        if (!err) {
          console.info(`Succeeded in creating subscriber. 000`);
          subscriber = commonEventSubscriber;
          try {
            commonEventManager.subscribe(subscriber, SubscribeCB);
          } catch (error) {
          }
          want.parameters = {
            pageName: 'page4'
          }
          context.startAbility(want, (err: BusinessError) => {
            if (err.code) {
            }
            console.info('startAbility succeed');
          });
          await sleep(2000)
          let buttons = await driver.findComponent(ON.text('startAbilityForResultOptions_16000079'));
          buttons.click();
        } else {
          console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
        }
      }

      try {
        commonEventManager.createSubscriber(subscribeInfo, createCB);
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
      }

      let SubscribeCB = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        if (err) {
        } else {
          try {
            expect(data.code).assertEqual(16000079);
          } catch (e) {
            console.error(`startAbilityForResultOptions_16000079-UIExtensionContext-except error`, JSON.stringify(e))
          }
          commonEventManager.unsubscribe(subscriber, () => {
            done();
          })
        }
      }
    })

    /**
     * @tc.number: startAbilityForResultOptions_16000080
     * @tc.name: startAbilityForResultOptions_16000080
     * @tc.desc: StartAbility code
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('startAbilityForResultOptions_16000080', Level.LEVEL0, async (done: Function) => {
      console.info(`startAbilityForResultOptions_16000080-is begin`)
      if (mpEnable != 'true') {
        done();
        return;
      }
      let subscriber: commonEventManager.CommonEventSubscriber;
      // 订阅者信息
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['StartAbility']
      };
      // 创建订阅者回调
      let createCB = async (err: BusinessError, commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
        if (!err) {
          console.info(`Succeeded in creating subscriber. 000`);
          subscriber = commonEventSubscriber;
          try {
            commonEventManager.subscribe(subscriber, SubscribeCB);
          } catch (error) {
          }
          want.parameters = {
            pageName: 'page4'
          }
          context.startAbility(want, (err: BusinessError) => {
            if (err.code) {
            }
            console.info('startAbility succeed');
          });
          await sleep(2000)
          let buttons = await driver.findComponent(ON.text('startAbilityForResultOptions_16000080'));
          buttons.click();
        } else {
          console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
        }
      }

      try {
        commonEventManager.createSubscriber(subscribeInfo, createCB);
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
      }

      let SubscribeCB = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        if (err) {
        } else {
          try {
            expect(data.code).assertEqual(16000080);
          } catch (e) {
            console.error(`startAbilityForResultOptions_16000080-UIExtensionContext-except error`, JSON.stringify(e))
          }
          commonEventManager.unsubscribe(subscriber, () => {
            done();
          })
        }
      }
    })


    //3

    /**
     * @tc.number: startAbilityForResultOptions_16000072
     * @tc.name: startAbilityForResultOptions_16000072
     * @tc.desc: StartAbility code
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('startAbilityForResultPromise_16000072', Level.LEVEL0, async (done: Function) => {
      console.info(`startAbilityForResultPromise_16000072-is begin`)
      if (mpEnable != 'true') {
        done();
        return;
      }
      let subscriber: commonEventManager.CommonEventSubscriber;
      // 订阅者信息
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['StartAbility']
      };
      // 创建订阅者回调
      let createCB = async (err: BusinessError, commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
        if (!err) {
          console.info(`Succeeded in creating subscriber. 000`);
          subscriber = commonEventSubscriber;
          try {
            commonEventManager.subscribe(subscriber, SubscribeCB);
          } catch (error) {
          }
          want.parameters = {
            pageName: 'page4'
          }
          context.startAbility(want, (err: BusinessError) => {
            if (err.code) {
            }
            console.info('startAbility succeed');
          });
          await sleep(2000)
          let buttons = await driver.findComponent(ON.text('startAbilityForResultPromise_16000072'));
          buttons.click();
        } else {
          console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
        }
      }

      try {
        commonEventManager.createSubscriber(subscribeInfo, createCB);
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
      }

      let SubscribeCB = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        if (err) {
        } else {
          try {
            expect(data.code).assertEqual(16000072);
          } catch (e) {
            console.error(`startAbilityForResultPromise_16000072-UIExtensionContext-except error`, JSON.stringify(e))
          }
          commonEventManager.unsubscribe(subscriber, () => {
            done();
          })
        }
      }
    })


    /**
     * @tc.number: startAbilityForResultPromise_16000076
     * @tc.name: startAbilityForResultPromise_16000076
     * @tc.desc: StartAbility code
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('startAbilityForResultPromise_16000076', Level.LEVEL0, async (done: Function) => {
      console.info(`startAbilityForResultPromise_16000076-is begin`)
      if (mpEnable != 'true') {
        done();
        return;
      }
      let subscriber: commonEventManager.CommonEventSubscriber;
      // 订阅者信息
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['StartAbility']
      };
      // 创建订阅者回调
      let createCB = async (err: BusinessError, commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
        if (!err) {
          console.info(`Succeeded in creating subscriber. 000`);
          subscriber = commonEventSubscriber;
          try {
            commonEventManager.subscribe(subscriber, SubscribeCB);
          } catch (error) {
          }
          want.parameters = {
            pageName: 'page4'
          }
          context.startAbility(want, (err: BusinessError) => {
            if (err.code) {
            }
            console.info('startAbility succeed');
          });
          await sleep(2000)
          let buttons = await driver.findComponent(ON.text('startAbilityForResultPromise_16000076'));
          buttons.click();
        } else {
          console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
        }
      }

      try {
        commonEventManager.createSubscriber(subscribeInfo, createCB);
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
      }

      let SubscribeCB = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        if (err) {
        } else {
          try {
            expect(data.code).assertEqual(16000076);
          } catch (e) {
            console.error(`startAbilityForResultPromise_16000076-UIExtensionContext-except error`, JSON.stringify(e))
          }
          commonEventManager.unsubscribe(subscriber, () => {
            done();
          })
        }
      }
    })

    /**
     * @tc.number: startAbilityForResultPromise_16000077
     * @tc.name: startAbilityForResultPromise_16000077
     * @tc.desc: StartAbility code
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('startAbilityForResultPromise_16000077', Level.LEVEL0, async (done: Function) => {
      console.info(`startAbilityForResultPromise_16000077-is begin`)
      if (mpEnable != 'true') {
        done();
        return;
      }
      let subscriber: commonEventManager.CommonEventSubscriber;
      // 订阅者信息
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['StartAbility']
      };
      // 创建订阅者回调
      let createCB = async (err: BusinessError, commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
        if (!err) {
          console.info(`Succeeded in creating subscriber. 000`);
          subscriber = commonEventSubscriber;
          try {
            commonEventManager.subscribe(subscriber, SubscribeCB);
          } catch (error) {
          }
          want.parameters = {
            pageName: 'page4'
          }
          context.startAbility(want, (err: BusinessError) => {
            if (err.code) {
            }
            console.info('startAbility succeed');
          });
          await sleep(2000)
          let buttons = await driver.findComponent(ON.text('startAbilityForResultPromise_16000077'));
          buttons.click();
          await sleep(2000)
          delegator.getCurrentTopAbility().then((ability) => {
            delegator.doAbilityBackground(ability).then(async (data) => {
              let buttons = await driver.findComponent(ON.text('startAbilityForResultPromise_16000077'));
              buttons.click();
            }).catch((err: BusinessError) => {
            });
          })
        } else {
          console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
        }
      }

      try {
        commonEventManager.createSubscriber(subscribeInfo, createCB);
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
      }

      let SubscribeCB = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        if (err) {
        } else {
          try {
            expect(data.code).assertEqual(16000077);
          } catch (e) {
            console.error(`startAbilityForResultPromise_16000077-UIExtensionContext-except error`, JSON.stringify(e))
          }
          commonEventManager.unsubscribe(subscriber, () => {
            done();
          })
        }
      }
    })

    /**
     * @tc.number: startAbilityForResultPromise_16000078
     * @tc.name: startAbilityForResultPromise_16000078
     * @tc.desc: StartAbility code
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('startAbilityForResultPromise_16000078', Level.LEVEL0, async (done: Function) => {
      console.info(`startAbilityForResultPromise_16000078-is begin`)
      if (mpEnable != 'true') {
        done();
        return;
      }
      let subscriber: commonEventManager.CommonEventSubscriber;
      // 订阅者信息
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['StartAbility']
      };
      // 创建订阅者回调
      let createCB = async (err: BusinessError, commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
        if (!err) {
          console.info(`Succeeded in creating subscriber. 000`);
          subscriber = commonEventSubscriber;
          try {
            commonEventManager.subscribe(subscriber, SubscribeCB);
          } catch (error) {
          }
          want.parameters = {
            pageName: 'page4'
          }
          context.startAbility(want, (err: BusinessError) => {
            if (err.code) {
            }
            console.info('startAbility succeed');
          });
          await sleep(2000)
          let buttons = await driver.findComponent(ON.text('startAbilityForResultPromise_16000078'));
          buttons.click();
        } else {
          console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
        }
      }

      try {
        commonEventManager.createSubscriber(subscribeInfo, createCB);
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
      }

      let SubscribeCB = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        if (err) {
        } else {
          try {
            expect(data.code).assertEqual(16000078);
          } catch (e) {
            console.error(`startAbilityForResultPromise_16000078-UIExtensionContext-except error`, JSON.stringify(e))
          }
          commonEventManager.unsubscribe(subscriber, () => {
            done();
          })
        }
      }
    })


    /**
     * @tc.number: startAbilityForResultPromise_16000079
     * @tc.name: startAbilityForResultPromise_16000079
     * @tc.desc: StartAbility code
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('startAbilityForResultPromise_16000079', Level.LEVEL0, async (done: Function) => {
      console.info(`startAbilityForResultPromise_16000079-is begin`)
      if (mpEnable != 'true') {
        done();
        return;
      }
      let subscriber: commonEventManager.CommonEventSubscriber;
      // 订阅者信息
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['StartAbility']
      };
      // 创建订阅者回调
      let createCB = async (err: BusinessError, commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
        if (!err) {
          console.info(`Succeeded in creating subscriber. 000`);
          subscriber = commonEventSubscriber;
          try {
            commonEventManager.subscribe(subscriber, SubscribeCB);
          } catch (error) {
          }
          want.parameters = {
            pageName: 'page4'
          }
          context.startAbility(want, (err: BusinessError) => {
            if (err.code) {
            }
            console.info('startAbility succeed');
          });
          await sleep(2000)
          let buttons = await driver.findComponent(ON.text('startAbilityForResultPromise_16000079'));
          buttons.click();
        } else {
          console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
        }
      }

      try {
        commonEventManager.createSubscriber(subscribeInfo, createCB);
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
      }

      let SubscribeCB = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        if (err) {
        } else {
          try {
            expect(data.code).assertEqual(16000079);
          } catch (e) {
            console.error(`startAbilityForResultPromise_16000079-UIExtensionContext-except error`, JSON.stringify(e))
          }
          commonEventManager.unsubscribe(subscriber, () => {
            done();
          })
        }
      }
    })

    /**
     * @tc.number: startAbilityForResultPromise_16000080
     * @tc.name: startAbilityForResultPromise_16000080
     * @tc.desc: StartAbility code
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('startAbilityForResultPromise_16000080', Level.LEVEL0, async (done: Function) => {
      console.info(`startAbilityForResultPromise_16000080-is begin`)
      if (mpEnable != 'true') {
        done();
        return;
      }
      let subscriber: commonEventManager.CommonEventSubscriber;
      // 订阅者信息
      let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: ['StartAbility']
      };
      // 创建订阅者回调
      let createCB = async (err: BusinessError, commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
        if (!err) {
          console.info(`Succeeded in creating subscriber. 000`);
          subscriber = commonEventSubscriber;
          try {
            commonEventManager.subscribe(subscriber, SubscribeCB);
          } catch (error) {
          }
          want.parameters = {
            pageName: 'page4'
          }
          context.startAbility(want, (err: BusinessError) => {
            if (err.code) {
            }
            console.info('startAbility succeed');
          });
          await sleep(2000)
          let buttons = await driver.findComponent(ON.text('startAbilityForResultPromise_16000080'));
          buttons.click();
        } else {
          console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
        }
      }

      try {
        commonEventManager.createSubscriber(subscribeInfo, createCB);
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(`Failed to create subscriber. Code is ${err.code}, message is ${err.message}`);
      }

      let SubscribeCB = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        if (err) {
        } else {
          try {
            expect(data.code).assertEqual(16000080);
          } catch (e) {
            console.error(`startAbilityForResultPromise_16000080-UIExtensionContext-except error`, JSON.stringify(e))
          }
          commonEventManager.unsubscribe(subscriber, () => {
            done();
          })
        }
      }
    })
  })
}