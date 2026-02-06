/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { common } from '@kit.AbilityKit';
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { hilog } from '@kit.PerformanceAnalysisKit';

let context = getContext(this) as common.UIAbilityContext;
let count:number = 0;
let a:number | undefined = 0
let b:number | undefined = 0
let c:number | undefined = 0
let d:number | undefined = 0

let ACTS_EVENT: commonEventManager.CommonEventSubscribeInfo = {
  events: [
    'ACTS_TEST_START',
    'ACTS_TEST_EMIT',
    'ACTS_TEST_EMIT_NEW',
    'ACTS_TEST_ONFORGROUND',
    'ACTS_TEST_ONBACKGROUND',
    'ACTS_TEST_ONDESTROYED',
    'ACTS_TEST_DESTROY'
  ]
};
let subscriber: commonEventManager.CommonEventSubscriber;

function publishCB(err: BusinessError) {
  if (err) {
    hilog.error(0x0000, 'testTag', `Failed to publish common event. Code is ${err.code}, message is ${err.message}`);
  } else {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Succeeded in publishing common event.');
  }
}

let sleep = async (delay: number): Promise<void> => {
  return new Promise((resolve, _) => {
    setTimeout(async () => {
      resolve();
    }, delay);
  });
};

export default function contextMonitoringTest() {
  describe('contextMonitoringTest', () => {

    let abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

    beforeAll(() => {
      context = globalThis.context;
    })
    beforeEach(() => {
      count = 0;
    })
    afterEach(async () => {
      a = 0;
      b = 0;
      c = 0;
      d = 0;
      await sleep(1500);
    })
    afterAll(() => {
    })

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_AMS_Context_ContextMonitoring_5100
     * @tc.name   : SUB_Ability_AbilityRuntime_AMS_Context_ContextMonitoring_5100
     * @tc.desc   : Testing AbilityStage scenario
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityRuntime_AMS_Context_ContextMonitoring_5100', Level.LEVEL0,(done: Function) => {
      let tag = `ContextMonitoring_5100`;
      hilog.info(0x0000, 'testTag', `${tag}, it begin`);
      expect(globalThis.argOneResult).assertEqual(1)
      expect(globalThis.argTwoResult).assertEqual(2)
      done();
    });

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_AMS_Context_ContextMonitoring_5200
     * @tc.name   : SUB_Ability_AbilityRuntime_AMS_Context_ContextMonitoring_5200
     * @tc.desc   : Testing emit with different number of callback arguments
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityRuntime_AMS_Context_ContextMonitoring_5200', Level.LEVEL0,(done: Function) => {
      let tag = `ContextMonitoring_5200`;
      hilog.info(0x0000, 'testTag', `${tag}, it begin`);
      commonEventManager.createSubscriber(ACTS_EVENT)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          let unSubscribeCallback = () => {
            globalThis.stageContext02.eventHub.off('event01', eventCallback01);
            setTimeout(() => {
              hilog.info(0x0000, 'testTag', `${tag} unSubscribeCallback`);
              done();
            }, 1000);
          }
          let subscribeCallBack = (err: BusinessError, data: commonEventManager.CommonEventData) => {
            hilog.info(0x0000, 'testTag', '%{public}s', `subscribeCallBack success with status: ${data.event}`)
            if (data.event == 'ACTS_TEST_START') {
              setTimeout(() => {
                try {
                  context.startAbility(
                    {
                      bundleName: 'com.test.actcontextmonitor',
                      abilityName: 'abilityStage02'
                    }).then(() => {
                    hilog.info(0x0000, 'testTag', '%{public}s', `${tag} startAbility end====>`);
                  })
                } catch (err) {
                  hilog.info(0x0000, 'testTag', '%{public}s', `${tag} open fail : ${err}`);
                }
              }, 500);
            }
            if (data.event == 'ACTS_TEST_EMIT') {
              globalThis.stageContext02.eventHub.on('event01', eventCallback01);
              globalThis.stageContext02.eventHub.emit('event01')
              expect(a).assertEqual(undefined)
              expect(b).assertEqual(undefined)
              globalThis.stageContext02.eventHub.emit('event01',1)
              expect(a).assertEqual(1)
              expect(b).assertEqual(undefined)
              globalThis.stageContext02.eventHub.emit('event01',1,2)
              expect(a).assertEqual(1)
              expect(b).assertEqual(2)
              globalThis.stageContext02.eventHub.emit('event01',1,2,3)
              expect(a).assertEqual(1)
              expect(b).assertEqual(2)
              expect(c).assertEqual(0)
              setTimeout(() => {
                commonEventManager.publish('ACTS_TEST_DESTROY',  ()=> {
                  hilog.info(0x0000, 'testTag', '%{public}s', 'abilityStage02 publish ACTS_TEST_DESTROY');
                });
              }, 100)
            }
            if (data.event == 'ACTS_TEST_DESTROY') {
              globalThis.stageContext02.eventHub.off('event01');
              globalThis.stageContext02.terminateSelf()
              setTimeout(() => {
                commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
              }, 500);
            }
          }
          commonEventManager.subscribe(subscriber, subscribeCallBack);
          setTimeout(() => {
            commonEventManager.publish('ACTS_TEST_START', publishCB);
          }, 100)
        })
    });

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_AMS_Context_ContextMonitoring_5300
     * @tc.name   : SUB_Ability_AbilityRuntime_AMS_Context_ContextMonitoring_5300
     * @tc.desc   : Testing off to unregister a single callback
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityRuntime_AMS_Context_ContextMonitoring_5300', Level.LEVEL0,(done: Function) => {
      let tag = `ContextMonitoring_5300`;
      hilog.info(0x0000, 'testTag', `${tag}, it begin`);
      commonEventManager.createSubscriber(ACTS_EVENT)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          let unSubscribeCallback = () => {
            globalThis.stageContext02.eventHub.off('event01', eventCallback01);
            setTimeout(() => {
              hilog.info(0x0000, 'testTag', `${tag} unSubscribeCallback`);
              done();
            }, 1000);
          }
          let subscribeCallBack = (err: BusinessError, data: commonEventManager.CommonEventData) => {
            hilog.info(0x0000, 'testTag', '%{public}s', `subscribeCallBack success with status: ${data.event}`)
            if (data.event == 'ACTS_TEST_START') {
              setTimeout(() => {
                try {
                  context.startAbility(
                    {
                      bundleName: 'com.test.actcontextmonitor',
                      abilityName: 'abilityStage02'
                    }).then(() => {
                    hilog.info(0x0000, 'testTag', '%{public}s', `${tag} startAbility end====>`);
                  })
                } catch (err) {
                  hilog.info(0x0000, 'testTag', '%{public}s', `${tag} open fail : ${err}`);
                }
              }, 500);
            }
            if (data.event == 'ACTS_TEST_EMIT') {
              globalThis.stageContext02.eventHub.on('event01', eventCallback01);
              globalThis.stageContext02.eventHub.on('event01', eventCallback02);
              globalThis.stageContext02.eventHub.off('event01', eventCallback01);
              globalThis.stageContext02.eventHub.emit('event01',1,2)
              expect(a).assertEqual(0)
              expect(b).assertEqual(0)
              expect(c).assertEqual(1)
              expect(d).assertEqual(2)
              setTimeout(() => {
                commonEventManager.publish('ACTS_TEST_DESTROY',  ()=> {
                  hilog.info(0x0000, 'testTag', '%{public}s', 'abilityStage02 publish ACTS_TEST_DESTROY');
                });
              }, 100)
            }
            if (data.event == 'ACTS_TEST_DESTROY') {
              globalThis.stageContext02.eventHub.off('event01');
              globalThis.stageContext02.terminateSelf()
              setTimeout(() => {
                commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
              }, 500);
            }
          }
          commonEventManager.subscribe(subscriber, subscribeCallBack);
          setTimeout(() => {
            commonEventManager.publish('ACTS_TEST_START', publishCB);
          }, 100)
        })
    });

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_AMS_Context_ContextMonitoring_5400
     * @tc.name   : SUB_Ability_AbilityRuntime_AMS_Context_ContextMonitoring_5400
     * @tc.desc   : Testing off to unregister all callbacks under a specific event
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityRuntime_AMS_Context_ContextMonitoring_5400', Level.LEVEL0,(done: Function) => {
      let tag = `ContextMonitoring_5400`;
      hilog.info(0x0000, 'testTag', `${tag}, it begin`);
      commonEventManager.createSubscriber(ACTS_EVENT)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          let unSubscribeCallback = () => {
            globalThis.stageContext02.eventHub.off('event01', eventCallback01);
            setTimeout(() => {
              hilog.info(0x0000, 'testTag', `${tag} unSubscribeCallback`);
              done();
            }, 1000);
          }
          let subscribeCallBack = (err: BusinessError, data: commonEventManager.CommonEventData) => {
            hilog.info(0x0000, 'testTag', '%{public}s', `subscribeCallBack success with status: ${data.event}`)
            if (data.event == 'ACTS_TEST_START') {
              setTimeout(() => {
                try {
                  context.startAbility(
                    {
                      bundleName: 'com.test.actcontextmonitor',
                      abilityName: 'abilityStage02'
                    }).then(() => {
                    hilog.info(0x0000, 'testTag', '%{public}s', `${tag} startAbility end====>`);
                  })
                } catch (err) {
                  hilog.info(0x0000, 'testTag', '%{public}s', `${tag} open fail : ${err}`);
                }
              }, 500);
            }
            if (data.event == 'ACTS_TEST_EMIT') {
              globalThis.stageContext02.eventHub.on('event01', eventCallback01);
              globalThis.stageContext02.eventHub.on('event01', eventCallback02);
              globalThis.stageContext02.eventHub.off('event01');
              globalThis.stageContext02.eventHub.emit('event01',1,2)
              expect(a).assertEqual(0)
              expect(b).assertEqual(0)
              setTimeout(() => {
                commonEventManager.publish('ACTS_TEST_DESTROY',  ()=> {
                  hilog.info(0x0000, 'testTag', '%{public}s', 'abilityStage02 publish ACTS_TEST_DESTROY');
                });
              }, 100)
            }
            if (data.event == 'ACTS_TEST_DESTROY') {
              globalThis.stageContext02.eventHub.off('event01');
              globalThis.stageContext02.terminateSelf()
              setTimeout(() => {
                commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
              }, 500);
            }
          }
          commonEventManager.subscribe(subscriber, subscribeCallBack);
          setTimeout(() => {
            commonEventManager.publish('ACTS_TEST_START', publishCB);
          }, 100)
        })
    });

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_AMS_Context_ContextMonitoring_5500
     * @tc.name   : SUB_Ability_AbilityRuntime_AMS_Context_ContextMonitoring_5500
     * @tc.desc   : Testing on to register an anonymous function
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityRuntime_AMS_Context_ContextMonitoring_5500', Level.LEVEL0,(done: Function) => {
      let tag = `ContextMonitoring_5500`;
      hilog.info(0x0000, 'testTag', `${tag}, it begin`);
      commonEventManager.createSubscriber(ACTS_EVENT)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          let unSubscribeCallback = () => {
            globalThis.stageContext02.eventHub.off('event01', eventCallback01);
            setTimeout(() => {
              hilog.info(0x0000, 'testTag', `${tag} unSubscribeCallback`);
              done();
            }, 1000);
          }
          let subscribeCallBack = (err: BusinessError, data: commonEventManager.CommonEventData) => {
            hilog.info(0x0000, 'testTag', '%{public}s', `subscribeCallBack success with status: ${data.event}`)
            if (data.event == 'ACTS_TEST_START') {
              setTimeout(() => {
                try {
                  context.startAbility(
                    {
                      bundleName: 'com.test.actcontextmonitor',
                      abilityName: 'abilityStage02'
                    }).then(() => {
                    hilog.info(0x0000, 'testTag', '%{public}s', `${tag} startAbility end====>`);
                  })
                } catch (err) {
                  hilog.info(0x0000, 'testTag', '%{public}s', `${tag} open fail : ${err}`);
                }
              }, 500);
            }
            if (data.event == 'ACTS_TEST_EMIT') {
              globalThis.stageContext02.eventHub.on('event01', (argOne?: number, argTwo?: number) => {
                a = argOne
                b = argTwo
                hilog.info(0x0000, 'testTag', '%{public}s', `eventCallback01 success, a is: ${a}, b is: ${b}`);
              });
              globalThis.stageContext02.eventHub.emit('event01',1,2)
              expect(a).assertEqual(1)
              expect(b).assertEqual(2)
              setTimeout(() => {
                commonEventManager.publish('ACTS_TEST_DESTROY',  ()=> {
                  hilog.info(0x0000, 'testTag', '%{public}s', 'abilityStage02 publish ACTS_TEST_DESTROY');
                });
              }, 100)
            }
            if (data.event == 'ACTS_TEST_DESTROY') {
              globalThis.stageContext02.eventHub.off('event01');
              globalThis.stageContext02.terminateSelf()
              setTimeout(() => {
                commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
              }, 500);
            }
          }
          commonEventManager.subscribe(subscriber, subscribeCallBack);
          setTimeout(() => {
            commonEventManager.publish('ACTS_TEST_START', publishCB);
          }, 100)
        })
    });

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_AMS_Context_ContextMonitoring_5600
     * @tc.name   : SUB_Ability_AbilityRuntime_AMS_Context_ContextMonitoring_5600
     * @tc.desc   : Testing on to register a member function
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityRuntime_AMS_Context_ContextMonitoring_5600', Level.LEVEL0,(done: Function) => {
      let tag = `ContextMonitoring_5600`;
      hilog.info(0x0000, 'testTag', `${tag}, it begin`);
      commonEventManager.createSubscriber(ACTS_EVENT)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          let unSubscribeCallback = () => {
            globalThis.stageContext02.eventHub.off('event01', eventCallback01);
            setTimeout(() => {
              hilog.info(0x0000, 'testTag', `${tag} unSubscribeCallback`);
              done();
            }, 1000);
          }
          let subscribeCallBack = (err: BusinessError, data: commonEventManager.CommonEventData) => {
            hilog.info(0x0000, 'testTag', '%{public}s', `subscribeCallBack success with status: ${data.event}`)
            if (data.event == 'ACTS_TEST_START') {
              setTimeout(() => {
                try {
                  context.startAbility(
                    {
                      bundleName: 'com.test.actcontextmonitor',
                      abilityName: 'abilityStage02'
                    }).then(() => {
                    hilog.info(0x0000, 'testTag', '%{public}s', `${tag} startAbility end====>`);
                  })
                } catch (err) {
                  hilog.info(0x0000, 'testTag', '%{public}s', `${tag} open fail : ${err}`);
                }
              }, 500);
            }
            if (data.event == 'ACTS_TEST_EMIT') {
              const myInstance = new MyCallbackClass();

              globalThis.stageContext02.eventHub.on('event01', myInstance.eventCallback01);
              globalThis.stageContext02.eventHub.emit('event01',1,2)
              expect(a).assertEqual(1)
              expect(b).assertEqual(2)
              setTimeout(() => {
                commonEventManager.publish('ACTS_TEST_DESTROY',  ()=> {
                  hilog.info(0x0000, 'testTag', '%{public}s', 'abilityStage02 publish ACTS_TEST_DESTROY');
                });
              }, 100)
            }
            if (data.event == 'ACTS_TEST_DESTROY') {
              globalThis.stageContext02.eventHub.off('event01');
              globalThis.stageContext02.terminateSelf()
              setTimeout(() => {
                commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
              }, 500);
            }
          }
          commonEventManager.subscribe(subscriber, subscribeCallBack);
          setTimeout(() => {
            commonEventManager.publish('ACTS_TEST_START', publishCB);
          }, 100)
        })
    });

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_AMS_Context_ContextMonitoring_5800
     * @tc.name   : SUB_Ability_AbilityRuntime_AMS_Context_ContextMonitoring_5800
     * @tc.desc   : Testing on, off, and emit for a single event
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityRuntime_AMS_Context_ContextMonitoring_5800', Level.LEVEL0,(done: Function) => {
      let tag = `ContextMonitoring_5800`;
      hilog.info(0x0000, 'testTag', `${tag}, it begin`);
      commonEventManager.createSubscriber(ACTS_EVENT)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          let unSubscribeCallback = () => {
            globalThis.stageContext02.eventHub.off('event01', eventCallback01);
            setTimeout(() => {
              hilog.info(0x0000, 'testTag', `${tag} unSubscribeCallback`);
              done();
            }, 1000);
          }
          let subscribeCallBack = (err: BusinessError, data: commonEventManager.CommonEventData) => {
            hilog.info(0x0000, 'testTag', '%{public}s', `subscribeCallBack success with status: ${data.event}`)
            if (data.event == 'ACTS_TEST_START') {
              setTimeout(() => {
                try {
                  context.startAbility(
                    {
                      bundleName: 'com.test.actcontextmonitor',
                      abilityName: 'abilityStage02'
                    }).then(() => {
                    hilog.info(0x0000, 'testTag', '%{public}s', `${tag} startAbility end====>`);
                  })
                } catch (err) {
                  hilog.info(0x0000, 'testTag', '%{public}s', `${tag} open fail : ${err}`);
                }
              }, 500);
            }
            if (data.event == 'ACTS_TEST_EMIT') {
              globalThis.stageContext02.eventHub.on('event01', eventCallback01);
              globalThis.stageContext02.eventHub.emit('event01',1,2)
              expect(a).assertEqual(1)
              expect(b).assertEqual(2)
              a = 0;
              b = 0;
              globalThis.stageContext02.eventHub.off('event01', eventCallback01);
              globalThis.stageContext02.eventHub.emit('event01',1,2)
              expect(a).assertEqual(0)
              expect(b).assertEqual(0)
              setTimeout(() => {
                commonEventManager.publish('ACTS_TEST_DESTROY',  ()=> {
                  hilog.info(0x0000, 'testTag', '%{public}s', 'abilityStage02 publish ACTS_TEST_DESTROY');
                });
              }, 100)
            }
            if (data.event == 'ACTS_TEST_DESTROY') {
              globalThis.stageContext02.eventHub.off('event01');
              globalThis.stageContext02.terminateSelf()
              setTimeout(() => {
                commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
              }, 500);
            }
          }
          commonEventManager.subscribe(subscriber, subscribeCallBack);
          setTimeout(() => {
            commonEventManager.publish('ACTS_TEST_START', publishCB);
          }, 100)
        })
    });

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_AMS_Context_ContextMonitoring_5900
     * @tc.name   : SUB_Ability_AbilityRuntime_AMS_Context_ContextMonitoring_5900
     * @tc.desc   : Testing scenarios with multiple context instances
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityRuntime_AMS_Context_ContextMonitoring_5900', Level.LEVEL0,(done: Function) => {
      let tag = `ContextMonitoring_5900`;
      hilog.info(0x0000, 'testTag', `${tag}, it begin`);
      commonEventManager.createSubscriber(ACTS_EVENT)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          let unSubscribeCallback = () => {
            globalThis.stageContext02.eventHub.off('event01', eventCallback01);
            setTimeout(() => {
              hilog.info(0x0000, 'testTag', `${tag} unSubscribeCallback`);
              done();
            }, 1000);
          }
          let subscribeCallBack = (err: BusinessError, data: commonEventManager.CommonEventData) => {
            hilog.info(0x0000, 'testTag', '%{public}s', `subscribeCallBack success with status: ${data.event}`)
            if (data.event == 'ACTS_TEST_START') {
              setTimeout(() => {
                try {
                  context.startAbility(
                    {
                      bundleName: 'com.test.actcontextmonitor',
                      abilityName: 'abilityStage02'
                    }).then(() => {
                    hilog.info(0x0000, 'testTag', '%{public}s', `${tag} startAbility end====>`);
                  })
                } catch (err) {
                  hilog.info(0x0000, 'testTag', '%{public}s', `${tag} open fail : ${err}`);
                }
              }, 500);
            }
            if (data.event == 'ACTS_TEST_EMIT') {
              setTimeout(() => {
                try {
                  globalThis.stageContext02.startAbility(
                    {
                      bundleName: 'com.test.actcontextmonitor',
                      abilityName: 'abilityStage03'
                    }).then(() => {
                    hilog.info(0x0000, 'testTag', '%{public}s', `${tag} startAbility end====>`);
                  })
                } catch (err) {
                  hilog.info(0x0000, 'testTag', '%{public}s', `${tag} open fail : ${err}`);
                }
              }, 500);
            }
            if (data.event == 'ACTS_TEST_EMIT_NEW') {
              globalThis.stageContext02.eventHub.on('event01', eventCallback01);
              globalThis.stageContext03.eventHub.on('event01', eventCallback02);
              globalThis.stageContext03.eventHub.emit('event01',1,2)
              expect(a).assertEqual(0)
              expect(b).assertEqual(0)
              expect(c).assertEqual(1)
              expect(d).assertEqual(2)
              setTimeout(() => {
                commonEventManager.publish('ACTS_TEST_DESTROY',  ()=> {
                  hilog.info(0x0000, 'testTag', '%{public}s', 'abilityStage03 publish ACTS_TEST_DESTROY');
                });
              }, 100)
            }
            if (data.event == 'ACTS_TEST_DESTROY') {
              globalThis.stageContext02.eventHub.off('event01');
              globalThis.stageContext02.terminateSelf()

              globalThis.stageContext03.eventHub.off('event01');
              globalThis.stageContext03.terminateSelf()
              setTimeout(() => {
                commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
              }, 500);
            }
          }
          commonEventManager.subscribe(subscriber, subscribeCallBack);
          setTimeout(() => {
            commonEventManager.publish('ACTS_TEST_START', publishCB);
          }, 100)
        })
    });

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_AMS_Context_ContextMonitoring_6000
     * @tc.name   : SUB_Ability_AbilityRuntime_AMS_Context_ContextMonitoring_6000
     * @tc.desc   : Testing on, off, and emit for multiple events
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityRuntime_AMS_Context_ContextMonitoring_6000', Level.LEVEL0,(done: Function) => {
      let tag = `ContextMonitoring_6000`;
      hilog.info(0x0000, 'testTag', `${tag}, it begin`);
      commonEventManager.createSubscriber(ACTS_EVENT)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          let unSubscribeCallback = () => {
            globalThis.stageContext02.eventHub.off('event01', eventCallback01);
            setTimeout(() => {
              hilog.info(0x0000, 'testTag', `${tag} unSubscribeCallback`);
              done();
            }, 1000);
          }
          let subscribeCallBack = (err: BusinessError, data: commonEventManager.CommonEventData) => {
            hilog.info(0x0000, 'testTag', '%{public}s', `subscribeCallBack success with status: ${data.event}`)
            if (data.event == 'ACTS_TEST_START') {
              setTimeout(() => {
                try {
                  context.startAbility(
                    {
                      bundleName: 'com.test.actcontextmonitor',
                      abilityName: 'abilityStage02'
                    }).then(() => {
                    hilog.info(0x0000, 'testTag', '%{public}s', `${tag} startAbility end====>`);
                  })
                } catch (err) {
                  hilog.info(0x0000, 'testTag', '%{public}s', `${tag} open fail : ${err}`);
                }
              }, 500);
            }
            if (data.event == 'ACTS_TEST_EMIT') {
              globalThis.stageContext02.eventHub.on('event01', eventCallback01);
              globalThis.stageContext02.eventHub.on('event02', eventCallback02);
              globalThis.stageContext02.eventHub.emit('event01',1,2)
              globalThis.stageContext02.eventHub.emit('event02',3,4)
              expect(a).assertEqual(1)
              expect(b).assertEqual(2)
              expect(c).assertEqual(3)
              expect(d).assertEqual(4)
              globalThis.stageContext02.eventHub.off('event01', eventCallback01);
              globalThis.stageContext02.eventHub.emit('event01',5,6)
              globalThis.stageContext02.eventHub.emit('event02',7,8)
              expect(a).assertEqual(1)
              expect(b).assertEqual(2)
              expect(c).assertEqual(7)
              expect(d).assertEqual(8)
              globalThis.stageContext02.eventHub.off('event02', eventCallback02);
              globalThis.stageContext02.eventHub.emit('event01',9,10)
              globalThis.stageContext02.eventHub.emit('event02',11,12)
              expect(a).assertEqual(1)
              expect(b).assertEqual(2)
              expect(c).assertEqual(7)
              expect(d).assertEqual(8)
              setTimeout(() => {
                commonEventManager.publish('ACTS_TEST_DESTROY',  ()=> {
                  hilog.info(0x0000, 'testTag', '%{public}s', 'abilityStage02 publish ACTS_TEST_DESTROY');
                });
              }, 100)
            }
            if (data.event == 'ACTS_TEST_DESTROY') {
              globalThis.stageContext02.eventHub.off('event01');
              globalThis.stageContext02.terminateSelf()
              setTimeout(() => {
                commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
              }, 500);
            }
          }
          commonEventManager.subscribe(subscriber, subscribeCallBack);
          setTimeout(() => {
            commonEventManager.publish('ACTS_TEST_START', publishCB);
          }, 100)
        })
    });

    /*
     * @tc.number : SUB_Ability_AbilityRuntime_AMS_Context_ContextMonitoring_6200
     * @tc.name   : SUB_Ability_AbilityRuntime_AMS_Context_ContextMonitoring_6200
     * @tc.desc   : Testing exception scenario of registering the same callback multiple times
     * @tc.size:   MediumTest
     * @tc.type:   Function
     * @tc.level  : 0
     */
    it('SUB_Ability_AbilityRuntime_AMS_Context_ContextMonitoring_6200', Level.LEVEL0,(done: Function) => {
      let tag = `ContextMonitoring_6200`;
      hilog.info(0x0000, 'testTag', `${tag}, it begin`);
      commonEventManager.createSubscriber(ACTS_EVENT)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          let unSubscribeCallback = () => {
            globalThis.stageContext02.eventHub.off('event01', eventCallback01);
            setTimeout(() => {
              hilog.info(0x0000, 'testTag', `${tag} unSubscribeCallback`);
              done();
            }, 1000);
          }
          let subscribeCallBack = (err: BusinessError, data: commonEventManager.CommonEventData) => {
            hilog.info(0x0000, 'testTag', '%{public}s', `subscribeCallBack success with status: ${data.event}`)
            if (data.event == 'ACTS_TEST_START') {
              setTimeout(() => {
                try {
                  context.startAbility(
                    {
                      bundleName: 'com.test.actcontextmonitor',
                      abilityName: 'abilityStage02'
                    }).then(() => {
                    hilog.info(0x0000, 'testTag', '%{public}s', `${tag} startAbility end====>`);
                  })
                } catch (err) {
                  hilog.info(0x0000, 'testTag', '%{public}s', `${tag} open fail : ${err}`);
                }
              }, 500);
            }
            if (data.event == 'ACTS_TEST_EMIT') {
              globalThis.stageContext02.eventHub.on('event01', eventCallback01);
              globalThis.stageContext02.eventHub.on('event01', eventCallback01);
              globalThis.stageContext02.eventHub.emit('event01',1,2)
              expect(a).assertEqual(1)
              expect(b).assertEqual(2)
              expect(count).assertEqual(1)
              setTimeout(() => {
                commonEventManager.publish('ACTS_TEST_DESTROY',  ()=> {
                  hilog.info(0x0000, 'testTag', '%{public}s', 'abilityStage02 publish ACTS_TEST_DESTROY');
                });
              }, 100)
            }
            if (data.event == 'ACTS_TEST_DESTROY') {
              globalThis.stageContext02.eventHub.off('event01');
              globalThis.stageContext02.terminateSelf()
              setTimeout(() => {
                commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
              }, 500);
            }
          }
          commonEventManager.subscribe(subscriber, subscribeCallBack);
          setTimeout(() => {
            commonEventManager.publish('ACTS_TEST_START', publishCB);
          }, 100)
        })
    });
  })
}

function eventCallback01(argOne?: number, argTwo?: number):void {
  a = argOne
  b = argTwo
  count++
  hilog.info(0x0000, 'testTag', '%{public}s', `eventCallback01 success, a is: ${a}, b is: ${b}`);
}

function eventCallback02(argOne?: number, argTwo?: number):void {
  c = argOne
  d = argTwo
  hilog.info(0x0000, 'testTag', '%{public}s', `eventCallback02 success, c is: ${c}, d is: ${d}`);
}

class MyCallbackClass {

  constructor() {
    a = 0;
    b = 0;
  }

  eventCallback01(argOne?: number, argTwo?: number): void {
    if (argOne !== undefined) {
      a = argOne;
    }
    if (argTwo !== undefined) {
      b = argTwo;
    }
    hilog.info(0x0000, 'testTag', '%{public}s', `eventCallback01 success, a is: ${a}, b is: ${b}`);
  }
}


