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
  describe('inputMethod_setCallingWindow', function () {
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
     * @tc.number  SUB_Misc_inputMethod_setCallingWindow_Async_0100
     * @tc.name    When calling the setCallingWindow interface in Async mode, the parameter windowId=5 must be passed in
     * @tc.desc    Function test
     */
    it('SUB_Misc_inputMethod_setCallingWindow_Async_0100',0, async function (done) {
      const CASE_NAME = 'SUB_Misc_inputMethod_setCallingWindow_Async_0100';
      const WINDOW_ID:any = 5;
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
        inputMethod.getController().setCallingWindow(WINDOW_ID,CallBack);
      }catch(error){
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      };
    });

    /**
     * @tc.number  SUB_Misc_inputMethod_setCallingWindow_Async_0200
     * @tc.name    When calling the setCallingWindow interface in Async mode, the parameter windowId=0 must be passed in
     * @tc.desc    Function test
     */
    it('SUB_Misc_inputMethod_setCallingWindow_Async_0200',0, async function (done) {
      const CASE_NAME = 'SUB_Misc_inputMethod_setCallingWindow_Async_0200';
      const WINDOW_ID:any = 0;
      let CallBack:any = (error,data) => {
        if (error) {
          console.info(`${CASE_NAME} execution fail, expect error: [${error.code}, ${error.message}]`);
          expectFalse();
          return;
        }else{
          console.info(`${CASE_NAME} execution success, data: ${JSON.stringify(data)}`);
          done();
          return;
        }
      };
      try{
        inputMethod.getController().setCallingWindow(WINDOW_ID,CallBack);
      }catch(error){
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      };
    });

    /**
     * @tc.number  SUB_Misc_inputMethod_setCallingWindow_Async_0300
     * @tc.name    When calling the setCallingWindow interface in Async mode, the parameter windowId='5' must be
     *             passed in
     * @tc.desc    Function test
     */
    it('SUB_Misc_inputMethod_setCallingWindow_Async_0300',0, async function (done) {
      const CASE_NAME = 'SUB_Misc_inputMethod_setCallingWindow_Async_0300';
      const WINDOW_ID:any = '5';
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
        inputMethod.getController().setCallingWindow(WINDOW_ID,CallBack);
      }catch(error){
        console.info(`${CASE_NAME} catch error, except error: [${error.code}, ${error.message}]`);
        expectTrue(error.code === env.INVALID_INPUT_PARAMETER);
        done();
        return;
      };
    });

    /**
     * @tc.number  SUB_Misc_inputMethod_setCallingWindow_Async_0600
     * @tc.name    The input method keyboard is not bound, and the setCallingWindow interface is called in Async mode
     * @tc.desc    Function test
     */
    it('SUB_Misc_inputMethod_setCallingWindow_Async_0600',0, async function (done) {
      const CASE_NAME = 'SUB_Misc_inputMethod_setCallingWindow_Async_0600';
      const WINDOW_ID:any = 5;
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
        inputMethod.getController().setCallingWindow(WINDOW_ID,CallBack);
      }catch(error){
        console.info(`${CASE_NAME} catch error, except error: [${error.code}, ${error.message}]`);
        expectTrue(error.code === env.INVALID_INPUT_METHOD_CLIENT_DETACHED);
        done();
        return;
      };
    });

    /**
     * @tc.number  SUB_Misc_inputMethod_setCallingWindow_Async_0700
     * @tc.name    Async mode calls the setCallingWindow interface, and an invalid input parameter is passed in
     * @tc.desc    Function test
     */
    it('SUB_Misc_inputMethod_setCallingWindow_Async_0700',0, async function (done) {
      const CASE_NAME = 'SUB_Misc_inputMethod_setCallingWindow_Async_0700';
      const WINDOW_ID:any = 5;
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
        inputMethod.getController().setCallingWindow(WINDOW_ID,CallBack,env.INVALID_TYPE_STRING_A);
      }catch(error){
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      };
    });

    /**
     * @tc.number  SUB_Misc_inputMethod_setCallingWindow_Async_0800
     * @tc.name    Async method calls the setCallingWindow interface. Missing parameter windowId must be passed in
     * @tc.desc    Function test
     */
    it('SUB_Misc_inputMethod_setCallingWindow_Async_0800',0, async function (done) {
      const CASE_NAME = 'SUB_Misc_inputMethod_setCallingWindow_Async_0800';
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
        inputMethod.getController().setCallingWindow(CallBack);
      }catch(error){
        console.info(`${CASE_NAME} catch error, except error: [${error.code}, ${error.message}]`);
        expectTrue(error.code === env.INVALID_INPUT_PARAMETER);
        done();
        return;
      };
    });

    /**
     * @tc.number  SUB_Misc_inputMethod_setCallingWindow_Promise_0100
     * @tc.name    When calling the setCallingWindow interface in Promise mode, the parameter
     *             windowId=5 must be passed in
     * @tc.desc    Function test
     */
    it('SUB_Misc_inputMethod_setCallingWindow_Promise_0100',0, async function (done) {
      const CASE_NAME = 'SUB_Misc_inputMethod_setCallingWindow_Promise_0100';
      const WINDOW_ID:any = 5;
      try{
        let data = await inputMethod.getController().setCallingWindow(WINDOW_ID);
        console.info(`${CASE_NAME} execution success, data: ${JSON.stringify(data)}`);
        done();
        return;
      }catch(error){
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      };
    });

    /**
     * @tc.number  SUB_Misc_inputMethod_setCallingWindow_Promise_0200
     * @tc.name    When calling the setCallingWindow interface in Promise mode, the parameter windowId=0 must be
     *             passed in
     * @tc.desc    Function test
     */
    it('SUB_Misc_inputMethod_setCallingWindow_Promise_0200',0, async function (done) {
      const CASE_NAME = 'SUB_Misc_inputMethod_setCallingWindow_Promise_0200';
      const WINDOW_ID:any = 0;
      try{
        let data = await inputMethod.getController().setCallingWindow(WINDOW_ID);
        console.info(`${CASE_NAME} execution success, data: ${JSON.stringify(data)}`);
        done();
        return;
      }catch(error){
        console.info(`${CASE_NAME} catch error, except error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      };
    });

    /**
     * @tc.number  SUB_Misc_inputMethod_setCallingWindow_Promise_0300
     * @tc.name    When calling the setCallingWindow interface in Promise mode, the parameter windowId='5' must be
     *             passed in
     * @tc.desc    Function test
     */
    it('SUB_Misc_inputMethod_setCallingWindow_Promise_0300',0, async function (done) {
      const CASE_NAME = 'SUB_Misc_inputMethod_setCallingWindow_Promise_0300';
      const WINDOW_ID:any = '5';
      try{
        let data = await inputMethod.getController().setCallingWindow(WINDOW_ID);
        console.info(`${CASE_NAME} execution success, data: ${JSON.stringify(data)}`);
        expectFalse();
        done();
        return;
      }catch(error){
        console.info(`${CASE_NAME} catch error, except error: [${error.code}, ${error.message}]`);
        expectTrue(error.code === env.INVALID_INPUT_PARAMETER);
        done();
        return;
      };
    });

    /**
     * @tc.number  SUB_Misc_inputMethod_setCallingWindow_Promise_0600
     * @tc.name    The input method keyboard is not bound, and the setCallingWindow interface is called in Promise mode
     * @tc.desc    Function test
     */
    it('SUB_Misc_inputMethod_setCallingWindow_Promise_0600',0, async function (done) {
      const CASE_NAME = 'SUB_Misc_inputMethod_setCallingWindow_Promise_0600';
      const WINDOW_ID:any = 5;
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
        let data = await inputMethod.getController().setCallingWindow(WINDOW_ID);
        console.info(`${CASE_NAME} execution success, data: ${JSON.stringify(data)}`);
        expectFalse();
        done();
        return;
      }catch(error){
        console.info(`${CASE_NAME} catch error, except error: [${error.code}, ${error.message}]`);
        expectTrue(error.code === env.INVALID_INPUT_METHOD_CLIENT_DETACHED);
        done();
        return;
      };
    });

    /**
     * @tc.number  SUB_Misc_inputMethod_setCallingWindow_Promise_0700
     * @tc.name    Call setCallingWindow interface in Promise mode, and pass in an invalid input parameter
     * @tc.desc    Function test
     */
    it('SUB_Misc_inputMethod_setCallingWindow_Promise_0700',0, async function (done) {
      const CASE_NAME = 'SUB_Misc_inputMethod_setCallingWindow_Promise_0700';
      const WINDOW_ID:any = 5;
      try{
        let data = await inputMethod.getController().setCallingWindow(WINDOW_ID,env.INVALID_TYPE_STRING_A);
        console.info(`${CASE_NAME} execution success, data: ${JSON.stringify(data)}`);
        done();
        return;
      }catch(error){
        console.info(`${CASE_NAME} catch error, error: [${error.code}, ${error.message}]`);
        expectFalse();
        done();
        return;
      };
    });

    /**
     * @tc.number  SUB_Misc_inputMethod_setCallingWindow_Promise_0800
     * @tc.name    The setCallingWindow interface is called in Promise mode, and the parameter windowId must be
     *             passed in if it is missing
     * @tc.desc    Function test
     */
    it('SUB_Misc_inputMethod_setCallingWindow_Promise_0800',0, async function (done) {
      const CASE_NAME = 'SUB_Misc_inputMethod_setCallingWindow_Promise_0800';
      try{
        let data = await inputMethod.getController().setCallingWindow();
        console.info(`${CASE_NAME} execution success, data: ${JSON.stringify(data)}`);
        expectFalse();
        done();
        return;
      }catch(error){
        console.info(`${CASE_NAME} catch error, except error: [${error.code}, ${error.message}]`);
        expectTrue(error.code === env.INVALID_INPUT_PARAMETER);
        done();
        return;
      };
    });

  })
}