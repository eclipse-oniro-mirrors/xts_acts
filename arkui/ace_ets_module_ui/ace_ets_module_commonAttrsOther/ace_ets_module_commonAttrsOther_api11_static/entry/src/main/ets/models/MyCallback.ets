'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { AsyncCallback, BusinessError, Callback, ErrorCallback } from '@ohos.base';
import hilog from '@ohos.hilog';

const SYNTAX_ERROR_CODE: int = 1002;

export class MyCallback {
  static myCallback(callback: Callback<String>): void {
    hilog.info(0x0000, 'testTag', 'myCallback');
    callback('myCallback');
  }

  static myAsyncCallback(callback: AsyncCallback<String, String>): void {
    hilog.info(0x0000, 'testTag', 'myAsyncCallback');
    let error = new Error('Business Error', 'basicError2 message', undefined);
    let be2: BusinessError<String> = new BusinessError<String>(SYNTAX_ERROR_CODE, error);
    callback(be2, 'yAsyncCallback');
  }

  static myErrorCallback(callback: ErrorCallback<BusinessError<String>>): void {
    hilog.info(0x0000, 'testTag', 'myErrorCallback');
    let error = new Error('Business Error', 'myErrorCallback message', undefined);
    let result: String = 'test';
    let be: BusinessError<String> = new BusinessError<String>(SYNTAX_ERROR_CODE, result, error);
    callback(be);
  }

  static runCasesOfCallback() {
    MyCallback.myCallback((data: String) => {
      hilog.info(0x0000, 'testTag', 'MyCallback' + data);
    })
    MyCallback.myAsyncCallback((error: BusinessError<String> | null, result: String | undefined) => {
      hilog.info(0x0000, 'testTag', `myAsyncCallback, error: ${error?.message}, result:${result}`);
    })
    MyCallback.myErrorCallback((error: BusinessError<String> | null) => {
      hilog.info(0x0000, 'testTag', `myAsyncCallback, error: ${error?.message}`);
    })
  }
}