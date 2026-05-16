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
import { application, appManager, common } from '@kit.AbilityKit';
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { hilog } from '@kit.PerformanceAnalysisKit';

let context = getContext(this) as common.UIAbilityContext;
let ACTS_EVENT: commonEventManager.CommonEventSubscribeInfo = {
  events: [
    'ACTS_TEST_START01',
    'ACTS_TEST_START02',
    'ACTS_TEST_START03',

    'UiAbility01_onCreate',
    'UiAbility01_onDestroy',
    'UiAbility01_onWindowStageCreate',
    'UiAbility01_onForeground',
    'UiAbility01_onBackground',
    'UiAbility02_onCreate',
    'UiAbility02_onWindowStageCreate',
    'UiAbility02_onForeground',

    'UiAbility03_onCreate',
    'UiAbility03_onDestroy',
    'UiAbility03_onWindowStageCreate',
    'UiAbility03_onForeground',
    'UiAbility03_onBackground',
    'EntryAbility_onCreate',
    'EntryAbility_onWindowStageCreate',
    'EntryAbility_onForeground',

    'EntryAbility_onDestroy',
    'EntryAbility_onBackground',
    'UiAbility04_onCreate',
    'UiAbility04_onWindowStageCreate',
    'UiAbility04_onForeground_01',
    'UiAbility04_onForeground_02',
    'UiAbility04_onBackground',

    'UiAbility05_onCreate',
    'UiAbility05_onWindowStageCreate',
    'UiAbility05_onForeground',
    'UiAbility05_onBackground',
    'UiAbility06_onCreate',
    'UiAbility06_onWindowStageCreate',
    'UiAbility06_onForeground',
    'UiAbility06_onBackground',
    'UiAbility07_onCreate',
    'UiAbility07_onWindowStageCreate',
    'UiAbility07_onForeground',

    'EntryAbility_hap2_onCreate',
    'EntryAbility_hap2_onWindowStageCreate',
    'EntryAbility_hap2_onForeground',
    'EntryAbility_hap2_onBackground',
    'EntryAbility_hap3_onCreate',
    'EntryAbility_hap3_onWindowStageCreate',
    'EntryAbility_hap3_onForeground',

    'UiAbility08_onCreate',
    'UiAbility08_onWindowStageCreate',
    'UiAbility08_onForeground_01',
    'UiAbility08_onForeground_02',
    'UiAbility08_onBackground',
    'AbilityTest01_onCreate',
    'AbilityTest01_onWindowStageCreate',
    'AbilityTest01_onForeground',
    'AbilityTest01_onBackground',
    'UiAbility08_onNewWant',

    'UiAbility09_onCreate_01',
    'UiAbility09_onCreate_02',
    'UiAbility09_onDestroy_01',
    'UiAbility09_onDestroy_02',
    'UiAbility09_onWindowStageCreate_01',
    'UiAbility09_onWindowStageCreate_02',
    'UiAbility09_onForeground_01',
    'UiAbility09_onForeground_02',
    'UiAbility09_onBackground_01',
    'UiAbility09_onBackground_02',

    'UiAbility10_onCreate',
    'UiAbility10_onWindowStageCreate',
    'UiAbility10_onForeground',

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

export default function startAndTerminateTest() {
  describe('startAndTerminateTest', () => {

    let abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

    beforeAll(() => {
      context = globalThis.context
    })
    beforeEach(async () => {
      await sleep(1500)
    })
    afterEach(async () => {
      await sleep(1500)
    })
    afterAll(() => {
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_0100
     * @tc.number SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_0100
     * @tc.desc   Within the same application and HAP package, Ability1 launches Ability2 and then terminates itself.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_0100', Level.LEVEL0,(done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_0100`;
      hilog.info(0x0000, 'testTag', `${tag}, it begin`);
      let uiAbility01OnCreate:string = 'uiAbility01OnCreateFail';
      let uiAbility01OnDestroy: string = 'uiAbility01OnDestroyFail';
      let uiAbility01OnWindowStageCreate: string = 'uiAbility01OnWindowStageCreateFail';
      let uiAbility01OnForeground: string = 'uiAbility01OnForegroundFail';
      let uiAbility01OnBackground: string = 'uiAbility01OnBackgroundFail';
      let uiAbility02OnCreate: string = 'uiAbility02OnCreateFail';
      let uiAbility02OnWindowStageCreate: string = 'uiAbility02OnWindowStageCreateFail';
      let uiAbility02OnForeground: string = 'uiAbility02OnForegroundFail';
      commonEventManager.createSubscriber(ACTS_EVENT)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          let unSubscribeCallback = () => {
            setTimeout(async () => {
              hilog.info(0x0000, 'testTag', `${tag} unSubscribeCallback`);
              expect(uiAbility01OnCreate).assertEqual('uiAbility01OnCreateSuccess');
              expect(uiAbility01OnDestroy).assertEqual('uiAbility01OnDestroySuccess');
              expect(uiAbility01OnWindowStageCreate).assertEqual('uiAbility01OnWindowStageCreateSuccess');
              expect(uiAbility01OnForeground).assertEqual('uiAbility01OnForegroundSuccess');
              expect(uiAbility01OnBackground).assertEqual('uiAbility01OnBackgroundSuccess');
              expect(uiAbility02OnCreate).assertEqual('uiAbility02OnCreateSuccess');
              expect(uiAbility02OnWindowStageCreate).assertEqual('uiAbility02OnWindowStageCreateSuccess');
              expect(uiAbility02OnForeground).assertEqual('uiAbility02OnForegroundSuccess');
              hilog.info(0x0000, 'testTag', '%{public}s', `${tag}, it end`);
              done();
            }, 1000);
          }
          let subscribeCallBack = (err: BusinessError, data: commonEventManager.CommonEventData) => {
            hilog.info(0x0000, 'testTag', '%{public}s', `subscribeCallBack success`)
            if (data.event === 'UiAbility01_onCreate') {
              uiAbility01OnCreate = 'uiAbility01OnCreateSuccess';
            };
            if (data.event === 'UiAbility01_onDestroy') {
              uiAbility01OnDestroy = 'uiAbility01OnDestroySuccess';
            };
            if (data.event === 'UiAbility01_onWindowStageCreate') {
              uiAbility01OnWindowStageCreate = 'uiAbility01OnWindowStageCreateSuccess';
            };
            if (data.event === 'UiAbility01_onForeground') {
              uiAbility01OnForeground = 'uiAbility01OnForegroundSuccess';
            };
            if (data.event === 'UiAbility01_onBackground') {
              uiAbility01OnBackground = 'uiAbility01OnBackgroundSuccess';
            };
            if (data.event === 'UiAbility02_onCreate') {
              uiAbility02OnCreate = 'uiAbility02OnCreateSuccess';
            };
            if (data.event === 'UiAbility02_onWindowStageCreate') {
              uiAbility02OnWindowStageCreate = 'uiAbility02OnWindowStageCreateSuccess';
            };
            if (data.event === 'UiAbility02_onForeground') {
              uiAbility02OnForeground = 'uiAbility02OnForegroundSuccess';
            };
            if (data.event === 'ACTS_TEST_START01') {
              setTimeout(() => {
                try {
                  context.startAbility(
                    {
                      bundleName: 'com.test.actsstartandterminatetest',
                      abilityName: 'UiAbility01'
                    }).then(() => {
                    hilog.info(0x0000, 'testTag', '%{public}s', `${tag} startAbility end====>`);
                  })
                } catch (err) {
                  hilog.info(0x0000, 'testTag', '%{public}s', `${tag} open fail : ${err}`);
                }
              }, 500);
            }
            if (data.event === 'ACTS_TEST_START02') {
              setTimeout(() => {
                try {
                  globalThis.uiAbilityContext1.startAbility(
                    {
                      bundleName: 'com.test.actsstartandterminatetest',
                      abilityName: 'UiAbility02'
                    }).then(() => {
                    hilog.info(0x0000, 'testTag', '%{public}s', `${tag} startAbility end====>`);
                  })
                } catch (err) {
                  hilog.info(0x0000, 'testTag', '%{public}s', `${tag} open fail : ${err}`);
                }
              }, 500);
            }
            if (data.event === 'ACTS_TEST_DESTROY') {
              setTimeout(() => {
                commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
              }, 500);
            }
          }
          commonEventManager.subscribe(subscriber, subscribeCallBack);
          setTimeout(() => {
            commonEventManager.publish('ACTS_TEST_START01', publishCB);
          }, 100)
        })
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_0900
     * @tc.number SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_0900
     * @tc.desc   Under the same application and same HAP, the ability chain-based launch mechanism works as
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_0900', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_0900`;
      hilog.info(0x0000, 'testTag', '%{public}s', `${tag}, it begin`);
      let uiAbility05OnCreate: string = 'uiAbility05OnCreateFail';
      let uiAbility05OnWindowStageCreate: string = 'uiAbility05OnWindowStageCreateFail';
      let uiAbility05OnForeground: string = 'uiAbility05OnForegroundFail';
      let uiAbility05OnBackground: string = 'uiAbility05OnBackgroundFail';
      let uiAbility06OnCreate: string = 'uiAbility06OnCreateFail';
      let uiAbility06OnWindowStageCreate: string = 'uiAbility06OnWindowStageCreateFail';
      let uiAbility06OnForeground: string = 'uiAbility06OnForegroundFail';
      let uiAbility06OnBackground: string = 'uiAbility06OnBackgroundFail';
      let uiAbility07OnCreate: string = 'uiAbility07OnCreateFail';
      let uiAbility07OnWindowStageCreate: string = 'uiAbility07OnWindowStageCreateFail';
      let uiAbility07OnForeground: string = 'uiAbility07OnForegroundFail';
      commonEventManager.createSubscriber(ACTS_EVENT)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          let unSubscribeCallback = () => {
            setTimeout(async () => {
              hilog.info(0x0000, 'testTag', '%{public}s', `====>${tag} unSubscribeCallback`);
              expect(uiAbility05OnCreate).assertEqual('uiAbility05OnCreateSuccess');
              expect(uiAbility05OnWindowStageCreate).assertEqual('uiAbility05OnWindowStageCreateSuccess');
              expect(uiAbility05OnForeground).assertEqual('uiAbility05OnForegroundSuccess');
              expect(uiAbility05OnBackground).assertEqual('uiAbility05OnBackgroundSuccess');
              expect(uiAbility06OnCreate).assertEqual('uiAbility06OnCreateSuccess');
              expect(uiAbility06OnWindowStageCreate).assertEqual('uiAbility06OnWindowStageCreateSuccess');
              expect(uiAbility06OnForeground).assertEqual('uiAbility06OnForegroundSuccess');
              expect(uiAbility06OnBackground).assertEqual('uiAbility06OnBackgroundSuccess');
              expect(uiAbility07OnCreate).assertEqual('uiAbility07OnCreateSuccess');
              expect(uiAbility07OnWindowStageCreate).assertEqual('uiAbility07OnWindowStageCreateSuccess');
              expect(uiAbility07OnForeground).assertEqual('uiAbility07OnForegroundSuccess');
              hilog.info(0x0000, 'testTag', '%{public}s', `${tag}, it end`);
              done();
            }, 1000);
          }
          let subscribeCallBack = (err: BusinessError, data: commonEventManager.CommonEventData) => {
            hilog.info(0x0000, 'testTag', '%{public}s', `subscribeCallBack success ` + JSON.stringify(data.event))
            if (data.event === 'UiAbility05_onCreate') {
              uiAbility05OnCreate = 'uiAbility05OnCreateSuccess';
            };

            if (data.event === 'UiAbility05_onWindowStageCreate') {
              uiAbility05OnWindowStageCreate = 'uiAbility05OnWindowStageCreateSuccess';
            };

            if (data.event === 'UiAbility05_onForeground') {
              uiAbility05OnForeground = 'uiAbility05OnForegroundSuccess';
            };

            if (data.event === 'UiAbility05_onBackground') {
              uiAbility05OnBackground = 'uiAbility05OnBackgroundSuccess';
            };

            if (data.event === 'UiAbility06_onCreate') {
              uiAbility06OnCreate = 'uiAbility06OnCreateSuccess';
            };

            if (data.event === 'UiAbility06_onWindowStageCreate') {
              uiAbility06OnWindowStageCreate = 'uiAbility06OnWindowStageCreateSuccess';
            };

            if (data.event === 'UiAbility06_onForeground') {
              uiAbility06OnForeground = 'uiAbility06OnForegroundSuccess';
            };

            if (data.event === 'UiAbility06_onBackground') {
              uiAbility06OnBackground = 'uiAbility06OnBackgroundSuccess';
            };

            if (data.event === 'UiAbility07_onCreate') {
              uiAbility07OnCreate = 'uiAbility07OnCreateSuccess';
            };

            if (data.event === 'UiAbility07_onWindowStageCreate') {
              uiAbility07OnWindowStageCreate = 'uiAbility07OnWindowStageCreateSuccess';
            };

            if (data.event === 'UiAbility07_onForeground') {
              uiAbility07OnForeground = 'uiAbility07OnForegroundSuccess';
            };
            if (data.event === 'ACTS_TEST_START01') {
              setTimeout(() => {
                try {
                  context.startAbility(
                    {
                      bundleName: 'com.test.actsstartandterminatetest',
                      abilityName: 'UiAbility05'
                    }).then(() => {
                    hilog.info(0x0000, 'testTag', '%{public}s', `${tag} startAbility end====>`);
                  })
                } catch (err) {
                  hilog.info(0x0000, 'testTag', '%{public}s', `${tag} open fail : ${err}`);
                }
              }, 500);
            }
            if (data.event === 'ACTS_TEST_START02') {
              setTimeout(() => {
                try {
                  globalThis.uiAbilityContext5.startAbility(
                    {
                      bundleName: 'com.test.actsstartandterminatetest',
                      abilityName: 'UiAbility06'
                    }).then(() => {
                    hilog.info(0x0000, 'testTag', '%{public}s', `${tag} startAbility end====>`);
                  })
                  setTimeout(()=>{
                    try{
                      globalThis.uiAbilityContext5.moveAbilityToBackground().then(()=>{
                        hilog.info(0x0000, 'testTag', '%{public}s', 'uiAbilityContext5 moveAbilityToBackground success');
                      }).catch((err: BusinessError)=>{
                        hilog.info(0x0000, 'testTag', '%{public}s', 'uiAbilityContext5 moveAbilityToBackground fail ' + err?.code);
                        if(err?.code == 16000061){
                          commonEventManager.publish('UiAbility05_onBackground', () => {
                            hilog.info(0x0000, 'testTag', '%{public}s', 'uiAbilityContext5 publish UiAbility05_onBackground');
                            setTimeout(()=>{
                              globalThis.uiAbilityContext5.terminateSelf();
                            },500)
                          });
                        }
                      });
                    }catch(e){
                      hilog.info(0x0000, 'testTag', '%{public}s', 'uiAbilityContext5 moveAbilityToBackground catch fail ' + e?.code + ' ' + e.message);
                    }
                  }, 1000)
                } catch (err) {
                  hilog.info(0x0000, 'testTag', '%{public}s', `${tag} startAbility fail : ${err}`);
                }
              }, 500);
            }
            if (data.event === 'ACTS_TEST_START03') {
              setTimeout(() => {
                try {
                  globalThis.uiAbilityContext6.startAbility(
                    {
                      bundleName: 'com.test.actsstartandterminatetest',
                      abilityName: 'UiAbility07'
                    }).then(() => {
                    hilog.info(0x0000, 'testTag', '%{public}s', `${tag} startAbility end====>`);
                  })
                  setTimeout(()=>{
                    try{
                      globalThis.uiAbilityContext6.moveAbilityToBackground().then(()=>{
                        hilog.info(0x0000, 'testTag', '%{public}s', 'uiAbilityContext6 moveAbilityToBackground success');
                      }).catch((err: BusinessError)=>{
                        hilog.info(0x0000, 'testTag', '%{public}s', 'uiAbilityContext6 moveAbilityToBackground fail ' + err?.code);
                        if(err?.code == 16000061){
                          commonEventManager.publish('UiAbility05_onBackground', () => {
                            hilog.info(0x0000, 'testTag', '%{public}s', 'uiAbilityContext6 publish UiAbility05_onBackground');
                            setTimeout(()=>{
                              globalThis.uiAbilityContext6.terminateSelf();
                            },500)
                          });
                        }
                      });
                    }catch(e){
                      hilog.info(0x0000, 'testTag', '%{public}s', 'uiAbilityContext6 moveAbilityToBackground catch fail ' + e?.code + ' ' + e.message);
                    }
                  }, 1000)
                } catch (err) {
                  hilog.info(0x0000, 'testTag', '%{public}s', `${tag} startAbility fail : ${err}`);
                }
              }, 500);
            }
            if (data.event === 'ACTS_TEST_ONBACKGROUND') {
              if(data.parameters){
                expect(data.parameters.result).assertEqual('onBackground')
              }
            }
            if (data.event === 'ACTS_TEST_DESTROY') {
              setTimeout(() => {
                commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
              }, 500);
            }
          }
          commonEventManager.subscribe(subscriber, subscribeCallBack);
          setTimeout(() => {
            commonEventManager.publish('ACTS_TEST_START01', publishCB);
          }, 100)
        })
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_1200
     * @tc.number SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_1200
     * @tc.desc   Ability loop launch: 1 calls 2, and 2 calls back to 1 (singleton);
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_1200', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_1200`;
      hilog.info(0x0000, 'testTag', '%{public}s', `${tag}, it begin`);
      let uiAbility08OnCreate: string = 'uiAbility08OnCreateFail';
      let uiAbility08OnWindowStageCreate: string = 'uiAbility08OnWindowStageCreateFail';
      let uiAbility08OnForeground01: string = 'uiAbility08OnForeground01Fail';
      let uiAbility08OnForeground02: string = 'uiAbility08OnForeground02Fail';
      let uiAbility08OnBackground: string = 'uiAbility08OnBackgroundFail';
      let abilityTest01OnCreate: string = 'abilityTest01OnCreateFail';
      let abilityTest01OnWindowStageCreate: string = 'abilityTest01OnWindowStageCreateFail';
      let abilityTest01OnForeground: string = 'abilityTest01OnForegroundFail';
      let abilityTest01OnBackground: string = 'abilityTest01OnBackgroundFail';
      commonEventManager.createSubscriber(ACTS_EVENT)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          let unSubscribeCallback = () => {
            setTimeout(async () => {
              hilog.info(0x0000, 'testTag', '%{public}s', `====>${tag} unSubscribeCallback`);
              expect(uiAbility08OnCreate).assertEqual('uiAbility08OnCreateSuccess');
              expect(uiAbility08OnWindowStageCreate).assertEqual('uiAbility08OnWindowStageCreateSuccess');
              expect(uiAbility08OnForeground01).assertEqual('uiAbility08OnForeground01Success');
              expect(uiAbility08OnForeground02).assertEqual('UiAbility08_onNewWant');
              expect(uiAbility08OnBackground).assertEqual('uiAbility08OnBackgroundSuccess');
              expect(abilityTest01OnCreate).assertEqual('abilityTest01OnCreateSuccess');
              expect(abilityTest01OnWindowStageCreate).assertEqual('abilityTest01OnWindowStageCreateSuccess');
              expect(abilityTest01OnForeground).assertEqual('abilityTest01OnForegroundSuccess');
              expect(abilityTest01OnBackground).assertEqual('abilityTest01OnBackgroundSuccess');
              hilog.info(0x0000, 'testTag', '%{public}s', `${tag}, it end`);
              done();
            }, 1000);
          }
          let subscribeCallBack = (err: BusinessError, data: commonEventManager.CommonEventData) => {
            hilog.info(0x0000, 'testTag', '%{public}s', `subscribeCallBack success`)
            if (data.event === 'UiAbility08_onCreate') {
              uiAbility08OnCreate = 'uiAbility08OnCreateSuccess';
            };

            if (data.event === 'UiAbility08_onWindowStageCreate') {
              uiAbility08OnWindowStageCreate = 'uiAbility08OnWindowStageCreateSuccess';
            };

            if (data.event === 'UiAbility08_onForeground_01') {
              uiAbility08OnForeground01 = 'uiAbility08OnForeground01Success';
            };

            if (data.event === 'UiAbility08_onNewWant') {
              uiAbility08OnForeground02 = 'UiAbility08_onNewWant';
            };

            if (data.event === 'UiAbility08_onBackground') {
              uiAbility08OnBackground = 'uiAbility08OnBackgroundSuccess';
            };

            if (data.event === 'AbilityTest01_onCreate') {
              abilityTest01OnCreate = 'abilityTest01OnCreateSuccess';
            };

            if (data.event === 'AbilityTest01_onWindowStageCreate') {
              abilityTest01OnWindowStageCreate = 'abilityTest01OnWindowStageCreateSuccess';
            };

            if (data.event === 'AbilityTest01_onForeground') {
              abilityTest01OnForeground = 'abilityTest01OnForegroundSuccess';
            };

            if (data.event === 'AbilityTest01_onBackground') {
              abilityTest01OnBackground = 'abilityTest01OnBackgroundSuccess';
            };
            if (data.event === 'ACTS_TEST_START01') {
              setTimeout(() => {
                try {
                  context.startAbility(
                    {
                      bundleName: 'com.test.actsstartandterminatetest',
                      abilityName: 'UiAbility08'
                    }).then(() => {
                    hilog.info(0x0000, 'testTag', '%{public}s', `${tag} startAbility end====>`);
                  })
                } catch (err) {
                  hilog.info(0x0000, 'testTag', '%{public}s', `${tag} open fail : ${err}`);
                }
              }, 500);
            }
            if (data.event === 'ACTS_TEST_DESTROY') {
              setTimeout(() => {
                commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
              }, 500);
            }
          }
          commonEventManager.subscribe(subscriber, subscribeCallBack);
          setTimeout(() => {
            commonEventManager.publish('ACTS_TEST_START01', publishCB);
          }, 100)
        })
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_2200
     * @tc.number SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_2200
     * @tc.desc   Start an ability, and after it ends, restart the ability (singleton);
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_2200', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_2200`;
      hilog.info(0x0000, 'testTag', '%{public}s', `${tag}, it begin`);
      let uiAbility09OnCreate01: string = 'uiAbility09OnCreate01Fail';
      let uiAbility09OnCreate02: string = 'uiAbility09OnCreate02Fail';
      let uiAbility09OnDestroy01: string = 'uiAbility09OnDestroy01Fail';
      let uiAbility09OnDestroy02: string = 'uiAbility09OnDestroy02Fail';
      let uiAbility09OnWindowStageCreate01: string = 'uiAbility09OnWindowStageCreate01Fail';
      let uiAbility09OnWindowStageCreate02: string = 'uiAbility09OnWindowStageCreate02Fail';
      let uiAbility09OnForeground01: string = 'uiAbility09OnForeground01Fail';
      let uiAbility09OnForeground02: string = 'uiAbility09OnForeground02Fail';
      let uiAbility09OnBackground01: string = 'uiAbility09OnBackground01Fail';
      let uiAbility09OnBackground02: string = 'uiAbility09OnBackground02Fail';
      commonEventManager.createSubscriber(ACTS_EVENT)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          let unSubscribeCallback = () => {
            setTimeout(async () => {
              hilog.info(0x0000, 'testTag', '%{public}s', `====>${tag} unSubscribeCallback`);
              expect(uiAbility09OnCreate01).assertEqual('uiAbility09OnCreate01Success');
              expect(uiAbility09OnCreate02).assertEqual('uiAbility09OnCreate02Success');
              expect(uiAbility09OnDestroy01).assertEqual('uiAbility09OnDestroy01Success');
              expect(uiAbility09OnDestroy02).assertEqual('uiAbility09OnDestroy02Success');
              expect(uiAbility09OnWindowStageCreate01).assertEqual('uiAbility09OnWindowStageCreate01Success');
              expect(uiAbility09OnWindowStageCreate02).assertEqual('uiAbility09OnWindowStageCreate02Success');
              expect(uiAbility09OnForeground01).assertEqual('uiAbility09OnForeground01Success');
              expect(uiAbility09OnForeground02).assertEqual('uiAbility09OnForeground02Success');
              expect(uiAbility09OnBackground01).assertEqual('uiAbility09OnBackground01Success');
              expect(uiAbility09OnBackground02).assertEqual('uiAbility09OnBackground02Success');
              hilog.info(0x0000, 'testTag', '%{public}s', `${tag}, it end`);
              done();
            }, 1000);
          }
          let subscribeCallBack = async (err: BusinessError, data: commonEventManager.CommonEventData) => {
            hilog.info(0x0000, 'testTag', '%{public}s', `subscribeCallBack success`)
            if (data.event === 'ACTS_TEST_START01') {
              setTimeout(() => {
                try {
                  context.startAbility(
                    {
                      bundleName: 'com.test.actsstartandterminatetest',
                      abilityName: 'UiAbility09',
                      parameters: {
                        isFirstStart:true
                      }
                    }).then(() => {
                    hilog.info(0x0000, 'testTag', '%{public}s', `${tag} startAbility end====>`);
                  })
                } catch (err) {
                  hilog.info(0x0000, 'testTag', '%{public}s', `${tag} open fail : ${err}`);
                }
              }, 500);
            }
            if (data.event === 'UiAbility09_onCreate_01') {
              uiAbility09OnCreate01 = 'uiAbility09OnCreate01Success';
              hilog.info(0x0000, 'testTag', '%{public}s', `${tag}, uiAbility09OnCreate01: ${uiAbility09OnCreate01}`);
            };

            if (data.event === 'UiAbility09_onCreate_02') {
              uiAbility09OnCreate02 = 'uiAbility09OnCreate02Success';
              hilog.info(0x0000, 'testTag', '%{public}s', `${tag}, uiAbility09OnCreate02: ${uiAbility09OnCreate02}`);
            };

            if (data.event === 'UiAbility09_onDestroy_02') {
              uiAbility09OnDestroy02 = 'uiAbility09OnDestroy02Success';
              hilog.info(0x0000, 'testTag', '%{public}s', `${tag}, uiAbility09OnDestroy02: ${uiAbility09OnDestroy02}`);
            };

            if (data.event === 'UiAbility09_onWindowStageCreate_01') {
              uiAbility09OnWindowStageCreate01 = 'uiAbility09OnWindowStageCreate01Success';
              hilog.info(0x0000, 'testTag', '%{public}s', `${tag}, uiAbility09OnWindowStageCreate01: ${uiAbility09OnWindowStageCreate01}`);
            };

            if (data.event === 'UiAbility09_onWindowStageCreate_02') {
              uiAbility09OnWindowStageCreate02 = 'uiAbility09OnWindowStageCreate02Success';
              hilog.info(0x0000, 'testTag', '%{public}s', `${tag}, uiAbility09OnWindowStageCreate02: ${uiAbility09OnWindowStageCreate02}`);
            };

            if (data.event === 'UiAbility09_onForeground_02') {
              uiAbility09OnForeground02 = 'uiAbility09OnForeground02Success';
              hilog.info(0x0000, 'testTag', '%{public}s', `${tag}, uiAbility09OnForeground02: ${uiAbility09OnForeground02}`);
            };

            if (data.event === 'UiAbility09_onBackground_01') {
              uiAbility09OnBackground01 = 'uiAbility09OnBackground01Success';
              hilog.info(0x0000, 'testTag', '%{public}s', `${tag}, uiAbility09OnBackground01: ${uiAbility09OnBackground01}`);
            };

            if (data.event === 'UiAbility09_onBackground_02') {
              uiAbility09OnBackground02 = 'uiAbility09OnBackground02Success';
              hilog.info(0x0000, 'testTag', '%{public}s', `${tag}, uiAbility09OnBackground02: ${uiAbility09OnBackground02}`);
            };
            if (data.event === 'UiAbility09_onForeground_01') {
              uiAbility09OnForeground01 = 'uiAbility09OnForeground01Success';
              hilog.info(0x0000, 'testTag', '%{public}s', `${tag}, uiAbility09OnForeground01: ${uiAbility09OnForeground01}`);
              globalThis.uiAbilityContext9.terminateSelf();
            }
            if (data.event === 'UiAbility09_onDestroy_01') {
              uiAbility09OnDestroy01 = 'uiAbility09OnDestroy01Success';
              hilog.info(0x0000, 'testTag', '%{public}s', `${tag}, uiAbility09OnDestroy01: ${uiAbility09OnDestroy01}`);
              setTimeout(() => {
                try {
                  context.startAbility(
                    {
                      bundleName: 'com.test.actsstartandterminatetest',
                      abilityName: 'UiAbility09',
                      parameters: {
                        isFirstStart:false
                      }
                    }).then(() => {
                    hilog.info(0x0000, 'testTag', '%{public}s', `${tag} second startAbility end====>`);
                  })
                } catch (err) {
                  hilog.info(0x0000, 'testTag', '%{public}s', `${tag} open fail : ${err}`);
                }
              }, 500);
            }
            if (data.event === 'ACTS_TEST_DESTROY') {
              await globalThis.uiAbilityContext9.terminateSelf();
              setTimeout(() => {
                commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
              }, 500);
            }
          }
          commonEventManager.subscribe(subscriber, subscribeCallBack);
          setTimeout(() => {
            commonEventManager.publish('ACTS_TEST_START01', publishCB);
          }, 100)
        })
    });


    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_5100
     * @tc.number SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_5100
     * @tc.desc   Carry one key-value pair, where the key, and the value is a JSON object;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_5100', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_5100`;
      hilog.info(0x0000, 'testTag', '%{public}s', `${tag}, it begin`);
      let uiAbility10OnCreate: string = 'uiAbility10OnCreateFail';
      let uiAbility10OnWindowStageCreate: string = 'uiAbility10OnWindowStageCreateFail';
      let uiAbility10OnForeground: string = 'uiAbility10OnForegroundFail';
      commonEventManager.createSubscriber(ACTS_EVENT)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          let unSubscribeCallback = () => {
            setTimeout(async () => {
              hilog.info(0x0000, 'testTag', '%{public}s', `====>${tag} unSubscribeCallback`);
              expect(uiAbility10OnCreate).assertEqual('uiAbility10OnCreateSuccess');
              expect(uiAbility10OnWindowStageCreate).assertEqual('uiAbility10OnWindowStageCreateSuccess');
              expect(uiAbility10OnForeground).assertEqual('uiAbility10OnForegroundSuccess');
              hilog.info(0x0000, 'testTag', '%{public}s', `${tag}, it end`);
              done();
            }, 1000);
          }
          let subscribeCallBack = (err: BusinessError, data: commonEventManager.CommonEventData) => {
            hilog.info(0x0000, 'testTag', '%{public}s', `subscribeCallBack success`)
            if (data.event === 'UiAbility10_onCreate') {
              uiAbility10OnCreate = 'uiAbility10OnCreateSuccess';
            };

            if (data.event === 'UiAbility10_onWindowStageCreate') {
              uiAbility10OnWindowStageCreate = 'uiAbility10OnWindowStageCreateSuccess';
            };

            if (data.event === 'UiAbility10_onForeground') {
              uiAbility10OnForeground = 'uiAbility10OnForegroundSuccess';
            };
            if (data.event === 'ACTS_TEST_START01') {
              setTimeout(() => {
                try {
                  context.startAbility(
                    {
                      bundleName: 'com.test.actsstartandterminatetest',
                      abilityName: 'UiAbility10',
                      parameters: {
                        'ability.want.params.INTENT': {
                          'number': '123'
                        }
                      }
                    }).then(() => {
                    hilog.info(0x0000, 'testTag', '%{public}s', `${tag} startAbility end====>`);
                  })
                } catch (err) {
                  hilog.info(0x0000, 'testTag', '%{public}s', `${tag} open fail : ${err}`);
                }
              }, 500);
            }
            if (data.event === 'ACTS_TEST_DESTROY') {
              setTimeout(() => {
                globalThis.uiAbilityContext10.terminateSelf();
                commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
              }, 500);
            }
          }
          commonEventManager.subscribe(subscriber, subscribeCallBack);
          setTimeout(() => {
            commonEventManager.publish('ACTS_TEST_START01', publishCB);
          }, 100)
        })
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_5400
     * @tc.number SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_5400
     * @tc.desc   The ability with corresponding entities (custom, array length > 1) starts successfully.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_5400', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_5400`;
      hilog.info(0x0000, 'testTag', '%{public}s', `${tag}, it begin`);
      let uiAbility10OnCreate: string = 'uiAbility10OnCreateFail';
      let uiAbility10OnWindowStageCreate: string = 'uiAbility10OnWindowStageCreateFail';
      let uiAbility10OnForeground: string = 'uiAbility10OnForegroundFail';
      commonEventManager.createSubscriber(ACTS_EVENT)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          let unSubscribeCallback = () => {
            setTimeout(async () => {
              hilog.info(0x0000, 'testTag', '%{public}s', `====>${tag} unSubscribeCallback`);
              expect(uiAbility10OnCreate).assertEqual('uiAbility10OnCreateSuccess');
              expect(uiAbility10OnWindowStageCreate).assertEqual('uiAbility10OnWindowStageCreateSuccess');
              expect(uiAbility10OnForeground).assertEqual('uiAbility10OnForegroundSuccess');
              hilog.info(0x0000, 'testTag', '%{public}s', `${tag}, it end`);
              done();
            }, 1000);
          }
          let subscribeCallBack = (err: BusinessError, data: commonEventManager.CommonEventData) => {
            hilog.info(0x0000, 'testTag', '%{public}s', `subscribeCallBack success`)
            if (data.event === 'UiAbility10_onCreate') {
              uiAbility10OnCreate = 'uiAbility10OnCreateSuccess';
            };

            if (data.event === 'UiAbility10_onWindowStageCreate') {
              uiAbility10OnWindowStageCreate = 'uiAbility10OnWindowStageCreateSuccess';
            };

            if (data.event === 'UiAbility10_onForeground') {
              uiAbility10OnForeground = 'uiAbility10OnForegroundSuccess';
            };
            if (data.event === 'ACTS_TEST_START01') {
              setTimeout(() => {
                try {
                  context.startAbility(
                    {
                      action:"SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_5400",
                      entities: ["entity.system.home"],
                    }).then(() => {
                    hilog.info(0x0000, 'testTag', '%{public}s', `${tag} startAbility end====>`);
                  })
                } catch (err) {
                  hilog.info(0x0000, 'testTag', '%{public}s', `${tag} open fail : ${err}`);
                }
              }, 500);
            }
            if (data.event === 'ACTS_TEST_DESTROY') {
              globalThis.uiAbilityContext10.terminateSelf();
              setTimeout(() => {
                commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
              }, 500);
            }
          }
          commonEventManager.subscribe(subscriber, subscribeCallBack);
          setTimeout(() => {
            commonEventManager.publish('ACTS_TEST_START01', publishCB);
          }, 100)
        })
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_3800
     * @tc.number SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_3800
     * @tc.desc   FVerify system service startup of the ability;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_3800', Level.LEVEL0, (done: Function) => {
      let tag = `SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_3800`;
      hilog.info(0x0000, 'testTag', '%{public}s', `${tag}, it begin`);
      let uiAbility10OnCreate: string = 'uiAbility10OnCreateFail';
      let uiAbility10OnWindowStageCreate: string = 'uiAbility10OnWindowStageCreateFail';
      let uiAbility10OnForeground: string = 'uiAbility10OnForegroundFail';
      let res: string = ""
      commonEventManager.createSubscriber(ACTS_EVENT)
        .then((commonEventSubscriber: commonEventManager.CommonEventSubscriber) => {
          subscriber = commonEventSubscriber;
          let unSubscribeCallback = () => {
            setTimeout(async () => {
              hilog.info(0x0000, 'testTag', '%{public}s', `====>${tag} unSubscribeCallback`);
              expect(uiAbility10OnCreate).assertEqual('uiAbility10OnCreateSuccess');
              expect(uiAbility10OnWindowStageCreate).assertEqual('uiAbility10OnWindowStageCreateSuccess');
              expect(uiAbility10OnForeground).assertEqual('uiAbility10OnForegroundSuccess');
              hilog.info(0x0000, 'testTag', '%{public}s', `${tag}, it end`);
              done();
            }, 1000);
          }
          let subscribeCallBack = (err: BusinessError, data: commonEventManager.CommonEventData) => {
            hilog.info(0x0000, 'testTag', '%{public}s', `subscribeCallBack success`)
            if (data.event === 'UiAbility10_onCreate') {
              uiAbility10OnCreate = 'uiAbility10OnCreateSuccess';
            };

            if (data.event === 'UiAbility10_onWindowStageCreate') {
              uiAbility10OnWindowStageCreate = 'uiAbility10OnWindowStageCreateSuccess';
            };

            if (data.event === 'UiAbility10_onForeground') {
              uiAbility10OnForeground = 'uiAbility10OnForegroundSuccess';
            };
            if (data.event === 'ACTS_TEST_START01') {
              setTimeout(async () => {
                await abilityDelegator.executeShellCommand('aa start -a UiAbility10 -b com.test.actsstartandterminatetest')
                  .then(data => {
                    hilog.info(0x0000, 'testTag', '%{public}s',
                      'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_3800 data is: ' + JSON.stringify(data));
                  })
                  .catch((err: BusinessError) => {
                    hilog.info(0x0000, 'testTag', '%{public}s',
                      'SUB_Ability_AbilityRuntime_StartAndTerminate_StartAbility_3800 err is: ' + JSON.stringify(err));
                  });
              }, 500);
            }
            if (data.event === 'ACTS_TEST_DESTROY') {
              globalThis.uiAbilityContext10.terminateSelf();
              setTimeout(() => {
                commonEventManager.unsubscribe(subscriber, unSubscribeCallback);
              }, 500);
            }
          }
          commonEventManager.subscribe(subscriber, subscribeCallBack);
          setTimeout(() => {
            commonEventManager.publish('ACTS_TEST_START01', publishCB);
          }, 100)
        })
    });
  })
}


