/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import { BusinessError } from '@ohos.base';

function callbackTest(callback: Callback<void>): void {
  callback("callback");
}

function errorCallbackTest(errorCallback: ErrorCallback<void>): void {
  errorCallback("errorCallback");
}

function asyncCallbackTest(asyncCallback: AsyncCallback<void>): void {
  asyncCallback({
    code: 1
  }, "asyncCallback");
}

export default function basicJsunit() {
  describe('basicTest', () => {
    let callback: Callback<void> = (data: ESObject) => {
      console.log(data);
      expect(true).assertTrue();
    }


    let errorCallback: ErrorCallback<void> = (error: BusinessError) => {
      console.log(error);
      expect(true).assertTrue();
    }


    let asyncCallback: AsyncCallback<void> = (error: BusinessError, data: ESObject) => {
      console.log(data);
      expect(true).assertTrue();
    }


    it('testBasic01', 0, async (done: Function) => {
      console.info('[testBasic01] START');
      callbackTest(callback);
      console.info('[testBasic01] END');
      done();
    });

    it('testBasic02', 0, async (done: Function) => {
      console.info('[testBasic02] START');
      errorCallbackTest(errorCallback);
      console.info('[testBasic02] END');
      done();
    });

    it('testBasic03', 0, async (done: Function) => {
      console.info('[testBasic03] START');
      asyncCallbackTest(asyncCallback);
      console.info('[testBasic03] END');
      done();
    });
  });
}