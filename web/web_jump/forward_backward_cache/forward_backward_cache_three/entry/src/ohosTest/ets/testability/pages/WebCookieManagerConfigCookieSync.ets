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

import Utils from '../../test/Utils';
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import business_error from '@ohos.base';
import { waitForExist, waitForAssert } from '../../test/WaitTest';
import { URL, URL_INVALID } from '../../test/Config';

@Entry
@Component
struct WebCookieManagerConfigCookieSync {
  controller: webView.WebviewController = new webView.WebviewController();
  nativePort: webView.WebMessagePort | null = null;
  responseWeb: WebResourceResponse = new WebResourceResponse()
  @State str: string = ''
  @State javaScriptAccess: boolean = true;
  @State isComplete: number = -1;
  @State isReceive: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 135550,
      priority: events_emitter.EventPriority.LOW,
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(135550)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('WebCookieManagerConfigCookieSyncTest click')
          .key('WebCookieManagerConfigCookieSyncTestButton')
          .onClick(async () => {
            await waitForExist(() => this.isComplete, this.str, 0);
            await waitForExist(() => this.isReceive, this.str, 0);
            this.isReceive = -1;
            console.info('key==>' + this.str)
            switch (this.str) {
              case 'testConfigCookieSyncUrlEmpty001': {
                let resultValue: number = 0;
                try {
                  webView.WebCookieManager.clearAllCookiesSync(true);
                  webView.WebCookieManager.configCookieSync('', 'id=123', true);
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`testConfigCookieSyncUrlEmpty001 ErrorCode: ${e.code},  Message: ${e.message}`);
                  resultValue = error.code
                }
                let check = (v1: number, v2: number): boolean => {
                  return v1 == v2 ? true : false;
                }
                await waitForAssert(() => resultValue, check, 17100002, 135560, this.str);
                break;
              }

              case 'testConfigCookieSyncValueEmpty002': {
                let resultValue: number = 0;
                try {
                  webView.WebCookieManager.clearAllCookiesSync(true);
                  webView.WebCookieManager.configCookieSync(URL, '', true);
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`testConfigCookieSyncValueEmpty002 ErrorCode: ${e.code},  Message: ${e.message}`);
                  resultValue = error.code
                }
                let check = (v1: number, v2: number): boolean => {
                  return v1 == v2 ? true : false;
                }
                await waitForAssert(() => resultValue, check, 17100005, 135570, this.str);
                break;
              }

              case 'testConfigCookieSyncUrlAndValueEmpty003': {
                let resultValue: number = 0;
                try {
                  webView.WebCookieManager.clearAllCookiesSync(true);
                  webView.WebCookieManager.configCookieSync('', '', true);
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`testConfigCookieSyncUrlAndValueEmpty003 ErrorCode: ${e.code},  Message: ${e.message}`);
                  resultValue = error.code
                }
                let check = (v1: number, v2: number): boolean => {
                  return v1 == v2 ? true : false;
                }
                await waitForAssert(() => resultValue, check,  17100002, 135580, this.str);
                break;
              }

