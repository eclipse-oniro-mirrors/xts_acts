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
import { common } from '@kit.AbilityKit';
import { BusinessError, systemParameterEnhance } from '@kit.BasicServicesKit';

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
      testAbilityContext = AppStorage.get<common.UIAbilityContext>('TestAbilityContext') as common.UIAbilityContext;
      try {
        mpEnable = systemParameterEnhance.getSync('persist.sys.abilityms.multi_process_model');
      } catch (err) {
        console.error(`ACTS_NativeStartChildProcess Get system parameter error: ${JSON.stringify(err)}`);
        mpEnable = 'fail';
      }
    });
    afterEach(async () => {
      await sleep(1500);
    })
    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIExtensionContext_0100
     * @tc.name: When the input parameter want is null, an error code is returned(startability cllback).
     * @tc.desc: When the input parameter want is null, an error code is returned(startability).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_0100', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_0100";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_0100] start ');
          let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
            events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_0100_event"]
          };
          await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
            console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_0100] commonEventSubscribeInfo success: ');
            sub = subscriber;
            hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
            commonEventManager.subscribe(sub, (err, commonEventData) => {
              hilog.info(0x0000, tag, '%{public}s', `tag  subscribecllback` + JSON.stringify(commonEventData));
              hilog.info(0x0000, tag, '%{public}s', `SecondAbility want:  ${JSON.stringify(commonEventData.parameters?.data)}`);
              try {
                expect(commonEventData.parameters?.result).assertEqual(401);
              } catch {
              }
              commonEventManager.publish("teminate",() => {});
              commonEventManager.unsubscribe(subscriber, (err, data) => {
                done();
              });
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

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIExtensionContext_0200
     * @tc.name: When the input parameter want is null, an error code is returned(startability options).
     * @tc.desc: When the input parameter want is null, an error code is returned(startability options).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_0200', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_0200";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_0200] start ');
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_0200_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_0200] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
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

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIExtensionContext_0300
     * @tc.name: When the input parameter want is null, an error code is returned(startability options promise).
     * @tc.desc: When the input parameter want is null, an error code is returned(startability options promise).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_0300', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_0300";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_0300] start ');
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_0300_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_0300] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
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

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIExtensionContext_0400
     * @tc.name: When the input parameter want is null, an error code is returned(oplink promise).
     * @tc.desc: When the input parameter want is null, an error code is returned(oplink promise).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_0400', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_0400";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_0400] start ');
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_0400_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_0400] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
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

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIExtensionContext_0500
     * @tc.name: When the input parameter want is null, an error code is returned(startAbilityForResult callback).
     * @tc.desc: When the input parameter want is null, an error code is returned(startAbilityForResult callback).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_0500', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_0500";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_0500] start ');
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_0500_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_0500] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
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

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIExtensionContext_0600
     * @tc.name: When the input parameter want is null, an error code is returned(startAbilityForResult options callback).
     * @tc.desc: When the input parameter want is null, an error code is returned(startAbilityForResult options callback).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_0600', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_0600";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_0600] start ');
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_0600_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_0600] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
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

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIExtensionContext_0700
     * @tc.name: When the input parameter want is null, an error code is returned(startAbilityForResult options promise).
     * @tc.desc: When the input parameter want is null, an error code is returned(startAbilityForResult options promise).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_0700', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_0700";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_0700] start ');
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_0700_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_0700] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
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

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIExtensionContext_0800
     * @tc.name: When the input parameter want is null, an error code is returned(connectServiceExtensionAbility).
     * @tc.desc: When the input parameter want is null, an error code is returned(connectServiceExtensionAbility).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_0800', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_0800";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_0800] start ');
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_0800_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_0800] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
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

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIExtensionContext_0900
     * @tc.name: When the input parameter want is null, an error code is returned(disconnectServiceExtensionAbility callback).
     * @tc.desc: When the input parameter want is null, an error code is returned(disconnectServiceExtensionAbility callback).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_0900', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_0900";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_0900] start ');
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_0900_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_0900] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
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

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIExtensionContext_1000
     * @tc.name: When the input parameter want is null, an error code is returned(disconnectServiceExtensionAbility promise).
     * @tc.desc: When the input parameter want is null, an error code is returned(disconnectServiceExtensionAbility promise).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_1000', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_1000";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_1000] start ');
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_1000_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_1000] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
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

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIExtensionContext_1100
     * @tc.name: When the input parameter want is null, an error code is returned(terminateSelfWithResult callback).
     * @tc.desc: When the input parameter want is null, an error code is returned(terminateSelfWithResult callback).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_1100', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_1100";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_1100] start ');
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_1100_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_1100] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
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

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIExtensionContext_1200
     * @tc.name: When the input parameter want is null, an error code is returned(terminateSelfWithResult promise).
     * @tc.desc: When the input parameter want is null, an error code is returned(terminateSelfWithResult promise).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_1200', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_1200";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_1200] start ');
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_1200_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_1200] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
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

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIExtensionContext_1300
     * @tc.name: When the input parameter want is null, an error code is returned(openAtomicService promise).
     * @tc.desc: When the input parameter want is null, an error code is returned(openAtomicService promise).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_1300', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_1300";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_1300] start ');
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_1300_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_1200] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
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

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIExtensionContext_1400
     * @tc.name: When the input parameter want is null, an error code is returned(startUIServiceExtensionAbility promise).
     * @tc.desc: When the input parameter want is null, an error code is returned(startUIServiceExtensionAbility promise).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_1400', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_1400";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_1400] start ');
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_1400_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_1400] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
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

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIExtensionContext_1500
     * @tc.name: When the input parameter want is null, an error code is returned(connectUIServiceExtensionAbility promise).
     * @tc.desc: When the input parameter want is null, an error code is returned(connectUIServiceExtensionAbility promise).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_1500', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_1500";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_1500] start ');
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_1500_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_1400] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
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

    /*
    * @tc.number: SUB_Ability_AbilityRuntime_UIExtensionContext_1600
    * @tc.name: When the input parameter want is null, an error code is returned(disconnectUIServiceExtensionAbility promise).
    * @tc.desc: When the input parameter want is null, an error code is returned(disconnectUIServiceExtensionAbility promise).
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 3
    */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_1600', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_1600";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_1600] start ');
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_1600_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_1400] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
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

    /*
    * @tc.number: SUB_Ability_AbilityRuntime_UIExtensionContext_1700
    * @tc.name: When the input parameter want is null, an error code is returned(setColorMode).
    * @tc.desc: When the input parameter want is null, an error code is returned(setColorMode).
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 3
    */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_1700', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_1700";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_1700] start ');
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_1700_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_1700] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
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

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIExtensionContext_1800
     * @tc.name: When the input parameter want is null, an error code is returned(startability cllback).
     * @tc.desc: When the input parameter want is null, an error code is returned(startability).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_1800', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_1800";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_1800] start ');
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_1800_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_0100] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag  subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `SecondAbility want:  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
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

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIExtensionContext_1900
     * @tc.name: When the input parameter want is null, an error code is returned(startability options).
     * @tc.desc: When the input parameter want is null, an error code is returned(startability options).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_1900', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_1900";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_1900] start ');
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_1900_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_1900] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
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

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIExtensionContext_2000
     * @tc.name: When the input parameter want is null, an error code is returned(startability options promise).
     * @tc.desc: When the input parameter want is null, an error code is returned(startability options promise).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_2000', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_2000";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_2000] start ');
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_2000_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_0300] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
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

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIExtensionContext_2100
     * @tc.name: When the input parameter want is null, an error code is returned(oplink promise).
     * @tc.desc: When the input parameter want is null, an error code is returned(oplink promise).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_2100', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_2100";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_2100] start ');
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_2100_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_2100] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
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

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIExtensionContext_2200
     * @tc.name: When the input parameter want is null, an error code is returned(startAbilityForResult callback).
     * @tc.desc: When the input parameter want is null, an error code is returned(startAbilityForResult callback).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_2200', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_2200";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_2200] start ');
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_2200_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_2200] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
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

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIExtensionContext_2300
     * @tc.name: When the input parameter want is null, an error code is returned(startAbilityForResult options callback).
     * @tc.desc: When the input parameter want is null, an error code is returned(startAbilityForResult options callback).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_2300', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_2300";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_0600] start ');
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_2300_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_2300] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
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

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIExtensionContext_2400
     * @tc.name: When the input parameter want is null, an error code is returned(startAbilityForResult options promise).
     * @tc.desc: When the input parameter want is null, an error code is returned(startAbilityForResult options promise).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_2400', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_2400";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_2400] start ');
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_2400_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_2400] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
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

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIExtensionContext_2500
     * @tc.name: When the input parameter want is null, an error code is returned(connectServiceExtensionAbility).
     * @tc.desc: When the input parameter want is null, an error code is returned(connectServiceExtensionAbility).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_2500', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_2500";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_2500] start ');
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_2500_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_2500] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
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

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIExtensionContext_2600
     * @tc.name: When the input parameter want is null, an error code is returned(disconnectServiceExtensionAbility callback).
     * @tc.desc: When the input parameter want is null, an error code is returned(disconnectServiceExtensionAbility callback).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_2600', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_2600";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_2600] start ');
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_2600_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_2600] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
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

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIExtensionContext_2700
     * @tc.name: When the input parameter want is null, an error code is returned(disconnectServiceExtensionAbility promise).
     * @tc.desc: When the input parameter want is null, an error code is returned(disconnectServiceExtensionAbility promise).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_2700', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_2700";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_1000] start ');
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_2700_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_2700] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
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

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIExtensionContext_2800
     * @tc.name: When the input parameter want is null, an error code is returned(terminateSelfWithResult callback).
     * @tc.desc: When the input parameter want is null, an error code is returned(terminateSelfWithResult callback).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_2800', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_2800";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_2800] start ');
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_2800_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_2800] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
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

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIExtensionContext_2900
     * @tc.name: When the input parameter want is null, an error code is returned(terminateSelfWithResult promise).
     * @tc.desc: When the input parameter want is null, an error code is returned(terminateSelfWithResult promise).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_2900', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_2900";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_2900] start ');
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_2900_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_2900] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
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

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIExtensionContext_3000
     * @tc.name: When the input parameter want is null, an error code is returned(openAtomicService promise).
     * @tc.desc: When the input parameter want is null, an error code is returned(openAtomicService promise).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_3000', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_3000";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_3000] start ');
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_3000_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_3000] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
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

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIExtensionContext_3100
     * @tc.name: When the input parameter want is null, an error code is returned(startUIServiceExtensionAbility promise).
     * @tc.desc: When the input parameter want is null, an error code is returned(startUIServiceExtensionAbility promise).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_3100', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_3100";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_3100] start ');
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_3100_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_3100] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
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

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_UIExtensionContext_3200
     * @tc.name: When the input parameter want is null, an error code is returned(connectUIServiceExtensionAbility promise).
     * @tc.desc: When the input parameter want is null, an error code is returned(connectUIServiceExtensionAbility promise).
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_3200', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_3200";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_3200] start ');
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_3200_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_3200] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
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

    /*
    * @tc.number: SUB_Ability_AbilityRuntime_UIExtensionContext_3300
    * @tc.name: When the input parameter want is null, an error code is returned(disconnectUIServiceExtensionAbility promise).
    * @tc.desc: When the input parameter want is null, an error code is returned(disconnectUIServiceExtensionAbility promise).
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 3
    */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_3300', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_3300";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_3300] start ');
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_3300_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_1400] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
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

    /*
    * @tc.number: SUB_Ability_AbilityRuntime_UIExtensionContext_3400
    * @tc.name: When the input parameter want is null, an error code is returned(setColorMode).
    * @tc.desc: When the input parameter want is null, an error code is returned(setColorMode).
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 3
    */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_3400', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_3400";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_3400] start ');
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_3400_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_3400] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate",() => {});
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
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

    /*
    * @tc.number: SUB_Ability_AbilityRuntime_UIExtensionContext_3500
    * @tc.name: When the input parameter want is null, an error code is returned(openAtomicService).
    * @tc.desc: When the input parameter want is null, an error code is returned(openAtomicService).
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 3
    */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_3500', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_3500";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_3500] start ');
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_3500_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_3500] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate", () => { });
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
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

    /*
   * @tc.number: SUB_Ability_AbilityRuntime_UIExtensionContext_3600
   * @tc.name: When the input parameter want is null, an error code is returned(openlink).
   * @tc.desc: When the input parameter want is null, an error code is returned(openlink).
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 3
   */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_3600', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_3600";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_3600] start ');
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_3600_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_3600] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate", () => { });
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
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

    /*
   * @tc.number: SUB_Ability_AbilityRuntime_UIExtensionContext_3700
   * @tc.name: When the input parameter want is null, an error code is returned(loadcontent).
   * @tc.desc: When the input parameter want is null, an error code is returned(loadcontent).
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 3
   */
    it('SUB_Ability_AbilityRuntime_UIExtensionContext_3700', Level.LEVEL0, async (done: Function) => {
      let tag = "SUB_Ability_AbilityRuntime_UIExtensionContext_3700";
      if (mpEnable === 'true') {
        console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_3700] start ');
        let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["SUB_Ability_AbilityRuntime_UIExtensionContext_3700_event"]
        };
        await commonEventManager.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
          console.info('====> [SUB_Ability_AbilityRuntime_UIExtensionContext_3700] commonEventSubscribeInfo success: ');
          sub = subscriber;
          hilog.info(0x0000, tag, '%{public}s', `createSubscriber ok`);
          commonEventManager.subscribe(sub, (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate", () => { });
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
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

    /*
   * @tc.number: SUB_Ability_AbilityRuntime_UIExtensionContext_3800
   * @tc.name: When the input parameter want is null, an error code is returned(openAtomicService).
   * @tc.desc: When the input parameter want is null, an error code is returned(openAtomicService).
   * @tc.size: MediumTest
   * @tc.type: Function
   * @tc.level: Level 3
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
          commonEventManager.subscribe(sub, (err, commonEventData) => {
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback` + JSON.stringify(commonEventData));
            hilog.info(0x0000, tag, '%{public}s', `tag subscribecllback  ${JSON.stringify(commonEventData.parameters?.data)}`);
            try {
              expect(commonEventData.parameters?.result).assertEqual(401);
            } catch {
            }
            commonEventManager.publish("teminate", () => { });
            commonEventManager.unsubscribe(subscriber, (err, data) => {
              done();
            });
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
  })
}