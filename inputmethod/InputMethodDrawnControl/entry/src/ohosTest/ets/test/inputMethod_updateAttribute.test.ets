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

function expectTrue(data: ESObject) {
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

let st: ESObject = null;

const sleep = (timeout: number): Promise<ESObject> => {
  return new Promise(resolve => {
    const st = setTimeout(() => {
      resolve(null);
    }, timeout);
  });
};


export default function inputMethodTest() {
  describe('inputMethod_updateAttribute', () => {

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
        clearTimeout(st);
      }
    );


    /**
     * @tc.name   SUB_Misc_inputMethod_updateAttribute_Async_0100
     * @tc.number SUB_Misc_inputMethod_updateAttribute_Async_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Misc_inputMethod_updateAttribute_Async_0100', Level.LEVEL2, async (done: Function) => {
      const CASE_NAME = 'SUB_Misc_inputMethod_updateAttribute_Async_0100';
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
        inputMethod.getController().updateAttribute({
          textInputType: 0, enterKeyType: 0
        }, CallBack);
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
    });
    
    /**
     * @tc.name   SUB_Misc_inputMethod_updateAttribute_Promise_0100
     * @tc.number SUB_Misc_inputMethod_updateAttribute_Promise_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Misc_inputMethod_updateAttribute_Promise_0100', Level.LEVEL2, async (done: Function) => {
      const CASE_NAME = 'SUB_Misc_inputMethod_updateAttribute_Promise_0100';
      try {
        let data = await inputMethod.getController().updateAttribute({
          textInputType: 0, enterKeyType: 0
        });
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
     * @tc.name   SUB_Misc_inputMethod_updateAttribute_Promise_0700
     * @tc.number SUB_Misc_inputMethod_updateAttribute_Promise_0700
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Misc_inputMethod_updateAttribute_Promise_0700', Level.LEVEL2, async (done: Function) => {
      const CASE_NAME = 'SUB_Misc_inputMethod_updateAttribute_Promise_0700';
      try {
        let data = await inputMethod.getController().updateAttribute({
          textInputType: 0, enterKeyType: 0
        }, env.INVALID_TYPE_STRING_A);
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
     * @tc.name   Sub_InputMethod_IMF_updateAttributePromise_0300
     * @tc.number Sub_InputMethod_IMF_updateAttributePromise_0300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_updateAttributePromise_0300', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_updateAttributePromise_0300';
      try {
        await inputMethod.getController().updateAttribute({
          textInputType: inputMethod.TextInputType.NONE, enterKeyType: inputMethod.EnterKeyType.NONE, placeholder: '', abilityName: ''
        });
        console.info(`${CASE_NAME} execution success`);
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_updateAttributePromise_0400
     * @tc.number Sub_InputMethod_IMF_updateAttributePromise_0400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_updateAttributePromise_0400', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_updateAttributePromise_0400';
      try {
        await inputMethod.getController().updateAttribute({
          textInputType: inputMethod.TextInputType.MULTILINE, enterKeyType: inputMethod.EnterKeyType.GO
        });
        console.info(`${CASE_NAME} execution success`);
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_updateAttributePromise_0500
     * @tc.number Sub_InputMethod_IMF_updateAttributePromise_0500
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_updateAttributePromise_0500', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_updateAttributePromise_0500';
      try {
        await inputMethod.getController().updateAttribute({
          textInputType: inputMethod.TextInputType.NUMBER, enterKeyType: inputMethod.EnterKeyType.SEARCH
        });
        console.info(`${CASE_NAME} execution success`);
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_updateAttributePromise_0600
     * @tc.number Sub_InputMethod_IMF_updateAttributePromise_0600
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_updateAttributePromise_0600', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_updateAttributePromise_0600';
      try {
        await inputMethod.getController().updateAttribute({
          textInputType: inputMethod.TextInputType.PHONE, enterKeyType: inputMethod.EnterKeyType.SEND
        });
        console.info(`${CASE_NAME} execution success`);
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_updateAttributePromise_0700
     * @tc.number Sub_InputMethod_IMF_updateAttributePromise_0700
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_updateAttributePromise_0700', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_updateAttributePromise_0700';
      try {
        await inputMethod.getController().updateAttribute({
          textInputType: inputMethod.TextInputType.DATETIME, enterKeyType: inputMethod.EnterKeyType.NEXT
        });
        console.info(`${CASE_NAME} execution success`);
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_updateAttributePromise_0800
     * @tc.number Sub_InputMethod_IMF_updateAttributePromise_0800
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_updateAttributePromise_0800', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_updateAttributePromise_0800';
      try {
        await inputMethod.getController().updateAttribute({
          textInputType: inputMethod.TextInputType.EMAIL_ADDRESS, enterKeyType: inputMethod.EnterKeyType.DONE
        });
        console.info(`${CASE_NAME} execution success`);
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_updateAttributePromise_0900
     * @tc.number Sub_InputMethod_IMF_updateAttributePromise_0900
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_updateAttributePromise_0900', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_updateAttributePromise_0900';
      try {
        await inputMethod.getController().updateAttribute({
          textInputType: inputMethod.TextInputType.URL, enterKeyType: inputMethod.EnterKeyType.PREVIOUS
        });
        console.info(`${CASE_NAME} execution success`);
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_updateAttributePromise_1000
     * @tc.number Sub_InputMethod_IMF_updateAttributePromise_1000
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_updateAttributePromise_1000', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_updateAttributePromise_1000';
      try {
        await inputMethod.getController().updateAttribute({
          textInputType: inputMethod.TextInputType.VISIBLE_PASSWORD, enterKeyType: inputMethod.EnterKeyType.NEWLINE
        });
        console.info(`${CASE_NAME} execution success`);
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_updateAttributePromise_1100
     * @tc.number Sub_InputMethod_IMF_updateAttributePromise_1100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_updateAttributePromise_1100', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_updateAttributePromise_1100';
      try {
        await inputMethod.getController().updateAttribute({
          textInputType: inputMethod.TextInputType.NUMBER_PASSWORD, enterKeyType: inputMethod.EnterKeyType.NEWLINE
        });
        console.info(`${CASE_NAME} execution success`);
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_updateAttributePromise_1200
     * @tc.number Sub_InputMethod_IMF_updateAttributePromise_1200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_updateAttributePromise_1200', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_updateAttributePromise_1200';
      try {
        await inputMethod.getController().updateAttribute({
          textInputType: inputMethod.TextInputType.SCREEN_LOCK_PASSWORD, enterKeyType: inputMethod.EnterKeyType.NEWLINE
        });
        console.info(`${CASE_NAME} execution success`);
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_updateAttributePromise_1300
     * @tc.number Sub_InputMethod_IMF_updateAttributePromise_1300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_updateAttributePromise_1300', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_updateAttributePromise_1300';
      try {
        await inputMethod.getController().updateAttribute({
          textInputType: inputMethod.TextInputType.USER_NAME, enterKeyType: inputMethod.EnterKeyType.NEWLINE
        });
        console.info(`${CASE_NAME} execution success`);
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_updateAttributePromise_1400
     * @tc.number Sub_InputMethod_IMF_updateAttributePromise_1400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_updateAttributePromise_1400', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_updateAttributePromise_1400';
      try {
        await inputMethod.getController().updateAttribute({
          textInputType: inputMethod.TextInputType.NEW_PASSWORD, enterKeyType: inputMethod.EnterKeyType.NEWLINE
        });
        console.info(`${CASE_NAME} execution success`);
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_updateAttributePromise_1500
     * @tc.number Sub_InputMethod_IMF_updateAttributePromise_1500
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_updateAttributePromise_1500', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_updateAttributePromise_1500';
      try {
        await inputMethod.getController().updateAttribute({
          textInputType: inputMethod.TextInputType.NUMBER_DECIMAL, enterKeyType: inputMethod.EnterKeyType.NEWLINE
        });
        console.info(`${CASE_NAME} execution success`);
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_updateAttributePromise_1600
     * @tc.number Sub_InputMethod_IMF_updateAttributePromise_1600
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_updateAttributePromise_1600', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_updateAttributePromise_1600';
      try {
        await inputMethod.getController().updateAttribute({
          textInputType: inputMethod.TextInputType.ONE_TIME_CODE, enterKeyType: inputMethod.EnterKeyType.NEWLINE
        });
        console.info(`${CASE_NAME} execution success`);
        done();
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_updateAttributeCallback_0300
     * @tc.number Sub_InputMethod_IMF_updateAttributeCallback_0300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_updateAttributeCallback_0300', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_updateAttributeCallback_0300';
      let CallBack = (error: BusinessError, data: ESObject) => {
        console.info(`${CASE_NAME} CallBack success, error: ${error}`);
        expect(error).assertEqual(undefined);
        done();
      };
      try {
        inputMethod.getController().updateAttribute({
          textInputType: inputMethod.TextInputType.NONE, enterKeyType: inputMethod.EnterKeyType.NONE, placeholder: '', abilityName: ''
        }, CallBack);
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_updateAttributeCallback_0400
     * @tc.number Sub_InputMethod_IMF_updateAttributeCallback_0400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_updateAttributeCallback_0400', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_updateAttributeCallback_0400';
      let CallBack = (error: BusinessError, data: ESObject) => {
        console.info(`${CASE_NAME} CallBack success, error: ${error}`);
        expect(error).assertEqual(undefined);
        done();
      };
      try {
        inputMethod.getController().updateAttribute({
          textInputType: inputMethod.TextInputType.MULTILINE, enterKeyType: inputMethod.EnterKeyType.GO
        }, CallBack);
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_updateAttributeCallback_0500
     * @tc.number Sub_InputMethod_IMF_updateAttributeCallback_0500
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_updateAttributeCallback_0500', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_updateAttributeCallback_0500';
      let CallBack = (error: BusinessError, data: ESObject) => {
        console.info(`${CASE_NAME} CallBack success, error: ${error}`);
        expect(error).assertEqual(undefined);
        done();
      };
      try {
        inputMethod.getController().updateAttribute({
          textInputType: inputMethod.TextInputType.NUMBER, enterKeyType: inputMethod.EnterKeyType.SEARCH
        }, CallBack);
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_updateAttributeCallback_0600
     * @tc.number Sub_InputMethod_IMF_updateAttributeCallback_0600
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_updateAttributeCallback_0600', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_updateAttributeCallback_0600';
      let CallBack = (error: BusinessError, data: ESObject) => {
        console.info(`${CASE_NAME} CallBack success, error: ${error}`);
        expect(error).assertEqual(undefined);
        done();
      };
      try {
        inputMethod.getController().updateAttribute({
          textInputType: inputMethod.TextInputType.PHONE, enterKeyType: inputMethod.EnterKeyType.SEND
        }, CallBack);
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_updateAttributeCallback_0700
     * @tc.number Sub_InputMethod_IMF_updateAttributeCallback_0700
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_updateAttributeCallback_0700', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_updateAttributeCallback_0700';
      let CallBack = (error: BusinessError, data: ESObject) => {
        console.info(`${CASE_NAME} CallBack success, error: ${error}`);
        expect(error).assertEqual(undefined);
        done();
      };
      try {
        inputMethod.getController().updateAttribute({
          textInputType: inputMethod.TextInputType.DATETIME, enterKeyType: inputMethod.EnterKeyType.NEXT
        }, CallBack);
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_updateAttributeCallback_0800
     * @tc.number Sub_InputMethod_IMF_updateAttributeCallback_0800
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_updateAttributeCallback_0800', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_updateAttributeCallback_0800';
      let CallBack = (error: BusinessError, data: ESObject) => {
        console.info(`${CASE_NAME} CallBack success, error: ${error}`);
        expect(error).assertEqual(undefined);
        done();
      };
      try {
        inputMethod.getController().updateAttribute({
          textInputType: inputMethod.TextInputType.EMAIL_ADDRESS, enterKeyType: inputMethod.EnterKeyType.DONE
        }, CallBack);
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_updateAttributeCallback_0900
     * @tc.number Sub_InputMethod_IMF_updateAttributeCallback_0900
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_updateAttributeCallback_0900', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_updateAttributeCallback_0900';
      let CallBack = (error: BusinessError, data: ESObject) => {
        console.info(`${CASE_NAME} CallBack success, error: ${error}`);
        expect(error).assertEqual(undefined);
        done();
      };
      try {
        inputMethod.getController().updateAttribute({
          textInputType: inputMethod.TextInputType.URL, enterKeyType: inputMethod.EnterKeyType.PREVIOUS
        }, CallBack);
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_updateAttributeCallback_1000
     * @tc.number Sub_InputMethod_IMF_updateAttributeCallback_1000
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_updateAttributeCallback_1000', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_updateAttributeCallback_1000';
      let CallBack = (error: BusinessError, data: ESObject) => {
        console.info(`${CASE_NAME} CallBack success, error: ${error}`);
        expect(error).assertEqual(undefined);
        done();
      };
      try {
        inputMethod.getController().updateAttribute({
          textInputType: inputMethod.TextInputType.VISIBLE_PASSWORD, enterKeyType: inputMethod.EnterKeyType.NEWLINE
        }, CallBack);
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_updateAttributeCallback_1100
     * @tc.number Sub_InputMethod_IMF_updateAttributeCallback_1100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_updateAttributeCallback_1100', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_updateAttributeCallback_1100';
      let CallBack = (error: BusinessError, data: ESObject) => {
        console.info(`${CASE_NAME} CallBack success, error: ${error}`);
        expect(error).assertEqual(undefined);
        done();
      };
      try {
        inputMethod.getController().updateAttribute({
          textInputType: inputMethod.TextInputType.NUMBER_PASSWORD, enterKeyType: inputMethod.EnterKeyType.NEWLINE
        }, CallBack);
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_updateAttributeCallback_1200
     * @tc.number Sub_InputMethod_IMF_updateAttributeCallback_1200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_updateAttributeCallback_1200', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_updateAttributeCallback_1200';
      let CallBack = (error: BusinessError, data: ESObject) => {
        console.info(`${CASE_NAME} CallBack success, error: ${error}`);
        expect(error).assertEqual(undefined);
        done();
      };
      try {
        inputMethod.getController().updateAttribute({
          textInputType: inputMethod.TextInputType.SCREEN_LOCK_PASSWORD, enterKeyType: inputMethod.EnterKeyType.NEWLINE
        }, CallBack);
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_updateAttributeCallback_1300
     * @tc.number Sub_InputMethod_IMF_updateAttributeCallback_1300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_updateAttributeCallback_1300', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_updateAttributeCallback_1300';
      let CallBack = (error: BusinessError, data: ESObject) => {
        console.info(`${CASE_NAME} CallBack success, error: ${error}`);
        expect(error).assertEqual(undefined);
        done();
      };
      try {
        inputMethod.getController().updateAttribute({
          textInputType: inputMethod.TextInputType.USER_NAME, enterKeyType: inputMethod.EnterKeyType.NEWLINE
        }, CallBack);
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_updateAttributeCallback_1400
     * @tc.number Sub_InputMethod_IMF_updateAttributeCallback_1400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_updateAttributeCallback_1400', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_updateAttributeCallback_1400';
      let CallBack = (error: BusinessError, data: ESObject) => {
        console.info(`${CASE_NAME} CallBack success, error: ${error}`);
        expect(error).assertEqual(undefined);
        done();
      };
      try {
        inputMethod.getController().updateAttribute({
          textInputType: inputMethod.TextInputType.NEW_PASSWORD, enterKeyType: inputMethod.EnterKeyType.NEWLINE
        }, CallBack);
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_updateAttributeCallback_1500
     * @tc.number Sub_InputMethod_IMF_updateAttributeCallback_1500
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_updateAttributeCallback_1500', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_updateAttributeCallback_1500';
      let CallBack = (error: BusinessError, data: ESObject) => {
        console.info(`${CASE_NAME} CallBack success, error: ${error}`);
        expect(error).assertEqual(undefined);
        done();
      };
      try {
        inputMethod.getController().updateAttribute({
          textInputType: inputMethod.TextInputType.NUMBER_DECIMAL, enterKeyType: inputMethod.EnterKeyType.NEWLINE
        }, CallBack);
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_InputMethod_IMF_updateAttributeCallback_1600
     * @tc.number Sub_InputMethod_IMF_updateAttributeCallback_1600
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_InputMethod_IMF_updateAttributeCallback_1600', Level.LEVEL3, async (done: Function) => {
      const CASE_NAME = '====>Sub_InputMethod_IMF_updateAttributeCallback_1600';
      let CallBack = (error: BusinessError, data: ESObject) => {
        console.info(`${CASE_NAME} CallBack success, error: ${error}`);
        expect(error).assertEqual(undefined);
        done();
      };
      try {
        inputMethod.getController().updateAttribute({
          textInputType: inputMethod.TextInputType.ONE_TIME_CODE, enterKeyType: inputMethod.EnterKeyType.NEWLINE
        }, CallBack);
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expect().assertFail();
        done();
      }
    });

  })
}