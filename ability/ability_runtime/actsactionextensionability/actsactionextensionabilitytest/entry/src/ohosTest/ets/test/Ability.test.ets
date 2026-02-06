/*
 * Copyright (c) 2023-2025 Huawei Device Co., Ltd.
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
import { describe, it, expect, beforeAll, Level } from '@ohos/hypium';
import commonEvent from '@ohos.commonEventManager';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import wantConstant from '@ohos.app.ability.wantConstant';
import fs from '@ohos.file.fs';
import common from '@ohos.app.ability.common';
import Want from '@ohos.app.ability.Want';
import { BusinessError } from '@ohos.base';

function sleep(time: number): Promise<number> {
  return new Promise((resolve) => setTimeout(resolve, time));
}
let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
let ACTS_CallFunction: commonEvent.CommonEventSubscribeInfo = {
  events: ['ACTS_CALL_EVENT', 'ACTS_CALL_EVENT_ANOTHER']
};
let ACTS_EVENT: commonEvent.CommonEventSubscribeInfo = {
  events: ['ACTS_TEST_FOREGROUND', 'ACTS_TEST_DESTROY', 'ACTS_TEST_RELEASE', 'ACTS_TEST_START_ERR']
};
let ACTS_WANT_SHOW_MODE_EVENT: commonEvent.CommonEventSubscribeInfo = {
  events: ['ACTS_TEST_EMBEDDED_FULL', 'ACTS_TEST_WINDOW']
};
const CONTEXT_WANT: Want = {
  bundleName: 'com.example.actsactionextensionabilitytest',
  abilityName: 'EntryAbility',
  action: 'Acts_ActionExtensionAbility_context'
};
let context: common.UIAbilityContext;
export default function abilityTest() {
  describe('ActsAbilityTest', () => {
   
    beforeAll(() => {
      context = AppStorage.get<common.UIAbilityContext>("testAbilityContext") as common.UIAbilityContext;
      console.info(`====>beforeAll getcontext result: ` + JSON.stringify(context));
    })
    /**
     * @tc.name   Acts_ActionExtensionAbility_0100
     * @tc.number Acts_ActionExtensionAbility_0100
     * @tc.desc   With the same application with the same module, test ActionExtensionAbility lifecycle.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_ActionExtensionAbility_0100', Level.LEVEL0, async (done:Function) => {
      let subscriber: commonEvent.CommonEventSubscriber | undefined = undefined;
      let unSubscribeCallback = () =>{
        setTimeout(async () => {
          console.info(`====>Acts_ActionExtensionAbility_0100 unSubscribeCallback`);
          await globalThis.terminate('Acts_ActionExtensionAbility_0100');
          await globalThis.terminateCalledAbility('Acts_ActionExtensionAbility_0100');
          await sleep(1000);
          done();
        }, 1000);
      }
      let subscribeCallBack = async (err: BusinessError, data: commonEvent.CommonEventData) => {
        console.log('====>Acts_ActionExtensionAbility_0100 subscribeCallBack :' + JSON.stringify(data));
        if (data.event == 'ACTS_TEST_FOREGROUND') {
          expect(data.parameters?.count).assertEqual(3);
          await abilityDelegator.executeShellCommand('aa dump -a').then((data) => {
            console.info('====>Acts_ActionExtensionAbility_0100 : data : ' + JSON.stringify(data.stdResult));
            let firstString = data.stdResult.split("entry/ActsActionExtensionAbility");
            let result = firstString[1].split("uri");
            console.info('====>Acts_ActionExtensionAbility_0100 result aa string: ' + JSON.stringify(result[0]));
            try {
              expect(result[0]).assertContain("main name [ActsActionExtensionAbility]");
              expect(result[0]).assertContain("bundle name [com.example.actsactionextensionabilitytest]");
              expect(result[0]).assertContain("ability type [UIEXTENSION]");
              expect(result[0]).assertContain("app state #FOREGROUND");
              expect(result[0]).assertContain("root host bundle name [com.example.actsactionextensionabilitytest]");
              expect(result[0]).assertContain("root host module name [entry]");
              expect(result[0]).assertContain("root host ability name [EntryAbility]");
            } catch {
              expect().assertFail();
            }
          });
          context.startAbility({
            bundleName: 'com.example.actsactionextensionabilitytest',
            abilityName: 'CalledAbility'
          }, (err:BusinessError) => {
            expect(err.code).assertEqual(0);
          });
        }
        if (data.event == 'ACTS_TEST_RELEASE') {
          expect(data.parameters?.releaseCode).assertEqual(0);
        }
        if (data.event == 'ACTS_TEST_DESTROY') {
          expect(data.parameters?.count).assertEqual(6);
          setTimeout(() => {
            commonEvent.unsubscribe(subscriber, unSubscribeCallback);
          }, 500);
        }
      }
      commonEvent.createSubscriber(ACTS_EVENT).then(async (data) => {
        console.info(`====>Acts_ActionExtensionAbility_0100 createSubscriber  ${data}`);
        subscriber = data;
        commonEvent.subscribe(data, subscribeCallBack);
        console.info(`====>Acts_ActionExtensionAbility_0100 createSubscriber  success`);
        context.startAbility({
          bundleName: 'com.example.actsactionextensionabilitytest',
          abilityName: 'EntryAbility',
          action: 'Acts_ActionExtensionAbility_0100'
        }, (err:BusinessError) => {
          console.info(`====>Acts_ActionExtensionAbility_0100 startAbility MainAbility success`);
          expect(err.code).assertEqual(0);
        });
      });
    })

    /**
     * @tc.name   Acts_ActionExtensionAbility_0200
     * @tc.number Acts_ActionExtensionAbility_0200
     * @tc.desc   With the same application with the different module, test ActionExtensionAbility lifecycle.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_ActionExtensionAbility_0200', Level.LEVEL0, async (done:Function) => {
      let subscriber: commonEvent.CommonEventSubscriber | undefined = undefined;
      let subscribeCallBack = async (err: BusinessError, data: commonEvent.CommonEventData) => {
        console.log('====>Acts_ActionExtensionAbility_0200 subscribeCallBack :' + JSON.stringify(data));
        if (data.event == 'ACTS_TEST_FOREGROUND') {
          expect(data.parameters?.count).assertEqual(3);
          await abilityDelegator.executeShellCommand('aa dump -a').then((data) => {
            console.info('====>Acts_ActionExtensionAbility_0200 : data : ' + JSON.stringify(data.stdResult));
            let firstString = data.stdResult.split("entry/ActsActionExtensionAbility");
            let result = firstString[1].split("uri");
            console.info('====>Acts_ActionExtensionAbility_0200 result aa string: ' + JSON.stringify(result[0]));
            try {
              expect(result[0]).assertContain("main name [ActsActionExtensionAbility]");
              expect(result[0]).assertContain("bundle name [com.example.actsactionextensionabilitytest]");
              expect(result[0]).assertContain("ability type [UIEXTENSION]");
              expect(result[0]).assertContain("app state #FOREGROUND");
              expect(result[0]).assertContain("root host bundle name [com.example.actsactionextensionabilitytest]");
              expect(result[0]).assertContain("root host module name [feature]");
              expect(result[0]).assertContain("root host ability name [FeatureAbility]");
            } catch {
              expect().assertFail();
            };
          });
          context.startAbility({
            bundleName: 'com.example.actsactionextensionabilitytest',
            abilityName: 'CalledAbility'
          }, (err:BusinessError) => {
            expect(err.code).assertEqual(0);
          });
        }
        if (data.event == 'ACTS_TEST_RELEASE') {
          expect(data.parameters?.releaseCode).assertEqual(0);
        }
        if (data.event == 'ACTS_TEST_DESTROY') {
          expect(data.parameters?.count).assertEqual(6);
          setTimeout(() => {
            commonEvent.unsubscribe(subscriber, unSubscribeCallback);
          }, 500);
        }
      }

      let unSubscribeCallback = () =>{
        setTimeout(async () => {
          console.info(`====>Acts_ActionExtensionAbility_0200 unSubscribeCallback`);
          await globalThis.featureTerminate('Acts_ActionExtensionAbility_0200');
          await globalThis.terminateCalledAbility('Acts_ActionExtensionAbility_0200');
          await sleep(1000);
          done();
        }, 1000);
      }
      commonEvent.createSubscriber(ACTS_EVENT).then(async (data) => {
        subscriber = data;
        commonEvent.subscribe(data, subscribeCallBack);
        context.startAbility({
          bundleName: 'com.example.actsactionextensionabilitytest',
          abilityName: 'FeatureAbility',
          action: 'Acts_ActionExtensionAbility_0200'
        }, (err:BusinessError) => {
          expect(err.code).assertEqual(0);
        });
      });
    })

    /**
     * @tc.name   Acts_ActionExtensionAbility_0300
     * @tc.number Acts_ActionExtensionAbility_0300
     * @tc.desc   With the different application, test ActionExtensionAbility lifecycle.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_ActionExtensionAbility_0300', Level.LEVEL0, async (done:Function) => {
      let subscriber: commonEvent.CommonEventSubscriber | undefined = undefined;
      let subscribeCallBack = async (err: BusinessError, data: commonEvent.CommonEventData) => {
        console.log('====>Acts_ActionExtensionAbility_0300 subscribeCallBack :' + JSON.stringify(data));
        if (data.event == 'ACTS_TEST_FOREGROUND') {
          expect(data.parameters?.count).assertEqual(3);
          await abilityDelegator.executeShellCommand('aa dump -a').then((data) => {
            console.info('====>Acts_ActionExtensionAbility_0300 : data : ' + JSON.stringify(data.stdResult));
            let firstString = data.stdResult.split("entry_assist/ActsActionExtensionAbility");
            let result = firstString[1].split("uri");
            console.info('====>Acts_ActionExtensionAbility_0300 result aa string: ' + JSON.stringify(result[0]));
            try {
              expect(result[0]).assertContain("main name [ActsActionExtensionAbility]");
              expect(result[0]).assertContain("bundle name [com.example.actsactionextensionabilityrely]");
              expect(result[0]).assertContain("ability type [UIEXTENSION]");
              expect(result[0]).assertContain("app state #FOREGROUND");
              expect(result[0]).assertContain("root host bundle name [com.example.actsactionextensionabilitytest]");
              expect(result[0]).assertContain("root host module name [entry]");
              expect(result[0]).assertContain("root host ability name [EntryAbility]");
            } catch {
              expect().assertFail();
            }
          });
          context.startAbility({
            bundleName: 'com.example.actsactionextensionabilityrely',
            abilityName: 'CalledAbility'
          }, (err:BusinessError) => {
            expect(err.code).assertEqual(0);
          })
        }
        if (data.event == 'ACTS_TEST_RELEASE') {
          expect(data.parameters?.releaseCode).assertEqual(0);
        }
        if (data.event == 'ACTS_TEST_DESTROY') {
          expect(data.parameters?.count).assertEqual(6);
          setTimeout(() => {
            commonEvent.unsubscribe(subscriber, unSubscribeCallback);
          }, 500);
        }
      }

      let unSubscribeCallback = () =>{
        setTimeout(async () => {
          console.info(`====>Acts_ActionExtensionAbility_0300 unSubscribeCallback`);
          await globalThis.terminate('Acts_ActionExtensionAbility_0300');
          let cmd = 'aa force-stop com.example.actsactionextensionabilityrely';
          await abilityDelegator.executeShellCommand(cmd).catch((error: BusinessError) => {
            console.log("====>Acts_ActionExtensionAbility_0300 executeShellCommand error : " + JSON.stringify(error));
          });
          await sleep(1000);
          done();
        }, 1000);
      }
      commonEvent.createSubscriber(ACTS_EVENT).then(async (data) => {
        subscriber = data;
        commonEvent.subscribe(data, subscribeCallBack);
        context.startAbility({
          bundleName: 'com.example.actsactionextensionabilitytest',
          abilityName: 'EntryAbility',
          action: 'Acts_ActionExtensionAbility_0300'
        }, (err:BusinessError) => {
          expect(err.code).assertEqual(0);
        });


      });
    })

    /**
     * @tc.name   Acts_ActionExtensionAbility_0400
     * @tc.number Acts_ActionExtensionAbility_0400
     * @tc.desc   Start the same ActionExtensionAbility with different UI components, and the test is successful.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_ActionExtensionAbility_0400', Level.LEVEL0, async (done:Function) => {
      let subscriber: commonEvent.CommonEventSubscriber | undefined = undefined;
      let ACTS_MODULE: commonEvent.CommonEventSubscribeInfo = {
        events: ['ACTS_FEATURE_CREATE']
      };
      let count = 0;
      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        console.log('====>Acts_ActionExtensionAbility_0400 subscribeCallBack :' + JSON.stringify(data));
        if (data.event == 'ACTS_FEATURE_CREATE') {
          count++;
        }
        if (count == 2) {
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      }
      let unSubscribeCallback = () =>{
        setTimeout(async () => {
          console.info(`====>Acts_ActionExtensionAbility_0400 unSubscribeCallback`);
          await globalThis.terminate('Acts_ActionExtensionAbility_0400');
          await globalThis.featureTerminate('Acts_ActionExtensionAbility_0400');
          await sleep(1000);
          done();
        }, 1000);
      }
      commonEvent.createSubscriber(ACTS_MODULE).then(async (data) => {
        subscriber = data;
        commonEvent.subscribe(data, subscribeCallBack);
        context.startAbility({
          bundleName: 'com.example.actsactionextensionabilitytest',
          abilityName: 'EntryAbility',
          action: 'Acts_ActionExtensionAbility_0400'
        }, (err:BusinessError) => {
          expect(err.code).assertEqual(0);
        });
      });
    })

    /**
     * @tc.name   Acts_ActionExtensionAbility_0500
     * @tc.number Acts_ActionExtensionAbility_0500
     * @tc.desc   Start ActionExtensionAbility with invalid bundleName, start failed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_ActionExtensionAbility_0500', Level.LEVEL0, async (done:Function) => {
      let subscriber: commonEvent.CommonEventSubscriber | undefined = undefined;
      let flag = true;
      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        console.log('====>Acts_ActionExtensionAbility_0500 subscribeCallBack :' + JSON.stringify(data));
        if (data.event == 'ACTS_TEST_START_ERR' && flag) {
          flag = false;
          expect(data.parameters?.err.code).assertEqual(1011);
          commonEvent.unsubscribe(subscriber, unSubscribeCallback)
        }
      }
      let unSubscribeCallback = () =>{
        setTimeout(async () => {
          console.info(`====>Acts_ActionExtensionAbility_0500 unSubscribeCallback`);
          await globalThis.terminate('Acts_ActionExtensionAbility_0500');
          await sleep(1000);
          done();
        }, 1000);
      }
      commonEvent.createSubscriber(ACTS_EVENT).then(async (data) => {
        subscriber = data;
        commonEvent.subscribe(data, subscribeCallBack);
        context.startAbility({
          bundleName: 'com.example.actsactionextensionabilitytest',
          abilityName: 'EntryAbility',
          action: 'Acts_ActionExtensionAbility_0500'
        }, (err:BusinessError) => {
          expect(err.code).assertEqual(0);
        });

      });
    })

    /**
     * @tc.name   Acts_ActionExtensionAbility_0600
     * @tc.number Acts_ActionExtensionAbility_0600
     * @tc.desc   Start ActionExtensionAbility with invalid abilityName, start failed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_ActionExtensionAbility_0600', Level.LEVEL0, async (done:Function) => {
      let subscriber: commonEvent.CommonEventSubscriber | undefined = undefined;
      let flag = true;
      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        console.log('====>Acts_ActionExtensionAbility_0600 subscribeCallBack :' + JSON.stringify(data));
        if (data.event == 'ACTS_TEST_START_ERR' && flag) {
          flag = false;
          expect(data.parameters?.err.code).assertEqual(1011);
          commonEvent.unsubscribe(subscriber, unSubscribeCallback)
        }
      }
      let unSubscribeCallback = () =>{
        setTimeout(async () => {
          console.info(`====>Acts_ActionExtensionAbility_0600 unSubscribeCallback`);
          globalThis.terminate('Acts_ActionExtensionAbility_0600');
          await sleep(1000);
          done();
        }, 1000);
      }
      commonEvent.createSubscriber(ACTS_EVENT).then(async (data) => {
        subscriber = data;
        commonEvent.subscribe(data, subscribeCallBack);
        context.startAbility({
          bundleName: 'com.example.actsactionextensionabilitytest',
          abilityName: 'EntryAbility',
          action: 'Acts_ActionExtensionAbility_0600'
        }, (err:BusinessError) => {
          expect(err.code).assertEqual(0);
        });
      });
    })

    /**
     * @tc.name   Acts_ActionExtensionAbility_0700
     * @tc.number Acts_ActionExtensionAbility_0700
     * @tc.desc   Start ActionExtensionAbility with invalid parameters, start failed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_ActionExtensionAbility_0700', Level.LEVEL0, async (done:Function) => {
      let subscriber: commonEvent.CommonEventSubscriber | undefined = undefined;
      let flag = true;
      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        console.info(`====>Acts_ActionExtensionAbility_0700 subscribeCallBack 'ACTS_CALL_EVENT'  ${data}`);
        if (data.event == 'ACTS_TEST_START_ERR' && flag) {
          flag = false;
          expect(data.parameters?.err.code).assertEqual(1011);
          commonEvent.unsubscribe(subscriber, unSubscribeCallback)
        }
      }
      let unSubscribeCallback = () =>{
        setTimeout(async () => {
          console.info(`====>Acts_ActionExtensionAbility_0700 unSubscribeCallback`);
          globalThis.terminate('Acts_ActionExtensionAbility_0700');
          await sleep(1000);
          done();
        }, 1000);
      }
      commonEvent.createSubscriber(ACTS_EVENT).then(async (data) => {
        console.info(`====>Acts_ActionExtensionAbility_0700 createSubscriber  ${data}`);
        subscriber = data;
        commonEvent.subscribe(data, subscribeCallBack);
        context.startAbility({
          bundleName: 'com.example.actsactionextensionabilitytest',
          abilityName: 'EntryAbility',
          action: 'Acts_ActionExtensionAbility_0700'
        }, (err:BusinessError) => {
          expect(err.code).assertEqual(0);
        });

      });
    })

    /**
     * @tc.name   Acts_ActionExtensionAbility_0800
     * @tc.number Acts_ActionExtensionAbility_0800
     * @tc.desc   Test terminateSelfWithResultEvent successful.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_ActionExtensionAbility_0800', Level.LEVEL0, async (done:Function) => {
      let appearEvent = 'ACTS_UIExtension_AboutToAppear';
      let onResultEvent = 'ACTS_UIExtension_OnResult';
      let terminateSelfWithResultEvent = 'ACTS_UIExtension_TerminateSelfWithResult';

      let subscriber: commonEvent.CommonEventSubscriber | undefined = undefined;
      let subscribeInfo: commonEvent.CommonEventSubscribeInfo = {
        events: [appearEvent, onResultEvent]
      }
      await commonEvent.createSubscriber(subscribeInfo).then(async (data) => {
        console.log("createSubscriber data : " + JSON.stringify(data));
        subscriber = data;
        context.startAbility({
          bundleName: 'com.example.actsactionextensionabilitytest',
          abilityName: 'EntryAbility',
          action: 'Acts_ActionExtensionAbility_DEFAULT'
        }, (err:BusinessError) => {
          expect(err.code).assertEqual(0);
        });

        commonEvent.subscribe(subscriber, async (err, data) => {
          console.log("SubscribeInfoCallback : " + JSON.stringify(data));

          if (data.event == appearEvent) {
            commonEvent.publish(terminateSelfWithResultEvent, ()=>{});
          } else if (data.event == onResultEvent) {
            let result:ESObject = data.parameters?.result as ESObject;
            setTimeout(async () => {
              commonEvent.unsubscribe(subscriber, async (err, data) => {
                expect(result.want.action).assertEqual('ACTION');
                globalThis.terminate('Acts_ActionExtensionAbility_0800');
                setTimeout(() => {
                  console.info(`====>Acts_ActionExtensionAbility_0800 unSubscribeCallback`);
                  done();
                }, 1000);
              });
            }, 1000);
          }
        });
      }).catch((error: BusinessError) => {
        globalThis.terminate('Acts_ActionExtensionAbility_0800');
        setTimeout(() => {
          console.log("createSubscriber err : " + JSON.stringify(error));
          expect().assertFail();
        }, 1000);
      });
    })

    /**
     * @tc.name   Acts_ActionExtensionAbility_0900
     * @tc.number Acts_ActionExtensionAbility_0900
     * @tc.desc   Test sendData successful.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_ActionExtensionAbility_0900', Level.LEVEL0, async (done:Function) => {
      let appearEvent = 'ACTS_UIExtension_AboutToAppear';
      let onReceiveEvent = 'ACTS_UIExtension_OnReceive';
      let sendDataEvent = 'ACTS_UIExtension_SendData';

      let subscriber: commonEvent.CommonEventSubscriber | undefined = undefined;
      let subscribeInfo: commonEvent.CommonEventSubscribeInfo = {
        events: [appearEvent, onReceiveEvent]
      }
      await commonEvent.createSubscriber(subscribeInfo).then(async (data) => {
        console.log("createSubscriber data : " + JSON.stringify(data));
        subscriber = data;
        context.startAbility({
          bundleName: 'com.example.actsactionextensionabilitytest',
          abilityName: 'EntryAbility',
          action: 'Acts_ActionExtensionAbility_DEFAULT'
        }, (err:BusinessError) => {
          expect(err.code).assertEqual(0);
        });

        commonEvent.subscribe(subscriber, async (err, data) => {
          console.log("SubscribeInfoCallback : " + JSON.stringify(data));

          if (data.event == appearEvent) {
            commonEvent.publish(sendDataEvent, (err) => {
              if (err) {
                console.log(`publish ACTS_UIExtension_SendData failed, code is ${err.code}, message is ${err.message}`);
              } else {
                console.log('publish ACTS_UIExtension_SendData success');
              }
            });
          } else if (data.event == onReceiveEvent) {
            let result:ESObject = data.parameters?.result as ESObject;
            let resultCheck:ESObject = {
              name: {
                test: 'actionExtensionTest'
              } as ESObject
            };
            setTimeout(async () => {
              commonEvent.unsubscribe(subscriber, async (err, data) => {
                expect(JSON.stringify(result)).assertEqual(JSON.stringify(resultCheck));
                globalThis.terminate('Acts_ActionExtensionAbility_0900');
                setTimeout(() => {
                  console.info(`====>Acts_ActionExtensionAbility_0900 unSubscribeCallback`);
                  done();
                }, 1000);
              });
            }, 1000);
          }
        });
      }).catch((error: BusinessError) => {
        globalThis.terminate('Acts_ActionExtensionAbility_0900');
        setTimeout(() => {
          console.log("createSubscriber err : " + JSON.stringify(error));
          expect().assertFail();
        }, 1000);
      });
    })

    /**
     * @tc.name   Acts_ActionExtensionAbility_1000
     * @tc.number Acts_ActionExtensionAbility_1000
     * @tc.desc   Test the startAbility interface in callback form.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_ActionExtensionAbility_1000', Level.LEVEL0, async (done:Function) => {
      let subscriber: commonEvent.CommonEventSubscriber | undefined = undefined;
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        console.info(`====>Acts_ActionExtensionAbility_1000 createSubscriber  ${data}`)
        subscriber = data
        commonEvent.subscribe(data, subscribeCallBack)
        context.startAbility({
          bundleName: 'com.example.actsactionextensionabilitytest',
          abilityName: 'EntryAbility',
          action: 'Acts_ActionExtensionAbility_1000'
        }, (err:BusinessError) => {
          console.info('====>Acts_ActionExtensionAbility_1000 startAbility err:' + JSON.stringify(err));
        });
      })

      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        if (data.event == 'ACTS_CALL_EVENT') {
          console.info(`====>Acts_ActionExtensionAbility_1000 subscribeCallBack 'ACTS_CALL_EVENT'  ${data}`)
          expect(data.parameters?.num).assertEqual(0);
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      }

      let unSubscribeCallback = () =>{
        console.info(`====>Acts_ActionExtensionAbility_1000 unSubscribeCallback 'ACTS_CALL_EVENT'`);
        globalThis.terminate('Acts_ActionExtensionAbility_1000');
        setTimeout(() => {
          done();
        }, 1000);
      }
    })

    /**
     * @tc.name   Acts_ActionExtensionAbility_1100
     * @tc.number Acts_ActionExtensionAbility_1100
     * @tc.desc   Test the startAbility interface in promiss form.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_ActionExtensionAbility_1100', Level.LEVEL0, async (done:Function) => {
      let subscriber: commonEvent.CommonEventSubscriber | undefined = undefined;
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        console.info(`====>Acts_ActionExtensionAbility_1100 createSubscriber  ${data}`)
        subscriber = data;
        commonEvent.subscribe(data, subscribeCallBack);
        context.startAbility({
          bundleName: 'com.example.actsactionextensionabilitytest',
          abilityName: 'EntryAbility',
          action: 'Acts_ActionExtensionAbility_1100'
        }, (err:BusinessError) => {
          console.info('====>Acts_ActionExtensionAbility_1100 startAbility err:' + JSON.stringify(err));
        });
      });

      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        if (data.event == 'ACTS_CALL_EVENT') {
          console.info('====>Acts_ActionExtensionAbility_1100 subscribeCallBack ' + JSON.stringify(data));
          expect(data.parameters?.str).assertEqual('success');
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      }

      let unSubscribeCallback = () =>{
        console.info(`====>Acts_ActionExtensionAbility_1100 unSubscribeCallback 'ACTS_CALL_EVENT'`);
        globalThis.terminate('Acts_ActionExtensionAbility_1100');
        setTimeout(() => {
          done();
        }, 1000);
      }
    })

    /**
     * @tc.name   Acts_ActionExtensionAbility_1200
     * @tc.number Acts_ActionExtensionAbility_1200
     * @tc.desc   Test the startAbility interface with invalid want.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_ActionExtensionAbility_1200', Level.LEVEL0, async (done:Function) => {
      let subscriber: commonEvent.CommonEventSubscriber | undefined = undefined;
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        console.info(`====>Acts_ActionExtensionAbility_1200 createSubscriber  ${data}`);
        subscriber = data;
        commonEvent.subscribe(data, subscribeCallBack);
        context.startAbility({
          bundleName: 'com.example.actsactionextensionabilitytest',
          abilityName: 'EntryAbility',
          action: 'Acts_ActionExtensionAbility_1200'
        }, (err:BusinessError) => {
          console.info('====>Acts_ActionExtensionAbility_1200 startAbility err:' + JSON.stringify(err));
        });
      });

      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        if (data.event == 'ACTS_CALL_EVENT') {
          console.info('====>Acts_ActionExtensionAbility_1200 subscribeCallBack' + JSON.stringify(data));
          expect(data.parameters?.num).assertEqual(16000001);
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      }

      let unSubscribeCallback = () =>{
        console.info(`====>Acts_ActionExtensionAbility_1200 unSubscribeCallback 'ACTS_CALL_EVENT'`);
        globalThis.terminate('Acts_ActionExtensionAbility_1200');
        setTimeout(() => {
          done();
        }, 1000);
      }
    })

    /**
     * @tc.name   Acts_ActionExtensionAbility_1300
     * @tc.number Acts_ActionExtensionAbility_1300
     * @tc.desc   Test the startAbilityForResult interface in callback form.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_ActionExtensionAbility_1300', Level.LEVEL0, async (done:Function) => {
      let subscriber: commonEvent.CommonEventSubscriber | undefined = undefined;
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        console.info(`====>Acts_ActionExtensionAbility_1300 createSubscriber  ${data}`);
        subscriber = data;
        commonEvent.subscribe(data, subscribeCallBack);
        context.startAbility({
          bundleName: 'com.example.actsactionextensionabilitytest',
          abilityName: 'EntryAbility',
          action: 'Acts_ActionExtensionAbility_1300'
        }, (err:BusinessError) => {
          console.info('====>Acts_ActionExtensionAbility_1300 startAbility err:' + JSON.stringify(err));
        });
      });

      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        if (data.event == 'ACTS_CALL_EVENT') {
          console.info(`====>Acts_ActionExtensionAbility_1300 subscribeCallBack 'ACTS_CALL_EVENT'  ${data}`);
          expect(data.parameters?.str).assertEqual('ACTION');
          expect(data.parameters?.result).assertEqual(0);
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      };

      let unSubscribeCallback = () =>{
        console.info(`====>Acts_ActionExtensionAbility_1300 unSubscribeCallback 'ACTS_CALL_EVENT'`);
        globalThis.terminate('Acts_ActionExtensionAbility_1300');
        setTimeout(() => {
          done();
        }, 1000);
      }
    })

    /**
     * @tc.name   Acts_ActionExtensionAbility_1400
     * @tc.number Acts_ActionExtensionAbility_1400
     * @tc.desc   Test the startAbilityForResult interface in promiss form.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_ActionExtensionAbility_1400', Level.LEVEL0, async (done: Function) => {
      await sleep(500);
      let subscriber: commonEvent.CommonEventSubscriber | undefined = undefined;
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        console.info(`====>Acts_ActionExtensionAbility_1400 createSubscriber  ${data}`);
        subscriber = data;
        commonEvent.subscribe(data, subscribeCallBack);
        context.startAbility({
          bundleName: 'com.example.actsactionextensionabilitytest',
          abilityName: 'EntryAbility',
          action: 'Acts_ActionExtensionAbility_1400'
        }, (err:BusinessError) => {
          console.info('====>Acts_ActionExtensionAbility_1400 startAbility err:' + JSON.stringify(err));
        });
      });

      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        if (data.event == 'ACTS_CALL_EVENT') {
          console.info(`====>Acts_ActionExtensionAbility_1400 subscribeCallBack 'ACTS_CALL_EVENT'  ${data}`);
          expect(data.parameters?.str).assertEqual('ACTION');
          expect(data.parameters?.result).assertEqual(0);
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      }

      let unSubscribeCallback = () =>{
        console.info(`====>Acts_ActionExtensionAbility_1400 unSubscribeCallback 'ACTS_CALL_EVENT'`);
        globalThis.terminate('Acts_ActionExtensionAbility_1400');
        setTimeout(() => {
          done();
        }, 1000);
      }
    })

    /**
     * @tc.name   Acts_ActionExtensionAbility_1500
     * @tc.number Acts_ActionExtensionAbility_1500
     * @tc.desc   Test the startAbilityForResult interface with invalid want.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_ActionExtensionAbility_1500', Level.LEVEL0, async (done: Function) => {
      await sleep(500);
      let subscriber: commonEvent.CommonEventSubscriber | undefined = undefined;
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        console.info(`====>Acts_ActionExtensionAbility_1500 createSubscriber  ${data}`);
        subscriber = data;
        commonEvent.subscribe(data, subscribeCallBack);
        context.startAbility({
          bundleName: 'com.example.actsactionextensionabilitytest',
          abilityName: 'EntryAbility',
          action: 'Acts_ActionExtensionAbility_1500'
        }, (err:BusinessError) => {
          console.info('====>Acts_ActionExtensionAbility_1400 start Own Ability err:' + JSON.stringify(err));
        });
      });

      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        console.info(`====>Acts_ActionExtensionAbility_1500 subscribeCallBack all  ${data.event}`);
        if (data.event == 'ACTS_CALL_EVENT') {
          console.info(`====>Acts_ActionExtensionAbility_1500 subscribeCallBack 'ACTS_CALL_EVENT'  ${data}`);
          expect(data.parameters?.num).assertEqual(16000001);
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      }

      let unSubscribeCallback = () =>{
        console.info(`====>Acts_ActionExtensionAbility_1500 unSubscribeCallback 'ACTS_CALL_EVENT'`);
        setTimeout(() => {
          globalThis.terminate('Acts_ActionExtensionAbility_1500');
          done();
        }, 1000);
      }
    })

    /**
     * @tc.name   Acts_ActionExtensionAbility_1600
     * @tc.number Acts_ActionExtensionAbility_1600
     * @tc.desc   Test setReceiveDataCallback successful.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_ActionExtensionAbility_1600', Level.LEVEL0, async (done: Function) => {
      await sleep(500);
      let subscriber: commonEvent.CommonEventSubscriber | undefined = undefined;
      let subscribeInfo: commonEvent.CommonEventSubscribeInfo = {
        events: ['setReceiveDataCallback']
      };
      await commonEvent.createSubscriber(subscribeInfo).then(async (data) => {
        console.log("createSubscriber data : " + JSON.stringify(data));
        subscriber = data;
        context.startAbility({
          bundleName: 'com.example.actsactionextensionabilitytest',
          abilityName: 'EntryAbility',
          action: 'Acts_ActionExtensionAbility_1600'
        }, (err:BusinessError) => {
          expect(err.code).assertEqual(0);
        });
        commonEvent.subscribe(subscriber, async (err, data) => {
          console.log("SubscribeInfoCallback : " + JSON.stringify(data));
          if (data.event == 'setReceiveDataCallback') {
            let resultCheck:ESObject = {
              name: {
                test: 'actionExtensionTest'
              } as ESObject
            };
            expect(JSON.stringify(data.parameters?.result)).assertEqual(JSON.stringify(resultCheck));
            commonEvent.unsubscribe(subscriber, async (err, data) => {
              globalThis.terminate('Acts_ActionExtensionAbility_1600');
              setTimeout(() => {
                console.info(`====>Acts_ActionExtensionAbility_1600 unSubscribeCallback`);
                done();
              }, 1000);
            });
          }
        });
      });
    })

    /**
     * @tc.name   Acts_ActionExtensionAbility_1700
     * @tc.number Acts_ActionExtensionAbility_1700
     * @tc.desc   Use ui components continuously to start two ActionExtensionAbility.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_ActionExtensionAbility_1700', Level.LEVEL0, async (done: Function) => {
      await sleep(500);
      context.startAbility({
        bundleName: 'com.example.actsactionextensionabilitytest',
        abilityName: 'EntryAbility',
        action: 'Acts_ActionExtensionAbility_1700'
      }, (err:BusinessError) => {
        expect(err.code).assertEqual(0);
      });
      await sleep(1000);
      await abilityDelegator.executeShellCommand('aa dump -a').then((data) => {
        console.info('====>Acts_ActionExtensionAbility_1700 : data : ' + JSON.stringify(data.stdResult));
        try {
          expect(JSON.stringify(data)).assertContain("main name [ActsActionExtensionAbility]");
          expect(JSON.stringify(data)).assertContain("main name [UIExtAbility]");
        } catch {
          expect().assertFail();
        }
      });
      globalThis.terminate('Acts_ActionExtensionAbility_1700');
      setTimeout(() => {
        console.info(`====>Acts_ActionExtensionAbility_1700 unSubscribeCallback`);
        done();
      }, 1000);
    })

    /**
     * @tc.name   Acts_ActionExtensionAbility_1800
     * @tc.number Acts_ActionExtensionAbility_1800
     * @tc.desc   Test starts ActionExtensionAbility using startAbility interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_ActionExtensionAbility_1800', Level.LEVEL0, async (done: Function) => {
      await sleep(500);
      let subscriber: commonEvent.CommonEventSubscriber | undefined = undefined;
      let subscribeInfo: commonEvent.CommonEventSubscribeInfo = {
        events: ['ACTS_CALL_EVENT']
      };
      await commonEvent.createSubscriber(subscribeInfo).then(async (data) => {
        console.log("createSubscriber data : " + JSON.stringify(data));
        subscriber = data;
        context.startAbility({
          bundleName: 'com.example.actsactionextensionabilitytest',
          abilityName: 'EntryAbility',
          action: 'Acts_ActionExtensionAbility_1800'
        }, (err:BusinessError) => {
          expect(err.code).assertEqual(0);
        });
        commonEvent.subscribe(subscriber, async (err, data) => {
          console.log("SubscribeInfoCallback : " + JSON.stringify(data));
          if (data.event == 'ACTS_CALL_EVENT') {
            await abilityDelegator.executeShellCommand('aa dump -a').then((data) => {
              console.info('====>Acts_ActionExtensionAbility_1800 : data : ' + JSON.stringify(data.stdResult));
              try {
                expect(JSON.stringify(data)).assertContain("main name [ActsActionExtensionAbility]");
                expect(JSON.stringify(data)).assertContain("main name [UIExtAbility]");
              } catch {
                expect().assertFail();
              }
            });
            commonEvent.unsubscribe(subscriber, async (err, data) => {
              globalThis.terminate('Acts_ActionExtensionAbility_1800');
              setTimeout(() => {
                console.info(`====>Acts_ActionExtensionAbility_1800 unSubscribeCallback`);
                done();
              }, 1000);
            });
          }
        });
      });
    })

    /**
     * @tc.name   Acts_ActionExtensionAbility_1900
     * @tc.number Acts_ActionExtensionAbility_1900
     * @tc.desc   Test hapModuleInfo in context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_ActionExtensionAbility_1900', Level.LEVEL0, async (done: Function) => {
      await sleep(500);
      let subscriber: commonEvent.CommonEventSubscriber | undefined = undefined;
      let subscribeInfo: commonEvent.CommonEventSubscribeInfo = {
        events: ['ACTS_TEST_CONTEXT']
      };
      await commonEvent.createSubscriber(subscribeInfo).then(async (data) => {
        console.log("createSubscriber data : " + JSON.stringify(data));
        subscriber = data;
        context.startAbility(CONTEXT_WANT, (err:ESObject) => {
          expect(err.code).assertEqual(0);
        });
        commonEvent.subscribe(subscriber, async (err, data) => {
          console.log("SubscribeInfoCallback : " + JSON.stringify(data));
          if (data.event == 'ACTS_TEST_CONTEXT') {
            try {
              expect(data.parameters?.context != null).assertTrue();
              let hapModuleInfo:ESObject = data.parameters?.context.currentHapModuleInfo as ESObject;
              expect(hapModuleInfo != null).assertTrue();
              console.log("====>Acts_ActionExtensionAbility_1900 hapModuleInfo : " + JSON.stringify(hapModuleInfo));
              console.log(`Acts_ActionExtensionAbility_1900 hapModuleInfo.name: ` + hapModuleInfo.name);
              expect(hapModuleInfo.name == "entry").assertTrue();
              console.log(`Acts_ActionExtensionAbility_1900 hapModuleInfo.icon: ` + hapModuleInfo.icon);
              expect(hapModuleInfo.icon == "$media:icon").assertTrue();
              console.log(`Acts_ActionExtensionAbility_1900 hapModuleInfo.iconId: ` + hapModuleInfo.iconId);
              expect(typeof (hapModuleInfo.iconId) == 'number').assertTrue();
              console.log(`Acts_ActionExtensionAbility_1900 hapModuleInfo.label: ` + hapModuleInfo.label);
              expect(hapModuleInfo.label == "$string:EntryAbility_label").assertTrue();
              console.log(`Acts_ActionExtensionAbility_1900 hapModuleInfo.labelId: ` + hapModuleInfo.labelId);
              expect(typeof (hapModuleInfo.labelId) == 'number').assertTrue();
              console.log(`Acts_ActionExtensionAbility_1900 hapModuleInfo.description: ` + hapModuleInfo.description);
              expect(hapModuleInfo.description == "$string:module_desc").assertTrue();
              console.log(`Acts_ActionExtensionAbility_1900 hapModuleInfo.descriptionId: ` + hapModuleInfo.descriptionId);
              expect(typeof (hapModuleInfo.descriptionId) == 'number').assertTrue();
              console.log(`Acts_ActionExtensionAbility_1900 hapModuleInfo.mainElementName: ` + hapModuleInfo.mainElementName);
              expect(hapModuleInfo.mainElementName == "EntryAbility").assertTrue();
              console.log(`Acts_ActionExtensionAbility_1900 hapModuleInfo.metadata: ` + hapModuleInfo.metadata.length);
              expect(hapModuleInfo.metadata.length >= 0).assertTrue();

              console.log(`Acts_ActionExtensionAbility_1900 success`);
              setTimeout(async () => {
                commonEvent.unsubscribe(subscriber, async (err, data) => {
                  globalThis.terminate('Acts_ActionExtensionAbility_1900');
                  setTimeout(() => {
                    console.info(`====>Acts_ActionExtensionAbility_1900 unSubscribeCallback`);
                    done();
                  }, 2000);
                });
              }, 1000);
            } catch (err) {
              globalThis.terminate('Acts_ActionExtensionAbility_1900');
              setTimeout(() => {
                console.log(`Acts_ActionExtensionAbility_1900 fail: ` + err);
                expect().assertFail();
              }, 1000);
            }
          }
        });
      });
    })

    /**
     * @tc.name   Acts_ActionExtensionAbility_2000
     * @tc.number Acts_ActionExtensionAbility_2000
     * @tc.desc   Test config in context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_ActionExtensionAbility_2000', Level.LEVEL0, async (done: Function) => {
      await sleep(500);
      let subscriber: commonEvent.CommonEventSubscriber | undefined = undefined;
      let subscribeInfo: commonEvent.CommonEventSubscribeInfo = {
        events: ['ACTS_TEST_CONTEXT']
      };
      await commonEvent.createSubscriber(subscribeInfo).then(async (data) => {
        console.log("createSubscriber data : " + JSON.stringify(data));
        subscriber = data;
        context.startAbility(CONTEXT_WANT, (err) => {
          expect(err.code).assertEqual(0);
        });
        commonEvent.subscribe(subscriber, async (err, data) => {
          console.log("SubscribeInfoCallback : " + JSON.stringify(data));
          if (data.event == 'ACTS_TEST_CONTEXT') {
            try {
              expect(data.parameters?.context != null).assertTrue();
              expect(data.parameters?.context != null).assertTrue();
              let config:ESObject = data.parameters?.context.config as ESObject;
              expect(config != null).assertTrue();
              console.log(`Acts_ActionExtensionAbility_2000 config.colorMode: ` + config.colorMode);
              expect(typeof (config.colorMode) == 'number').assertTrue();
              console.log(`Acts_ActionExtensionAbility_2000 config.direction: ` + config.direction);
              expect(typeof (config.direction) == 'number').assertTrue();
              console.log(`Acts_ActionExtensionAbility_2000 success`);
              setTimeout(async () => {
                commonEvent.unsubscribe(subscriber, async (err, data) => {
                  globalThis.terminate('Acts_ActionExtensionAbility_2000');
                  setTimeout(() => {
                    console.info(`====>Acts_ActionExtensionAbility_2000 unSubscribeCallback`);
                    done();
                  }, 2000);
                });
              }, 1000);
            } catch (err) {
              globalThis.terminate('Acts_ActionExtensionAbility_2000');
              setTimeout(() => {
                console.log(`Acts_ActionExtensionAbility_2000 fail: ` + err);
                expect().assertFail();
              }, 1000);
            }
          }
        });
      });
    })

    /**
     * @tc.name   Acts_ActionExtensionAbility_2100
     * @tc.number Acts_ActionExtensionAbility_2100
     * @tc.desc   Test extensionAbilityInfo in context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_ActionExtensionAbility_2100', Level.LEVEL0, async (done: Function) => {
      await sleep(500);
      let subscriber: commonEvent.CommonEventSubscriber | undefined = undefined;
      let subscribeInfo: commonEvent.CommonEventSubscribeInfo = {
        events: ['ACTS_TEST_CONTEXT']
      };
      await commonEvent.createSubscriber(subscribeInfo).then(async (data) => {
        console.log("createSubscriber data : " + JSON.stringify(data));
        subscriber = data;
        context.startAbility(CONTEXT_WANT, (err) => {
          expect(err.code).assertEqual(0);
        });
        commonEvent.subscribe(subscriber, async (err, data) => {
          console.log("SubscribeInfoCallback : " + JSON.stringify(data));
          if (data.event == 'ACTS_TEST_CONTEXT') {
            try {
              expect(data.parameters?.context != null).assertTrue();
              let extensionAbilityInfo:ESObject = data.parameters?.context.extensionAbilityInfo as ESObject;
              expect(extensionAbilityInfo != null).assertTrue();
              console.log(`Acts_ActionExtensionAbility_2100 extensionAbilityInfo: ` + JSON.stringify(extensionAbilityInfo));
              expect(extensionAbilityInfo.bundleName == 'com.example.actsactionextensionabilitytest').assertTrue();
              console.log(`extensionAbilityInfo.descriptionId: ` + JSON.stringify(extensionAbilityInfo.descriptionId));
              expect(typeof (extensionAbilityInfo.descriptionId) == 'number').assertTrue();
              console.log(`extensionAbilityInfo.enabled: ` + JSON.stringify(extensionAbilityInfo.enabled));
              expect(typeof (extensionAbilityInfo.enabled) == 'boolean').assertTrue();
              console.log(`extensionAbilityInfo.exported: ` + JSON.stringify(extensionAbilityInfo.exported));
              expect(typeof (extensionAbilityInfo.exported) == 'boolean').assertTrue();
              console.log(`extensionAbilityInfo.extensionAbilityType: ` + JSON.stringify(extensionAbilityInfo.extensionAbilityType));
              expect(extensionAbilityInfo.extensionAbilityType == 19).assertTrue();
              console.log(`extensionAbilityInfo.iconId: ` + JSON.stringify(extensionAbilityInfo.iconId));
              expect(typeof (extensionAbilityInfo.iconId) == 'number').assertTrue();
              console.log(`extensionAbilityInfo.isVisible: ` + JSON.stringify(extensionAbilityInfo.isVisible));
              expect(typeof (extensionAbilityInfo.isVisible) == 'boolean').assertTrue();
              console.log(`extensionAbilityInfo.labelId: ` + JSON.stringify(extensionAbilityInfo.labelId));
              expect(typeof (extensionAbilityInfo.labelId) == 'number').assertTrue();
              console.log(`extensionAbilityInfo.moduleName: ` + JSON.stringify(extensionAbilityInfo.moduleName));
              expect(extensionAbilityInfo.moduleName == 'entry').assertTrue();
              console.log(`extensionAbilityInfo.name: ` + JSON.stringify(extensionAbilityInfo.name));
              expect(extensionAbilityInfo.name == 'UIExtAbility').assertTrue();
              setTimeout(async () => {
                commonEvent.unsubscribe(subscriber, async (err, data) => {
                  globalThis.terminate('Acts_ActionExtensionAbility_2100');
                  setTimeout(() => {
                    console.info(`====>Acts_ActionExtensionAbility_2100 unSubscribeCallback`);
                    done();
                  }, 2000);
                });
              }, 1000);
            } catch (err) {
              globalThis.terminate('Acts_ActionExtensionAbility_2100');
              setTimeout(() => {
                console.log(`Acts_ActionExtensionAbility_2100 fail: ` + err);
                expect().assertFail();
              }, 1000);
            }
          }
        });
      });
    })

    /**
     * @tc.name   Acts_ActionExtensionAbility_2200
     * @tc.number Acts_ActionExtensionAbility_2200
     * @tc.desc   Test resourceManager in context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_ActionExtensionAbility_2200', Level.LEVEL0, async (done: Function) => {
      await sleep(500);
      let subscriber: commonEvent.CommonEventSubscriber | undefined = undefined;
      let subscribeInfo: commonEvent.CommonEventSubscribeInfo = {
        events: ['ACTS_CALL_EVENT']
      };

      await commonEvent.createSubscriber(subscribeInfo).then(async (data) => {
        console.log("createSubscriber data : " + JSON.stringify(data));
        subscriber = data;
        context.startAbility({
          bundleName: 'com.example.actsactionextensionabilitytest',
          abilityName: 'EntryAbility',
          action: 'Acts_ActionExtensionAbility_2200'
        }, (err:BusinessError) => {
          expect(err.code).assertEqual(0);
        });
        commonEvent.subscribe(subscriber, async (err, data) => {
          console.log("SubscribeInfoCallback : " + JSON.stringify(data));
          if (data.event == 'ACTS_CALL_EVENT') {
            expect(data.parameters?.resourceManager != null).assertTrue();
            console.log('Acts_ActionExtensionAbility_2200 success');
            commonEvent.unsubscribe(subscriber, async (err, data) => {
              globalThis.terminate('Acts_ActionExtensionAbility_2200');
              setTimeout(() => {
                console.info(`====>Acts_ActionExtensionAbility_2200 unSubscribeCallback`);
                done();
              }, 1000);
            });
          }
        });
      });
    })

    /**
     * @tc.name   Acts_ActionExtensionAbility_2300
     * @tc.number Acts_ActionExtensionAbility_2300
     * @tc.desc   Test applicationInfo in context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_ActionExtensionAbility_2300', Level.LEVEL0, async (done: Function) => {
      await sleep(500);
      let subscriber: commonEvent.CommonEventSubscriber | undefined = undefined;
      let subscribeInfo: commonEvent.CommonEventSubscribeInfo = {
        events: ['ACTS_CALL_EVENT']
      };

      await commonEvent.createSubscriber(subscribeInfo).then(async (data) => {
        console.log("createSubscriber data : " + JSON.stringify(data));
        subscriber = data;
        context.startAbility({
          bundleName: 'com.example.actsactionextensionabilitytest',
          abilityName: 'EntryAbility',
          action: 'Acts_ActionExtensionAbility_2300'
        }, (err:BusinessError) => {
          expect(err.code).assertEqual(0);
        });
        commonEvent.subscribe(subscriber, async (err, data) => {
          console.log("SubscribeInfoCallback : " + JSON.stringify(data));
          if (data.event == 'ACTS_CALL_EVENT') {
            console.log(`Acts_ActionExtensionAbility_2300 applicationInfo.name: ` + data.parameters?.name);
            expect(data.parameters?.name == 'com.example.actsactionextensionabilitytest').assertTrue();
            console.log(`Acts_ActionExtensionAbility_2300 applicationInfo.description: ` + data.parameters?.description_length);
            expect(data.parameters?.description_length >= 0).assertTrue();
            console.log(`Acts_ActionExtensionAbility_2300 applicationInfo.descriptionId: ` + data.parameters?.descriptionId);
            expect(data.parameters?.descriptionId == 0).assertTrue();
            console.log(`Acts_ActionExtensionAbility_2300 applicationInfo.label: ` + data.parameters?.label);
            expect(data.parameters?.label == '$string:app_name').assertTrue();
            console.log(`Acts_ActionExtensionAbility_2300 applicationInfo.labelId: ` + data.parameters?.labelId);
            expect(data.parameters?.labelId != null).assertTrue();
            console.log(`Acts_ActionExtensionAbility_2300 applicationInfo.icon: ` + data.parameters?.icon);
            expect(data.parameters?.icon == '$media:app_icon').assertTrue();
            console.log(`Acts_ActionExtensionAbility_2300 applicationInfo.iconId: ` + data.parameters?.iconId);
            expect(data.parameters?.iconId != null).assertTrue();
            console.log(`Acts_ActionExtensionAbility_2300 applicationInfo.codePath: ` + data.parameters?.codePath);
            expect(data.parameters?.codePath == 'string').assertTrue();
            console.log(`Acts_ActionExtensionAbility_2300 success`);

            commonEvent.unsubscribe(subscriber, async (err, data) => {
              globalThis.terminate('Acts_ActionExtensionAbility_2300');
              setTimeout(() => {
                console.info(`====>Acts_ActionExtensionAbility_2300 unSubscribeCallback`);
                done();
              }, 1000);
            });
          }
        });
      });
    })

    /**
     * @tc.name   Acts_ActionExtensionAbility_2400
     * @tc.number Acts_ActionExtensionAbility_2400
     * @tc.desc   Test cacheDir in context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_ActionExtensionAbility_2400', Level.LEVEL0, async (done: Function) => {
      await sleep(500);
      let subscriber: commonEvent.CommonEventSubscriber | undefined = undefined;
      let subscribeInfo: commonEvent.CommonEventSubscribeInfo = {
        events: ['ACTS_CALL_EVENT']
      };

      await commonEvent.createSubscriber(subscribeInfo).then(async (data) => {
        console.log("createSubscriber data : " + JSON.stringify(data));
        subscriber = data;
        context.startAbility({
          bundleName: 'com.example.actsactionextensionabilitytest',
          abilityName: 'EntryAbility',
          action: 'Acts_ActionExtensionAbility_2400'
        }, (err:BusinessError) => {
          expect(err.code).assertEqual(0);
        });
        commonEvent.subscribe(subscriber, async (err, data) => {
          console.log("SubscribeInfoCallback : " + JSON.stringify(data));
          if (data.event == 'ACTS_CALL_EVENT') {
            let cacheDir:ESObject = data.parameters?.cacheDir as ESObject;
            console.log(`Acts_ActionExtensionAbility_2400 cacheDir:` + cacheDir);
            expect(typeof (cacheDir) == 'string').assertTrue();
            console.log(`Acts_ActionExtensionAbility_2400 success`);

            commonEvent.unsubscribe(subscriber, async (err, data) => {
              globalThis.terminate('Acts_ActionExtensionAbility_2400');
              setTimeout(() => {
                console.info(`====>Acts_ActionExtensionAbility_2400 unSubscribeCallback`);
                done();
              }, 1000);
            });
          }
        });
      });
    })

    /**
     * @tc.name   Acts_ActionExtensionAbility_2500
     * @tc.number Acts_ActionExtensionAbility_2500
     * @tc.desc   Test tempDir in context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_ActionExtensionAbility_2500', Level.LEVEL0, async (done: Function) => {
      await sleep(500);
      let subscriber: commonEvent.CommonEventSubscriber | undefined = undefined;
      let subscribeInfo: commonEvent.CommonEventSubscribeInfo = {
        events: ['ACTS_CALL_EVENT']
      };

      await commonEvent.createSubscriber(subscribeInfo).then(async (data) => {
        console.log("createSubscriber data : " + JSON.stringify(data));
        subscriber = data;
        context.startAbility({
          bundleName: 'com.example.actsactionextensionabilitytest',
          abilityName: 'EntryAbility',
          action: 'Acts_ActionExtensionAbility_2500'
        }, (err:BusinessError) => {
          expect(err.code).assertEqual(0);
        });
        commonEvent.subscribe(subscriber, async (err, data) => {
          console.log("SubscribeInfoCallback : " + JSON.stringify(data));
          if (data.event == 'ACTS_CALL_EVENT') {
            let tempDir:string = data.parameters?.tempDir as string;
            console.log(`Acts_ActionExtensionAbility_2500 tempDir:` + tempDir);
            expect(typeof (tempDir) == 'string').assertTrue();
            console.log(`Acts_ActionExtensionAbility_2500 success`);

            commonEvent.unsubscribe(subscriber, async (err, data) => {
              globalThis.terminate('Acts_ActionExtensionAbility_2500');
              setTimeout(() => {
                console.info(`====>Acts_ActionExtensionAbility_2500 unSubscribeCallback`);
                done();
              }, 1000);
            });
          }
        });
      });
    })

    /**
     * @tc.name   Acts_ActionExtensionAbility_2600
     * @tc.number Acts_ActionExtensionAbility_2600
     * @tc.desc   Test filesDir in context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_ActionExtensionAbility_2600', Level.LEVEL0, async (done: Function) => {
      await sleep(500);
      let subscriber: commonEvent.CommonEventSubscriber | undefined = undefined;
      let subscribeInfo: commonEvent.CommonEventSubscribeInfo = {
        events: ['ACTS_CALL_EVENT']
      };

      await commonEvent.createSubscriber(subscribeInfo).then(async (data) => {
        console.log("createSubscriber data : " + JSON.stringify(data));
        subscriber = data;
        context.startAbility({
          bundleName: 'com.example.actsactionextensionabilitytest',
          abilityName: 'EntryAbility',
          action: 'Acts_ActionExtensionAbility_2600'
        }, (err:BusinessError) => {
          expect(err.code).assertEqual(0);
        });
        commonEvent.subscribe(subscriber, async (err, data) => {
          console.log("SubscribeInfoCallback : " + JSON.stringify(data));
          if (data.event == 'ACTS_CALL_EVENT') {
            let filesDir: string = data.parameters?.filesDir as string;
            console.log(`Acts_ActionExtensionAbility_2600 filesDir:` + filesDir);
            expect(typeof (filesDir) == 'string').assertTrue();
            console.log(`Acts_ActionExtensionAbility_2600 success`);
            commonEvent.unsubscribe(subscriber, async (err, data) => {
              globalThis.terminate('Acts_ActionExtensionAbility_2600');
              setTimeout(() => {
                console.info(`====>Acts_ActionExtensionAbility_2600 unSubscribeCallback`);
                done();
              }, 1000);
            });
          }
        });
      });
    })

    /**
     * @tc.name   Acts_ActionExtensionAbility_2700
     * @tc.number Acts_ActionExtensionAbility_2700
     * @tc.desc   Test databaseDir in context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_ActionExtensionAbility_2700', Level.LEVEL0, async (done: Function) => {
      await sleep(500);
      let subscriber: commonEvent.CommonEventSubscriber | undefined = undefined;
      let subscribeInfo: commonEvent.CommonEventSubscribeInfo = {
        events: ['ACTS_CALL_EVENT']
      };

      await commonEvent.createSubscriber(subscribeInfo).then(async (data) => {
        console.log("createSubscriber data : " + JSON.stringify(data));
        subscriber = data;
        context.startAbility({
          bundleName: 'com.example.actsactionextensionabilitytest',
          abilityName: 'EntryAbility',
          action: 'Acts_ActionExtensionAbility_2700'
        }, (err:BusinessError) => {
          expect(err.code).assertEqual(0);
        });
        commonEvent.subscribe(subscriber, async (err, data) => {
          console.log("SubscribeInfoCallback : " + JSON.stringify(data));
          if (data.event == 'ACTS_CALL_EVENT') {
            let databaseDir: string = data.parameters?.databaseDir as string;
            console.log(`Acts_ActionExtensionAbility_2700 databaseDir:` + databaseDir);
            expect(typeof (databaseDir) == 'string').assertTrue();
            console.log(`Acts_ActionExtensionAbility_2700 success`);
            commonEvent.unsubscribe(subscriber, async (err, data) => {
              globalThis.terminate('Acts_ActionExtensionAbility_2700');
              setTimeout(() => {
                console.info(`====>Acts_ActionExtensionAbility_2700 unSubscribeCallback`);
                done();
              }, 1000);
            });
          }
        });
      });
    })

    /**
     * @tc.name   Acts_ActionExtensionAbility_2800
     * @tc.number Acts_ActionExtensionAbility_2800
     * @tc.desc   Test preferencesDir in context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_ActionExtensionAbility_2800', Level.LEVEL0, async (done: Function) => {
      await sleep(500);
      let subscriber: commonEvent.CommonEventSubscriber | undefined = undefined;
      let subscribeInfo: commonEvent.CommonEventSubscribeInfo = {
        events: ['ACTS_CALL_EVENT']
      };

      await commonEvent.createSubscriber(subscribeInfo).then(async (data) => {
        console.log("createSubscriber data : " + JSON.stringify(data));
        subscriber = data;
        context.startAbility({
          bundleName: 'com.example.actsactionextensionabilitytest',
          abilityName: 'EntryAbility',
          action: 'Acts_ActionExtensionAbility_2800'
        }, (err:BusinessError) => {
          expect(err.code).assertEqual(0);
        });
        commonEvent.subscribe(subscriber, async (err, data) => {
          console.log("SubscribeInfoCallback : " + JSON.stringify(data));
          if (data.event == 'ACTS_CALL_EVENT') {
            let preferencesDir: string = data.parameters?.preferencesDir as string;
            console.log(`Acts_ActionExtensionAbility_2800 preferencesDir:` + preferencesDir);
            expect(typeof (preferencesDir) == 'string').assertTrue();
            console.log(`Acts_ActionExtensionAbility_2800 success`);

            commonEvent.unsubscribe(subscriber, async (err, data) => {
              globalThis.terminate('Acts_ActionExtensionAbility_2800');
              setTimeout(() => {
                console.info(`====>Acts_ActionExtensionAbility_2800 unSubscribeCallback`);
                done();
              }, 1000);
            });
          }
        });
      });
    })

    /**
     * @tc.name   Acts_ActionExtensionAbility_2900
     * @tc.number Acts_ActionExtensionAbility_2900
     * @tc.desc   Test bundleCodeDir in context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_ActionExtensionAbility_2900', Level.LEVEL0, async (done: Function) => {
      await sleep(500);
      let subscriber: commonEvent.CommonEventSubscriber | undefined = undefined;
      let subscribeInfo: commonEvent.CommonEventSubscribeInfo = {
        events: ['ACTS_CALL_EVENT']
      };

      await commonEvent.createSubscriber(subscribeInfo).then(async (data) => {
        console.log("createSubscriber data : " + JSON.stringify(data));
        subscriber = data;
        context.startAbility({
          bundleName: 'com.example.actsactionextensionabilitytest',
          abilityName: 'EntryAbility',
          action: 'Acts_ActionExtensionAbility_2900'
        }, (err:BusinessError) => {
          expect(err.code).assertEqual(0);
        });
        commonEvent.subscribe(subscriber, async (err, data) => {
          console.log("SubscribeInfoCallback : " + JSON.stringify(data));
          if (data.event == 'ACTS_CALL_EVENT') {
            let bundleCodeDir: string = data.parameters?.bundleCodeDir as string;
            console.log(`Acts_ActionExtensionAbility_2900 bundleCodeDir:` + bundleCodeDir);
            expect(typeof (bundleCodeDir) == 'string').assertTrue();
            console.log(`Acts_ActionExtensionAbility_2900 success`);

            commonEvent.unsubscribe(subscriber, async (err, data) => {
              globalThis.terminate('Acts_ActionExtensionAbility_2900');
              setTimeout(() => {
                console.info(`====>Acts_ActionExtensionAbility_2900 unSubscribeCallback`);
                done();
              }, 1000);
            });
          }
        });
      });
    })

    /**
     * @tc.name   Acts_ActionExtensionAbility_3000
     * @tc.number Acts_ActionExtensionAbility_3000
     * @tc.desc   Context calls createModuleContext, passing in the moduleName of the current application hap1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_ActionExtensionAbility_3000', Level.LEVEL0, async (done: Function) => {
      await sleep(500);
      let subscriber: commonEvent.CommonEventSubscriber | undefined = undefined;
      let subscribeInfo: commonEvent.CommonEventSubscribeInfo = {
        events: ['ACTS_TEST_CONTEXT']
      };
      await commonEvent.createSubscriber(subscribeInfo).then(async (data) => {
        console.log("createSubscriber data : " + JSON.stringify(data));
        subscriber = data;
        context.startAbility({
          bundleName: 'com.example.actsactionextensionabilitytest',
          abilityName: 'EntryAbility',
          action: 'Acts_ActionExtensionAbility_3000'
        }, (err:BusinessError) => {
          expect(err.code).assertEqual(0);
        });
        commonEvent.subscribe(subscriber, async (err, data) => {
          console.log("SubscribeInfoCallback : " + JSON.stringify(data));
          if (data.event == 'ACTS_TEST_CONTEXT') {
            try {
              expect(data.parameters?.bundleName != null).assertTrue();
              expect(data.parameters?.bundleName).assertEqual("com.example.actsactionextensionabilitytest");
              setTimeout(async () => {
                commonEvent.unsubscribe(subscriber, async (err, data) => {
                  globalThis.terminate('Acts_ActionExtensionAbility_3000');
                  setTimeout(() => {
                    console.info(`====>Acts_ActionExtensionAbility_3000 unSubscribeCallback`);
                    done();
                  }, 1000);
                });
              }, 1000);
            } catch (err) {
              globalThis.terminate('Acts_ActionExtensionAbility_3000');
              setTimeout(() => {
                console.log(`Acts_ActionExtensionAbility_3000 fail: ` + err);
                expect().assertFail();
              }, 1000);
            }
          }
        });
      });
    })

    /**
     * @tc.name   Acts_ActionExtensionAbility_3100
     * @tc.number Acts_ActionExtensionAbility_3100
     * @tc.desc   Context calls createModuleContext, passing in the moduleName of the current application hap2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_ActionExtensionAbility_3100', Level.LEVEL0, async (done: Function) => {
      await sleep(500);
      let subscriber: commonEvent.CommonEventSubscriber | undefined = undefined;
      let subscribeInfo: commonEvent.CommonEventSubscribeInfo = {
        events: ['ACTS_TEST_CONTEXT']
      };
      await commonEvent.createSubscriber(subscribeInfo).then(async (data) => {
        console.log("createSubscriber data : " + JSON.stringify(data));
        subscriber = data;
        context.startAbility({
          bundleName: 'com.example.actsactionextensionabilitytest',
          abilityName: 'EntryAbility',
          action: 'Acts_ActionExtensionAbility_3100'
        }, (err:BusinessError) => {
          expect(err.code).assertEqual(0);
        });
        commonEvent.subscribe(subscriber, async (err, data) => {
          console.log("SubscribeInfoCallback : " + JSON.stringify(data));
          if (data.event == 'ACTS_TEST_CONTEXT') {
            try {
              expect(data.parameters?.bundleName != null).assertTrue();
              expect(data.parameters?.bundleName).assertEqual("com.example.actsactionextensionabilitytest");
              setTimeout(async () => {
                commonEvent.unsubscribe(subscriber, async (err, data) => {
                  globalThis.terminate('Acts_ActionExtensionAbility_3000');
                  setTimeout(() => {
                    console.info(`====>Acts_ActionExtensionAbility_3000 unSubscribeCallback`);
                    done();
                  }, 1000);
                });
              }, 1000);
            } catch (err) {
              globalThis.terminate('Acts_ActionExtensionAbility_3100');
              setTimeout(() => {
                console.log(`Acts_ActionExtensionAbility_3100 fail: ` + err);
                expect().assertFail();
              }, 1000);
            }
          }
        });
      });
    })

    /**
     * @tc.name   Acts_ActionExtensionAbility_3200
     * @tc.number Acts_ActionExtensionAbility_3200
     * @tc.desc   Context calls createModuleContext, passing in the moduleName of the cross-application hap1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_ActionExtensionAbility_3200', Level.LEVEL0, async (done: Function) => {
      await sleep(500);
      let subscriber: commonEvent.CommonEventSubscriber | undefined = undefined;
      let subscribeInfo: commonEvent.CommonEventSubscribeInfo = {
        events: ['ACTS_TEST_CONTEXT']
      };
      await commonEvent.createSubscriber(subscribeInfo).then(async (data) => {
        console.log("createSubscriber data : " + JSON.stringify(data));
        subscriber = data;
        context.startAbility({
          bundleName: 'com.example.actsactionextensionabilitytest',
          abilityName: 'EntryAbility',
          action: 'Acts_ActionExtensionAbility_3200'
        }, (err:BusinessError) => {
          expect(err.code).assertEqual(0);
        });
        commonEvent.subscribe(subscriber, async (err, data) => {
          console.log("SubscribeInfoCallback : " + JSON.stringify(data));
          if (data.event == 'ACTS_TEST_CONTEXT') {
            try {
              expect(!data.parameters?.moduleContext).assertTrue();
              setTimeout(async () => {
                commonEvent.unsubscribe(subscriber, async (err, data) => {
                  globalThis.terminate('Acts_ActionExtensionAbility_3200');
                  setTimeout(() => {
                    console.info(`====>Acts_ActionExtensionAbility_3200 unSubscribeCallback`);
                    done();
                  }, 1000);
                });
              }, 1000);
            } catch (err) {
              globalThis.terminate('Acts_ActionExtensionAbility_3200');
              setTimeout(() => {
                console.log(`Acts_ActionExtensionAbility_3200 fail: ` + err);
                expect().assertFail();
              }, 1000);
            }
          }
        });
      });
    })

    /**
     * @tc.name   Acts_ActionExtensionAbility_3300
     * @tc.number Acts_ActionExtensionAbility_3300
     * @tc.desc   Context calls createModuleContext, passing in a non-existing moduleName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_ActionExtensionAbility_3300', Level.LEVEL0, async (done: Function) => {
      await sleep(500);
      let subscriber: commonEvent.CommonEventSubscriber | undefined = undefined;
      let subscribeInfo: commonEvent.CommonEventSubscribeInfo = {
        events: ['ACTS_TEST_CONTEXT']
      };
      await commonEvent.createSubscriber(subscribeInfo).then(async (data) => {
        console.log("createSubscriber data : " + JSON.stringify(data));
        subscriber = data;
        context.startAbility({
          bundleName: 'com.example.actsactionextensionabilitytest',
          abilityName: 'EntryAbility',
          action: 'Acts_ActionExtensionAbility_3300'
        }, (err:BusinessError) => {
          expect(err.code).assertEqual(0);
        });
        commonEvent.subscribe(subscriber, async (err, data) => {
          console.log("SubscribeInfoCallback : " + JSON.stringify(data));
          if (data.event == 'ACTS_TEST_CONTEXT') {
            try {
              expect(!data.parameters?.moduleContext).assertTrue();
              setTimeout(async () => {
                commonEvent.unsubscribe(subscriber, async (err, data) => {
                  globalThis.terminate('Acts_ActionExtensionAbility_3300');
                  setTimeout(() => {
                    console.info(`====>Acts_ActionExtensionAbility_3300 unSubscribeCallback`);
                    done();
                  }, 1000);
                });
              }, 1000);
            } catch (err) {
              globalThis.terminate('Acts_ActionExtensionAbility_3300');
              setTimeout(() => {
                console.log(`Acts_ActionExtensionAbility_3300 fail: ` + err);
                expect().assertFail();
              }, 1000);
            }
          }
        });
      });
    })

    /**
     * @tc.name   Acts_ActionExtensionAbility_3400
     * @tc.number Acts_ActionExtensionAbility_3400
     * @tc.desc   Context calls createModuleContext, and the incoming moduleName is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_ActionExtensionAbility_3400', Level.LEVEL0, async (done: Function) => {
      await sleep(500);
      let subscriber: commonEvent.CommonEventSubscriber | undefined = undefined;
      let subscribeInfo: commonEvent.CommonEventSubscribeInfo = {
        events: ['ACTS_TEST_CONTEXT']
      };
      await commonEvent.createSubscriber(subscribeInfo).then(async (data) => {
        console.log("createSubscriber data : " + JSON.stringify(data));
        subscriber = data;
        context.startAbility({
          bundleName: 'com.example.actsactionextensionabilitytest',
          abilityName: 'EntryAbility',
          action: 'Acts_ActionExtensionAbility_3400'
        }, (err:BusinessError) => {
          expect(err.code).assertEqual(0);
        });
        commonEvent.subscribe(subscriber, async (err, data) => {
          console.log("SubscribeInfoCallback : " + JSON.stringify(data));
          if (data.event == 'ACTS_TEST_CONTEXT') {
            try {
              expect(!data.parameters?.moduleContext).assertTrue();
              setTimeout(async () => {
                commonEvent.unsubscribe(subscriber, async (err, data) => {
                  globalThis.terminate('Acts_ActionExtensionAbility_3400');
                  setTimeout(() => {
                    console.info(`====>Acts_ActionExtensionAbility_3400 unSubscribeCallback`);
                    done();
                  }, 1000);
                });
              }, 1000);
            } catch (err) {
              globalThis.terminate('Acts_ActionExtensionAbility_3400');
              setTimeout(() => {
                console.log(`Acts_ActionExtensionAbility_3400 fail: ` + err);
                expect().assertFail();
              }, 1000);
            }
          }
        });
      });
    })

    /**
     * @tc.name   Acts_ActionExtensionAbility_3500
     * @tc.number Acts_ActionExtensionAbility_3500
     * @tc.desc   test getApplicationContext return not empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Acts_ActionExtensionAbility_3500', Level.LEVEL0, async (done: Function) => {
      await sleep(500);
      let subscriber: commonEvent.CommonEventSubscriber | undefined = undefined;
      let subscribeInfo: commonEvent.CommonEventSubscribeInfo = {
        events: ['ACTS_TEST_CONTEXT']
      };
      await commonEvent.createSubscriber(subscribeInfo).then(async (data) => {
        console.log("createSubscriber data : " + JSON.stringify(data));
        subscriber = data;
        context.startAbility({
          bundleName: 'com.example.actsactionextensionabilitytest',
          abilityName: 'EntryAbility',
          action: 'Acts_ActionExtensionAbility_3500'
        }, (err:BusinessError) => {
          expect(err.code).assertEqual(0);
        });
        commonEvent.subscribe(subscriber, async (err, data) => {
          console.log("SubscribeInfoCallback : " + JSON.stringify(data));
          if (data.event == 'ACTS_TEST_CONTEXT') {
            try {
              expect(data.parameters?.applicationContext != null).assertTrue();
              setTimeout(async () => {
                commonEvent.unsubscribe(subscriber, async (err, data) => {
                  globalThis.terminate('Acts_ActionExtensionAbility_3500');
                  setTimeout(() => {
                    console.info(`====>Acts_ActionExtensionAbility_3500 unSubscribeCallback`);
                    done();
                  }, 1000);
                });
              }, 1000);
            } catch (err) {
              globalThis.terminate('Acts_ActionExtensionAbility_3500');
              setTimeout(() => {
                console.log(`Acts_ActionExtensionAbility_3500 fail: ` + err);
                expect().assertFail();
              }, 1000);
            }
          }
        });
      });
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AMS_WantShowMode_0100
     * @tc.number SUB_Ability_AbilityRuntime_AMS_WantShowMode_0100
     * @tc.desc   Test ShowMode value EMBEDDED_FULL pull failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AMS_WantShowMode_0100', Level.LEVEL0, async (done:Function) => {
      let subscriber: commonEvent.CommonEventSubscriber | undefined = undefined;
      let subscribeCallBack = async (err: BusinessError, data: commonEvent.CommonEventData) => {
        console.log('====>SUB_Ability_AbilityRuntime_AMS_WantShowMode_0100 subscribeCallBack :' + JSON.stringify(data));
        expect(data.event === 'ACTS_TEST_EMBEDDED_FULL').assertTrue();
        commonEvent.unsubscribe(subscriber, async (err, data) => {
          console.info(`====>SUB_Ability_AbilityRuntime_AMS_WantShowMode_0100 unSubscribeCallback`);
          done();
        });
      }
      commonEvent.createSubscriber(ACTS_WANT_SHOW_MODE_EVENT).then(async (data) => {
        console.info(`====>SUB_Ability_AbilityRuntime_AMS_WantShowMode_0100 createSubscriber  ${data}`);
        subscriber = data;
        commonEvent.subscribe(data, subscribeCallBack);
        context.startAbility({
          bundleName: 'com.example.actsactionextensionabilitytest',
          abilityName: 'TestWantShowModeAbility',
          action: 'SUB_Ability_AbilityRuntime_WantShowMode_0100'
        }, (err:BusinessError) => {
          console.info(`====>SUB_Ability_AbilityRuntime_AMS_WantShowMode_0100 createSubscriber  ` + JSON.stringify(err));
          expect(err.code).assertEqual(0);
        });
      });
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AMS_WantShowMode_0200
     * @tc.number SUB_Ability_AbilityRuntime_AMS_WantShowMode_0200
     * @tc.desc   Test ShowMode value WINDOW pull failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AMS_WantShowMode_0200', Level.LEVEL0, async (done:Function) => {
      let subscriber: commonEvent.CommonEventSubscriber | undefined = undefined;
      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        console.log('====>SUB_Ability_AbilityRuntime_AMS_WantShowMode_0200 subscribeCallBack :' + JSON.stringify(data));
        expect(data.event == 'ACTS_TEST_WINDOW').assertTrue();
        commonEvent.unsubscribe(subscriber, async (err, data) => {
          console.info(`====>SUB_Ability_AbilityRuntime_AMS_WantShowMode_0200 unSubscribeCallback`);
          done();
        });
      }
      commonEvent.createSubscriber(ACTS_WANT_SHOW_MODE_EVENT).then(async (data) => {
        console.info(`====>SUB_Ability_AbilityRuntime_AMS_WantShowMode_0200 createSubscriber  ${data}`);
        subscriber = data;
        commonEvent.subscribe(data, subscribeCallBack);
        context.startAbility({
          bundleName: 'com.example.actsactionextensionabilitytest',
          abilityName: 'TestWantShowModeWindowAbility',
          action: 'SUB_Ability_AbilityRuntime_AMS_WantShowMode_0200'
        }, (err:BusinessError) => {
          console.info(`====>SUB_Ability_AbilityRuntime_AMS_WantShowMode_0200 createSubscriber  ` + JSON.stringify(err));
          expect(err.code).assertEqual(0);
        });
      });
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AMS_WantShowMode_0300
     * @tc.number SUB_Ability_AbilityRuntime_AMS_WantShowMode_0300
     * @tc.desc   Test ShowMode value EMBEDDED_FULL pull failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AMS_WantShowMode_0300', Level.LEVEL0, async (done:Function) => {
      let wantParam: Record<string, Object> = {};
      wantParam[wantConstant.Params.SHOW_MODE_KEY] = wantConstant.ShowMode.EMBEDDED_FULL;
      let flag = false;
      let abilityStartCallback: common.AbilityStartCallback = {
        onError: (code: number, name: string, message: string) => {
          flag = true;
        }
      }
      context.startAbilityByType("share", wantParam, abilityStartCallback, (err) => {
        if (err) {
          console.log('====>SUB_Ability_AbilityRuntime_AMS_WantShowMode_0300 :' + JSON.stringify(err));
        }
      });
      await sleep(1000);
      expect(flag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AMS_WantShowMode_0400
     * @tc.number SUB_Ability_AbilityRuntime_AMS_WantShowMode_0400
     * @tc.desc   Test ShowMode value WINDOW pull failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AMS_WantShowMode_0400', Level.LEVEL0, async (done:Function) => {
      let wantParam: Record<string, Object> = {};
      wantParam[wantConstant.Params.SHOW_MODE_KEY] = wantConstant.ShowMode.WINDOW;
      let flag = false;
      let abilityStartCallback: common.AbilityStartCallback = {
        onError: (code: number, name: string, message: string) => {
          flag = true;
        }
      }
      context.startAbilityByType("share", wantParam, abilityStartCallback, (err) => {
        if (err) {
          console.log('====>SUB_Ability_AbilityRuntime_AMS_WantShowMode_0400 :' + JSON.stringify(err));
        }
      });
      await sleep(1000);
      expect(flag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AMS_WantShowMode_0500
     * @tc.number SUB_Ability_AbilityRuntime_AMS_WantShowMode_0500
     * @tc.desc   Test ShowMode value EMBEDDED_FULL pull success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AMS_WantShowMode_0500', Level.LEVEL0, async (done:Function) => {
      let ACTS_START_ABILITY_MODE_EVENT: commonEvent.CommonEventSubscribeInfo = {
        events: ['ACTS_START_ABILITY']
      };
      let subscriber: commonEvent.CommonEventSubscriber | undefined = undefined;
      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        console.log('====>SUB_Ability_AbilityRuntime_AMS_WantShowMode_0500 subscribeCallBack :' + JSON.stringify(data));
        expect(data.event == 'ACTS_START_ABILITY').assertTrue();
        commonEvent.unsubscribe(subscriber, async (err, data) => {
          console.info(`====>SUB_Ability_AbilityRuntime_AMS_WantShowMode_0500 unSubscribeCallback`);
          done();
        });
      }
      commonEvent.createSubscriber(ACTS_START_ABILITY_MODE_EVENT).then(async (data) => {
        console.info(`====>SUB_Ability_AbilityRuntime_AMS_WantShowMode_0500 createSubscriber  ${data}`);
        subscriber = data;
        commonEvent.subscribe(data, subscribeCallBack);
        let want:Want = {
          bundleName: 'com.example.actsactionextensionabilitytest',
          abilityName: 'TestWantShowModeOtherFullAbility',
          action: 'SUB_Ability_AbilityRuntime_AMS_WantShowMode_0500',
          parameters: {}
        }
        want.parameters = {};
        want.parameters[wantConstant.Params.SHOW_MODE_KEY] = wantConstant.ShowMode.EMBEDDED_FULL;
        context.startAbility(want, (err) => {
          console.info(`====>SUB_Ability_AbilityRuntime_AMS_WantShowMode_0500 createSubscriber  ` + JSON.stringify(err));
          expect(err.code).assertEqual(0);
        });

      });
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AMS_WantShowMode_0600
     * @tc.number SUB_Ability_AbilityRuntime_AMS_WantShowMode_0600
     * @tc.desc   Test ShowMode value WINDOW pull success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AMS_WantShowMode_0600', Level.LEVEL0, async (done:Function) => {
      let ACTS_START_ABILITY_MODE_EVENT: commonEvent.CommonEventSubscribeInfo = {
        events: ['ACTS_START_ABILITY']
      };
      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        console.log('====>SUB_Ability_AbilityRuntime_AMS_WantShowMode_0600 subscribeCallBack :' + JSON.stringify(data));
        expect(data.event == 'ACTS_START_ABILITY').assertTrue();
        commonEvent.unsubscribe(subscriber, async (err, data) => {
          console.info(`====>SUB_Ability_AbilityRuntime_AMS_WantShowMode_0600 unSubscribeCallback`);
          done();
        });
      }
      let subscriber: commonEvent.CommonEventSubscriber | undefined = undefined;
      commonEvent.createSubscriber(ACTS_START_ABILITY_MODE_EVENT).then(async (data) => {
        console.info(`====>SUB_Ability_AbilityRuntime_AMS_WantShowMode_0600 createSubscriber  ${data}`);
        subscriber = data;
        commonEvent.subscribe(data, subscribeCallBack);
        let want:Want = {
          bundleName: 'com.example.actsactionextensionabilitytest',
          abilityName: 'TestWantShowModeOtherFullAbility',
          action: 'SUB_Ability_AbilityRuntime_AMS_WantShowMode_0600',
          parameters: {}
        }
        want.parameters = {};
        want.parameters[wantConstant.Params.SHOW_MODE_KEY] = wantConstant.ShowMode.WINDOW;
        context.startAbility(want, (err) => {
          console.info(`====>SUB_Ability_AbilityRuntime_AMS_WantShowMode_0600 createSubscriber  ` + JSON.stringify(err));
          expect(err.code).assertEqual(0);
        });


      });
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AMS_WantShowMode_0700
     * @tc.number SUB_Ability_AbilityRuntime_AMS_WantShowMode_0700
     * @tc.desc   Test ShowMode value EMBEDDED_FULL pull failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AMS_WantShowMode_0700', Level.LEVEL0, async (done:Function) => {
      let subscriber: commonEvent.CommonEventSubscriber | undefined = undefined;
      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        console.log('====>SUB_Ability_AbilityRuntime_AMS_WantShowMode_0700 subscribeCallBack :' + JSON.stringify(data));
        expect(data.event == 'ACTS_TEST_EMBEDDED_FULL').assertTrue();
        commonEvent.unsubscribe(subscriber, async (err, data) => {
          console.info(`====>SUB_Ability_AbilityRuntime_AMS_WantShowMode_0700 unSubscribeCallback`);
          done();
        });
      }
      commonEvent.createSubscriber(ACTS_WANT_SHOW_MODE_EVENT).then(async (data) => {
        console.info(`====>SUB_Ability_AbilityRuntime_AMS_WantShowMode_0700 createSubscriber  ${data}`);
        subscriber = data;
        commonEvent.subscribe(data, subscribeCallBack);
        context.startAbility({
          bundleName: 'com.example.actsactionextensionabilitytest',
          abilityName: 'TestWantShowModeOtherFullAbility',
          action: 'SUB_Ability_AbilityRuntime_AMS_WantShowMode_0700'
        }, (err:BusinessError) => {
          console.info(`====>SUB_Ability_AbilityRuntime_AMS_WantShowMode_0700 createSubscriber  ` + JSON.stringify(err));
          expect(err.code).assertEqual(0);
        });


      });
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AMS_WantShowMode_0800
     * @tc.number SUB_Ability_AbilityRuntime_AMS_WantShowMode_0800
     * @tc.desc   Test ShowMode value WINDOW pull failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_AMS_WantShowMode_0800', Level.LEVEL0, async (done:Function) => {
      let subscriber: commonEvent.CommonEventSubscriber | undefined = undefined;
      let subscribeCallBack = (err: BusinessError, data: commonEvent.CommonEventData) => {
        console.log('====>SUB_Ability_AbilityRuntime_AMS_WantShowMode_0800 subscribeCallBack :' + JSON.stringify(data));
        expect(data.event == 'ACTS_TEST_WINDOW').assertTrue();
        commonEvent.unsubscribe(subscriber, async (err, data) => {
          console.info(`====>SUB_Ability_AbilityRuntime_AMS_WantShowMode_0800 unSubscribeCallback`);
          done();
        });
      }
      commonEvent.createSubscriber(ACTS_WANT_SHOW_MODE_EVENT).then(async (data) => {
        subscriber = data;
        commonEvent.subscribe(data, subscribeCallBack);
        context.startAbility({
          bundleName: 'com.example.actsactionextensionabilitytest',
          abilityName: 'TestWantShowModeOtherWindowAbility',
          action: 'SUB_Ability_AbilityRuntime_AMS_WantShowMode_0800'
        }, (err:BusinessError) => {
          console.info(`====>SUB_Ability_AbilityRuntime_AMS_WantShowMode_0800 createSubscriber  ` + JSON.stringify(err));
          expect(err.code).assertEqual(0);
        });
      });
    })

    /**
     * @tc.name   testNativeLibraryPath003
     * @tc.number ABILITY_TEST_NATIVE_LIBRARY_PATH_0300
     * @tc.desc   test nativeLibraryPath
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeLibraryPath003', Level.LEVEL0, async (done:Function) => {
      try {
        let abilityContext: common.UIAbilityContext = context;
        let moduleContextNativeLibraryPath = abilityContext.currentHapModuleInfo.nativeLibraryPath;
        if (moduleContextNativeLibraryPath != '') {
          fs.access(moduleContextNativeLibraryPath, (err, res) => {
            if (err == undefined) {
              if (res) {
                expect(true).assertTrue;
              } else {
                expect(false).assertTrue;
              }
            }
          });
        }

        let applicationInfoNativeLibraryPath = abilityContext.applicationInfo.nativeLibraryPath;
        if (applicationInfoNativeLibraryPath != '') {
          fs.access(applicationInfoNativeLibraryPath, (err, res) => {
            if (err == undefined) {
              if (res) {
                expect(true).assertTrue;
              } else {
                expect(false).assertTrue;
              }
            }
          });
        }
        done();
      } catch (err) {
        console.log(`testNativeLibraryPath003 fail ` + err);
        expect().assertFail();
        done();
      }
    })
  })
}