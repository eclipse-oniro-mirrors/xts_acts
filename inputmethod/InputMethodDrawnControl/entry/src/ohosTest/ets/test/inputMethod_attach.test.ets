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
import inputMethod from '@ohos.inputMethod';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import * as env from './lib/Const';
import { BusinessError } from '@ohos.base';
import { UIContext } from '@kit.ArkUI';

function expectTrue(data: boolean) {
  try {
    expect(data).assertTrue();
  } catch (err) {
    console.info('assertion failure');
  }
};

function expectContain(a: ESObject, b: ESObject) {
  try {
    expect(a).assertContain(b);
  } catch (err) {
    console.info('assertion failure');
  }
};

function expectFalse() {
  try {
    expect().assertFail();
  } catch (err) {
    console.info('assertion failure');
  }
};

let st:ESObject = null;

const sleep = (timeout: number) : Promise<ESObject> => {
  return new Promise(resolve => {
    const st = setTimeout(() => {
      resolve(null);
    }, timeout);
  });
};

export default function inputMethodTest() {
  describe('inputMethod_attach', () => {

    afterEach(async () => {
      clearTimeout(st);
    });

    /**
     * @tc.name   SUB_Misc_inputMethod_attach_Async_0100
     * @tc.number SUB_Misc_inputMethod_attach_Async_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Misc_inputMethod_attach_Async_0100', Level.LEVEL2, async (done: Function) => {
      const CASE_NAME = 'SUB_Misc_inputMethod_attach_Async_0100';
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }
      let CallBack = (error: BusinessError, data: ESObject) => {
        if (error) {
          console.info(`${CASE_NAME} execution fail,error: [${error.code}, ${error.message}]`);
          expectFalse();
          done();
          return;
        } else {
          console.info(`${CASE_NAME} execution success, data: ${JSON.stringify(data)}`);
          done();
          return;
        }
      };
      try {
        inputMethod.getController().attach(true, ATTRIBUTE, CallBack);
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
    });

    /**
     * @tc.name   SUB_Misc_inputMethod_attach_Async_0200
     * @tc.number SUB_Misc_inputMethod_attach_Async_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Misc_inputMethod_attach_Async_0200', Level.LEVEL2, async (done: Function) => {
      const CASE_NAME = 'SUB_Misc_inputMethod_attach_Async_0200';
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }
      let CallBack = (error: BusinessError, data: ESObject) => {
        if (error) {
          console.info(`${CASE_NAME} execution fail,error: [${error.code}, ${error.message}]`);
          expectFalse();
          done();
          return;
        } else {
          console.info(`${CASE_NAME} execution success, data: ${JSON.stringify(data)}`);
          done();
          return;
        }
      };
      try {
        inputMethod.getController().attach(false, ATTRIBUTE, CallBack);
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
    });

    /**
     * @tc.name   SUB_Misc_inputMethod_attach_Async_0300
     * @tc.number SUB_Misc_inputMethod_attach_Async_0300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Misc_inputMethod_attach_Async_0300', Level.LEVEL2, async (done: Function) => {
      const CASE_NAME = 'SUB_Misc_inputMethod_attach_Async_0300';
      let show_keyboard: ESObject = 0;
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }
      let CallBack = (error: BusinessError, data: ESObject) => {
        if (error) {
          console.info(`${CASE_NAME} execution fail,expect error: [${error.code}, ${error.message}]`);
          expectTrue(error.code === env.INVALID_INPUT_PARAMETER);
          done();
          return;
        } else {
          console.info(`${CASE_NAME} execution success, data: ${JSON.stringify(data)}`);
          expectFalse();
          done();
          return;
        }
      };
      try {
        inputMethod.getController().attach(show_keyboard, ATTRIBUTE, CallBack);
      } catch (error) {
        console.info(`${CASE_NAME} catch error, expect error: [${error.code}, ${error.message}]`);
        expectTrue(error.code === env.INVALID_INPUT_PARAMETER);
        done();
        return;
      }
    });

    /**
     * @tc.name   SUB_Misc_inputMethod_attach_Async_0400
     * @tc.number SUB_Misc_inputMethod_attach_Async_0400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Misc_inputMethod_attach_Async_0400', Level.LEVEL2, async (done: Function) => {
      const CASE_NAME = 'SUB_Misc_inputMethod_attach_Async_0400';
      let show_keyboard: ESObject = 1;
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }
      let CallBack = (error: BusinessError, data: ESObject) => {
        if (error) {
          console.info(`${CASE_NAME} execution fail,expect error: [${error.code}, ${error.message}]`);
          expectTrue(error.code === env.INVALID_INPUT_PARAMETER);
          done();
          return;
        } else {
          console.info(`${CASE_NAME} execution success, data: ${JSON.stringify(data)}`);
          expectFalse();
          done();
          return;
        }
      };
      try {
        inputMethod.getController().attach(show_keyboard, ATTRIBUTE, CallBack);
      } catch (error) {
        console.info(`${CASE_NAME} catch error, expect error: [${error.code}, ${error.message}]`);
        expectTrue(error.code === env.INVALID_INPUT_PARAMETER);
        done();
        return;
      }
    });

    /**
     * @tc.name   SUB_Misc_inputMethod_attach_Promise_0100
     * @tc.number SUB_Misc_inputMethod_attach_Promise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Misc_inputMethod_attach_Promise_0100', Level.LEVEL2, async (done: Function) => {
      const CASE_NAME = 'SUB_Misc_inputMethod_attach_Promise_0100';
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }
      try {
        let data = await inputMethod.getController().attach(true, ATTRIBUTE);
        console.info(`${CASE_NAME} execution success, data: ${JSON.stringify(data)}`);
        done();
        return;
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
    });

    /**
     * @tc.name   SUB_Misc_inputMethod_attach_Promise_0200
     * @tc.number SUB_Misc_inputMethod_attach_Promise_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Misc_inputMethod_attach_Promise_0200', Level.LEVEL2, async (done: Function) => {
      const CASE_NAME = 'SUB_Misc_inputMethod_attach_Promise_0200';
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }
      try {
        let data = await inputMethod.getController().attach(false, ATTRIBUTE);
        console.info(`${CASE_NAME} execution success, data: ${JSON.stringify(data)}`);
        done();
        return;
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
    });


    /**
     * @tc.name   SUB_Misc_inputMethod_attach_Promise_0300
     * @tc.number SUB_Misc_inputMethod_attach_Promise_0300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Misc_inputMethod_attach_Promise_0300', Level.LEVEL2, async (done: Function) => {
      const CASE_NAME = 'SUB_Misc_inputMethod_attach_Promise_0300';
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }
      let show_keyboard: ESObject = 0;
      try {
        let data = await inputMethod.getController().attach(show_keyboard, ATTRIBUTE);
        console.info(`${CASE_NAME} execution success, data: ${JSON.stringify(data)}`);
        expectFalse();
        done();
        return;
      } catch (error) {
        console.info(`${CASE_NAME} catch error, except error: [${error.code}, ${error.message}]`);
        expectTrue(error.code === env.INVALID_INPUT_PARAMETER);
        done();
        return;
      }
    });

    /**
     * @tc.name   SUB_Misc_inputMethod_attach_Promise_0400
     * @tc.number SUB_Misc_inputMethod_attach_Promise_0400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Misc_inputMethod_attach_Promise_0400', Level.LEVEL2, async (done: Function) => {
      const CASE_NAME = 'SUB_Misc_inputMethod_attach_Promise_0400';
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }
      let show_keyboard: ESObject = 1;
      try {
        let data = await inputMethod.getController().attach(show_keyboard, ATTRIBUTE);
        console.info(`${CASE_NAME} execution success, data: ${JSON.stringify(data)}`);
        expectFalse();
        done();
        return;
      } catch (error) {
        console.info(`${CASE_NAME} catch error, except error: [${error.code}, ${error.message}]`);
        expectTrue(error.code === env.INVALID_INPUT_PARAMETER);
        done();
        return;
      }
    });

    /**
     * @tc.name   SUB_Misc_inputMethod_attach_Promise_0500
     * @tc.number SUB_Misc_inputMethod_attach_Promise_0500
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Misc_inputMethod_attach_Promise_0500', Level.LEVEL2, async (done: Function) => {
      const CASE_NAME = 'SUB_Misc_inputMethod_attach_Promise_0500';
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }
      const SHOW_KEYBOARD: ESObject = 'aa';
      try {
        let data = await inputMethod.getController().attach(SHOW_KEYBOARD, ATTRIBUTE);
        console.info(`${CASE_NAME} execution success, data: ${JSON.stringify(data)}`);
        expectFalse();
        done();
        return;
      } catch (error) {
        console.info(`${CASE_NAME} catch error, except error: [${error.code}, ${error.message}]`);
        expectTrue(error.code === env.INVALID_INPUT_PARAMETER);
        done();
        return;
      }
    });

    /**
     * @tc.name   SUB_Misc_inputMethod_attach_Promise_0700
     * @tc.number SUB_Misc_inputMethod_attach_Promise_0700
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Misc_inputMethod_attach_Promise_0700', Level.LEVEL2, async (done: Function) => {
      const CASE_NAME = 'SUB_Misc_inputMethod_attach_Promise_0700';
      const ATTRIBUTE: ESObject = 'aa';
      try {
        let data = await inputMethod.getController().attach(true, ATTRIBUTE);
        console.info(`${CASE_NAME} execution success, data: ${JSON.stringify(data)}`);
        expectFalse();
        done();
        return;
      } catch (error) {
        console.info(`${CASE_NAME} catch error, except error: [${error.code}, ${error.message}]`);
        expectTrue(error.code === env.INVALID_INPUT_PARAMETER);
        done();
        return;
      }
    });

    /**
     * @tc.name   SUB_Misc_inputMethod_attach_Promise_1000
     * @tc.number SUB_Misc_inputMethod_attach_Promise_1000
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Misc_inputMethod_attach_Promise_1000', Level.LEVEL0, async (done: Function) => {
      const CASE_NAME = 'SUB_Misc_inputMethod_attach_Promise_1000';
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }
      try {
        let data = await inputMethod.getController().attach(true, ATTRIBUTE, env.INVALID_TYPE_STRING_A);
        console.info(`${CASE_NAME} execution success, data: ${JSON.stringify(data)}`);
        done();
        return;
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
    });

    /**
     * @tc.name   inputMethod_test_stopInputSession_0011
     * @tc.number inputMethod_test_stopInputSession_0011
     * @tc.desc   Stop input().interfaces.Callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('inputMethod_test_stopInputSession_0011', Level.LEVEL3, async (done: Function) => {
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }
      let inputMethodCtrl = inputMethod.getInputMethodController();
      await inputMethod.getController().attach(false, ATTRIBUTE);
      console.info("====>inputMethod_test_stopInputSession_0011 attach success");
      console.info("====>inputMethod_test_stopInputSession_0011 result:" + JSON.stringify(inputMethodCtrl));
      inputMethodCtrl.stopInputSession((err, res) => {
        try {
          if (err) {
            console.error(`====>Failed to stopInput: rrCode:${err.code}, errMessage is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(`====>inputMethod_test_stopInputSession_0011 stopInput result: ${res}`);
            expect(res).assertTrue();
            done();
          }
        } catch (err) {
          console.info(`====>inputMethod_test_stopInputSession_0011 stopInput throw err errCode:${err.code}, errMessage is ${err.message}`);
          expect().assertFail();
          done();
        }
      });
    });

    /**
     * @tc.name   inputMethod_test_stopInputSession_0021
     * @tc.number inputMethod_test_stopInputSession_0021
     * @tc.desc   Stop input().interfaces.Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('inputMethod_test_stopInputSession_0021', Level.LEVEL3, async (done: Function) => {
      let inputMethodCtrl = inputMethod.getInputMethodController();
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }
      await inputMethod.getController().attach(false, ATTRIBUTE);
      console.info("====>inputMethod_test_stopInputSession_0021 attach success");
      try {
        let res = await inputMethodCtrl.stopInputSession()
        console.info(`====>inputMethod_test_stopInputSession_0021 stopInput result: ${res}`);
        expect(res).assertTrue();
        await inputMethod.getController().detach();
        done();
      } catch (err) {
        console.info(`====>inputMethod_test_stopInputSession_0021 errCode:${err.code}, errMessage is ${err.message}`)
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   inputmethoh_test_0051
     * @tc.number inputmethoh_test_0051
     * @tc.desc   Stop input().interfaces.Callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('inputmethoh_test_0051', Level.LEVEL3, async (done: Function) => {
      let inputMethodCtrl = inputMethod.getInputMethodController();
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }
      await inputMethod.getController().attach(false, ATTRIBUTE);
      console.info("====>inputmethoh_test_0051 attach success");
      console.info("====>inputmethoh_test_0051 result:" + JSON.stringify(inputMethodCtrl));
      inputMethodCtrl.stopInput((err, res) => {
        try {
          if (err) {
            console.error(`====>Failed to stopInput: rrCode:${err.code}, errMessage is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(`====>inputmethoh_test_0051 stopInput result: ${res}`);
            expect(res).assertTrue();
            done();
          }
        } catch (err) {
          console.info(`====>inputmethoh_test_0051 stopInput throw err errCode:${err.code}, errMessage is ${err.message}`);
          expect().assertFail();
          done();
        }
      });
    });

    /**
     * @tc.name   inputmethoh_test_0061
     * @tc.number inputmethoh_test_0061
     * @tc.desc   Stop input().interfaces.Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('inputmethoh_test_0061', Level.LEVEL3, async (done: Function) => {
      let inputMethodCtrl = inputMethod.getInputMethodController();
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }
      await inputMethod.getController().attach(false, ATTRIBUTE);
      console.info("====>inputmethoh_test_0061 attach success");
      try {
        let res = await inputMethodCtrl.stopInput()
        console.info(`====>inputmethoh_test_0061 stopInput result: ${res}`);
        expect(res).assertTrue();
        await inputMethod.getController().detach();
        done();
      } catch (err) {
        console.info(`====>inputmethoh_test_0061 errCode:${err.code}, errMessage is ${err.message}`)
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_MultiScreenCollaboration_1401
     * @tc.number Sub_InputMethod_IMF_MultiScreenCollaboration_1401
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_MultiScreenCollaboration_1401', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_MultiScreenCollaboration_1401';
      let uiContext = AppStorage.get<UIContext>("uiContext") as UIContext;
      console.info(`${CASE_NAME} UIContext is ${uiContext}`);
      let inputAttribute: inputMethod.InputAttribute = {
        textInputType: inputMethod.TextInputType.TEXT,
        enterKeyType: inputMethod.EnterKeyType.GO
      }
      let textConfig: inputMethod.TextConfig = { inputAttribute: inputAttribute };
      try {
        await inputMethod.getController().attachWithUIContext(uiContext, textConfig);
        console.info(`${CASE_NAME} attachWithUIContext success `);
        expect(textConfig !== null).assertTrue();
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_MultiScreenCollaboration_1400
     * @tc.number Sub_InputMethod_IMF_MultiScreenCollaboration_1400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_MultiScreenCollaboration_1400', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_MultiScreenCollaboration_1400';
      let uiContext = AppStorage.get<UIContext>("uiContext") as UIContext;
      console.info(`${CASE_NAME} UIContext is ${uiContext}`);
      let inputAttribute: inputMethod.InputAttribute = {
        textInputType: inputMethod.TextInputType.TEXT,
        enterKeyType: inputMethod.EnterKeyType.GO
      }
      let textConfig: inputMethod.TextConfig = { inputAttribute: inputAttribute };
      let attachOptions: inputMethod.AttachOptions = {
        requestKeyboardReason: inputMethod.RequestKeyboardReason.NONE,
        showKeyboard: true
      };
      try {
        await inputMethod.getController().attachWithUIContext(uiContext, textConfig, attachOptions);
        console.info(`${CASE_NAME} attachWithUIContext success `);
        expect(textConfig !== null).assertTrue();
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_AttachCallback_0100
     * @tc.number Sub_InputMethod_IMF_AttachCallback_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_AttachCallback_0100', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_AttachCallback_0100';
      let CallBack = (error: BusinessError, data: ESObject) => {
        console.info(`${CASE_NAME} CallBack success, error: ${error}`);
        expect().assertFail();
        done();
      };
      try {
        inputMethod.getController().attach(true, null, CallBack);
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect(error.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_AttachCallback_0200
     * @tc.number Sub_InputMethod_IMF_AttachCallback_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_AttachCallback_0200', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_AttachCallback_0200';
      let CallBack = (error: BusinessError, data: ESObject) => {
        console.info(`${CASE_NAME} CallBack success, error: ${error}`);
        expect().assertFail();
        done();
      };
      try {
        inputMethod.getController().attach(true, undefined, CallBack);
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect(error.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_AttachCallback_0300
     * @tc.number Sub_InputMethod_IMF_AttachCallback_0300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_AttachCallback_0300', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_AttachCallback_0300';
      let CallBack = (error: BusinessError, data: ESObject) => {
        console.info(`${CASE_NAME} CallBack success, error: ${error}`);
        expect(error).assertEqual(undefined);
        done();
      };
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: inputMethod.TextInputType.NONE, enterKeyType: inputMethod.EnterKeyType.NONE, placeholder: '', abilityName: ''
        },
        newEditBox: true,
        capitalizeMode: inputMethod.CapitalizeMode.NONE
      };
      try {
        inputMethod.getController().attach(true, ATTRIBUTE, CallBack);
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_AttachCallback_0400
     * @tc.number Sub_InputMethod_IMF_AttachCallback_0400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_AttachCallback_0400', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_AttachCallback_0400';
      let CallBack = (error: BusinessError, data: ESObject) => {
        console.info(`${CASE_NAME} CallBack success, error: ${error}`);
        expect(error).assertEqual(undefined);
        done();
      };
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: inputMethod.TextInputType.MULTILINE, enterKeyType: inputMethod.EnterKeyType.GO
        },
        newEditBox: false,
        capitalizeMode: inputMethod.CapitalizeMode.SENTENCES
      };
      try {
        inputMethod.getController().attach(true, ATTRIBUTE, CallBack);
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_AttachCallback_0500
     * @tc.number Sub_InputMethod_IMF_AttachCallback_0500
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_AttachCallback_0500', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_AttachCallback_0500';
      let CallBack = (error: BusinessError, data: ESObject) => {
        console.info(`${CASE_NAME} CallBack success, error: ${error}`);
        expect(error).assertEqual(undefined);
        done();
      };
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: inputMethod.TextInputType.NUMBER, enterKeyType: inputMethod.EnterKeyType.SEARCH
        },
        newEditBox: true,
        capitalizeMode: inputMethod.CapitalizeMode.WORDS
      };
      try {
        inputMethod.getController().attach(true, ATTRIBUTE, CallBack);
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_AttachCallback_0600
     * @tc.number Sub_InputMethod_IMF_AttachCallback_0600
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_AttachCallback_0600', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_AttachCallback_0600';
      let CallBack = (error: BusinessError, data: ESObject) => {
        console.info(`${CASE_NAME} CallBack success, error: ${error}`);
        expect(error).assertEqual(undefined);
        done();
      };
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: inputMethod.TextInputType.PHONE, enterKeyType: inputMethod.EnterKeyType.SEND
        },
        newEditBox: true,
        capitalizeMode: inputMethod.CapitalizeMode.CHARACTERS
      };
      try {
        inputMethod.getController().attach(true, ATTRIBUTE, CallBack);
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_AttachCallback_0700
     * @tc.number Sub_InputMethod_IMF_AttachCallback_0700
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_AttachCallback_0700', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_AttachCallback_0700';
      let CallBack = (error: BusinessError, data: ESObject) => {
        console.info(`${CASE_NAME} CallBack success, error: ${error}`);
        expect(error).assertEqual(undefined);
        done();
      };
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: inputMethod.TextInputType.DATETIME, enterKeyType: inputMethod.EnterKeyType.NEXT
        }
      };
      try {
        inputMethod.getController().attach(true, ATTRIBUTE, CallBack);
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_AttachCallback_0800
     * @tc.number Sub_InputMethod_IMF_AttachCallback_0800
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_AttachCallback_0800', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_AttachCallback_0800';
      let CallBack = (error: BusinessError, data: ESObject) => {
        console.info(`${CASE_NAME} CallBack success, error: ${error}`);
        expect(error).assertEqual(undefined);
        done();
      };
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: inputMethod.TextInputType.EMAIL_ADDRESS, enterKeyType: inputMethod.EnterKeyType.DONE
        }
      };
      try {
        inputMethod.getController().attach(true, ATTRIBUTE, CallBack);
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_AttachCallback_0900
     * @tc.number Sub_InputMethod_IMF_AttachCallback_0900
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_AttachCallback_0900', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_AttachCallback_0900';
      let CallBack = (error: BusinessError, data: ESObject) => {
        console.info(`${CASE_NAME} CallBack success, error: ${error}`);
        expect(error).assertEqual(undefined);
        done();
      };
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: inputMethod.TextInputType.URL, enterKeyType: inputMethod.EnterKeyType.PREVIOUS
        }
      };
      try {
        inputMethod.getController().attach(true, ATTRIBUTE, CallBack);
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_AttachCallback_1000
     * @tc.number Sub_InputMethod_IMF_AttachCallback_1000
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_AttachCallback_1000', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_AttachCallback_1000';
      let CallBack = (error: BusinessError, data: ESObject) => {
        console.info(`${CASE_NAME} CallBack success, error: ${error}`);
        expect(error).assertEqual(undefined);
        done();
      };
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: inputMethod.TextInputType.VISIBLE_PASSWORD, enterKeyType: inputMethod.EnterKeyType.NEWLINE
        }
      };
      try {
        inputMethod.getController().attach(true, ATTRIBUTE, CallBack);
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_AttachCallback_1100
     * @tc.number Sub_InputMethod_IMF_AttachCallback_1100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_AttachCallback_1100', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_AttachCallback_1100';
      let CallBack = (error: BusinessError, data: ESObject) => {
        console.info(`${CASE_NAME} CallBack success, error: ${error}`);
        expect(error).assertEqual(undefined);
        done();
      };
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: inputMethod.TextInputType.NUMBER_PASSWORD, enterKeyType: inputMethod.EnterKeyType.NEWLINE
        }
      };
      try {
        inputMethod.getController().attach(true, ATTRIBUTE, CallBack);
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_AttachCallback_1200
     * @tc.number Sub_InputMethod_IMF_AttachCallback_1200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_AttachCallback_1200', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_AttachCallback_1200';
      let CallBack = (error: BusinessError, data: ESObject) => {
        console.info(`${CASE_NAME} CallBack success, error: ${error}`);
        expect(error).assertEqual(undefined);
        done();
      };
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: inputMethod.TextInputType.SCREEN_LOCK_PASSWORD, enterKeyType: inputMethod.EnterKeyType.NEWLINE
        }
      };
      try {
        inputMethod.getController().attach(true, ATTRIBUTE, CallBack);
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_AttachCallback_1300
     * @tc.number Sub_InputMethod_IMF_AttachCallback_1300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_AttachCallback_1300', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_AttachCallback_1300';
      let CallBack = (error: BusinessError, data: ESObject) => {
        console.info(`${CASE_NAME} CallBack success, error: ${error}`);
        expect(error).assertEqual(undefined);
        done();
      };
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: inputMethod.TextInputType.USER_NAME, enterKeyType: inputMethod.EnterKeyType.NEWLINE
        }
      };
      try {
        inputMethod.getController().attach(true, ATTRIBUTE, CallBack);
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_AttachCallback_1400
     * @tc.number Sub_InputMethod_IMF_AttachCallback_1400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_AttachCallback_1400', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_AttachCallback_1400';
      let CallBack = (error: BusinessError, data: ESObject) => {
        console.info(`${CASE_NAME} CallBack success, error: ${error}`);
        expect(error).assertEqual(undefined);
        done();
      };
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: inputMethod.TextInputType.NEW_PASSWORD, enterKeyType: inputMethod.EnterKeyType.NEWLINE
        }
      };
      try {
        inputMethod.getController().attach(true, ATTRIBUTE, CallBack);
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_AttachCallback_1500
     * @tc.number Sub_InputMethod_IMF_AttachCallback_1500
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_AttachCallback_1500', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_AttachCallback_1500';
      let CallBack = (error: BusinessError, data: ESObject) => {
        console.info(`${CASE_NAME} CallBack success, error: ${error}`);
        expect(error).assertEqual(undefined);
        done();
      };
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: inputMethod.TextInputType.NUMBER_DECIMAL, enterKeyType: inputMethod.EnterKeyType.NEWLINE
        }
      };
      try {
        inputMethod.getController().attach(true, ATTRIBUTE, CallBack);
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_AttachCallback_1600
     * @tc.number Sub_InputMethod_IMF_AttachCallback_1600
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_AttachCallback_1600', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_AttachCallback_1600';
      let CallBack = (error: BusinessError, data: ESObject) => {
        console.info(`${CASE_NAME} CallBack success, error: ${error}`);
        expect(error).assertEqual(undefined);
        done();
      };
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: inputMethod.TextInputType.ONE_TIME_CODE, enterKeyType: inputMethod.EnterKeyType.NEWLINE
        }
      };
      try {
        inputMethod.getController().attach(true, ATTRIBUTE, CallBack);
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_AttachPromise_0100
     * @tc.number Sub_InputMethod_IMF_AttachPromise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_AttachPromise_0100', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_AttachPromise_0100';
      try {
        await inputMethod.getController().attach(true, null);
        console.info(`${CASE_NAME} attach success`);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect(error.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_AttachPromise_0200
     * @tc.number Sub_InputMethod_IMF_AttachPromise_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_AttachPromise_0200', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_AttachPromise_0200';
      try {
        await inputMethod.getController().attach(true, undefined);
        console.info(`${CASE_NAME} attach success`);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect(error.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_AttachPromise_0300
     * @tc.number Sub_InputMethod_IMF_AttachPromise_0300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_AttachPromise_0300', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_AttachPromise_0300';
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: inputMethod.TextInputType.NONE, enterKeyType: inputMethod.EnterKeyType.NONE, placeholder: '', abilityName: ''
        },
        newEditBox: true,
        capitalizeMode: inputMethod.CapitalizeMode.NONE
      };
      try {
        await inputMethod.getController().attach(true, ATTRIBUTE);
        console.info(`${CASE_NAME} attach success`);
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_AttachPromise_0400
     * @tc.number Sub_InputMethod_IMF_AttachPromise_0400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_AttachPromise_0400', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_AttachPromise_0400';
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: inputMethod.TextInputType.MULTILINE, enterKeyType: inputMethod.EnterKeyType.GO
        },
        newEditBox: false,
        capitalizeMode: inputMethod.CapitalizeMode.SENTENCES
      };
      try {
        await inputMethod.getController().attach(true, ATTRIBUTE);
        console.info(`${CASE_NAME} attach success`);
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_AttachPromise_0500
     * @tc.number Sub_InputMethod_IMF_AttachPromise_0500
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_AttachPromise_0500', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_AttachPromise_0500';
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: inputMethod.TextInputType.NUMBER, enterKeyType: inputMethod.EnterKeyType.SEARCH
        },
        newEditBox: true,
        capitalizeMode: inputMethod.CapitalizeMode.WORDS
      };
      try {
        await inputMethod.getController().attach(true, ATTRIBUTE);
        console.info(`${CASE_NAME} attach success`);
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_AttachPromise_0600
     * @tc.number Sub_InputMethod_IMF_AttachPromise_0600
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_AttachPromise_0600', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_AttachPromise_0600';
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: inputMethod.TextInputType.PHONE, enterKeyType: inputMethod.EnterKeyType.SEND
        },
        newEditBox: true,
        capitalizeMode: inputMethod.CapitalizeMode.CHARACTERS
      };
      try {
        await inputMethod.getController().attach(true, ATTRIBUTE);
        console.info(`${CASE_NAME} attach success`);
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_AttachPromise_0700
     * @tc.number Sub_InputMethod_IMF_AttachPromise_0700
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_AttachPromise_0700', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_AttachPromise_0700';
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: inputMethod.TextInputType.DATETIME, enterKeyType: inputMethod.EnterKeyType.NEXT
        }
      };
      try {
        await inputMethod.getController().attach(true, ATTRIBUTE);
        console.info(`${CASE_NAME} attach success`);
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_AttachPromise_0800
     * @tc.number Sub_InputMethod_IMF_AttachPromise_0800
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_AttachPromise_0800', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_AttachPromise_0800';
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: inputMethod.TextInputType.EMAIL_ADDRESS, enterKeyType: inputMethod.EnterKeyType.DONE
        }
      };
      try {
        await inputMethod.getController().attach(true, ATTRIBUTE);
        console.info(`${CASE_NAME} attach success`);
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_AttachPromise_0900
     * @tc.number Sub_InputMethod_IMF_AttachPromise_0900
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_AttachPromise_0900', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_AttachPromise_0900';
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: inputMethod.TextInputType.URL, enterKeyType: inputMethod.EnterKeyType.PREVIOUS
        }
      };
      try {
        await inputMethod.getController().attach(true, ATTRIBUTE);
        console.info(`${CASE_NAME} attach success`);
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_AttachPromise_1000
     * @tc.number Sub_InputMethod_IMF_AttachPromise_1000
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_AttachPromise_1000', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_AttachPromise_1000';
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: inputMethod.TextInputType.VISIBLE_PASSWORD, enterKeyType: inputMethod.EnterKeyType.NEWLINE
        }
      };
      try {
        await inputMethod.getController().attach(true, ATTRIBUTE);
        console.info(`${CASE_NAME} attach success`);
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_AttachPromise_1100
     * @tc.number Sub_InputMethod_IMF_AttachPromise_1100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_AttachPromise_1100', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_AttachPromise_1100';
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: inputMethod.TextInputType.NUMBER_PASSWORD, enterKeyType: inputMethod.EnterKeyType.NEWLINE
        }
      };
      try {
        await inputMethod.getController().attach(true, ATTRIBUTE);
        console.info(`${CASE_NAME} attach success`);
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_AttachPromise_1200
     * @tc.number Sub_InputMethod_IMF_AttachPromise_1200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_AttachPromise_1200', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_AttachPromise_1200';
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: inputMethod.TextInputType.SCREEN_LOCK_PASSWORD, enterKeyType: inputMethod.EnterKeyType.NEWLINE
        }
      };
      try {
        await inputMethod.getController().attach(true, ATTRIBUTE);
        console.info(`${CASE_NAME} attach success`);
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_AttachPromise_1300
     * @tc.number Sub_InputMethod_IMF_AttachPromise_1300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_AttachPromise_1300', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_AttachPromise_1300';
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: inputMethod.TextInputType.USER_NAME, enterKeyType: inputMethod.EnterKeyType.NEWLINE
        }
      };
      try {
        await inputMethod.getController().attach(true, ATTRIBUTE);
        console.info(`${CASE_NAME} attach success`);
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_AttachPromise_1400
     * @tc.number Sub_InputMethod_IMF_AttachPromise_1400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_AttachPromise_1400', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_AttachPromise_1400';
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: inputMethod.TextInputType.NEW_PASSWORD, enterKeyType: inputMethod.EnterKeyType.NEWLINE
        }
      };
      try {
        await inputMethod.getController().attach(true, ATTRIBUTE);
        console.info(`${CASE_NAME} attach success`);
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_AttachPromise_1500
     * @tc.number Sub_InputMethod_IMF_AttachPromise_1500
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_AttachPromise_1500', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_AttachPromise_1500';
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: inputMethod.TextInputType.NUMBER_DECIMAL, enterKeyType: inputMethod.EnterKeyType.NEWLINE
        }
      };
      try {
        await inputMethod.getController().attach(true, ATTRIBUTE);
        console.info(`${CASE_NAME} attach success`);
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_AttachPromise_1600
     * @tc.number Sub_InputMethod_IMF_AttachPromise_1600
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_AttachPromise_1600', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_AttachPromise_1600';
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: inputMethod.TextInputType.ONE_TIME_CODE, enterKeyType: inputMethod.EnterKeyType.NEWLINE
        }
      };
      try {
        await inputMethod.getController().attach(true, ATTRIBUTE);
        console.info(`${CASE_NAME} attach success`);
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_AttachPromise_1700
     * @tc.number Sub_InputMethod_IMF_AttachPromise_1700
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_AttachPromise_1700', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_AttachPromise_1700';
      try {
        await inputMethod.getController().attach(true, null, inputMethod.RequestKeyboardReason.NONE);
        console.info(`${CASE_NAME} attach success`);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect(error.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_AttachPromise_1800
     * @tc.number Sub_InputMethod_IMF_AttachPromise_1800
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_AttachPromise_1800', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_AttachPromise_1800';
      try {
        await inputMethod.getController().attach(true, undefined, inputMethod.RequestKeyboardReason.NONE);
        console.info(`${CASE_NAME} attach success`);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect(error.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_AttachPromise_1900
     * @tc.number Sub_InputMethod_IMF_AttachPromise_1900
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_AttachPromise_1900', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_AttachPromise_1900';
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: inputMethod.TextInputType.NONE, enterKeyType: inputMethod.EnterKeyType.NONE, placeholder: '', abilityName: ''
        },
        newEditBox: true,
        capitalizeMode: inputMethod.CapitalizeMode.NONE
      };
      try {
        await inputMethod.getController().attach(true, ATTRIBUTE, inputMethod.RequestKeyboardReason.NONE);
        console.info(`${CASE_NAME} attach success`);
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_AttachPromise_2000
     * @tc.number Sub_InputMethod_IMF_AttachPromise_2000
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_AttachPromise_2000', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_AttachPromise_2000';
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: inputMethod.TextInputType.MULTILINE, enterKeyType: inputMethod.EnterKeyType.GO
        },
        newEditBox: false,
        capitalizeMode: inputMethod.CapitalizeMode.SENTENCES
      };
      try {
        await inputMethod.getController().attach(true, ATTRIBUTE, inputMethod.RequestKeyboardReason.NONE);
        console.info(`${CASE_NAME} attach success`);
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_AttachPromise_2100
     * @tc.number Sub_InputMethod_IMF_AttachPromise_2100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_AttachPromise_2100', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_AttachPromise_2100';
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: inputMethod.TextInputType.NUMBER, enterKeyType: inputMethod.EnterKeyType.SEARCH
        },
        newEditBox: true,
        capitalizeMode: inputMethod.CapitalizeMode.WORDS
      };
      try {
        await inputMethod.getController().attach(true, ATTRIBUTE, inputMethod.RequestKeyboardReason.NONE);
        console.info(`${CASE_NAME} attach success`);
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_AttachPromise_2200
     * @tc.number Sub_InputMethod_IMF_AttachPromise_2200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_AttachPromise_2200', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_AttachPromise_2200';
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: inputMethod.TextInputType.PHONE, enterKeyType: inputMethod.EnterKeyType.SEND
        },
        newEditBox: true,
        capitalizeMode: inputMethod.CapitalizeMode.CHARACTERS
      };
      try {
        await inputMethod.getController().attach(true, ATTRIBUTE, inputMethod.RequestKeyboardReason.NONE);
        console.info(`${CASE_NAME} attach success`);
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_AttachPromise_2300
     * @tc.number Sub_InputMethod_IMF_AttachPromise_2300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_AttachPromise_2300', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_AttachPromise_2300';
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: inputMethod.TextInputType.DATETIME, enterKeyType: inputMethod.EnterKeyType.NEXT
        }
      };
      try {
        await inputMethod.getController().attach(true, ATTRIBUTE, inputMethod.RequestKeyboardReason.NONE);
        console.info(`${CASE_NAME} attach success`);
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_AttachPromise_2400
     * @tc.number Sub_InputMethod_IMF_AttachPromise_2400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_AttachPromise_2400', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_AttachPromise_2400';
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: inputMethod.TextInputType.EMAIL_ADDRESS, enterKeyType: inputMethod.EnterKeyType.DONE
        }
      };
      try {
        await inputMethod.getController().attach(true, ATTRIBUTE, inputMethod.RequestKeyboardReason.NONE);
        console.info(`${CASE_NAME} attach success`);
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_AttachPromise_2500
     * @tc.number Sub_InputMethod_IMF_AttachPromise_2500
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_AttachPromise_2500', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_AttachPromise_2500';
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: inputMethod.TextInputType.URL, enterKeyType: inputMethod.EnterKeyType.PREVIOUS
        }
      };
      try {
        await inputMethod.getController().attach(true, ATTRIBUTE, inputMethod.RequestKeyboardReason.NONE);
        console.info(`${CASE_NAME} attach success`);
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_AttachPromise_2600
     * @tc.number Sub_InputMethod_IMF_AttachPromise_2600
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_AttachPromise_2600', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_AttachPromise_2600';
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: inputMethod.TextInputType.VISIBLE_PASSWORD, enterKeyType: inputMethod.EnterKeyType.NEWLINE
        }
      };
      try {
        await inputMethod.getController().attach(true, ATTRIBUTE, inputMethod.RequestKeyboardReason.NONE);
        console.info(`${CASE_NAME} attach success`);
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_AttachPromise_2700
     * @tc.number Sub_InputMethod_IMF_AttachPromise_2700
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_AttachPromise_2700', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_AttachPromise_2700';
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: inputMethod.TextInputType.NUMBER_PASSWORD, enterKeyType: inputMethod.EnterKeyType.NEWLINE
        }
      };
      try {
        await inputMethod.getController().attach(true, ATTRIBUTE, inputMethod.RequestKeyboardReason.NONE);
        console.info(`${CASE_NAME} attach success`);
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_AttachPromise_2800
     * @tc.number Sub_InputMethod_IMF_AttachPromise_2800
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_AttachPromise_2800', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_AttachPromise_2800';
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: inputMethod.TextInputType.SCREEN_LOCK_PASSWORD, enterKeyType: inputMethod.EnterKeyType.NEWLINE
        }
      };
      try {
        await inputMethod.getController().attach(true, ATTRIBUTE, inputMethod.RequestKeyboardReason.NONE);
        console.info(`${CASE_NAME} attach success`);
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_AttachPromise_2900
     * @tc.number Sub_InputMethod_IMF_AttachPromise_2900
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_AttachPromise_2900', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_AttachPromise_2900';
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: inputMethod.TextInputType.USER_NAME, enterKeyType: inputMethod.EnterKeyType.NEWLINE
        }
      };
      try {
        await inputMethod.getController().attach(true, ATTRIBUTE, inputMethod.RequestKeyboardReason.NONE);
        console.info(`${CASE_NAME} attach success`);
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_AttachPromise_3000
     * @tc.number Sub_InputMethod_IMF_AttachPromise_3000
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_AttachPromise_3000', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_AttachPromise_3000';
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: inputMethod.TextInputType.NEW_PASSWORD, enterKeyType: inputMethod.EnterKeyType.NEWLINE
        }
      };
      try {
        await inputMethod.getController().attach(true, ATTRIBUTE, inputMethod.RequestKeyboardReason.NONE);
        console.info(`${CASE_NAME} attach success`);
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_AttachPromise_3100
     * @tc.number Sub_InputMethod_IMF_AttachPromise_3100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_AttachPromise_3100', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_AttachPromise_3100';
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: inputMethod.TextInputType.NUMBER_DECIMAL, enterKeyType: inputMethod.EnterKeyType.NEWLINE
        }
      };
      try {
        await inputMethod.getController().attach(true, ATTRIBUTE, inputMethod.RequestKeyboardReason.NONE);
        console.info(`${CASE_NAME} attach success`);
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_AttachPromise_3200
     * @tc.number Sub_InputMethod_IMF_AttachPromise_3200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_AttachPromise_3200', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_AttachPromise_3200';
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: inputMethod.TextInputType.ONE_TIME_CODE, enterKeyType: inputMethod.EnterKeyType.NEWLINE
        }
      };
      try {
        await inputMethod.getController().attach(true, ATTRIBUTE, inputMethod.RequestKeyboardReason.NONE);
        console.info(`${CASE_NAME} attach success`);
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_attachWithUIContextPromise_0100
     * @tc.number Sub_InputMethod_IMF_attachWithUIContextPromise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_attachWithUIContextPromise_0100', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_attachWithUIContextPromise_0100';
      try {
        let inputAttribute: inputMethod.InputAttribute = {
          textInputType: inputMethod.TextInputType.TEXT,
          enterKeyType: inputMethod.EnterKeyType.UNSPECIFIED
        }
        let textConfig: inputMethod.TextConfig = { inputAttribute: inputAttribute };
        let attachOptions: inputMethod.AttachOptions = {
          requestKeyboardReason: inputMethod.RequestKeyboardReason.NONE,
          showKeyboard: true
        };
        await inputMethod.getController().attachWithUIContext(null, textConfig, attachOptions);
        console.info(`${CASE_NAME} attach success`);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect(error.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_attachWithUIContextPromise_0200
     * @tc.number Sub_InputMethod_IMF_attachWithUIContextPromise_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_attachWithUIContextPromise_0200', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_attachWithUIContextPromise_0200';
      try {
        let uiContext = AppStorage.get<UIContext>("uiContext") as UIContext;
        let attachOptions: inputMethod.AttachOptions = {
          requestKeyboardReason: inputMethod.RequestKeyboardReason.NONE,
          showKeyboard: true
        };
        await inputMethod.getController().attachWithUIContext(uiContext, null, attachOptions);
        console.info(`${CASE_NAME} attach success`);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect(error.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_attachWithUIContextPromise_0300
     * @tc.number Sub_InputMethod_IMF_attachWithUIContextPromise_0300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_attachWithUIContextPromise_0300', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_attachWithUIContextPromise_0300';
      try {
        let uiContext = AppStorage.get<UIContext>("uiContext") as UIContext;
        let inputAttribute: inputMethod.InputAttribute = {
          textInputType: inputMethod.TextInputType.TEXT,
          enterKeyType: inputMethod.EnterKeyType.GO
        }
        let textConfig: inputMethod.TextConfig = { inputAttribute: inputAttribute };
        await inputMethod.getController().attachWithUIContext(uiContext, textConfig, null);
        console.info(`${CASE_NAME} attach success`);
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_attachWithUIContextPromise_0400
     * @tc.number Sub_InputMethod_IMF_attachWithUIContextPromise_0400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_attachWithUIContextPromise_0400', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_attachWithUIContextPromise_0400';
      try {
        let inputAttribute: inputMethod.InputAttribute = {
          textInputType: inputMethod.TextInputType.TEXT,
          enterKeyType: inputMethod.EnterKeyType.GO
        }
        let textConfig: inputMethod.TextConfig = { inputAttribute: inputAttribute };
        let attachOptions: inputMethod.AttachOptions = {
          requestKeyboardReason: inputMethod.RequestKeyboardReason.NONE,
          showKeyboard: true
        };
        await inputMethod.getController().attachWithUIContext(undefined, textConfig, attachOptions);
        console.info(`${CASE_NAME} attach success`);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect(error.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_attachWithUIContextPromise_0500
     * @tc.number Sub_InputMethod_IMF_attachWithUIContextPromise_0500
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_attachWithUIContextPromise_0500', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_attachWithUIContextPromise_0500';
      try {
        let uiContext = AppStorage.get<UIContext>("uiContext") as UIContext;
        let attachOptions: inputMethod.AttachOptions = {
          requestKeyboardReason: inputMethod.RequestKeyboardReason.NONE,
          showKeyboard: true
        };
        await inputMethod.getController().attachWithUIContext(uiContext, undefined, attachOptions);
        console.info(`${CASE_NAME} attach success`);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect(error.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_attachWithUIContextPromise_0600
     * @tc.number Sub_InputMethod_IMF_attachWithUIContextPromise_0600
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_attachWithUIContextPromise_0600', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_attachWithUIContextPromise_0600';
      try {
        let uiContext = AppStorage.get<UIContext>("uiContext") as UIContext;
        let inputAttribute: inputMethod.InputAttribute = {
          textInputType: inputMethod.TextInputType.TEXT,
          enterKeyType: inputMethod.EnterKeyType.GO
        }
        let textConfig: inputMethod.TextConfig = { inputAttribute: inputAttribute };
        await inputMethod.getController().attachWithUIContext(uiContext, textConfig, undefined);
        console.info(`${CASE_NAME} attach success`);
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_attachWithUIContextPromise_0700
     * @tc.number Sub_InputMethod_IMF_attachWithUIContextPromise_0700
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_attachWithUIContextPromise_0700', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_attachWithUIContextPromise_0700';
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: inputMethod.TextInputType.NONE, enterKeyType: inputMethod.EnterKeyType.NONE, placeholder: '', abilityName: ''
        },
        newEditBox: true,
        capitalizeMode: inputMethod.CapitalizeMode.NONE
      };
      let uiContext = AppStorage.get<UIContext>("uiContext") as UIContext;
      let attachOptions: inputMethod.AttachOptions = {
        requestKeyboardReason: inputMethod.RequestKeyboardReason.MOUSE,
        showKeyboard: false
      };
      try {
        await inputMethod.getController().attachWithUIContext(uiContext, ATTRIBUTE, attachOptions);
        console.info(`${CASE_NAME} attach success`);
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_attachWithUIContextPromise_0800
     * @tc.number Sub_InputMethod_IMF_attachWithUIContextPromise_0800
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_attachWithUIContextPromise_0800', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_attachWithUIContextPromise_0800';
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: inputMethod.TextInputType.MULTILINE, enterKeyType: inputMethod.EnterKeyType.GO
        },
        newEditBox: false,
        capitalizeMode: inputMethod.CapitalizeMode.SENTENCES
      };
      let uiContext = AppStorage.get<UIContext>("uiContext") as UIContext;
      let attachOptions: inputMethod.AttachOptions = {
        requestKeyboardReason: inputMethod.RequestKeyboardReason.TOUCH,
        showKeyboard: false
      };
      try {
        await inputMethod.getController().attachWithUIContext(uiContext, ATTRIBUTE, attachOptions);
        console.info(`${CASE_NAME} attach success`);
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_attachWithUIContextPromise_0900
     * @tc.number Sub_InputMethod_IMF_attachWithUIContextPromise_0900
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_attachWithUIContextPromise_0900', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_attachWithUIContextPromise_0900';
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: inputMethod.TextInputType.NUMBER, enterKeyType: inputMethod.EnterKeyType.SEARCH
        },
        newEditBox: true,
        capitalizeMode: inputMethod.CapitalizeMode.WORDS
      };
      let uiContext = AppStorage.get<UIContext>("uiContext") as UIContext;
      let attachOptions: inputMethod.AttachOptions = {
        requestKeyboardReason: inputMethod.RequestKeyboardReason.OTHER,
        showKeyboard: false
      };
      try {
        await inputMethod.getController().attachWithUIContext(uiContext, ATTRIBUTE, attachOptions);
        console.info(`${CASE_NAME} attach success`);
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_attachWithUIContextPromise_1000
     * @tc.number Sub_InputMethod_IMF_attachWithUIContextPromise_1000
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_attachWithUIContextPromise_1000', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_attachWithUIContextPromise_1000';
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: inputMethod.TextInputType.PHONE, enterKeyType: inputMethod.EnterKeyType.SEND
        },
        newEditBox: true,
        capitalizeMode: inputMethod.CapitalizeMode.CHARACTERS
      };
      let uiContext = AppStorage.get<UIContext>("uiContext") as UIContext;
      let attachOptions: inputMethod.AttachOptions = {
        requestKeyboardReason: inputMethod.RequestKeyboardReason.TOUCH,
        showKeyboard: false
      };
      try {
        await inputMethod.getController().attachWithUIContext(uiContext, ATTRIBUTE, attachOptions);
        console.info(`${CASE_NAME} attach success`);
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_attachWithUIContextPromise_1100
     * @tc.number Sub_InputMethod_IMF_attachWithUIContextPromise_1100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_attachWithUIContextPromise_1100', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_attachWithUIContextPromise_1100';
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: inputMethod.TextInputType.DATETIME, enterKeyType: inputMethod.EnterKeyType.NEXT
        }
      };
      let uiContext = AppStorage.get<UIContext>("uiContext") as UIContext;
      let attachOptions: inputMethod.AttachOptions = {
        requestKeyboardReason: inputMethod.RequestKeyboardReason.TOUCH,
        showKeyboard: false
      };
      try {
        await inputMethod.getController().attachWithUIContext(uiContext, ATTRIBUTE, attachOptions);
        console.info(`${CASE_NAME} attach success`);
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_attachWithUIContextPromise_1200
     * @tc.number Sub_InputMethod_IMF_attachWithUIContextPromise_1200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_attachWithUIContextPromise_1200', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_attachWithUIContextPromise_1200';
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: inputMethod.TextInputType.EMAIL_ADDRESS, enterKeyType: inputMethod.EnterKeyType.DONE
        }
      };
      let uiContext = AppStorage.get<UIContext>("uiContext") as UIContext;
      let attachOptions: inputMethod.AttachOptions = {
        requestKeyboardReason: inputMethod.RequestKeyboardReason.TOUCH,
        showKeyboard: false
      };
      try {
        await inputMethod.getController().attachWithUIContext(uiContext, ATTRIBUTE, attachOptions);
        console.info(`${CASE_NAME} attach success`);
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_attachWithUIContextPromise_1300
     * @tc.number Sub_InputMethod_IMF_attachWithUIContextPromise_1300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_attachWithUIContextPromise_1300', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_attachWithUIContextPromise_1300';
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: inputMethod.TextInputType.URL, enterKeyType: inputMethod.EnterKeyType.PREVIOUS
        }
      };
      let uiContext = AppStorage.get<UIContext>("uiContext") as UIContext;
      let attachOptions: inputMethod.AttachOptions = {
        requestKeyboardReason: inputMethod.RequestKeyboardReason.TOUCH,
        showKeyboard: false
      };
      try {
        await inputMethod.getController().attachWithUIContext(uiContext, ATTRIBUTE, attachOptions);
        console.info(`${CASE_NAME} attach success`);
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_attachWithUIContextPromise_1400
     * @tc.number Sub_InputMethod_IMF_attachWithUIContextPromise_1400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_attachWithUIContextPromise_1400', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_attachWithUIContextPromise_1400';
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: inputMethod.TextInputType.VISIBLE_PASSWORD, enterKeyType: inputMethod.EnterKeyType.NEWLINE
        }
      };
      let uiContext = AppStorage.get<UIContext>("uiContext") as UIContext;
      let attachOptions: inputMethod.AttachOptions = {
        requestKeyboardReason: inputMethod.RequestKeyboardReason.TOUCH,
        showKeyboard: false
      };
      try {
        await inputMethod.getController().attachWithUIContext(uiContext, ATTRIBUTE, attachOptions);
        console.info(`${CASE_NAME} attach success`);
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_attachWithUIContextPromise_1500
     * @tc.number Sub_InputMethod_IMF_attachWithUIContextPromise_1500
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_attachWithUIContextPromise_1500', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_attachWithUIContextPromise_1500';
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: inputMethod.TextInputType.NUMBER_PASSWORD, enterKeyType: inputMethod.EnterKeyType.NEWLINE
        }
      };
      let uiContext = AppStorage.get<UIContext>("uiContext") as UIContext;
      let attachOptions: inputMethod.AttachOptions = {
        requestKeyboardReason: inputMethod.RequestKeyboardReason.TOUCH,
        showKeyboard: false
      };
      try {
        await inputMethod.getController().attachWithUIContext(uiContext, ATTRIBUTE, attachOptions);
        console.info(`${CASE_NAME} attach success`);
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_attachWithUIContextPromise_1600
     * @tc.number Sub_InputMethod_IMF_attachWithUIContextPromise_1600
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_attachWithUIContextPromise_1600', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_attachWithUIContextPromise_1600';
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: inputMethod.TextInputType.SCREEN_LOCK_PASSWORD, enterKeyType: inputMethod.EnterKeyType.NEWLINE
        }
      };
      let uiContext = AppStorage.get<UIContext>("uiContext") as UIContext;
      let attachOptions: inputMethod.AttachOptions = {
        requestKeyboardReason: inputMethod.RequestKeyboardReason.TOUCH,
        showKeyboard: false
      };
      try {
        await inputMethod.getController().attachWithUIContext(uiContext, ATTRIBUTE, attachOptions);
        console.info(`${CASE_NAME} attach success`);
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_attachWithUIContextPromise_1700
     * @tc.number Sub_InputMethod_IMF_attachWithUIContextPromise_1700
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_attachWithUIContextPromise_1700', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_attachWithUIContextPromise_1700';
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: inputMethod.TextInputType.USER_NAME, enterKeyType: inputMethod.EnterKeyType.NEWLINE
        }
      };
      let uiContext = AppStorage.get<UIContext>("uiContext") as UIContext;
      let attachOptions: inputMethod.AttachOptions = {
        requestKeyboardReason: inputMethod.RequestKeyboardReason.TOUCH,
        showKeyboard: false
      };
      try {
        await inputMethod.getController().attachWithUIContext(uiContext, ATTRIBUTE, attachOptions);
        console.info(`${CASE_NAME} attach success`);
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_attachWithUIContextPromise_1800
     * @tc.number Sub_InputMethod_IMF_attachWithUIContextPromise_1800
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_attachWithUIContextPromise_1800', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_attachWithUIContextPromise_1800';
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: inputMethod.TextInputType.NEW_PASSWORD, enterKeyType: inputMethod.EnterKeyType.NEWLINE
        }
      };
      let uiContext = AppStorage.get<UIContext>("uiContext") as UIContext;
      let attachOptions: inputMethod.AttachOptions = {
        requestKeyboardReason: inputMethod.RequestKeyboardReason.TOUCH,
        showKeyboard: false
      };
      try {
        await inputMethod.getController().attachWithUIContext(uiContext, ATTRIBUTE, attachOptions);
        console.info(`${CASE_NAME} attach success`);
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_attachWithUIContextPromise_1900
     * @tc.number Sub_InputMethod_IMF_attachWithUIContextPromise_1900
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_attachWithUIContextPromise_1900', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_attachWithUIContextPromise_1900';
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: inputMethod.TextInputType.NUMBER_DECIMAL, enterKeyType: inputMethod.EnterKeyType.NEWLINE
        }
      };
      let uiContext = AppStorage.get<UIContext>("uiContext") as UIContext;
      let attachOptions: inputMethod.AttachOptions = {
        requestKeyboardReason: inputMethod.RequestKeyboardReason.TOUCH,
        showKeyboard: false
      };
      try {
        await inputMethod.getController().attachWithUIContext(uiContext, ATTRIBUTE, attachOptions);
        console.info(`${CASE_NAME} attach success`);
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_attachWithUIContextPromise_2000
     * @tc.number Sub_InputMethod_IMF_attachWithUIContextPromise_2000
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_attachWithUIContextPromise_2000', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_attachWithUIContextPromise_2000';
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: inputMethod.TextInputType.ONE_TIME_CODE, enterKeyType: inputMethod.EnterKeyType.NEWLINE
        }
      };
      let uiContext = AppStorage.get<UIContext>("uiContext") as UIContext;
      let attachOptions: inputMethod.AttachOptions = {
        requestKeyboardReason: inputMethod.RequestKeyboardReason.TOUCH,
        showKeyboard: false
      };
      try {
        await inputMethod.getController().attachWithUIContext(uiContext, ATTRIBUTE, attachOptions);
        console.info(`${CASE_NAME} attach success`);
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

  })
}