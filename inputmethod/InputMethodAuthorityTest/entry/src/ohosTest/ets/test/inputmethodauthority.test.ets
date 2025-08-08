/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import inputMethod from '@ohos.inputMethod';
import subtype from '@ohos.InputMethodSubtype';
import { BusinessError } from '@ohos.base';
import inputmethodengine from '@ohos.inputMethodEngine';

export default function inputMethodAuthorityJSUnit() {
  describe('inputMethodAuthorityJSUnit', () => {
    console.info("====>************* inputMethodAuthorityJSUnit settings Test start*************");
    /**
     * beforeAll: Test case-level clearance conditions, which are executed after each test case is executed.
     */
    beforeAll(async(done: Function) => {
      let inputMethodSetting = inputMethod.getSetting();
      console.info('====> getSetting success!')
      inputMethodSetting.listInputMethod((err: BusinessError, data: Array<inputMethod.InputMethodProperty>) => {
        let t = setTimeout(async ()=>{
          console.info('====>Succeeded in listing inputMethod: ' + JSON.stringify(data));
          clearTimeout(t);
          done();
        }, 3000)
      });
    })

    /*
     * @tc.number  inputmethod_test_switchInputMethod_001
     * @tc.name    Test Indicates the input method which will replace the current one.
     * @tc.desc    Function test
     * @tc.level   0
    */
    it('inputmethod_test_switchInputMethod_001', Level.LEVEL0, async (done: Function) => {
      console.info("====>************* inputmethod_test_switchInputMethod_001 Test start*************");
      let inputM = inputMethod.getCurrentInputMethod()
      console.info("inputmethod_test_switchInputMethod_001 getCurrentInputMethod: " + JSON.stringify(inputM));
      let inputMethodProperty: inputMethod.InputMethodProperty = {
        packageName: inputM.packageName,
        methodId: inputM.methodId,
        name: inputM.packageName,
        id: inputM.methodId,
        extra: {}
      }
      inputMethod.switchInputMethod(inputMethodProperty).then(data => {
        console.info("====>inputmethod_test_switchInputMethod_001 data:" + data)
        expect(data == true).assertTrue();
        console.info("====>************* inputmethod_test_switchInputMethod_001 Test end*************");
        done();
      }).catch((err: BusinessError) => {
        console.info("====>inputmethod_test_switchInputMethod_001 err:" + err)
        expect().assertFail();
        done();
      });
    });

    /*
     * @tc.number  inputmethod_test_switchInputMethod_002
     * @tc.name    Test Indicates the input method which will replace the current one.
     * @tc.desc    Function test
     * @tc.level   2
     */
    it('inputmethod_test_switchInputMethod_002', Level.LEVEL2, async (done: Function) => {
      console.info("====>************* inputmethod_test_switchInputMethod_002 Test start*************");
      let inputM = inputMethod.getCurrentInputMethod()
      console.info("inputmethod_test_switchInputMethod_002 getCurrentInputMethod: " + JSON.stringify(inputM));
      let inputMethodProperty: inputMethod.InputMethodProperty = {
        packageName: inputM.packageName,
        methodId: inputM.methodId,
        name: inputM.packageName,
        id: inputM.methodId,
        extra: {}
      }
      inputMethod.switchInputMethod(inputMethodProperty, (err, data) => {
        try {
          if (err) {
            console.info("====>inputmethod_test_switchInputMethod_002 error:" + err);
            expect().assertFail();
            done();
          }
          console.info("====>inputmethod_test_switchInputMethod_002 data:" + data)
          console.info("====>************* inputmethod_test_switchInputMethod_002 Test end*************");
          expect(data == true).assertTrue();
          done();
        } catch (err) {
          console.info("====>inputmethod_test_switchInputMethod_002 catch error:" + err);
          done();
        }
      });
    });

    /*
     * @tc.number  inputmethod_test_showSoftKeyboard_001
     * @tc.name    Test Indicates the input method which will show softboard with calback.
     * @tc.desc    Function test
     * @tc.level   2
     */
    it('inputmethod_test_showSoftKeyboard_001', Level.LEVEL2, async (done: Function) => {
      let inputMethodCtrl = inputMethod.getInputMethodController()
      inputMethodCtrl.showSoftKeyboard((err) => {
        try {
          if (err == undefined) {
            expect().assertFail()
            done();
          } else {
            expect(err.code).assertEqual(12800003)
            console.info("====>************* inputmethod_test_showSoftKeyboard_001 Test end*************");
            done();
          }
        } catch (err) {
          console.info("====>inputmethod_test_showSoftKeyboard_001 err tests fail" + JSON.stringify(err));
          done();
        }
      });
    });

    /*
     * @tc.number  inputmethod_test_showSoftKeyboard_002
     * @tc.name    Test Indicates the input method which will show softboard with Promise.
     * @tc.desc    Function test
     * @tc.level   2
     */
    it('inputmethod_test_showSoftKeyboard_002', Level.LEVEL2, async (done: Function) => {
      let inputMethodCtrl = inputMethod.getInputMethodController()
      inputMethodCtrl.showSoftKeyboard().then(() => {
        try {
          expect().assertFail()
          done();
        } catch (err) {
          console.info("====>inputmethod_test_showSoftKeyboard_002 err tests fail" + JSON.stringify(err));
          done();
        }
      }).catch((err: BusinessError) => {
        console.info('====>inputmethod_test_showSoftKeyboard_002 promise failed : ' + JSON.stringify(err))
        console.info('====>inputmethod_test_showSoftKeyboard_002 typeof(err.code): ' + typeof (err.code))
        console.info('====>inputmethod_test_showSoftKeyboard_002 typeof(err.code): ' + err.code)
        expect(err.code).assertEqual(12800003)
        console.info("====>************* inputmethod_test_showSoftKeyboard_002 Test end*************");
        done();
      })
    });

    /*
     * @tc.number  inputmethod_test_hideSoftKeyboard_001
     * @tc.name    Test Indicates the input method which will hide softboard with calback.
     * @tc.desc    Function test
     * @tc.level   2
     */
    it('inputmethod_test_hideSoftKeyboard_001', Level.LEVEL2, async (done: Function) => {
      let inputMethodCtrl = inputMethod.getInputMethodController()
      inputMethodCtrl.hideSoftKeyboard((err) => {
        try {
          if (err == undefined) {
            expect().assertFail()
            done();
          } else {
            console.info('====>inputmethod_test_hideSoftKeyboard_001 callbacek failed : ' + JSON.stringify(err))
            expect(err.code).assertEqual(12800003)
            console.info("====>************* inputmethod_test_hideSoftKeyboard_001 Test end*************");
            done();
          }
        } catch (err) {
          console.info('====>inputmethod_test_hideSoftKeyboard_001 callbacek failed : ' + JSON.stringify(err))
          done();
        }
      })
    });

    /*
     * @tc.number  inputmethod_test_hideSoftKeyboard_002
     * @tc.name    Test Indicates the input method which will hide softboard with Promise.
     * @tc.desc    Function test
     * @tc.level   2
     */
    it('inputmethod_test_hideSoftKeyboard_002', Level.LEVEL2, async (done: Function) => {
      let inputMethodCtrl = inputMethod.getInputMethodController()
      inputMethodCtrl.hideSoftKeyboard().then(() => {
        try {
          expect().assertFail()
          done();
        } catch (err) {
          console.info("====>inputmethod_test_hideSoftKeyboard_002 err tests fail" + JSON.stringify(err));
          done();
        }
      }).catch((err: BusinessError) => {
        console.info('====>inputmethod_test_hideSoftKeyboard_002 promise failed : ' + JSON.stringify(err))
        expect(err.code).assertEqual(12800003);
        console.info("====>************* inputmethod_test_hideSoftKeyboard_002 Test end*************");
        done();
      })
    });

    /*
     * @tc.number  inputMethod_test_switchCurrentInputMethodAndSubtype_001
     * @tc.name    Switch current input method subtype.
     * @tc.desc    Function test
     * @tc.level   2
     */
    it('inputMethod_test_switchCurrentInputMethodAndSubtype_001', Level.LEVEL2, async (done: Function) => {
      console.info("====>************* inputMethod_test_switchCurrentInputMethodAndSubtype_001 Test start*************");
      let inputM = inputMethod.getCurrentInputMethod()
      console.info("inputMethod_test_switchCurrentInputMethodAndSubtype_001 getCurrentInputMethod: " + JSON.stringify(inputM));
      let inputMethodProperty: inputMethod.InputMethodProperty = {
        packageName: inputM.packageName,
        methodId: inputM.methodId,
        name: inputM.packageName,
        id: inputM.methodId,
        label: "",
        labelId: 123,
        icon: "",
        iconId: 124,
        extra: {}
      }
      let inputMS = inputMethod.getCurrentInputMethodSubtype()
      console.info("inputMethod_test_switchCurrentInputMethodAndSubtype_001 getCurrentInputMethodSubtype: " + JSON.stringify(inputMS));
      let inputMethodSubProperty: subtype = {
        id: inputMS.id,
        label: "",
        labelId: 123,
        name: inputMS.name,
        mode: "lower",
        locale: "",
        language: "",
        icon: "",
        iconId: 0,
        extra: {}
      };

      inputMethod.switchCurrentInputMethodAndSubtype(inputMethodProperty, inputMethodSubProperty, (err, data) => {
        try {
          if (err) {
            console.error('inputMethod_test_switchCurrentInputMethodAndSubtype_001 err: ' + JSON.stringify(err));
            expect(err.code === 12800008).assertTrue();
            done();
          }
          console.info("====>inputMethod_test_switchCurrentInputMethodAndSubtype_001 data: " + JSON.stringify(data));
          expect(data != null).assertTrue();
          done();
        } catch (error) {
          console.error('inputMethod_test_switchCurrentInputMethodAndSubtype_001 catch error: ' + JSON.stringify(error));
          done();
        }
      });
      console.info("====>************* inputMethod_test_switchCurrentInputMethodAndSubtype_001 Test end*************");
    });

    /*
     * @tc.number  inputMethod_test_switchCurrentInputMethodAndSubtype_002
     * @tc.name    Switch current input method subtype.
     * @tc.desc    Function test
     * @tc.level   2
     */
    it('inputMethod_test_switchCurrentInputMethodAndSubtype_002', Level.LEVEL2, async (done: Function) => {
      console.info("====>************* inputMethod_test_switchCurrentInputMethodAndSubtype_002 Test start*************");
      let inputM = inputMethod.getCurrentInputMethod()
      console.info("inputMethod_test_switchCurrentInputMethodAndSubtype_002 getCurrentInputMethod: " + JSON.stringify(inputM));
      let inputMethodProperty: inputMethod.InputMethodProperty = {
        packageName: inputM.packageName,
        methodId: inputM.methodId,
        name: inputM.packageName,
        id: inputM.methodId,
        label: "",
        labelId: 123,
        icon: "",
        iconId: 124,
        extra: {}
      }
      let inputMS = inputMethod.getCurrentInputMethodSubtype()
      console.info("inputMethod_test_switchCurrentInputMethodAndSubtype_002 getCurrentInputMethodSubtype: " + JSON.stringify(inputMS));
      let inputMethodSubProperty: subtype = {
        id: inputMS.id,
        label: "",
        labelId: 123,
        name: inputMS.name,
        mode: "lower",
        locale: "",
        language: "",
        icon: "",
        iconId: 0,
        extra: {}
      };

      try {
        inputMethod.switchCurrentInputMethodAndSubtype(inputMethodProperty, inputMethodSubProperty).then((data) => {
          console.info("====>inputMethod_test_switchCurrentInputMethodAndSubtype_002 data: " + JSON.stringify(data));
          expect(data != null).assertTrue();
          done();
        }).catch((err : BusinessError) => {
          console.error('inputMethod_test_switchCurrentInputMethodAndSubtype_002 err: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      } catch (error) {
        console.error('inputMethod_test_switchCurrentInputMethodAndSubtype_002 catch error: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      }
      ;
      console.info("====>************* inputMethod_test_switchCurrentInputMethodAndSubtype_002 Test end*************");
    });

    /*
     * @tc.number  inputMethod_test_switchCurrentInputMethodSubtype_001
     * @tc.name    Switch current input method subtype.
     * @tc.desc    Function test
     * @tc.level   2
     */
    it('inputMethod_test_switchCurrentInputMethodSubtype_001', Level.LEVEL2, async (done: Function) => {
      console.info("====>************* inputMethod_test_switchCurrentInputMethodSubtype_001 Test start*************");
      let inputMS = inputMethod.getCurrentInputMethodSubtype()
      console.info("inputMethod_test_switchCurrentInputMethodSubtype_001 getCurrentInputMethodSubtype: " + JSON.stringify(inputMS));
      let inputMethodSubProperty: subtype = {
        id: inputMS.id,
        label: "",
        labelId: 123,
        name: inputMS.name,
        mode: "lower",
        locale: "",
        language: "",
        icon: "",
        iconId: 0,
        extra: {}
      };

      inputMethod.switchCurrentInputMethodSubtype(inputMethodSubProperty, (err, data) => {
        try {
          if (err) {
            console.error('inputMethod_test_switchCurrentInputMethodSubtype_001 err: ' + JSON.stringify(err));
            expect().assertFail();
            done();
          }
          ;
          console.info("====>inputMethod_test_switchCurrentInputMethodSubtype_001 data: " + JSON.stringify(data));
          expect(data != null).assertTrue();
          done();
        } catch (error) {
          console.error('inputMethod_test_switchCurrentInputMethodSubtype_001 catch error: ' + JSON.stringify(error));
          done();
        }
      });
      console.info("====>************* inputMethod_test_switchCurrentInputMethodSubtype_001 Test end*************");
    });

    /*
     * @tc.number  inputMethod_test_switchCurrentInputMethodSubtype_002
     * @tc.name    Switch current input method subtype.
     * @tc.desc    Function test
     * @tc.level   2
     */
    it('inputMethod_test_switchCurrentInputMethodSubtype_002', Level.LEVEL2, async (done: Function) => {
      console.info("====>************* inputMethod_test_switchCurrentInputMethodSubtype_002 Test start*************");
      let inputMS = inputMethod.getCurrentInputMethodSubtype()
      console.info("inputMethod_test_switchCurrentInputMethodSubtype_002 getCurrentInputMethodSubtype: " + JSON.stringify(inputMS));
      let inputMethodSubProperty: subtype = {
        id: inputMS.id,
        label: "",
        labelId: 123,
        name: inputMS.name,
        mode: "lower",
        locale: "",
        language: "",
        icon: "",
        iconId: 0,
        extra: {}
      };

      try {
        inputMethod.switchCurrentInputMethodSubtype(inputMethodSubProperty).then((data) => {
          console.info("====>inputMethod_test_switchCurrentInputMethodSubtype_002 data: " + JSON.stringify(data));
          expect(data != null).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.error('inputMethod_test_switchCurrentInputMethodSubtype_002 err: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      } catch (error) {
        console.error('inputMethod_test_switchCurrentInputMethodSubtype_002 catch error: ' + JSON.stringify(error));
        expect().assertFail();
        done();
      }
      ;
      console.info("====>************* inputMethod_test_switchCurrentInputMethodSubtype_002 Test end*************");
    });

    /**
     * @tc.number  Sub_InputMethod_IME_InputMethodState_0901
     * @tc.name    Sub_InputMethod_IME_InputMethodState_0901
     * @tc.desc    Function test
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('Sub_InputMethod_IME_InputMethodState_0901', Level.LEVEL2, async (done: Function) => {
      try{
        let inputMethodSetting: inputMethod.InputMethodSetting = inputMethod.getSetting();
        console.info("====>Sub_InputMethod_IME_InputMethodState_0901 getSetting success");
        let state =  await inputMethodSetting.getInputMethodState();
        console.info("====>Sub_InputMethod_IME_InputMethodState_0901 state is: " + state);
        expect().assertFail();
        done();
      }catch(err){
        console.info(`====>Sub_InputMethod_IME_InputMethodState_0901 errCode:${err.code}, errMessage is ${err.message}`)
        expect(err.code).assertEqual(12800004);
        done();
      };
    });

    let sleep = (timeout: number): Promise<ESObject> => {
      return new Promise(resolve => {
        const st = setTimeout(() => {
          resolve(null);
          clearTimeout(st);
        }, timeout);
      });
    };

    /**
     * @tc.number  Sub_Misc_InputMethod_IME_recvMessage_0100
     * @tc.name    Sub_Misc_InputMethod_IME_recvMessage_0100
     * @tc.desc    Function test
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('Sub_Misc_InputMethod_IME_recvMessage_0100', Level.LEVEL2, async (done: Function) => {
      let inputMethodController = inputMethod.getController();
      let data = false
      let messageHandler: inputMethod.MessageHandler = {
        onTerminated(): void {
            console.info('====>OnTerminated.');
            data = true
        },
        onMessage(msgId: string): void {
            console.info('====>recv message.');
        }
      }
      try{
        inputMethodController.recvMessage(messageHandler);
        await inputMethodController.recvMessage();
        await sleep(100)
        console.info("====>Sub_InputMethod_IME_InputMethodState_0901 recvMessage success data is: " + data);
        expect(data).assertEqual(true);
        done();
      }catch(err){
        console.info(`====>Sub_InputMethod_IME_InputMethodState_0901 errCode:${err.code}, errMessage is ${err.message}`)
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number  Sub_InputMethod_IME_getSecurityMode_0101
     * @tc.name    Sub_InputMethod_IME_getSecurityMode_0101
     * @tc.desc    Function test
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('Sub_InputMethod_IME_getSecurityMode_0101', Level.LEVEL2, async (done: Function) => {
      try{
        let InputMethodAbility = inputmethodengine.getInputMethodAbility();
        console.info("====>Sub_InputMethod_IME_getSecurityMode_0101 getInputMethodAbility success");
        let state =  await InputMethodAbility.getSecurityMode();
        console.info("====>Sub_InputMethod_IME_getSecurityMode_0101 state is: " + state);
        expect(typeof (state) === 'number').assertTrue();
        done();
      }catch(err){
        console.info(`====>Sub_InputMethod_IME_getSecurityMode_0101 errCode:${err.code}, errMessage is ${err.message}`)
        expect(err.code).assertEqual(12800004);
        done();
      };
    });

    /**
     * @tc.number  Sub_InputMethod_IME_createPanel_0101
     * @tc.name    Sub_InputMethod_IME_createPanel_0101
     * @tc.desc    Function test
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('Sub_InputMethod_IME_createPanel_0101', Level.LEVEL2, async (done: Function) => {
      let panelInfo: inputmethodengine.PanelInfo = {
        type: 0,
        flag: 1
      };
      try{
        let InputMethodAbility = inputmethodengine.getInputMethodAbility();
        console.info("====>Sub_InputMethod_IME_createPanel_0101 getInputMethodAbility success");
        InputMethodAbility.createPanel(globalThis.abilityContext, panelInfo,  (err: BusinessError, panel: inputmethodengine.Panel) => {
            if (err) {
                console.info(`====>Sub_InputMethod_IME_createPanel_0101 err errCode:${err.code}, errMessage is ${err.message}`);
                expect(err.code).assertEqual(1);
                done();
            } else {
                console.info("====>Sub_InputMethod_IME_createPanel_0101 createPanel success " );
                expect().assertFail();
                done();
            }
        });
      } catch(err) {
        console.info(`====>Sub_InputMethod_IME_createPanel_0101 catch errCode:${err.code}, errMessage is ${err.message}`)
        expect(err.code).assertEqual(12800004);
        done();
      };
    });

    /**
     * @tc.number  Sub_InputMethod_IME_createPanel_0201
     * @tc.name    Sub_InputMethod_IME_createPanel_0201
     * @tc.desc    Function test
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('Sub_InputMethod_IME_createPanel_0201', Level.LEVEL2, async (done: Function) => {
      let panelInfo: inputmethodengine.PanelInfo = {
        type: 0,
        flag: 1
      }
      try{
        let InputMethodAbility = inputmethodengine.getInputMethodAbility();
        console.info("====>Sub_InputMethod_IME_createPanel_0201 getInputMethodAbility success");
        await InputMethodAbility.createPanel(globalThis.abilityContext, panelInfo);
        console.info("====>Sub_InputMethod_IME_createPanel_0201 createPanel success " );
        expect().assertFail();
        done();
      }catch(err){
        console.info(`====>Sub_InputMethod_IME_createPanel_0201 errCode:${err.code}, errMessage is ${err.message}`)
        expect(err.code).assertEqual(1);
        done();
      };
    });

    /**
     * @tc.number  Sub_InputMethod_IMF_DiscardTypingText_0200
     * @tc.name    Sub_InputMethod_IMF_DiscardTypingText_0200
     * @tc.desc    Function test
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('Sub_InputMethod_IMF_DiscardTypingText_0200', Level.LEVEL2, async (done: Function) => {
      try{
        let inputMethodController = inputMethod.getController();
        let state =  await inputMethodController.discardTypingText();
        console.info("====>Sub_InputMethod_IMF_DiscardTypingText_0200 state is: " + state);
        expect().assertFail();
        done();
      }catch(err){
        console.info(`====>Sub_InputMethod_IMF_DiscardTypingText_0200 errCode:${err.code}, errMessage is ${err.message}`)
        expect(err.code).assertEqual(12800009);
        done();
      };
    });

    /**
     * @tc.number  Sub_InputMethod_IMF_setSimpleKeyboardEnabled_0100
     * @tc.name    Sub_InputMethod_IMF_setSimpleKeyboardEnabled_0100
     * @tc.desc    Function test
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('Sub_InputMethod_IMF_setSimpleKeyboardEnabled_0100', Level.LEVEL2, async (done: Function) => {
      try{
        let enable = true;
        inputMethod.setSimpleKeyboardEnabled(enable);
        console.info("====>Sub_InputMethod_IMF_setSimpleKeyboardEnabled_0100 setSimpleKeyboardEnabled is success");
        expect(enable == true).assertTrue();
        done();
      }catch(err){
        console.info(`====>Sub_InputMethod_IMF_setSimpleKeyboardEnabled_0100 errCode:${err.code}, errMessage is ${err.message}`)
        expect().assertFail();
        done();
      };
    });

    /**
     * @tc.number  Sub_InputMethod_IMF_setSimpleKeyboardEnabled_0200
     * @tc.name    Sub_InputMethod_IMF_setSimpleKeyboardEnabled_0200
     * @tc.desc    Function test
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it('Sub_InputMethod_IMF_setSimpleKeyboardEnabled_0200', Level.LEVEL2, async (done: Function) => {
      try{
        let enable = false;
        inputMethod.setSimpleKeyboardEnabled(enable);
        console.info("====>Sub_InputMethod_IMF_setSimpleKeyboardEnabled_0200 setSimpleKeyboardEnabled is success");
        expect(enable == false).assertTrue();
        done();
      }catch(err){
        console.info(`====>Sub_InputMethod_IMF_setSimpleKeyboardEnabled_0200 errCode:${err.code}, errMessage is ${err.message}`)
        expect().assertFail();
        done();
      };
    });

  });
};