/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { commonEventManager } from '@kit.BasicServicesKit';
import { common, contextConstant, application } from '@kit.AbilityKit';
import { BusinessError, systemParameterEnhance } from '@kit.BasicServicesKit';
import eventBusPlue from '../lib/EventBusPlus';
import wifiManager from '@ohos.wifiManager';

function sleep(ms: number): Promise<void> {
  return new Promise(resolve => setTimeout(resolve, ms));
}
let sub : commonEventManager.CommonEventSubscriber;
let testAbilityContext: common.UIAbilityContext;
let mpEnable: string;
export default function ActsUIExtensionContextMethodTest() {
  describe('ActsUIExtensionContextMethodTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      wifiManager.disableWifi();
      testAbilityContext = AppStorage.get<common.UIAbilityContext>('TestAbilityContext') as common.UIAbilityContext;
      try {
        mpEnable = systemParameterEnhance.getSync('persist.sys.abilityms.multi_process_model');
      } catch (err) {
        console.error(`ACTS_NativeStartChildProcess Get system parameter error: ${JSON.stringify(err)}`);
        mpEnable = 'fail';
      }
    });
    afterEach(async () => {})
    afterAll(() => {
      hilog.info(0x0000, 'afterAll', 'afterAll start');
      wifiManager.enableWifi();
      hilog.info(0x0000, 'afterAll', 'afterAll end');
    })
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIExtensionContext_0100
     * @tc.number SUB_Ability_AbilityRuntime_UIExtensionContext_0100
     * @tc.desc   When the input parameter want is null, an error code is returned(startability).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_0100', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_0100";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_0100] start ');
          let entryAbility1 = eventBusPlue.onWait("EntryAbility1_onDestroy");
          let uiExtension = eventBusPlue.onWait("UIExtension_onDestroy");
          let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
            events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_0100_event"]
          };
          await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
            console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_0100] commonEventSubscribeInfo success: ');
            sub = subscriber;
            hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
            commonEventManager.subscribe(sub, async (err, commonEventData) => {
              hilog.info(0x0000, tag, '%{public}s', `tag  subscribecllback` + JSON.stringify(commonEventData));
              hilog.info(0x0000, tag, '%{public}s', `SecondAbility want:  ${JSON.stringify(commonEventData.parameters?.data)}`);
              try {
                expect(commonEventData.parameters?.result).assertEqual(401);
              } catch {
              }
              commonEventManager.publish("teminate",() => {});
              commonEventManager.unsubscribe(subscriber, (err, data) => {});
              await Promise.all([entryAbility1,uiExtension]);
              done();
            });
            testAbilityContext.startAbility({
              bundleName:"com.acts.uiextensioncontexttest",
              abilityName:"EntryAbility1",
              parameters:{
                "case":tag
              }
            },(err, data)=>{
              console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_0100] startAbility result ' + err?.code);
            })
          });
      } else if (mpEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIExtensionContext_0200
     * @tc.number SUB_Ability_AbilityRuntime_UIExtensionContext_0200
     * @tc.desc   When the input parameter want is null, an error code is returned(startability options).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_0200', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_0200";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_0200] start ');
        let entryAbility1 = eventBusPlue.onWait("EntryAbility1_onDestroy");
        let uiExtension = eventBusPlue.onWait("UIExtension_onDestroy");
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_0200_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_0200] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, async (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {});
            await Promise.all([entryAbility1,uiExtension]);
            done();
          });
          testAbilityContext.startAbility({
            bundleName:"com.acts.uiextensioncontexttest",
            abilityName:"EntryAbility1",
            parameters:{
              "case":tag
            }
          },(err, data)=>{
            console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_0200] startAbility result ' + err?.code);
          })
        });
      } else if (mpEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIExtensionContext_0300
     * @tc.number SUB_Ability_AbilityRuntime_UIExtensionContext_0300
     * @tc.desc   When the input parameter want is null, an error code is returned(startability options promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_0300', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_0300";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_0300] start ');
        let entryAbility1 = eventBusPlue.onWait("EntryAbility1_onDestroy");
        let uiExtension = eventBusPlue.onWait("UIExtension_onDestroy");
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_0300_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_0300] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, async (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {});
            await Promise.all([entryAbility1,uiExtension]);
            done();
          });
          testAbilityContext.startAbility({
            bundleName:"com.acts.uiextensioncontexttest",
            abilityName:"EntryAbility1",
            parameters:{
              "case":tag
            }
          },(err, data)=>{
            console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_0300] startAbility result ' + err?.code);
          })
        });
      } else if (mpEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIExtensionContext_0400
     * @tc.number SUB_Ability_AbilityRuntime_UIExtensionContext_0400
     * @tc.desc   When the input parameter want is null, an error code is returned(oplink promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_0400', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_0400";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_0400] start ');
        let entryAbility1 = eventBusPlue.onWait("EntryAbility1_onDestroy");
        let uiExtension = eventBusPlue.onWait("UIExtension_onDestroy");
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_0400_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_0400] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, async (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {});
            await Promise.all([entryAbility1,uiExtension]);
            done();
          });
          testAbilityContext.startAbility({
            bundleName:"com.acts.uiextensioncontexttest",
            abilityName:"EntryAbility1",
            parameters:{
              "case":tag
            }
          },(err, data)=>{
            console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_0400] startAbility result ' + err?.code);
          })
        });
      } else if (mpEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIExtensionContext_0500
     * @tc.number SUB_Ability_AbilityRuntime_UIExtensionContext_0500
     * @tc.desc   When the input parameter want is null, an error code is returned(startAbilityForResult callback).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_0500', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_0500";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_0500] start ');
        let entryAbility1 = eventBusPlue.onWait("EntryAbility1_onDestroy");
        let uiExtension = eventBusPlue.onWait("UIExtension_onDestroy");
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_0500_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_0500] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, async (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {});
            await Promise.all([entryAbility1,uiExtension]);
            done();
          });
          testAbilityContext.startAbility({
            bundleName:"com.acts.uiextensioncontexttest",
            abilityName:"EntryAbility1",
            parameters:{
              "case":tag
            }
          },(err, data)=>{
            console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_0500] startAbility result ' + err?.code);
          })
        });
      } else if (mpEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIExtensionContext_0600
     * @tc.number SUB_Ability_AbilityRuntime_UIExtensionContext_0600
     * @tc.desc   When the input parameter want is null, an error code is returned(startAbilityForResult options callback).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_0600', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_0600";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_0600] start ');
        let entryAbility1 = eventBusPlue.onWait("EntryAbility1_onDestroy");
        let uiExtension = eventBusPlue.onWait("UIExtension_onDestroy");
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_0600_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_0600] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, async (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {});
            await Promise.all([entryAbility1,uiExtension]);
            done();
          });
          testAbilityContext.startAbility({
            bundleName:"com.acts.uiextensioncontexttest",
            abilityName:"EntryAbility1",
            parameters:{
              "case":tag
            }
          },(err, data)=>{
            console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_0600] startAbility result ' + err?.code);
          })
        });
      } else if (mpEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIExtensionContext_0700
     * @tc.number SUB_Ability_AbilityRuntime_UIExtensionContext_0700
     * @tc.desc   When the input parameter want is null, an error code is returned(startAbilityForResult options promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_0700', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_0700";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_0700] start ');
        let entryAbility1 = eventBusPlue.onWait("EntryAbility1_onDestroy");
        let uiExtension = eventBusPlue.onWait("UIExtension_onDestroy");
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_0700_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_0700] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, async (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {});
            await Promise.all([entryAbility1,uiExtension]);
            done();
          });
          testAbilityContext.startAbility({
            bundleName:"com.acts.uiextensioncontexttest",
            abilityName:"EntryAbility1",
            parameters:{
              "case":tag
            }
          },(err, data)=>{
            console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_0700] startAbility result ' + err?.code);
          })
        });
      } else if (mpEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIExtensionContext_0800
     * @tc.number SUB_Ability_AbilityRuntime_UIExtensionContext_0800
     * @tc.desc   When the input parameter want is null, an error code is returned(connectServiceExtensionAbility).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_0800', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_0800";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_0800] start ');
        let entryAbility1 = eventBusPlue.onWait("EntryAbility1_onDestroy");
        let uiExtension = eventBusPlue.onWait("UIExtension_onDestroy");
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_0800_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_0800] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, async (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {});
            await Promise.all([entryAbility1,uiExtension]);
            done();
          });
          testAbilityContext.startAbility({
            bundleName:"com.acts.uiextensioncontexttest",
            abilityName:"EntryAbility1",
            parameters:{
              "case":tag
            }
          },(err, data)=>{
            console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_0800] startAbility result ' + err?.code);
          })
        });
      } else if (mpEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIExtensionContext_0900
     * @tc.number SUB_Ability_AbilityRuntime_UIExtensionContext_0900
     * @tc.desc   When the input parameter want is null, an error code is returned(disconnectServiceExtensionAbility callback).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_0900', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_0900";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_0900] start ');
        let entryAbility1 = eventBusPlue.onWait("EntryAbility1_onDestroy");
        let uiExtension = eventBusPlue.onWait("UIExtension_onDestroy");
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_0900_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_0900] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, async (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {});
            await Promise.all([entryAbility1,uiExtension]);
            done();
          });
          testAbilityContext.startAbility({
            bundleName:"com.acts.uiextensioncontexttest",
            abilityName:"EntryAbility1",
            parameters:{
              "case":tag
            }
          },(err, data)=>{
            console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_0900] startAbility result ' + err?.code);
          })
        });
      } else if (mpEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIExtensionContext_1000
     * @tc.number SUB_Ability_AbilityRuntime_UIExtensionContext_1000
     * @tc.desc   When the input parameter want is null, an error code is returned(disconnectServiceExtensionAbility promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_1000', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_1000";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_1000] start ');
        let entryAbility1 = eventBusPlue.onWait("EntryAbility1_onDestroy");
        let uiExtension = eventBusPlue.onWait("UIExtension_onDestroy");
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_1000_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_1000] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, async (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {});
            await Promise.all([entryAbility1,uiExtension]);
            done();
          });
          testAbilityContext.startAbility({
            bundleName:"com.acts.uiextensioncontexttest",
            abilityName:"EntryAbility1",
            parameters:{
              "case":tag
            }
          },(err, data)=>{
            console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_1000] startAbility result ' + err?.code);
          })
        });
      } else if (mpEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIExtensionContext_1100
     * @tc.number SUB_Ability_AbilityRuntime_UIExtensionContext_1100
     * @tc.desc   When the input parameter want is null, an error code is returned(terminateSelfWithResult callback).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_1100', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_1100";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_1100] start ');
        let entryAbility1 = eventBusPlue.onWait("EntryAbility1_onDestroy");
        let uiExtension = eventBusPlue.onWait("UIExtension_onDestroy");
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_1100_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_1100] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, async (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {});
            await Promise.all([entryAbility1,uiExtension]);
            done();
          });
          testAbilityContext.startAbility({
            bundleName:"com.acts.uiextensioncontexttest",
            abilityName:"EntryAbility1",
            parameters:{
              "case":tag
            }
          },(err, data)=>{
            console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_1200] startAbility result ' + err?.code);
          })
        });
      } else if (mpEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIExtensionContext_1200
     * @tc.number SUB_Ability_AbilityRuntime_UIExtensionContext_1200
     * @tc.desc   When the input parameter want is null, an error code is returned(terminateSelfWithResult promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_1200', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_1200";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_1200] start ');
        let entryAbility1 = eventBusPlue.onWait("EntryAbility1_onDestroy");
        let uiExtension = eventBusPlue.onWait("UIExtension_onDestroy");
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_1200_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_1200] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, async (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {});
            await Promise.all([entryAbility1,uiExtension]);
            done();
          });
          testAbilityContext.startAbility({
            bundleName:"com.acts.uiextensioncontexttest",
            abilityName:"EntryAbility1",
            parameters:{
              "case":tag
            }
          },(err, data)=>{
            console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_1200] startAbility result ' + err?.code);
          })
        });
      } else if (mpEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIExtensionContext_1300
     * @tc.number SUB_Ability_AbilityRuntime_UIExtensionContext_1300
     * @tc.desc   When the input parameter want is null, an error code is returned(openAtomicService promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_1300', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_1300";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_1300] start ');
        let entryAbility1 = eventBusPlue.onWait("EntryAbility1_onDestroy");
        let uiExtension = eventBusPlue.onWait("UIExtension_onDestroy");
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_1300_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_1200] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, async (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {});
            await Promise.all([entryAbility1,uiExtension]);
            done();
          });
          testAbilityContext.startAbility({
            bundleName:"com.acts.uiextensioncontexttest",
            abilityName:"EntryAbility1",
            parameters:{
              "case":tag
            }
          },(err, data)=>{
            console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_1300] startAbility result ' + err?.code);
          })
        });
      } else if (mpEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIExtensionContext_1400
     * @tc.number SUB_Ability_AbilityRuntime_UIExtensionContext_1400
     * @tc.desc   When the input parameter want is null, an error code is returned(startUIServiceExtensionAbility promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_1400', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_1400";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_1400] start ');
        let entryAbility1 = eventBusPlue.onWait("EntryAbility1_onDestroy");
        let uiExtension = eventBusPlue.onWait("UIExtension_onDestroy");
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_1400_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_1400] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, async (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {});
            await Promise.all([entryAbility1,uiExtension]);
            done();
          });
          testAbilityContext.startAbility({
            bundleName:"com.acts.uiextensioncontexttest",
            abilityName:"EntryAbility1",
            parameters:{
              "case":tag
            }
          },(err, data)=>{
            console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_1400] startAbility result ' + err?.code);
          })
        });
      } else if (mpEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIExtensionContext_1500
     * @tc.number SUB_Ability_AbilityRuntime_UIExtensionContext_1500
     * @tc.desc   When the input parameter want is null, an error code is returned(connectUIServiceExtensionAbility promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_1500', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_1500";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_1500] start ');
        let entryAbility1 = eventBusPlue.onWait("EntryAbility1_onDestroy");
        let uiExtension = eventBusPlue.onWait("UIExtension_onDestroy");
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_1500_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_1400] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, async (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {});
            await Promise.all([entryAbility1,uiExtension]);
            done();
          });
          testAbilityContext.startAbility({
            bundleName:"com.acts.uiextensioncontexttest",
            abilityName:"EntryAbility1",
            parameters:{
              "case":tag
            }
          },(err, data)=>{
            console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_1500] startAbility result ' + err?.code);
          })
        });
      } else if (mpEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIExtensionContext_1600
     * @tc.number SUB_Ability_AbilityRuntime_UIExtensionContext_1600
     * @tc.desc   When the input parameter want is null, an error code is returned(disconnectUIServiceExtensionAbility promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_1600', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_1600";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_1600] start ');
        let entryAbility1 = eventBusPlue.onWait("EntryAbility1_onDestroy");
        let uiExtension = eventBusPlue.onWait("UIExtension_onDestroy");
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_1600_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_1400] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, async (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {});
            await Promise.all([entryAbility1,uiExtension]);
            done();
          });
          testAbilityContext.startAbility({
            bundleName:"com.acts.uiextensioncontexttest",
            abilityName:"EntryAbility1",
            parameters:{
              "case":tag
            }
          },(err, data)=>{
            console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_1600] startAbility result ' + err?.code);
          })
        });
      } else if (mpEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIExtensionContext_1700
     * @tc.number SUB_Ability_AbilityRuntime_UIExtensionContext_1700
     * @tc.desc   When the input parameter want is null, an error code is returned(setColorMode).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_1700', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_1700";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_1700] start ');
        let entryAbility1 = eventBusPlue.onWait("EntryAbility1_onDestroy");
        let uiExtension = eventBusPlue.onWait("UIExtension_onDestroy");
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_1700_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_1700] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, async (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {});
            await Promise.all([entryAbility1,uiExtension]);
            done();
          });
          testAbilityContext.startAbility({
            bundleName:"com.acts.uiextensioncontexttest",
            abilityName:"EntryAbility1",
            parameters:{
              "case":tag
            }
          },(err, data)=>{
            console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_1700] startAbility result ' + err?.code);
          })
        });
      } else if (mpEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    });


    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIExtensionContext_1800
     * @tc.number SUB_Ability_AbilityRuntime_UIExtensionContext_1800
     * @tc.desc   When the input parameter want is null, an error code is returned(startability).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_1800', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_1800";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_1800] start ');
        let entryAbility1 = eventBusPlue.onWait("EntryAbility1_onDestroy");
        let uiExtension = eventBusPlue.onWait("UIExtension_onDestroy");
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_1800_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_0100] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, async (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag  subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `SecondAbility want:  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {});
            await Promise.all([entryAbility1,uiExtension]);
            done();
          });
          testAbilityContext.startAbility({
            bundleName:"com.acts.uiextensioncontexttest",
            abilityName:"EntryAbility1",
            parameters:{
              "case":tag
            }
          },(err, data)=>{
            console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_1800] startAbility result ' + err?.code);
          })
        });
      } else if (mpEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIExtensionContext_4200
     * @tc.number SUB_Ability_AbilityRuntime_UIExtensionContext_4200
     * @tc.desc   Test openLink with empty string link parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_4200', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_4200";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_openLink_PARAM_001] start ');
        let entryAbility1 = eventBusPlue.onWait("EntryAbility1_onDestroy");
        let uiExtension = eventBusPlue.onWait("UIExtension_onDestroy");
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_4200_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_openLink_PARAM_001] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, async (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {});
            await Promise.all([entryAbility1,uiExtension]);
            done();
          });
          testAbilityContext.startAbility({
            bundleName:"com.acts.uiextensioncontexttest",
            abilityName:"EntryAbility1",
            parameters:{
              "case":tag
            }
          },(err, data)=>{
            console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_openLink_PARAM_001] startAbility result ' + err?.code);
          })
        });
      } else if (mpEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIExtensionContext_1900
     * @tc.number SUB_Ability_AbilityRuntime_UIExtensionContext_1900
     * @tc.desc   When the input parameter want is null, an error code is returned(startability options).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_1900', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_1900";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_1900] start ');
        let entryAbility1 = eventBusPlue.onWait("EntryAbility1_onDestroy");
        let uiExtension = eventBusPlue.onWait("UIExtension_onDestroy");
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_1900_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_1900] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, async (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {});
            await Promise.all([entryAbility1,uiExtension]);
            done();
          });
          testAbilityContext.startAbility({
            bundleName:"com.acts.uiextensioncontexttest",
            abilityName:"EntryAbility1",
            parameters:{
              "case":tag
            }
          },(err, data)=>{
            console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_1900] startAbility result ' + err?.code);
          })
        });
      } else if (mpEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIExtensionContext_2000
     * @tc.number SUB_Ability_AbilityRuntime_UIExtensionContext_2000
     * @tc.desc   When the input parameter want is null, an error code is returned(startability options promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_2000', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_2000";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_2000] start ');
        let entryAbility1 = eventBusPlue.onWait("EntryAbility1_onDestroy");
        let uiExtension = eventBusPlue.onWait("UIExtension_onDestroy");
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_2000_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_0300] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, async (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {});
            await Promise.all([entryAbility1,uiExtension]);
            done();
          });
          testAbilityContext.startAbility({
            bundleName:"com.acts.uiextensioncontexttest",
            abilityName:"EntryAbility1",
            parameters:{
              "case":tag
            }
          },(err, data)=>{
            console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_2000] startAbility result ' + err?.code);
          })
        });
      } else if (mpEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIExtensionContext_2100
     * @tc.number SUB_Ability_AbilityRuntime_UIExtensionContext_2100
     * @tc.desc   When the input parameter want is null, an error code is returned(oplink promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_2100', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_2100";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_2100] start ');
        let entryAbility1 = eventBusPlue.onWait("EntryAbility1_onDestroy");
        let uiExtension = eventBusPlue.onWait("UIExtension_onDestroy");
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_2100_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_2100] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, async (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {});
            await Promise.all([entryAbility1,uiExtension]);
            done();
          });
          testAbilityContext.startAbility({
            bundleName:"com.acts.uiextensioncontexttest",
            abilityName:"EntryAbility1",
            parameters:{
              "case":tag
            }
          },(err, data)=>{
            console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_2100] startAbility result ' + err?.code);
          })
        });
      } else if (mpEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIExtensionContext_2200
     * @tc.number SUB_Ability_AbilityRuntime_UIExtensionContext_2200
     * @tc.desc   When the input parameter want is null, an error code is returned(startAbilityForResult callback).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_2200', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_2200";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_2200] start ');
        let entryAbility1 = eventBusPlue.onWait("EntryAbility1_onDestroy");
        let uiExtension = eventBusPlue.onWait("UIExtension_onDestroy");
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_2200_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_2200] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, async (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {});
            await Promise.all([entryAbility1,uiExtension]);
            done();
          });
          testAbilityContext.startAbility({
            bundleName:"com.acts.uiextensioncontexttest",
            abilityName:"EntryAbility1",
            parameters:{
              "case":tag
            }
          },(err, data)=>{
            console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_2200] startAbility result ' + err?.code);
          })
        });
      } else if (mpEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIExtensionContext_2300
     * @tc.number SUB_Ability_AbilityRuntime_UIExtensionContext_2300
     * @tc.desc   When the input parameter want is null, an error code is returned(startAbilityForResult options callback).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_2300', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_2300";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_0600] start ');
        let entryAbility1 = eventBusPlue.onWait("EntryAbility1_onDestroy");
        let uiExtension = eventBusPlue.onWait("UIExtension_onDestroy");
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_2300_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_2300] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, async (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {});
            await Promise.all([entryAbility1,uiExtension]);
            done();
          });
          testAbilityContext.startAbility({
            bundleName:"com.acts.uiextensioncontexttest",
            abilityName:"EntryAbility1",
            parameters:{
              "case":tag
            }
          },(err, data)=>{
            console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_2300] startAbility result ' + err?.code);
          })
        });
      } else if (mpEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIExtensionContext_2400
     * @tc.number SUB_Ability_AbilityRuntime_UIExtensionContext_2400
     * @tc.desc   When the input parameter want is null, an error code is returned(startAbilityForResult options promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_2400', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_2400";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_2400] start ');
        let entryAbility1 = eventBusPlue.onWait("EntryAbility1_onDestroy");
        let uiExtension = eventBusPlue.onWait("UIExtension_onDestroy");
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_2400_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_2400] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, async (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {});
            await Promise.all([entryAbility1,uiExtension]);
            done();
          });
          testAbilityContext.startAbility({
            bundleName:"com.acts.uiextensioncontexttest",
            abilityName:"EntryAbility1",
            parameters:{
              "case":tag
            }
          },(err, data)=>{
            console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_2400] startAbility result ' + err?.code);
          })
        });
      } else if (mpEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIExtensionContext_2500
     * @tc.number SUB_Ability_AbilityRuntime_UIExtensionContext_2500
     * @tc.desc   When the input parameter want is null, an error code is returned(connectServiceExtensionAbility).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_2500', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_2500";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_2500] start ');
        let entryAbility1 = eventBusPlue.onWait("EntryAbility1_onDestroy");
        let uiExtension = eventBusPlue.onWait("UIExtension_onDestroy");
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_2500_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_2500] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, async (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {});
            await Promise.all([entryAbility1,uiExtension]);
            done();
          });
          testAbilityContext.startAbility({
            bundleName:"com.acts.uiextensioncontexttest",
            abilityName:"EntryAbility1",
            parameters:{
              "case":tag
            }
          },(err, data)=>{
            console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_2500] startAbility result ' + err?.code);
          })
        });
      } else if (mpEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIExtensionContext_2600
     * @tc.number SUB_Ability_AbilityRuntime_UIExtensionContext_2600
     * @tc.desc   When the input parameter want is null, an error code is returned(disconnectServiceExtensionAbility callback).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_2600', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_2600";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_2600] start ');
        let entryAbility1 = eventBusPlue.onWait("EntryAbility1_onDestroy");
        let uiExtension = eventBusPlue.onWait("UIExtension_onDestroy");
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_2600_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_2600] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, async (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {});
            await Promise.all([entryAbility1,uiExtension]);
            done();
          });
          testAbilityContext.startAbility({
            bundleName:"com.acts.uiextensioncontexttest",
            abilityName:"EntryAbility1",
            parameters:{
              "case":tag
            }
          },(err, data)=>{
            console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_2600] startAbility result ' + err?.code);
          })
        });
      } else if (mpEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIExtensionContext_2700
     * @tc.number SUB_Ability_AbilityRuntime_UIExtensionContext_2700
     * @tc.desc   When the input parameter want is null, an error code is returned(disconnectServiceExtensionAbility promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_2700', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_2700";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_1000] start ');
        let entryAbility1 = eventBusPlue.onWait("EntryAbility1_onDestroy");
        let uiExtension = eventBusPlue.onWait("UIExtension_onDestroy");
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_2700_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_2700] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, async (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {});
            await Promise.all([entryAbility1,uiExtension]);
            done();
          });
          testAbilityContext.startAbility({
            bundleName:"com.acts.uiextensioncontexttest",
            abilityName:"EntryAbility1",
            parameters:{
              "case":tag
            }
          },(err, data)=>{
            console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_2700] startAbility result ' + err?.code);
          })
        });
      } else if (mpEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIExtensionContext_2800
     * @tc.number SUB_Ability_AbilityRuntime_UIExtensionContext_2800
     * @tc.desc   When the input parameter want is null, an error code is returned(terminateSelfWithResult callback).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_2800', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_2800";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_2800] start ');
        let entryAbility1 = eventBusPlue.onWait("EntryAbility1_onDestroy");
        let uiExtension = eventBusPlue.onWait("UIExtension_onDestroy");
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_2800_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_2800] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, async (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {});
            await Promise.all([entryAbility1,uiExtension]);
            done();
          });
          testAbilityContext.startAbility({
            bundleName:"com.acts.uiextensioncontexttest",
            abilityName:"EntryAbility1",
            parameters:{
              "case":tag
            }
          },(err, data)=>{
            console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_2800] startAbility result ' + err?.code);
          })
        });
      } else if (mpEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIExtensionContext_2900
     * @tc.number SUB_Ability_AbilityRuntime_UIExtensionContext_2900
     * @tc.desc   When the input parameter want is null, an error code is returned(terminateSelfWithResult promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_2900', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_2900";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_2900] start ');
        let entryAbility1 = eventBusPlue.onWait("EntryAbility1_onDestroy");
        let uiExtension = eventBusPlue.onWait("UIExtension_onDestroy");
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_2900_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_2900] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, async (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {});
            await Promise.all([entryAbility1,uiExtension]);
            done();
          });
          testAbilityContext.startAbility({
            bundleName:"com.acts.uiextensioncontexttest",
            abilityName:"EntryAbility1",
            parameters:{
              "case":tag
            }
          },(err, data)=>{
            console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_2900] startAbility result ' + err?.code);
          })
        });
      } else if (mpEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIExtensionContext_3000
     * @tc.number SUB_Ability_AbilityRuntime_UIExtensionContext_3000
     * @tc.desc   When the input parameter want is null, an error code is returned(openAtomicService promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_3000', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_3000";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_3000] start ');
        let entryAbility1 = eventBusPlue.onWait("EntryAbility1_onDestroy");
        let uiExtension = eventBusPlue.onWait("UIExtension_onDestroy");
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_3000_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_3000] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, async (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {});
            await Promise.all([entryAbility1,uiExtension]);
            done();
          });
          testAbilityContext.startAbility({
            bundleName:"com.acts.uiextensioncontexttest",
            abilityName:"EntryAbility1",
            parameters:{
              "case":tag
            }
          },(err, data)=>{
            console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_3000] startAbility result ' + err?.code);
          })
        });
      } else if (mpEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIExtensionContext_3100
     * @tc.number SUB_Ability_AbilityRuntime_UIExtensionContext_3100
     * @tc.desc   When the input parameter want is null, an error code is returned(startUIServiceExtensionAbility promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_3100', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_3100";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_3100] start ');
        let entryAbility1 = eventBusPlue.onWait("EntryAbility1_onDestroy");
        let uiExtension = eventBusPlue.onWait("UIExtension_onDestroy");
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_3100_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_3100] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, async (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {});
            await Promise.all([entryAbility1,uiExtension]);
            done();
          });
          testAbilityContext.startAbility({
            bundleName:"com.acts.uiextensioncontexttest",
            abilityName:"EntryAbility1",
            parameters:{
              "case":tag
            }
          },(err, data)=>{
            console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_3100] startAbility result ' + err?.code);
          })
        });
      } else if (mpEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIExtensionContext_3200
     * @tc.number SUB_Ability_AbilityRuntime_UIExtensionContext_3200
     * @tc.desc   When the input parameter want is null, an error code is returned(connectUIServiceExtensionAbility promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_3200', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_3200";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_3200] start ');
        let entryAbility1 = eventBusPlue.onWait("EntryAbility1_onDestroy");
        let uiExtension = eventBusPlue.onWait("UIExtension_onDestroy");
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_3200_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_3200] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, async (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {});
            await Promise.all([entryAbility1,uiExtension]);
            done();
          });
          testAbilityContext.startAbility({
            bundleName:"com.acts.uiextensioncontexttest",
            abilityName:"EntryAbility1",
            parameters:{
              "case":tag
            }
          },(err, data)=>{
            console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_3200] startAbility result ' + err?.code);
          })
        });
        
      } else if (mpEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIExtensionContext_3300
     * @tc.number SUB_Ability_AbilityRuntime_UIExtensionContext_3300
     * @tc.desc   When the input parameter want is null, an error code is returned(disconnectUIServiceExtensionAbility promise).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_3300', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_3300";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_3300] start ');
        let entryAbility1 = eventBusPlue.onWait("EntryAbility1_onDestroy");
        let uiExtension = eventBusPlue.onWait("UIExtension_onDestroy");
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_3300_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_1400] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, async (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {});
            await Promise.all([entryAbility1,uiExtension]);
            done();
          });
          testAbilityContext.startAbility({
            bundleName:"com.acts.uiextensioncontexttest",
            abilityName:"EntryAbility1",
            parameters:{
              "case":tag
            }
          },(err, data)=>{
            console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_3300] startAbility result ' + err?.code);
          })
        });
      } else if (mpEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIExtensionContext_3400
     * @tc.number SUB_Ability_AbilityRuntime_UIExtensionContext_3400
     * @tc.desc   When the input parameter want is null, an error code is returned(setColorMode).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_3400', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_3400";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_3400] start ');
        let entryAbility1 = eventBusPlue.onWait("EntryAbility1_onDestroy");
        let uiExtension = eventBusPlue.onWait("UIExtension_onDestroy");
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_3400_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_3400] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, async (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {});
            await Promise.all([entryAbility1,uiExtension]);
            done();
          });
          testAbilityContext.startAbility({
            bundleName:"com.acts.uiextensioncontexttest",
            abilityName:"EntryAbility1",
            parameters:{
              "case":tag
            }
          },(err, data)=>{
            console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_3400] startAbility result ' + err?.code);
          })
        });
      } else if (mpEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIExtensionContext_3500
     * @tc.number SUB_Ability_AbilityRuntime_UIExtensionContext_3500
     * @tc.desc   When the input parameter want is null, an error code is returned(openAtomicService).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_3500', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_3500";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_3500] start ');
        let entryAbility1 = eventBusPlue.onWait("EntryAbility1_onDestroy");
        let uiExtension = eventBusPlue.onWait("UIExtension_onDestroy");
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_3500_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_3500] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, async (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate", () => { });
            commonEventManager.unsubscribe(subscriber, (err, data) => {});
            await Promise.all([entryAbility1,uiExtension]);
            done();
          });
          testAbilityContext.startAbility({
            bundleName: "com.acts.uiextensioncontexttest",
            abilityName: "EntryAbility1",
            parameters: {
              "case": tag
            }
          }, (err, data) => {
            console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_3500] startAbility result ' + err?.code);
          })
        });
      } else if (mpEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIExtensionContext_3600
     * @tc.number SUB_Ability_AbilityRuntime_UIExtensionContext_3600
     * @tc.desc   When the input parameter want is null, an error code is returned(openlink).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_3600', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_3600";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_3600] start ');
        let entryAbility1 = eventBusPlue.onWait("EntryAbility1_onDestroy");
        let uiExtension = eventBusPlue.onWait("UIExtension_onDestroy");
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_3600_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_3600] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, async (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate", () => { });
            commonEventManager.unsubscribe(subscriber, (err, data) => {});
            await Promise.all([entryAbility1,uiExtension]);
            done();
          });
          testAbilityContext.startAbility({
            bundleName: "com.acts.uiextensioncontexttest",
            abilityName: "EntryAbility1",
            parameters: {
              "case": tag
            }
          }, (err, data) => {
            console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_3600] startAbility result ' + err?.code);
          })
        });
      } else if (mpEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIExtensionContext_3700
     * @tc.number SUB_Ability_AbilityRuntime_UIExtensionContext_3700
     * @tc.desc   When the input parameter want is null, an error code is returned(loadcontent).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_3700', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_3700";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_3700] start ');
        let entryAbility1 = eventBusPlue.onWait("EntryAbility1_onDestroy");
        let uiExtension = eventBusPlue.onWait("UIExtension_onDestroy");
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_3700_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_3700] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, async (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate", () => { });
            commonEventManager.unsubscribe(subscriber, (err, data) => {});
            await Promise.all([entryAbility1,uiExtension]);
            done();
          });
          testAbilityContext.startAbility({
            bundleName: "com.acts.uiextensioncontexttest",
            abilityName: "EntryAbility1",
            parameters: {
              "case": tag
            }
          }, (err, data) => {
            console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_3700] startAbility result ' + err?.code);
          })
        });
      } else if (mpEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIExtensionContext_3800
     * @tc.number SUB_Ability_AbilityRuntime_UIExtensionContext_3800
     * @tc.desc   When the input parameter want is null, an error code is returned(openAtomicService).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_3800', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_3800";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_3800] start ');
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_3800_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_3800] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, async (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate", () => { });
            commonEventManager.unsubscribe(subscriber, (err, data) => {});
            await eventBusPlue.onWait("EntryAbility1_onDestroy")
            done();
          });
          testAbilityContext.startAbility({
            bundleName: "com.acts.uiextensioncontexttest",
            abilityName: "EntryAbility1",
            parameters: {
              "case": tag
            }
          }, (err, data) => {
            console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_3800] startAbility result ' + err?.code);
          })
        });
      } else if (mpEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
     });
     
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIExtensionContext_3900
     * @tc.number SUB_Ability_AbilityRuntime_UIExtensionContext_3900
     * @tc.desc   Test setColorMode with COLOR_MODE_NOT_SET enumeration value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_3900', Level.LEVEL1, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_3900";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_3900] start ');
        let entryAbility1 = eventBusPlue.onWait("EntryAbility1_onDestroy");
        let uiExtension = eventBusPlue.onWait("UIExtension_onDestroy");
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_3900_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_3900] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, async (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual("success");
              expect(commonEventData.parameters?.colorMode != -1).assertTrue(); // COLOR_MODE_NOT_SET = -1
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {});
            await Promise.all([entryAbility1,uiExtension]);
            done();
          });
          testAbilityContext.startAbility({
            bundleName:"com.acts.uiextensioncontexttest",
            abilityName:"EntryAbility1",
            parameters:{
              "case":tag
            }
          },(err, data)=>{
            console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_3900] startAbility result ' + err?.code);
          })
        });
      } else if (mpEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIExtensionContext_4000
     * @tc.number SUB_Ability_AbilityRuntime_UIExtensionContext_4000
     * @tc.desc   Test setColorMode with COLOR_MODE_DARK enumeration value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_4000', Level.LEVEL1, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_4000";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_4000] start ');
        let entryAbility1 = eventBusPlue.onWait("EntryAbility1_onDestroy");
        let uiExtension = eventBusPlue.onWait("UIExtension_onDestroy");
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_4000_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_4000] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, async (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual("success");
              expect(commonEventData.parameters?.colorMode).assertEqual(0); // COLOR_MODE_DARK = 0
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {});
            await Promise.all([entryAbility1,uiExtension]);
            done();
          });
          testAbilityContext.startAbility({
            bundleName:"com.acts.uiextensioncontexttest",
            abilityName:"EntryAbility1",
            parameters:{
              "case":tag
            }
          },(err, data)=>{
            console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_4000] startAbility result ' + err?.code);
          })
        });
      } else if (mpEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIExtensionContext_4100
     * @tc.number SUB_Ability_AbilityRuntime_UIExtensionContext_4100
     * @tc.desc   Test setColorMode with COLOR_MODE_LIGHT enumeration value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_4100', Level.LEVEL1, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_4100";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_4100] start ');
        let entryAbility1 = eventBusPlue.onWait("EntryAbility1_onDestroy");
        let uiExtension = eventBusPlue.onWait("UIExtension_onDestroy");
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_4100_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_4100] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, async (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual("success");
              expect(commonEventData.parameters?.colorMode).assertEqual(1); // COLOR_MODE_LIGHT = 1
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {});
            await Promise.all([entryAbility1,uiExtension]);
            done();
          });
          testAbilityContext.startAbility({
            bundleName:"com.acts.uiextensioncontexttest",
            abilityName:"EntryAbility1",
            parameters:{
              "case":tag
            }
          },(err, data)=>{
            console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_4100] startAbility result ' + err?.code);
          })
        });
      } else if (mpEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIExtensionContext_4500
     * @tc.number SUB_Ability_AbilityRuntime_UIExtensionContext_4500
     * @tc.desc   Test openAtomicService with empty string appId parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_4500', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_4500";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_4500] start ');
        let entryAbility1 = eventBusPlue.onWait("EntryAbility1_onDestroy");
        let uiExtension = eventBusPlue.onWait("UIExtension_onDestroy");
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_4500_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_4500] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, async (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(16000050);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {});
            await Promise.all([entryAbility1,uiExtension]);
            done();
          });
          testAbilityContext.startAbility({
            bundleName:"com.acts.uiextensioncontexttest",
            abilityName:"EntryAbility1",
            parameters:{
              "case":tag
            }
          },(err, data)=>{
            console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_4500] startAbility result ' + err?.code);
          })
        });
      } else if (mpEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIExtensionContext_4600
     * @tc.number SUB_Ability_AbilityRuntime_UIExtensionContext_4600
     * @tc.desc   Test openAtomicService with null appId parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_4600', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_4600";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_4600] start ');
        let entryAbility1 = eventBusPlue.onWait("EntryAbility1_onDestroy");
        let uiExtension = eventBusPlue.onWait("UIExtension_onDestroy");
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_4600_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_4600] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, async (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {});
            await Promise.all([entryAbility1,uiExtension]);
            done();
          });
          testAbilityContext.startAbility({
            bundleName:"com.acts.uiextensioncontexttest",
            abilityName:"EntryAbility1",
            parameters:{
              "case":tag
            }
          },(err, data)=>{
            console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_4600] startAbility result ' + err?.code);
          })
        });
      } else if (mpEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIExtensionContext_4700
     * @tc.number SUB_Ability_AbilityRuntime_UIExtensionContext_4700
     * @tc.desc   Test openAtomicService with undefined appId parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_4700', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_4700";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_4700] start ');
        let entryAbility1 = eventBusPlue.onWait("EntryAbility1_onDestroy");
        let uiExtension = eventBusPlue.onWait("UIExtension_onDestroy");
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_4700_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_4700] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, async (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {});
            await Promise.all([entryAbility1,uiExtension]);
            done();
          });
          testAbilityContext.startAbility({
            bundleName:"com.acts.uiextensioncontexttest",
            abilityName:"EntryAbility1",
            parameters:{
              "case":tag
            }
          },(err, data)=>{
            console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_4700] startAbility result ' + err?.code);
          })
        });
      } else if (mpEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIExtensionContext_4800
     * @tc.number SUB_Ability_AbilityRuntime_UIExtensionContext_4800
     * @tc.desc   Test openAtomicService with valid appId and null options parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_4800', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_4800";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_4800] start ');
        let entryAbility1 = eventBusPlue.onWait("EntryAbility1_onDestroy");
        let uiExtension = eventBusPlue.onWait("UIExtension_onDestroy");
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_4800_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_4800] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, async (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(16000050);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {});
            await Promise.all([entryAbility1,uiExtension]);
            done();
          });
          testAbilityContext.startAbility({
            bundleName:"com.acts.uiextensioncontexttest",
            abilityName:"EntryAbility1",
            parameters:{
              "case":tag
            }
          },(err, data)=>{
            console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_4800] startAbility result ' + err?.code);
          })
        });
      } else if (mpEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIExtensionContext_4900
     * @tc.number SUB_Ability_AbilityRuntime_UIExtensionContext_4900
     * @tc.desc   Test openAtomicService with valid appId and undefined options parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_4900', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_4900";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_4900] start ');
        let entryAbility1 = eventBusPlue.onWait("EntryAbility1_onDestroy");
        let uiExtension = eventBusPlue.onWait("UIExtension_onDestroy");
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_4900_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_4900] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, async (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(16000050);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {});
            await Promise.all([entryAbility1,uiExtension]);
            done();
          });
          testAbilityContext.startAbility({
            bundleName:"com.acts.uiextensioncontexttest",
            abilityName:"EntryAbility1",
            parameters:{
              "case":tag
            }
          },(err, data)=>{
            console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_4900] startAbility result ' + err?.code);
          })
        });
      } else if (mpEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIExtensionContext_5000
     * @tc.number SUB_Ability_AbilityRuntime_UIExtensionContext_5000
     * @tc.desc   Test startAbility with valid want and null options parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_5000', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_5000";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_5000] start ');
        let entryAbility1 = eventBusPlue.onWait("EntryAbility2_onDestroy");
        let uiExtension = eventBusPlue.onWait("UIExtension_onDestroy");
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["AbilityRuntime_OptionResult"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_5000] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, async (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            try {
              expect(commonEventData.event).assertEqual('AbilityRuntime_OptionResult');
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {});
            await Promise.all([entryAbility1,uiExtension]);
            done();
          });
          testAbilityContext.startAbility({
            bundleName:"com.acts.uiextensioncontexttest",
            abilityName:"EntryAbility1",
            parameters:{
              "case":tag
            }
          },(err, data)=>{
            console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_5000] startAbility result ' + err?.code);
          })
        });
      } else if (mpEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIExtensionContext_5100
     * @tc.number SUB_Ability_AbilityRuntime_UIExtensionContext_5100
     * @tc.desc   Test startAbility with valid want and undefined options parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_5100', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_5100";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_5100] start ');
        let entryAbility1 = eventBusPlue.onWait("EntryAbility2_onDestroy");
        let uiExtension = eventBusPlue.onWait("UIExtension_onDestroy");
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["AbilityRuntime_OptionResult"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_5100] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, async (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            try {
              expect(commonEventData.event).assertEqual('AbilityRuntime_OptionResult');
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {});
            await Promise.all([entryAbility1,uiExtension]);
            done();
          });
          testAbilityContext.startAbility({
            bundleName:"com.acts.uiextensioncontexttest",
            abilityName:"EntryAbility1",
            parameters:{
              "case":tag
            }
          },(err, data)=>{
            console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_5100] startAbility result ' + err?.code);
          })
        });
      } else if (mpEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIExtensionContext_5400
     * @tc.number SUB_Ability_AbilityRuntime_UIExtensionContext_5400
     * @tc.desc   Test startAbilityForResult with valid want and null options parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_5400', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_5400";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_5400] start ');
        let entryAbility1 = eventBusPlue.onWait("EntryAbility2_onDestroy");
        let uiExtension = eventBusPlue.onWait("UIExtension_onDestroy");
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["AbilityRuntime_OptionResult"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_5400] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, async (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            try {
              expect(commonEventData.event).assertEqual('AbilityRuntime_OptionResult');
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {});
            await Promise.all([entryAbility1,uiExtension]);
            done();
          });
          testAbilityContext.startAbility({
            bundleName:"com.acts.uiextensioncontexttest",
            abilityName:"EntryAbility1",
            parameters:{
              "case":tag
            }
          },(err, data)=>{
            console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_5400] startAbility result ' + err?.code);
          })
        });
      } else if (mpEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIExtensionContext_5500
     * @tc.number SUB_Ability_AbilityRuntime_UIExtensionContext_5500
     * @tc.desc   Test startAbilityForResult with valid want and undefined options parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_5500', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_5500";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_5500] start ');
        let entryAbility1 = eventBusPlue.onWait("EntryAbility2_onDestroy");
        let uiExtension = eventBusPlue.onWait("UIExtension_onDestroy");
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["AbilityRuntime_OptionResult"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_5500] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, async (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            try {
              expect(commonEventData.event).assertEqual('AbilityRuntime_OptionResult');
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {});
            await Promise.all([entryAbility1,uiExtension]);
            done();
          });
          testAbilityContext.startAbility({
            bundleName:"com.acts.uiextensioncontexttest",
            abilityName:"EntryAbility1",
            parameters:{
              "case":tag
            }
          },(err, data)=>{
            console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_5500] startAbility result ' + err?.code);
          })
        });
      } else if (mpEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    });
    
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIAbilityContext_StartAbilty_0100
     * @tc.number SUB_Ability_AbilityRuntime_UIAbilityContext_StartAbilty_0100
     * @tc.desc   Test startAbilityforresult (promise) with valid want and null options parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIAbilityContext_StartAbilty_0100', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIAbilityContext_StartAbilty_0100";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIAbilityContext_StartAbilty_0100] start ');
        let entryAbility1 = eventBusPlue.onWait("EntryAbility1_onDestroy");
        let uiExtension = eventBusPlue.onWait("UIExtension_onDestroy");
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["AbilityRuntime_OptionResult"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIAbilityContext_StartAbilty_0100] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, async (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            try {
              expect(commonEventData.event).assertEqual('AbilityRuntime_OptionResult');
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {});
            await Promise.all([entryAbility1,uiExtension]);
            done();
          });
          testAbilityContext.startAbility({
            bundleName:"com.acts.uiextensioncontexttest",
            abilityName:"EntryAbility1",
            action:'result'
          }, null, (err, data)=>{
            console.info('====> [SUB_Ability_AbilityRuntime_UIAbilityContext_StartAbilty_0100] startAbility result ' + err?.code);
          })
        });
      } else if (mpEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    });
    
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIAbilityContext_StartAbilty_0200
     * @tc.number SUB_Ability_AbilityRuntime_UIAbilityContext_StartAbilty_0200
     * @tc.desc   Test startAbilityforresult (promise) with valid want and null options parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIAbilityContext_StartAbilty_0200', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIAbilityContext_StartAbilty_0200";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIAbilityContext_StartAbilty_0200] start ');
        let entryAbility1 = eventBusPlue.onWait("EntryAbility1_onDestroy");
        let uiExtension = eventBusPlue.onWait("UIExtension_onDestroy");
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["AbilityRuntime_OptionResult"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIAbilityContext_StartAbilty_0200] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, async (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            try {
              expect(commonEventData.event).assertEqual('AbilityRuntime_OptionResult');
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {});
            await Promise.all([entryAbility1,uiExtension]);
            done();
          });
          testAbilityContext.startAbility({
            bundleName:"com.acts.uiextensioncontexttest",
            abilityName:"EntryAbility1",
            action:'result'
          }, undefined, (err, data)=>{
            console.info('====> [SUB_Ability_AbilityRuntime_UIAbilityContext_StartAbilty_0200] startAbility result ' + err?.code);
          })
        });
      } else if (mpEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    });

    
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIAbilityContext_StartAbilty_0300
     * @tc.number SUB_Ability_AbilityRuntime_UIAbilityContext_StartAbilty_0300
     * @tc.desc   Test startAbilityforresult (promise) with valid want and null options parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIAbilityContext_StartAbilty_0300', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIAbilityContext_StartAbilty_0300";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIAbilityContext_StartAbilty_0300] start ');
        let entryAbility1 = eventBusPlue.onWait("EntryAbility1_onDestroy");
        let uiExtension = eventBusPlue.onWait("UIExtension_onDestroy");
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["AbilityRuntime_OptionResult"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIAbilityContext_StartAbilty_0300] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, async (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            try {
              expect(commonEventData.event).assertEqual('AbilityRuntime_OptionResult');
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {});
            await Promise.all([entryAbility1,uiExtension]);
            done();
          });
          testAbilityContext.startAbility({
            bundleName:"com.acts.uiextensioncontexttest",
            abilityName:"EntryAbility1",
            action:'result'
          }, null)
        });
      } else if (mpEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    });
    
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIAbilityContext_StartAbilty_0400
     * @tc.number SUB_Ability_AbilityRuntime_UIAbilityContext_StartAbilty_0400
     * @tc.desc   Test startAbilityforresult (promise) with valid want and null options parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIAbilityContext_StartAbilty_0400', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIAbilityContext_StartAbilty_0400";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIAbilityContext_StartAbilty_0400] start ');
        let entryAbility1 = eventBusPlue.onWait("EntryAbility1_onDestroy");
        let uiExtension = eventBusPlue.onWait("UIExtension_onDestroy");
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["AbilityRuntime_OptionResult"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIAbilityContext_StartAbilty_0400] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, async (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            try {
              expect(commonEventData.event).assertEqual('AbilityRuntime_OptionResult');
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {});
            await Promise.all([entryAbility1,uiExtension]);
            done();
          });
          testAbilityContext.startAbility({
            bundleName:"com.acts.uiextensioncontexttest",
            abilityName:"EntryAbility1",
            action:'result'
          }, undefined)
        });
      } else if (mpEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    });

    
    
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIAbilityContext_startAbilityForResult_0100
     * @tc.number SUB_Ability_AbilityRuntime_UIAbilityContext_startAbilityForResult_0100
     * @tc.desc   Test startAbilityforresult (promise) with valid want and null options parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIAbilityContext_startAbilityForResult_0100', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIAbilityContext_startAbilityForResult_0100";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIAbilityContext_startAbilityForResult_0100] start ');
        let entryAbility1 = eventBusPlue.onWait("EntryAbility1_onDestroy");
        let uiExtension = eventBusPlue.onWait("UIExtension_onDestroy");
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["AbilityRuntime_OptionResult"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIAbilityContext_startAbilityForResult_0100] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, async (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            try {
              expect(commonEventData.event).assertEqual('AbilityRuntime_OptionResult');
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {});
            await Promise.all([entryAbility1,uiExtension]);
            done();
          });
          testAbilityContext.startAbilityForResult({
            bundleName:"com.acts.uiextensioncontexttest",
            abilityName:"EntryAbility1",
            action:'result'
          }, null, (err, data)=>{
            console.info('====> [SUB_Ability_AbilityRuntime_UIAbilityContext_startAbilityForResult_0100] startAbility result ' + err?.code);
          })
        });
      } else if (mpEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    });
    
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_UIAbilityContext_startAbilityForResult_0200
     * @tc.number SUB_Ability_AbilityRuntime_UIAbilityContext_startAbilityForResult_0200
     * @tc.desc   Test startAbilityforresult (promise) with valid want and null options parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_UIAbilityContext_startAbilityForResult_0200', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIAbilityContext_startAbilityForResult_0200";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIAbilityContext_startAbilityForResult_0200] start ');
        let entryAbility1 = eventBusPlue.onWait("EntryAbility1_onDestroy");
        let uiExtension = eventBusPlue.onWait("UIExtension_onDestroy");
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["AbilityRuntime_OptionResult"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIAbilityContext_startAbilityForResult_0200] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, async (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            try {
              expect(commonEventData.event).assertEqual('AbilityRuntime_OptionResult');
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {});
            await Promise.all([entryAbility1,uiExtension]);
            done();
          });
          testAbilityContext.startAbilityForResult({
            bundleName:"com.acts.uiextensioncontexttest",
            abilityName:"EntryAbility1",
            action:'result'
          }, undefined, (err, data)=>{
            console.info('====> [SUB_Ability_AbilityRuntime_UIAbilityContext_startAbilityForResult_0200] startAbility result ' + err?.code);
          })
        });
      } else if (mpEnable === 'false') {
        console.log(`${tag} function not enable.`);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        console.log(`${tag} wrong param`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ContextType_0100
     * @tc.number SUB_Ability_AbilityRuntime_ContextType_0100
     * @tc.desc   Test UIAbilityContext is UIABILITY_CONTEXT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ContextType_0100', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_ContextType_0100";
      console.info('====> [SUB_Ability_AbilityRuntime_ContextType_0100] start ');
      let testAbilityContext: common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>('TestAbilityContext') as common.UIAbilityContext;
      let result = testAbilityContext.isContextOf(contextConstant.ContextType.UIABILITY_CONTEXT);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ContextType_0200
     * @tc.number SUB_Ability_AbilityRuntime_ContextType_0200
     * @tc.desc   Test UIAbilityContext not APPLICATION_CONTEXT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ContextType_0200', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_ContextType_0200";
      console.info('====> [SUB_Ability_AbilityRuntime_ContextType_0200] start ');
      let testAbilityContext: common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>('TestAbilityContext') as common.UIAbilityContext;
      let result = testAbilityContext.isContextOf(contextConstant.ContextType.APPLICATION_CONTEXT);
      expect(result).assertFalse();
      done();
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ContextType_0300
     * @tc.number SUB_Ability_AbilityRuntime_ContextType_0300
     * @tc.desc   Test applicationContext is APPLICATION_CONTEXT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ContextType_0300', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_ContextType_0300";
        console.info('====> [SUB_Ability_AbilityRuntime_ContextType_0300] start ');
        let applicationContext = application.getApplicationContext();
        let result = applicationContext.isContextOf(contextConstant.ContextType.APPLICATION_CONTEXT);
        expect(result).assertTrue();
        done();
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ContextType_0400
     * @tc.number SUB_Ability_AbilityRuntime_ContextType_0400
     * @tc.desc   Test applicationContext not SERVICE_EXTENSION_CONTEXT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ContextType_0400', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_ContextType_0400";
      console.info('====> [SUB_Ability_AbilityRuntime_ContextType_0400] start ');
      let applicationContext = application.getApplicationContext();
      let result = applicationContext.isContextOf(contextConstant.ContextType.SERVICE_EXTENSION_CONTEXT);
      expect(result).assertFalse();
      done();
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ContextType_0500
     * @tc.number SUB_Ability_AbilityRuntime_ContextType_0500
     * @tc.desc   Test AbilityStageContext is ABILITY_STAGE_CONTEXT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ContextType_0500', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_ContextType_0500";
      console.info('====> [SUB_Ability_AbilityRuntime_ContextType_0500] start ');
      let abilityStageContext: common.AbilityStageContext = AppStorage.get<common.AbilityStageContext>('abilityStageContext') as common.AbilityStageContext;
      let result = abilityStageContext.isContextOf(contextConstant.ContextType.ABILITY_STAGE_CONTEXT);
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ContextType_0600
     * @tc.number SUB_Ability_AbilityRuntime_ContextType_0600
     * @tc.desc   Test AbilityStageContext not UI_SERVICE_EXTENSION_CONTEXT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ContextType_0600', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_ContextType_0600";
      console.info('====> [SUB_Ability_AbilityRuntime_ContextType_0600] start ');
      let abilityStageContext: common.AbilityStageContext = AppStorage.get<common.AbilityStageContext>('abilityStageContext') as common.AbilityStageContext;
      let result = abilityStageContext.isContextOf(contextConstant.ContextType.UI_SERVICE_EXTENSION_CONTEXT);
      expect(result).assertFalse();
      done();
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ContextType_0700
     * @tc.number SUB_Ability_AbilityRuntime_ContextType_0700
     * @tc.desc   Test contextConstant.ContextType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ContextType_0700', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_ContextType_0700";
      console.info('====> [SUB_Ability_AbilityRuntime_ContextType_0700] start ');
      expect(contextConstant.ContextType.APPLICATION_CONTEXT).assertEqual(0);
      expect(contextConstant.ContextType.ABILITY_STAGE_CONTEXT).assertEqual(1);
      expect(contextConstant.ContextType.UIABILITY_CONTEXT).assertEqual(2);
      expect(contextConstant.ContextType.FORM_EXTENSION_CONTEXT).assertEqual(3);
      expect(contextConstant.ContextType.APP_SERVICE_EXTENSION_CONTEXT).assertEqual(4);
      expect(contextConstant.ContextType.SERVICE_EXTENSION_CONTEXT).assertEqual(5);
      expect(contextConstant.ContextType.UI_SERVICE_EXTENSION_CONTEXT).assertEqual(6);
      expect(contextConstant.ContextType.AUTO_FILL_EXTENSION_CONTEXT).assertEqual(7);
      done();
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ContextType_0800
     * @tc.number SUB_Ability_AbilityRuntime_ContextType_0800
     * @tc.desc   Test UIAbilityContext isContextOf FORM_EXTENSION_CONTEXT returns false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ContextType_0800', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_ContextType_0800";
      console.info('====> [SUB_Ability_AbilityRuntime_ContextType_0800] start ');
      let testAbilityContext: common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>('TestAbilityContext') as common.UIAbilityContext;
      let result = testAbilityContext.isContextOf(contextConstant.ContextType.FORM_EXTENSION_CONTEXT);
      expect(result).assertFalse();
      done();
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ContextType_0900
     * @tc.number SUB_Ability_AbilityRuntime_ContextType_0900
     * @tc.desc   Test UIAbilityContext isContextOf APP_SERVICE_EXTENSION_CONTEXT returns false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_ContextType_0900', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_ContextType_0900";
      console.info('====> [SUB_Ability_AbilityRuntime_ContextType_0900] start ');
      let testAbilityContext: common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>('TestAbilityContext') as common.UIAbilityContext;
      let result = testAbilityContext.isContextOf(contextConstant.ContextType.APP_SERVICE_EXTENSION_CONTEXT);
      expect(result).assertFalse();
      done();
    });

  })
}
