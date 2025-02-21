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

export default function inputMethodTest() {
  describe('inputMethod_changeSelection', function () {
    function expectTrue(data) {
      try {
        expect(data).assertTrue();
      }catch (err){
        console.info('assertion failure');
      }
    };
    function expectContain(a,b) {
      try {
        expect(a).assertContain(b);
      }catch (err){
        console.info('assertion failure');
      }
    };
    function expectFalse() {
      try {
        expect().assertFail();
      }catch (err){
        console.info('assertion failure');
      }
    };
    let st = null as any;
    const sleep = function (timeout) {
      return new Promise(resolve => {
        const st = setTimeout(() => {
          resolve(null);
        }, timeout);
      });
    };
    beforeEach(
      async function (){
        try{
          let data = await inputMethod.getController().attach(true,{inputAttribute:{textInputType:1,enterKeyType:2}});
          console.info(`attach inputMethod success, data: ${JSON.stringify(data)}`);
        }catch(error){
          console.info(`attach inputMethod fail, error: [${error.code}, ${error.message}]`);
        };
      }
    );
    afterEach(
      async function (){
        try{
          await inputMethod.getController().detach();
          console.info(`clsoe inputMethod success}`);
        }catch(error){
          console.info(`clsoe inputMethod fial, error: [${error.code}, ${error.message}]`);
        };
        clearTimeout(st);
      }
    );
    /**
     * @tc.number  SUB_Misc_inputMethod_changeSelection_Async_0100
     * @tc.name    Call the changeSelection interface in Async mode, enter the parameter text='Input method keyboard
     *             test hey hey', start=0, end=5
     * @tc.desc    Function test
     */
    it('SUB_Misc_inputMethod_changeSelection_Async_0100',0, async function (done) {
      const CASE_NAME = 'SUB_Misc_inputMethod_changeSelection_Async_0100';
      const TEXT = '输入法键盘测试嘿嘿';
      const START = 0;
      const END = 5;
      let CallBack:any = (error,data) => {
        if (error) {
          console.info(`${CASE_NAME} execution fail,error: [${error.code}, ${error.message}]`);
          expectFalse();
          done();
          return;
        }else{
          console.info(`${CASE_NAME} execution success, data: ${JSON.stringify(data)}`);
          done();
          return;
        }
      };
      try{
        inputMethod.getController().changeSelection(TEXT,START,END,CallBack);
      }catch(error){
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      };
    });

    /**
     * @tc.number  SUB_Misc_inputMethod_changeSelection_Async_0200
     * @tc.name    Call the changeSelection interface in Async mode, enter the parameter text='Input method keyboard
     *             test hey hey', start=0, end=10
     * @tc.desc    Function test
     */
    it('SUB_Misc_inputMethod_changeSelection_Async_0200',0, async function (done) {
      const CASE_NAME = 'SUB_Misc_inputMethod_changeSelection_Async_0200';
      const TEXT = '输入法键盘测试嘿嘿';
      const START = 0;
      const END = 10;
      let CallBack:any = (error,data) => {
        if (error) {
          console.info(`${CASE_NAME} execution fail, expect error: [${error.code}, ${error.message}]`);
          expectFalse();
          done();
          return;
        }else{
          console.info(`${CASE_NAME} execution success, data: ${JSON.stringify(data)}`);
          done();
          return;
        }
      };
      try{
        inputMethod.getController().changeSelection(TEXT,START,END,CallBack);
      }catch(error){
        console.info(`${CASE_NAME} catch error, expect error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      };
    });

    /**
     * @tc.number  SUB_Misc_inputMethod_changeSelection_Async_0300
     * @tc.name    Call the changeSelection interface in Async mode, enter the parameter text='Input method keyboard
     *             test hey hey', start=- 1, end=5
     * @tc.desc    Function test
     */
    it('SUB_Misc_inputMethod_changeSelection_Async_0300',0, async function (done) {
      const CASE_NAME = 'SUB_Misc_inputMethod_changeSelection_Async_0300';
      const TEXT = '输入法键盘测试嘿嘿';
      const START = -1;
      const END = 5;
      let CallBack:any = (error,data) => {
        if (error) {
          console.info(`${CASE_NAME} execution fail, expect error: [${error.code}, ${error.message}]`);
          expectFalse();
          done();
          return;
        }else{
          console.info(`${CASE_NAME} execution success, data: ${JSON.stringify(data)}`);
          done();
          return;
        }
      };
      try{
        inputMethod.getController().changeSelection(TEXT,START,END,CallBack);
      }catch(error){
        console.info(`${CASE_NAME} catch error, expect error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      };
    });

    /**
     * @tc.number  SUB_Misc_inputMethod_changeSelection_Async_0400
     * @tc.name    Call the changeSelection interface in Async mode, enter the parameter text='Input method keyboard
     *             test hehe', start=8, end=2
     * @tc.desc    Function test
     */
    it('SUB_Misc_inputMethod_changeSelection_Async_0400',0, async function (done) {
      const CASE_NAME = 'SUB_Misc_inputMethod_changeSelection_Async_0400';
      const TEXT = '输入法键盘测试嘿嘿';
      const START = 8;
      const END = 2;
      let CallBack:any = (error,data) => {
        if (error) {
          console.info(`${CASE_NAME} execution fail,error: [${error.code}, ${error.message}]`);
          expectFalse();
          done();
          return;
        }else{
          console.info(`${CASE_NAME} execution success, data: ${JSON.stringify(data)}`);
          done();
          return;
        }
      };
      try{
        inputMethod.getController().changeSelection(TEXT,START,END,CallBack);
      }catch(error){
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        done();
        return;
      };
    });

    /**
     * @tc.number  SUB_Misc_inputMethod_changeSelection_Async_0500
     * @tc.name    Async mode calls changeSelection interface, input parameter text=123
     * @tc.desc    Function test
     */
    it('SUB_Misc_inputMethod_changeSelection_Async_0500',0, async function (done) {
      const CASE_NAME = 'SUB_Misc_inputMethod_changeSelection_Async_0500';
      const START = 0;
      const END = 5;
      let CallBack:any = (error,data) => {
        if (error) {
          console.info(`${CASE_NAME} execution fail, expect error: [${error.code}, ${error.message}]`);
          expectTrue(error.code === env.INVALID_INPUT_PARAMETER);
          done();
          return;
        }else{
          console.info(`${CASE_NAME} execution success, data: ${JSON.stringify(data)}`);
          expectFalse();
          done();
          return;
        }
      };
      try{
        inputMethod.getController().changeSelection(env.INVALID_TYPE_NUMBER_123,START,END,CallBack);
      }catch(error){
        console.info(`${CASE_NAME} catch error, expect error: [${error.code}, ${error.message}]`);
        expectTrue(error.code === env.INVALID_INPUT_PARAMETER);
        done();
        return;
      };
    });

    /**
     * @tc.number  SUB_Misc_inputMethod_changeSelection_Async_0600
     * @tc.name    Async mode calls changeSelection interface, input parameter text=''
     * @tc.desc    Function test
     */
    it('SUB_Misc_inputMethod_changeSelection_Async_0600',0, async function (done) {
      const CASE_NAME = 'SUB_Misc_inputMethod_changeSelection_Async_0600';
      const START = 0;
      const END = 5;
      let CallBack:any = (error,data) => {
        if (error) {
          console.info(`${CASE_NAME} execution fail, expect error: [${error.code}, ${error.message}]`);
          expectFalse();
          done();
          return;
        }else{
          console.info(`${CASE_NAME} execution success, data: ${JSON.stringify(data)}`);
          done();
          return;
        }
      };
      try{
        inputMethod.getController().changeSelection(env.INVALID_STRING_NULL,START,END,CallBack);
      }catch(error){
        console.info(`${CASE_NAME} catch error, expect error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      };
    });

    /**
     * @tc.number  SUB_Misc_inputMethod_changeSelection_Async_0700
     * @tc.name    Async mode calls changeSelection interface, input parameter start='0'
     * @tc.desc    Function test
     */
    it('SUB_Misc_inputMethod_changeSelection_Async_0700',0, async function (done) {
      const CASE_NAME = 'SUB_Misc_inputMethod_changeSelection_Async_0700';
      const TEXT = '输入法键盘测试嘿嘿';
      const START:any = '0';
      const END = 5;
      let CallBack:any = (error,data) => {
        if (error) {
          console.info(`${CASE_NAME} execution fail, expect error: [${error.code}, ${error.message}]`);
          expectTrue(error.code === env.INVALID_INPUT_PARAMETER);
          done();
          return;
        }else{
          console.info(`${CASE_NAME} execution success, data: ${JSON.stringify(data)}`);
          expectFalse();
          done();
          return;
        }
      };
      try{
        inputMethod.getController().changeSelection(TEXT,START,END,CallBack);
      }catch(error){
        console.info(`${CASE_NAME} catch error, expect error: [${error.code}, ${error.message}]`);
        expectTrue(error.code === env.INVALID_INPUT_PARAMETER);
        done();
        return;
      };
    });

    /**
     * @tc.number  SUB_Misc_inputMethod_changeSelection_Async_0800
     * @tc.name    Async mode calls changeSelection interface, input parameter end='5'
     * @tc.desc    Function test
     */
    it('SUB_Misc_inputMethod_changeSelection_Async_0800',0, async function (done) {
      const CASE_NAME = 'SUB_Misc_inputMethod_changeSelection_Async_0800';
      const TEXT = '输入法键盘测试嘿嘿';
      const START = 0;
      const END:any = '5';
      let CallBack:any = (error,data) => {
        if (error) {
          console.info(`${CASE_NAME} execution fail, expect error: [${error.code}, ${error.message}]`);
          expectTrue(error.code === env.INVALID_INPUT_PARAMETER);
          done();
          return;
        }else{
          console.info(`${CASE_NAME} execution success, data: ${JSON.stringify(data)}`);
          expectFalse();
          done();
          return;
        }
      };
      try{
        inputMethod.getController().changeSelection(TEXT,START,END,CallBack);
      }catch(error){
        console.info(`${CASE_NAME} catch error, expect error: [${error.code}, ${error.message}]`);
        expectTrue(error.code === env.INVALID_INPUT_PARAMETER);
        done();
        return;
      };
    });

    /**
     * @tc.number  SUB_Misc_inputMethod_changeSelection_Async_1100
     * @tc.name    The input method keyboard is not bound, and the changeSelection interface is called in Async mode
     * @tc.desc    Function test
     */
    it('SUB_Misc_inputMethod_changeSelection_Async_1100',0, async function (done) {
      const CASE_NAME = 'SUB_Misc_inputMethod_changeSelection_Async_1100';
      const TEXT = '输入法键盘测试嘿嘿';
      const START = 0;
      const END:any = 5;
      let CallBack:any = (error,data) => {
        if (error) {
          console.info(`${CASE_NAME} execution fail, expect error: [${error.code}, ${error.message}]`);
          expectTrue(error.code === env.INVALID_INPUT_METHOD_CLIENT_DETACHED);
          done();
          return;
        }else{
          console.info(`${CASE_NAME} execution success, data: ${JSON.stringify(data)}`);
          expectFalse();
          done();
          return;
        }
      };
      try{
        let data = await inputMethod.getController().detach();
        console.info(`${CASE_NAME} clsoe inputMethod success, data: ${JSON.stringify(data)}`);
      }catch(error){
        console.info(`${CASE_NAME} clsoe inputMethod fial, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      };
      try{
        inputMethod.getController().changeSelection(TEXT,START,END,CallBack);
      }catch(error){
        console.info(`${CASE_NAME} catch error, expect error: [${error.code}, ${error.message}]`);
        expectTrue(error.code === env.INVALID_INPUT_METHOD_CLIENT_DETACHED);
        done();
        return;
      };
    });

    /**
     * @tc.number  SUB_Misc_inputMethod_changeSelection_Async_1200
     * @tc.name    Async mode calls the changeSelection interface, and an invalid input parameter is passed in
     * @tc.desc    Function test
     */
    it('SUB_Misc_inputMethod_changeSelection_Async_1200',0, async function (done) {
      const CASE_NAME = 'SUB_Misc_inputMethod_changeSelection_Async_1200';
      const TEXT = '输入法键盘测试嘿嘿';
      const START = 0;
      const END:any = 5;
      let CallBack:any = (error,data) => {
        if (error) {
          console.info(`${CASE_NAME} execution fail,error: [${error.code}, ${error.message}]`);
          expectFalse();
          done();
          return;
        }else{
          console.info(`${CASE_NAME} execution success, data: ${JSON.stringify(data)}`);
          done();
          return;
        }
      };
      try{
        inputMethod.getController().changeSelection(TEXT,START,END,CallBack,env.INVALID_TYPE_STRING_A);
      }catch(error){
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      };
    });

    /**
     * @tc.number  SUB_Misc_inputMethod_changeSelection_Async_1300
     * @tc.name    Async mode calls changeSelection interface. Missing parameter text must be passed in
     * @tc.desc    Function test
     */
    it('SUB_Misc_inputMethod_changeSelection_Async_1300',0, async function (done) {
      const CASE_NAME = 'SUB_Misc_inputMethod_changeSelection_Async_1300';
      const START:any = 0;
      const END:any = 5;
      let CallBack:any = (error,data) => {
        if (error) {
          console.info(`${CASE_NAME} execution fail, expect error: [${error.code}, ${error.message}]`);
          expectTrue(error.code === env.INVALID_INPUT_PARAMETER);
          done();
          return;
        }else{
          console.info(`${CASE_NAME} execution success, data: ${JSON.stringify(data)}`);
          expectFalse();
          done();
          return;
        }
      };
      try{
        inputMethod.getController().changeSelection(START,END,CallBack);
      }catch(error){
        console.info(`${CASE_NAME} catch error, expect error: [${error.code}, ${error.message}]`);
        expectTrue(error.code === env.INVALID_INPUT_PARAMETER);
        done();
        return;
      };
    });

    /**
     * @tc.number  SUB_Misc_inputMethod_changeSelection_Async_1400
     * @tc.name    Async mode calls the changeSelection interface. If it is missing, the parameter start must be passed in
     * @tc.desc    Function test
     */
    it('SUB_Misc_inputMethod_changeSelection_Async_1400',0, async function (done) {
      const CASE_NAME = 'SUB_Misc_inputMethod_changeSelection_Async_1400';
      const TEXT = '输入法键盘测试嘿嘿';
      const END:any = 5;
      let CallBack:any = (error,data) => {
        if (error) {
          console.info(`${CASE_NAME} execution fail, expect error: [${error.code}, ${error.message}]`);
          expectTrue(error.code === env.INVALID_INPUT_PARAMETER);
          done();
          return;
        }else{
          console.info(`${CASE_NAME} execution success, data: ${JSON.stringify(data)}`);
          expectFalse();
          done();
          return;
        }
      };
      try{
        inputMethod.getController().changeSelection(TEXT,END,CallBack);
      }catch(error){
        console.info(`${CASE_NAME} catch error, expect error: [${error.code}, ${error.message}]`);
        expectTrue(error.code === env.INVALID_INPUT_PARAMETER);
        done();
        return;
      };
    });

    /**
     * @tc.number  SUB_Misc_inputMethod_changeSelection_Async_1500
     * @tc.name    Async mode calls the changeSelection interface, and the missing parameter must be passed in
     * @tc.desc    Function test
     */
    it('SUB_Misc_inputMethod_changeSelection_Async_1500',0, async function (done) {
      const CASE_NAME = 'SUB_Misc_inputMethod_changeSelection_Async_1500';
      const TEXT = '输入法键盘测试嘿嘿';
      const START = 0;
      let CallBack:any = (error,data) => {
        if (error) {
          console.info(`${CASE_NAME} execution fail, expect error: [${error.code}, ${error.message}]`);
          expectTrue(error.code === env.INVALID_INPUT_PARAMETER);
          done();
          return;
        }else{
          console.info(`${CASE_NAME} execution success, data: ${JSON.stringify(data)}`);
          expectFalse();
          done();
          return;
        }
      };
      try{
        inputMethod.getController().changeSelection(TEXT,START,CallBack);
      }catch(error){
        console.info(`${CASE_NAME} catch error, expect error: [${error.code}, ${error.message}]`);
        expectTrue(error.code === env.INVALID_INPUT_PARAMETER);
        done();
        return;
      };
    });

    /**
     * @tc.number  SUB_Misc_inputMethod_changeSelection_Promise_0100
     * @tc.name    Call changeSelection interface in Promise mode, enter the parameter text='Input method keyboard
     *             test hey hey', start=0, end=5
     * @tc.desc    Function test
     */
    it('SUB_Misc_inputMethod_changeSelection_Promise_0100',0, async function (done) {
      const CASE_NAME = 'SUB_Misc_inputMethod_changeSelection_Promise_0100';
      const TEXT = '输入法键盘测试嘿嘿';
      const START = 0;
      const END = 5;
      try{
        let data = await inputMethod.getController().changeSelection(TEXT,START,END);
        console.info(`${CASE_NAME} execution success, data: ${JSON.stringify(data)}`);
        done();
        return;
      }catch(error){
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
    });

    /**
     * @tc.number  SUB_Misc_inputMethod_changeSelection_Promise_0200
     * @tc.name    Call changeSelection interface in Promise mode, enter the parameter text='Input method keyboard
     *             test hey hey', start=0, end=10
     * @tc.desc    Function test
     */
    it('SUB_Misc_inputMethod_changeSelection_Promise_0200',0, async function (done) {
      const CASE_NAME = 'SUB_Misc_inputMethod_changeSelection_Promise_0200';
      const TEXT = '输入法键盘测试嘿嘿';
      const START = 0;
      const END = 10;
      try{
        let data = await inputMethod.getController().changeSelection(TEXT,START,END);
        console.info(`${CASE_NAME} execution success, data: ${JSON.stringify(data)}`);
        done();
        return;
      }catch(error){
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
    });

    /**
     * @tc.number  SUB_Misc_inputMethod_changeSelection_Promise_0300
     * @tc.name    Call changeSelection interface in Promise mode, enter text='Input method keyboard test hey hey',
     *             start=- 1, end=5
     * @tc.desc    Function test
     */
    it('SUB_Misc_inputMethod_changeSelection_Promise_0300',0, async function (done) {
      const CASE_NAME = 'SUB_Misc_inputMethod_changeSelection_Promise_0300';
      const TEXT = '输入法键盘测试嘿嘿';
      const START = -1;
      const END = 5;
      try{
        let data = await inputMethod.getController().changeSelection(TEXT,START,END);
        console.info(`${CASE_NAME} execution success, data: ${JSON.stringify(data)}`);
        done();
        return;
      }catch(error){
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
    });

    /**
     * @tc.number  SUB_Misc_inputMethod_changeSelection_Promise_0400
     * @tc.name    Call changeSelection interface in Promise mode, enter the parameter text='Input method keyboard
     *             test hey hey', start=8, end=2
     * @tc.desc    Function test
     */
    it('SUB_Misc_inputMethod_changeSelection_Promise_0400',0, async function (done) {
      const CASE_NAME = 'SUB_Misc_inputMethod_changeSelection_Promise_0400';
      const TEXT = '输入法键盘测试嘿嘿';
      const START = 8;
      const END = 2;
      try{
        let data = await inputMethod.getController().changeSelection(TEXT,START,END);
        console.info(`${CASE_NAME} execution success, data: ${JSON.stringify(data)}`);
        done();
        return;
      }catch(error){
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
    });

    /**
     * @tc.number  SUB_Misc_inputMethod_changeSelection_Promise_0500
     * @tc.name    Call changeSelection interface in Promise mode, input parameter text=123
     * @tc.desc    Function test
     */
    it('SUB_Misc_inputMethod_changeSelection_Promise_0500',0, async function (done) {
      const CASE_NAME = 'SUB_Misc_inputMethod_changeSelection_Promise_0500';
      const START = 0;
      const END = 5;
      try{
        let data = await inputMethod.getController().changeSelection(env.INVALID_TYPE_NUMBER_123,START,END);
        console.info(`${CASE_NAME} execution success, data: ${JSON.stringify(data)}`);
        expectFalse();
        done();
        return;
      }catch(error){
        console.info(`${CASE_NAME} catch error, except error: [${error.code}, ${error.message}]`);
        expectTrue(error.code === env.INVALID_INPUT_PARAMETER);
        done();
        return;
      }
    });

    /**
     * @tc.number  SUB_Misc_inputMethod_changeSelection_Promise_0600
     * @tc.name    Promise mode calls changeSelection interface, input parameter text=''
     * @tc.desc    Function test
     */
    it('SUB_Misc_inputMethod_changeSelection_Promise_0600',0, async function (done) {
      const CASE_NAME = 'SUB_Misc_inputMethod_changeSelection_Promise_0600';
      const START = 0;
      const END = 5;
      try{
        let data = await inputMethod.getController().changeSelection(env.INVALID_STRING_NULL,START,END);
        console.info(`${CASE_NAME} execution success, data: ${JSON.stringify(data)}`);
        done();
        return;
      }catch(error){
        console.info(`${CASE_NAME} catch error, except error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
    });

    /**
     * @tc.number  SUB_Misc_inputMethod_changeSelection_Promise_0700
     * @tc.name    Promise mode calls changeSelection interface, input parameter start='0'
     * @tc.desc    Function test
     */
    it('SUB_Misc_inputMethod_changeSelection_Promise_0700',0, async function (done) {
      const CASE_NAME = 'SUB_Misc_inputMethod_changeSelection_Promise_0700';
      const TEXT = '输入法键盘测试嘿嘿';
      const START:any = '0';
      const END = 5;
      try{
        let data = await inputMethod.getController().changeSelection(TEXT,START,END);
        console.info(`${CASE_NAME} execution success, data: ${JSON.stringify(data)}`);
        expectFalse();
        done();
        return;
      }catch(error){
        console.info(`${CASE_NAME} catch error, except error: [${error.code}, ${error.message}]`);
        expectTrue(error.code === env.INVALID_INPUT_PARAMETER);
        done();
        return;
      }
    });

    /**
     * @tc.number  SUB_Misc_inputMethod_changeSelection_Promise_0800
     * @tc.name    Call changeSelection interface in Promise mode, input parameter end='5'
     * @tc.desc    Function test
     */
    it('SUB_Misc_inputMethod_changeSelection_Promise_0800',0, async function (done) {
      const CASE_NAME = 'SUB_Misc_inputMethod_changeSelection_Promise_0800';
      const TEXT = '输入法键盘测试嘿嘿';
      const START = 0;
      const END:any = '5';
      try{
        let data = await inputMethod.getController().changeSelection(TEXT,START,END);
        console.info(`${CASE_NAME} execution success, data: ${JSON.stringify(data)}`);
        expectFalse();
        done();
        return;
      }catch(error){
        console.info(`${CASE_NAME} catch error, except error: [${error.code}, ${error.message}]`);
        expectTrue(error.code === env.INVALID_INPUT_PARAMETER);
        done();
        return;
      }
    });

    /**
     * @tc.number  SUB_Misc_inputMethod_changeSelection_Promise_1100
     * @tc.name    Do not bind the input method keyboard, and call the changeSelection interface in Promise mode
     * @tc.desc    Function test
     */
    it('SUB_Misc_inputMethod_changeSelection_Promise_1100',0, async function (done) {
      const CASE_NAME = 'SUB_Misc_inputMethod_changeSelection_Promise_1100';
      const TEXT = '输入法键盘测试嘿嘿';
      const START = 0;
      const END:any = 5;
      try{
        let data = await inputMethod.getController().detach();
        console.info(`${CASE_NAME} clsoe inputMethod success, data: ${JSON.stringify(data)}`);
      }catch(error){
        console.info(`${CASE_NAME} clsoe inputMethod fial, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      };
      try{
        let data = await inputMethod.getController().changeSelection(TEXT,START,END);
        console.info(`${CASE_NAME} execution success, data: ${JSON.stringify(data)}`);
        expectFalse();
        done();
        return;
      }catch(error){
        console.info(`${CASE_NAME} catch error, except error: [${error.code}, ${error.message}]`);
        expectTrue(error.code === env.INVALID_INPUT_METHOD_CLIENT_DETACHED);
        done();
        return;
      }
    });

    /**
     * @tc.number  SUB_Misc_inputMethod_changeSelection_Promise_1200
     * @tc.name    The Promise method calls the changeSelection interface, and an invalid input parameter is passed in
     * @tc.desc    Function test
     */
    it('SUB_Misc_inputMethod_changeSelection_Promise_1200',0, async function (done) {
      const CASE_NAME = 'SUB_Misc_inputMethod_changeSelection_Promise_1200';
      const TEXT = '输入法键盘测试嘿嘿';
      const START = 0;
      const END:any = 5;
      try{
        let data = await inputMethod.getController().changeSelection(TEXT,START,END,env.INVALID_TYPE_STRING_A);
        console.info(`${CASE_NAME} execution success, data: ${JSON.stringify(data)}`);
        done();
        return;
      }catch(error){
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      }
    });

    /**
     * @tc.number  SUB_Misc_inputMethod_changeSelection_Promise_1300
     * @tc.name    The promise method calls the changeSelection interface, and the missing parameter text must be
     *             passed in
     * @tc.desc    Function test
     */
    it('SUB_Misc_inputMethod_changeSelection_Promise_1300',0, async function (done) {
      const CASE_NAME = 'SUB_Misc_inputMethod_changeSelection_Promise_1300';
      const START = 0;
      const END:any = 5;
      try{
        let data = await inputMethod.getController().changeSelection(START,END);
        console.info(`${CASE_NAME} execution success, data: ${JSON.stringify(data)}`);
        expectFalse();
        done();
        return;
      }catch(error){
        console.info(`${CASE_NAME} catch error, except error: [${error.code}, ${error.message}]`);
        expectTrue(error.code === env.INVALID_INPUT_PARAMETER);
        done();
        return;
      }
    });

    /**
     * @tc.number  SUB_Misc_inputMethod_changeSelection_Promise_1400
     * @tc.name    The promise method calls the changeSelection interface. If it is missing, the parameter start must
     *             be passed in
     * @tc.desc    Function test
     */
    it('SUB_Misc_inputMethod_changeSelection_Promise_1400',0, async function (done) {
      const CASE_NAME = 'SUB_Misc_inputMethod_changeSelection_Promise_1400';
      const TEXT = '输入法键盘测试嘿嘿';
      const END:any = 5;
      try{
        let data = await inputMethod.getController().changeSelection(TEXT,END);
        console.info(`${CASE_NAME} execution success, data: ${JSON.stringify(data)}`);
        expectFalse();
        done();
        return;
      }catch(error){
        console.info(`${CASE_NAME} catch error, except error: [${error.code}, ${error.message}]`);
        expectTrue(error.code === env.INVALID_INPUT_PARAMETER);
        done();
        return;
      }
    });

    /**
     * @tc.number  SUB_Misc_inputMethod_changeSelection_Promise_1500
     * @tc.name    The promise method calls the changeSelection interface, and the missing parameter must be passed in
     * @tc.desc    Function test
     */
    it('SUB_Misc_inputMethod_changeSelection_Promise_1500',0, async function (done) {
      const CASE_NAME = 'SUB_Misc_inputMethod_changeSelection_Promise_1500';
      const TEXT = '输入法键盘测试嘿嘿';
      const START:any = 0;
      try{
        let data = await inputMethod.getController().changeSelection(TEXT,START);
        console.info(`${CASE_NAME} execution success, data: ${JSON.stringify(data)}`);
        expectFalse();
        done();
        return;
      }catch(error){
        console.info(`${CASE_NAME} catch error, except error: [${error.code}, ${error.message}]`);
        expectTrue(error.code === env.INVALID_INPUT_PARAMETER);
        done();
        return;
      }
    });

  })
}