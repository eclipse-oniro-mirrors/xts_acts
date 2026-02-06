/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import Subscriber from '@ohos.commonEventManager';
import abilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry'
import abilityDelegatorRegistry2 from '@ohos.app.ability.abilityDelegatorRegistry'
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';

function sleep(time: number): Promise<void> {
  return new Promise((resolve) => setTimeout(resolve, time));
}

export default function abilityTest() {

  let delegator = abilityDelegatorRegistry.getAbilityDelegator();
  let monitor: abilityDelegatorRegistry2.AbilityMonitor | undefined;
  let monitor1: abilityDelegatorRegistry2.AbilityMonitor | undefined;
  let TAG = "";

  describe('ActsAbilityMonitor', () => {
    afterEach(async (done: Function) => {
      console.info(TAG + " afterEach each called");
      if (monitor) {
        console.info(TAG + " afterEach removeAbilityMonitor monitor");
        delegator.removeAbilityMonitor(monitor, () => {
          monitor = undefined;
        });
        await sleep(100);
      }
      if (monitor1) {
        console.info(TAG + " afterEach removeAbilityMonitor monitor1");
        delegator.removeAbilityMonitor(monitor1, () => {
          monitor1 = undefined;
        });
        await sleep(100);
      }
      if (globalThis.abilityContext) {
        console.info(TAG + " wait abiltiy terminateSelf");
        await sleep(2500);
        done();
      } else {
        done();
      }
    });

    /**
     * @tc.number: ACTS_AddAbilityMonitor_Callback_0100
     * @tc.name: Verify that the addAbilityMonitor interface functions normally.
     * @tc.desc: Use addAbilityMonitor to add a monitor then use startAbility to trigger onAbilityCreate (Callback).
     */
    it('ACTS_AddAbilityMonitor_Callback_0100', Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_AddAbilityMonitor_Callback_0100";
      console.log(TAG + " start");

      let onAbilityCreate = (ability: UIAbility) => {
        console.info(TAG + "====>ACTS_AddAbilityMonitor_0100 onAbilityCreate");
        expect(ability != null).assertTrue();
        done();
      }

      monitor = {
        abilityName: 'MainAbility2',
        onAbilityCreate: onAbilityCreate
      };
      console.info(TAG + "====>ACTS_AddAbilityMonitor_0100 start");
      delegator.addAbilityMonitor(monitor, (async (err) => {
        console.info(TAG + "====>ACTS_AddAbilityMonitor_0100 addAbilityMonitor err: " + err.code);
        delegator.startAbility(
          {
            bundleName: 'com.example.abilitymonitortest',
            abilityName: 'MainAbility2'
          }).then(async () => {
          console.info(TAG + "====>0100startAbility success");
        });
      }));
    })

    /**
     * @tc.number: ACTS_AddAbilityMonitor_Callback_0200
     * @tc.name: Verify that the addAbilityMonitor interface functions normally.
     * @tc.desc: Use addAbilityMonitor to add a monitor then use startAbility to
     * trigger onAbilityForeground (Callback).
     */
    it('ACTS_AddAbilityMonitor_Callback_0200', Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_AddAbilityMonitor_Callback_0200";
      console.log(TAG + " start");

      let onAbilityForeground = (ability: UIAbility) => {
        console.log(TAG + " onAbilityForeground");
        expect(ability != null).assertTrue();
        done()
      }

      monitor = {
        abilityName: 'MainAbility2',
        onAbilityForeground: onAbilityForeground,
        onWindowStageRestore: (ability: UIAbility) => {
          console.info(TAG + "===>onWindowStageRestore");
        }
      };
      console.log(TAG + " addAbilityMonitor start ");
      delegator.addAbilityMonitor(monitor, (async (err) => {
        console.log(TAG + " addAbilityMonitor====>" + err.code);
        await delegator.startAbility(
          {
            bundleName: 'com.example.abilitymonitortest',
            abilityName: 'MainAbility2'
          }).then(async () => {
          console.log(TAG + "====>0200startAbility success====>");
        })
      }))
    })

    /**
     * @tc.number: ACTS_AddAbilityMonitor_Callback_0300
     * @tc.name: Verify that the addAbilityMonitor interface functions normally.
     * @tc.desc: Use addAbilityMonitor to add a monitor then use startAbility to trigger
     * onAbilityBackground (Callback).
     */
    it('ACTS_AddAbilityMonitor_Callback_0300', Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_AddAbilityMonitor_Callback_0300";
      console.log(TAG + " start");

      let onAbilityBackgroundPromise = (ability: UIAbility) => {
        console.log(TAG + "====>onAbilityBackgroundPromise ====>");
        expect(ability != null).assertTrue();
        done();
      }

      let UnSubscribeCallback = () => {
        console.log(TAG + "====>commonEvent_foreground UnSubscribeCallback====>");
      }

      let subscriber: Subscriber.CommonEventSubscriber;
      let commonEvent_Foreground: Subscriber.CommonEventSubscribeInfo = {
        events: ["commonEvent_foreground"]
      };
      monitor = {
        abilityName: 'MainAbility3',
        onAbilityBackground: onAbilityBackgroundPromise
      }
      console.log(TAG + " addAbilityMonitor start");
      delegator.addAbilityMonitor(monitor, (async (err) => {
        console.log(TAG + "====> addAbilityMonitor====>" + err.code);
      }))
      console.log(TAG + " createSubscriber start");
      Subscriber.createSubscriber(commonEvent_Foreground, async (err, data) => {
        console.log(TAG + "====>Create Subscriber====>");
        subscriber = data;
        Subscriber.subscribe(subscriber, (err,data)=>{
          console.log(TAG + "====>Subscribe CallBack data:====>" + JSON.stringify(data));
          Subscriber.unsubscribe(subscriber, UnSubscribeCallback);
          delegator.getCurrentTopAbility().then((ability) => {
            console.info(TAG + "===ability " + JSON.stringify(ability).length);
            delegator.doAbilityBackground(ability).then(async (data) => {
              console.info(TAG + "===data succeed.");
              expect(true).assertTrue();
            }).catch((err: BusinessError) => {
              console.info(TAG + "===data failed.");
              expect(false).assertTrue();
              done();
            });
          })
        });
        console.log(TAG + " startAbility start");
        delegator.startAbility(
          {
            bundleName: 'com.example.abilitymonitortest',
            abilityName: 'MainAbility3'
          }).then(async () => {
          console.log(TAG + "====>0300startAbility success====>");
        })
      })
    })

    /**
     * @tc.number: ACTS_AddAbilityMonitor_Callback_0400
     * @tc.name: Verify that the addAbilityMonitor interface functions normally.
     * @tc.desc: Use addAbilityMonitor to add a monitor then use startAbility
     * to trigger onAbilityDestroy (Callback).
     */
    it('ACTS_AddAbilityMonitor_Callback_0400', Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_AddAbilityMonitor_Callback_0400";
      console.log(TAG + " start");

      let onAbilityDestroy = (ability: UIAbility) => {
        console.log(TAG + " onAbilityDestroy====>");
        expect(ability != null).assertTrue();
        done();
      }

      monitor = {
        abilityName: 'MainAbility4',
        onAbilityDestroy: onAbilityDestroy
      };
      console.log(TAG + " addAbilityMonitor start");
      delegator.addAbilityMonitor(monitor, (async (err) => {
        console.log(TAG + "====> success====>" + err.code);
        delegator.startAbility(
          {
            bundleName: 'com.example.abilitymonitortest',
            abilityName: 'MainAbility4'
          }).then(async () => {
          console.log(TAG + "====>0400startAbility success====>");
        })
      }))
    })

    /**
     * @tc.number: ACTS_AddAbilityMonitor_Callback_0500
     * @tc.name: Verify that the addAbilityMonitor interface functions normally.
     * @tc.desc: Use addAbilityMonitor to add a monitor then use startAbility
     * to trigger onWindowStageCreate (Callback).
     */
    it('ACTS_AddAbilityMonitor_Callback_0500', Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_AddAbilityMonitor_Callback_0500";
      console.log(TAG + " start");

      let onWindowStageCreate = (ability: UIAbility) => {
        console.log(TAG + "====>onWindowStageCreate====>");
        expect(ability != null).assertTrue();
        done();
      }

      monitor = {
        abilityName: 'MainAbility2',
        onWindowStageCreate: onWindowStageCreate
      }
      console.log(TAG + " addAbilityMonitor start");
      delegator.addAbilityMonitor(monitor, (async (err) => {
        console.log(TAG + "====>ACTS_AddAbilityMonitor_0500 success====>" + err.code);
        delegator.startAbility(
          {
            bundleName: 'com.example.abilitymonitortest',
            abilityName: 'MainAbility2'
          }).then(async () => {
          console.log(TAG + "====>0500startAbility success====>");
        })
      }))
    })

    /**
     * @tc.number: ACTS_AddAbilityMonitor_Callback_0600
     * @tc.name: Verify that the addAbilityMonitor interface functions normally.
     * @tc.desc: Use addAbilityMonitor to add a monitor then use startAbility
     * to trigger onWindowStageDestroy (Callback).
     */
    it('ACTS_AddAbilityMonitor_Callback_0600', Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_AddAbilityMonitor_Callback_0600";
      console.log(TAG + " start");

      let onWindowStageDestroy = (ability: UIAbility) => {
        console.log(TAG + "====>onWindowStageDestroy====>");
        expect(ability != null).assertTrue();
        done();
      }

      monitor = {
        abilityName: 'MainAbility4',
        onWindowStageDestroy: onWindowStageDestroy
      }
      console.log(TAG + " addAbilityMonitor start");
      delegator.addAbilityMonitor(monitor, (async (err) => {
        console.log(TAG + "====>ACTS_AddAbilityMonitor_0600 success====>" + err.code);
        delegator.startAbility(
          {
            bundleName: 'com.example.abilitymonitortest',
            abilityName: 'MainAbility4'
          }).then(async () => {
          console.log(TAG + "====>0600startAbility success====>");
        })
      }))
    })

    /**
     * @tc.number: ACTS_AddAbilityMonitor_Callback_0700
     * @tc.name: Verify that the addAbilityMonitor interface functions normally.
     * @tc.desc: Use addAbilityMonitor to add a monitor then use startAbility
     * to trigger onAbilityCreate with many
     *           a time (Callback).
     */
    it('ACTS_AddAbilityMonitor_Callback_0700', Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_AddAbilityMonitor_Callback_0700";
      console.log(TAG + " start");

      let onAbilityCreate = (ability: UIAbility) => {
        console.log(TAG + "====>0700--onAbilityCreate====>");
        expect(ability != null).assertTrue();
        done();
      }

      monitor = {
        abilityName: 'MainAbility2',
        onAbilityCreate: onAbilityCreate
      };
      console.log(TAG + " addAbilityMonitor start");
      delegator.addAbilityMonitor(monitor, (async (err) => {
        console.log(TAG + "====>ACTS_AddAbilityMonitor_0700 addAbilityMonitorfir====>" + err.code);
        delegator.addAbilityMonitor(
          {
            abilityName: 'MainAbility2',
            onAbilityCreate: onAbilityCreate
          }, (async (err) => {
          console.log(TAG + "====>ACTS_AddAbilityMonitor_0700 addAbilityMonitorsec====>" + err.code);
          delegator.startAbility(
            {
              bundleName: 'com.example.abilitymonitortest',
              abilityName: 'MainAbility2'
            }).then(async () => {
            console.log(TAG + "====>0700startAbility success====>");
          })
        }))
      }))
    })

    /**
     * @tc.number: ACTS_AddAbilityMonitor_Promise_0100
     * @tc.name: Verify that the addAbilityMonitor interface functions normally.
     * @tc.desc: Use addAbilityMonitor to add a monitor then use startAbility
     * to trigger onAbilityCreate (promise).
     */
    it('ACTS_AddAbilityMonitor_Promise_0100', Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_AddAbilityMonitor_Promise_0100";
      console.log(TAG + " start");

      let onAbilityCreatePromise = (ability: UIAbility) => {
        console.log(TAG + "====>onAbilityCreatePromise ====>");
        expect(ability != null).assertTrue();
        done();
      }

      monitor = {
        abilityName: 'MainAbility2',
        onAbilityCreate: onAbilityCreatePromise
      };
      console.log(TAG + " addAbilityMonitor start");
      delegator.addAbilityMonitor(monitor).then(() => {
        console.log(TAG + "====>ACTS_AddAbilityMonitor_0800 success====>");
        delegator.startAbility(
          {
            bundleName: 'com.example.abilitymonitortest',
            abilityName: 'MainAbility2'
          }).then(async () => {
          console.log(TAG + "====>0800startAbility success====>");
        })
      })
    })

    /**
     * @tc.number: ACTS_AddAbilityMonitor_Promise_0200
     * @tc.name: Verify that the addAbilityMonitor interface functions normally.
     * @tc.desc: Use addAbilityMonitor to add a monitor then use startAbility
     * to trigger onAbilityForeground (promise).
     */
    it('ACTS_AddAbilityMonitor_Promise_0200', Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_AddAbilityMonitor_Promise_0200";
      console.log(TAG + " start");

      let onAbilityForegroundPromise = (ability: UIAbility) => {
        console.log(TAG + "====>onAbilityForegroundPromise ====>");
        expect(ability != null).assertTrue();
        done();
      }

      monitor = {
        abilityName: 'MainAbility2',
        onAbilityForeground: onAbilityForegroundPromise
      }
      console.log(TAG + " addAbilityMonitor start");
      delegator.addAbilityMonitor(monitor).then(async () => {
        console.log(TAG + "====>ACTS_AddAbilityMonitor_0900 success====>");
        delegator.startAbility(
          {
            bundleName: 'com.example.abilitymonitortest',
            abilityName: 'MainAbility2'
          }).then(async () => {
          console.log(TAG + "====>0900startAbility success====>");
        })
      })
    })

    /**
     * @tc.number: ACTS_AddAbilityMonitor_Promise_0300
     * @tc.name: Verify that the addAbilityMonitor interface functions normally.
     * @tc.desc: Use addAbilityMonitor to add a monitor then use startAbility
     * to trigger onAbilityBackground (promise).
     */
    it('ACTS_AddAbilityMonitor_Promise_0300', Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_AddAbilityMonitor_Promise_0300";
      console.log(TAG + " start");

      let onAbilityBackgroundPromise = (ability: UIAbility) => {
        console.log(TAG + "====>onAbilityBackgroundPromise ====>");
        expect(ability != null).assertTrue();
        done();
      }

      let subscriber: Subscriber.CommonEventSubscriber
      let commonEvent_Foreground: Subscriber.CommonEventSubscribeInfo = {
        events: ["commonEvent_foreground"]
      };
      monitor = {
        abilityName: 'MainAbility3',
        onAbilityBackground: onAbilityBackgroundPromise
      }
      console.log(TAG + " addAbilityMonitor start");
      delegator.addAbilityMonitor(monitor).then(async () => {
        console.log(TAG + "====>ACTS_AddAbilityMonitor_1000 success====>");
      })
      console.log(TAG + " createSubscriber start");
      Subscriber.createSubscriber(commonEvent_Foreground, async (err, data) => {
        console.log(TAG + "====>Create Subscriber====>");
        subscriber = data;
        Subscriber.subscribe(subscriber, (err, data)=>{
          console.log(TAG + "====>Subscribe CallBack data:====>" + JSON.stringify(data));
          delegator.getCurrentTopAbility().then((ability) => {
            console.info(TAG + "===ACTS_AddAbilityMonitor_1000===ability" + JSON.stringify(ability).length);
            delegator.doAbilityBackground(ability).then(async () => {
              console.info(TAG + "===ACTS_AddAbilityMonitor_1000===data succeed.");
              expect(true).assertTrue();
            }).catch(() => {
              console.info(TAG + "===ACTS_AddAbilityMonitor_1000===data succeed.");
              expect(false).assertTrue();
            });
          })
        });
        console.log(TAG + " startAbility start");
        await delegator.startAbility(
          {
            bundleName: 'com.example.abilitymonitortest',
            abilityName: 'MainAbility3'
          }).then(async () => {
          console.log(TAG + "====>1000startAbility success====>");
        })
      })
    })

    /**
     * @tc.number: ACTS_AddAbilityMonitor_Promise_0400
     * @tc.name: Verify that the addAbilityMonitor interface functions normally.
     * @tc.desc: Use addAbilityMonitor to add a monitor then use startAbility
     * to trigger onAbilityDestroy (promise).
     */
    it('ACTS_AddAbilityMonitor_Promise_0400', Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_AddAbilityMonitor_Promise_0400";
      console.log(TAG + " start");

      let onAbilityDestroyPromise = (ability: UIAbility) => {
        console.log(TAG + "====>onAbilityDestroyPromise====>");
        expect(ability != null).assertTrue();
        done();
      }

      monitor = {
        abilityName: 'MainAbility4',
        onAbilityDestroy: onAbilityDestroyPromise
      }
      console.log(TAG + " addAbilityMonitor start");
      delegator.addAbilityMonitor(monitor).then(async () => {
        console.log(TAG + "====>ACTS_AddAbilityMonitor_1100 success====>");
      })
      console.log(TAG + " startAbility start");
      delegator.startAbility(
        {
          bundleName: 'com.example.abilitymonitortest',
          abilityName: 'MainAbility4'
        }).then(async () => {
        console.log(TAG + "====>1100startAbility success====>");
      })
    })

    /**
     * @tc.number: ACTS_AddAbilityMonitor_Promise_0500
     * @tc.name: Verify that the addAbilityMonitor interface functions normally.
     * @tc.desc: Use addAbilityMonitor to add a monitor then use startAbility
     * to trigger onWindowStageCreate (promise).
     */
    it('ACTS_AddAbilityMonitor_Promise_0500', Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_AddAbilityMonitor_Promise_0500";
      console.log(TAG + " start");

      let onWindowStageCreatePromise = (ability: UIAbility) => {
        console.log(TAG + "====>onWindowStageCreatePromise====>");
        expect(ability != null).assertTrue();
        done();
      }

      monitor = {
        abilityName: 'MainAbility2',
        onWindowStageCreate: onWindowStageCreatePromise
      }
      console.log(TAG + " addAbilityMonitor start");
      delegator.addAbilityMonitor(monitor).then(async () => {
        console.log(TAG + "====>ACTS_AddAbilityMonitor_1200 success====>");
        delegator.startAbility(
          {
            bundleName: 'com.example.abilitymonitortest',
            abilityName: 'MainAbility2'
          }).then(async () => {
          console.log(TAG + "====>1200startAbility success====>");
        })
      })
    })

    /**
     * @tc.number: ACTS_AddAbilityMonitor_Promise_0600
     * @tc.name: Verify that the addAbilityMonitor interface functions normally.
     * @tc.desc: Use addAbilityMonitor to add a monitor then use startAbility
     * to trigger onWindowStageDestroy (promise).
     */
    it('ACTS_AddAbilityMonitor_Promise_0600', Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_AddAbilityMonitor_Promise_0600";
      console.log(TAG + " start");

      let onWindowStageDestroyPromsie = (ability: UIAbility) => {
        console.log(TAG + "====>onWindowStageDestroyPromsie====>");
        expect(ability != null).assertTrue();
        done();
      }

      monitor = {
        abilityName: 'MainAbility4',
        onWindowStageDestroy: onWindowStageDestroyPromsie
      }
      console.log(TAG + " addAbilityMonitor start");
      delegator.addAbilityMonitor(monitor).then(async () => {
        console.log(TAG + "====>ACTS_AddAbilityMonitor_1300 success====>");
        delegator.startAbility(
          {
            bundleName: 'com.example.abilitymonitortest',
            abilityName: 'MainAbility4'
          }).then(async () => {
          console.log(TAG + "====>1300startAbility success====>");
        })
      })
    })

    /**
     * @tc.number: ACTS_AddAbilityMonitor_Promise_0700
     * @tc.name: Verify that the addAbilityMonitor interface functions normally.
     * @tc.desc: Use addAbilityMonitor to add a monitor then use startAbility
     * to trigger onAbilityCreate with many
     *           a time (promise).
     */
    it('ACTS_AddAbilityMonitor_Promise_0700', Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_AddAbilityMonitor_Promise_0700";
      console.log(TAG + " start");

      let onAbilityCreate = (ability: UIAbility) => {
        console.log(TAG + "====>1400--onAbilityCreate====>");
        expect(ability != null).assertTrue();
        done();
      }

      monitor = {
        abilityName: 'MainAbility2',
        onAbilityCreate: onAbilityCreate
      }
      monitor1 = {
        abilityName: 'MainAbility2',
        onAbilityCreate: onAbilityCreate
      }
      console.log(TAG + " addAbilityMonitor start");
      delegator.addAbilityMonitor(monitor).then(async () => {
        console.log(TAG + " addAbilityMonitor1 start");
        delegator.addAbilityMonitor(monitor1).then(async () => {
          delegator.startAbility(
            {
              bundleName: 'com.example.abilitymonitortest',
              abilityName: 'MainAbility2'
            }).then(async () => {
            console.log(TAG + "====>1400startAbility success====>");
          })
        })
      })
    })

    /**
     * @tc.number: ACTS_RemoveAbilityMonitor_Callback_0100
     * @tc.name: Verify that the removeAbilityMonitor interface functions normally.
     * @tc.desc: Use addAbilityMonitor to add monitor and use removeAbilityMonitor
     * to remove monitor then trigger
     *           onAbilityCreate (Callback).
     */
    it('ACTS_RemoveAbilityMonitor_Callback_0100', Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_RemoveAbilityMonitor_Callback_0100";
      console.log(TAG + " start");

      let onAbilityCreate = () => {
        console.log(TAG + "====>onAbilityCreate ====>");
        expect().assertFail();
        done();
      }

      let monitor: abilityDelegatorRegistry2.AbilityMonitor = {
        abilityName: 'MainAbility2',
        onAbilityCreate: onAbilityCreate
      }
      console.log(TAG + " addAbilityMonitor start");
      delegator.addAbilityMonitor(monitor, (async (err) => {
        console.log(TAG + "====>-addAbilityMonitor success====>" + err.code);
        await delegator.removeAbilityMonitor(monitor, (err) => {
          console.log(TAG + "====>0100removeAbilityMonitor success====>" + err.code);
          delegator.startAbility(
            {
              bundleName: 'com.example.abilitymonitortest',
              abilityName: 'MainAbility2'
            }).then(async () => {
            console.log(TAG + "====>remove0100 startAbility end====>");
            setTimeout(() => {
              done();
            }, 2500)
          })
        })
      }))
    })

    /**
     * @tc.number: ACTS_RemoveAbilityMonitor_Callback_0200
     * @tc.name: Verify that the removeAbilityMonitor interface functions normally.
     * @tc.desc: Use addAbilityMonitor to add monitor and use removeAbilityMonitor
     * to remove monitor then trigger
     *           onAbilityForeground (Callback).
     */
    it('ACTS_RemoveAbilityMonitor_Callback_0200', Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_RemoveAbilityMonitor_Callback_0200";
      console.log(TAG + " start");

      let onAbilityForeground = () => {
        console.log(TAG + "====>onAbilityForeground ====>");
        expect().assertFail();
        done();
      }

      let monitor: abilityDelegatorRegistry2.AbilityMonitor = {
        abilityName: 'MainAbility2',
        onAbilityForeground: onAbilityForeground
      }
      console.log(TAG + " addAbilityMonitor start");
      delegator.addAbilityMonitor(monitor, (async (err) => {
        console.log(TAG + "====>remove0200-addAbilityMonitor success====>" + err.code);
        await delegator.removeAbilityMonitor(monitor, (err) => {
          console.log(TAG + "====>0200removeAbilityMonitor success====>" + err.code);
          delegator.startAbility(
            {
              bundleName: 'com.example.abilitymonitortest',
              abilityName: 'MainAbility2'
            }).then(async () => {
            console.log(TAG + "====>remove0200 startAbility end====>");
            setTimeout(() => {
              done();
            }, 2500)
          })
        })
      }))
    })

    /**
     * @tc.number: ACTS_RemoveAbilityMonitor_Callback_0300
     * @tc.name: Verify that the removeAbilityMonitor interface functions normally.
     * @tc.desc: Use addAbilityMonitor to add monitor and use removeAbilityMonitor
     * to remove monitor then trigger
     *           onAbilityBackground (Callback).
     */
    it('ACTS_RemoveAbilityMonitor_Callback_0300', Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_RemoveAbilityMonitor_Callback_0300";
      console.log(TAG + " start");

      let onAbilityBackground = () => {
        console.log(TAG + "====>onAbilityBackground ====>");
        expect().assertFail();
        done();
      }

      let monitor: abilityDelegatorRegistry2.AbilityMonitor = {
        abilityName: 'MainAbility2',
        onAbilityBackground: onAbilityBackground
      }
      console.log(TAG + " addAbilityMonitor start");
      delegator.addAbilityMonitor(monitor, (async (err) => {
        console.log(TAG + "====>remove0300-addAbilityMonitor success====>" + err.code);
        await delegator.removeAbilityMonitor(monitor, (err) => {
          console.log(TAG + "====>0300removeAbilityMonitor success====>" + err.code);
          delegator.startAbility(
            {
              bundleName: 'com.example.abilitymonitortest',
              abilityName: 'MainAbility2'
            }).then(async () => {
            console.log(TAG + "====>remove0300 startAbility end====>");
            setTimeout(() => {
              done();
            }, 2500)
          })
        })
      }))
    })

    /**
     * @tc.number: ACTS_RemoveAbilityMonitor_Callback_0400
     * @tc.name: Verify that the removeAbilityMonitor interface functions normally.
     * @tc.desc: Use addAbilityMonitor to add monitor and use removeAbilityMonitor
     * to remove monitor then trigger
     *           onAbilityDestroy (Callback).
     */
    it('ACTS_RemoveAbilityMonitor_Callback_0400', Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_RemoveAbilityMonitor_Callback_0400";
      console.log(TAG + " start");

      let onAbilityDestroy = () => {
        console.log(TAG + "====>onAbilityDestroy ====>");
        expect().assertFail();
        done();
      }

      let monitor: abilityDelegatorRegistry2.AbilityMonitor = {
        abilityName: 'MainAbility2',
        onAbilityDestroy: onAbilityDestroy
      }
      console.log(TAG + " addAbilityMonitor start");
      delegator.addAbilityMonitor(monitor, (async (err) => {
        console.log(TAG + "====>remove0400-addAbilityMonitor success====>" + err.code);
        await delegator.removeAbilityMonitor(monitor, (err) => {
          console.log(TAG + "====>0400removeAbilityMonitor success====>" + err.code);
          delegator.startAbility(
            {
              bundleName: 'com.example.abilitymonitortest',
              abilityName: 'MainAbility2'
            }).then(async () => {
            console.log(TAG + "====>remove0400 startAbility end====>");
            setTimeout(() => {
              done();
            }, 2500)
          })
        })
      }))
    })

    /**
     * @tc.number: ACTS_RemoveAbilityMonitor_Callback_0500
     * @tc.name: Verify that the removeAbilityMonitor interface functions normally.
     * @tc.desc: Use addAbilityMonitor to add monitor and use removeAbilityMonitor
     * to remove monitor then trigger
     *           onWindowStageCreate (Callback).
     */
    it('ACTS_RemoveAbilityMonitor_Callback_0500', Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_RemoveAbilityMonitor_Callback_0500";
      console.log(TAG + " start");

      let onWindowStageCreate = () => {
        console.log(TAG + "====>onWindowStageCreate ====>");
        expect().assertFail();
        done();
      }

      let monitor: abilityDelegatorRegistry2.AbilityMonitor = {
        abilityName: 'MainAbility2',
        onWindowStageCreate: onWindowStageCreate
      }
      console.log(TAG + "====>start addAbilityMonitor====>");
      delegator.addAbilityMonitor(monitor, (async (err) => {
        console.log(TAG + "====>remove0500-addAbilityMonitor success====>" + err.code);
        await delegator.removeAbilityMonitor(monitor, (err) => {
          console.log(TAG + "====>0500removeAbilityMonitor success====>" + err.code);
          delegator.startAbility(
            {
              bundleName: 'com.example.abilitymonitortest',
              abilityName: 'MainAbility2'
            }).then(async () => {
            console.log(TAG + "====>remove0500 startAbility end====>");
            setTimeout(() => {
              done();
            }, 2500)
          })
        })
      }))
    })

    /**
     * @tc.number: ACTS_RemoveAbilityMonitor_Callback_0600
     * @tc.name: Verify that the removeAbilityMonitor interface functions normally.
     * @tc.desc: Use addAbilityMonitor to add monitor and use removeAbilityMonitor
     * to remove monitor then trigger
     *           onWindowStageDestroy (Callback).
     */
    it('ACTS_RemoveAbilityMonitor_Callback_0600', Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_RemoveAbilityMonitor_Callback_0600";
      console.log(TAG + " start");

      let onWindowStageDestroy = () => {
        console.log(TAG + "====>onWindowStageDestroy ====>");
        expect().assertFail();
        done();
      }

      let monitor: abilityDelegatorRegistry2.AbilityMonitor = {
        abilityName: 'MainAbility2',
        onWindowStageDestroy: onWindowStageDestroy
      }
      console.log(TAG + " addAbilityMonitor start");
      delegator.addAbilityMonitor(monitor, (async (err) => {
        console.log(TAG + "====>remove0600-addAbilityMonitor success====>" + err.code);
        await delegator.removeAbilityMonitor(monitor, (err) => {
          console.log(TAG + "====>0600removeAbilityMonitor success====>" + err.code);
          delegator.startAbility(
            {
              bundleName: 'com.example.abilitymonitortest',
              abilityName: 'MainAbility2'
            }).then(async () => {
            console.log(TAG + "====>remove0600 startAbility end====>");
            setTimeout(() => {
              done();
            }, 2500)
          })
        })
      }))
    })

    /**
     * @tc.number: ACTS_RemoveAbilityMonitor_Callback_0700
     * @tc.name: Verify that the removeAbilityMonitor interface functions normally.
     * @tc.desc: Use addAbilityMonitor to add monitor and use removeAbilityMonitor
     * to remove monitor then trigger
     *           onAbilityCreate (Callback).
     */
    it('ACTS_RemoveAbilityMonitor_Callback_0700', Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_RemoveAbilityMonitor_Callback_0700";
      console.log(TAG + " start");

      let onAbilityCreate = () => {
        console.log(TAG + "====>onAbilityCreate====>");
      }

      let data = abilityDelegatorRegistry.getAbilityDelegator()
      console.log(TAG + "remove0700-getAbilityDelegator data is" + JSON.stringify(data))
      console.log(TAG + " removeAbilityMonitor start");
      await data.removeAbilityMonitor({
        abilityName: 'WrongName',
        onAbilityCreate: onAbilityCreate
      }, (err) => {
        console.log(TAG + "====>0700removeAbilityMonitor success====>" + err.code);
        expect(err.code).assertEqual(0)
        done();
      })
    })

    /**
     * @tc.number: ACTS_RemoveAbilityMonitor_Callback_0800
     * @tc.name: Verify that the removeAbilityMonitor interface functions normally.
     * @tc.desc: Use waitAbilityMonitor to add monitor and use removeAbilityMonitor
     * to remove monitor then trigger
     *           onAbilityCreate (Callback).
     */
    it('ACTS_RemoveAbilityMonitor_Callback_0800', Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_RemoveAbilityMonitor_Callback_0800";
      console.log(TAG + " start");

      let onAbilityCreate = () => {
        console.log(TAG + "====>onAbilityCreate ====>");
        expect().assertFail();
        done();
      }

      let monitor: abilityDelegatorRegistry2.AbilityMonitor = {
        abilityName: 'MainAbility2',
        onAbilityCreate: onAbilityCreate
      }
      console.log(TAG + " waitAbilityMonitor start");
      delegator.waitAbilityMonitor(monitor, (async (err) => {
        console.log(TAG + "====>remove0800-waitAbilityMonitor success====>" + err.code);
      }))
      await sleep(500);
      delegator.removeAbilityMonitor(monitor, (err) => {
        console.log(TAG + "====>0800removeAbilityMonitor success====>" + err.code);
        delegator.startAbility(
          {
            bundleName: 'com.example.abilitymonitortest',
            abilityName: 'MainAbility2'
          }).then(async () => {
          console.log(TAG + "====>remove0800 startAbility end====>");
          setTimeout(() => {
            done();
          }, 2500)
        })
      })
    })

    /**
     * @tc.number: ACTS_RemoveAbilityMonitor_Promise_0100
     * @tc.name: Verify that the removeAbilityMonitor interface functions normally.
     * @tc.desc: Use addAbilityMonitor to add monitor and use removeAbilityMonitor
     * to remove monitor then trigger
     *           onAbilityCreate (promise).
     */
    it('ACTS_RemoveAbilityMonitor_Promise_0100', Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_RemoveAbilityMonitor_Promise_0100";
      console.log(TAG + " start");

      let onAbilityCreate = () => {
        console.log(TAG + "====>onAbilityCreate ====>");
        expect().assertFail();
        done();
      }

      let monitor: abilityDelegatorRegistry2.AbilityMonitor = {
        abilityName: 'MainAbility2',
        onAbilityCreate: onAbilityCreate
      }
      console.log(TAG + " addAbilityMonitor start");
      delegator.addAbilityMonitor(monitor, (async (err) => {
        console.log(TAG + "====>remove0100-addAbilityMonitor success====>" + err.code);
        await delegator.removeAbilityMonitor(monitor).then(() => {
          console.log("TAG + ====>0100removeAbilityMonitor success====>");
          delegator.startAbility(
            {
              bundleName: 'com.example.abilitymonitortest',
              abilityName: 'MainAbility2'
            }).then(async () => {
            console.log(TAG + "====>remove0100 startAbility end====>");
            setTimeout(() => {
              done();
            }, 2500)
          })
        })
      }))
    })

    /**
     * @tc.number: ACTS_RemoveAbilityMonitor_Promise_0200
     * @tc.name: Verify that the removeAbilityMonitor interface functions normally.
     * @tc.desc: Use addAbilityMonitor to add monitor and use removeAbilityMonitor
     * to remove monitor then trigger
     *           onAbilityForeground (promise).
     */
    it('ACTS_RemoveAbilityMonitor_Promise_0200', Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_RemoveAbilityMonitor_Promise_0200";
      console.log(TAG + " start");

      let onAbilityForeground = () => {
        console.log(TAG + "====>onAbilityForeground ====>");
        expect().assertFail();
        done();
      }

      let monitor: abilityDelegatorRegistry2.AbilityMonitor = {
        abilityName: 'MainAbility2',
        onAbilityForeground: onAbilityForeground
      }
      console.log(TAG + " addAbilityMonitor start");
      delegator.addAbilityMonitor(monitor, (async (err) => {
        console.log(TAG + "====>remove0200-addAbilityMonitor success====>" + err.code);
        await delegator.removeAbilityMonitor(monitor).then(() => {
          console.log(TAG + "====>0200removeAbilityMonitor success====>");
          delegator.startAbility(
            {
              bundleName: 'com.example.abilitymonitortest',
              abilityName: 'MainAbility2'
            }).then(async () => {
            console.log(TAG + "====>remove0200 startAbility end====>");
            setTimeout(() => {
              done();
            }, 2500)
          })
        })
      }))
    })

    /**
     * @tc.number: ACTS_RemoveAbilityMonitor_Promise_0300
     * @tc.name: Verify that the removeAbilityMonitor interface functions normally.
     * @tc.desc: Use addAbilityMonitor to add monitor and use removeAbilityMonitor
     * to remove monitor then trigger
     *           onAbilityBackground (promise).
     */
    it('ACTS_RemoveAbilityMonitor_Promise_0300', Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_RemoveAbilityMonitor_Promise_0300";
      console.log(TAG + " start");

      let onAbilityBackground = () => {
        console.log(TAG + "====>onAbilityBackground ====>");
        expect().assertFail();
        done();
      }

      let monitor: abilityDelegatorRegistry2.AbilityMonitor = {
        abilityName: 'MainAbility2',
        onAbilityBackground: onAbilityBackground
      }
      console.log(TAG + " addAbilityMonitor start");
      delegator.addAbilityMonitor(monitor, (async (err) => {
        console.log(TAG + "====>remove0300-addAbilityMonitor success====>" + err.code);
        await delegator.removeAbilityMonitor(monitor).then(() => {
          console.log(TAG + "====>0300removeAbilityMonitor success====>");
          delegator.startAbility(
            {
              bundleName: 'com.example.abilitymonitortest',
              abilityName: 'MainAbility2'
            }).then(async () => {
            console.log(TAG + "====>remove0300 startAbility end====>");
            setTimeout(() => {
              done();
            }, 2500)
          })
        })
      }))
    })

    /**
     * @tc.number: ACTS_RemoveAbilityMonitor_Promise_0400
     * @tc.name: Verify that the removeAbilityMonitor interface functions normally.
     * @tc.desc: Use addAbilityMonitor to add monitor and use removeAbilityMonitor
     * to remove monitor then trigger
     *           onAbilityDestroy (promise).
     */
    it('ACTS_RemoveAbilityMonitor_Promise_0400', Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_RemoveAbilityMonitor_Promise_0400";
      console.log(TAG + " start");

      let onAbilityDestroy = () => {
        console.log(TAG + "====>onAbilityCreate ====>");
        expect().assertFail();
        done();
      }

      let monitor: abilityDelegatorRegistry2.AbilityMonitor = {
        abilityName: 'MainAbility2',
        onAbilityDestroy: onAbilityDestroy
      }
      console.log(TAG + " addAbilityMonitor start");
      delegator.addAbilityMonitor(monitor, (async (err) => {
        console.log(TAG + "====>remove0400-addAbilityMonitor success====>" + err.code);
        await delegator.removeAbilityMonitor(monitor).then(() => {
          console.log(TAG + "====>0400removeAbilityMonitor success====>");
          delegator.startAbility(
            {
              bundleName: 'com.example.abilitymonitortest',
              abilityName: 'MainAbility2'
            }).then(async () => {
            console.log(TAG + "====>remove0400 startAbility end====>");
            setTimeout(() => {
              done();
            }, 2500)
          })
        })
      }))
    })

    /**
     * @tc.number: ACTS_RemoveAbilityMonitor_Promise_0500
     * @tc.name: Verify that the removeAbilityMonitor interface functions normally.
     * @tc.desc: Use addAbilityMonitor to add monitor and use removeAbilityMonitor
     * to remove monitor then trigger
     *           onWindowStageCreate (promise).
     */
    it('ACTS_RemoveAbilityMonitor_Promise_0500', Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_RemoveAbilityMonitor_Promise_0500";
      console.log(TAG + " start");

      let onWindowStageCreate = () => {
        console.log(TAG + "====>onAbilityCreate ====>");
        expect().assertFail();
        done();
      }

      let monitor: abilityDelegatorRegistry2.AbilityMonitor = {
        abilityName: 'MainAbility2',
        onWindowStageCreate: onWindowStageCreate
      }
      console.log(TAG + " addAbilityMonitor start");
      delegator.addAbilityMonitor(monitor, (async (err) => {
        console.log(TAG + "====>remove0500-addAbilityMonitor success====>" + err.code);
        await delegator.removeAbilityMonitor(monitor).then(() => {
          console.log(TAG + "====>0500removeAbilityMonitor success====>");
          delegator.startAbility(
            {
              bundleName: 'com.example.abilitymonitortest',
              abilityName: 'MainAbility2'
            }).then(async () => {
            console.log(TAG + "====>remove0500 startAbility end====>");
            setTimeout(() => {
              done();
            }, 2500)
          })
        })
      }))
    })

    /**
     * @tc.number: ACTS_RemoveAbilityMonitor_Promise_0600
     * @tc.name: Verify that the removeAbilityMonitor interface functions normally.
     * @tc.desc: Use addAbilityMonitor to add monitor and use removeAbilityMonitor
     * to remove monitor then trigger
     *           onWindowStageDestroy (promise).
     */
    it('ACTS_RemoveAbilityMonitor_Promise_0600', Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_RemoveAbilityMonitor_Promise_0600";
      console.log(TAG + " start");

      let onWindowStageDestroy = () => {
        console.log(TAG + "====>onAbilityCreate ====>");
        expect().assertFail();
        done();
      }

      let monitor: abilityDelegatorRegistry2.AbilityMonitor = {
        abilityName: 'MainAbility2',
        onWindowStageDestroy: onWindowStageDestroy
      }
      console.log(TAG + " addAbilityMonitor start");
      delegator.addAbilityMonitor(monitor, (async (err) => {
        console.log(TAG + "====>remove0600-addAbilityMonitor success====>" + err.code);
        await delegator.removeAbilityMonitor(monitor).then(() => {
          console.log(TAG + "====>0600removeAbilityMonitor success====>");
          delegator.startAbility(
            {
              bundleName: 'com.example.abilitymonitortest',
              abilityName: 'MainAbility2'
            }).then(async () => {
            console.log(TAG + "====>remove0600 startAbility end====>");
            setTimeout(() => {
              done();
            }, 2500)
          })
        })
      }))
    })

    /**
     * @tc.number: ACTS_RemoveAbilityMonitor_Promise_0700
     * @tc.name: Verify that the removeAbilityMonitor interface functions normally.
     * @tc.desc: Use addAbilityMonitor to add monitor and use removeAbilityMonitor
     * to remove monitor then trigger
     *           onAbilityCreate (promise).
     */
    it('ACTS_RemoveAbilityMonitor_Promise_0700', Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_RemoveAbilityMonitor_Promise_0700";
      console.log(TAG + " start");

      let onAbilityCreate = () => {
        console.log(TAG + "====>onAbilityCreate====>");
        expect().assertFail();
        done();
      }

      delegator.removeAbilityMonitor({
        abilityName: 'WrongName',
        onAbilityCreate: onAbilityCreate
      }).then(() => {
        console.log(TAG + "====>0700 removeAbilityMonitorPromise====>")
        setTimeout(() => {
          done();
        }, 2500)
      }).catch((err: BusinessError) => {
        console.log(TAG + "====>0700removeAbilityMonitorPromise success====>" + err);
        expect().assertFail()
        setTimeout(() => {
          done();
        }, 1500)
      })
    })

    /**
     * @tc.number: ACTS_RemoveAbilityMonitor_Promise_0800
     * @tc.name: Verify that the removeAbilityMonitor interface functions normally.
     * @tc.desc: Use waitAbilityMonitor to add monitor and use removeAbilityMonitor
     * to remove monitor then trigger
     *           onAbilityCreate (promise).
     */
    it('ACTS_RemoveAbilityMonitor_Promise_0800', Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_RemoveAbilityMonitor_Promise_0800";
      console.log(TAG + " start");

      let onAbilityCreate = () => {
        console.log(TAG + "====>onAbilityCreate ====>");
        expect().assertFail();
        done();
      }

      let monitor: abilityDelegatorRegistry2.AbilityMonitor = {
        abilityName: 'MainAbility2',
        onAbilityCreate: onAbilityCreate
      }
      console.log(TAG + " waitAbilityMonitor start");
      delegator.waitAbilityMonitor(monitor, (async (err) => {
        console.log(TAG + "====>remove0800-waitAbilityMonitor success====>" + err.code);
      }))
      await sleep(500);
      await delegator.removeAbilityMonitor(monitor).then(() => {
        delegator.startAbility(
          {
            bundleName: 'com.example.abilitymonitortest',
            abilityName: 'MainAbility2'
          }).then(async () => {
          console.log(TAG + "====>remove0800 startAbility end====>");
          setTimeout(() => {
            done();
          }, 2500)
        })
      })
    })

    /**
     * @tc.number: ACTS_WaitAbilityMonitor_Callback_0100
     * @tc.name: Verify that the waitAbilityMonitor interface functions normally.
     * @tc.desc: Use waitAbilityMonitor to add a monitor then use startAbility
     * to trigger onAbilityCreate (Callback).
     */
    it('ACTS_WaitAbilityMonitor_Callback_0100', Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_WaitAbilityMonitor_Callback_0100";
      console.log(TAG + " start");

      let onAbilityCreate = (ability: UIAbility) => {
        console.log(TAG + "====>onAbilityCreate====>");
        expect(ability != null).assertTrue();
        done();
      }

      monitor = {
        abilityName: 'MainAbility2',
        onAbilityCreate: onAbilityCreate
      }
      delegator.waitAbilityMonitor(monitor, async (err, data) => {
        console.log(TAG + '===>0100err.code is===>' + JSON.stringify(err.code))
        expect(err.code).assertEqual(0)
        console.log(TAG + "====>ACTS_WaitAbilityMonitor_Callback_0100 success====>");
      })
      delegator.startAbility(
        {
          bundleName: 'com.example.abilitymonitortest',
          abilityName: 'MainAbility2'
        }).then(async () => {
        console.log(TAG + "====>ACTS_WaitAbilityMonitor_Callback_0100 startAbility success====>");
      })
    })

    /**
     * @tc.number: ACTS_WaitAbilityMonitor_Callback_0200
     * @tc.name: Verify that the waitAbilityMonitor interface functions normally.
     * @tc.desc: Use waitAbilityMonitor to add a monitor then use startAbility
     * to trigger onAbilityCreate exceed
     *           5s(Callback).
     */
    it('ACTS_WaitAbilityMonitor_Callback_0200', Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_WaitAbilityMonitor_Callback_0200";
      console.log(TAG + " start");

      let onAbilityCreate = (ability: UIAbility) => {
        console.log(TAG + "====>onAbilityCreate ====>");
        expect(ability != null).assertTrue();
        done();
      }

      monitor = {
        abilityName: 'MainAbility2',
        onAbilityCreate: onAbilityCreate
      }
      console.log(TAG + " waitAbilityMonitor start");
      delegator.waitAbilityMonitor(monitor, (err, waitability) => {
        console.log(TAG + "====>ACTS_WaitAbilityMonitor_Callback_0200 success====>");
        expect(err.code).assertEqual(-1)
        console.log(TAG + '===>0200err.code is===>' + JSON.stringify(err.code))
      })
      setTimeout(() => {
        delegator.startAbility(
          {
            bundleName: 'com.example.abilitymonitortest',
            abilityName: 'MainAbility2'
          }).then(() => {
          console.log(TAG + "====>ACTS_WaitAbilityMonitor_Callback_0200 startAbility end====>");
        })
      }, 5500)
    })

    /**
     * @tc.number: ACTS_WaitAbilityMonitor_Callback_0300
     * @tc.name: Verify that the waitAbilityMonitor interface functions normally.
     * @tc.desc: Use waitAbilityMonitor to add a monitor then use startAbility
     * to trigger onAbilityCreate in
     *           1s(Callback).
     */
    it('ACTS_WaitAbilityMonitor_Callback_0300', Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_WaitAbilityMonitor_Callback_0300";
      console.log(TAG + " start");

      let onAbilityCreate = (ability: UIAbility) => {
        console.log(TAG + "====>onAbilityCreate====>");
        expect(ability != null).assertTrue();
        done();
      }

      monitor = {
        abilityName: 'MainAbility2',
        onAbilityCreate: onAbilityCreate
      }
      console.log(TAG + " waitAbilityMonitor start");
      delegator.waitAbilityMonitor(monitor, 1000, async (err, data) => {
        console.log(TAG + '===>0300err.code is===>' + JSON.stringify(err.code))
        expect(err.code).assertEqual(0)
        console.log(TAG + "====>ACTS_WaitAbilityMonitor_Callback_0300 success====>");
      })
      await delegator.startAbility(
        {
          bundleName: 'com.example.abilitymonitortest',
          abilityName: 'MainAbility2'
        }).then(async () => {
        console.log(TAG + "====>ACTS_WaitAbilityMonitor_Callback_0300 startAbility success====>");
      })
    })

    /**
     * @tc.number: ACTS_WaitAbilityMonitor_Callback_0400
     * @tc.name: Verify that the waitAbilityMonitor interface functions normally.
     * @tc.desc: Use waitAbilityMonitor to add a monitor then use startAbility
     * to trigger onAbilityCreate exceed
     *           1s (Callback).
     */
    it('ACTS_WaitAbilityMonitor_Callback_0400', Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_WaitAbilityMonitor_Callback_0400";
      console.log(TAG + " start");

      let onAbilityCreate = (ability: UIAbility) => {
        console.log(TAG + "====>onAbilityCreate ====>");
        expect(ability != null).assertTrue();
        done();
      }

      monitor = {
        abilityName: 'MainAbility2',
        onAbilityCreate: onAbilityCreate
      }
      console.log(TAG + " waitAbilityMonitor start");
      delegator.waitAbilityMonitor(monitor, 1000, (err, waitability) => {
        console.log(TAG + "====>success====>");
        expect(err.code).assertEqual(-1)
        console.log(TAG + '===>0400err.code is===>' + JSON.stringify(err.code))
      })
      setTimeout(() => {
        console.log(TAG + " startAbility start");
        delegator.startAbility(
          {
            bundleName: 'com.example.abilitymonitortest',
            abilityName: 'MainAbility2'
          }).then(() => {
          console.log(TAG + "====>ACTS_WaitAbilityMonitor_Callback_0400 startAbility end====>");
        })
      }, 1500)
    })

    /**
     * @tc.number: ACTS_WaitAbilityMonitor_Callback_0500
     * @tc.name: Verify that the waitAbilityMonitor interface functions normally.
     * @tc.desc: Use waitAbilityMonitor to add a monitor then use startAbility
     * to trigger onAbilityCreate in
     *           5s (Callback).
     */
    it('ACTS_WaitAbilityMonitor_Callback_0500', Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_WaitAbilityMonitor_Callback_0500";
      console.log(TAG + " start");

      let onAbilityCreate = (ability: UIAbility) => {
        console.log(TAG + "====>onAbilityCreate====>");
        expect(ability != null).assertTrue();
        done();
      }

      monitor = {
        abilityName: 'MainAbility2',
        onAbilityCreate: onAbilityCreate
      }
      console.log(TAG + " waitAbilityMonitor start");
      delegator.waitAbilityMonitor(monitor, 0, async (err, data) => {
        console.log(TAG + '===>0500err.code is===>' + JSON.stringify(err.code))
        expect(err.code).assertEqual(0)
        console.log(TAG + "====>ACTS_WaitAbilityMonitor_Callback_0500 success====>");
      })
      console.log(TAG + " startAbility start");
      delegator.startAbility(
        {
          bundleName: 'com.example.abilitymonitortest',
          abilityName: 'MainAbility2'
        }).then(async () => {
        console.log(TAG + "====>ACTS_WaitAbilityMonitor_Callback_0500 startAbility success====>");
      })
    })

    /**
     * @tc.number: ACTS_WaitAbilityMonitor_Callback_0600
     * @tc.name: Verify that the waitAbilityMonitor interface functions normally.
     * @tc.desc: Use waitAbilityMonitor to add a monitor then use startAbility
     * to trigger onAbilityCreate in
     *           5s (Callback).
     */
    it('ACTS_WaitAbilityMonitor_Callback_0600', Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_WaitAbilityMonitor_Callback_0600";
      console.log(TAG + " start");

      let onAbilityCreate = (ability: UIAbility) => {
        console.log(TAG + "====>onAbilityCreate====>");
        expect(ability != null).assertTrue();
        done();
      }

      monitor = {
        abilityName: 'MainAbility2',
        onAbilityCreate: onAbilityCreate
      }
      console.log(TAG + " waitAbilityMonitor start");
      delegator.waitAbilityMonitor(monitor, -1, async (err, data) => {
        console.log(TAG + '===>0600err.code is===>' + JSON.stringify(err.code))
        expect(err.code).assertEqual(0)
        console.log(TAG + "====>ACTS_WaitAbilityMonitor_Callback_0600 success====>");
      })
      console.log(TAG + " startAbility start");
      delegator.startAbility(
        {
          bundleName: 'com.example.abilitymonitortest',
          abilityName: 'MainAbility2'
        }).then(async () => {
        console.log(TAG + "====>ACTS_WaitAbilityMonitor_Callback_0600 startAbility success====>");
      })
    })

    /**
     * @tc.number: ACTS_WaitAbilityMonitor_Promise_0100
     * @tc.name: Verify that the waitAbilityMonitor interface functions normally.
     * @tc.desc: Use waitAbilityMonitor to add a monitor then use startAbility
     * to trigger onAbilityCreate (promise).
     */
    it('ACTS_WaitAbilityMonitor_Promise_0100', Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_WaitAbilityMonitor_Promise_0100";
      console.log(TAG + " start");

      let onAbilityCreate = (ability: UIAbility) => {
        console.log(TAG + "====>onAbilityCreate====>");
        expect(ability != null).assertTrue();
        done();
      }

      monitor = {
        abilityName: 'MainAbility2',
        onAbilityCreate: onAbilityCreate
      }
      console.log(TAG + " waitAbilityMonitor start");
      delegator.waitAbilityMonitor(monitor).then(async (data) => {
        console.log(TAG + "====>ACTS_WaitAbilityMonitor_Promise_0100 success====>");
      })
      console.log(TAG + " startAbility start");
      await sleep(500);
      delegator.startAbility(
        {
          bundleName: 'com.example.abilitymonitortest',
          abilityName: 'MainAbility2'
        }).then(async () => {
        console.log(TAG + "====>ACTS_WaitAbilityMonitor_Promise_0100 startAbility success====>");
      })
    })

    /**
     * @tc.number: ACTS_WaitAbilityMonitor_Promise_0200
     * @tc.name: Verify that the waitAbilityMonitor interface functions normally.
     * @tc.desc: Use waitAbilityMonitor to add a monitor then use startAbility
     * to trigger onAbilityCreate exceed
     *           5s (promise).
     */
    it('ACTS_WaitAbilityMonitor_Promise_0200', Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_WaitAbilityMonitor_Promise_0200";
      console.log(TAG + " start");

      let onAbilityCreate = (ability: UIAbility) => {
        console.log(TAG + "====>onAbilityCreate ====>");
        expect(ability != null).assertTrue();
        done();
      }

      monitor = {
        abilityName: 'MainAbility2',
        onAbilityCreate: onAbilityCreate
      }
      console.log(TAG + " waitAbilityMonitor start");
      delegator.waitAbilityMonitor(monitor).then((data) => {
        console.log(TAG + "====>ACTS_WaitAbilityMonitor_Promise_0200 success====>");
      })
      setTimeout(() => {
        console.log(TAG + " startAbility start");
        delegator.startAbility(
          {
            bundleName: 'com.example.abilitymonitortest',
            abilityName: 'MainAbility2'
          }).then(() => {
          setTimeout(() => {
            done();
          }, 2500)
        })
      }, 5500)
    })

    /**
     * @tc.number: ACTS_WaitAbilityMonitor_Promise_0300
     * @tc.name: Verify that the waitAbilityMonitor interface functions normally.
     * @tc.desc: Use waitAbilityMonitor to add a monitor then use startAbility
     * to trigger onAbilityCreate in
     *           1s (promise).
     */
    it('ACTS_WaitAbilityMonitor_Promise_0300', Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_WaitAbilityMonitor_Promise_0300";
      console.log(TAG + " start");

      let onAbilityCreate = (ability: UIAbility) => {
        console.log(TAG + "====>onAbilityCreate====>");
        expect(ability != null).assertTrue();
        done();
      }

      monitor = {
        abilityName: 'MainAbility2',
        onAbilityCreate: onAbilityCreate
      }
      console.log(TAG + " waitAbilityMonitor start");
      delegator.waitAbilityMonitor(monitor, 1000).then(async (data) => {
        console.log(TAG + "====>ACTS_WaitAbilityMonitor_Promise_0300 success====>");
      })
      console.log(TAG + " startAbility start");
      delegator.startAbility(
        {
          bundleName: 'com.example.abilitymonitortest',
          abilityName: 'MainAbility2'
        }).then(async () => {
        console.log(TAG + "====>ACTS_WaitAbilityMonitor_Promise_0300 startAbility success====>");
      })
    })

    /**
     * @tc.number: ACTS_WaitAbilityMonitor_Promise_0400
     * @tc.name: Verify that the waitAbilityMonitor interface functions normally.
     * @tc.desc: Use waitAbilityMonitor to add a monitor then use startAbility
     * to trigger onAbilityCreate exceed
     *           1s (promise).
     */
    it('ACTS_WaitAbilityMonitor_Promise_0400', Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_WaitAbilityMonitor_Promise_0400";
      console.log(TAG + " start");

      let onAbilityCreate = (ability: UIAbility) => {
        console.log(TAG + "====>onAbilityCreate ====>");
        expect(ability != null).assertTrue();
        done();
      }

      monitor = {
        abilityName: 'MainAbility2',
        onAbilityCreate: onAbilityCreate
      }
      console.log(TAG + " waitAbilityMonitor start");
      delegator.waitAbilityMonitor(monitor, 1000).then((data) => {
        console.log(TAG + "====>ACTS_WaitAbilityMonitor_Promise_0400 success====>");
      })
      setTimeout(() => {
        console.log(TAG + " startAbility start");
        delegator.startAbility(
          {
            bundleName: 'com.example.abilitymonitortest',
            abilityName: 'MainAbility2'
          }).then(() => {
          console.log(TAG + "====>ACTS_WaitAbilityMonitor_Promise_0400 startAbility end====>");
          setTimeout(() => {
            done();
          }, 2500)
        })
      }, 1500)
    })

    /**
     * @tc.number: ACTS_WaitAbilityMonitor_Promise_0500
     * @tc.name: Verify that the waitAbilityMonitor interface functions normally.
     * @tc.desc: Use waitAbilityMonitor to add a monitor then use startAbility
     * to trigger onAbilityCreate in
     *           5s (promise).
     */
    it('ACTS_WaitAbilityMonitor_Promise_0500', Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_WaitAbilityMonitor_Promise_0500";
      console.log(TAG + " start");

      let onAbilityCreate = (ability: UIAbility) => {
        console.log(TAG + "====>onAbilityCreate====>");
        expect(ability != null).assertTrue();
        done();
      }

      monitor = {
        abilityName: 'MainAbility2',
        onAbilityCreate: onAbilityCreate
      }
      console.log(TAG + " waitAbilityMonitor start");
      delegator.waitAbilityMonitor(monitor, 100).then(async (data) => {
        console.log(TAG + "====>ACTS_WaitAbilityMonitor_Promise_0500 success====>");
      })
      console.log(TAG + " startAbility start");
      delegator.startAbility(
        {
          bundleName: 'com.example.abilitymonitortest',
          abilityName: 'MainAbility2'
        }).then(async () => {
        console.log(TAG + "====>ACTS_WaitAbilityMonitor_Promise_0500 startAbility success====>");
      })
    })

    /**
     * @tc.number: ACTS_WaitAbilityMonitor_Promise_0600
     * @tc.name: Verify that the waitAbilityMonitor interface functions normally.
     * @tc.desc: Use waitAbilityMonitor to add a monitor then use startAbility
     * to trigger onAbilityCreate in
     *           5s (promise).
     */
    it('ACTS_WaitAbilityMonitor_Promise_0600', Level.LEVEL0, async (done: Function) => {
      TAG = "ACTS_WaitAbilityMonitor_Promise_0600";
      console.log(TAG + " start");

      let onAbilityCreate = (ability: UIAbility) => {
        console.log(TAG + "====>onAbilityCreate====>");
        expect(ability != null).assertTrue();
        done();
      }

      monitor = {
        abilityName: 'MainAbility2',
        onAbilityCreate: onAbilityCreate
      }
      console.log(TAG + " waitAbilityMonitor start");
      delegator.waitAbilityMonitor(monitor, -1).then(async (data) => {
        console.log(TAG + "====>ACTS_WaitAbilityMonitor_Promise_0600 success====>");
      })
      console.log(TAG + " startAbility start");
      delegator.startAbility(
        {
          bundleName: 'com.example.abilitymonitortest',
          abilityName: 'MainAbility2'
        }).then(async () => {
        console.log(TAG + "====>ACTS_WaitAbilityMonitor_Promise_0600 startAbility success====>");
      })
    })
  })
}