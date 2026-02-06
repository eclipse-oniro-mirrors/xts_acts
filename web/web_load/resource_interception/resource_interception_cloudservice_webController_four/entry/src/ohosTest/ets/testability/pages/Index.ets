/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import { abilityDelegatorRegistry } from '@kit.TestKit';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
import { webview } from '@kit.ArkWeb';
import { URL } from './ConstConfig';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  aboutToAppear(): void {
    console.info('aboutToAppear')
    // let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
    // let abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
    // console.info('start run testcase!!!')
    // Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
    let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
    abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
    let abilityDelegatorArguments: abilityDelegatorRegistry.AbilityDelegatorArgs;
    abilityDelegatorArguments = abilityDelegatorRegistry.getArguments();
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);

    //cookie测试
    this.getCookie()
    this.fetchCookieSync()
    this.fetchCookieCallback()
    this.fetchCookiePromise()
    this.configCookieSync()
    this.configCookieCallback()
    this.configCookiePromise()
    this.putAcceptCookieEnabled()
    this.putAcceptThirdPartyCookieEnabled()
    this.existCookie()
  }

  build(){
    Column() {
      Text(this.message)
    }
    .height('100%')
    .width('100%')
  }

  getCookie(){
    webview.WebCookieManager.setCookie(URL, 'a=b');
    let value = webview.WebCookieManager.getCookie(URL);
    if (value) {
      hilog.info(0x0000, 'testTag', '%{public}s', 'value: ' + value);
      AppStorage.setOrCreate('getCookie10114', new ResultData(typeof (value), value));
    }
  }

  fetchCookieSync(){
    webview.WebCookieManager.setCookie(URL, 'a=b');
    let value = webview.WebCookieManager.fetchCookieSync(URL);
    if (value) {
      hilog.info(0x0000, 'testTag', '%{public}s', 'value: ' + value);
      AppStorage.setOrCreate('fetchCookieSync10115', new ResultData(typeof (value), value));
    }
  }

  fetchCookieCallback(){
    webview.WebCookieManager.setCookie(URL, 'a=b');
    webview.WebCookieManager.fetchCookie(URL, (error, cookie) => {
      if (error) {
        console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
        return;
      }
      if (cookie) {
        hilog.info(0x0000, 'testTag', '%{public}s', 'value: ' + cookie);
        AppStorage.setOrCreate('fetchCookieCallback10116', new ResultData(typeof (cookie), cookie));
      }
    })
  }

  fetchCookiePromise(){
    webview.WebCookieManager.setCookie(URL, 'a=b');
    webview.WebCookieManager.fetchCookie(URL)
      .then(cookie => {
        if (cookie) {
          hilog.info(0x0000, 'testTag', '%{public}s', 'value: ' + cookie);
          AppStorage.setOrCreate('fetchCookiePromise10117', new ResultData(typeof (cookie), cookie));
        }
      })
      .catch((error: BusinessError) => {
        console.log('error: ' + JSON.stringify(error));
      })
  }

  configCookieSync(){
    webview.WebCookieManager.configCookieSync(URL, 'a=b');
    let value = webview.WebCookieManager.getCookie(URL)
    if (value) {
      hilog.info(0x0000, 'testTag', '%{public}s', 'value: ' + value);
      AppStorage.setOrCreate('configCookieSync10118', new ResultData(typeof (value), value));
    }
  }

  configCookieCallback(){
    webview.WebCookieManager.configCookie(URL, 'a=b', (error) => {
      if (error) {
        console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
      }
    })
    let value = webview.WebCookieManager.getCookie(URL);
    if (value) {
      hilog.info(0x0000, 'testTag', '%{public}s', 'value: ' + value);
      AppStorage.setOrCreate('configCookieCallback10119', new ResultData(typeof (value), value));
    }
  }

  configCookiePromise(){
    webview.WebCookieManager.configCookie(URL, 'a=b')
      .then(() => {
        console.log('configCookie success!');
      })
      .catch((error: BusinessError) => {
        console.log('error: ' + JSON.stringify(error));
      })
    let value = webview.WebCookieManager.getCookie(URL);
    if (value) {
      hilog.info(0x0000, 'testTag', '%{public}s', 'value: ' + value);
      AppStorage.setOrCreate('configCookiePromise10120', new ResultData(typeof (value), value))
    }
  }

  putAcceptCookieEnabled(){
    try {
      webview.WebCookieManager.putAcceptCookieEnabled(false);
    } catch (error) {
      console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
    }
    let result = webview.WebCookieManager.isCookieAllowed();
    hilog.info(0x0000, 'testTag', '%{public}s', 'value: result: ' + result);
    AppStorage.setOrCreate('putAcceptCookieEnabled10123', new ResultData(typeof (result), result));
  }

  putAcceptThirdPartyCookieEnabled(){
    try {
      webview.WebCookieManager.putAcceptThirdPartyCookieEnabled(false);
    } catch (error) {
      console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
    }
    let result = webview.WebCookieManager.isThirdPartyCookieAllowed();
    hilog.info(0x0000, 'testTag', '%{public}s', 'value: result: ' + result);
    AppStorage.setOrCreate('putAcceptThirdPartyCookieEnabled10124', new ResultData(typeof (result), result));
  }

  existCookie(){
    webview.WebCookieManager.setCookie(URL, 'a=b');
    let result = webview.WebCookieManager.existCookie();
    hilog.info(0x0000, 'testTag', '%{public}s', 'value: result: ' + result)
    AppStorage.setOrCreate('existCookie10125', new ResultData(typeof (result), result));
  }


}

class ResultData {
  public type: string;
  public value: string | boolean;

  constructor(type: string, value: string | boolean){
    this.type = type;
    this.value = value;
  }
}
