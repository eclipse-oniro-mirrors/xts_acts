/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import commonEvent from '@ohos.commonEventManager';
import base from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Driver, ON } from '@ohos.UiTest';
import { BusinessError } from '@ohos.base';

function sleep(time: number): Promise<number> {
  return new Promise((resolve) => setTimeout(resolve, time));
}

let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
let ACTS_CallFunction: commonEvent.CommonEventSubscribeInfo = {
  events: ['ACTS_CALL_EVENT', 'ACTS_CALL_EVENT_ANOTHER']
};
let ACTS_EVENT: commonEvent.CommonEventSubscribeInfo = {
  events: ['ACTS_TEST_FOREGROUND', 'ACTS_TEST_DESTROY', 'ACTS_TEST_RELEASE', 'ACTS_TEST_START_ERR']
};
let subscriber: commonEvent.CommonEventSubscriber;

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number: Acts_ShareExtensionAbility_0100
     * @tc.name: Test ShareExtensionAbility basic function.
     * @tc.desc: With the same application with the same module, test ShareExtensionAbility lifecycle.
     */
    it('Acts_ShareExtensionAbility_0100', Level.LEVEL0, async (done: Function) => {
      commonEvent.createSubscriber(ACTS_EVENT).then(async (data) => {
        console.info(`====>Acts_ShareExtensionAbility_0100 createSubscriber  ${data}`);

        let unSubscribeCallback = () => {
          setTimeout(async () => {
            console.info('====>Acts_ShareExtensionAbility_0100 unSubscribeCallback');
            await globalThis.terminate('Acts_ShareExtensionAbility_0100');
            await globalThis.terminateCalledAbility('Acts_ShareExtensionAbility_0100');
            await sleep(1000);
            done();
          }, 2000);
        }

        let subscribeCallBack = async (err:base.BusinessError, data:commonEvent.CommonEventData) => {
          console.log('====>Acts_ShareExtensionAbility_0100 subscribeCallBack :' + JSON.stringify(data));
          if (data.event == 'ACTS_TEST_FOREGROUND') {
            expect(data.parameters?.count).assertEqual(3);
            await abilityDelegator.executeShellCommand('aa dump -a').then((data) => {
              console.info('====>Acts_ShareExtensionAbility_0100 : data : ' + JSON.stringify(data.stdResult));
              let firstString = data.stdResult.split("entry/ActsShareExtensionAbility");
              let result = firstString[1].split("uri");
              console.info('====>Acts_ShareExtensionAbility_0100 result aa string: ' + JSON.stringify(result[0]));
              try {
                expect(result[0]).assertContain("main name [ActsShareExtensionAbility]");
                expect(result[0]).assertContain("bundle name [com.example.actsshareextensionabilitytest]");
                expect(result[0]).assertContain("ability type [UIEXTENSION]");
                expect(result[0]).assertContain("app state #FOREGROUND");
                expect(result[0]).assertContain("root host bundle name [com.example.actsshareextensionabilitytest]");
              } catch {
                expect().assertFail();
              }
            });

            setTimeout(() => {
              globalThis.context.startAbility({
                bundleName: 'com.example.actsshareextensionabilitytest',
                abilityName: 'CalledAbility'
              }, (err: base.BusinessError) => {
                expect(err.code).assertEqual(0);
              })
            }, 500);
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


        subscriber = data;
        commonEvent.subscribe(data, subscribeCallBack);
        globalThis.context.startAbility({
          bundleName: 'com.example.actsshareextensionabilitytest',
          abilityName: 'EntryAbility',
          action: 'Acts_ShareExtensionAbility_0100'
        }, (err: base.BusinessError) => {
          expect(err.code).assertEqual(0);
        })
      })
    })

    /**
     * @tc.number: Acts_ShareExtensionAbility_0200
     * @tc.name: Test ShareExtensionAbility basic function.
     * @tc.desc: With the same application with the different module, test ShareExtensionAbility lifecycle.
     */
    it('Acts_ShareExtensionAbility_0200', Level.LEVEL0, async (done: Function) => {
      commonEvent.createSubscriber(ACTS_EVENT).then(async (data) => {
        console.info(`====>Acts_ShareExtensionAbility_0200 createSubscriber  ${data}`);
        subscriber = data;

        let unSubscribeCallback = () => {
          setTimeout(async () => {
            console.info('====>Acts_ShareExtensionAbility_0200 unSubscribeCallback');
            await globalThis.featureTerminate('Acts_ActionExtensionAbility_0200');
            await globalThis.terminateCalledAbility('Acts_ActionExtensionAbility_0200');
            await sleep(1000);
            done();
          }, 2000);
        }

        let subscribeCallBack = async (err:base.BusinessError, data:commonEvent.CommonEventData) => {
          console.info(`====>Acts_ShareExtensionAbility_0200 subscribeCallBack 'ACTS_CALL_EVENT'  ${data}`);
          if (data.event == 'ACTS_TEST_FOREGROUND') {
            expect(data.parameters?.count).assertEqual(3);
            await abilityDelegator.executeShellCommand('aa dump -a').then((data) => {
              console.info('====>Acts_ShareExtensionAbility_0200 : data : ' + JSON.stringify(data.stdResult));
              let firstString = data.stdResult.split("entry/ActsShareExtensionAbility");
              let result = firstString[1].split("uri");
              console.info('====>Acts_ShareExtensionAbility_0200 result aa string: ' + JSON.stringify(result[0]));
              try {
                expect(result[0]).assertContain("main name [ActsShareExtensionAbility]");
                expect(result[0]).assertContain("bundle name [com.example.actsshareextensionabilitytest]");
                expect(result[0]).assertContain("ability type [UIEXTENSION]");
                expect(result[0]).assertContain("app state #FOREGROUND");
                expect(result[0]).assertContain("root host bundle name [com.example.actsshareextensionabilitytest]");
              } catch {
                expect().assertFail();
              }
            })
            setTimeout(() => {
              globalThis.context.startAbility({
                bundleName: 'com.example.actsshareextensionabilitytest',
                abilityName: 'CalledAbility'
              }, (err: base.BusinessError) => {
                expect(err.code).assertEqual(0);
              })
            }, 500);
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
        commonEvent.subscribe(data, subscribeCallBack);
        globalThis.context.startAbility({
          bundleName: 'com.example.actsshareextensionabilitytest',
          abilityName: 'FeatureAbility',
          action: 'Acts_ShareExtensionAbility_0200'
        }, (err: base.BusinessError) => {
          expect(err.code).assertEqual(0);
        })
      })
    })

    /**
     * @tc.number: Acts_ShareExtensionAbility_0300
     * @tc.name: Test ShareExtensionAbility basic function.
     * @tc.desc: With the different application, test ShareExtensionAbility lifecycle.
     */
    it('Acts_ShareExtensionAbility_0300', Level.LEVEL0, async (done: Function) => {
      commonEvent.createSubscriber(ACTS_EVENT).then(async (data) => {
        console.info(`====>Acts_ShareExtensionAbility_0300 createSubscriber  ${data}`);
        subscriber = data;

        let subscribeCallBack = async(err:base.BusinessError, data:commonEvent.CommonEventData) => {
          console.info(`====>Acts_ShareExtensionAbility_0300 subscribeCallBack 'ACTS_CALL_EVENT'  ${data}`);
          if (data.event == 'ACTS_TEST_FOREGROUND') {
            expect(data.parameters?.count).assertEqual(3);
            await abilityDelegator.executeShellCommand('aa dump -a').then((data) => {
              console.info('====>Acts_ShareExtensionAbility_0300 : data : ' + JSON.stringify(data.stdResult));
              let firstString = data.stdResult.split("entry_assist/ActsShareExtensionAbility");
              let result = firstString[1].split("uri");
              console.info('====>Acts_ShareExtensionAbility_0300 result aa string: ' + JSON.stringify(result[0]));
              try {
                expect(result[0]).assertContain("main name [ActsShareExtensionAbility]");
                expect(result[0]).assertContain("bundle name [com.example.actsshareextensionabilityrely]");
                expect(result[0]).assertContain("ability type [UIEXTENSION]");
                expect(result[0]).assertContain("app state #FOREGROUND");
                expect(result[0]).assertContain("root host bundle name [com.example.actsshareextensionabilitytest]");
              } catch {
                expect().assertFail();
              }
            });

            setTimeout(() => {
              globalThis.context.startAbility({
                bundleName: 'com.example.actsshareextensionabilityrely',
                abilityName: 'CalledAbility'
              }, (err: base.BusinessError) => {
                expect(err.code).assertEqual(0);
              })
            }, 500);
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

        let unSubscribeCallback = () => {
          setTimeout(async () => {
            console.info('====>Acts_ShareExtensionAbility_0300 unSubscribeCallback');
            await globalThis.terminate('Acts_ShareExtensionAbility_0300');
            let cmd = 'aa force-stop com.example.actsshareextensionabilityrely';
            await abilityDelegator.executeShellCommand(cmd).catch((error:base.BusinessError) => {
              console.log("====>Acts_ShareExtensionAbility_0300 executeShellCommand error : " + JSON.stringify(error));
            });
            await sleep(1000);
            done();
          }, 2000);
        }

        commonEvent.subscribe(data, subscribeCallBack);
        globalThis.context.startAbility({
          bundleName: 'com.example.actsshareextensionabilitytest',
          abilityName: 'EntryAbility',
          action: 'Acts_ShareExtensionAbility_0300'
        }, (err: base.BusinessError) => {
          expect(err.code).assertEqual(0);
        })
      })
    })

    /**
     * @tc.number: Acts_ShareExtensionAbility_0400
     * @tc.name: Test ShareExtensionAbility basic function.
     * @tc.desc: Start the same ShareExtensionAbility with different UI components, and the test is successful.
     */
    it('Acts_ShareExtensionAbility_0400', Level.LEVEL0, async (done: Function) => {
      let count = 0;
      let subscribeCallBack = (err:base.BusinessError, data:commonEvent.CommonEventData) => {
        console.info(`====>Acts_ShareExtensionAbility_0400 subscribeCallBack 'ACTS_CALL_EVENT'  ${data}`);
        if (data.event == 'ACTS_FEATURE_CREATE') {
          count++;
        }
        if (count == 2) {
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      }

      let unSubscribeCallback = () => {
        setTimeout(async () => {
          console.info('====>Acts_ShareExtensionAbility_0400 unSubscribeCallback');
          await globalThis.terminate('Acts_ShareExtensionAbility_0400');
          await globalThis.featureTerminate('Acts_ShareExtensionAbility_0400');
          await sleep(1000);
          done();
        }, 2000);
      }

      let ACTS_MODULE: commonEvent.CommonEventSubscribeInfo = {
        events: ['ACTS_FEATURE_CREATE']
      };
      commonEvent.createSubscriber(ACTS_MODULE).then(async (data) => {
        console.info(`====>Acts_ShareExtensionAbility_0400 createSubscriber  ${data}`);
        subscriber = data;
        commonEvent.subscribe(data, subscribeCallBack);
        globalThis.context.startAbility({
          bundleName: 'com.example.actsshareextensionabilitytest',
          abilityName: 'EntryAbility',
          action: 'Acts_ShareExtensionAbility_0400'
        }, (err: base.BusinessError) => {
          expect(err.code).assertEqual(0);
        })
      })
    })

    /**
     * @tc.number: Acts_ShareExtensionAbility_0500
     * @tc.name: Test ShareExtensionAbility basic function.
     * @tc.desc: Start ShareExtensionAbility with invalid bundleName, start failed.
     */
    it('Acts_ShareExtensionAbility_0500', Level.LEVEL0, async (done: Function) => {
      commonEvent.createSubscriber(ACTS_EVENT).then(async (data) => {
        console.info(`====>Acts_ShareExtensionAbility_0500 createSubscriber  ${data}`);
        subscriber = data;
        let flag = true;
        let subscribeCallBack = (err:base.BusinessError, data:commonEvent.CommonEventData) => {
          console.info(`====>Acts_ShareExtensionAbility_0500 subscribeCallBack 'ACTS_CALL_EVENT'  ${data}`);
          if (data.event == 'ACTS_TEST_START_ERR' && flag) {
            flag = false;
            expect(data.parameters?.err.code).assertEqual(1011);
            commonEvent.unsubscribe(subscriber, unSubscribeCallback);
          }
        }

        let unSubscribeCallback = () => {
          setTimeout(async () => {
            console.info('====>Acts_ShareExtensionAbility_0500 unSubscribeCallback');
            await globalThis.terminate('Acts_ShareExtensionAbility_0500');
            await sleep(1000);
            done();
          }, 2000);
        }

        commonEvent.subscribe(data, subscribeCallBack);
        globalThis.context.startAbility({
          bundleName: 'com.example.actsshareextensionabilitytest',
          abilityName: 'EntryAbility',
          action: 'Acts_ShareExtensionAbility_0500'
        }, (err: base.BusinessError) => {
          expect(err.code).assertEqual(0);
        })
      })
    })

    /**
     * @tc.number: Acts_ShareExtensionAbility_0600
     * @tc.name: Test ShareExtensionAbility basic function.
     * @tc.desc: Start ShareExtensionAbility with invalid abilityName, start failed.
     */
    it('Acts_ShareExtensionAbility_0600', Level.LEVEL0, async (done: Function) => {
      commonEvent.createSubscriber(ACTS_EVENT).then(async (data) => {
        console.info(`====>Acts_ShareExtensionAbility_0600 createSubscriber  ${data}`);
        subscriber = data;

        let flag = true;

        let subscribeCallBack = (err:base.BusinessError, data:commonEvent.CommonEventData) => {
          console.info(`====>Acts_ShareExtensionAbility_0600 subscribeCallBack 'ACTS_CALL_EVENT'  ${data}`);
          if (data.event == 'ACTS_TEST_START_ERR' && flag) {
            flag = false;
            expect(data.parameters?.err.code).assertEqual(1011);
            commonEvent.unsubscribe(subscriber, unSubscribeCallback);
          }
        }

        let unSubscribeCallback = () => {
          setTimeout(async () => {
            console.info('====>Acts_ShareExtensionAbility_0600 unSubscribeCallback');
            globalThis.terminate('Acts_ShareExtensionAbility_0600');
            await sleep(1000);
            done();
          }, 2000);
        }

        commonEvent.subscribe(data, subscribeCallBack);
        globalThis.context.startAbility({
          bundleName: 'com.example.actsshareextensionabilitytest',
          abilityName: 'EntryAbility',
          action: 'Acts_ShareExtensionAbility_0600'
        }, (err: base.BusinessError) => {
          expect(err.code).assertEqual(0);
        })
      })
    })

    /**
     * @tc.number: Acts_ShareExtensionAbility_0700
     * @tc.name: Test ShareExtensionAbility basic function.
     * @tc.desc: Start ShareExtensionAbility with invalid parameters, start failed.
     */
    it('Acts_ShareExtensionAbility_0700', Level.LEVEL0, async (done: Function) => {
      commonEvent.createSubscriber(ACTS_EVENT).then(async (data) => {
        console.info(`====>Acts_ShareExtensionAbility_0700 createSubscriber  ${data}`);
        subscriber = data;

        let flag = true;

        let subscribeCallBack =(err:base.BusinessError, data:commonEvent.CommonEventData) => {
          console.info(`====>Acts_ShareExtensionAbility_0700 subscribeCallBack 'ACTS_CALL_EVENT'  ${data}`);
          if (data.event == 'ACTS_TEST_START_ERR' && flag) {
            flag = false;
            expect(data.parameters?.err.code).assertEqual(1011);
            commonEvent.unsubscribe(subscriber, unSubscribeCallback);
          }
        }

        let unSubscribeCallback = () => {
          setTimeout(async () => {
            console.info('====>Acts_ShareExtensionAbility_0700 unSubscribeCallback');
            globalThis.terminate('Acts_ShareExtensionAbility_0700');
            await sleep(1000);
            done();
          }, 2000);
        }

        commonEvent.subscribe(data, subscribeCallBack);
        globalThis.context.startAbility({
          bundleName: 'com.example.actsshareextensionabilitytest',
          abilityName: 'EntryAbility',
          action: 'Acts_ShareExtensionAbility_0700'
        }, (err: base.BusinessError) => {
          expect(err.code).assertEqual(0);
        })
      })
    })

    /**
     * @tc.number: Acts_ShareExtensionAbility_0800
     * @tc.name: Test ShareExtensionAbility basic function.
     * @tc.desc: Test terminateSelfWithResultEvent successful.
     */
    it('Acts_ShareExtensionAbility_0800', Level.LEVEL0, async (done: Function) => {
      let appearEvent = 'ACTS_UIExtension_AboutToAppear';
      let onResultEvent = 'ACTS_UIExtension_OnResult';
      let terminateSelfWithResultEvent = 'ACTS_UIExtension_TerminateSelfWithResult';

      let subscribeInfo: commonEvent.CommonEventSubscribeInfo = {
        events: [appearEvent, onResultEvent]
      }
      await commonEvent.createSubscriber(subscribeInfo).then(async (data) => {
        console.log("createSubscriber data : " + JSON.stringify(data));
        subscriber = data;
        globalThis.context.startAbility({
          bundleName: 'com.example.actsshareextensionabilitytest',
          abilityName: 'EntryAbility',
          action: 'Acts_ShareExtensionAbility_DEFAULT'
        }, (err: base.BusinessError) => {
          expect(err.code).assertEqual(0);
        })

        commonEvent.subscribe(subscriber, async (err, data) => {
          console.log("SubscribeInfoCallback : " + JSON.stringify(data));

          if (data.event == appearEvent) {
            commonEvent.publish(terminateSelfWithResultEvent, (err: base.BusinessError) => {
              if (err) {
                console.log(`publish ACTS_UIExtension_TerminateSelfWithResult failed, code is ${err.code}, message is ${err.message}`);
              } else {
                console.log('publish ACTS_UIExtension_TerminateSelfWithResult success');
              }
            });
          } else if (data.event == onResultEvent) {
            let result:ESObject = data.parameters?.result as ESObject;
            setTimeout(async () => { 
              commonEvent.unsubscribe(subscriber, async (err, data) => {
                expect(result.want.action).assertEqual('SHARE');
                globalThis.terminate('Acts_ShareExtensionAbility_0800');
                setTimeout(() => {
                  console.info('====>Acts_ShareExtensionAbility_0800 unSubscribeCallback');
                  done();
                }, 2000);
              });
            }, 1000);
          }
        });
      }).catch((error:base.BusinessError) => {
        globalThis.terminate('Acts_ShareExtensionAbility_0800');
        setTimeout(() => {
          console.log("createSubscriber err : " + JSON.stringify(error));
          expect().assertFail();
        }, 2000);
      })
    })

    /**
     * @tc.number: Acts_ShareExtensionAbility_0900
     * @tc.name: Test ShareExtensionAbility basic function.
     * @tc.desc: Test sendData successful.
     */
    it('Acts_ShareExtensionAbility_0900', Level.LEVEL0, async (done: Function) => {
      let appearEvent = 'ACTS_UIExtension_AboutToAppear';
      let onReceiveEvent = 'ACTS_UIExtension_OnReceive';
      let sendDataEvent = 'ACTS_UIExtension_SendData';

      let subscribeInfo: commonEvent.CommonEventSubscribeInfo = {
        events: [appearEvent, onReceiveEvent]
      }
      await commonEvent.createSubscriber(subscribeInfo).then(async (data) => {
        console.log("createSubscriber data : " + JSON.stringify(data));
        subscriber = data;
        globalThis.context.startAbility({
          bundleName: 'com.example.actsshareextensionabilitytest',
          abilityName: 'EntryAbility',
          action: 'Acts_ShareExtensionAbility_DEFAULT'
        }, (err: base.BusinessError) => {
          expect(err.code).assertEqual(0);
        })

        commonEvent.subscribe(subscriber, async (err, data) => {
          console.log("SubscribeInfoCallback : " + JSON.stringify(data));

          if (data.event == appearEvent) {
            commonEvent.publish(sendDataEvent, (err: base.BusinessError) => {
              if (err) {
                console.log(`publish ACTS_UIExtension_SendData failed, code is ${err.code}, message is ${err.message}`);
              } else {
                console.log('publish ACTS_UIExtension_SendData success');
              }
            });
          } else if (data.event == onReceiveEvent) {
            let result: ESObject = data.parameters?.result as ESObject;
            let resultCheck: ESObject = {
              name: {
                test: 'shareExtensionTest'
              } as ESObject
            };
            setTimeout(async () => {
              commonEvent.unsubscribe(subscriber, async (err, data) => {
                expect(JSON.stringify(result)).assertEqual(JSON.stringify(resultCheck));
                globalThis.terminate('Acts_ShareExtensionAbility_0900');
                setTimeout(() => {
                  console.info('====>Acts_ShareExtensionAbility_0900 unSubscribeCallback');
                  done();
                }, 2000);
              });
            }, 1000);
          }
        });
      }).catch((error: BusinessError) => {
        globalThis.terminate('Acts_ShareExtensionAbility_0900');
        setTimeout(() => {
          console.log("createSubscriber err : " + JSON.stringify(error));
          expect().assertFail();
        }, 2000);
      })
    })

    /**
     * @tc.number: Acts_ShareExtensionAbility_1000
     * @tc.name: Test ShareExtensionAbility basic function.
     * @tc.desc: Test the startAbility interface in callback form.
     */
    it('Acts_ShareExtensionAbility_1000', Level.LEVEL0, async (done: Function) => {
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        console.info(`====>Acts_ShareExtensionAbility_1000 createSubscriber  ${data}`);
        subscriber = data;
        commonEvent.subscribe(data, subscribeCallBack);
        globalThis.context.startAbility({
          bundleName: 'com.example.actsshareextensionabilitytest',
          abilityName: 'EntryAbility',
          action: 'Acts_ShareExtensionAbility_1000'
        }, (err: base.BusinessError) => {
          console.info('====>Acts_ShareExtensionAbility_1000 startAbility err:' + JSON.stringify(err));
        })
      })

      let subscribeCallBack = (err:base.BusinessError, data:commonEvent.CommonEventData) => {
        if (data.event == 'ACTS_CALL_EVENT') {
          console.info(`====>Acts_ShareExtensionAbility_1000 subscribeCallBack 'ACTS_CALL_EVENT'  ${data}`);
          expect(data.parameters?.num).assertEqual(0);
          commonEvent.unsubscribe(subscriber, unSubscribeCallback)
        }
      }

      let unSubscribeCallback = () => {
        console.info("====>Acts_ShareExtensionAbility_1000 unSubscribeCallback 'ACTS_CALL_EVENT'");
        globalThis.terminate('Acts_ShareExtensionAbility_1000');
        setTimeout(() => {
          done();
        }, 2000);
      }
    })

    /**
     * @tc.number: Acts_ShareExtensionAbility_1100
     * @tc.name: Test ShareExtensionAbility basic function.
     * @tc.desc: Test the startAbility interface in promiss form.
     */
    it('Acts_ShareExtensionAbility_1100', Level.LEVEL0, async (done: Function) => {
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        console.info(`====>Acts_ShareExtensionAbility_1100 createSubscriber  ${data}`);
        subscriber = data;
        commonEvent.subscribe(data, subscribeCallBack);
        globalThis.context.startAbility({
          bundleName: 'com.example.actsshareextensionabilitytest',
          abilityName: 'EntryAbility',
          action: 'Acts_ShareExtensionAbility_1100'
        }, (err: base.BusinessError) => {
          console.info('====>Acts_ShareExtensionAbility_1100 startAbility err:' + JSON.stringify(err));
        })
      })

      let subscribeCallBack = (err:base.BusinessError, data:commonEvent.CommonEventData) => {
        if (data.event == 'ACTS_CALL_EVENT') {
          console.info(`====>Acts_ShareExtensionAbility_1100 subscribeCallBack 'ACTS_CALL_EVENT'  ${data}` + JSON.stringify(data))
          expect(data.parameters?.str).assertEqual('success');
          commonEvent.unsubscribe(subscriber, unSubscribeCallback)
        }
      }

      let unSubscribeCallback = () => {
        console.info("====>Acts_ShareExtensionAbility_1100 unSubscribeCallback 'ACTS_CALL_EVENT'");
        globalThis.terminate('Acts_ShareExtensionAbility_1100');
        setTimeout(() => {
          done();
        }, 2000);
      }
    })

    /**
     * @tc.number: Acts_ShareExtensionAbility_1200
     * @tc.name: Test ShareExtensionAbility basic function.
     * @tc.desc: Test the startAbility interface with invalid want.
     */
    it('Acts_ShareExtensionAbility_1200', Level.LEVEL0, async (done: Function) => {
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        console.info(`====>Acts_ShareExtensionAbility_1200 createSubscriber  ${data}`);
        subscriber = data;
        commonEvent.subscribe(data, subscribeCallBack);
        globalThis.context.startAbility({
          bundleName: 'com.example.actsshareextensionabilitytest',
          abilityName: 'EntryAbility',
          action: 'Acts_ShareExtensionAbility_1200'
        }, (err: base.BusinessError) => {
          console.info('====>Acts_ShareExtensionAbility_1200 startAbility err:' + JSON.stringify(err));
        })
      })

      let subscribeCallBack = (err:base.BusinessError, data:commonEvent.CommonEventData) => {
        if (data.event == 'ACTS_CALL_EVENT') {
          console.info(`====>Acts_ShareExtensionAbility_1200 subscribeCallBack 'ACTS_CALL_EVENT'  ${data}` + JSON.stringify(data));
          expect(data.parameters?.num).assertEqual(16000001);
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      }

      let unSubscribeCallback = () => {
        console.info("====>Acts_ShareExtensionAbility_1200 unSubscribeCallback 'ACTS_CALL_EVENT'");
        globalThis.terminate('Acts_ShareExtensionAbility_1200');
        setTimeout(() => {
          done();
        }, 2000);
      }
    })

    /**
     * @tc.number: Acts_ShareExtensionAbility_1300
     * @tc.name: Test ShareExtensionAbility basic function.
     * @tc.desc: Test the startAbilityForResult interface in callback form.
     */
    it('Acts_ShareExtensionAbility_1300', Level.LEVEL0, async (done: Function) => {
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        console.info(`====>Acts_ShareExtensionAbility_1300 createSubscriber  ${data}`);
        subscriber = data;
        commonEvent.subscribe(data, subscribeCallBack);
        globalThis.context.startAbility({
          bundleName: 'com.example.actsshareextensionabilitytest',
          abilityName: 'EntryAbility',
          action: 'Acts_ShareExtensionAbility_1300'
        }, (err: base.BusinessError) => {
          console.info('====>Acts_ShareExtensionAbility_1300 startAbility err:' + JSON.stringify(err));
        })
      })

      let unSubscribeCallback = () => {
        console.info("====>Acts_ShareExtensionAbility_1300 unSubscribeCallback 'ACTS_CALL_EVENT'");
        globalThis.terminate('Acts_ShareExtensionAbility_1300')
        setTimeout(() => {
          done();
        }, 2000);
      }

      let subscribeCallBack = (err:base.BusinessError, data:commonEvent.CommonEventData) => {
        if (data.event == 'ACTS_CALL_EVENT') {
          console.info(`====>Acts_ShareExtensionAbility_1300 subscribeCallBack 'ACTS_CALL_EVENT'  ${data}`);
          expect(data.parameters?.str).assertEqual('SHARE');
          expect(data.parameters?.result).assertEqual(0);
          commonEvent.unsubscribe(subscriber, unSubscribeCallback)
        }
      }


    })

    /**
     * @tc.number: Acts_ShareExtensionAbility_1400
     * @tc.name: Test ShareExtensionAbility basic function.
     * @tc.desc: Test the startAbilityForResult interface in promiss form.
     */
    it('Acts_ShareExtensionAbility_1400', Level.LEVEL0, async (done: Function) => {
      await sleep(2000);
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        console.info(`====>Acts_ShareExtensionAbility_1400 createSubscriber  ${data}`);
        subscriber = data;
        commonEvent.subscribe(data, subscribeCallBack);
        globalThis.context.startAbility({
          bundleName: 'com.example.actsshareextensionabilitytest',
          abilityName: 'EntryAbility',
          action: 'Acts_ShareExtensionAbility_1400'
        }, (err: base.BusinessError) => {
          console.info('====>Acts_ShareExtensionAbility_1400 startAbility err:' + JSON.stringify(err));
        })
      })

      let subscribeCallBack = (err:base.BusinessError, data:commonEvent.CommonEventData) => {
        if (data.event == 'ACTS_CALL_EVENT') {
          console.info(`====>Acts_ShareExtensionAbility_1400 subscribeCallBack 'ACTS_CALL_EVENT'  ${data}`);
          expect(data.parameters?.str).assertEqual('SHARE');
          expect(data.parameters?.result).assertEqual(0);
          commonEvent.unsubscribe(subscriber, unSubscribeCallback);
        }
      }

      let unSubscribeCallback = () => {
        console.info("====>Acts_ShareExtensionAbility_1400 unSubscribeCallback 'ACTS_CALL_EVENT'");
        globalThis.terminate('Acts_ShareExtensionAbility_1400');
        setTimeout(() => {
          done();
        }, 2000);
      }
    })

    /**
     * @tc.number: Acts_ShareExtensionAbility_1500
     * @tc.name: Test ShareExtensionAbility basic function.
     * @tc.desc: Test the startAbilityForResult interface with invalid want.
     */
    it('Acts_ShareExtensionAbility_1500', Level.LEVEL0, async (done: Function) => {
      await sleep(2000);
      commonEvent.createSubscriber(ACTS_CallFunction).then(async (data) => {
        console.info(`====>Acts_ShareExtensionAbility_1500 createSubscriber  ${data}`);
        subscriber = data;
        commonEvent.subscribe(data, subscribeCallBack);
        globalThis.context.startAbility({
          bundleName: 'com.example.actsshareextensionabilitytest',
          abilityName: 'EntryAbility',
          action: 'Acts_ShareExtensionAbility_1500'
        }, (err: base.BusinessError) => {
          console.info('====>Acts_ShareExtensionAbility_1400 start Own Ability err:' + JSON.stringify(err));
        })
      })

      let subscribeCallBack = (err:base.BusinessError, data:commonEvent.CommonEventData) => {
        console.info(`====>Acts_ShareExtensionAbility_1500 subscribeCallBack all  ${data.event}`)
        if (data.event == 'ACTS_CALL_EVENT') {
          console.info(`====>Acts_ShareExtensionAbility_1500 subscribeCallBack 'ACTS_CALL_EVENT'  ${data}`)
          expect(data.parameters?.num).assertEqual(16000001);
          commonEvent.unsubscribe(subscriber, unSubscribeCallback)
        }
      }

      let unSubscribeCallback = () => {
        console.info("====>Acts_ShareExtensionAbility_1500 unSubscribeCallback 'ACTS_CALL_EVENT'");
        setTimeout(() => {
          globalThis.terminate('Acts_ShareExtensionAbility_1500')
          done();
        }, 2000)
      }
    })

    /**
     * @tc.number: Acts_ShareExtensionAbility_1600
     * @tc.name: Test ShareExtensionAbility basic function.
     * @tc.desc: Test setReceiveDataCallback successful.
     */
    it('Acts_ShareExtensionAbility_1600', Level.LEVEL0, async (done: Function) => {
      await sleep(2000);
      let subscribeInfo: commonEvent.CommonEventSubscribeInfo = {
        events: ['setReceiveDataCallback']
      }
      await commonEvent.createSubscriber(subscribeInfo).then(async (data) => {
        console.log("createSubscriber data : " + JSON.stringify(data));
        subscriber = data;
        globalThis.context.startAbility({
          bundleName: 'com.example.actsshareextensionabilitytest',
          abilityName: 'EntryAbility',
          action: 'Acts_ShareExtensionAbility_1600'
        }, (err: base.BusinessError) => {
          expect(err.code).assertEqual(0);
        });
        commonEvent.subscribe(subscriber, async (err, data) => {
          console.log("SubscribeInfoCallback : " + JSON.stringify(data));
          if (data.event == 'setReceiveDataCallback') {
            let resultCheck: ESObject = {
              name: {
                test: 'shareExtensionTest'
              } as ESObject
            };
            expect(JSON.stringify(data.parameters?.result)).assertEqual(JSON.stringify(resultCheck));
            commonEvent.unsubscribe(subscriber, async (err, data) => {
              globalThis.terminate('Acts_ShareExtensionAbility_1600');
              setTimeout(() => {
                console.info('====>Acts_ShareExtensionAbility_1600 unSubscribeCallback');
                done();
              }, 2000);
            });
          }
        });
      })
    })

    /**
     * @tc.number: Acts_ShareExtensionAbility_1700
     * @tc.name: Test ShareExtensionAbility basic function.
     * @tc.desc: Use ui components continuously to start two ShareExtensionAbility.
     */
    it('Acts_ShareExtensionAbility_1700', Level.LEVEL0, async (done: Function) => {
      await sleep(2000);
      globalThis.context.startAbility({
        bundleName: 'com.example.actsshareextensionabilitytest',
        abilityName: 'EntryAbility',
        action: 'Acts_ShareExtensionAbility_1700'
      }, (err: base.BusinessError) => {
        expect(err.code).assertEqual(0);
      });
      await sleep(2000);
      await abilityDelegator.executeShellCommand('aa dump -a').then((data) => {
        console.info('====>Acts_ShareExtensionAbility_1700 : data : ' + JSON.stringify(data.stdResult));
        try {
          expect(JSON.stringify(data)).assertContain("main name [ActsShareExtensionAbility]");
          expect(JSON.stringify(data)).assertContain("main name [UIExtAbility]")
        } catch {
          expect().assertFail();
        }
      });
      globalThis.terminate('Acts_ShareExtensionAbility_1700');
      setTimeout(() => {
        console.info('====>Acts_ShareExtensionAbility_1700 unSubscribeCallback');
        done();
      }, 2000);
    })

    /**
     * @tc.number: Acts_ShareExtensionAbility_1800
     * @tc.name: Test ShareExtensionAbility basic function.
     * @tc.desc: Test starts ShareExtensionAbility using startAbility interface.
     */
    it('Acts_ShareExtensionAbility_1800', Level.LEVEL0, async (done: Function) => {
      await sleep(2000);
      let subscribeInfo: commonEvent.CommonEventSubscribeInfo = {
        events: ['ACTS_CALL_EVENT']
      }
      await commonEvent.createSubscriber(subscribeInfo).then(async (data) => {
        console.log("createSubscriber data : " + JSON.stringify(data));
        subscriber = data;
        globalThis.context.startAbility({
          bundleName: 'com.example.actsshareextensionabilitytest',
          abilityName: 'EntryAbility',
          action: 'Acts_ShareExtensionAbility_1800'
        }, (err: base.BusinessError) => {
          expect(err.code).assertEqual(0);
        });
        commonEvent.subscribe(subscriber, async (err, data) => {
          console.log("SubscribeInfoCallback : " + JSON.stringify(data));
          if (data.event == 'ACTS_CALL_EVENT') {
            await abilityDelegator.executeShellCommand('aa dump -a').then((data) => {
              console.info('====>Acts_ShareExtensionAbility_1700 : data : ' + JSON.stringify(data.stdResult));
              try {
                expect(JSON.stringify(data)).assertContain("main name [ActsShareExtensionAbility]");
                expect(JSON.stringify(data)).assertContain("main name [UIExtAbility]")
              } catch {
                expect().assertFail();
              }
            });
            commonEvent.unsubscribe(subscriber, async (err, data) => {
              globalThis.terminate('Acts_ShareExtensionAbility_1800');
              setTimeout(() => {
                console.info('====>Acts_ShareExtensionAbility_1800 unSubscribeCallback');
                done();
              }, 2000);
            });
          }
        });
      })
    })

    /**
     * @tc.number: Acts_ShareExtensionAbility_1900
     * @tc.name: Test ShareExtensionAbility basic function.
     * @tc.desc: Test hapModuleInfo in context
     */
    it('Acts_ShareExtensionAbility_1900', Level.LEVEL0, async (done: Function) => {
      await sleep(2000);
      let subscribeInfo: commonEvent.CommonEventSubscribeInfo = {
        events: ['ACTS_CALL_EVENT']
      }

      await commonEvent.createSubscriber(subscribeInfo).then(async (data) => {
        console.log("createSubscriber data : " + JSON.stringify(data));
        subscriber = data;
        globalThis.context.startAbility({
          bundleName: 'com.example.actsshareextensionabilitytest',
          abilityName: 'EntryAbility',
          action: 'Acts_ShareExtensionAbility_context'
        }, (err: base.BusinessError) => {
          expect(err.code).assertEqual(0);
        });
        commonEvent.subscribe(subscriber, async (err, data) => {
          console.log("SubscribeInfoCallback : " + JSON.stringify(data));
          if (data.event == 'ACTS_CALL_EVENT') {
            try {
              let context: ESObject = data.parameters?.context as ESObject;
              console.log('Acts_ShareExtensionAbility_1900 context: ' + context + JSON.stringify(context));
              expect(context != null).assertTrue();
              let hapModuleInfo: ESObject = context.currentHapModuleInfo as ESObject;
              console.log('Acts_ShareExtensionAbility_1900 context: ' + hapModuleInfo + JSON.stringify(hapModuleInfo));
              expect(hapModuleInfo != null).assertTrue();
              console.log('Acts_ShareExtensionAbility_1900 hapModuleInfo.name: ' + hapModuleInfo.name);
              expect(hapModuleInfo.name == "entry").assertTrue();
              console.log('Acts_ShareExtensionAbility_1900 hapModuleInfo.icon: ' + hapModuleInfo.icon);
              expect(hapModuleInfo.icon == "$media:icon").assertTrue();
              console.log('Acts_ShareExtensionAbility_1900 hapModuleInfo.iconId: ' + hapModuleInfo.iconId);
              expect(typeof (hapModuleInfo.iconId) == 'number').assertTrue();
              console.log('Acts_ShareExtensionAbility_1900 hapModuleInfo.label: ' + hapModuleInfo.label);
              expect(hapModuleInfo.label == "$string:EntryAbility_label").assertTrue();
              console.log('Acts_ShareExtensionAbility_1900 hapModuleInfo.labelId: ' + hapModuleInfo.labelId);
              expect(typeof (hapModuleInfo.labelId) == 'number').assertTrue();
              console.log('Acts_ShareExtensionAbility_1900 hapModuleInfo.description: ' + hapModuleInfo.description);
              expect(hapModuleInfo.description == "$string:module_desc").assertTrue();
              console.log('Acts_ShareExtensionAbility_1900 hapModuleInfo.descriptionId: ' + hapModuleInfo.descriptionId);
              expect(typeof (hapModuleInfo.descriptionId) == 'number').assertTrue();
              console.log('Acts_ShareExtensionAbility_1900 hapModuleInfo.mainElementName: ' + hapModuleInfo.mainElementName);
              expect(hapModuleInfo.mainElementName == "EntryAbility").assertTrue();
              console.log('Acts_ShareExtensionAbility_1900 hapModuleInfo.metadata: ' + hapModuleInfo.metadata.length);
              expect(hapModuleInfo.metadata.length >= 0).assertTrue();
              console.log('Acts_ShareExtensionAbility_1900 success');
              done();
            } catch (err) {
              console.log('Acts_ShareExtensionAbility_1900 fail: ' + err);
              expect().assertFail();
              done();
            }
            commonEvent.unsubscribe(subscriber, async (err, data) => {
              globalThis.terminate('Acts_ShareExtensionAbility_1900');
              setTimeout(() => {
                console.info('====>Acts_ShareExtensionAbility_1900 unSubscribeCallback');
                done();
              }, 2000);
            });
          }
        });
      })
    })

    /**
     * @tc.number: Acts_ShareExtensionAbility_2100
     * @tc.name: Test ShareExtensionAbility basic function.
     * @tc.desc: Test extensionAbilityInfo in context
     */
    it('Acts_ShareExtensionAbility_2100', Level.LEVEL0, async (done: Function) => {
      await sleep(2000);
      let subscribeInfo: commonEvent.CommonEventSubscribeInfo = {
        events: ['ACTS_CALL_EVENT']
      }

      await commonEvent.createSubscriber(subscribeInfo).then(async (data) => {
        console.log("createSubscriber data : " + JSON.stringify(data));
        subscriber = data;
        globalThis.context.startAbility({
          bundleName: 'com.example.actsshareextensionabilitytest',
          abilityName: 'EntryAbility',
          action: 'Acts_ShareExtensionAbility_context'
        }, (err: base.BusinessError) => {
          expect(err.code).assertEqual(0);
        });
        commonEvent.subscribe(subscriber, async (err, data) => {
          console.log("SubscribeInfoCallback : " + JSON.stringify(data));
          if (data.event == 'ACTS_CALL_EVENT') {
            try {
              expect(data.parameters?.context != null).assertTrue();
              let extensionAbilityInfo: ESObject = data.parameters?.context.extensionAbilityInfo as ESObject;
              expect(extensionAbilityInfo != null).assertTrue();
              console.log('Acts_ShareExtensionAbility_2100 extensionAbilityInfo: ' + JSON.stringify(extensionAbilityInfo));
              expect(extensionAbilityInfo.bundleName == 'com.example.actsshareextensionabilitytest').assertTrue();
              console.log('extensionAbilityInfo.descriptionId: ' + JSON.stringify(extensionAbilityInfo.descriptionId));
              expect(typeof (extensionAbilityInfo.descriptionId) == 'number').assertTrue();
              console.log('extensionAbilityInfo.enabled: ' + JSON.stringify(extensionAbilityInfo.enabled));
              expect(typeof (extensionAbilityInfo.enabled) == 'boolean').assertTrue();
              console.log('extensionAbilityInfo.exported: ' + JSON.stringify(extensionAbilityInfo.exported));
              expect(typeof (extensionAbilityInfo.exported) == 'boolean').assertTrue();
              console.log('extensionAbilityInfo.extensionAbilityType: ' + JSON.stringify(extensionAbilityInfo.extensionAbilityType));
              expect(extensionAbilityInfo.extensionAbilityType == 16).assertTrue();
              console.log('extensionAbilityInfo.iconId: ' + JSON.stringify(extensionAbilityInfo.iconId));
              expect(typeof (extensionAbilityInfo.iconId) == 'number').assertTrue();
              console.log('extensionAbilityInfo.isVisible: ' + JSON.stringify(extensionAbilityInfo.isVisible));
              expect(typeof (extensionAbilityInfo.isVisible) == 'boolean').assertTrue();
              console.log('extensionAbilityInfo.labelId: ' + JSON.stringify(extensionAbilityInfo.labelId));
              expect(typeof (extensionAbilityInfo.labelId) == 'number').assertTrue();
              console.log('extensionAbilityInfo.moduleName: ' + JSON.stringify(extensionAbilityInfo.moduleName));
              expect(extensionAbilityInfo.moduleName == 'entry').assertTrue();
              console.log('extensionAbilityInfo.name: ' + JSON.stringify(extensionAbilityInfo.name));
              expect(extensionAbilityInfo.name == 'UIExtAbility').assertTrue();
              setTimeout(async () => {
                commonEvent.unsubscribe(subscriber, async (err, data) => {
                  globalThis.terminate('Acts_ShareExtensionAbility_2100');
                  setTimeout(() => {
                    console.info('====>Acts_ShareExtensionAbility_2100 unSubscribeCallback');
                    done();
                  }, 2000);
                });
              }, 1000);
            } catch (err) {
              globalThis.terminate('Acts_ShareExtensionAbility_2100');
              setTimeout(() => {
                console.log('Acts_ShareExtensionAbility_2100 fail: ' + err);
                expect().assertFail();
              }, 2000);
            }
          }
        });
      })
    })

    /**
     * @tc.number: Acts_ShareExtensionAbility_2000
     * @tc.name: Test ShareExtensionAbility basic function.
     * @tc.desc: Test config in context
     */
    it('Acts_ShareExtensionAbility_2000', Level.LEVEL0, async (done: Function) => {
      await sleep(2000);
      let subscribeInfo: commonEvent.CommonEventSubscribeInfo = {
        events: ['ACTS_CALL_EVENT']
      }

      await commonEvent.createSubscriber(subscribeInfo).then(async (data) => {
        console.log("createSubscriber data : " + JSON.stringify(data));
        subscriber = data;
        globalThis.context.startAbility({
          bundleName: 'com.example.actsshareextensionabilitytest',
          abilityName: 'EntryAbility',
          action: 'Acts_ShareExtensionAbility_context'
        }, (err: base.BusinessError) => {
          expect(err.code).assertEqual(0);
        });
        commonEvent.subscribe(subscriber, async (err, data) => {
          console.log("SubscribeInfoCallback : " + JSON.stringify(data));
          if (data.event == 'ACTS_CALL_EVENT') {
            try {
              let context: ESObject = data.parameters?.context as ESObject;
              expect(context != null).assertTrue();
              let config: ESObject = context.config as ESObject;
              expect(config != null).assertTrue();
              console.log('Acts_ShareExtensionAbility_2000 config.colorMode: ' + config.colorMode);
              expect(typeof (config.colorMode) == 'number').assertTrue();
              console.log('Acts_ShareExtensionAbility_2000 config.direction: ' + config.direction);
              expect(typeof (config.direction) == 'number').assertTrue();
              console.log('Acts_ShareExtensionAbility_2000 success');
            } catch (err) {
              console.log('Acts_ShareExtensionAbility_2000 fail: ' + err);
              expect().assertFail();
            }

            commonEvent.unsubscribe(subscriber, async (err, data) => {
              globalThis.terminate('Acts_ShareExtensionAbility_2000');
              setTimeout(() => {
                console.info('====>Acts_ShareExtensionAbility_2000 unSubscribeCallback');
                done();
              }, 2000);
            });
          }
        });
      })
    })

    /**
     * @tc.number: Acts_ShareExtensionAbility_2200
     * @tc.name: Test ShareExtensionAbility basic function.
     * @tc.desc: Test resourceManager in context
     */
    it('Acts_ShareExtensionAbility_2200', Level.LEVEL0, async (done: Function) => {
      await sleep(2000);
      let subscribeInfo: commonEvent.CommonEventSubscribeInfo = {
        events: ['ACTS_CALL_EVENT']
      }

      await commonEvent.createSubscriber(subscribeInfo).then(async (data) => {
        console.log("createSubscriber data : " + JSON.stringify(data));
        subscriber = data;
        globalThis.context.startAbility({
          bundleName: 'com.example.actsshareextensionabilitytest',
          abilityName: 'EntryAbility',
          action: 'Acts_ShareExtensionAbility_2200'
        }, (err: base.BusinessError) => {
          expect(err.code).assertEqual(0);
        });
        commonEvent.subscribe(subscriber, async (err, data) => {
          console.log("SubscribeInfoCallback : " + JSON.stringify(data));
          if (data.event == 'ACTS_CALL_EVENT') {
            expect(data.parameters?.resourceManager != null).assertTrue();
            console.log('Acts_ShareExtensionAbility_2200 success');

            commonEvent.unsubscribe(subscriber, async (err, data) => {
              globalThis.terminate('Acts_ShareExtensionAbility_2200');
              setTimeout(() => {
                console.info('====>Acts_ShareExtensionAbility_2200 unSubscribeCallback');
                done();
              }, 2000);
            });
          }
        });
      })
    })

    /**
     * @tc.number: Acts_ShareExtensionAbility_2300
     * @tc.name: Test ShareExtensionAbility basic function.
     * @tc.desc: Test applicationInfo in context
     */
    it('Acts_ShareExtensionAbility_2300', Level.LEVEL0, async (done: Function) => {
      await sleep(2000);
      let subscribeInfo: commonEvent.CommonEventSubscribeInfo = {
        events: ['ACTS_CALL_EVENT']
      }

      await commonEvent.createSubscriber(subscribeInfo).then(async (data) => {
        console.log("createSubscriber data : " + JSON.stringify(data));
        subscriber = data;
        globalThis.context.startAbility({
          bundleName: 'com.example.actsshareextensionabilitytest',
          abilityName: 'EntryAbility',
          action: 'Acts_ShareExtensionAbility_2300'
        }, (err: base.BusinessError) => {
          expect(err.code).assertEqual(0);
        });
        commonEvent.subscribe(subscriber, async (err, data) => {
          console.log("SubscribeInfoCallback : " + JSON.stringify(data));
          if (data.event == 'ACTS_CALL_EVENT') {
            console.log('Acts_ShareExtensionAbility_2300 applicationInfo.name: ' + data.parameters?.name);
            expect(data.parameters?.name == 'com.example.actsshareextensionabilitytest').assertTrue();
            console.log('Acts_ShareExtensionAbility_2300 applicationInfo.description: ' + data.parameters?.description_length);
            expect(data.parameters?.description_length >= 0).assertTrue();
            console.log('Acts_ShareExtensionAbility_2300 applicationInfo.descriptionId: ' + data.parameters?.descriptionId);
            expect(data.parameters?.descriptionId == 0).assertTrue();
            console.log('Acts_ShareExtensionAbility_2300 applicationInfo.label: ' + data.parameters?.label);
            expect(data.parameters?.label == '$string:app_name').assertTrue();
            console.log('Acts_ShareExtensionAbility_2300 applicationInfo.labelId: ' + data.parameters?.labelId);
            expect(data.parameters?.labelId != null).assertTrue();
            console.log('Acts_ShareExtensionAbility_2300 applicationInfo.icon: ' + data.parameters?.icon);
            expect(data.parameters?.icon == '$media:app_icon').assertTrue();
            console.log('Acts_ShareExtensionAbility_2300 applicationInfo.iconId: ' + data.parameters?.iconId);
            expect(data.parameters?.iconId != null).assertTrue();
            console.log('Acts_ShareExtensionAbility_2300 applicationInfo.codePath: ' + data.parameters?.codePath);
            expect(data.parameters?.codePath == 'string').assertTrue();
            console.log('Acts_ShareExtensionAbility_2300 success');
            commonEvent.unsubscribe(subscriber, async (err, data) => {
              globalThis.terminate('Acts_ShareExtensionAbility_2300');
              setTimeout(() => {
                console.info('====>Acts_ShareExtensionAbility_2300 unSubscribeCallback');
                done();
              }, 2000);
            });
          }
        });
      })
    })

    /**
     * @tc.number: Acts_ShareExtensionAbility_2400
     * @tc.name: Test ShareExtensionAbility basic function.
     * @tc.desc: Test cacheDir in context
     */
    it('Acts_ShareExtensionAbility_2400', Level.LEVEL0, async (done: Function) => {
      await sleep(2000);
      let subscribeInfo: commonEvent.CommonEventSubscribeInfo = {
        events: ['ACTS_CALL_EVENT']
      }

      await commonEvent.createSubscriber(subscribeInfo).then(async (data) => {
        console.log("createSubscriber data : " + JSON.stringify(data));
        subscriber = data;
        globalThis.context.startAbility({
          bundleName: 'com.example.actsshareextensionabilitytest',
          abilityName: 'EntryAbility',
          action: 'Acts_ShareExtensionAbility_2400'
        }, (err: base.BusinessError) => {
          expect(err.code).assertEqual(0);
        });
        commonEvent.subscribe(subscriber, async (err, data) => {
          console.log("SubscribeInfoCallback : " + JSON.stringify(data));
          if (data.event == 'ACTS_CALL_EVENT') {
            let cacheDir: ESObject = data.parameters?.cacheDir as ESObject;
            console.log('Acts_ShareExtensionAbility_2400 cacheDir:' + cacheDir);
            expect(typeof (cacheDir) == 'string').assertTrue();
            console.log('Acts_ShareExtensionAbility_2400 success');

            commonEvent.unsubscribe(subscriber, async (err, data) => {
              globalThis.terminate('Acts_ShareExtensionAbility_2400');
              setTimeout(() => {
                console.info('====>Acts_ShareExtensionAbility_2400 unSubscribeCallback');
                done();
              }, 2000);
            });
          }
        });
      })
    })

    /**
     * @tc.number: Acts_ShareExtensionAbility_2500
     * @tc.name: Test ShareExtensionAbility basic function.
     * @tc.desc: Test tempDir in context
     */
    it('Acts_ShareExtensionAbility_2500', Level.LEVEL0, async (done: Function) => {
      await sleep(2000);
      let subscribeInfo: commonEvent.CommonEventSubscribeInfo = {
        events: ['ACTS_CALL_EVENT']
      }

      await commonEvent.createSubscriber(subscribeInfo).then(async (data) => {
        console.log("createSubscriber data : " + JSON.stringify(data));
        subscriber = data;
        globalThis.context.startAbility({
          bundleName: 'com.example.actsshareextensionabilitytest',
          abilityName: 'EntryAbility',
          action: 'Acts_ShareExtensionAbility_2500'
        }, (err: base.BusinessError) => {
          expect(err.code).assertEqual(0);
        });
        commonEvent.subscribe(subscriber, async (err, data) => {
          console.log("SubscribeInfoCallback : " + JSON.stringify(data));
          if (data.event == 'ACTS_CALL_EVENT') {
            let tempDir: ESObject = data.parameters?.tempDir as ESObject;
            console.log('Acts_ShareExtensionAbility_2500 tempDir:' + tempDir);
            expect(typeof (tempDir) == 'string').assertTrue();
            console.log('Acts_ShareExtensionAbility_2500 success');

            commonEvent.unsubscribe(subscriber, async (err, data) => {
              globalThis.terminate('Acts_ShareExtensionAbility_2500');
              setTimeout(() => {
                console.info('====>Acts_ShareExtensionAbility_2500 unSubscribeCallback');
                done();
              }, 2000);
            });
          }
        });
      })
    })

    /**
     * @tc.number: Acts_ShareExtensionAbility_2600
     * @tc.name: Test ShareExtensionAbility basic function.
     * @tc.desc: Test filesDir in context
     */
    it('Acts_ShareExtensionAbility_2600', Level.LEVEL0, async (done: Function) => {
      await sleep(2000);
      let subscribeInfo: commonEvent.CommonEventSubscribeInfo = {
        events: ['ACTS_CALL_EVENT']
      }

      await commonEvent.createSubscriber(subscribeInfo).then(async (data) => {
        console.log("createSubscriber data : " + JSON.stringify(data));
        subscriber = data;
        globalThis.context.startAbility({
          bundleName: 'com.example.actsshareextensionabilitytest',
          abilityName: 'EntryAbility',
          action: 'Acts_ShareExtensionAbility_2600'
        }, (err: base.BusinessError) => {
          expect(err.code).assertEqual(0);
        });
        commonEvent.subscribe(subscriber, async (err, data) => {
          console.log("SubscribeInfoCallback : " + JSON.stringify(data));
          if (data.event == 'ACTS_CALL_EVENT') {
            let filesDir: ESObject = data.parameters?.filesDir as ESObject;
            console.log('Acts_ShareExtensionAbility_2600 filesDir:' + filesDir);
            expect(typeof (filesDir) == 'string').assertTrue();
            console.log('Acts_ShareExtensionAbility_2600 success');

            commonEvent.unsubscribe(subscriber, async (err, data) => {
              globalThis.terminate('Acts_ShareExtensionAbility_2600');
              setTimeout(() => {
                console.info('====>Acts_ShareExtensionAbility_2600 unSubscribeCallback');
                done();
              }, 2000);
            });
          }
        });
      })
    })

    /**
     * @tc.number: Acts_ShareExtensionAbility_2700
     * @tc.name: Test ShareExtensionAbility basic function.
     * @tc.desc: Test databaseDir in context
     */
    it('Acts_ShareExtensionAbility_2700', Level.LEVEL0, async (done: Function) => {
      await sleep(2000);
      let subscribeInfo: commonEvent.CommonEventSubscribeInfo = {
        events: ['ACTS_CALL_EVENT']
      }

      await commonEvent.createSubscriber(subscribeInfo).then(async (data) => {
        console.log("createSubscriber data : " + JSON.stringify(data));
        subscriber = data;
        globalThis.context.startAbility({
          bundleName: 'com.example.actsshareextensionabilitytest',
          abilityName: 'EntryAbility',
          action: 'Acts_ShareExtensionAbility_2700'
        }, (err: base.BusinessError) => {
          expect(err.code).assertEqual(0);
        });
        commonEvent.subscribe(subscriber, async (err, data) => {
          console.log("SubscribeInfoCallback : " + JSON.stringify(data));
          if (data.event == 'ACTS_CALL_EVENT') {
            let databaseDir: ESObject = data.parameters?.databaseDir as ESObject;
            console.log('Acts_ShareExtensionAbility_2700 databaseDir:' + databaseDir);
            expect(typeof (databaseDir) == 'string').assertTrue();
            console.log('Acts_ShareExtensionAbility_2700 success');

            commonEvent.unsubscribe(subscriber, async (err, data) => {
              globalThis.terminate('Acts_ShareExtensionAbility_2700');
              setTimeout(() => {
                console.info('====>Acts_ShareExtensionAbility_2700 unSubscribeCallback');
                done();
              }, 2000);
            });
          }
        });
      })
    })

    /**
     * @tc.number: Acts_ShareExtensionAbility_2800
     * @tc.name: Test ShareExtensionAbility basic function.
     * @tc.desc: Test preferencesDir in context
     */
    it('Acts_ShareExtensionAbility_2800', Level.LEVEL0, async (done: Function) => {
      await sleep(2000);
      let subscribeInfo: commonEvent.CommonEventSubscribeInfo = {
        events: ['ACTS_CALL_EVENT']
      }

      await commonEvent.createSubscriber(subscribeInfo).then(async (data) => {
        console.log("createSubscriber data : " + JSON.stringify(data));
        subscriber = data;
        globalThis.context.startAbility({
          bundleName: 'com.example.actsshareextensionabilitytest',
          abilityName: 'EntryAbility',
          action: 'Acts_ShareExtensionAbility_2800'
        }, (err: base.BusinessError) => {
          expect(err.code).assertEqual(0);
        });
        commonEvent.subscribe(subscriber, async (err, data) => {
          console.log("SubscribeInfoCallback : " + JSON.stringify(data));
          if (data.event == 'ACTS_CALL_EVENT') {
            let preferencesDir: ESObject = data.parameters?.preferencesDir as ESObject;
            console.log('Acts_ShareExtensionAbility_2800 preferencesDir:' + preferencesDir);
            expect(typeof (preferencesDir) == 'string').assertTrue();
            console.log('Acts_ShareExtensionAbility_2800 success');

            commonEvent.unsubscribe(subscriber, async (err, data) => {
              globalThis.terminate('Acts_ShareExtensionAbility_2800');
              setTimeout(() => {
                console.info('====>Acts_ShareExtensionAbility_2800 unSubscribeCallback');
                done();
              }, 2000);
            });
          }
        });
      })
    })

    /**
     * @tc.number: Acts_ShareExtensionAbility_2900
     * @tc.name: Test ShareExtensionAbility basic function.
     * @tc.desc: Test bundleCodeDir in context
     */
    it('Acts_ShareExtensionAbility_2900', Level.LEVEL0, async (done: Function) => {
      await sleep(2000);
      let subscribeInfo: commonEvent.CommonEventSubscribeInfo = {
        events: ['ACTS_CALL_EVENT']
      }

      await commonEvent.createSubscriber(subscribeInfo).then(async (data) => {
        console.log("createSubscriber data : " + JSON.stringify(data));
        subscriber = data;
        globalThis.context.startAbility({
          bundleName: 'com.example.actsshareextensionabilitytest',
          abilityName: 'EntryAbility',
          action: 'Acts_ShareExtensionAbility_2900'
        }, (err: base.BusinessError) => {
          expect(err.code).assertEqual(0);
        });
        commonEvent.subscribe(subscriber, async (err, data) => {
          console.log("SubscribeInfoCallback : " + JSON.stringify(data));
          if (data.event == 'ACTS_CALL_EVENT') {
            let bundleCodeDir: ESObject = data.parameters?.bundleCodeDir as ESObject;
            console.log('Acts_ShareExtensionAbility_2900 bundleCodeDir:' + bundleCodeDir);
            expect(typeof (bundleCodeDir) == 'string').assertTrue();
            console.log('Acts_ShareExtensionAbility_2900 success');

            commonEvent.unsubscribe(subscriber, async (err, data) => {
              globalThis.terminate('Acts_ShareExtensionAbility_2900');
              setTimeout(() => {
                console.info('====>Acts_ShareExtensionAbility_2900 unSubscribeCallback');
                done();
              }, 2000);
            });
          }
        });
      })
    })

    /**
     * @tc.number: Acts_ShareExtensionAbility_3000
     * @tc.name: Test ShareExtensionAbility basic function.
     * @tc.desc: Context calls createModuleContext, passing in the moduleName of the current application hap1
     */
    it('Acts_ShareExtensionAbility_3000', Level.LEVEL0, async (done: Function) => {
      await sleep(2000);
      let subscribeInfo: commonEvent.CommonEventSubscribeInfo = {
        events: ['ACTS_TEST_CONTEXT']
      };
      await commonEvent.createSubscriber(subscribeInfo).then(async (data) => {
        console.log("createSubscriber data : " + JSON.stringify(data));
        subscriber = data;
        globalThis.context.startAbility({
          bundleName: 'com.example.actsshareextensionabilitytest',
          abilityName: 'EntryAbility',
          action: 'Acts_ShareExtensionAbility_3000'
        }, (err: base.BusinessError) => {
          expect(err.code).assertEqual(0);
        });
        commonEvent.subscribe(subscriber, async (err, data) => {
          console.log("SubscribeInfoCallback : " + JSON.stringify(data));
          if (data.event == 'ACTS_TEST_CONTEXT') {
            try {
              expect(data.parameters?.bundleName != null).assertTrue();
              expect(data.parameters?.bundleName).assertEqual("com.example.actsshareextensionabilitytest");
              setTimeout(async () => {
                commonEvent.unsubscribe(subscriber, async (err, data) => {
                  globalThis.terminate('Acts_ShareExtensionAbility_3000');
                  setTimeout(() => {
                    console.info('====>Acts_ShareExtensionAbility_3000 unSubscribeCallback');
                    done();
                  }, 2000);
                });
              }, 1000);
            } catch (err) {
              globalThis.terminate('Acts_ShareExtensionAbility_3000');
              setTimeout(() => {
                console.log('Acts_ShareExtensionAbility_3000 fail: ' + err);
                expect().assertFail();
              }, 2000);
            }
          }
        });
      })
    })

    /**
     * @tc.number: Acts_ShareExtensionAbility_3100
     * @tc.name: Test ShareExtensionAbility basic function.
     * @tc.desc: Context calls createModuleContext, passing in the moduleName of the current application hap2
     */
    it('Acts_ShareExtensionAbility_3100', Level.LEVEL0, async (done: Function) => {
      await sleep(2000);
      let subscribeInfo: commonEvent.CommonEventSubscribeInfo = {
        events: ['ACTS_TEST_CONTEXT']
      };
      await commonEvent.createSubscriber(subscribeInfo).then(async (data) => {
        console.log("createSubscriber data : " + JSON.stringify(data));
        subscriber = data;
        globalThis.context.startAbility({
          bundleName: 'com.example.actsshareextensionabilitytest',
          abilityName: 'EntryAbility',
          action: 'Acts_ShareExtensionAbility_3100'
        }, (err: base.BusinessError) => {
          expect(err.code).assertEqual(0);
        });
        commonEvent.subscribe(subscriber, async (err, data) => {
          console.log("SubscribeInfoCallback : " + JSON.stringify(data));
          if (data.event == 'ACTS_TEST_CONTEXT') {
            try {
              expect(data.parameters?.bundleName != null).assertTrue();
              expect(data.parameters?.bundleName).assertEqual("com.example.actsshareextensionabilitytest");
              setTimeout(async () => {
                commonEvent.unsubscribe(subscriber, async (err, data) => {
                  globalThis.terminate('Acts_ShareExtensionAbility_3000');
                  setTimeout(() => {
                    console.info('====>Acts_ShareExtensionAbility_3000 unSubscribeCallback');
                    done();
                  }, 2000);
                });
              }, 1000);
            } catch (err) {
              globalThis.terminate('Acts_ShareExtensionAbility_3100');
              setTimeout(() => {
                console.log('Acts_ShareExtensionAbility_3100 fail: ' + err);
                expect().assertFail();
              }, 2000);
            }
          }
        });
      })
    })

    /**
     * @tc.number: Acts_ShareExtensionAbility_3200
     * @tc.name: Test ShareExtensionAbility basic function.
     * @tc.desc: Context calls createModuleContext, passing in the moduleName of the cross-application hap1
     */
    it('Acts_ShareExtensionAbility_3200', Level.LEVEL0, async (done: Function) => {
      await sleep(2000);
      let subscribeInfo: commonEvent.CommonEventSubscribeInfo = {
        events: ['ACTS_TEST_CONTEXT']
      };
      await commonEvent.createSubscriber(subscribeInfo).then(async (data) => {
        console.log("createSubscriber data : " + JSON.stringify(data));
        subscriber = data;
        globalThis.context.startAbility({
          bundleName: 'com.example.actsshareextensionabilitytest',
          abilityName: 'EntryAbility',
          action: 'Acts_ShareExtensionAbility_3200'
        }, (err: base.BusinessError) => {
          expect(err.code).assertEqual(0);
        });
        commonEvent.subscribe(subscriber, async (err, data) => {
          console.log("SubscribeInfoCallback : " + JSON.stringify(data));
          if (data.event == 'ACTS_TEST_CONTEXT') {
            try {
              expect(!data.parameters?.moduleContext).assertTrue();
              setTimeout(async () => {
                commonEvent.unsubscribe(subscriber, async (err, data) => {
                  globalThis.terminate('Acts_ShareExtensionAbility_3200');
                  setTimeout(() => {
                    console.info('====>Acts_ShareExtensionAbility_3200 unSubscribeCallback');
                    done();
                  }, 2000);
                });
              }, 1000);
            } catch (err) {
              globalThis.terminate('Acts_ShareExtensionAbility_3200');
              setTimeout(() => {
                console.log('Acts_ShareExtensionAbility_3200 fail: ' + err);
                expect().assertFail();
              }, 2000);
            }
          }
        });
      })
    })

    /**
     * @tc.number: Acts_ShareExtensionAbility_3300
     * @tc.name: Test ShareExtensionAbility basic function.
     * @tc.desc: Context calls createModuleContext, passing in a non-existing moduleName
     */
    it('Acts_ShareExtensionAbility_3300', Level.LEVEL0, async (done: Function) => {
      await sleep(2000);
      let subscribeInfo: commonEvent.CommonEventSubscribeInfo = {
        events: ['ACTS_TEST_CONTEXT']
      };
      await commonEvent.createSubscriber(subscribeInfo).then(async (data) => {
        console.log("createSubscriber data : " + JSON.stringify(data));
        subscriber = data;
        globalThis.context.startAbility({
          bundleName: 'com.example.actsshareextensionabilitytest',
          abilityName: 'EntryAbility',
          action: 'Acts_ShareExtensionAbility_3300'
        }, (err: base.BusinessError) => {
          expect(err.code).assertEqual(0);
        });
        commonEvent.subscribe(subscriber, async (err, data) => {
          console.log("SubscribeInfoCallback : " + JSON.stringify(data));
          if (data.event == 'ACTS_TEST_CONTEXT') {
            try {
              expect(!data.parameters?.moduleContext).assertTrue();
              setTimeout(async () => {
                commonEvent.unsubscribe(subscriber, async (err, data) => {
                  globalThis.terminate('Acts_ShareExtensionAbility_3300');
                  setTimeout(() => {
                    console.info('====>Acts_ShareExtensionAbility_3300 unSubscribeCallback');
                    done();
                  }, 2000);
                });
              }, 1000);
            } catch (err) {
              globalThis.terminate('Acts_ShareExtensionAbility_3300');
              setTimeout(() => {
                console.log('Acts_ShareExtensionAbility_3300 fail: ' + err);
                expect().assertFail();
              }, 2000);
            }
          }
        });
      })
    })

    /**
     * @tc.number: Acts_ShareExtensionAbility_3400
     * @tc.name: Test ShareExtensionAbility basic function.
     * @tc.desc: Context calls createModuleContext, and the incoming moduleName is undefined
     */
    it('Acts_ShareExtensionAbility_3400', Level.LEVEL0, async (done: Function) => {
      await sleep(2000);
      let subscribeInfo: commonEvent.CommonEventSubscribeInfo = {
        events: ['ACTS_TEST_CONTEXT']
      };
      await commonEvent.createSubscriber(subscribeInfo).then(async (data) => {
        console.log("createSubscriber data : " + JSON.stringify(data));
        subscriber = data;
        globalThis.context.startAbility({
          bundleName: 'com.example.actsshareextensionabilitytest',
          abilityName: 'EntryAbility',
          action: 'Acts_ShareExtensionAbility_3400'
        }, (err: base.BusinessError) => {
          expect(err.code).assertEqual(0);
        });
        commonEvent.subscribe(subscriber, async (err, data) => {
          console.log("SubscribeInfoCallback : " + JSON.stringify(data));
          if (data.event == 'ACTS_TEST_CONTEXT') {
            try {
              expect(!data.parameters?.moduleContext).assertTrue();
              setTimeout(async () => {
                commonEvent.unsubscribe(subscriber, async (err, data) => {
                  globalThis.terminate('Acts_ShareExtensionAbility_3400');
                  setTimeout(() => {
                    console.info('====>Acts_ShareExtensionAbility_3400 unSubscribeCallback');
                    done();
                  }, 2000);
                });
              }, 1000);
            } catch (err) {
              globalThis.terminate('Acts_ShareExtensionAbility_3400');
              setTimeout(() => {
                console.log('Acts_ShareExtensionAbility_3400 fail: ' + err);
                expect().assertFail();
              }, 2000);
            }
          }
        });
      })
    })

    /**
     * @tc.number: Acts_ShareExtensionAbility_3500
     * @tc.name: Test ShareExtensionAbility basic function.
     * @tc.desc: test getApplicationContext return not empty
     */
    it('Acts_ShareExtensionAbility_3500', Level.LEVEL0, async (done: Function) => {
      await sleep(2000);

      let subscribeInfo: commonEvent.CommonEventSubscribeInfo = {
        events: ['ACTS_TEST_CONTEXT']
      };
      await commonEvent.createSubscriber(subscribeInfo).then(async (data) => {
        console.log("createSubscriber data : " + JSON.stringify(data));
        subscriber = data;
        globalThis.context.startAbility({
          bundleName: 'com.example.actsshareextensionabilitytest',
          abilityName: 'EntryAbility',
          action: 'Acts_ShareExtensionAbility_3500'
        }, (err: base.BusinessError) => {
          expect(err.code).assertEqual(0);
        });
        commonEvent.subscribe(subscriber, async (err, data) => {
          console.log("SubscribeInfoCallback : " + JSON.stringify(data));
          if (data.event == 'ACTS_TEST_CONTEXT') {
            try {
              expect(data.parameters?.applicationContext != null).assertTrue();
              setTimeout(async () => {
                commonEvent.unsubscribe(subscriber, async (err, data) => {
                  globalThis.terminate('Acts_ShareExtensionAbility_3500');
                  setTimeout(() => {
                    console.info('====>Acts_ShareExtensionAbility_3500 unSubscribeCallback');
                    done();
                  }, 2000);
                });
              }, 1000);
            } catch (err) {
              globalThis.terminate('Acts_ShareExtensionAbility_3500');
              setTimeout(() => {
                console.log('Acts_ShareExtensionAbility_3500 fail: ' + err);
                expect().assertFail();
              }, 2000);
            }
          }
        });
      })
    })
  })
}