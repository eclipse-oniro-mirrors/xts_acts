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
     * @tc.number SUB_Misc_inputMethod_updateAttribute_Async_0100
     * @tc.name When calling the updateAttribute interface in Async mode, the parameter attribute=
     *             {textInputType: 0, enterKeyType: 0} must be passed in
     * @tc.desc Function test
     */
    it('SUB_Misc_inputMethod_updateAttribute_Async_0100', 0, async (done: Function) => {
      const CASE_NAME = 'SUB_Misc_inputMethod_updateAttribute_Async_0100';
      const ATTRIBUTE: inputMethod.TextConfig = {
        textInputType: 0, enterKeyType: 0
      };
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
        inputMethod.getController().updateAttribute(ATTRIBUTE, CallBack);
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
    });

    /**
     * @tc.number SUB_Misc_inputMethod_updateAttribute_Async_0200
     * @tc.name When calling the updateAttribute interface in Async mode, the parameter attribute={} must be
     *             passed in
     * @tc.desc Function test
     */
    it('SUB_Misc_inputMethod_updateAttribute_Async_0200', 0, async (done: Function) => {
      const CASE_NAME = 'SUB_Misc_inputMethod_updateAttribute_Async_0200';
      const ATTRIBUTE: inputMethod.TextConfig = {};
      let CallBack = (error: BusinessError, data: ESObject) => {
        if (error) {
          console.info(`${CASE_NAME} execution fail, expect error: [${error.code}, ${error.message}]`);
          expectTrue(error.code === env.INVALID_INPUT_PARAMETER);
          return;
        } else {
          console.info(`${CASE_NAME} execution success, data: ${JSON.stringify(data)}`);
          expectFalse();
          done();
          return;
        }
      };
      try {
        inputMethod.getController().updateAttribute(ATTRIBUTE, CallBack);
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expectTrue(error.code === env.INVALID_INPUT_PARAMETER);
        done();
        return;
      }
    });

    /**
     * @tc.number SUB_Misc_inputMethod_updateAttribute_Async_0300
     * @tc.name When calling the updateAttribute interface in Async mode, the parameter attribute='aa' must be
     *             passed in
     * @tc.desc Function test
     */
    it('SUB_Misc_inputMethod_updateAttribute_Async_0300', 0, async (done: Function) => {
      const CASE_NAME = 'SUB_Misc_inputMethod_updateAttribute_Async_0300';
      const ATTRIBUTE: any = 'aa';
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
        inputMethod.getController().updateAttribute(ATTRIBUTE, CallBack);
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expectTrue(error.code === env.INVALID_INPUT_PARAMETER);
        done();
        return;
      }
    });

    /**
     * @tc.number SUB_Misc_inputMethod_updateAttribute_Async_0700
     * @tc.name Async mode calls the updateAttribute interface and passes in an invalid input parameter
     * @tc.desc Function test
     */
    it('SUB_Misc_inputMethod_updateAttribute_Async_0700', 0, async (done: Function) => {
      const CASE_NAME = 'SUB_Misc_inputMethod_updateAttribute_Async_0700';
      const ATTRIBUTE: inputMethod.TextConfig = {
        textInputType: 0, enterKeyType: 0
      };
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
        inputMethod.getController().updateAttribute(ATTRIBUTE, CallBack, env.INVALID_TYPE_STRING_A);
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
    });

    /**
     * @tc.number SUB_Misc_inputMethod_updateAttribute_Async_0800
     * @tc.name Async method calls the updateAttribute interface. Missing parameter attribute must be passed in
     * @tc.desc Function test
     */
    it('SUB_Misc_inputMethod_updateAttribute_Async_0800', 0, async (done: Function) => {
      const CASE_NAME = 'SUB_Misc_inputMethod_updateAttribute_Async_0800';
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
        inputMethod.getController().updateAttribute(CallBack);
      } catch (error) {
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expectTrue(error.code === env.INVALID_INPUT_PARAMETER);
        done();
        return;
      }
    });

    /**
     * @tc.number SUB_Misc_inputMethod_updateAttribute_Promise_0100
     * @tc.name When calling the updateAttribute interface in Promise mode, the parameter
     *             attribute={textInputType: 0, enterKeyType: 0} must be passed in
     * @tc.desc Function test
     */
    it('SUB_Misc_inputMethod_updateAttribute_Promise_0100', 0, async (done: Function) => {
      const CASE_NAME = 'SUB_Misc_inputMethod_updateAttribute_Promise_0100';
      const ATTRIBUTE: inputMethod.TextConfig = {
        textInputType: 0, enterKeyType: 0
      };
      try {
        let data = await inputMethod.getController().updateAttribute(ATTRIBUTE);
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
     * @tc.number SUB_Misc_inputMethod_updateAttribute_Promise_0200
     * @tc.name When calling the updateAttribute interface in Promise mode, the parameter attribute={} must be
     *             passed in
     * @tc.desc Function test
     */
    it('SUB_Misc_inputMethod_updateAttribute_Promise_0200', 0, async (done: Function) => {
      const CASE_NAME = 'SUB_Misc_inputMethod_updateAttribute_Promise_0200';
      const ATTRIBUTE: inputMethod.TextConfig = {};
      try {
        let data = await inputMethod.getController().updateAttribute(ATTRIBUTE);
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
     * @tc.number SUB_Misc_inputMethod_updateAttribute_Promise_0300
     * @tc.name When calling the updateAttribute interface in Promise mode, the parameter attribute='aa' must be
     *             passed in
     * @tc.desc Function test
     */
    it('SUB_Misc_inputMethod_updateAttribute_Promise_0300', 0, async (done: Function) => {
      const CASE_NAME = 'SUB_Misc_inputMethod_updateAttribute_Promise_0300';
      const ATTRIBUTE: any = 'aa';
      try {
        let data = await inputMethod.getController().updateAttribute(ATTRIBUTE);
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
     * @tc.number SUB_Misc_inputMethod_updateAttribute_Promise_0700
     * @tc.name Call the updateAttribute interface in Promise mode, and pass in an invalid input parameter
     * @tc.desc Function test
     */
    it('SUB_Misc_inputMethod_updateAttribute_Promise_0700', 0, async (done: Function) => {
      const CASE_NAME = 'SUB_Misc_inputMethod_updateAttribute_Promise_0700';
      const ATTRIBUTE: inputMethod.TextConfig = {
        textInputType: 0, enterKeyType: 0
      };
      try {
        let data = await inputMethod.getController().updateAttribute(ATTRIBUTE, env.INVALID_TYPE_STRING_A);
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
     * @tc.number SUB_Misc_inputMethod_updateAttribute_Promise_0800
     * @tc.name The updateAttribute interface is called in Promise mode. If it is missing,
     *             the parameter attribute must be passed in
     * @tc.desc Function test
     */
    it('SUB_Misc_inputMethod_updateAttribute_Promise_0800', 0, async (done: Function) => {
      const CASE_NAME = 'SUB_Misc_inputMethod_updateAttribute_Promise_0800';
      try {
        let data = await inputMethod.getController().updateAttribute();
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

  })
}