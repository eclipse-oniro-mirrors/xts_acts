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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import * as env from './lib/Const';
import { BusinessError } from '@ohos.base'

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
  describe('inputMethod_changeSelection', () => {

    beforeEach(
      async () => {
        try {
          let data = await inputMethod.getController().attach(true, {
            inputAttribute: {
              textInputType: 1, enterKeyType: 2
            }
          });
          console.info(`attach inputMethod success, data: ${JSON.stringify(data)}`);
        } catch (error) {
          console.info(`attach inputMethod fail, error: [${error.code}, ${error.message}]`);
        }
        ;
      }
    );
    afterEach(
      async () => {
        try {
          await inputMethod.getController().detach();
          console.info(`clsoe inputMethod success}`);
        } catch (error) {
          console.info(`clsoe inputMethod fial, error: [${error.code}, ${error.message}]`);
        }
        ;
        clearTimeout(st);
      }
    );
    /**
     * @tc.name   SUB_Misc_inputMethod_changeSelection_Async_0100
     * @tc.number SUB_Misc_inputMethod_changeSelection_Async_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Misc_inputMethod_changeSelection_Async_0100', Level.LEVEL2, async (done: Function) => {
      const CASE_NAME = 'SUB_Misc_inputMethod_changeSelection_Async_0100';
      const TEXT = '输入法键盘测试嘿嘿';
      const START = 0;
      const END = 5;
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
        inputMethod.getController().changeSelection(TEXT, START, END, CallBack);
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
      ;
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_changeSelectionCallback_0300
     * @tc.number Sub_InputMethod_IMF_changeSelectionCallback_0300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_changeSelectionCallback_0300', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_changeSelectionCallback_0300';
      const START = 0;
      const END = 5;
      let CallBack = (error: BusinessError, data: ESObject) => {
        console.info(`${CASE_NAME} execution success, error: ${JSON.stringify(error)}`);
        expect(error == undefined).assertTrue();
        done();
      };
      try {
        inputMethod.getController().changeSelection('', START, END, CallBack);
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      };
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_changeSelectionCallback_0100
     * @tc.number Sub_InputMethod_IMF_changeSelectionCallback_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_changeSelectionCallback_0100', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_changeSelectionCallback_0100';
      let CallBack = (error: BusinessError, data: ESObject) => {
        console.info(`${CASE_NAME} execution success, error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      };
      try {
        inputMethod.getController().changeSelection(null, null, null, CallBack);
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect(error.code).assertEqual(401);
        done();
      };
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_changeSelectionCallback_0200
     * @tc.number Sub_InputMethod_IMF_changeSelectionCallback_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_changeSelectionCallback_0200', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_changeSelectionCallback_0200';
      let CallBack = (error: BusinessError, data: ESObject) => {
        console.info(`${CASE_NAME} execution success, error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      };
      try {
        inputMethod.getController().changeSelection(undefined, undefined, undefined, CallBack);
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect(error.code).assertEqual(401);
        done();
      };
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_changeSelectionPromise_0300
     * @tc.number Sub_InputMethod_IMF_changeSelectionPromise_0300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_changeSelectionPromise_0300', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_changeSelectionPromise_0300';
      const START = 0;
      const END = 5;
      try {
        let data = await inputMethod.getController().changeSelection('', START, END);
        console.info(`${CASE_NAME} execution success, data: ${JSON.stringify(data)}`);
        expect(data == undefined).assertTrue();
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      };
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_changeSelectionPromise_0100
     * @tc.number Sub_InputMethod_IMF_changeSelectionPromise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_changeSelectionPromise_0100', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_changeSelectionPromise_0100';
      try {
        let data = await inputMethod.getController().changeSelection(null, null, null);
        console.info(`${CASE_NAME} execution success, data: ${JSON.stringify(data)}`);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect(error.code).assertEqual(401);
        done();
      };
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_changeSelectionPromise_0200
     * @tc.number Sub_InputMethod_IMF_changeSelectionPromise_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_changeSelectionPromise_0200', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_changeSelectionPromise_0200';
      try {
        let data = await inputMethod.getController().changeSelection(undefined, undefined, undefined);
        console.info(`${CASE_NAME} execution success, data: ${JSON.stringify(data)}`);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect(error.code).assertEqual(401);
        done();
      };
    });

    /**
     * @tc.name   SUB_Misc_inputMethod_changeSelection_Async_0200
     * @tc.number SUB_Misc_inputMethod_changeSelection_Async_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Misc_inputMethod_changeSelection_Async_0200', Level.LEVEL2, async (done: Function) => {
      const CASE_NAME = 'SUB_Misc_inputMethod_changeSelection_Async_0200';
      const TEXT = '输入法键盘测试嘿嘿';
      const START = 0;
      const END = 10;
      let CallBack = (error: BusinessError, data: ESObject) => {
        if (error) {
          console.info(`${CASE_NAME} execution fail, expect error: [${error.code}, ${error.message}]`);
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
        inputMethod.getController().changeSelection(TEXT, START, END, CallBack);
      } catch (error) {
        console.info(`${CASE_NAME} catch error, expect error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
      ;
    });

    /**
     * @tc.name   SUB_Misc_inputMethod_changeSelection_Async_0300
     * @tc.number SUB_Misc_inputMethod_changeSelection_Async_0300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Misc_inputMethod_changeSelection_Async_0300', Level.LEVEL2, async (done: Function) => {
      const CASE_NAME = 'SUB_Misc_inputMethod_changeSelection_Async_0300';
      const TEXT = '输入法键盘测试嘿嘿';
      const START = -1;
      const END = 5;
      let CallBack = (error: BusinessError, data: ESObject) => {
        if (error) {
          console.info(`${CASE_NAME} execution fail, expect error: [${error.code}, ${error.message}]`);
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
        inputMethod.getController().changeSelection(TEXT, START, END, CallBack);
      } catch (error) {
        console.info(`${CASE_NAME} catch error, expect error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
      ;
    });

    /**
     * @tc.name   SUB_Misc_inputMethod_changeSelection_Async_0400
     * @tc.number SUB_Misc_inputMethod_changeSelection_Async_0400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Misc_inputMethod_changeSelection_Async_0400', Level.LEVEL2, async (done: Function) => {
      const CASE_NAME = 'SUB_Misc_inputMethod_changeSelection_Async_0400';
      const TEXT = '输入法键盘测试嘿嘿';
      const START = 8;
      const END = 2;
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
        inputMethod.getController().changeSelection(TEXT, START, END, CallBack);
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        done();
        return;
      }
      ;
    });

    /**
     * @tc.name   SUB_Misc_inputMethod_changeSelection_Async_0500
     * @tc.number SUB_Misc_inputMethod_changeSelection_Async_0500
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Misc_inputMethod_changeSelection_Async_0500', Level.LEVEL2, async (done: Function) => {
      const CASE_NAME = 'SUB_Misc_inputMethod_changeSelection_Async_0500';
      const START = 0;
      const END = 5;
      let CallBack = (error: BusinessError, data: ESObject) => {
        if (error) {
          console.info(`${CASE_NAME} execution fail, expect error: [${error.code}, ${error.message}]`);
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
        inputMethod.getController().changeSelection(env.INVALID_TYPE_NUMBER_123, START, END, CallBack);
      } catch (error) {
        console.info(`${CASE_NAME} catch error, expect error: [${error.code}, ${error.message}]`);
        expectTrue(error.code === env.INVALID_INPUT_PARAMETER);
        done();
        return;
      }
      ;
    });

    /**
     * @tc.name   SUB_Misc_inputMethod_changeSelection_Async_0600
     * @tc.number SUB_Misc_inputMethod_changeSelection_Async_0600
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Misc_inputMethod_changeSelection_Async_0600', Level.LEVEL2, async (done: Function) => {
      const CASE_NAME = 'SUB_Misc_inputMethod_changeSelection_Async_0600';
      const START = 0;
      const END = 5;
      let CallBack = (error: BusinessError, data: ESObject) => {
        if (error) {
          console.info(`${CASE_NAME} execution fail, expect error: [${error.code}, ${error.message}]`);
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
        inputMethod.getController().changeSelection(env.INVALID_STRING_NULL, START, END, CallBack);
      } catch (error) {
        console.info(`${CASE_NAME} catch error, expect error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
      ;
    });

    /**
     * @tc.name   SUB_Misc_inputMethod_changeSelection_Async_0700
     * @tc.number SUB_Misc_inputMethod_changeSelection_Async_0700
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Misc_inputMethod_changeSelection_Async_0700', Level.LEVEL2, async (done: Function) => {
      const CASE_NAME = 'SUB_Misc_inputMethod_changeSelection_Async_0700';
      const TEXT = '输入法键盘测试嘿嘿';
      const START: ESObject = '0';
      const END = 5;
      let CallBack = (error: BusinessError, data: ESObject) => {
        if (error) {
          console.info(`${CASE_NAME} execution fail, expect error: [${error.code}, ${error.message}]`);
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
        inputMethod.getController().changeSelection(TEXT, START, END, CallBack);
      } catch (error) {
        console.info(`${CASE_NAME} catch error, expect error: [${error.code}, ${error.message}]`);
        expectTrue(error.code === env.INVALID_INPUT_PARAMETER);
        done();
        return;
      }
      ;
    });

    /**
     * @tc.name   SUB_Misc_inputMethod_changeSelection_Async_0800
     * @tc.number SUB_Misc_inputMethod_changeSelection_Async_0800
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Misc_inputMethod_changeSelection_Async_0800', Level.LEVEL2, async (done: Function) => {
      const CASE_NAME = 'SUB_Misc_inputMethod_changeSelection_Async_0800';
      const TEXT = '输入法键盘测试嘿嘿';
      const START = 0;
      const END: ESObject = '5';
      let CallBack = (error: BusinessError, data: ESObject) => {
        if (error) {
          console.info(`${CASE_NAME} execution fail, expect error: [${error.code}, ${error.message}]`);
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
        inputMethod.getController().changeSelection(TEXT, START, END, CallBack);
      } catch (error) {
        console.info(`${CASE_NAME} catch error, expect error: [${error.code}, ${error.message}]`);
        expectTrue(error.code === env.INVALID_INPUT_PARAMETER);
        done();
        return;
      }
      ;
    });

    /**
     * @tc.name   SUB_Misc_inputMethod_changeSelection_Async_1100
     * @tc.number SUB_Misc_inputMethod_changeSelection_Async_1100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Misc_inputMethod_changeSelection_Async_1100', Level.LEVEL2, async (done: Function) => {
      const CASE_NAME = 'SUB_Misc_inputMethod_changeSelection_Async_1100';
      const TEXT = '输入法键盘测试嘿嘿';
      const START = 0;
      const END: ESObject = 5;
      let CallBack = (error: BusinessError, data: ESObject) => {
        if (error) {
          console.info(`${CASE_NAME} execution fail, expect error: [${error.code}, ${error.message}]`);
          expectTrue(error.code === env.INVALID_INPUT_METHOD_CLIENT_DETACHED);
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
        let data = await inputMethod.getController().detach();
        console.info(`${CASE_NAME} clsoe inputMethod success, data: ${JSON.stringify(data)}`);
      } catch (error) {
        console.info(`${CASE_NAME} clsoe inputMethod fial, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
      ;
      try {
        inputMethod.getController().changeSelection(TEXT, START, END, CallBack);
      } catch (error) {
        console.info(`${CASE_NAME} catch error, expect error: [${error.code}, ${error.message}]`);
        expectTrue(error.code === env.INVALID_INPUT_METHOD_CLIENT_DETACHED);
        done();
        return;
      }
      ;
    });

    /**
     * @tc.name   SUB_Misc_inputMethod_changeSelection_Promise_0100
     * @tc.number SUB_Misc_inputMethod_changeSelection_Promise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Misc_inputMethod_changeSelection_Promise_0100', Level.LEVEL2, async (done: Function) => {
      const CASE_NAME = 'SUB_Misc_inputMethod_changeSelection_Promise_0100';
      const TEXT = '输入法键盘测试嘿嘿';
      const START = 0;
      const END = 5;
      try {
        let data = await inputMethod.getController().changeSelection(TEXT, START, END);
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
     * @tc.name   SUB_Misc_inputMethod_changeSelection_Promise_0200
     * @tc.number SUB_Misc_inputMethod_changeSelection_Promise_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Misc_inputMethod_changeSelection_Promise_0200', Level.LEVEL2, async (done: Function) => {
      const CASE_NAME = 'SUB_Misc_inputMethod_changeSelection_Promise_0200';
      const TEXT = '输入法键盘测试嘿嘿';
      const START = 0;
      const END = 10;
      try {
        let data = await inputMethod.getController().changeSelection(TEXT, START, END);
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
     * @tc.name   SUB_Misc_inputMethod_changeSelection_Promise_0300
     * @tc.number SUB_Misc_inputMethod_changeSelection_Promise_0300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Misc_inputMethod_changeSelection_Promise_0300', Level.LEVEL2, async (done: Function) => {
      const CASE_NAME = 'SUB_Misc_inputMethod_changeSelection_Promise_0300';
      const TEXT = '输入法键盘测试嘿嘿';
      const START = -1;
      const END = 5;
      try {
        let data = await inputMethod.getController().changeSelection(TEXT, START, END);
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
     * @tc.name   SUB_Misc_inputMethod_changeSelection_Promise_0400
     * @tc.number SUB_Misc_inputMethod_changeSelection_Promise_0400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Misc_inputMethod_changeSelection_Promise_0400', Level.LEVEL2, async (done: Function) => {
      const CASE_NAME = 'SUB_Misc_inputMethod_changeSelection_Promise_0400';
      const TEXT = '输入法键盘测试嘿嘿';
      const START = 8;
      const END = 2;
      try {
        let data = await inputMethod.getController().changeSelection(TEXT, START, END);
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
     * @tc.name   SUB_Misc_inputMethod_changeSelection_Promise_0500
     * @tc.number SUB_Misc_inputMethod_changeSelection_Promise_0500
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Misc_inputMethod_changeSelection_Promise_0500', Level.LEVEL2, async (done: Function) => {
      const CASE_NAME = 'SUB_Misc_inputMethod_changeSelection_Promise_0500';
      const START = 0;
      const END = 5;
      try {
        let data = await inputMethod.getController().changeSelection(env.INVALID_TYPE_NUMBER_123, START, END);
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
     * @tc.name   SUB_Misc_inputMethod_changeSelection_Promise_0600
     * @tc.number SUB_Misc_inputMethod_changeSelection_Promise_0600
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Misc_inputMethod_changeSelection_Promise_0600', Level.LEVEL2, async (done: Function) => {
      const CASE_NAME = 'SUB_Misc_inputMethod_changeSelection_Promise_0600';
      const START = 0;
      const END = 5;
      try {
        let data = await inputMethod.getController().changeSelection(env.INVALID_STRING_NULL, START, END);
        console.info(`${CASE_NAME} execution success, data: ${JSON.stringify(data)}`);
        done();
        return;
      } catch (error) {
        console.info(`${CASE_NAME} catch error, except error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
    });

    /**
     * @tc.name   SUB_Misc_inputMethod_changeSelection_Promise_0700
     * @tc.number SUB_Misc_inputMethod_changeSelection_Promise_0700
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Misc_inputMethod_changeSelection_Promise_0700', Level.LEVEL2, async (done: Function) => {
      const CASE_NAME = 'SUB_Misc_inputMethod_changeSelection_Promise_0700';
      const TEXT = '输入法键盘测试嘿嘿';
      const START: ESObject = '0';
      const END = 5;
      try {
        let data = await inputMethod.getController().changeSelection(TEXT, START, END);
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
     * @tc.name   SUB_Misc_inputMethod_changeSelection_Promise_0800
     * @tc.number SUB_Misc_inputMethod_changeSelection_Promise_0800
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Misc_inputMethod_changeSelection_Promise_0800', Level.LEVEL2, async (done: Function) => {
      const CASE_NAME = 'SUB_Misc_inputMethod_changeSelection_Promise_0800';
      const TEXT = '输入法键盘测试嘿嘿';
      const START = 0;
      const END: ESObject = '5';
      try {
        let data = await inputMethod.getController().changeSelection(TEXT, START, END);
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
     * @tc.name   SUB_Misc_inputMethod_changeSelection_Promise_1100
     * @tc.number SUB_Misc_inputMethod_changeSelection_Promise_1100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Misc_inputMethod_changeSelection_Promise_1100', Level.LEVEL2, async (done: Function) => {
      const CASE_NAME = 'SUB_Misc_inputMethod_changeSelection_Promise_1100';
      const TEXT = '输入法键盘测试嘿嘿';
      const START = 0;
      const END: ESObject = 5;
      try {
        let data = await inputMethod.getController().detach();
        console.info(`${CASE_NAME} clsoe inputMethod success, data: ${JSON.stringify(data)}`);
      } catch (error) {
        console.info(`${CASE_NAME} clsoe inputMethod fial, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
      ;
      try {
        let data = await inputMethod.getController().changeSelection(TEXT, START, END);
        console.info(`${CASE_NAME} execution success, data: ${JSON.stringify(data)}`);
        expectFalse();
        done();
        return;
      } catch (error) {
        console.info(`${CASE_NAME} catch error, except error: [${error.code}, ${error.message}]`);
        expectTrue(error.code === env.INVALID_INPUT_METHOD_CLIENT_DETACHED);
        done();
        return;
      }
    });

    /**
     * @tc.name   SUB_Misc_inputMethod_changeSelection_Promise_1200
     * @tc.number SUB_Misc_inputMethod_changeSelection_Promise_1200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Misc_inputMethod_changeSelection_Promise_1200', Level.LEVEL2, async (done: Function) => {
      const CASE_NAME = 'SUB_Misc_inputMethod_changeSelection_Promise_1200';
      const TEXT = '输入法键盘测试嘿嘿';
      const START = 0;
      const END: ESObject = 5;
      try {
        let data = await inputMethod.getController().changeSelection(TEXT, START, END, env.INVALID_TYPE_STRING_A);
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