              case 'testConfigCookieSyncUrlInvalid004': {
                let resultValue: number = 0;
                try {
                  webView.WebCookieManager.clearAllCookiesSync(true);
                  webView.WebCookieManager.configCookieSync(URL_INVALID, 'id=123', true);
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`testConfigCookieSyncUrlInvalid004 ErrorCode: ${e.code},  Message: ${e.message}`);
                  resultValue = error.code
                }
                let check = (v1: number, v2: number): boolean => {
                  return v1 == v2 ? true : false;
                }
                await waitForAssert(() => resultValue, check, 17100002, 135590, this.str);
                break;
              }

              case 'testConfigCookieSyncValueInvalid005': {
                let resultValue: number = 0;
                try {
                  webView.WebCookieManager.clearAllCookiesSync(true);
                  webView.WebCookieManager.configCookieSync(URL, '', true);
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`testConfigCookieSyncValueInvalid005 ErrorCode: ${e.code},  Message: ${e.message}`);
                  resultValue = error.code
                }
                let check = (v1: number, v2: number): boolean => {
                  return v1 == v2 ? true : false;
                }
                await waitForAssert(() => resultValue, check, 17100005, 135600, this.str);
                break;
              }

              case 'testConfigCookieSyncIncognitoTrue006': {
                let resultValue: string = '1';
                try {
                  webView.WebCookieManager.clearAllCookiesSync(true);
                  webView.WebCookieManager.configCookieSync(URL, 'test_cookie=test_value; Path=/', true);
                  let cookie = webView.WebCookieManager.fetchCookieSync(URL, true);
                  console.log('testConfigCookieSyncIncognitoTrue006 fetchCookie cookie : ' + cookie);
                  resultValue = cookie;
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`testConfigCookieSyncIncognitoTrue006 ErrorCode: ${e.code},  Message: ${e.message}`);
                  resultValue = String(error.code)
                }
                let check = (v1: string, v2: string): boolean => {
                  return v1 === v2 ? true : false;
                }
                await waitForAssert(() => resultValue, check, 'test_cookie=test_value', 135610, this.str);
                break;
              }

              case 'testConfigCookieSyncIncognitoFalse007': {
                let resultValue: string = '1';
                try {
                  webView.WebCookieManager.clearAllCookiesSync(false);
                  webView.WebCookieManager.configCookieSync(URL, 'session_id=abc123; Secure', false);
                  let cookie = webView.WebCookieManager.fetchCookieSync(URL, false);
                  console.log('testConfigCookieSyncIncognitoFalse007 fetchCookie cookie : ' + cookie);
                  resultValue = cookie;
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`testConfigCookieSyncIncognitoFalse007 ErrorCode: ${e.code},  Message: ${e.message}`);
                  resultValue = String(error.code)
                }
                let check = (v1: string, v2: string): boolean => {
                  return v1 === v2 ? true : false;
                }
                await waitForAssert(() => resultValue, check, 'session_id=abc123', 135620, this.str);
                break;
              }

              case 'testConfigCookieSyncIncognitoUndefined008': {
                let resultValue: string = '1';
                try {
                  webView.WebCookieManager.clearAllCookiesSync(false);
                  webView.WebCookieManager.configCookieSync(URL, 'user_id=user123; Max-Age=3600');
                  let cookie = webView.WebCookieManager.fetchCookieSync(URL, false);
                  console.log('testConfigCookieSyncIncognitoUndefined008 fetchCookie cookie : ' + cookie);
                  resultValue = cookie;
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`testConfigCookieSyncIncognitoUndefined008 ErrorCode: ${e.code},  Message: ${e.message}`);
                  resultValue = String(error.code)
                }
                let check = (v1: string, v2: string): boolean => {
                  return v1 === v2 ? true : false;
                }
                await waitForAssert(() => resultValue, check, 'user_id=user123', 135630, this.str);
                break;
              }

              case 'testConfigCookieSyncValidParams009': {
                let resultValue: string = '1';
                try {
                  webView.WebCookieManager.clearAllCookiesSync(false);
                  webView.WebCookieManager.configCookieSync(URL, 'preference=dark_mode; HttpOnly');
                  let cookie = webView.WebCookieManager.fetchCookieSync(URL, false);
                  console.log('testConfigCookieSyncValidParams009 fetchCookie cookie : ' + cookie);
                  resultValue = cookie;
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`testConfigCookieSyncValidParams009 ErrorCode: ${e.code},  Message: ${e.message}`);
                  resultValue = String(error.code)
                }
                let check = (v1: string, v2: string): boolean => {
                  return v1 === v2 ? true : false;
                }
                await waitForAssert(() => resultValue, check, 'preference=dark_mode', 135640, this.str);
                break;
              }

              case 'testConfigCookieSyncMultipleCalls010': {
                let resultValue: string = '1';
                try {
                  webView.WebCookieManager.clearAllCookiesSync(false);
                  webView.WebCookieManager.configCookieSync(URL, 'cookie1=value1; Domain=.example.com');
                  let cookie = webView.WebCookieManager.fetchCookieSync(URL, false);
                  console.log('testConfigCookieSyncMultipleCalls010 fetchCookie cookie : ' + cookie);
                  resultValue = cookie;
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`testConfigCookieSyncMultipleCalls010 ErrorCode: ${e.code},  Message: ${e.message}`);
                  resultValue = String(error.code)
                }
                let check = (v1: string, v2: string): boolean => {
                  return v1 === v2 ? true : false;
                }
                await waitForAssert(() => resultValue, check, 'cookie1=value1', 135650, this.str);
                break;
              }

              case 'testConfigCookieSyncSecureAttribute011': {
                let resultValue: string = '1';
                try {
                  webView.WebCookieManager.clearAllCookiesSync(true);
                  webView.WebCookieManager.configCookieSync(URL, 'token=secret; Secure; SameSite=Strict', true);
                  let cookie = webView.WebCookieManager.fetchCookieSync(URL, true);
                  console.log('testConfigCookieSyncSecureAttribute011 fetchCookie cookie : ' + cookie);
                  resultValue = cookie;
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`testConfigCookieSyncSecureAttribute011 ErrorCode: ${e.code},  Message: ${e.message}`);
                  resultValue = String(error.code)
                }
                let check = (v1: string, v2: string): boolean => {
                  return v1 === v2 ? true : false;
                }
                await waitForAssert(() => resultValue, check, 'token=secret', 135660, this.str);
                break;
              }

              case 'testConfigCookieSyncMaxAgeAttribute012': {
                let resultValue: string = '1';
                try {
                  webView.WebCookieManager.clearAllCookiesSync(false);
                  webView.WebCookieManager.configCookieSync(URL, 'session=xyz; Max-Age=86400');
                  let cookie = webView.WebCookieManager.fetchCookieSync(URL, false);
                  console.log('testConfigCookieSyncMaxAgeAttribute012 fetchCookie cookie : ' + cookie);
                  resultValue = cookie;
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`testConfigCookieSyncMaxAgeAttribute012 ErrorCode: ${e.code},  Message: ${e.message}`);
                  resultValue = String(error.code)
                }
                let check = (v1: string, v2: string): boolean => {
                  return v1 === v2 ? true : false;
                }
                await waitForAssert(() => resultValue, check, 'session=xyz', 135670, this.str);
                break;
              }

              case 'testConfigCookieSyncDomainAttribute013': {
                let resultValue: string = '1';
                try {
                  webView.WebCookieManager.clearAllCookiesSync(false);
                  webView.WebCookieManager.configCookieSync(URL, 'uid=user123; Domain=.example.com; Path=/');
                  let cookie = webView.WebCookieManager.fetchCookieSync(URL, false);
                  console.log('testConfigCookieSyncDomainAttribute013 fetchCookie cookie : ' + cookie);
                  resultValue = cookie;
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`testConfigCookieSyncDomainAttribute013 ErrorCode: ${e.code},  Message: ${e.message}`);
                  resultValue = String(error.code)
                }
                let check = (v1: string, v2: string): boolean => {
                  return v1 === v2 ? true : false;
                }
                await waitForAssert(() => resultValue, check, 'uid=user123', 135680, this.str);
                break;
              }

              case 'testConfigCookieSyncPathAttribute014': {
                let resultValue: string = '1';
                try {
                  webView.WebCookieManager.clearAllCookiesSync(false);
                  webView.WebCookieManager.configCookieSync(URL, 'lang=en; Path=/app');
                  let cookie = webView.WebCookieManager.fetchCookieSync(URL, false);
                  console.log('testConfigCookieSyncPathAttribute014 fetchCookie cookie : ' + cookie);
                  resultValue = cookie;
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`testConfigCookieSyncPathAttribute014 ErrorCode: ${e.code},  Message: ${e.message}`);
                  resultValue = String(error.code)
                }
                let check = (v1: string, v2: string): boolean => {
                  return v1 === v2 ? true : false;
                }
                await waitForAssert(() => resultValue, check, '', 135690, this.str);
                break;
              }

              case 'testConfigCookieSyncSameSiteAttribute015': {
                let resultValue: string = '1';
                try {
                  webView.WebCookieManager.clearAllCookiesSync(false);
                  webView.WebCookieManager.configCookieSync(URL, 'csrf_token=token; SameSite=Lax');
                  let cookie = webView.WebCookieManager.fetchCookieSync(URL, false);
                  console.log('testConfigCookieSyncSameSiteAttribute015 fetchCookie cookie : ' + cookie);
                  resultValue = cookie;
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`testConfigCookieSyncSameSiteAttribute015 ErrorCode: ${e.code},  Message: ${e.message}`);
                  resultValue = String(error.code)
                }
                let check = (v1: string, v2: string): boolean => {
                  return v1 === v2 ? true : false;
                }
                await waitForAssert(() => resultValue, check, 'csrf_token=token', 135700, this.str);
                break;
              }

              case 'testConfigCookieSyncUrlWithPort016': {
                let resultValue: string = '1';
                try {
                  let urlWithPort: string = 'https://www.example.com:8080';
                  webView.WebCookieManager.clearAllCookiesSync(false);
                  webView.WebCookieManager.configCookieSync(urlWithPort, 'port_test=value8080');
                  let cookie = webView.WebCookieManager.fetchCookieSync(urlWithPort, false);
                  console.log('testConfigCookieSyncUrlWithPort016 fetchCookie cookie : ' + cookie);
                  resultValue = cookie;
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`testConfigCookieSyncUrlWithPort016 ErrorCode: ${e.code},  Message: ${e.message}`);
                  resultValue = String(error.code)
                }
                let check = (v1: string, v2: string): boolean => {
                  return v1 === v2 ? true : false;
                }
                await waitForAssert(() => resultValue, check, 'port_test=value8080', 135710, this.str);
                break;
              }

              case 'testConfigCookieSyncSpecialCharacters017': {
                let resultValue: string = '1';
                try {
                  webView.WebCookieManager.clearAllCookiesSync(false);
                  webView.WebCookieManager.configCookieSync(URL, 'data=encoded%20value%20test');
                  let cookie = webView.WebCookieManager.fetchCookieSync(URL, false);
                  console.log('testConfigCookieSyncSpecialCharacters017 fetchCookie cookie : ' + cookie);
                  resultValue = cookie;
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`testConfigCookieSyncSpecialCharacters017 ErrorCode: ${e.code},  Message: ${e.message}`);
                  resultValue = String(error.code)
                }
                let check = (v1: string, v2: string): boolean => {
                  return v1 === v2 ? true : false;
                }
                await waitForAssert(() => resultValue, check, 'data=encoded%20value%20test', 135720, this.str);
                break;
              }

              case 'testConfigCookieSyncLongUrl018': {
                let resultValue: number = 0;
                try {
                  let longUrl: string = 'https://' + 'a'.repeat(2000) + '.com';
                  webView.WebCookieManager.clearAllCookiesSync(true);
                  webView.WebCookieManager.configCookieSync(longUrl, 'test=value', true);
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`testConfigCookieSyncLongUrl018 ErrorCode: ${e.code},  Message: ${e.message}`);
                  resultValue = error.code
                }
                let check = (v1: number, v2: number): boolean => {
                  return v1 == v2 ? true : false;
                }
                await waitForAssert(() => resultValue, check, 0, 135730, this.str);
                break;
              }

              case 'testConfigCookieSyncLongValue019': {
                let resultValue: number = 0;
                try {
                  let longValue: string = 'test=' + 'x'.repeat(20000);
                  webView.WebCookieManager.clearAllCookiesSync(true);
                  webView.WebCookieManager.configCookieSync(URL, longValue, true);
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`testConfigCookieSyncLongValue019 ErrorCode: ${e.code},  Message: ${e.message}`);
                  resultValue = error.code
                }
                let check = (v1: number, v2: number): boolean => {
                  return v1 == v2 ? true : false;
                }
                await waitForAssert(() => resultValue, check, 17100005, 135740, this.str);
                break;
              }

              case 'testConfigCookieSyncHttpOnly020': {
                let resultValue: string = '1';
                try {
                  webView.WebCookieManager.clearAllCookiesSync(true);
                  webView.WebCookieManager.configCookieSync(URL, 'auth_ticket=xyz123; HttpOnly', true);
                  let cookie = webView.WebCookieManager.fetchCookieSync(URL, true);
                  console.log('testConfigCookieSyncHttpOnly020 fetchCookie cookie : ' + cookie);
                  resultValue = cookie;
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`testConfigCookieSyncHttpOnly020 ErrorCode: ${e.code},  Message: ${e.message}`);
                  resultValue = String(error.code)
                }
                let check = (v1: string, v2: string): boolean => {
                  return v1 === v2 ? true : false;
                }
                await waitForAssert(() => resultValue, check, 'auth_ticket=xyz123', 135750, this.str);
                break;
              }
              case 'testConfigCookieSyncExpiresAttribute021': {
                let resultValue: string = '1';
                try {
                  webView.WebCookieManager.clearAllCookiesSync(false);
                  webView.WebCookieManager.configCookieSync(URL, 'visit=true; Expires=Wed, 09 Jun 2025 10:18:14 GMT');
                  let cookie = webView.WebCookieManager.fetchCookieSync(URL, false);
                  console.log('testConfigCookieSyncExpiresAttribute021 fetchCookie cookie : ' + cookie);
                  resultValue = cookie;
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`testConfigCookieSyncExpiresAttribute021 ErrorCode: ${e.code},  Message: ${e.message}`);
                  resultValue = String(error.code)
                }
                let check = (v1: string, v2: string): boolean => {
                  return v1 === v2 ? true : false;
                }
                await waitForAssert(() => resultValue, check, '', 135760, this.str);
                break;
              }


              case 'testConfigCookieSyncErrorCode401022': {
                let resultValue: number = 0;
                try {
                  webView.WebCookieManager.clearAllCookiesSync(true);
                  webView.WebCookieManager.configCookieSync('', 'test=value', true);
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`testConfigCookieSyncErrorCode401022 ErrorCode: ${e.code},  Message: ${e.message}`);
                  resultValue = error.code
                }
                let check = (v1: number, v2: number): boolean => {
                  return v1 == v2 ? true : false;
                }
                await waitForAssert(() => resultValue, check, 17100002, 135770, this.str);
                break;
              }

              case 'testConfigCookieSyncErrorCode17100002023': {
                let resultValue: number = 0;
                try {
                  webView.WebCookieManager.clearAllCookiesSync(true);
                  webView.WebCookieManager.configCookieSync(URL_INVALID, 'test=value', true);
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`testConfigCookieSyncErrorCode17100002023 ErrorCode: ${e.code},  Message: ${e.message}`);
                  resultValue = error.code
                }
                let check = (v1: number, v2: number): boolean => {
                  return v1 == v2 ? true : false;
                }
                await waitForAssert(() => resultValue, check, 17100002, 135780, this.str);
                break;
              }

              case 'testConfigCookieSyncErrorCode17100005024': {
                let resultValue: number = 0;
                try {
                  webView.WebCookieManager.clearAllCookiesSync(true);
                  webView.WebCookieManager.configCookieSync(URL, '', true);
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`testConfigCookieSyncErrorCode17100005024 ErrorCode: ${e.code},  Message: ${e.message}`);
                  resultValue = error.code
                }
                let check = (v1: number, v2: number): boolean => {
                  return v1 == v2 ? true : false;
                }
                await waitForAssert(() => resultValue, check, 17100005, 135790, this.str);
                break;
              }

              case 'testConfigCookieSyncUrlNull025': {
                let resultValue: number = 0;
                try {
                  webView.WebCookieManager.clearAllCookiesSync(true);
                  webView.WebCookieManager.configCookieSync(null, 'test=value', true);
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`testConfigCookieSyncUrlNull025 ErrorCode: ${e.code},  Message: ${e.message}`);
                  resultValue = error.code
                }
                let check = (v1: number, v2: number): boolean => {
                  return v1 == v2 ? true : false;
                }
                await waitForAssert(() => resultValue, check, 401, 135800, this.str);
                break;
              }

              case 'testConfigCookieSyncUrlUndefined026': {
                let resultValue: number = 0;
                try {
                  webView.WebCookieManager.clearAllCookiesSync(true);
                  webView.WebCookieManager.configCookieSync(undefined, 'test=value', true);
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`testConfigCookieSyncUrlUndefined026 ErrorCode: ${e.code},  Message: ${e.message}`);
                  resultValue = error.code
                }
                let check = (v1: number, v2: number): boolean => {
                  return v1 == v2 ? true : false;
                }
                await waitForAssert(() => resultValue, check, 401, 135810, this.str);
                break;
              }

              case 'testConfigCookieSyncValueNull027': {
                let resultValue: number = 0;
                try {
                  webView.WebCookieManager.clearAllCookiesSync(true);
                  webView.WebCookieManager.configCookieSync(URL, null, true);
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`testConfigCookieSyncValueNull027 ErrorCode: ${e.code},  Message: ${e.message}`);
                  resultValue = error.code
                }
                let check = (v1: number, v2: number): boolean => {
                  return v1 == v2 ? true : false;
                }
                await waitForAssert(() => resultValue, check, 401, 135820, this.str);
                break;
              }

              case 'testConfigCookieSyncValueUndefined028': {
                let resultValue: number = 0;
                try {
                  webView.WebCookieManager.clearAllCookiesSync(true);
                  webView.WebCookieManager.configCookieSync(URL, undefined, true);
                } catch (error) {
                  let e: business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`testConfigCookieSyncValueUndefined028 ErrorCode: ${e.code},  Message: ${e.message}`);
                  resultValue = error.code
                }
                let check = (v1: number, v2: number): boolean => {
                  return v1 == v2 ? true : false;
                }
                await waitForAssert(() => resultValue, check, 401, 135830, this.str);
                break;
              }

            }
          })
      }

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .javaScriptAccess(true)
        .onPageEnd((event) => {
          console.log('web pageEnd==>' + event.url);
          this.isComplete = 0;
        })
    }
  }
}
