/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, it, expect } from '@ohos/hypium';
import commonEvent from '@ohos.commonEvent';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import commonEventManager from '@ohos.commonEventManager';
import { BusinessError } from '@ohos.base';

let subscriberInfo_MainAbility: commonEventManager.CommonEventSubscribeInfo = {
  events: ["ACTS_DoAbility_Event"]
};
let mainability: UIAbility;
const START_ABILITY_TIMEOUT = 10000;
const START_ABILITY_TIMEOUT_TWO_THOUSAND = 2000;
const START_ABILITY_TIMEOUT_THOUSAND = 1000;

function sleep(ms: number) {
  return new Promise<number>(resolve => setTimeout(resolve, ms));
}

export default function abilityTest() {
  describe('ActsChangeAbilityStagetest', () => {
    beforeAll(async (done: Function) => {
      console.info('beforeAll called');
      let delay = 3000;
      let start = new Date().getTime();
      while (true) {
        if (AppStorage.get<boolean>("onWindowStageActive")!) {
          console.log(`ActsApiTest getWindwoStageActive is success`);
          break;
        }
        if (new Date().getTime() - start > delay) {
          console.log(`ActsApiTest getWindwoStageActive is failed`);
          break;
        }
      }
      await AppStorage.get<abilityDelegatorRegistry.AbilityDelegator>("abilitydelegator")!.getCurrentTopAbility()
        .then((data) => {
          mainability = data;
          done();
        })
    })
    console.log("====>in describe====>");

    /*
     * @tc.number  : ACTS_DoAbilityForeground_0100
     * @tc.name    : change abilitystage to foreground
     * @tc.desc    : Use doAbilityForeground to change the abilitystage to foreground.(callback)
     */
    it('ACTS_DoAbilityForeground_0100', 0, async (done: Function) => {
      console.log("====>in ACTS_DoAbilityForeground_0100====>");
      let Subscriber: commonEventManager.CommonEventSubscriber;
      let flag = true;
      let ability: UIAbility;
      commonEvent.createSubscriber(subscriberInfo_MainAbility)
        .then((data) => {
          console.log("ACTS_DoAbilityForeground_0100 ====>Create Subscriber====>");
          data.getSubscribeInfo()
            .then((SubscribeInfo) => {
              console.log("ACTS_DoAbilityForeground_0100 ====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
              Subscriber = data;
              commonEvent.subscribe(Subscriber, (err, data) => {
                expect(data.event == "ACTS_DoAbility_Event").assertTrue();
                console.log("ACTS_DoAbilityForeground_0100 ====>0100 Subscribe CallBack data:====>" + JSON.stringify(data));
                AppStorage.get<abilityDelegatorRegistry.AbilityDelegator>("abilitydelegator")!.doAbilityForeground(ability, (err) => {
                  console.log("====>ACTS_DoAbilityForeground_0100 data:====>" + JSON.stringify(err));
                  setTimeout(() => {
                    let num = AppStorage.get<abilityDelegatorRegistry.AbilityDelegator>("abilitydelegator")!.getAbilityState(ability);
                    console.log("====>ACTS_DoAbilityForeground_0100 getAbilityState:====>" + JSON.stringify(num));
                    expect(num).assertEqual(2);
                    commonEvent.unsubscribe(Subscriber, () => {
                      console.log("====>UnSubscribeCallback====>");
                      flag = false;
                      setTimeout(() => {
                        done();
                      }, START_ABILITY_TIMEOUT_TWO_THOUSAND)
                    });
                  }, START_ABILITY_TIMEOUT_THOUSAND)
                })
              });
              AppStorage.get<abilityDelegatorRegistry.AbilityDelegator>("abilitydelegator")!.getCurrentTopAbility()
                .then((data) => {
                  ability = data;
                  console.log("===>SubscribeInfo is====>" + JSON.stringify(ability));
                  console.log("====>start startAbility====>");
                  AppStorage.get<abilityDelegatorRegistry.AbilityDelegator>("abilitydelegator")!.startAbility(
                    {
                      bundleName: 'com.example.testapi',
                      abilityName: 'MainAbility2'
                    })
                    .then(() => {
                      console.log("====>startAbility end====>");
                    })
                })
            })
        })


      setTimeout(() => {
        if (flag == true) {
          try {
            expect().assertFail();
          } catch (error) {
            console.log(`ACTS_DoAbilityForeground_0100 startRunning failed: ${JSON.stringify(error)}`);
            done();
          }
          console.log('ACTS_DoAbilityForeground_0100 - timeout');
          commonEvent.unsubscribe(Subscriber, () => {
            console.log("====>UnSubscribeCallback====>");
            flag = false;
            setTimeout(() => {
              done();
            }, START_ABILITY_TIMEOUT_TWO_THOUSAND)
          });
        }
      }, START_ABILITY_TIMEOUT);
    })

    /*
     * @tc.number  : ACTS_DoAbilityForeground_0200
     * @tc.name    : change abilitystage to foreground
     * @tc.desc    : Use doAbilityForeground to change the abilitystage to foreground.(callback)
     */
    it('ACTS_DoAbilityForeground_0200', 0, async (done: Function) => {
      let ability: UIAbility;
      AppStorage.get<abilityDelegatorRegistry.AbilityDelegator>("abilitydelegator")!.getCurrentTopAbility()
        .then((data) => {
          ability = data;
          expect(JSON.stringify(data) == JSON.stringify(mainability)).assertTrue();
          console.log("====>getCurrentTopAbility ability data:====>" + JSON.stringify(ability));
          AppStorage.get<abilityDelegatorRegistry.AbilityDelegator>("abilitydelegator")!.doAbilityForeground(ability, (err) => {
            console.log("====>ACTS_DoAbilityForeground_0200 data:====>" + JSON.stringify(err));
            setTimeout(() => {
              let num = AppStorage.get<abilityDelegatorRegistry.AbilityDelegator>("abilitydelegator")!.getAbilityState(ability);
              console.log("====>ACTS_DoAbilityForeground_0200 getAbilityState:====>" + JSON.stringify(num));
              expect(num).assertEqual(2);
            }, START_ABILITY_TIMEOUT_THOUSAND)
            setTimeout(() => {
              done();
            }, START_ABILITY_TIMEOUT_TWO_THOUSAND)
          })
        })
    })

    /*
     * @tc.number  : ACTS_DoAbilityForeground_0400
     * @tc.name    : change abilitystage to foreground
     * @tc.desc    : Use doAbilityForeground to change the abilitystage to foreground.(promise)
     */
    it('ACTS_DoAbilityForeground_0400', 0, async (done: Function) => {
      let Subscriber: commonEventManager.CommonEventSubscriber;
      let flag = true;
      let ability: UIAbility;

      commonEvent.createSubscriber(subscriberInfo_MainAbility).then((data) => {
        console.log("====>Create Subscriber====>");
        data.getSubscribeInfo().then((SubscribeInfo) => {
          console.log("====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
          Subscriber = data;
          commonEvent.subscribe(Subscriber, (err, data) => {
            expect(data.event == "ACTS_DoAbility_Event").assertTrue();
            console.log("====>0400 Subscribe CallBack data:====>" + JSON.stringify(data));
            AppStorage.get<abilityDelegatorRegistry.AbilityDelegator>("abilitydelegator")!.doAbilityForeground(ability)
              .then(() => {
                console.log("====>ACTS_DoAbilityForeground_0400 data:====>");
                expect(true).assertTrue();
                setTimeout(() => {
                  let num = AppStorage.get<abilityDelegatorRegistry.AbilityDelegator>("abilitydelegator")!.getAbilityState(ability);
                  console.log("====>ACTS_DoAbilityForeground_0400 getAbilityState:====>" + JSON.stringify(num));
                  expect(num).assertEqual(2);
                }, START_ABILITY_TIMEOUT_THOUSAND)
                commonEvent.unsubscribe(Subscriber, () => {
                  console.log("====>UnSubscribeCallback====>");
                  flag = false;
                  setTimeout(() => {
                    done();
                  }, START_ABILITY_TIMEOUT_TWO_THOUSAND)
                });
              })
          });
          AppStorage.get<abilityDelegatorRegistry.AbilityDelegator>("abilitydelegator")!.getCurrentTopAbility()
            .then((data) => {
              ability = data
              console.log("====>ability data:====>" + JSON.stringify(ability));
              console.log("====>start startAbility====>");
              AppStorage.get<abilityDelegatorRegistry.AbilityDelegator>("abilitydelegator")!.startAbility(
                {
                  bundleName: 'com.example.testapi',
                  abilityName: 'MainAbility2'
                }).then(() => {
                console.log("====>startAbility end====>");
              })
            })
        })
      })
      setTimeout(() => {
        if (flag == true) {
          expect().assertFail();
          console.log('ACTS_DoAbilityForeground_0400 - timeout');
          commonEvent.unsubscribe(Subscriber, () => {
            console.log("====>UnSubscribeCallback====>");
            flag = false;
            setTimeout(() => {
              done();
            }, START_ABILITY_TIMEOUT_TWO_THOUSAND)
          });
        }
      }, START_ABILITY_TIMEOUT);
    })

    /*
     * @tc.number  : ACTS_DoAbilityForeground_0500
     * @tc.name    : change abilitystage to foreground
     * @tc.desc    : Use doAbilityForeground to change the abilitystage to foreground.(promise)
     */
    it('ACTS_DoAbilityForeground_0500', 0, async (done: Function) => {
      let ability: UIAbility;
      setTimeout(() => {
        AppStorage.get<abilityDelegatorRegistry.AbilityDelegator>("abilitydelegator")!.getCurrentTopAbility()
          .then((data) => {
            ability = data;
            console.log("====>getCurrentTopAbility  data:====>" + JSON.stringify(data));
            console.log("====>getCurrentTopAbility  mainability:====>" + JSON.stringify(mainability));
            expect(JSON.stringify(data) == JSON.stringify(mainability)).assertTrue();
            console.log("====>getCurrentTopAbility ability data:====>" + JSON.stringify(ability));
            AppStorage.get<abilityDelegatorRegistry.AbilityDelegator>("abilitydelegator")!.doAbilityForeground(ability)
              .then(() => {
                console.log("====>ACTS_DoAbilityForeground_0500 data:====>");
                expect(true).assertTrue();
                setTimeout(() => {
                  let num = AppStorage.get<abilityDelegatorRegistry.AbilityDelegator>("abilitydelegator")!.getAbilityState(ability);
                  console.log("====>ACTS_DoAbilityForeground_0500 getAbilityState:====>" + JSON.stringify(num));
                  expect(num).assertEqual(2);
                }, START_ABILITY_TIMEOUT_THOUSAND)
                setTimeout(() => {
                  done();
                }, START_ABILITY_TIMEOUT_TWO_THOUSAND)
              })
          })
      }, 2000)
    })

    /*
     * @tc.number  : ACTS_DoAbilityBackground_0100
     * @tc.name    : change abilitystage to background
     * @tc.desc    : Use doAbilityBackground to change the abilitystage to background.(callback)
     */
    it('ACTS_DoAbilityBackground_0100', 0, async (done: Function) => {
      let Subscriber: commonEventManager.CommonEventSubscriber;
      let flag = true;

      commonEvent.createSubscriber(subscriberInfo_MainAbility)
        .then((data) => {
          console.log("====>Create Subscriber====>");
          data.getSubscribeInfo()
            .then((SubscribeInfo) => {
              console.log("====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
              Subscriber = data;
              commonEvent.subscribe(Subscriber, (err, data) => {
                expect(data.event == "ACTS_DoAbility_Event").assertTrue();
                console.log("====>0100 Subscribe CallBack data:====>" + JSON.stringify(data));
                AppStorage.get<abilityDelegatorRegistry.AbilityDelegator>("abilitydelegator")!.getCurrentTopAbility()
                  .then((ability) => {
                    console.log("====>getCurrentTopAbility ability data:====>" + JSON.stringify(ability));
                    AppStorage.get<abilityDelegatorRegistry.AbilityDelegator>("abilitydelegator")!.doAbilityBackground(ability, (err) => {
                      console.log("====>ACTS_DoAbilityBackground_0100 data:====>");
                      setTimeout(() => {
                        let num = AppStorage.get<abilityDelegatorRegistry.AbilityDelegator>("abilitydelegator")!.getAbilityState(ability);
                        console.log("====>ACTS_DoAbilityBackground_0100 getAbilityState:====>" + JSON.stringify(num));
                        expect(num).assertEqual(3);
                      }, START_ABILITY_TIMEOUT_THOUSAND)
                      commonEvent.unsubscribe(Subscriber, () => {
                        console.log("====>UnSubscribeCallback====>");
                        flag = false;
                        setTimeout(() => {
                          done();
                        }, 5000)
                      });
                    })
                  })
              });
              console.log("====>start startAbility====>");
              AppStorage.get<abilityDelegatorRegistry.AbilityDelegator>("abilitydelegator")!.getCurrentTopAbility()
                .then((data) => {
                  console.log("====>getCurrentTopAbility ability data:====>" + JSON.stringify(data));
                  AppStorage.get<abilityDelegatorRegistry.AbilityDelegator>("abilitydelegator")!.startAbility(
                    {
                      bundleName: 'com.example.testapi',
                      abilityName: 'MainAbility2'
                    }).then(() => {
                    console.log("====>startAbility end====>");
                  })
                })
            })
        })

      setTimeout(() => {
        if (flag == true) {
          expect().assertFail();
          console.log('ACTS_DoAbilityBackground_0100 - timeout');
          commonEvent.unsubscribe(Subscriber, () => {
            console.log("====>UnSubscribeCallback====>");
            flag = false;
            setTimeout(() => {
              done();
            }, 5000)
          });
        }
      }, START_ABILITY_TIMEOUT);
    })

    /*
     * @tc.number  : ACTS_DoAbilityBackground_0500
     * @tc.name    : change abilitystage to background
     * @tc.desc    : Use doAbilityBackground to change the abilitystage to background.(promise)
     */
    it('ACTS_DoAbilityBackground_0500', 0, async (done: Function) => {
      let Subscriber: commonEventManager.CommonEventSubscriber;
      let flag = true;

      commonEvent.createSubscriber(subscriberInfo_MainAbility)
        .then((data) => {
          console.log("====>Create Subscriber====>");
          data.getSubscribeInfo()
            .then((SubscribeInfo) => {
              console.log("====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
              Subscriber = data;
              commonEvent.subscribe(Subscriber, (err, data) => {
                expect(data.event == "ACTS_DoAbility_Event").assertTrue();
                console.log("====>0500 Subscribe CallBack data:====>" + JSON.stringify(data));
                AppStorage.get<abilityDelegatorRegistry.AbilityDelegator>("abilitydelegator")!.getCurrentTopAbility()
                  .then((ability2) => {
                    console.log("====>getCurrentTopAbility ability2 data:====>" + JSON.stringify(ability2));
                    AppStorage.get<abilityDelegatorRegistry.AbilityDelegator>("abilitydelegator")!.doAbilityBackground(ability2)
                      .then(() => {
                        console.log("====>ACTS_DoAbilityBackground_0500 data:====>");
                        expect(true).assertTrue();
                        setTimeout(() => {
                          let num = AppStorage.get<abilityDelegatorRegistry.AbilityDelegator>("abilitydelegator")!.getAbilityState(ability2);
                          console.log("====>ACTS_DoAbilityBackground_0500 getAbilityState:====>" + JSON.stringify(num));
                          expect(num).assertEqual(3);
                        }, START_ABILITY_TIMEOUT_THOUSAND)
                        commonEvent.unsubscribe(Subscriber, () => {
                          console.log("====>UnSubscribeCallback====>");
                          flag = false;
                          setTimeout(() => {
                            done();
                          }, START_ABILITY_TIMEOUT_TWO_THOUSAND)
                        });
                      })
                  })
              });
              console.log("====>start startAbility====>");
              AppStorage.get<abilityDelegatorRegistry.AbilityDelegator>("abilitydelegator")!.startAbility(
                {
                  bundleName: 'com.example.testapi',
                  abilityName: 'MainAbility2'
                })
                .then(() => {
                  console.log("====>startAbility end====>");
                })
            })
        })

      setTimeout(() => {
        if (flag == true) {
          expect().assertFail();
          console.log('ACTS_DoAbilityBackground_0500 - timeout');
          commonEvent.unsubscribe(Subscriber, () => {
            console.log("====>UnSubscribeCallback====>");
            flag = false;
            setTimeout(() => {
              done();
            }, START_ABILITY_TIMEOUT_TWO_THOUSAND)
          });
        }
      }, START_ABILITY_TIMEOUT);
    })

    /*
     * @tc.number  : ACTS_DoAbilityBackground_0700
     * @tc.name    : change abilitystage to background
     * @tc.desc    : Use doAbilityBackground to change the abilitystage to background.(promise)
     */
    it('ACTS_DoAbilityBackground_0700', 0, async (done: Function) => {
      let Subscriber: commonEventManager.CommonEventSubscriber;
      let flag = true;
      let num1 = 0;
      let num2 = 0;

      commonEvent.createSubscriber(subscriberInfo_MainAbility)
        .then((data) => {
          console.log("====>Create Subscriber====>");
          data.getSubscribeInfo()
            .then((SubscribeInfo) => {
              console.log("====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
              Subscriber = data;
              commonEvent.subscribe(Subscriber, (err, data) => {
                expect(data.event == "ACTS_DoAbility_Event").assertTrue();
                console.log("====>0700 Subscribe CallBack data:====>" + JSON.stringify(data));
                AppStorage.get<abilityDelegatorRegistry.AbilityDelegator>("abilitydelegator")!.getCurrentTopAbility()
                  .then((ability2) => {
                    console.log("====>getCurrentTopAbility ability2 data:====>" + JSON.stringify(ability2));
                    console.log("====>0700newabilityname:====>" + JSON.stringify(ability2.context.abilityInfo.name));
                    AppStorage.get<abilityDelegatorRegistry.AbilityDelegator>("abilitydelegator")!.doAbilityBackground(ability2)
                      .then(() => {
                        console.log("====>doAbilityBackground data1:====>");
                        expect(true).assertTrue();
                        setTimeout(() => {
                          num1 = AppStorage.get<abilityDelegatorRegistry.AbilityDelegator>("abilitydelegator")!.getAbilityState(ability2);
                          console.log("====>ACTS_DoAbilityBackground_0700 getAbilityState1:====>" + " " + JSON.stringify(num1));
                          expect(num1).assertEqual(3);
                          AppStorage.get<abilityDelegatorRegistry.AbilityDelegator>("abilitydelegator")!.doAbilityForeground(ability2, (err) => {
                            console.log("====>doAbilityForeground data:====>" + JSON.stringify(err));
                            setTimeout(() => {
                              num2 = AppStorage.get<abilityDelegatorRegistry.AbilityDelegator>("abilitydelegator")!.getAbilityState(ability2);
                              console.log("====>ACTS_DoAbilityBackground_0700 getAbilityState2:====>" + " " + JSON.stringify(num2));
                              expect(num2).assertEqual(2);
                              AppStorage.get<abilityDelegatorRegistry.AbilityDelegator>("abilitydelegator")!.doAbilityBackground(ability2)
                                .then(() => {
                                  console.log("====>doAbilityBackground data1:====>");
                                  expect(true).assertTrue();
                                  setTimeout(() => {
                                    num1 = AppStorage.get<abilityDelegatorRegistry.AbilityDelegator>("abilitydelegator")!.getAbilityState(ability2);
                                    console.log("====>ACTS_DoAbilityBackground_0700 getAbilityState1:====>" + " " + JSON.stringify(num1));
                                    expect(num1).assertEqual(3);
                                    AppStorage.get<abilityDelegatorRegistry.AbilityDelegator>("abilitydelegator")!.doAbilityForeground(ability2, (err) => {
                                      console.log("====>doAbilityForeground data:====>");
                                      setTimeout(() => {
                                        num2 = AppStorage.get<abilityDelegatorRegistry.AbilityDelegator>("abilitydelegator")!.getAbilityState(ability2);
                                        console.log("====>ACTS_DoAbilityBackground_0700 getAbilityState2:====>" + " " + JSON.stringify(num2));
                                        expect(num2).assertEqual(2);
                                        commonEvent.unsubscribe(Subscriber, () => {
                                          console.log("====>ACTS_DoAbilityBackground_0700 UnSubscribeCallback====>");
                                          flag = false;
                                          setTimeout(() => {
                                            done();
                                          }, START_ABILITY_TIMEOUT_TWO_THOUSAND)
                                        });
                                      }, START_ABILITY_TIMEOUT_THOUSAND)
                                    })
                                  }, START_ABILITY_TIMEOUT_THOUSAND)
                                })
                            }, START_ABILITY_TIMEOUT_THOUSAND)
                          })
                        }, START_ABILITY_TIMEOUT_THOUSAND)
                      })
                  })
              });
              console.log("====>start startAbility====>");
              AppStorage.get<abilityDelegatorRegistry.AbilityDelegator>("abilitydelegator")!.startAbility(
                {
                  bundleName: 'com.example.testapi',
                  abilityName: 'MainAbility4'
                }).then(() => {
                console.log("====>startAbility end====>");
              })
            })
        })

      setTimeout(() => {
        if (flag == true) {
          expect().assertFail();
          console.log('ACTS_DoAbilityBackground_0700 - timeout');
          commonEvent.unsubscribe(Subscriber, () => {
            console.log("====>ACTS_DoAbilityBackground_0700 UnSubscribeCallback====>");
            flag = false;
            setTimeout(() => {
              done();
            }, START_ABILITY_TIMEOUT_TWO_THOUSAND)
          });
        }
      }, 10000);
    })

    /*
     * @tc.number  : ACTS_DoAbilityBackground_0800
     * @tc.name    : change abilitystage to background
     * @tc.desc    : Use doAbilityBackground to change the abilitystage to background failed.(promise)
     */
    it('ACTS_DoAbilityBackground_0800', 0, async (done: Function) => {
      let Subscriber: commonEventManager.CommonEventSubscriber;
      let flag = true;
      let num1 = 0;
      let num2 = 0;

      commonEvent.createSubscriber(subscriberInfo_MainAbility)
        .then((data) => {
          console.log("====>Create Subscriber====>");
          data.getSubscribeInfo()
            .then((SubscribeInfo) => {
              console.log("====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
              Subscriber = data;
              commonEvent.subscribe(Subscriber, (err, data) => {
                expect(data.event == "ACTS_DoAbility_Event").assertTrue();
                console.log("====>0800 Subscribe CallBack data:====>" + JSON.stringify(data));
                AppStorage.get<abilityDelegatorRegistry.AbilityDelegator>("abilitydelegator")!.getCurrentTopAbility()
                  .then((ability2) => {
                    console.log("====>getCurrentTopAbility ability2 data:====>" + JSON.stringify(ability2));
                    console.log("====>0800newabilityname:====>" + JSON.stringify(ability2.context.abilityInfo.name));
                    AppStorage.get<abilityDelegatorRegistry.AbilityDelegator>("abilitydelegator")!.doAbilityBackground(ability2, (err) => {
                      console.log("====>doAbilityBackground data1:====>" + JSON.stringify(err));
                      setTimeout(() => {
                        num1 = AppStorage.get<abilityDelegatorRegistry.AbilityDelegator>("abilitydelegator")!.getAbilityState(ability2);
                        console.log("====>ACTS_DoAbilityBackground_0800 getAbilityState1:====>" + " " + JSON.stringify(num1));
                        expect(num1).assertEqual(3);
                        AppStorage.get<abilityDelegatorRegistry.AbilityDelegator>("abilitydelegator")!.doAbilityForeground(ability2)
                          .then(() => {
                            console.log("====>doAbilityForeground data:====>");
                            expect(true).assertTrue();
                            setTimeout(() => {
                              num2 = AppStorage.get<abilityDelegatorRegistry.AbilityDelegator>("abilitydelegator")!.getAbilityState(ability2);
                              console.log("====>ACTS_DoAbilityBackground_0800 getAbilityState2:====>" + " " + JSON.stringify(num2));
                              expect(num2).assertEqual(2);
                              AppStorage.get<abilityDelegatorRegistry.AbilityDelegator>("abilitydelegator")!.doAbilityBackground(ability2, (err) => {
                                console.log("====>doAbilityBackground data1:====>" + JSON.stringify(err));
                                setTimeout(() => {
                                  num1 = AppStorage.get<abilityDelegatorRegistry.AbilityDelegator>("abilitydelegator")!.getAbilityState(ability2);
                                  console.log("====>ACTS_DoAbilityBackground_0800 getAbilityState1:====>" + " " + JSON.stringify(num1));
                                  expect(num1).assertEqual(3);
                                  AppStorage.get<abilityDelegatorRegistry.AbilityDelegator>("abilitydelegator")!.doAbilityForeground(ability2)
                                    .then(() => {
                                      console.log("====>doAbilityForeground data:====>");
                                      expect(true).assertTrue();
                                      setTimeout(() => {
                                        num2 = AppStorage.get<abilityDelegatorRegistry.AbilityDelegator>("abilitydelegator")!.getAbilityState(ability2);
                                        console.log("====>ACTS_DoAbilityBackground_0800 getAbilityState2:====>" + " " + JSON.stringify(num2));
                                        expect(num2).assertEqual(2);
                                        commonEvent.unsubscribe(Subscriber, () => {
                                          console.log("====>ACTS_DoAbilityBackground_0800 UnSubscribeCallback====>");
                                          flag = false;
                                          setTimeout(() => {
                                            done();
                                          }, START_ABILITY_TIMEOUT_TWO_THOUSAND)
                                        });
                                      }, START_ABILITY_TIMEOUT_THOUSAND)
                                    })
                                }, START_ABILITY_TIMEOUT_THOUSAND)
                              })
                            }, START_ABILITY_TIMEOUT_THOUSAND)
                          })
                      }, START_ABILITY_TIMEOUT_THOUSAND)
                    })
                  })
              });
              console.log("====>start startAbility====>");
              AppStorage.get<abilityDelegatorRegistry.AbilityDelegator>("abilitydelegator")!.startAbility(
                {
                  bundleName: 'com.example.testapi',
                  abilityName: 'MainAbility5'
                })
                .then(() => {
                  console.log("====>startAbility end====>");
                })
            })
        })
      setTimeout(() => {
        if (flag == true) {
          expect().assertFail();
          console.log('ACTS_DoAbilityBackground_0800 - timeout');
          commonEvent.unsubscribe(Subscriber, () => {
            console.log("====>ACTS_DoAbilityBackground_0800 UnSubscribeCallback====>");
            flag = false;
            setTimeout(() => {
              done();
            }, START_ABILITY_TIMEOUT_TWO_THOUSAND)
          });
        }
      }, 10000);
    })

    /*
   * @tc.number  : ACTS_DoAbilityForeground_0300
   * @tc.name    : change abilitystage to foreground
   * @tc.desc    : Use doAbilityForeground to change the abilitystage to foreground failed.(callback)
   */
    it('ACTS_DoAbilityForeground_0300', 0, async (done: Function) => {
      let Subscriber: commonEventManager.CommonEventSubscriber;
      let flag = true;
      commonEvent.createSubscriber(subscriberInfo_MainAbility)
        .then((data) => {
          console.log("====> ACTS_DoAbilityForeground_0300 Create Subscriber====>");
          data.getSubscribeInfo()
            .then((SubscribeInfo) => {
              console.log("====> ACTS_DoAbilityForeground_0300 SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
              Subscriber = data;
              commonEvent.subscribe(Subscriber, (err, data) => {
                expect(data.event == "ACTS_DoAbility_Event").assertTrue();
                console.log("====>ACTS_DoAbilityForeground_0300 Subscribe CallBack data:====>" + JSON.stringify(data));
                console.log("====>ACTS_DoAbilityForeground_0300 Subscribe CallBack globalThis.ability3:====>" + JSON.stringify(AppStorage.get<UIAbility>("ability3")!));
                console.log("====>ACTS_DoAbilityForeground_0300 ability3 name:====>" + JSON.stringify(AppStorage.get<UIAbility>("ability3")!.context.abilityInfo.name));
                setTimeout(() => {
                  try {
                    console.log("====>ACTS_DoAbilityForeground_0300 Subscribe timeout start:====>");
                    console.log("====>ACTS_DoAbilityForeground_0300 Subscribe timeout globalThis.ability3:====>" + JSON.stringify(AppStorage.get<UIAbility>("ability3")!));
                    AppStorage.get<abilityDelegatorRegistry.AbilityDelegator>("abilitydelegator")!.doAbilityForeground(AppStorage.get("ability3")!, (err: BusinessError) => {
                      console.log("====>ACTS_DoAbilityForeground_0300 doAbilityForeground successfully");
                    })
                    commonEvent.unsubscribe(Subscriber, () => {
                      console.log("====> ACTS_DoAbilityForeground_0300 UnSubscribeCallback====>");
                      flag = false;
                      setTimeout(() => {
                        done();
                      }, START_ABILITY_TIMEOUT_TWO_THOUSAND)
                    });
                    console.log("====>ACTS_DoAbilityForeground_0300 Subscribe timeout end:====>");
                  } catch (e) {
                    console.log("====>ACTS_DoAbilityForeground_0300 Subscribe timeout failed:====>" + JSON.stringify(e));
                    commonEvent.unsubscribe(Subscriber, () => {
                      console.log("====> ACTS_DoAbilityForeground_0300 UnSubscribeCallback====>");
                      flag = false;
                      setTimeout(() => {
                        done();
                      }, START_ABILITY_TIMEOUT_TWO_THOUSAND)
                    });
                  }
                }, START_ABILITY_TIMEOUT_THOUSAND)
              });
              console.log("====> ACTS_DoAbilityForeground_0300 start startAbility====>");
              AppStorage.get<abilityDelegatorRegistry.AbilityDelegator>("abilitydelegator")!.startAbility(
                {
                  bundleName: 'com.example.testapi',
                  abilityName: 'MainAbility3'
                })
                .then(() => {
                  console.log("====> ACTS_DoAbilityForeground_0300 startAbility end====>");
                })
            })
        })

      setTimeout(() => {
        if (flag == true) {
          expect().assertFail();
          console.log('======> ACTS_DoAbilityForeground_0300 - timeout');
          commonEvent.unsubscribe(Subscriber, () => {
            console.log("====> ACTS_DoAbilityForeground_0300 UnSubscribeCallback====>");
            flag = false;
            setTimeout(() => {
              done();
            }, START_ABILITY_TIMEOUT_TWO_THOUSAND)
          });
        }
      }, START_ABILITY_TIMEOUT);
    })

    /*
 * @tc.number  : ACTS_DoAbilityForeground_0600
 * @tc.name    : change abilitystage to foreground
 * @tc.desc    : Use doAbilityForeground to change the abilitystage to foreground failed.(promise)
 */
    it('ACTS_DoAbilityForeground_0600', 0, async (done: Function) => {
      let Subscriber: commonEventManager.CommonEventSubscriber;
      let flag = true;
      commonEvent.createSubscriber(subscriberInfo_MainAbility)
        .then((data) => {
          console.log("====>Create Subscriber====>");
          data.getSubscribeInfo()
            .then((SubscribeInfo) => {
              console.log("====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
              Subscriber = data;
              commonEvent.subscribe(Subscriber, (err, data) => {
                expect(data.event == "ACTS_DoAbility_Event").assertTrue();
                console.log("====>0600 Subscribe CallBack data:====>" + JSON.stringify(data));
                setTimeout(() => {
                  try {
                    AppStorage.get<abilityDelegatorRegistry.AbilityDelegator>("abilitydelegator")!.doAbilityForeground(AppStorage.get<UIAbility>("ability3")!);
                    console.log("====>ACTS_DoAbilityForeground_0600 doAbilityForeground successfully");
                  } catch (e) {
                    console.log("====>ACTS_DoAbilityForeground_0600 doAbilityForeground failed:" + JSON.stringify(e));
                    commonEvent.unsubscribe(Subscriber, () => {
                      console.log("====>UnSubscribeCallback====>");
                      flag = false;
                      setTimeout(() => {
                        done();
                      }, START_ABILITY_TIMEOUT_TWO_THOUSAND)
                    });
                  }
                }, START_ABILITY_TIMEOUT_THOUSAND)
              });
              console.log("====>start startAbility====>");
              AppStorage.get<abilityDelegatorRegistry.AbilityDelegator>("abilitydelegator")!.startAbility(
                {
                  bundleName: 'com.example.testapi',
                  abilityName: 'MainAbility3'
                })
                .then(() => {
                  console.log("====>startAbility end====>");
                })
            })
        })
      setTimeout(() => {
        if (flag == true) {
          expect().assertFail();
          console.log('ACTS_DoAbilityForeground_0600 - timeout');
          commonEvent.unsubscribe(Subscriber, () => {
            console.log("====>UnSubscribeCallback====>");
            flag = false;
            setTimeout(() => {
              done();
            }, START_ABILITY_TIMEOUT_TWO_THOUSAND)
          });
        }
      }, START_ABILITY_TIMEOUT);
    })

    /*
     * @tc.number  : ACTS_DoAbilityBackground_0300
     * @tc.name    : change abilitystage to background
     * @tc.desc    : Use doAbilityBackground to change the abilitystage to background failed.(callback)
     */
    it('ACTS_DoAbilityBackground_0300', 0, async (done: Function) => {
      let Subscriber: commonEventManager.CommonEventSubscriber;
      let flag = true;

      commonEvent.createSubscriber(subscriberInfo_MainAbility)
        .then((data) => {
          console.log("====>Create Subscriber====>");
          data.getSubscribeInfo().then((SubscribeInfo) => {
            console.log("====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
            Subscriber = data;
            commonEvent.subscribe(Subscriber, (err, data) => {
              expect(data.event == "ACTS_DoAbility_Event").assertTrue();
              console.log("====>0300 Subscribe CallBack data:====>" + JSON.stringify(data));
              setTimeout(() => {
                try {
                  AppStorage.get<abilityDelegatorRegistry.AbilityDelegator>("abilitydelegator")!.doAbilityBackground(AppStorage.get<UIAbility>("ability3")!, (err) => {
                    console.log("====>ACTS_DoAbilityBackground_0300 doAbilityBackground successfully");
                  })
                } catch (e) {
                  console.log("====>ACTS_DoAbilityBackground_0300 doAbilityBackground failed:" + JSON.stringify(e));
                  commonEvent.unsubscribe(Subscriber, () => {
                    console.log("====>UnSubscribeCallback====>");
                    flag = false;
                    setTimeout(() => {
                      done();
                    }, START_ABILITY_TIMEOUT_TWO_THOUSAND)
                  });
                }
              }, START_ABILITY_TIMEOUT_THOUSAND)
            });
            console.log("====>start startAbility====>");
            AppStorage.get<abilityDelegatorRegistry.AbilityDelegator>("abilitydelegator")!.startAbility(
              {
                bundleName: 'com.example.testapi',
                abilityName: 'MainAbility3'
              }).then(() => {
              console.log("====>startAbility end====>");
            })
          })
        })

      setTimeout(() => {
        if (flag == true) {
          expect().assertFail();
          console.log('ACTS_DoAbilityBackground_0300 - timeout');
          commonEvent.unsubscribe(Subscriber, () => {
            console.log("====>UnSubscribeCallback====>");
            flag = false;
            setTimeout(() => {
              done();
            }, START_ABILITY_TIMEOUT_TWO_THOUSAND)
          });
        }
      }, START_ABILITY_TIMEOUT);
    })

    /*
 * @tc.number  : ACTS_DoAbilityBackground_0600
 * @tc.name    : change abilitystage to background
 * @tc.desc    : Use doAbilityBackground to change the abilitystage to background failed.(promise)
 */
    it('ACTS_DoAbilityBackground_0600', 0, async (done: Function) => {
      let Subscriber: commonEventManager.CommonEventSubscriber;
      let flag = true;

      commonEvent.createSubscriber(subscriberInfo_MainAbility)
        .then((data) => {
          console.log("====>Create Subscriber====>");
          data.getSubscribeInfo()
            .then((SubscribeInfo) => {
              console.log("====>SubscribeInfo is====>" + JSON.stringify(SubscribeInfo));
              Subscriber = data;
              commonEvent.subscribe(Subscriber, (err, data) => {
                expect(data.event == "ACTS_DoAbility_Event").assertTrue();
                console.log("====>0600 Subscribe CallBack data:====>" + JSON.stringify(data));
                setTimeout(() => {
                  try {
                    AppStorage.get<abilityDelegatorRegistry.AbilityDelegator>("abilitydelegator")!.doAbilityBackground(AppStorage.get<UIAbility>("ability3")!);
                    console.log("====>ACTS_DoAbilityBackground_0600 doAbilityBackground successfully");
                  } catch (e) {
                    console.log("====>ACTS_DoAbilityBackground_0600 doAbilityBackground failed:" + JSON.stringify(e));
                    commonEvent.unsubscribe(Subscriber, () => {
                      console.log("====>UnSubscribeCallback====>");
                      flag = false;
                      setTimeout(() => {
                        done();
                      }, START_ABILITY_TIMEOUT_TWO_THOUSAND)
                    });
                  }
                }, START_ABILITY_TIMEOUT_THOUSAND)
              });
              console.log("====>start startAbility====>");
              AppStorage.get<abilityDelegatorRegistry.AbilityDelegator>("abilitydelegator")!.startAbility(
                {
                  bundleName: 'com.example.testapi',
                  abilityName: 'MainAbility3'
                })
                .then(() => {
                  console.log("====>startAbility end====>");
                })
            })
        })

      setTimeout(() => {
        if (flag == true) {
          expect().assertFail();
          console.log('ACTS_DoAbilityBackground_0600 - timeout');
          commonEvent.unsubscribe(Subscriber, () => {
            console.log("====>UnSubscribeCallback====>");
            flag = false;
            setTimeout(() => {
              done();
            }, START_ABILITY_TIMEOUT_TWO_THOUSAND)
          });
        }
      }, START_ABILITY_TIMEOUT);
    })
  })
}
