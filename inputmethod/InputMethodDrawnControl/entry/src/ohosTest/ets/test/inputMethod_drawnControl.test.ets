/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import commoneventmanager from '@ohos.commonEventManager';
import inputMethod from '@ohos.inputMethod';
import deviceinfo from '@ohos.deviceInfo';
import { Driver, ON, MatchPattern, Component, UiWindow, DisplayRotation, Rect } from '@ohos.UiTest'
import { BusinessError } from '@ohos.base'
import inputmethodengine from '@ohos.inputMethodEngine';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let sleep = (timeout: number): Promise<ESObject> => {
  return new Promise(resolve => {
    const st = setTimeout(() => {
      resolve(null);
      clearTimeout(st);
    }, timeout);
  });
};

export default function inputMethodDrawnControlJSUnit() {
  describe('inputMethodDrawnControlTest', () => {
    let driver = Driver.create();
    let textArea: Component;
    let rectInfo: Rect;
    const delegator:AbilityDelegatorRegistry.AbilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

    beforeAll(async (done: Function) => {
      console.info('====>beforeAll inputMethod_enable start!')
      try {
        await delegator.executeShellCommand('ime -e com.acts.inputmethoddrawncontrol.test -f');
        await delegator.executeShellCommand('ime -s com.acts.inputmethoddrawncontrol.test');
        console.info('====>beforeAll inputMethod_enable success');
        await driver.delayMs(1000);
        textArea = await driver.findComponent(ON.type('TextArea'));
        rectInfo = await textArea.getBounds();
        await driver.delayMs(1000);
        await runCmd();
        await driver.delayMs(1000);
        done();
      } catch (err) {
        console.info('====>beforeAll throw err:' + JSON.stringify(err.message))
        done();
      }
    })

    /**
     * afterEach: Test case-level clearance conditions, which are executed after each test case is executed.
     */
    afterAll(async (done: Function) => {
      done();
    });

    afterEach(async () => {
      try {
        let data = await inputMethod.getController().detach();
        console.info(`attach inputMethod success, data: ${JSON.stringify(data)}`);
      } catch (error) {
        console.info(`attach inputMethod fail, error: [${error.code}, ${error.message}]`);
      }
      ;
    }
    );

    let runCmd = async () => {
      let cursor_x: number = rectInfo.left + 20 + Math.floor(Math.random() * (rectInfo.right - rectInfo.left) * 0.7);
      let cursor_y: number = rectInfo.top + 20 + Math.floor(Math.random() * (rectInfo.bottom - rectInfo.top) * 0.7);
      console.info(`====>start click x: ${cursor_x}  y: ${cursor_y}`)
      await driver.click(cursor_x, cursor_y)
    }

    /*
    * @tc.number  SUB_Misc_inputMethod_onHandleExtendAction_0010
    * @tc.name   SUB_Misc_inputMethod_onHandleExtendAction_0010
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_Misc_inputMethod_onHandleExtendAction_0010', Level.LEVEL2, async (done: Function) => {
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }

      let publishCallback = async (err: BusinessError) => {
        await sleep(200);
        console.info("====>SUB_Misc_inputMethod_onHandleExtendAction_0010 publishCallback start");
        if (err) {
          console.info("====>SUB_Misc_inputMethod_onHandleExtendAction_0010 publishCallback failed:" + JSON.stringify(err));
        } else {
          try {
            let data = await inputMethod.getController().detach();
            console.info(`====>SUB_Misc_inputMethod_onHandleExtendAction_0010 data: ${JSON.stringify(data)}`);
            await inputMethod.getController().attach(true, ATTRIBUTE);
            console.info("====>SUB_Misc_inputMethod_onHandleExtendAction_0010 onHandleExtendAction start");
            inputMethod.getController().on("handleExtendAction", async (action) => {
              console.info("====>SUB_Misc_inputMethod_onHandleExtendAction_0010 onHandleExtendAction success: " + action);
              inputMethod.getController().off("handleExtendAction");
              await inputMethod.getController().detach();
              expect(action).assertEqual(0);
              done();
            });
          } catch (err) {
            console.info("====>SUB_Misc_inputMethod_onHandleExtendAction_0010 onHandleExtendAction catch err: " + JSON.stringify(err));
          }
        }
      }

      let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
        code: 10
      }
      commoneventmanager.publish('inputMethodDrawnControlTest', commonEventPublishData, publishCallback);
    });

    /*
    * @tc.number  SUB_Misc_inputMethod_offHandleExtendAction_0020
    * @tc.name   SUB_Misc_inputMethod_offHandleExtendAction_0020
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_Misc_inputMethod_offHandleExtendAction_0020', Level.LEVEL2, async (done: Function) => {
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }
      let flag = true;

      let publishCallback = async (err: BusinessError) => {
        await sleep(200);
        console.info("====>SUB_Misc_inputMethod_offHandleExtendAction_0020 publishCallback start");
        if (err) {
          console.info("====>SUB_Misc_inputMethod_offHandleExtendAction_0020 publishCallback failed:" + JSON.stringify(err));
        } else {
          try {
            await inputMethod.getController().attach(true, ATTRIBUTE);
            console.info("====>SUB_Misc_inputMethod_offHandleExtendAction_0020 offHandleExtendAction start");
            inputMethod.getController().on("handleExtendAction", async (action) => {
              flag = false;
              console.info("====>SUB_Misc_inputMethod_offHandleExtendAction_0020 flag: " + flag);
            });
            inputMethod.getController().off("handleExtendAction");
            let t = setTimeout(async () => {
              try {
                clearTimeout(t);
                await inputMethod.getController().detach();
                if (flag) {
                  expect(true).assertEqual(true);
                  console.info("====>SUB_Misc_inputMethod_offHandleExtendAction_0020 offHandleExtendAction success");
                } else {
                  console.info("====>SUB_Misc_inputMethod_offHandleExtendAction_0020 offHandleExtendAction fail");
                  expect().assertFail();
                }
              } catch (err) {
                console.info("====>SUB_Misc_inputMethod_offHandleExtendAction_0020 offHandleExtendAction catch err: " + JSON.stringify(err));
              }
              done();
            }, 1000)
          } catch (err) {
            console.info("====>SUB_Misc_inputMethod_offHandleExtendAction_0020 offHandleExtendAction catch err: " + JSON.stringify(err));
          }
        }
      }

      let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
        code: 20
      }
      commoneventmanager.publish('inputMethodDrawnControlTest', commonEventPublishData, publishCallback);
    });

    /*
    * @tc.number  SUB_Misc_inputMethod_onSendFunctionKey_0030
    * @tc.name   SUB_Misc_inputMethod_onSendFunctionKey_0030
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_Misc_inputMethod_onSendFunctionKey_0030', Level.LEVEL2, async (done: Function) => {
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }

      let publishCallback = async (err: BusinessError) => {
        await sleep(200);
        console.info("====>SUB_Misc_inputMethod_onSendFunctionKey_0030 publishCallback start");
        if (err) {
          console.info("====>SUB_Misc_inputMethod_onSendFunctionKey_0030 publishCallback failed:" + JSON.stringify(err));
        } else {
          try {
            await inputMethod.getController().attach(true, ATTRIBUTE);
            console.info("====>SUB_Misc_inputMethod_onSendFunctionKey_0030 onSendFunctionKey start");
            inputMethod.getController().on("sendFunctionKey", async (FunctionKey) => {
              console.info("====>SUB_Misc_inputMethod_onSendFunctionKey_0030 onSendFunctionKey success: " + FunctionKey.enterKeyType);
              inputMethod.getController().off("sendFunctionKey");
              await inputMethod.getController().detach();
              expect(FunctionKey.enterKeyType).assertEqual(0);
              done();
            });
          } catch (err) {
            console.info("====>SUB_Misc_inputMethod_onSendFunctionKey_0030 onSendFunctionKey catch err: " + JSON.stringify(err));
          }
        }
      }

      let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
        code: 30
      }
      commoneventmanager.publish('inputMethodDrawnControlTest', commonEventPublishData, publishCallback);
    });

    /*
    * @tc.number  SUB_Misc_inputMethod_offSendFunctionKey_0040
    * @tc.name   SUB_Misc_inputMethod_offSendFunctionKey_0040
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_Misc_inputMethod_offSendFunctionKey_0040', Level.LEVEL2, async (done: Function) => {
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }
      let flag = true;

      let publishCallback = async (err: BusinessError) => {
        await sleep(200);
        console.info("====>SUB_Misc_inputMethod_offSendFunctionKey_0040 publishCallback start");
        if (err) {
          console.info("====>SUB_Misc_inputMethod_offSendFunctionKey_0040 publishCallback failed:" + JSON.stringify(err));
        } else {
          try {
            await inputMethod.getController().attach(true, ATTRIBUTE);
            console.info("====>SUB_Misc_inputMethod_offSendFunctionKey_0040 offSendFunctionKey start");
            inputMethod.getController().on("sendFunctionKey", async (FunctionKey) => {
              flag = false;
              console.info("====>SUB_Misc_inputMethod_offSendFunctionKey_0040 flag: " + flag);
            });
            inputMethod.getController().off("sendFunctionKey");
            let t = setTimeout(async () => {
              try {
                clearTimeout(t);
                await inputMethod.getController().detach();
                if (flag) {
                  expect(true).assertEqual(true);
                  console.info("====>SUB_Misc_inputMethod_offSendFunctionKey_0040 offSendFunctionKey success");
                } else {
                  console.info("====>SUB_Misc_inputMethod_offSendFunctionKey_0040 offSendFunctionKey fail");
                  expect().assertFail();
                }
              } catch (err) {
                console.info("====>SUB_Misc_inputMethod_offSendFunctionKey_0040 offSendFunctionKey catch err: " + JSON.stringify(err));
              }
              done();
            }, 1000)
          } catch (err) {
            console.info("====>SUB_Misc_inputMethod_offSendFunctionKey_0040 offSendFunctionKey catch err: " + JSON.stringify(err));
          }
        }
      }

      let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
        code: 40
      }
      commoneventmanager.publish('inputMethodDrawnControlTest', commonEventPublishData, publishCallback);
    });

    /*
    * @tc.number  SUB_Misc_InputMethod_onGetLeftTextOfCursor_0050
    * @tc.name   SUB_Misc_InputMethod_onGetLeftTextOfCursor_0050
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_Misc_InputMethod_onGetLeftTextOfCursor_0050', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>SUB_Misc_InputMethod_onGetLeftTextOfCursor_0050 unSubscriberCallback start");
        if (err) {
          console.info("====>SUB_Misc_InputMethod_onGetLeftTextOfCursor_0050 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>SUB_Misc_InputMethod_onGetLeftTextOfCursor_0050 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>SUB_Misc_InputMethod_onGetLeftTextOfCursor_0050 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>SUB_Misc_InputMethod_onGetLeftTextOfCursor_0050 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>SUB_Misc_InputMethod_onGetLeftTextOfCursor_0050 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        await sleep(200);
        console.info("====>SUB_Misc_InputMethod_onGetLeftTextOfCursor_0050 publishCallback start");
        if (err) {
          console.info("====>SUB_Misc_InputMethod_onGetLeftTextOfCursor_0050 publishCallback failed:" + JSON.stringify(err));
        } else {
          const ATTRIBUTE: inputMethod.TextConfig = {
            inputAttribute: {
              textInputType: 0, enterKeyType: 0
            }
          }
          await inputMethod.getController().attach(true, ATTRIBUTE);
          inputMethod.getController().on('getLeftTextOfCursor', (length) => {
            inputMethod.getController().off('getLeftTextOfCursor');
            console.info("====>SUB_Misc_InputMethod_onGetLeftTextOfCursor_0050 length: " + length);
            expect(length).assertEqual(10000);
            return 'test'
          })
        }
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["SUB_Misc_InputMethod_onGetLeftTextOfCursor_0050"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data)=>{
        try{
          subscriber = data;
          console.info("====>SUB_Misc_InputMethod_onGetLeftTextOfCursor_0050 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>SUB_Misc_InputMethod_onGetLeftTextOfCursor_0050 subscriber finish");
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
            code: 50
          }
          commoneventmanager.publish('inputMethodDrawnControlTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  SUB_Misc_InputMethod_onGetLeftTextOfCursor_0060
    * @tc.name   SUB_Misc_InputMethod_onGetLeftTextOfCursor_0060
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_Misc_InputMethod_onGetLeftTextOfCursor_0060', Level.LEVEL2, async (done: Function) => {
      try {
        inputMethod.getController().on('getLeftTextOfCursor', (length) => {
          return 'test'
        })
        console.info("====>SUB_Misc_InputMethod_ongetLeftTextOfCursor_0060 on('getLeftTextOfCursor') Success:");
        expect().assertFail();
      } catch (err) {
        console.info("====>SUB_Misc_InputMethod_ongetLeftTextOfCursor_0060 err:" + JSON.stringify(err));
        expect(err.code).assertEqual(12800009);
        done();
      }
    });

    /*
    * @tc.number  SUB_Misc_InputMethod_offGetLeftTextOfCursor_0070
    * @tc.name   SUB_Misc_InputMethod_offGetLeftTextOfCursor_0070
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_Misc_InputMethod_offGetLeftTextOfCursor_0070', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>SUB_Misc_InputMethod_offGetLeftTextOfCursor_0070 unSubscriberCallback start");
        if (err) {
          console.info("====>SUB_Misc_InputMethod_offGetLeftTextOfCursor_0070 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>SUB_Misc_InputMethod_offGetLeftTextOfCursor_0070 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>SUB_Misc_InputMethod_offGetLeftTextOfCursor_0070 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>SUB_Misc_InputMethod_offGetLeftTextOfCursor_0070 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>SUB_Misc_InputMethod_offGetLeftTextOfCursor_0070 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let getLetTest_callback = (length: number) => {
        console.info("====>SUB_Misc_InputMethod_offGetLeftTextOfCursor_0070 length: " + length);
        expect(length).assertEqual(10000);
        return 'test'
      }

      let publishCallback = async (err: BusinessError) => {
        await sleep(200);
        console.info("====>SUB_Misc_InputMethod_offGetLeftTextOfCursor_0070 publishCallback start");
        if (err) {
          console.info("====>SUB_Misc_InputMethod_offGetLeftTextOfCursor_0070 publishCallback failed:" + JSON.stringify(err));
        } else {
          const ATTRIBUTE: inputMethod.TextConfig = {
            inputAttribute: {
              textInputType: 0, enterKeyType: 0
            }
          }
          await inputMethod.getController().attach(true, ATTRIBUTE);
          console.info("====>SUB_Misc_InputMethod_offGetLeftTextOfCursor_0070 attach Success");
          inputMethod.getController().on('getLeftTextOfCursor', getLetTest_callback);
          inputMethod.getController().off('getLeftTextOfCursor', getLetTest_callback);
        }
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["SUB_Misc_InputMethod_offGetLeftTextOfCursor_0070"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data)=>{
        try{
          subscriber = data;
          console.info("====>SUB_Misc_InputMethod_offGetLeftTextOfCursor_0070 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>SUB_Misc_InputMethod_offGetLeftTextOfCursor_0070 subscriber finish");
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
            code: 70
          }
          commoneventmanager.publish('inputMethodDrawnControlTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  SUB_Misc_InputMethod_onGetRightTextOfCursor_0080
    * @tc.name   SUB_Misc_InputMethod_onGetRightTextOfCursor_0080
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level1
    */
    it('SUB_Misc_InputMethod_onGetRightTextOfCursor_0080', Level.LEVEL1, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>SUB_Misc_InputMethod_onGetRightTextOfCursor_0080 unSubscriberCallback start");
        if (err) {
          console.info("====>SUB_Misc_InputMethod_onGetRightTextOfCursor_0080 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>SUB_Misc_InputMethod_onGetRightTextOfCursor_0080 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>SUB_Misc_InputMethod_onGetRightTextOfCursor_0080 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>SUB_Misc_InputMethod_onGetRightTextOfCursor_0080 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>SUB_Misc_InputMethod_onGetRightTextOfCursor_0080 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        console.info("====>SUB_Misc_InputMethod_onGetRightTextOfCursor_0080 publishCallback start");
        if (err) {
          console.info("====>SUB_Misc_InputMethod_onGetRightTextOfCursor_0080 publishCallback failed:" + JSON.stringify(err));
        } else {
          await sleep(200);
          const ATTRIBUTE: inputMethod.TextConfig = {
            inputAttribute: {
              textInputType: 0, enterKeyType: 0
            }
          }
          await inputMethod.getController().attach(true, ATTRIBUTE);
          inputMethod.getController().on('getRightTextOfCursor', (length) => {
            inputMethod.getController().off('getRightTextOfCursor');
            console.info("====>SUB_Misc_InputMethod_onGetRightTextOfCursor_0080 length: " + length);
            expect(length).assertEqual(10000);
            return 'test'
          })
        }
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["SUB_Misc_InputMethod_onGetRightTextOfCursor_0080"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data)=>{
        try{
          subscriber = data;
          console.info("====>SUB_Misc_InputMethod_onGetRightTextOfCursor_0080 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>SUB_Misc_InputMethod_onGetRightTextOfCursor_0080 subscriber finish");
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
            code: 80
          }
          commoneventmanager.publish('inputMethodDrawnControlTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  SUB_Misc_InputMethod_onGetRightTextOfCursor_0090
    * @tc.name   SUB_Misc_InputMethod_onGetRightTextOfCursor_0090
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_Misc_InputMethod_onGetRightTextOfCursor_0090', Level.LEVEL2, async (done: Function) => {
      try {
        inputMethod.getController().on('getRightTextOfCursor', (length) => {
          return 'test'
        })
        console.info("====>SUB_Misc_InputMethod_onGetRightTextOfCursor_0090 on('getLeftTextOfCursor') Success:");
        expect().assertFail();
      } catch (err) {
        console.info("====>SUB_Misc_InputMethod_onGetRightTextOfCursor_0090 err:" + JSON.stringify(err));
        expect(err.code).assertEqual(12800009);
        done();
      }
    });

    /*
    * @tc.number  SUB_Misc_InputMethod_offGetRightTextOfCursor_0100
    * @tc.name   SUB_Misc_InputMethod_offGetRightTextOfCursor_0100
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level1
    */
    it('SUB_Misc_InputMethod_offGetRightTextOfCursor_0100', Level.LEVEL1, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>SUB_Misc_InputMethod_offGetRightTextOfCursor_0100 unSubscriberCallback start");
        if (err) {
          console.info("====>SUB_Misc_InputMethod_offGetRightTextOfCursor_0100 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>SUB_Misc_InputMethod_offGetRightTextOfCursor_0100 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>SUB_Misc_InputMethod_offGetRightTextOfCursor_0100 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>SUB_Misc_InputMethod_offGetRightTextOfCursor_0100 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>SUB_Misc_InputMethod_offGetRightTextOfCursor_0100 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let getRightTest_callback = (length: number) => {
        console.info("====>SUB_Misc_InputMethod_offGetRightTextOfCursor_0100 length: " + length);
        expect(length).assertEqual(10000);
        return 'test'
      }

      let publishCallback = async (err: BusinessError) => {
        await sleep(200);
        console.info("====>SUB_Misc_InputMethod_offGetRightTextOfCursor_0100 publishCallback start");
        if (err) {
          console.info("====>SUB_Misc_InputMethod_offGetRightTextOfCursor_0100 publishCallback failed:" + JSON.stringify(err));
        } else {
          const ATTRIBUTE: inputMethod.TextConfig = {
            inputAttribute: {
              textInputType: 0, enterKeyType: 0
            }
          }
          await inputMethod.getController().attach(true, ATTRIBUTE);
          console.info("====>SUB_Misc_InputMethod_offGetRightTextOfCursor_0100 attach Success");
          inputMethod.getController().on('getRightTextOfCursor', getRightTest_callback);
          inputMethod.getController().off('getRightTextOfCursor', getRightTest_callback);
        }
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["SUB_Misc_InputMethod_offGetRightTextOfCursor_0100"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data)=>{
        try{
          subscriber = data;
          console.info("====>SUB_Misc_InputMethod_offGetRightTextOfCursor_0100 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>SUB_Misc_InputMethod_offGetRightTextOfCursor_0100 subscriber finish");
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
            code: 100
          }
          commoneventmanager.publish('inputMethodDrawnControlTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  SUB_Misc_InputMethod_onGetTextIndexAtCursor_0110
    * @tc.name   SUB_Misc_InputMethod_onGetTextIndexAtCursor_0110
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_Misc_InputMethod_onGetTextIndexAtCursor_0110', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>SUB_Misc_InputMethod_onGetTextIndexAtCursor_0110 unSubscriberCallback start");
        if (err) {
          console.info("====>SUB_Misc_InputMethod_onGetTextIndexAtCursor_0110 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>SUB_Misc_InputMethod_onGetTextIndexAtCursor_0110 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>SUB_Misc_InputMethod_onGetTextIndexAtCursor_0110 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>SUB_Misc_InputMethod_onGetTextIndexAtCursor_0110 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>SUB_Misc_InputMethod_onGetTextIndexAtCursor_0110 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        await sleep(200);
        console.info("====>SUB_Misc_InputMethod_onGetTextIndexAtCursor_0110 publishCallback start");
        if (err) {
          console.info("====>SUB_Misc_InputMethod_onGetTextIndexAtCursor_0110 publishCallback failed:" + JSON.stringify(err));
        } else {
          const ATTRIBUTE: inputMethod.TextConfig = {
            inputAttribute: {
              textInputType: 0, enterKeyType: 0
            }
          }
          await inputMethod.getController().attach(true, ATTRIBUTE);
          inputMethod.getController().on('getTextIndexAtCursor', () => {
            inputMethod.getController().off('getTextIndexAtCursor');
            console.info("====>SUB_Misc_InputMethod_onGetTextIndexAtCursor_0110 on('getTextIndexAtCursor')");
            return 10000
          })
        }
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["SUB_Misc_InputMethod_onGetTextIndexAtCursor_0110"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data)=>{
        try{
          subscriber = data;
          console.info("====>SUB_Misc_InputMethod_onGetTextIndexAtCursor_0110 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>SUB_Misc_InputMethod_onGetTextIndexAtCursor_0110 subscriber finish");
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
            code: 110
          }
          commoneventmanager.publish('inputMethodDrawnControlTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  SUB_Misc_InputMethod_onGetTextIndexAtCursor_0120
    * @tc.name   SUB_Misc_InputMethod_onGetTextIndexAtCursor_0120
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_Misc_InputMethod_onGetTextIndexAtCursor_0120', Level.LEVEL2, async (done: Function) => {
      try {
        inputMethod.getController().on('getTextIndexAtCursor', () => {
          return 10000
        })
        console.info("====>SUB_Misc_InputMethod_onGetTextIndexAtCursor_0120 on('getLeftTextOfCursor') Success:");
        expect().assertFail();
      } catch (err) {
        console.info("====>SUB_Misc_InputMethod_onGetTextIndexAtCursor_0120 err:" + JSON.stringify(err));
        expect(err.code).assertEqual(12800009);
        done();
      }
    });

    /*
    * @tc.number  SUB_Misc_InputMethod_offGetTextIndexAtCursor_0130
    * @tc.name   SUB_Misc_InputMethod_offGetTextIndexAtCursor_0130
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_Misc_InputMethod_offGetTextIndexAtCursor_0130', Level.LEVEL2, async (done: Function) => {

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>SUB_Misc_InputMethod_offGetTextIndexAtCursor_0130 unSubscriberCallback start");
        if (err) {
          console.info("====>SUB_Misc_InputMethod_offGetTextIndexAtCursor_0130 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>SUB_Misc_InputMethod_offGetTextIndexAtCursor_0130 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>SUB_Misc_InputMethod_offGetTextIndexAtCursor_0130 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>SUB_Misc_InputMethod_offGetTextIndexAtCursor_0130 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>SUB_Misc_InputMethod_offGetTextIndexAtCursor_0130 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let getTextTest_callback = () => {
        console.info("====>SUB_Misc_InputMethod_offGetTextIndexAtCursor_0130 getLetTest_callback");
        return 10000
      }

      let publishCallback = async (err: BusinessError) => {
        await sleep(200);
        console.info("====>SUB_Misc_InputMethod_offGetTextIndexAtCursor_0130 publishCallback start");
        if (err) {
          console.info("====>SUB_Misc_InputMethod_offGetTextIndexAtCursor_0130 publishCallback failed:" + JSON.stringify(err));
        } else {
          const ATTRIBUTE: inputMethod.TextConfig = {
            inputAttribute: {
              textInputType: 0, enterKeyType: 0
            }
          }
          await inputMethod.getController().attach(true, ATTRIBUTE);
          console.info("====>SUB_Misc_InputMethod_offGetTextIndexAtCursor_0130 attach Success");
          inputMethod.getController().on('getTextIndexAtCursor', getTextTest_callback);
          inputMethod.getController().off('getTextIndexAtCursor', getTextTest_callback);
        }
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["SUB_Misc_InputMethod_offGetTextIndexAtCursor_0130"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data)=>{
        try{
          subscriber = data;
          console.info("====>SUB_Misc_InputMethod_offGetTextIndexAtCursor_0130 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>SUB_Misc_InputMethod_offGetTextIndexAtCursor_0130 subscriber finish");
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
            code: 130
          }
          commoneventmanager.publish('inputMethodDrawnControlTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  SUB_Misc_inputMethod_onEditorAttributeChanged_0140
    * @tc.name   SUB_Misc_inputMethod_onEditorAttributeChanged_0140
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_Misc_inputMethod_onEditorAttributeChanged_0140', Level.LEVEL2, async (done: Function) => {
      let inputAttribute: inputMethod.InputAttribute = {
        textInputType: 0, enterKeyType: 3
      }
      let inputAttribute1: inputMethod.InputAttribute = {
        textInputType: 0, enterKeyType: 0
      }
      let cursorInfo: inputMethod.CursorInfo = {
        left: 2, top: 2, width: 2, height: 2
      }
      const textConfig: inputMethod.TextConfig = {
        inputAttribute,
        cursorInfo,
        windowId: 100
      }

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>SUB_Misc_inputMethod_onEditorAttributeChanged_0140 unSubscriberCallback start");
        if (err) {
          console.info("====>SUB_Misc_inputMethod_onEditorAttributeChanged_0140 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>SUB_Misc_inputMethod_onEditorAttributeChanged_0140 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>SUB_Misc_inputMethod_onEditorAttributeChanged_0140 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>SUB_Misc_inputMethod_onEditorAttributeChanged_0140 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>SUB_Misc_inputMethod_onEditorAttributeChanged_0140 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        await sleep(200);
        console.info("====>SUB_Misc_inputMethod_onEditorAttributeChanged_0140 onEditorAttributeChanged start");
        if (err) {
          console.info("====>SUB_Misc_inputMethod_onEditorAttributeChanged_0140 publishCallback failed:" + JSON.stringify(err));
        } else {
          try {
            await inputMethod.getController().attach(false, textConfig);
            console.info("====>SUB_Misc_inputMethod_onEditorAttributeChanged_0140 onEditorAttributeChanged attach");
            await sleep(200);
            await inputMethod.getController().updateAttribute(inputAttribute1);
            console.info("====>SUB_Misc_inputMethod_onEditorAttributeChanged_0140 onEditorAttributeChanged updateAttribute");
          } catch (err) {
            console.info("====>SUB_Misc_inputMethod_onEditorAttributeChanged_0140 onEditorAttributeChanged catch err: " + JSON.stringify(err));
          }
        }
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["SUB_Misc_inputMethod_onEditorAttributeChanged_0140"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data)=>{
        try{
          subscriber = data;
          console.info("====>SUB_Misc_inputMethod_onEditorAttributeChanged_0140 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>SUB_Misc_inputMethod_onEditorAttributeChanged_0140 subscriber finish");
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
            code: 140
          }
          commoneventmanager.publish('inputMethodDrawnControlTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  SUB_Misc_inputMethod_onEditorAttributeChanged_0150
    * @tc.name   SUB_Misc_inputMethod_onEditorAttributeChanged_0150
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_Misc_inputMethod_onEditorAttributeChanged_0150', Level.LEVEL2, async (done: Function) => {
      let inputAttribute: inputMethod.InputAttribute = {
        textInputType: 0, enterKeyType: 0
      }
      try {
        await inputMethod.getController().updateAttribute(inputAttribute);
        console.info("====>SUB_Misc_inputMethod_onEditorAttributeChanged_0150 onEditorAttributeChanged updateAttribute");
        expect().assertFail();
      } catch (err) {
        console.info("====>SUB_Misc_inputMethod_onEditorAttributeChanged_0150 err:" + JSON.stringify(err));
        expect(err.code).assertEqual(12800009);
        done();
      }
    });

    /*
    * @tc.number  SUB_Misc_inputMethod_offEditorAttributeChanged_0160
    * @tc.name   SUB_Misc_inputMethod_offEditorAttributeChanged_0160
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_Misc_inputMethod_offEditorAttributeChanged_0160', Level.LEVEL2, async (done: Function) => {
      let inputAttribute: inputMethod.InputAttribute = {
        textInputType: 0, enterKeyType: 3
      }
      let inputAttribute1: inputMethod.InputAttribute = {
        textInputType: 0, enterKeyType: 0
      }
      let selection: inputMethod.Range = {
        start: 2, end: 1000
      }
      const textConfig: inputMethod.TextConfig = {
        inputAttribute,
        selection,
      }

      let unSubscriberCallback = (err: BusinessError) => {
        console.info("====>SUB_Misc_inputMethod_offEditorAttributeChanged_0160 unSubscriberCallback start");
        if (err) {
          console.info("====>SUB_Misc_inputMethod_offEditorAttributeChanged_0160 unSubscriberCallback failed:" +
          JSON.stringify(err));
        } else {
          console.info("====>SUB_Misc_inputMethod_offEditorAttributeChanged_0160 unSubscriberCallback finish");
        }
      }

      let subscriberCallback = (err: BusinessError, data: ESObject) => {
        console.info("====>SUB_Misc_inputMethod_offEditorAttributeChanged_0160 subscriberCallback data:"
          + JSON.stringify(data));
        commoneventmanager.unsubscribe(subscriber, unSubscriberCallback);
        let t = setTimeout(() => {
          try {
            expect(data.data).assertEqual("SUCCESS");
            console.info("====>SUB_Misc_inputMethod_offEditorAttributeChanged_0160 end");
            clearTimeout(t);
            done();
          } catch (err) {
            console.info("====>SUB_Misc_inputMethod_offEditorAttributeChanged_0160 err:" + JSON.stringify(err));
            clearTimeout(t);
            done();
          }
        }, 500)
      }

      let publishCallback = async (err: BusinessError) => {
        await sleep(200);
        console.info("====>SUB_Misc_inputMethod_offEditorAttributeChanged_0160 onEditorAttributeChanged start");
        if (err) {
          console.info("====>SUB_Misc_inputMethod_offEditorAttributeChanged_0160 publishCallback failed:" + JSON.stringify(err));
        } else {
          try {
            await inputMethod.getController().attach(false, textConfig);
            console.info("====>SUB_Misc_inputMethod_offEditorAttributeChanged_0160 onEditorAttributeChanged attach");
            await inputMethod.getController().updateAttribute(inputAttribute1);
            console.info("====>SUB_Misc_inputMethod_offEditorAttributeChanged_0160 onEditorAttributeChanged updateAttribute");
          } catch (err) {
            console.info("====>SUB_Misc_inputMethod_offEditorAttributeChanged_0160 onEditorAttributeChanged catch err: " + JSON.stringify(err));
          }
        }
      }

      let commonEventSubscribeInfo: commoneventmanager.CommonEventSubscribeInfo = {
        events: ["SUB_Misc_inputMethod_offEditorAttributeChanged_0160"]
      }
      let subscriber: ESObject;
      commoneventmanager.createSubscriber(commonEventSubscribeInfo).then((data)=>{
        try{
          subscriber = data;
          console.info("====>SUB_Misc_inputMethod_offEditorAttributeChanged_0160 subscriber data:" + JSON.stringify(data));
          commoneventmanager.subscribe(subscriber, subscriberCallback);
          console.info("====>SUB_Misc_inputMethod_offEditorAttributeChanged_0160 subscriber finish");
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }

        let t = setTimeout(async () => {
          clearTimeout(t);
          let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
            code: 160
          }
          commoneventmanager.publish('inputMethodDrawnControlTest', commonEventPublishData, publishCallback);
        }, 500)

      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    });

    /*
    * @tc.number  SUB_Misc_inputMethod_onInsertText_0170
    * @tc.name   SUB_Misc_inputMethod_onInsertText_0170
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_Misc_inputMethod_onInsertText_0170', Level.LEVEL2, async (done: Function) => {
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }

      let publishCallback = async (err: BusinessError) => {
        await sleep(200);
        console.info("====>SUB_Misc_inputMethod_onInsertText_0170 publishCallback start");
        if (err) {
          console.info("====>SUB_Misc_inputMethod_onInsertText_0170 publishCallback failed:" + JSON.stringify(err));
        } else {
          try {
            await inputMethod.getController().attach(true, ATTRIBUTE);
            console.info("====>SUB_Misc_inputMethod_onInsertText_0170 onInsertText start");
            inputMethod.getController().on("insertText", async (text) => {
              try {
                console.info("====>SUB_Misc_inputMethod_onInsertText_0170 onInsertText success: " + text);
                inputMethod.getController().off("insertText");
                await inputMethod.getController().detach();
                expect(text).assertEqual("insert");
                done();
              } catch (err) {
                console.info("====>SUB_Misc_inputMethod_onInsertText_0170 onInsertText fail: " + JSON.stringify(err));
                done();
              }
            });
          } catch (err) {
            console.info("====>SUB_Misc_inputMethod_onInsertText_0170 onInsertText catch err: " + JSON.stringify(err));
            done();
          }
        }
      }

      let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
        code: 170
      }
      commoneventmanager.publish('inputMethodDrawnControlTest', commonEventPublishData, publishCallback);
    });

    /*
    * @tc.number  SUB_Misc_inputMethod_offInsertText_0180
    * @tc.name   SUB_Misc_inputMethod_offInsertText_0180
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_Misc_inputMethod_offInsertText_0180', Level.LEVEL2, async (done: Function) => {
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }
      let flag = true;

      let publishCallback = async (err: BusinessError) => {
        await sleep(200);
        console.info("====>SUB_Misc_inputMethod_offInsertText_0180 publishCallback start");
        if (err) {
          console.info("====>SUB_Misc_inputMethod_offInsertText_0180 publishCallback failed:" + JSON.stringify(err));
        } else {
          try {
            await inputMethod.getController().attach(true, ATTRIBUTE);
            console.info("====>SUB_Misc_inputMethod_offInsertText_0180 offInsertText start");
            inputMethod.getController().on("insertText", async (text) => {
              flag = false;
              console.info("====>SUB_Misc_inputMethod_offInsertText_0180 flag: " + flag);
            });
            inputMethod.getController().off("insertText");
            let t = setTimeout(async () => {
              try {
                clearTimeout(t);
                await inputMethod.getController().detach();
                if (flag) {
                  expect(true).assertEqual(true);
                  console.info("====>SUB_Misc_inputMethod_offInsertText_0180 offInsertText success");
                  done();
                } else {
                  console.info("====>SUB_Misc_inputMethod_offInsertText_0180 offInsertText fail");
                  expect().assertFail();
                }
              } catch (err) {
                console.info("====>SUB_Misc_inputMethod_offInsertText_0180 offInsertText catch err: " + JSON.stringify(err));
                done();
              }
            }, 1000)
          } catch (err) {
            console.info("====>SUB_Misc_inputMethod_offInsertText_0180 offInsertText catch err: " + JSON.stringify(err));
          }
        }
      }

      let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
        code: 180
      }
      commoneventmanager.publish('inputMethodDrawnControlTest', commonEventPublishData, publishCallback);
    });

    /*
    * @tc.number  SUB_Misc_inputMethod_onDeleteLeft_0190
    * @tc.name   SUB_Misc_inputMethod_onDeleteLeft_0190
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_Misc_inputMethod_onDeleteLeft_0190', Level.LEVEL2, async (done: Function) => {
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }

      let publishCallback = async (err: BusinessError) => {
        await sleep(200);
        console.info("====>SUB_Misc_inputMethod_onDeleteLeft_0190 publishCallback start");
        if (err) {
          console.info("====>SUB_Misc_inputMethod_onDeleteLeft_0190 publishCallback failed:" + JSON.stringify(err));
        } else {
          try {
            await inputMethod.getController().attach(true, ATTRIBUTE);
            console.info("====>SUB_Misc_inputMethod_onDeleteLeft_0190 onDeleteLeft start");
            inputMethod.getController().on("deleteLeft", async (num) => {
              try {
                console.info("====>SUB_Misc_inputMethod_onDeleteLeft_0190 onDeleteLeft success: " + num);
                inputMethod.getController().off("deleteLeft");
                await inputMethod.getController().detach();
                expect(num).assertEqual(1);
                done();
              } catch (err) {
                console.info("====>SUB_Misc_inputMethod_onDeleteLeft_0190 onDeleteLeft fail: " + JSON.stringify(err));
                done();
              }
            });
          } catch (err) {
            console.info("====>SUB_Misc_inputMethod_onDeleteLeft_0190 onDeleteLeft catch err: " + JSON.stringify(err));
          }
        }
      }

      let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
        code: 190
      }
      commoneventmanager.publish('inputMethodDrawnControlTest', commonEventPublishData, publishCallback);
    });

    /*
    * @tc.number  SUB_Misc_inputMethod_offDeleteLeft_0200
    * @tc.name   SUB_Misc_inputMethod_offDeleteLeft_0200
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_Misc_inputMethod_offDeleteLeft_0200', Level.LEVEL2, async (done: Function) => {
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }
      let flag = true;

      let publishCallback = async (err: BusinessError) => {
        await sleep(200);
        console.info("====>SUB_Misc_inputMethod_offDeleteLeft_0200 publishCallback start");
        if (err) {
          console.info("====>SUB_Misc_inputMethod_offDeleteLeft_0200 publishCallback failed:" + JSON.stringify(err));
        } else {
          try {
            await inputMethod.getController().attach(true, ATTRIBUTE);
            console.info("====>SUB_Misc_inputMethod_offDeleteLeft_0200 offDeleteLeft start");
            inputMethod.getController().on("deleteLeft", async () => {
              flag = false;
              console.info("====>SUB_Misc_inputMethod_offDeleteLeft_0200 flag: " + flag);
            });
            inputMethod.getController().off("deleteLeft");
            let t = setTimeout(async () => {
              try {
                clearTimeout(t);
                await inputMethod.getController().detach();
                if (flag) {
                  expect(true).assertEqual(true);
                  console.info("====>SUB_Misc_inputMethod_offDeleteLeft_0200 offDeleteLeft success");
                  done();
                } else {
                  console.info("====>SUB_Misc_inputMethod_offDeleteLeft_0200 offDeleteLeft fail");
                  expect().assertFail();
                }
              } catch (err) {
                console.info("====>SUB_Misc_inputMethod_offDeleteLeft_0200 offDeleteLeft catch err: " + JSON.stringify(err));
                done();
              }
            }, 1000)
          } catch (err) {
            console.info("====>SUB_Misc_inputMethod_offDeleteLeft_0200 offDeleteLeft catch err: " + JSON.stringify(err));
          }
        }
      }

      let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
        code: 200
      }
      commoneventmanager.publish('inputMethodDrawnControlTest', commonEventPublishData, publishCallback);
    });

    /*
    * @tc.number  SUB_Misc_inputMethod_onDeleteRight_0210
    * @tc.name   SUB_Misc_inputMethod_onDeleteRight_0210
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_Misc_inputMethod_onDeleteRight_0210', Level.LEVEL2, async (done: Function) => {
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }

      let publishCallback = async (err: BusinessError) => {
        await sleep(200);
        console.info("====>SUB_Misc_inputMethod_onDeleteRight_0210 publishCallback start");
        if (err) {
          console.info("====>SUB_Misc_inputMethod_onDeleteRight_0210 publishCallback failed:" + JSON.stringify(err));
        } else {
          try {
            await inputMethod.getController().attach(true, ATTRIBUTE);
            console.info("====>SUB_Misc_inputMethod_onDeleteRight_0210 onDeleteRight start");
            inputMethod.getController().on("deleteRight", async (num) => {
              try {
                console.info("====>SUB_Misc_inputMethod_onDeleteRight_0210 onDeleteRight success: " + num);
                inputMethod.getController().off("deleteRight");
                await inputMethod.getController().detach();
                expect(num).assertEqual(1);
                done();
              } catch (err) {
                console.info("====>SUB_Misc_inputMethod_onDeleteRight_0210 onDeleteRight fail: " + JSON.stringify(err));
                done();
              }
            });
          } catch (err) {
            console.info("====>SUB_Misc_inputMethod_onDeleteRight_0210 onDeleteRight catch err: " + JSON.stringify(err));
            done();
          }
        }
      }

      let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
        code: 210
      }
      commoneventmanager.publish('inputMethodDrawnControlTest', commonEventPublishData, publishCallback);
    });

    /*
    * @tc.number  SUB_Misc_inputMethod_offDeleteRight_0220
    * @tc.name   SUB_Misc_inputMethod_offDeleteRight_0220
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_Misc_inputMethod_offDeleteRight_0220', Level.LEVEL2, async (done: Function) => {
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }
      let flag = true;

      let publishCallback = async (err: BusinessError) => {
        await sleep(200);
        console.info("====>SUB_Misc_inputMethod_offDeleteRight_0220 publishCallback start");
        if (err) {
          console.info("====>SUB_Misc_inputMethod_offDeleteRight_0220 publishCallback failed:" + JSON.stringify(err));
        } else {
          try {
            await inputMethod.getController().attach(true, ATTRIBUTE);
            console.info("====>SUB_Misc_inputMethod_offDeleteRight_0220 offDeleteLeft start");
            inputMethod.getController().on("deleteRight", async (num) => {
              flag = false;
              console.info("====>SUB_Misc_inputMethod_offDeleteRight_0220 flag: " + flag);
            });
            inputMethod.getController().off("deleteRight");
            let t = setTimeout(async () => {
              try {
                clearTimeout(t);
                await inputMethod.getController().detach();
                if (flag) {
                  expect(true).assertEqual(true);
                  console.info("====>SUB_Misc_inputMethod_offDeleteRight_0220 offDeleteRight success");
                  done();
                } else {
                  console.info("====>SUB_Misc_inputMethod_offDeleteRight_0220 offDeleteRight fail");
                  expect().assertFail();
                }
              } catch (err) {
                console.info("====>SUB_Misc_inputMethod_offDeleteRight_0220 offDeleteRight catch err: " + JSON.stringify(err));
                done();
              }
            }, 1000)
          } catch (err) {
            console.info("====>SUB_Misc_inputMethod_offDeleteRight_0220 offDeleteRight catch err: " + JSON.stringify(err));
            done();
          }
        }
      }

      let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
        code: 220
      }
      commoneventmanager.publish('inputMethodDrawnControlTest', commonEventPublishData, publishCallback);
    });

    /*
    * @tc.number  SUB_Misc_inputMethod_onSendKeyboardStatus_0230
    * @tc.name   SUB_Misc_inputMethod_onSendKeyboardStatus_0230
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_Misc_inputMethod_onSendKeyboardStatus_0230', Level.LEVEL2, async (done: Function) => {
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }
      console.info("====>SUB_Misc_inputMethod_onSendKeyboardStatus_0230 publishCallback start");
      try {
        await inputMethod.getController().attach(false, ATTRIBUTE);
        console.info("====>SUB_Misc_inputMethod_onSendKeyboardStatus_0230 attach start");
        inputMethod.getController().on("sendKeyboardStatus", async (keyBoardStatus) => {
          try {
            console.info("====>SUB_Misc_inputMethod_onSendKeyboardStatus_0230 onSendKeyboardStatus success: " + keyBoardStatus);
            inputMethod.getController().off("sendKeyboardStatus");
            await inputMethod.getController().detach();
            expect(keyBoardStatus).assertEqual(1);
            done();
          } catch (err) {
            console.info("====>SUB_Misc_inputMethod_onSendKeyboardStatus_0230 onSendKeyboardStatus fail: " + JSON.stringify(err));
            done();
          }
        });
        await inputMethod.getController().hideSoftKeyboard();
      } catch (err) {
        console.info("====>SUB_Misc_inputMethod_onSendKeyboardStatus_0230 onSendKeyboardStatus catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /*
    * @tc.number  SUB_Misc_inputMethod_offSendKeyboardStatus_0240
    * @tc.name   SUB_Misc_inputMethod_offSendKeyboardStatus_0240
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_Misc_inputMethod_offSendKeyboardStatus_0240', Level.LEVEL2, async (done: Function) => {
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }
      let flag = true;
      try {
        await inputMethod.getController().attach(true, ATTRIBUTE);
        console.info("====>SUB_Misc_inputMethod_offSendKeyboardStatus_0240 attach start");
        inputMethod.getController().on("sendKeyboardStatus", async (keyBoardStatus) => {
          flag = false;
          console.info("====>SUB_Misc_inputMethod_offSendKeyboardStatus_0240 flag: " + flag);
        });
        inputMethod.getController().off("sendKeyboardStatus");
        console.info("====>SUB_Misc_inputMethod_offSendKeyboardStatus_0240 offSendKeyboardStatus offSendKeyboardStatus");
        await inputMethod.getController().hideSoftKeyboard();
        if (flag) {
          expect(true).assertEqual(true);
          console.info("====>SUB_Misc_inputMethod_offSendKeyboardStatus_0240 offSendKeyboardStatus success");
          done();
        } else {
          console.info("====>SUB_Misc_inputMethod_offSendKeyboardStatus_0240 offSendKeyboardStatus fail");
          expect().assertFail();
          done();
        }
      } catch (err) {
        console.info("====>SUB_Misc_inputMethod_offSendKeyboardStatus_0240 offSendKeyboardStatus catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /*
    * @tc.number  SUB_Misc_inputMethod_onMoveCursor_0250
    * @tc.name   SUB_Misc_inputMethod_onMoveCursor_0250
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_Misc_inputMethod_onMoveCursor_0250', Level.LEVEL2, async (done: Function) => {
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }

      let publishCallback = async (err: BusinessError) => {
        await sleep(200);
        console.info("====>SUB_Misc_inputMethod_onMoveCursor_0250 publishCallback start");
        if (err) {
          console.info("====>SUB_Misc_inputMethod_onMoveCursor_0250 publishCallback failed:" + JSON.stringify(err));
        } else {
          try {
            await inputMethod.getController().attach(true, ATTRIBUTE);
            console.info("====>SUB_Misc_inputMethod_onMoveCursor_0250 onMoveCursor start");
            inputMethod.getController().on("moveCursor", async (direction) => {
              try {
                console.info("====>SUB_Misc_inputMethod_onMoveCursor_0250 onMoveCursor success: " + direction);
                inputMethod.getController().off("moveCursor");
                await inputMethod.getController().detach();
                expect(direction).assertEqual(4);
                done();
              } catch (err) {
                console.info("====>SUB_Misc_inputMethod_onMoveCursor_0250 onMoveCursor fail: " + JSON.stringify(err));
                done();
              }
            });
          } catch (err) {
            console.info("====>SUB_Misc_inputMethod_onMoveCursor_0250 onMoveCursor catch err: " + JSON.stringify(err));
            done();
          }
        }
      }

      let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
        code: 250
      }
      commoneventmanager.publish('inputMethodDrawnControlTest', commonEventPublishData, publishCallback);
    });

    /*
    * @tc.number  SUB_Misc_inputMethod_offMoveCursor_0260
    * @tc.name   SUB_Misc_inputMethod_offMoveCursor_0260
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_Misc_inputMethod_offMoveCursor_0260', Level.LEVEL2, async (done: Function) => {
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }
      let flag = true;

      let publishCallback = async (err: BusinessError) => {
        await sleep(200);
        console.info("====>SUB_Misc_inputMethod_offMoveCursor_0260 publishCallback start");
        if (err) {
          console.info("====>SUB_Misc_inputMethod_offMoveCursor_0260 publishCallback failed:" + JSON.stringify(err));
        } else {
          try {
            await inputMethod.getController().attach(true, ATTRIBUTE);
            console.info("====>SUB_Misc_inputMethod_offMoveCursor_0260 offMoveCursor start");
            inputMethod.getController().on("moveCursor", async (direction) => {
              flag = false;
              console.info("====>SUB_Misc_inputMethod_offMoveCursor_0260 flag: " + flag);
            });
            inputMethod.getController().off("moveCursor");
            let t = setTimeout(async () => {
              try {
                clearTimeout(t);
                await inputMethod.getController().detach();
                if (flag) {
                  expect(true).assertEqual(true);
                  console.info("====>SUB_Misc_inputMethod_offMoveCursor_0260 offMoveCursor success");
                  done();
                } else {
                  console.info("====>SUB_Misc_inputMethod_offMoveCursor_0260 offMoveCursor fail");
                  expect().assertFail();
                }
              } catch (err) {
                console.info("====>SUB_Misc_inputMethod_offMoveCursor_0260 offMoveCursor catch err: " + JSON.stringify(err));
                done();
              }
            }, 1000)
          } catch (err) {
            console.info("====>SUB_Misc_inputMethod_offMoveCursor_0260 offMoveCursor catch err: " + JSON.stringify(err));
            done();
          }
        }
      }

      let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
        code: 260
      }
      commoneventmanager.publish('inputMethodDrawnControlTest', commonEventPublishData, publishCallback);
    });

    /*
    * @tc.number  SUB_Misc_inputMethod_on_off_insertText_Async_0100
    * @tc.name   SUB_Misc_inputMethod_on_off_insertText_Async_0100
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_Misc_inputMethod_on_off_insertText_Async_0100', Level.LEVEL2, async (done: Function) => {
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }

      let publishCallback = async (err: BusinessError) => {
        await sleep(200);
        console.info('====>SUB_Misc_inputMethod_on_off_insertText_Async_0100 publishCallback start');
        if (err) {
          console.info('====>SUB_Misc_inputMethod_on_off_insertText_Async_0100 publishCallback failed:' + JSON.stringify(err));
        } else {
          try {
            await inputMethod.getController().attach(true, ATTRIBUTE);
            console.info('====>SUB_Misc_inputMethod_on_off_insertText_Async_0100 insertText start');
            inputMethod.getController().on('insertText', async (text) => {
              try {
                console.info('====>SUB_Misc_inputMethod_on_off_insertText_Async_0100 insertText success: ' + text);
                //twice off() success
                inputMethod.getController().off('insertText');
                inputMethod.getController().off('insertText');
                await inputMethod.getController().detach();
                expect(text).assertEqual('insert');
                done();
              } catch (err) {
                console.info('====>SUB_Misc_inputMethod_on_off_insertText_Async_0100 insertText fail: ' + JSON.stringify(err));
                done();
              }
            });
          } catch (err) {
            console.info('====>SUB_Misc_inputMethod_on_off_insertText_Async_0100 insertText catch err: ' + JSON.stringify(err));
            done();
          }
        }
      }

      let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
        code: 270
      }
      commoneventmanager.publish('inputMethodDrawnControlTest', commonEventPublishData, publishCallback);
    });

    /*
    * @tc.number  SUB_Misc_inputMethod_on_off_insertText_Async_0200
    * @tc.name   SUB_Misc_inputMethod_on_off_insertText_Async_0200
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_Misc_inputMethod_on_off_insertText_Async_0200', Level.LEVEL2, async (done: Function) => {
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }

      let publishCallback = async (err: BusinessError) => {
        await sleep(200);
        console.info('====>SUB_Misc_inputMethod_on_off_insertText_Async_0200 publishCallback start');
        if (err) {
          console.info('====>SUB_Misc_inputMethod_on_off_insertText_Async_0200 publishCallback failed:' + JSON.stringify(err));
        } else {
          try {
            let count = 0;
            await inputMethod.getController().attach(true, ATTRIBUTE);
            console.info('====>SUB_Misc_inputMethod_on_off_insertText_Async_0200 insertText start');
            inputMethod.getController().on('insertText', async (text) => {
              try {
                console.info('====>SUB_Misc_inputMethod_on_off_insertText_Async_0200 insertText first: ' + count);
                count += 1;
              } catch (err) {
                console.info('====>SUB_Misc_inputMethod_on_off_insertText_Async_0200 insertText fail: ' + JSON.stringify(err));
              }
            });

            inputMethod.getController().on('insertText', async (text) => {
              try {
                console.info('====>SUB_Misc_inputMethod_on_off_insertText_Async_0200 insertText second: ' + count);
                count += 1;
              } catch (err) {
                console.info('====>SUB_Misc_inputMethod_on_off_insertText_Async_0200 insertText fail: ' + JSON.stringify(err));
              }
            });
            await sleep(850);
            if (count === 2) {
              console.info('====>SUB_Misc_inputMethod_on_off_insertText_Async_0200 insertText count all: ' + count);
              inputMethod.getController().off('insertText');
              expect(true).assertTrue();
              done();
            } else {
              console.info('====>SUB_Misc_inputMethod_on_off_insertText_Async_0200 insertText count: ' + count);
              inputMethod.getController().off('insertText');
              expect().assertFail();
              done();
            }
          } catch (err) {
            console.info('====>SUB_Misc_inputMethod_on_off_insertText_Async_0200 insertText catch err: ' + JSON.stringify(err));
            done();
          }
        }
      }

      let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
        code: 280
      }
      commoneventmanager.publish('inputMethodDrawnControlTest', commonEventPublishData, publishCallback);
    });

    /*
    * @tc.number  SUB_Misc_inputMethod_on_off_insertText_Async_0300
    * @tc.name   SUB_Misc_inputMethod_on_off_insertText_Async_0300
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_Misc_inputMethod_on_off_insertText_Async_0300', Level.LEVEL2, async (done: Function) => {
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }
      try {
        await inputMethod.getController().attach(true, ATTRIBUTE);
        console.info('====>SUB_Misc_inputMethod_on_off_insertText_Async_0300 insertText start');
        // only call twice off() success
        inputMethod.getController().off('insertText');
        inputMethod.getController().off('insertText');
        await inputMethod.getController().detach();
        expect(true).assertTrue();
        console.info('====>SUB_Misc_inputMethod_on_off_insertText_Async_0300 insertText call twice off success');
        done();
      } catch (err) {
        console.info('====>SUB_Misc_inputMethod_on_off_insertText_Async_0300 insertText catch err: ' + JSON.stringify(err));
        expect().assertFail()
        done();
      }
    });

    /*
    * @tc.number  SUB_Misc_inputMethod_on_off_deleteLeft_Async_0100
    * @tc.name   SUB_Misc_inputMethod_on_off_deleteLeft_Async_0100
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_Misc_inputMethod_on_off_deleteLeft_Async_0100', Level.LEVEL2, async (done: Function) => {
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }

      let publishCallback = async (err: BusinessError) => {
        await sleep(200);
        console.info('====>SUB_Misc_inputMethod_on_off_deleteLeft_Async_0100 publishCallback start');
        if (err) {
          console.info('====>SUB_Misc_inputMethod_on_off_deleteLeft_Async_0100 publishCallback failed:' + JSON.stringify(err));
        } else {
          try {
            await inputMethod.getController().attach(true, ATTRIBUTE);
            console.info('====>SUB_Misc_inputMethod_on_off_deleteLeft_Async_0100 deleteLeft start');
            inputMethod.getController().on('deleteLeft', async (num) => {
              try {
                console.info('====>SUB_Misc_inputMethod_on_off_deleteLeft_Async_0100 deleteLeft success: ' + num);
                //twice off() success
                inputMethod.getController().off('deleteLeft');
                inputMethod.getController().off('deleteLeft');
                await inputMethod.getController().detach();
                expect(num).assertEqual(1);
                done();
              } catch (err) {
                console.info('====>SUB_Misc_inputMethod_on_off_deleteLeft_Async_0100 deleteLeft fail: ' + JSON.stringify(err));
                done();
              }
            });
          } catch (err) {
            console.info('====>SUB_Misc_inputMethod_on_off_deleteLeft_Async_0100 deleteLeft catch err: ' + JSON.stringify(err));
            done();
          }
        }
      }

      let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
        code: 300
      }
      commoneventmanager.publish('inputMethodDrawnControlTest', commonEventPublishData, publishCallback);
    });

    /*
    * @tc.number  SUB_Misc_inputMethod_on_off_deleteLeft_Async_0200
    * @tc.name   SUB_Misc_inputMethod_on_off_deleteLeft_Async_0200
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_Misc_inputMethod_on_off_deleteLeft_Async_0200', Level.LEVEL2, async (done: Function) => {
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }

      let publishCallback = async (err: BusinessError) => {
        await sleep(200);
        console.info('====>SUB_Misc_inputMethod_on_off_deleteLeft_Async_0200 publishCallback start');
        if (err) {
          console.info('====>SUB_Misc_inputMethod_on_off_deleteLeft_Async_0200 publishCallback failed:' + JSON.stringify(err));
        } else {
          try {
            let count = 0;
            await inputMethod.getController().attach(true, ATTRIBUTE);
            console.info('====>SUB_Misc_inputMethod_on_off_deleteLeft_Async_0200 deleteLeft start');
            inputMethod.getController().on('deleteLeft', async (num) => {
              try {
                console.info('====>SUB_Misc_inputMethod_on_off_deleteLeft_Async_0200 deleteLeft first: ' + count);
                count += 1;
              } catch (err) {
                console.info('====>SUB_Misc_inputMethod_on_off_deleteLeft_Async_0200 deleteLeft fail: ' + JSON.stringify(err));
              }
            });

            inputMethod.getController().on('deleteLeft', async (num) => {
              try {
                console.info('====>SUB_Misc_inputMethod_on_off_deleteLeft_Async_0200 deleteLeft second: ' + count);
                count += 1;
              } catch (err) {
                console.info('====>SUB_Misc_inputMethod_on_off_deleteLeft_Async_0200 deleteLeft fail: ' + JSON.stringify(err));
              }
            });
            await sleep(850);
            if (count === 2) {
              console.info('====>SUB_Misc_inputMethod_on_off_deleteLeft_Async_0200 deleteLeft count all: ' + count);
              inputMethod.getController().off('deleteLeft');
              expect(true).assertTrue();
              done();
            } else {
              console.info('====>SUB_Misc_inputMethod_on_off_deleteLeft_Async_0200 deleteLeft count: ' + count);
              inputMethod.getController().off('deleteLeft');
              expect().assertFail();
              done();
            }
          } catch (err) {
            console.info('====>SUB_Misc_inputMethod_on_off_deleteLeft_Async_0200 deleteLeft catch err: ' + JSON.stringify(err));
            done();
          }
        }
      }

      let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
        code: 310
      }
      commoneventmanager.publish('inputMethodDrawnControlTest', commonEventPublishData, publishCallback);
    });

    /*
    * @tc.number  SUB_Misc_inputMethod_on_off_deleteLeft_Async_0300
    * @tc.name   SUB_Misc_inputMethod_on_off_deleteLeft_Async_0300
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_Misc_inputMethod_on_off_deleteLeft_Async_0300', Level.LEVEL2, async (done: Function) => {
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }
      try {
        await inputMethod.getController().attach(true, ATTRIBUTE);
        console.info('====>SUB_Misc_inputMethod_on_off_deleteLeft_Async_0300 deleteLeft start');
        // only call twice off() success
        inputMethod.getController().off('deleteLeft');
        inputMethod.getController().off('deleteLeft');
        await inputMethod.getController().detach();
        expect(true).assertTrue();
        console.info('====>SUB_Misc_inputMethod_on_off_deleteLeft_Async_0300 deleteLeft call twice off success');
        done();
      } catch (err) {
        console.info('====>SUB_Misc_inputMethod_on_off_deleteLeft_Async_0300 deleteLeft catch err: ' + JSON.stringify(err));
        expect().assertFail()
        done();
      }
    });

    /*
    * @tc.number  SUB_Misc_inputMethod_on_off_deleteRight_Async_0100
    * @tc.name   SUB_Misc_inputMethod_on_off_deleteRight_Async_0100
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_Misc_inputMethod_on_off_deleteRight_Async_0100', Level.LEVEL2, async (done: Function) => {
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }

      let publishCallback = async (err: BusinessError) => {
        await sleep(200);
        console.info('====>SUB_Misc_inputMethod_on_off_deleteRight_Async_0100 publishCallback start');
        if (err) {
          console.info('====>SUB_Misc_inputMethod_on_off_deleteRight_Async_0100 publishCallback failed:' + JSON.stringify(err));
        } else {
          try {
            await inputMethod.getController().attach(true, ATTRIBUTE);
            console.info('====>SUB_Misc_inputMethod_on_off_deleteRight_Async_0100 deleteRight start');
            inputMethod.getController().on('deleteRight', async (num) => {
              try {
                console.info('====>SUB_Misc_inputMethod_on_off_deleteRight_Async_0100 deleteRight success: ' + num);
                //twice off() success
                inputMethod.getController().off('deleteRight');
                inputMethod.getController().off('deleteRight');
                await inputMethod.getController().detach();
                expect(num).assertEqual(1);
                done();
              } catch (err) {
                console.info('====>SUB_Misc_inputMethod_on_off_deleteRight_Async_0100 deleteRight fail: ' + JSON.stringify(err));
                done();
              }
            });
          } catch (err) {
            console.info('====>SUB_Misc_inputMethod_on_off_deleteRight_Async_0100 deleteRight catch err: ' + JSON.stringify(err));
            done();
          }
        }
      }

      let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
        code: 330
      }
      commoneventmanager.publish('inputMethodDrawnControlTest', commonEventPublishData, publishCallback);
    });

    /*
    * @tc.number  SUB_Misc_inputMethod_on_off_deleteRight_Async_0200
    * @tc.name   SUB_Misc_inputMethod_on_off_deleteRight_Async_0200
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_Misc_inputMethod_on_off_deleteRight_Async_0200', Level.LEVEL2, async (done: Function) => {
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }

      let publishCallback = async (err: BusinessError) => {
        await sleep(200);
        console.info('====>SUB_Misc_inputMethod_on_off_deleteRight_Async_0200 publishCallback start');
        if (err) {
          console.info('====>SUB_Misc_inputMethod_on_off_deleteRight_Async_0200 publishCallback failed:' + JSON.stringify(err));
        } else {
          try {
            let count = 0;
            await inputMethod.getController().attach(true, ATTRIBUTE);
            console.info('====>SUB_Misc_inputMethod_on_off_deleteRight_Async_0200 deleteRight start');
            inputMethod.getController().on('deleteRight', async (text) => {
              try {
                console.info('====>SUB_Misc_inputMethod_on_off_deleteRight_Async_0200 deleteRight first: ' + count);
                count += 1;
              } catch (err) {
                console.info('====>SUB_Misc_inputMethod_on_off_deleteRight_Async_0200 deleteRight fail: ' + JSON.stringify(err));
              }
            });

            inputMethod.getController().on('deleteRight', async (text) => {
              try {
                console.info('====>SUB_Misc_inputMethod_on_off_deleteRight_Async_0200 deleteRight second: ' + count);
                count += 1;
              } catch (err) {
                console.info('====>SUB_Misc_inputMethod_on_off_deleteRight_Async_0200 deleteRight fail: ' + JSON.stringify(err));
              }
            });
            await sleep(850);
            if (count === 2) {
              console.info('====>SUB_Misc_inputMethod_on_off_deleteRight_Async_0200 deleteRight count all: ' + count);
              inputMethod.getController().off('deleteRight');
              expect(true).assertTrue();
              done();
            } else {
              console.info('====>SUB_Misc_inputMethod_on_off_deleteRight_Async_0200 deleteRight count: ' + count);
              inputMethod.getController().off('deleteRight');
              expect().assertFail();
              done();
            }
          } catch (err) {
            console.info('====>SUB_Misc_inputMethod_on_off_deleteRight_Async_0200 deleteRight catch err: ' + JSON.stringify(err));
            done();
          }
        }
      }

      let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
        code: 340
      }
      commoneventmanager.publish('inputMethodDrawnControlTest', commonEventPublishData, publishCallback);
    });

    /*
    * @tc.number  SUB_Misc_inputMethod_on_off_deleteRight_Async_0300
    * @tc.name   SUB_Misc_inputMethod_on_off_deleteRight_Async_0300
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_Misc_inputMethod_on_off_deleteRight_Async_0300', Level.LEVEL2, async (done: Function) => {
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }
      try {
        await inputMethod.getController().attach(true, ATTRIBUTE);
        console.info('====>SUB_Misc_inputMethod_on_off_deleteRight_Async_0300 deleteRight start');
        // only call twice off() success
        inputMethod.getController().off('deleteRight');
        inputMethod.getController().off('deleteRight');
        await inputMethod.getController().detach();
        expect(true).assertTrue();
        console.info('====>SUB_Misc_inputMethod_on_off_deleteRight_Async_0300 deleteRight call twice off success');
        done();
      } catch (err) {
        console.info('====>SUB_Misc_inputMethod_on_off_deleteRight_Async_0300 deleteRight catch err: ' + JSON.stringify(err));
        expect().assertFail()
        done();
      }
    });

    /*
    * @tc.number  SUB_Misc_inputMethod_on_off_sendKeyboardStatus_Async_0100
    * @tc.name   SUB_Misc_inputMethod_on_off_sendKeyboardStatus_Async_0100
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_Misc_inputMethod_on_off_sendKeyboardStatus_Async_0100', Level.LEVEL2, async (done: Function) => {
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }
      try {
        await inputMethod.getController().attach(true, ATTRIBUTE);
        console.info('====>SUB_Misc_inputMethod_on_off_sendKeyboardStatus_Async_0100 keyBoardStatus start');
        let t = setTimeout( async () => {
          clearTimeout(t);
          inputMethod.getController().on('sendKeyboardStatus', async (keyBoardStatus) => {
            try {
              console.info('====>SUB_Misc_inputMethod_on_off_sendKeyboardStatus_Async_0100 keyBoardStatus success: ' + keyBoardStatus);
              //twice off() success
              inputMethod.getController().off('sendKeyboardStatus');
              inputMethod.getController().off('sendKeyboardStatus');
              await inputMethod.getController().detach();
              expect(keyBoardStatus).assertEqual(1);
              done();
            } catch (err) {
              console.info('====>SUB_Misc_inputMethod_on_off_sendKeyboardStatus_Async_0100 sendKeyboardStatus fail: ' + JSON.stringify(err));
              done();
            }
          });
          await inputMethod.getController().hideSoftKeyboard();
        }, 500);
      } catch (err) {
        console.info('====>SUB_Misc_inputMethod_on_off_sendKeyboardStatus_Async_0100 sendKeyboardStatus catch err: ' + JSON.stringify(err));
        done();
      }
    });

    /*
    * @tc.number  SUB_Misc_inputMethod_on_off_sendKeyboardStatus_Async_0200
    * @tc.name   SUB_Misc_inputMethod_on_off_sendKeyboardStatus_Async_0200
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_Misc_inputMethod_on_off_sendKeyboardStatus_Async_0200', Level.LEVEL2, async (done: Function) => {
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }
      try {
        let count = 0;
        await inputMethod.getController().attach(true, ATTRIBUTE);
        console.info('====>SUB_Misc_inputMethod_on_off_sendKeyboardStatus_Async_0200 sendKeyboardStatus start');
        let t = setTimeout(async () => {
          clearTimeout(t);
          inputMethod.getController().on('sendKeyboardStatus', async (keyBoardStatus) => {
            try {
              console.info('====>SUB_Misc_inputMethod_on_off_sendKeyboardStatus_Async_0200 sendKeyboardStatus first: ' + count);
              count += 1;
            } catch (err) {
              console.info('====>SUB_Misc_inputMethod_on_off_sendKeyboardStatus_Async_0200 sendKeyboardStatus fail: ' + JSON.stringify(err));
            }
          });

          inputMethod.getController().on('sendKeyboardStatus', async (keyBoardStatus) => {
            try {
              console.info('====>SUB_Misc_inputMethod_on_off_sendKeyboardStatus_Async_0200 sendKeyboardStatus second: ' + count);
              count += 1;
            } catch (err) {
              console.info('====>SUB_Misc_inputMethod_on_off_sendKeyboardStatus_Async_0200 sendKeyboardStatus fail: ' + JSON.stringify(err));
            }
          });
          await inputMethod.getController().showSoftKeyboard();
          await sleep(850);
          if (count === 2) {
            console.info('====>SUB_Misc_inputMethod_on_off_sendKeyboardStatus_Async_0200 sendKeyboardStatus count all: ' + count);
            inputMethod.getController().off('sendKeyboardStatus');
            expect(true).assertTrue();
            done();
          } else {
            console.info('====>SUB_Misc_inputMethod_on_off_sendKeyboardStatus_Async_0200 sendKeyboardStatus count: ' + count);
            inputMethod.getController().off('sendKeyboardStatus');
            expect().assertFail();
            done();
          }
        }, 500);
      } catch (err) {
        console.info('====>SUB_Misc_inputMethod_on_off_sendKeyboardStatus_Async_0200 sendKeyboardStatus catch err: ' + JSON.stringify(err));
        done();
      }
    });

    /*
    * @tc.number  SUB_Misc_inputMethod_on_off_sendKeyboardStatus_Async_0300
    * @tc.name   SUB_Misc_inputMethod_on_off_sendKeyboardStatus_Async_0300
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_Misc_inputMethod_on_off_sendKeyboardStatus_Async_0300', Level.LEVEL2, async (done: Function) => {
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }
      try {
        await inputMethod.getController().attach(true, ATTRIBUTE);
        console.info('====>SUB_Misc_inputMethod_on_off_sendKeyboardStatus_Async_0300 sendKeyboardStatus start');
        // only call twice off() success
        inputMethod.getController().off('sendKeyboardStatus');
        inputMethod.getController().off('sendKeyboardStatus');
        await inputMethod.getController().detach();
        expect(true).assertTrue();
        console.info('====>SUB_Misc_inputMethod_on_off_sendKeyboardStatus_Async_0300 sendKeyboardStatus call twice off success');
        done();
      } catch (err) {
        console.info('====>SUB_Misc_inputMethod_on_off_sendKeyboardStatus_Async_0300 sendKeyboardStatus catch err: ' + JSON.stringify(err));
        expect().assertFail()
        done();
      }
    });

    /*
    * @tc.number  SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0100
    * @tc.name   SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0100
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0100', Level.LEVEL2, async (done: Function) => {
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }

      let publishCallback = async (err: BusinessError) => {
        await sleep(200);
        console.info('====>SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0100 publishCallback start');
        if (err) {
          console.info('====>SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0100 publishCallback failed:' + JSON.stringify(err));
        } else {
          try {
            await inputMethod.getController().attach(true, ATTRIBUTE);
            console.info('====>SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0100 sendFunctionKey start');
            inputMethod.getController().on('sendFunctionKey', async (action) => {
              try {
                console.info('====>SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0100 sendFunctionKey success: ' + action.enterKeyType);
                //twice off() success
                inputMethod.getController().off('sendFunctionKey');
                inputMethod.getController().off('sendFunctionKey');
                await inputMethod.getController().detach();
                expect(action.enterKeyType).assertEqual(0);
                done();
              } catch (err) {
                console.info('====>SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0100 sendFunctionKey fail: ' + JSON.stringify(err));
                done();
              }
            });
          } catch (err) {
            console.info('====>SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0100 sendFunctionKey catch err: ' + JSON.stringify(err));
            done();
          }
        }
      }

      let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
        code: 360
      }
      commoneventmanager.publish('inputMethodDrawnControlTest', commonEventPublishData, publishCallback);
    });

    /*
    * @tc.number  SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0200
    * @tc.name   SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0200
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0200', Level.LEVEL2, async (done: Function) => {
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }

      let publishCallback = async (err: BusinessError) => {
        await sleep(200);
        console.info('====>SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0200 publishCallback start');
        if (err) {
          console.info('====>SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0200 publishCallback failed:' + JSON.stringify(err));
        } else {
          try {
            let count = 0;
            await inputMethod.getController().attach(true, ATTRIBUTE);
            console.info('====>SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0200 sendFunctionKey start');
            inputMethod.getController().on('sendFunctionKey', async (action) => {
              try {
                console.info('====>SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0200 sendFunctionKey first: ' + count);
                count += 1;
              } catch (err) {
                console.info('====>SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0200 sendFunctionKey fail: ' + JSON.stringify(err));
              }
            });

            inputMethod.getController().on('sendFunctionKey', async (action) => {
              try {
                console.info('====>SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0200 sendFunctionKey second: ' + count);
                count += 1;
              } catch (err) {
                console.info('====>SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0200 sendFunctionKey fail: ' + JSON.stringify(err));
              }
            });
            await sleep(850);
            if (count === 2) {
              console.info('====>SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0200 sendFunctionKey count all: ' + count);
              inputMethod.getController().off('sendFunctionKey');
              expect(true).assertTrue();
              done();
            } else {
              console.info('====>SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0200 sendFunctionKey count: ' + count);
              inputMethod.getController().off('sendFunctionKey');
              expect().assertFail();
              done();
            }
          } catch (err) {
            console.info('====>SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0200 sendFunctionKey catch err: ' + JSON.stringify(err));
            done();
          }
        }
      }

      let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
        code: 370
      }
      commoneventmanager.publish('inputMethodDrawnControlTest', commonEventPublishData, publishCallback);
    });

    /*
    * @tc.number  SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0300
    * @tc.name   SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0300
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0300', Level.LEVEL2, async (done: Function) => {
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }
      try {
        await inputMethod.getController().attach(true, ATTRIBUTE);
        console.info('====>SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0300 sendFunctionKey start');
        // only call twice off() success
        inputMethod.getController().off('sendFunctionKey');
        inputMethod.getController().off('sendFunctionKey');
        await inputMethod.getController().detach();
        expect(true).assertTrue();
        console.info('====>SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0300 sendFunctionKey call twice off success');
        done();
      } catch (err) {
        console.info('====>SUB_Misc_inputMethod_on_off_sendFunctionKey_Async_0300 sendFunctionKey catch err: ' + JSON.stringify(err));
        expect().assertFail()
        done();
      }
    });

    /*
    * @tc.number  SUB_Misc_inputMethod_on_off_moveCursor_Async_0100
    * @tc.name   SUB_Misc_inputMethod_on_off_moveCursor_Async_0100
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_Misc_inputMethod_on_off_moveCursor_Async_0100', Level.LEVEL2, async (done: Function) => {
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }

      let publishCallback = async (err: BusinessError) => {
        await sleep(200);
        console.info('====>SUB_Misc_inputMethod_on_off_moveCursor_Async_0100 publishCallback start');
        if (err) {
          console.info('====>SUB_Misc_inputMethod_on_off_moveCursor_Async_0100 publishCallback failed:' + JSON.stringify(err));
        } else {
          try {
            await inputMethod.getController().attach(true, ATTRIBUTE);
            console.info('====>SUB_Misc_inputMethod_on_off_moveCursor_Async_0100 moveCursor start');
            inputMethod.getController().on('moveCursor', async (num) => {
              try {
                console.info('====>SUB_Misc_inputMethod_on_off_moveCursor_Async_0100 moveCursor success: ' + num);
                //twice off() success
                inputMethod.getController().off('moveCursor');
                inputMethod.getController().off('moveCursor');
                await inputMethod.getController().detach();
                expect(num).assertEqual(4);
                done();
              } catch (err) {
                console.info('====>SUB_Misc_inputMethod_on_off_moveCursor_Async_0100 moveCursor fail: ' + JSON.stringify(err));
                done();
              }
            });
          } catch (err) {
            console.info('====>SUB_Misc_inputMethod_on_off_moveCursor_Async_0100 moveCursor catch err: ' + JSON.stringify(err));
            done();
          }
        }
      }

      let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
        code: 390
      }
      commoneventmanager.publish('inputMethodDrawnControlTest', commonEventPublishData, publishCallback);
    });

    /*
    * @tc.number  SUB_Misc_inputMethod_on_off_moveCursor_Async_0200
    * @tc.name   SUB_Misc_inputMethod_on_off_moveCursor_Async_0200
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_Misc_inputMethod_on_off_moveCursor_Async_0200', Level.LEVEL2, async (done: Function) => {
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }

      let publishCallback = async (err: BusinessError) => {
        await sleep(200);
        console.info('====>SUB_Misc_inputMethod_on_off_moveCursor_Async_0200 publishCallback start');
        if (err) {
          console.info('====>SUB_Misc_inputMethod_on_off_moveCursor_Async_0200 publishCallback failed:' + JSON.stringify(err));
        } else {
          try {
            let count = 0;
            await inputMethod.getController().attach(true, ATTRIBUTE);
            console.info('====>SUB_Misc_inputMethod_on_off_moveCursor_Async_0200 moveCursor start');
            inputMethod.getController().on('moveCursor', async (num) => {
              try {
                console.info('====>SUB_Misc_inputMethod_on_off_moveCursor_Async_0200 moveCursor first: ' + count);
                count += 1;
              } catch (err) {
                console.info('====>SUB_Misc_inputMethod_on_off_moveCursor_Async_0200 moveCursor fail: ' + JSON.stringify(err));
              }
            });

            inputMethod.getController().on('moveCursor', async (num) => {
              try {
                console.info('====>SUB_Misc_inputMethod_on_off_moveCursor_Async_0200 moveCursor second: ' + count);
                count += 1;
              } catch (err) {
                console.info('====>SUB_Misc_inputMethod_on_off_moveCursor_Async_0200 moveCursor fail: ' + JSON.stringify(err));
              }
            });
            await sleep(850);
            if (count === 2) {
              console.info('====>SUB_Misc_inputMethod_on_off_moveCursor_Async_0200 moveCursor count all: ' + count);
              inputMethod.getController().off('moveCursor');
              expect(true).assertTrue();
              done();
            } else {
              console.info('====>SUB_Misc_inputMethod_on_off_moveCursor_Async_0200 moveCursor count: ' + count);
              inputMethod.getController().off('moveCursor');
              expect().assertFail();
              done();
            }
          } catch (err) {
            console.info('====>SUB_Misc_inputMethod_on_off_moveCursor_Async_0200 moveCursor catch err: ' + JSON.stringify(err));
            done();
          }
        }
      }

      let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
        code: 400
      }
      commoneventmanager.publish('inputMethodDrawnControlTest', commonEventPublishData, publishCallback);
    });

    /*
    * @tc.number  SUB_Misc_inputMethod_on_off_moveCursor_Async_0300
    * @tc.name   SUB_Misc_inputMethod_on_off_moveCursor_Async_0300
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_Misc_inputMethod_on_off_moveCursor_Async_0300', Level.LEVEL2, async (done: Function) => {
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }
      try {
        await inputMethod.getController().attach(true, ATTRIBUTE);
        console.info('====>SUB_Misc_inputMethod_on_off_moveCursor_Async_0300 moveCursor start');
        // only call twice off() success
        inputMethod.getController().off('moveCursor');
        inputMethod.getController().off('moveCursor');
        await inputMethod.getController().detach();
        expect(true).assertTrue();
        console.info('====>SUB_Misc_inputMethod_on_off_moveCursor_Async_0300 moveCursor call twice off success');
        done();
      } catch (err) {
        console.info('====>SUB_Misc_inputMethod_on_off_moveCursor_Async_0300 moveCursor catch err: ' + JSON.stringify(err));
        expect().assertFail()
        done();
      }
    });

    /*
    * @tc.number  SUB_Misc_inputMethod_on_off_handleExtendAction_Async_0100
    * @tc.name   SUB_Misc_inputMethod_on_off_handleExtendAction_Async_0100
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_Misc_inputMethod_on_off_handleExtendAction_Async_0100', Level.LEVEL2, async (done: Function) => {
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }

      let publishCallback = async (err: BusinessError) => {
        await sleep(200);
        console.info('====>SUB_Misc_inputMethod_on_off_handleExtendAction_Async_0100 publishCallback start');
        if (err) {
          console.info('====>SUB_Misc_inputMethod_on_off_handleExtendAction_Async_0100 publishCallback failed:' + JSON.stringify(err));
        } else {
          try {
            await inputMethod.getController().attach(true, ATTRIBUTE);
            console.info('====>SUB_Misc_inputMethod_on_off_handleExtendAction_Async_0100 handleExtendAction start');
            inputMethod.getController().on('handleExtendAction', async (action) => {
              try {
                console.info('====>SUB_Misc_inputMethod_on_off_handleExtendAction_Async_0100 handleExtendAction success: ' + action);
                //twice off() success
                inputMethod.getController().off('handleExtendAction');
                inputMethod.getController().off('handleExtendAction');
                await inputMethod.getController().detach();
                expect(action).assertEqual(0);
                done();
              } catch (err) {
                console.info('====>SUB_Misc_inputMethod_on_off_handleExtendAction_Async_0100 handleExtendAction fail: ' + JSON.stringify(err));
                done();
              }
            });
          } catch (err) {
            console.info('====>SUB_Misc_inputMethod_on_off_handleExtendAction_Async_0100 handleExtendAction catch err: ' + JSON.stringify(err));
            done();
          }
        }
      }

      let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
        code: 420
      }
      commoneventmanager.publish('inputMethodDrawnControlTest', commonEventPublishData, publishCallback);
    });

    /*
    * @tc.number  SUB_Misc_inputMethod_on_off_handleExtendAction_Async_0200
    * @tc.name   SUB_Misc_inputMethod_on_off_handleExtendAction_Async_0200
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_Misc_inputMethod_on_off_handleExtendAction_Async_0200', Level.LEVEL2, async (done: Function) => {
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }

      let publishCallback = async (err: BusinessError) => {
        await sleep(200);
        console.info('====>SUB_Misc_inputMethod_on_off_handleExtendAction_Async_0200 publishCallback start');
        if (err) {
          console.info('====>SUB_Misc_inputMethod_on_off_handleExtendAction_Async_0200 publishCallback failed:' + JSON.stringify(err));
        } else {
          try {
            let count = 0;
            await inputMethod.getController().attach(true, ATTRIBUTE);
            console.info('====>SUB_Misc_inputMethod_on_off_handleExtendAction_Async_0200 handleExtendAction start');
            inputMethod.getController().on('handleExtendAction', async (action) => {
              try {
                console.info('====>SUB_Misc_inputMethod_on_off_handleExtendAction_Async_0200 handleExtendAction first: ' + count);
                count += 1;
              } catch (err) {
                console.info('====>SUB_Misc_inputMethod_on_off_handleExtendAction_Async_0200 handleExtendAction fail: ' + JSON.stringify(err));
              }
            });

            inputMethod.getController().on('handleExtendAction', async (action) => {
              try {
                console.info('====>SUB_Misc_inputMethod_on_off_handleExtendAction_Async_0200 handleExtendAction second: ' + count);
                count += 1;
              } catch (err) {
                console.info('====>SUB_Misc_inputMethod_on_off_handleExtendAction_Async_0200 handleExtendAction fail: ' + JSON.stringify(err));
              }
            });
            await sleep(850);
            if (count === 2) {
              console.info('====>SUB_Misc_inputMethod_on_off_handleExtendAction_Async_0200 handleExtendAction count all: ' + count);
              inputMethod.getController().off('handleExtendAction');
              expect(true).assertTrue();
              done();
            } else {
              console.info('====>SUB_Misc_inputMethod_on_off_handleExtendAction_Async_0200 handleExtendAction count: ' + count);
              inputMethod.getController().off('handleExtendAction');
              expect().assertFail();
              done();
            }
          } catch (err) {
            console.info('====>SUB_Misc_inputMethod_on_off_handleExtendAction_Async_0200 handleExtendAction catch err: ' + JSON.stringify(err));
            done();
          }
        }
      }

      let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
        code: 430
      }
      commoneventmanager.publish('inputMethodDrawnControlTest', commonEventPublishData, publishCallback);
    });

    /*
    * @tc.number  SUB_Misc_inputMethod_on_off_handleExtendAction_Async_0300
    * @tc.name   SUB_Misc_inputMethod_on_off_handleExtendAction_Async_0300
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_Misc_inputMethod_on_off_handleExtendAction_Async_0300', Level.LEVEL2, async (done: Function) => {
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }
      try {
        await inputMethod.getController().attach(true, ATTRIBUTE);
        console.info('====>SUB_Misc_inputMethod_on_off_handleExtendAction_Async_0300 handleExtendAction start');
        // only call twice off() success
        inputMethod.getController().off('handleExtendAction');
        inputMethod.getController().off('handleExtendAction');
        await inputMethod.getController().detach();
        expect(true).assertTrue();
        console.info('====>SUB_Misc_inputMethod_on_off_handleExtendAction_Async_0300 handleExtendAction call twice off success');
        done();
      } catch (err) {
        console.info('====>SUB_Misc_inputMethod_on_off_handleExtendAction_Async_0300 handleExtendAction catch err: ' + JSON.stringify(err));
        expect().assertFail()
        done();
      }
    });

    /*
    * @tc.number  SUB_Misc_inputMethod_updateAttribute_Async_0600
    * @tc.name   SUB_Misc_inputMethod_updateAttribute_Async_0600
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_Misc_inputMethod_updateAttribute_Async_0600', Level.LEVEL2, async (done: Function) => {
      let inputAttribute: ESObject = {
        textInputType: 0, enterKeyType: 0
      }
      try {
        inputMethod.getController().updateAttribute(inputAttribute, err => {
          try {
            if (err) {
              console.info('====>SUB_Misc_inputMethod_updateAttribute_Async_0600 fail:' + JSON.stringify(err));
              expect(err.code).assertEqual(12800009);
              done();
            } else {
              console.info('====>SUB_Misc_inputMethod_updateAttribute_Async_0600 updateAttribute into');
              expect().assertFail();
              done();
            }
          } catch (err) {
            console.info('====>SUB_Misc_inputMethod_updateAttribute_Async_0600 fail: ' + JSON.stringify(err));
            done();
          }
        });
      } catch (err) {
        console.info('====>SUB_Misc_inputMethod_updateAttribute_Async_0600 err:' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /*
    * @tc.number  SUB_inputMethod_IMF_InputMethodSettings_1000
    * @tc.name   SUB_inputMethod_IMF_InputMethodSettings_1000
    * @tc.desc    Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_inputMethod_IMF_InputMethodSettings_1000', Level.LEVEL2, async (done: Function) => {
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }

      let publishCallback = async (err: BusinessError) => {
        await sleep(200);
        console.info("====>SUB_inputMethod_IMF_InputMethodSettings_1000 publishCallback start");
        if (err) {
          console.info("====>SUB_inputMethod_IMF_InputMethodSettings_1000 publishCallback failed:" + JSON.stringify(err));
        } else {
          try {
            await inputMethod.getController().attach(true, ATTRIBUTE);
            console.info("====>SUB_inputMethod_IMF_InputMethodSettings_1000 onDeleteLeft start");
            inputMethod.getController().on("deleteLeft", async (num) => {
              try {
                console.info("====>SUB_inputMethod_IMF_InputMethodSettings_1000 onDeleteLeft success: " + num);
                inputMethod.getController().off("deleteLeft");
                await inputMethod.getController().detach();
                expect(num).assertEqual(1);
                done();
              } catch (err) {
                console.info("====>SUB_inputMethod_IMF_InputMethodSettings_1000 onDeleteLeft fail: " + JSON.stringify(err));
                done();
              }
            });
          } catch (err) {
            console.info("====>SUB_inputMethod_IMF_InputMethodSettings_1000 onDeleteLeft catch err: " + JSON.stringify(err));
          }
        }
      }

      let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
        code: 450
      }
      commoneventmanager.publish('inputMethodDrawnControlTest', commonEventPublishData, publishCallback);
    });

    /*
    * @tc.number  Sub_Misc_inputMethodEngine_Direction_0100
    * @tc.name   Sub_Misc_inputMethodEngine_Direction_0100
    * @tc.desc    Function test
    * @tc.size    MEDIUMTEST
    * @tc.type    Function
    * @tc.level   2
    */
    it('Sub_Misc_inputMethodEngine_Direction_0100', Level.LEVEL2, async (done: Function) => {
      let cursor_up = inputmethodengine.Direction.CURSOR_UP;
      console.info("====>Sub_Misc_inputMethodEngine_Direction_0100 cursor_up:" + cursor_up);
      expect(cursor_up).assertEqual(1);
      let cursor_down = inputmethodengine.Direction.CURSOR_DOWN;
      console.info("====>Sub_Misc_inputMethodEngine_Direction_0100 cursor_down:" + cursor_down);
      expect(cursor_down).assertEqual(2);
      let cursor_left = inputmethodengine.Direction.CURSOR_LEFT;
      console.info("====>Sub_Misc_inputMethodEngine_Direction_0100 cursor_left:" + cursor_left);
      expect(cursor_left).assertEqual(3);
      let cursor_right = inputmethodengine.Direction.CURSOR_RIGHT;
      console.info("====>Sub_Misc_inputMethodEngine_Direction_0100 cursor_right:" + cursor_right);
      expect(cursor_right).assertEqual(4);
      done();
    });

    /*
    * @tc.number  Sub_Misc_inputMethodEngine_panelInfo_0100
    * @tc.name   Sub_Misc_inputMethodEngine_panelInfo_0100
    * @tc.desc    Function test
    * @tc.size    MEDIUMTEST
    * @tc.type    Function
    * @tc.level   2
    */
    it('Sub_Misc_inputMethodEngine_panelInfo_0100', Level.LEVEL2, async (done: Function) => {
      let FLG_FLOATING = inputmethodengine.PanelFlag.FLG_FLOATING
      console.info('====>Sub_Misc_inputMethodEngine_panelInfo_0100 FLG_FLOATING: ' + FLG_FLOATING);
      expect(FLG_FLOATING === 1).assertTrue();
      let FLG_FIXED = inputmethodengine.PanelFlag.FLG_FIXED
      console.info('====>Sub_Misc_inputMethodEngine_panelInfo_0100 FLG_FIXED: ' + FLG_FIXED);
      expect(FLG_FIXED === 0).assertTrue();
      let FLAG_CANDIDATE = inputmethodengine.PanelFlag.FLAG_CANDIDATE
      console.info('====>Sub_Misc_inputMethodEngine_panelInfo_0100 FLAG_CANDIDATE: ' + FLAG_CANDIDATE);
      expect(FLAG_CANDIDATE === 2).assertTrue();
      let SOFT_KEYBOARD = inputmethodengine.PanelType.SOFT_KEYBOARD
      console.info('====>Sub_Misc_inputMethodEngine_panelInfo_0100 SOFT_KEYBOARD: ' + SOFT_KEYBOARD);
      expect(SOFT_KEYBOARD === 0).assertTrue();
      let STATUS_BAR = inputmethodengine.PanelType.STATUS_BAR
      console.info('====>Sub_Misc_inputMethodEngine_panelInfo_0100 STATUS_BAR: ' + STATUS_BAR);
      expect(STATUS_BAR === 1).assertTrue();
      done();
    });

    /*
     * @tc.number  inputmethod_test_switchInputMethod_0010
     * @tc.name    inputmethod_test_switchInputMethod_0010.
     * @tc.desc    401 Function test
     * @tc.type    Function
     * @tc.level   2
    */
    it('inputmethod_test_switchInputMethod_0010', Level.LEVEL2, async (done: Function) => {
      try{
        inputMethod.switchInputMethod(undefined).then(data => {
          console.info("====>inputmethod_test_switchInputMethod_0010 success")
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.info(`====>inputmethod_test_switchInputMethod_001 err:  ${JSON.stringify(err)}`)
          expect(err.code).assertEqual(401);
          done();
        });
      }catch(err){
        console.info(`====>inputmethod_test_switchInputMethod_001 catch err:  ${JSON.stringify(err)}`)
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /*
     * @tc.number  inputmethod_test_switchInputMethod_0020
     * @tc.name    inputmethod_test_switchInputMethod_0020.
     * @tc.desc    401 Function test
     * @tc.type    Function
     * @tc.level   2
    */
    it('inputmethod_test_switchInputMethod_0020', Level.LEVEL2, async (done: Function) => {
      try{
        inputMethod.switchInputMethod(undefined, (err, data) => {
          if (err) {
            console.info("====>inputmethod_test_switchInputMethod_0020 error:" + err);
            expect(err.code).assertEqual(401);
            done();
          }
          console.info("====>inputmethod_test_switchInputMethod_0020 success")
          expect().assertFail();
          done();
        });
      }catch(err){
        console.info(`====>inputmethod_test_switchInputMethod_0020 catch err:  ${JSON.stringify(err)}`)
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /*
     * @tc.number  inputmethod_test_switchCurrentInputMethodSubtype_0010
     * @tc.name    inputmethod_test_switchCurrentInputMethodSubtype_0010.
     * @tc.desc    401 Function test
     * @tc.type    Function
     * @tc.level   2
    */
    it('inputmethod_test_switchCurrentInputMethodSubtype_0010', Level.LEVEL2, async (done: Function) => {
      try{
        inputMethod.switchCurrentInputMethodSubtype(undefined).then(data => {
          console.info("====>inputmethod_test_switchCurrentInputMethodSubtype_0010 success")
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.info(`====>inputmethod_test_switchCurrentInputMethodSubtype_0010 err:  ${JSON.stringify(err)}`)
          expect(err.code).assertEqual(401);
          done();
        });
      }catch(err){
        console.info(`====>inputmethod_test_switchCurrentInputMethodSubtype_0010 catch err:  ${JSON.stringify(err)}`)
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /*
     * @tc.number  inputmethod_test_switchCurrentInputMethodSubtype_0020
     * @tc.name    inputmethod_test_switchCurrentInputMethodSubtype_0020.
     * @tc.desc    401 Function test
     * @tc.type    Function
     * @tc.level   2
    */
    it('inputmethod_test_switchCurrentInputMethodSubtype_0020', Level.LEVEL2, async (done: Function) => {
      try{
        inputMethod.switchCurrentInputMethodSubtype(undefined, (err, data) => {
          if (err) {
            console.info("====>inputmethod_test_switchCurrentInputMethodSubtype_0020 error:" + err);
            expect(err.code).assertEqual(401);
            done();
          }
          console.info("====>inputmethod_test_switchCurrentInputMethodSubtype_0020 success")
          expect().assertFail();
          done();
        });
      }catch(err){
        console.info(`====>inputmethod_test_switchCurrentInputMethodSubtype_0020 catch err:  ${JSON.stringify(err)}`)
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /*
     * @tc.number  inputmethod_test_switchCurrentInputMethodAndSubtype_0010
     * @tc.name    inputmethod_test_switchCurrentInputMethodAndSubtype_0010.
     * @tc.desc    401 Function test
     * @tc.type    Function
     * @tc.level   2
    */
    it('inputmethod_test_switchCurrentInputMethodAndSubtype_0010', Level.LEVEL2, async (done: Function) => {
      try{
        inputMethod.switchCurrentInputMethodAndSubtype(undefined,undefined).then(data => {
          console.info("====>inputmethod_test_switchCurrentInputMethodAndSubtype_0010 success")
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.info(`====>inputmethod_test_switchCurrentInputMethodAndSubtype_0010 err:  ${JSON.stringify(err)}`)
          expect(err.code).assertEqual(401);
          done();
        });
      }catch(err){
        console.info(`====>inputmethod_test_switchCurrentInputMethodAndSubtype_0010 catch err:  ${JSON.stringify(err)}`)
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /*
     * @tc.number  inputmethod_test_switchCurrentInputMethodAndSubtype_0020
     * @tc.name    inputmethod_test_switchCurrentInputMethodAndSubtype_0020.
     * @tc.desc    401 Function test
     * @tc.type    Function
     * @tc.level   2
    */
    it('inputmethod_test_switchCurrentInputMethodAndSubtype_0020', Level.LEVEL2, async (done: Function) => {
      try{
        inputMethod.switchCurrentInputMethodAndSubtype(undefined, undefined,(err, data) => {
          if (err) {
            console.info("====>inputmethod_test_switchCurrentInputMethodAndSubtype_0020 error:" + err);
            expect(err.code).assertEqual(401);
            done();
          }
          console.info("====>inputmethod_test_switchCurrentInputMethodAndSubtype_0020 success")
          expect().assertFail();
          done();
        });
      }catch(err){
        console.info(`====>inputmethod_test_switchCurrentInputMethodAndSubtype_0020 catch err:  ${JSON.stringify(err)}`)
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /*
     * @tc.number  inputmethod_test_listInputMethodSubtype_0010
     * @tc.name    inputmethod_test_listInputMethodSubtype_0010.
     * @tc.desc    401 Function test
     * @tc.type    Function
     * @tc.level   2
    */
    it('inputmethod_test_listInputMethodSubtype_0010', Level.LEVEL2, async (done: Function) => {
      try{
        let inputMethodSetting = inputMethod.getSetting();
        inputMethodSetting.listInputMethodSubtype(undefined).then(data => {
          console.info("====>inputmethod_test_listInputMethodSubtype_0010 success")
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.info(`====>inputmethod_test_listInputMethodSubtype_0010 err:  ${JSON.stringify(err)}`)
          expect(err.code).assertEqual(401);
          done();
        });
      }catch(err){
        console.info(`====>inputmethod_test_listInputMethodSubtype_0010 catch err:  ${JSON.stringify(err)}`)
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /*
     * @tc.number  inputmethod_test_listInputMethodSubtype_0020
     * @tc.name    inputmethod_test_listInputMethodSubtype_0020.
     * @tc.desc    401 Function test
     * @tc.type    Function
     * @tc.level   2
    */
    it('inputmethod_test_listInputMethodSubtype_0020', Level.LEVEL2, async (done: Function) => {
      try{
        let inputMethodSetting = inputMethod.getSetting();
        inputMethodSetting.listInputMethodSubtype(undefined, (err, data) => {
          if (err) {
            console.info("====>inputmethod_test_listInputMethodSubtype_0020 error:" + err);
            expect(err.code).assertEqual(401);
            done();
          }
          console.info("====>inputmethod_test_listInputMethodSubtype_0020 success")
          expect().assertFail();
          done();
        });
      }catch(err){
        console.info(`====>inputmethod_test_listInputMethodSubtype_0020 catch err:  ${JSON.stringify(err)}`)
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /*
     * @tc.number  inputmethod_test_getInputMethods_0010
     * @tc.name    inputmethod_test_getInputMethods_0010.
     * @tc.desc    401 Function test
     * @tc.type    Function
     * @tc.level   2
    */
    it('inputmethod_test_getInputMethods_0010', Level.LEVEL2, async (done: Function) => {
      try{
        let inputMethodSetting = inputMethod.getSetting();
        inputMethodSetting.getInputMethods(undefined).then(data => {
          console.info("====>inputmethod_test_getInputMethods_0010 success")
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.info(`====>inputmethod_test_getInputMethods_0010 err:  ${JSON.stringify(err)}`)
          expect(err.code).assertEqual(401);
          done();
        });
      }catch(err){
        console.info(`====>inputmethod_test_getInputMethods_0010 catch err:  ${JSON.stringify(err)}`)
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /*
     * @tc.number  inputmethod_test_getInputMethods_0020
     * @tc.name    inputmethod_test_getInputMethods_0020.
     * @tc.desc    401 Function test
     * @tc.type    Function
     * @tc.level   2
    */
    it('inputmethod_test_getInputMethods_0020', Level.LEVEL2, async (done: Function) => {
      try{
        let inputMethodSetting = inputMethod.getSetting();
        inputMethodSetting.getInputMethods(undefined, (err, data) => {
          if (err) {
            console.info("====>inputmethod_test_getInputMethods_0020 error:" + err);
            expect(err.code).assertEqual(401);
            done();
          }
          console.info("====>inputmethod_test_getInputMethods_0020 success")
          expect().assertFail();
          done();
        });
      }catch(err){
        console.info(`====>inputmethod_test_getInputMethods_0020 catch err:  ${JSON.stringify(err)}`)
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /*
     * @tc.number  inputmethod_test_updateAttribute_0010
     * @tc.name    inputmethod_test_updateAttribute_0010.
     * @tc.desc    401 Function test
     * @tc.type    Function
     * @tc.level   2
    */
    it('inputmethod_test_updateAttribute_0010', Level.LEVEL2, async (done: Function) => {
      try{
        let inputMethodController = inputMethod.getController()
        inputMethodController.updateAttribute(undefined).then(data => {
          console.info("====>inputmethod_test_updateAttribute_0010 success")
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.info(`====>inputmethod_test_updateAttribute_0010 err:  ${JSON.stringify(err)}`)
          expect(err.code).assertEqual(401);
          done();
        });
      }catch(err){
        console.info(`====>inputmethod_test_updateAttribute_0010 catch err:  ${JSON.stringify(err)}`)
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /*
     * @tc.number  inputmethod_test_updateAttribute_0020
     * @tc.name    inputmethod_test_updateAttribute_0020.
     * @tc.desc    401 Function test
     * @tc.type    Function
     * @tc.level   2
    */
    it('inputmethod_test_updateAttribute_0020', Level.LEVEL2, async (done: Function) => {
      try{
        let inputMethodController = inputMethod.getController()
        inputMethodController.updateAttribute(undefined, (err, data) => {
          if (err) {
            console.info("====>inputmethod_test_updateAttribute_0020 error:" + err);
            expect(err.code).assertEqual(401);
            done();
          }
          console.info("====>inputmethod_test_updateAttribute_0020 success")
          expect().assertFail();
          done();
        });
      }catch(err){
        console.info(`====>inputmethod_test_updateAttribute_0020 catch err:  ${JSON.stringify(err)}`)
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /*
     * @tc.number  inputmethod_test_updateCursor_0010
     * @tc.name    inputmethod_test_updateCursor_0010.
     * @tc.desc    401 Function test
     * @tc.type    Function
     * @tc.level   2
    */
    it('inputmethod_test_updateCursor_0010', Level.LEVEL2, async (done: Function) => {
      try{
        let inputMethodController = inputMethod.getController()
        inputMethodController.updateCursor(undefined).then(data => {
          console.info("====>inputmethod_test_updateCursor_0010 success")
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.info(`====>inputmethod_test_updateCursor_0010 err:  ${JSON.stringify(err)}`)
          expect(err.code).assertEqual(401);
          done();
        });
      }catch(err){
        console.info(`====>inputmethod_test_updateCursor_0010 catch err:  ${JSON.stringify(err)}`)
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /*
     * @tc.number  inputmethod_test_updateCursor_0020
     * @tc.name    inputmethod_test_updateCursor_0020.
     * @tc.desc    401 Function test
     * @tc.type    Function
     * @tc.level   2
    */
    it('inputmethod_test_updateCursor_0020', Level.LEVEL2, async (done: Function) => {
      try{
        let inputMethodController = inputMethod.getController();
        inputMethodController.updateCursor(undefined, (err, data) => {
          if (err) {
            console.info("====>inputmethod_test_updateCursor_0020 error:" + err);
            expect(err.code).assertEqual(401);
            done();
          }
          console.info("====>inputmethod_test_updateCursor_0020 success")
          expect().assertFail();
          done();
        });
      }catch(err){
        console.info(`====>inputmethod_test_updateCursor_0020 catch err:  ${JSON.stringify(err)}`)
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /*
    * @tc.number  SUB_Misc_InputMethod_oninsertText_0100
    * @tc.name    SUB_Misc_InputMethod_oninsertText_0100
    * @tc.desc    12800009 Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_Misc_InputMethod_oninsertText_0100', Level.LEVEL2, async (done: Function) => {
      try {
        let inputMethodController = inputMethod.getController()
        inputMethodController.detach()
        inputMethodController.on('insertText', () => {
          inputMethodController.off('insertText', () =>{})
          return
        })
        console.info("====>SUB_Misc_InputMethod_oninsertText_0100 on('insertText') Success:");
        expect().assertFail();
      } catch (err) {
        console.info("====>SUB_Misc_InputMethod_oninsertText_0100 err:" + JSON.stringify(err));
        expect(err.code).assertEqual(12800009);
        done();
      }
    });

    /*
    * @tc.number  SUB_Misc_InputMethod_ondeleteLeft_0100
    * @tc.name    SUB_Misc_InputMethod_ondeleteLeft_0100
    * @tc.desc    12800009 Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_Misc_InputMethod_ondeleteLeft_0100', Level.LEVEL2, async (done: Function) => {
      try {
        let inputMethodController = inputMethod.getController()
        inputMethodController.detach()
        inputMethodController.on('deleteLeft', () => {
          inputMethodController.off('deleteLeft', () =>{})
          return
        })
        console.info("====>SUB_Misc_InputMethod_ondeleteLeft_0100 on('deleteLeft') Success:");
        expect().assertFail();
      } catch (err) {
        console.info("====>SUB_Misc_InputMethod_ondeleteLeft_0100 err:" + JSON.stringify(err));
        expect(err.code).assertEqual(12800009);
        done();
      }
    });

    /*
    * @tc.number  SUB_Misc_InputMethod_ondeleteRight_0100
    * @tc.name    SUB_Misc_InputMethod_ondeleteRight_0100
    * @tc.desc    12800009 Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_Misc_InputMethod_ondeleteRight_0100', Level.LEVEL2, async (done: Function) => {
      try {
        let inputMethodController = inputMethod.getController()
        inputMethodController.detach()
        inputMethodController.on('deleteRight', () => {
          inputMethodController.off('deleteRight', () =>{})
          return
        })
        console.info("====>SUB_Misc_InputMethod_ondeleteRight_0100 on('deleteRight') Success:");
        expect().assertFail();
      } catch (err) {
        console.info("====>SUB_Misc_InputMethod_ondeleteRight_0100 err:" + JSON.stringify(err));
        expect(err.code).assertEqual(12800009);
        done();
      }
    });

    /*
    * @tc.number  SUB_Misc_InputMethod_onsendKeyboardStatus_0100
    * @tc.name    SUB_Misc_InputMethod_onsendKeyboardStatus_0100
    * @tc.desc    12800009 Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_Misc_InputMethod_onsendKeyboardStatus_0100', Level.LEVEL2, async (done: Function) => {
      try {
        let inputMethodController = inputMethod.getController()
        inputMethodController.detach()
        inputMethodController.on('sendKeyboardStatus', () => {
          inputMethodController.off('sendKeyboardStatus', () =>{})
          return
        })
        console.info("====>SUB_Misc_InputMethod_onsendKeyboardStatus_0100 on('sendKeyboardStatus') Success:");
        expect().assertFail();
      } catch (err) {
        console.info("====>SUB_Misc_InputMethod_onsendKeyboardStatus_0100 err:" + JSON.stringify(err));
        expect(err.code).assertEqual(12800009);
        done();
      }
    });

    /*
    * @tc.number  SUB_Misc_InputMethod_onsendFunctionKey_0100
    * @tc.name    SUB_Misc_InputMethod_onsendFunctionKey_0100
    * @tc.desc    12800009 Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_Misc_InputMethod_onsendFunctionKey_0100', Level.LEVEL2, async (done: Function) => {
      try {
        let inputMethodController = inputMethod.getController()
        inputMethodController.detach()
        inputMethodController.on('sendFunctionKey', () => {
          inputMethodController.off('sendFunctionKey', () =>{})
          return
        })
        console.info("====>SUB_Misc_InputMethod_onsendFunctionKey_0100 on('sendFunctionKey') Success:");
        expect().assertFail();
      } catch (err) {
        console.info("====>SUB_Misc_InputMethod_onsendFunctionKey_0100 err:" + JSON.stringify(err));
        expect(err.code).assertEqual(12800009);
        done();
      }
    });

    /*
    * @tc.number  SUB_Misc_InputMethod_onmoveCursor_0100
    * @tc.name    SUB_Misc_InputMethod_onmoveCursor_0100
    * @tc.desc    12800009 Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_Misc_InputMethod_onmoveCursor_0100', Level.LEVEL2, async (done: Function) => {
      try {
        let inputMethodController = inputMethod.getController()
        inputMethodController.detach()
        inputMethodController.on('moveCursor', () => {
          inputMethodController.off('moveCursor', () =>{})
          return
        })
        console.info("====>SUB_Misc_InputMethod_onmoveCursor_0100 on('moveCursor') Success:");
        expect().assertFail();
      } catch (err) {
        console.info("====>SUB_Misc_InputMethod_onmoveCursor_0100 err:" + JSON.stringify(err));
        expect(err.code).assertEqual(12800009);
        done();
      }
    });

    /*
    * @tc.number  SUB_Misc_InputMethod_onhandleExtendAction_0100
    * @tc.name    SUB_Misc_InputMethod_onhandleExtendAction_0100
    * @tc.desc    12800009 Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_Misc_InputMethod_onhandleExtendAction_0100', Level.LEVEL2, async (done: Function) => {
      try {
        let inputMethodController = inputMethod.getController()
        inputMethodController.detach()
        inputMethodController.on('handleExtendAction', () => {
          inputMethodController.off('handleExtendAction', () =>{})
          return
        })
        console.info("====>SUB_Misc_InputMethod_onhandleExtendAction_0100 on('handleExtendAction') Success:");
        expect().assertFail();
      } catch (err) {
        console.info("====>SUB_Misc_InputMethod_onhandleExtendAction_0100 err:" + JSON.stringify(err));
        expect(err.code).assertEqual(12800009);
        done();
      }
    });

    /*
    * @tc.number  SUB_Misc_inputMethod_showTextInput_Promise_0101
    * @tc.name    SUB_Misc_inputMethod_showTextInput_Promise_0101
    * @tc.desc    12800009 Function test
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level2
    */
    it('SUB_Misc_inputMethod_showTextInput_Promise_0101', Level.LEVEL2, async (done: Function) => {
      try {
        let inputMethodController = inputMethod.getController()
        await inputMethodController.detach()
        await inputMethodController.showTextInput(inputMethod.RequestKeyboardReason.TOUCH)
        console.info("====>SUB_Misc_inputMethod_showTextInput_Promise_0101 on('handleExtendAction') Success:");
        expect().assertFail();
      } catch (err) {
        console.info("====>SUB_Misc_inputMethod_showTextInput_Promise_0101 err:" + JSON.stringify(err));
        expect(err.code).assertEqual(12800009);
        done();
      }
    });

  })
}
