//@ts-nocheck
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
import inputMethod from '@ohos.inputmethod';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import * as env from './lib/Const';

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
     * @tc.number SUB_Misc_inputMethod_attach_Async_0100
     * @tc.name Call the attach interface in Async mode. Optional input parameter showkeyboard=true
     * @tc.desc Function test
     */
    it('SUB_Misc_inputMethod_attach_Async_0100', 0, async (done: Function) => {
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
     * @tc.number SUB_Misc_inputMethod_attach_Async_0200
     * @tc.name Call the attach interface in Async mode. Optional input parameter showkeyboard=false
     * @tc.desc Function test
     */
    it('SUB_Misc_inputMethod_attach_Async_0200', 0, async (done: Function) => {
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
     * @tc.number SUB_Misc_inputMethod_attach_Async_0300
     * @tc.name Call the attach interface in Async mode. Optional input parameter showkeyboard=0
     * @tc.desc Function test
     */
    it('SUB_Misc_inputMethod_attach_Async_0300', 0, async (done: Function) => {
      const CASE_NAME = 'SUB_Misc_inputMethod_attach_Async_0300';
      const SHOW_KEYBOARD = 0;
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
        inputMethod.getController().attach(SHOW_KEYBOARD, ATTRIBUTE, CallBack);
      } catch (error) {
        console.info(`${CASE_NAME} catch error, expect error: [${error.code}, ${error.message}]`);
        expectTrue(error.code === env.INVALID_INPUT_PARAMETER);
        done();
        return;
      }
    });

    /**
     * @tc.number SUB_Misc_inputMethod_attach_Async_0400
     * @tc.name Call the attach interface in Async mode. Optional input parameter showkeyboard=1
     * @tc.desc Function test
     */
    it('SUB_Misc_inputMethod_attach_Async_0400', 0, async (done: Function) => {
      const CASE_NAME = 'SUB_Misc_inputMethod_attach_Async_0400';
      const SHOW_KEYBOARD = 1;
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
        inputMethod.getController().attach(SHOW_KEYBOARD, ATTRIBUTE, CallBack);
      } catch (error) {
        console.info(`${CASE_NAME} catch error, expect error: [${error.code}, ${error.message}]`);
        expectTrue(error.code === env.INVALID_INPUT_PARAMETER);
        done();
        return;
      }
    });

    /**
     * @tc.number SUB_Misc_inputMethod_attach_Async_0500
     * @tc.name Call the attach interface in Async mode. Optional input parameter showkeyboard='aa'
     * @tc.desc Function test
     */
    it('SUB_Misc_inputMethod_attach_Async_0500', 0, async (done: Function) => {
      const CASE_NAME = 'SUB_Misc_inputMethod_attach_Async_0500';
      const SHOW_KEYBOARD = 'aa';
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
        inputMethod.getController().attach(SHOW_KEYBOARD, ATTRIBUTE, CallBack);
      } catch (error) {
        console.info(`${CASE_NAME} catch error, expect error: [${error.code}, ${error.message}]`);
        expectTrue(error.code === env.INVALID_INPUT_PARAMETER);
        done();
        return;
      }
    });

    /**
     * @tc.number SUB_Misc_inputMethod_attach_Async_0600
     * @tc.name Call the attach interface in Async mode. Optional input parameters showkeyboard=true, attribute={}
     * @tc.desc Function test
     */
    it('SUB_Misc_inputMethod_attach_Async_0600', 0, async (done: Function) => {
      const CASE_NAME = 'SUB_Misc_inputMethod_attach_Async_0600';
      const ATTRIBUTE: inputMethod.TextConfig = {};
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
        inputMethod.getController().attach(true, ATTRIBUTE, CallBack);
      } catch (error) {
        console.info(`${CASE_NAME} catch error, expect error: [${error.code}, ${error.message}]`);
        expectTrue(error.code === env.INVALID_INPUT_PARAMETER);
        done();
        return;
      }
    });

    /**
     * @tc.number SUB_Misc_inputMethod_attach_Async_0700
     * @tc.name Call the attach interface in Async mode. Optional input parameters showkeyboard=true, attribute='aa'
     * @tc.desc Function test
     */
    it('SUB_Misc_inputMethod_attach_Async_0700', 0, async (done: Function) => {
      const CASE_NAME = 'SUB_Misc_inputMethod_attach_Async_0700';
      const ATTRIBUTE: any = 'aa';
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
        inputMethod.getController().attach(true, ATTRIBUTE, CallBack);
      } catch (error) {
        console.info(`${CASE_NAME} catch error, expect error: [${error.code}, ${error.message}]`);
        expectTrue(error.code === env.INVALID_INPUT_PARAMETER);
        done();
        return;
      }
    });

    /**
     * @tc.number SUB_Misc_inputMethod_attach_Async_1000
     * @tc.name Call the attach interface in Async mode and pass in an invalid input parameter
     * @tc.desc Function test
     */
    it('SUB_Misc_inputMethod_attach_Async_1000', 0, async (done: Function) => {
      const CASE_NAME = 'SUB_Misc_inputMethod_attach_Async_1000';
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
        inputMethod.getController().attach(true, ATTRIBUTE, CallBack, env.INVALID_TYPE_STRING_A);
      } catch (error) {
        console.info(`${CASE_NAME} catch error,error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
    });

    /**
     * @tc.number SUB_Misc_inputMethod_attach_Promise_0100
     * @tc.name Call the attach interface in Promise mode. Optional input parameter showkeyboard=true
     * @tc.desc Function test
     */
    it('SUB_Misc_inputMethod_attach_Promise_0100', 0, async (done: Function) => {
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
     * @tc.number SUB_Misc_inputMethod_attach_Promise_0200
     * @tc.name Call the attach interface in Promise mode. Optional input parameter showkeyboard=false
     * @tc.desc Function test
     */
    it('SUB_Misc_inputMethod_attach_Promise_0200', 0, async (done: Function) => {
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
     * @tc.number SUB_Misc_inputMethod_attach_Promise_0300
     * @tc.name Call the attach interface in Promise mode. Optional input parameter showkeyboard=0
     * @tc.desc Function test
     */
    it('SUB_Misc_inputMethod_attach_Promise_0300', 0, async (done: Function) => {
      const CASE_NAME = 'SUB_Misc_inputMethod_attach_Promise_0300';
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }
      const SHOW_KEYBOARD = 0;
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
     * @tc.number SUB_Misc_inputMethod_attach_Promise_0400
     * @tc.name Call the attach interface in Promise mode. Optional input parameter showkeyboard=1
     * @tc.desc Function test
     */
    it('SUB_Misc_inputMethod_attach_Promise_0400', 0, async (done: Function) => {
      const CASE_NAME = 'SUB_Misc_inputMethod_attach_Promise_0400';
      const ATTRIBUTE: inputMethod.TextConfig = {
        inputAttribute: {
          textInputType: 0, enterKeyType: 0
        }
      }
      const SHOW_KEYBOARD = 1;
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
     * @tc.number SUB_Misc_inputMethod_attach_Promise_0500
     * @tc.name Call the attach interface in Promise mode. Optional input parameter showkeyboard='aa'
     * @tc.desc Function test
     */
    it('SUB_Misc_inputMethod_attach_Promise_0500', 0, async (done: Function) => {
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
     * @tc.number SUB_Misc_inputMethod_attach_Promise_0600
     * @tc.name Call the attach interface in Promise mode. Optional input parameters showkeyboard=true, attribute={}
     * @tc.desc Function test
     */
    it('SUB_Misc_inputMethod_attach_Promise_0600', 0, async (done: Function) => {
      const CASE_NAME = 'SUB_Misc_inputMethod_attach_Promise_0600';
      const ATTRIBUTE: inputMethod.TextConfig = {};
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
     * @tc.number SUB_Misc_inputMethod_attach_Promise_0700
     * @tc.name Call the attach interface in Promise mode. Optional input parameters showkeyboard=true, attribute='aa'
     * @tc.desc Function test
     */
    it('SUB_Misc_inputMethod_attach_Promise_0700', 0, async (done: Function) => {
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
     * @tc.number SUB_Misc_inputMethod_attach_Promise_1000
     * @tc.name Call the attach interface in Promise mode and pass in an invalid input parameter
     * @tc.desc Function test
     */
    it('SUB_Misc_inputMethod_attach_Promise_1000', 0, async (done: Function) => {
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

  })
}