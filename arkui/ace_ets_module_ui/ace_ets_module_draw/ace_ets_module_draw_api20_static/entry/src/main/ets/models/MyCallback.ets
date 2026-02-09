import { AsyncCallback, BusinessError, Callback, ErrorCallback } from '@ohos.base';
import hilog from '@ohos.hilog';

const SYNTAX_ERROR_CODE: int = 1002;

export class MyCallback {
  static myCallback(callback: Callback<string>): void {
    hilog.info(0x0000, 'testTag', 'myCallback');
    callback('myCallback');
  }

  static myAsyncCallback(callback: AsyncCallback<string, string>): void {
    hilog.info(0x0000, 'testTag', 'myAsyncCallback');
    let error = new Error('Business Error', 'basicError2 message', undefined);
    let be2: BusinessError<string> = new BusinessError<string>(SYNTAX_ERROR_CODE, error);
    callback(be2, 'yAsyncCallback');
  }

  static myErrorCallback(callback: ErrorCallback<BusinessError<string>>): void {
    hilog.info(0x0000, 'testTag', 'myErrorCallback');
    let error = new Error('Business Error', 'myErrorCallback message', undefined);
    let result: string = 'test';
    let be: BusinessError<string> = new BusinessError<string>(SYNTAX_ERROR_CODE, result, error);
    callback(be);
  }

  static runCasesOfCallback() {
    MyCallback.myCallback((data: string) => {
      hilog.info(0x0000, 'testTag', 'MyCallback' + data);
    })
    MyCallback.myAsyncCallback((error: BusinessError<string> | null, result: string | undefined) => {
      hilog.info(0x0000, 'testTag', `myAsyncCallback, error: ${error?.message}, result:${result}`);
    })
    MyCallback.myErrorCallback((error: BusinessError<string> | null) => {
      hilog.info(0x0000, 'testTag', `myAsyncCallback, error: ${error?.message}`);
    })
  }
}