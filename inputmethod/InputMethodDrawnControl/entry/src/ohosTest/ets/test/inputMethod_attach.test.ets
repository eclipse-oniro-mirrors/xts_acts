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

  })
}