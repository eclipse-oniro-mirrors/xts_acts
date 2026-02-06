/*
 * Copyright (c) 2021~2025 Huawei Device Co., Ltd.
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
import events_emitter from '@ohos.events.emitter';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
import Utils from '../../test/Utils';
import web_webview from '@ohos.web.webview';
import { waitForExist } from '../../test/WaitTest.test';
import { Constants } from '../../test/Constants.test';

@Entry
@Component
struct Index {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  scheme1: web_webview.WebCustomScheme = { schemeName: 'name1', isSupportCORS: true, isSupportFetch: true };
  scheme2: web_webview.WebCustomScheme = { schemeName: 'name2', isSupportCORS: true, isSupportFetch: true };
  scheme3: web_webview.WebCustomScheme = { schemeName: 'name3', isSupportCORS: true, isSupportFetch: true };
  @State str: string = 'emitBackward';
  @State text: boolean = false;
  @State mode: WebDarkMode = WebDarkMode.Off;
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 135300,
      priority: events_emitter.EventPriority.LOW,
    };
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack);
  }

  onPageHide() {
    events_emitter.off(135300)
  }

  private valueChangeCallBack = (eventData: ESObject) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }

  aboutToAppear() {
    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
    let abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
    console.info('start run testcase!!!')
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
    try {
      web_webview.WebviewController.customizeSchemes([this.scheme1, this.scheme2, this.scheme3]);
      web_webview.WebviewController.setWebDebuggingAccess(true);
      web_webview.once('webInited', () => {
        web_webview.WebCookieManager.setCookie(Constants.EXAMPLE_URL, 'a=b');
      });
    } catch (error) {
      console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
    }
  }

  private async execTestPre() {
    this.isPageEnd = -1;
    this.controller.loadUrl(Constants.EXAMPLE_URL);
    await waitForExist(() => this.isPageEnd, this.str, 0);

    this.controller.clearHistory();

    this.isPageEnd = -1;
    this.controller.loadUrl($rawfile('index.html'));
    await waitForExist(() => this.isPageEnd, this.str, 0);

    let title = this.controller.getTitle();
    console.info('title:' + title);

    this.isPageEnd = -1;
    this.controller.loadData(
      '<html><head><title>demo</title></head><body bgcolor="white">Source:<pre>source</pre></body></html>',
      'text/html',
      'UTF-8',
    );
    await waitForExist(() => this.isPageEnd, this.str, 0);
    let title1 = this.controller.getTitle();
    console.info('title1:' + title1);
  }

  build() {
    Column() {
      Row() {
        Button('web click').key('webcomponent').onClick(async () => {
          await waitForExist(() => this.isPageEnd, this.str, 0);
          await waitForExist(() => this.isReceive, this.str, 0);
          this.isReceive = -1;
          console.info('key==>' + this.str);
          switch (this.str) {
            case 'emitBackward': {
              try {
                await this.execTestPre();

                this.isPageEnd = -1;
                this.controller.backward();
                await waitForExist(() => this.isPageEnd, this.str, 0);

                let title2 = this.controller.getTitle();
                Utils.emitEvent(title2, 135310);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'emitForward': {
              try {
                await this.execTestPre();

                this.isPageEnd = -1;
                this.controller.backward();
                await waitForExist(() => this.isPageEnd, this.str, 0);

                this.isPageEnd = -1;
                this.controller.forward();
                await waitForExist(() => this.isPageEnd, this.str, 0);

                let title3 = this.controller.getTitle();
                Utils.emitEvent(title3, 135320);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'emitAccessBackward': {
              try {
                await this.execTestPre();

                let result0 = this.controller.accessBackward();
                Utils.emitEvent(result0, 135330);
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }
            case 'emitAccessForward': {
              try {
                await this.execTestPre();

                let result1 = this.controller.accessForward();
                Utils.emitEvent(result1, 135340);
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }

            case 'emitAccessStep': {
              try {
                await this.execTestPre();

                let result2 = this.controller.accessStep(-2);
                Utils.emitEvent(result2, 135350);
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }
            case 'emitClearHistory': {
              try {
                await this.execTestPre();

                this.controller.clearHistory();

                let result3 = this.controller.accessStep(-2);
                console.log('result: ' + result3);
                Utils.emitEvent(result3, 135360);
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
              }
              break;
            }
            case 'emitOnce': {
              try {
                let re = web_webview.WebCookieManager.getCookie(Constants.EXAMPLE_URL);
                console.log('result: ' + re);
                Utils.emitEvent(re, 135370);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'emitGetItemAtIndex': {
              try {
                await this.execTestPre();

                let res = this.controller.getBackForwardEntries();
                let item = res.getItemAtIndex(0);
                console.log('result: ' + item.title);
                Utils.emitEvent(item.title, 135380);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            default:
              console.info('can not match case');
          }
        })
      }

      Web({ src: 'www.example.com', controller: this.controller })
        .mediaPlayGestureAccess(true)
        .javaScriptAccess(true)
        .zoomAccess(this.text)
        .darkMode(this.mode)
        .forceDarkAccess(false)
        .webSerifFont('serif')
        .webFixedFont('fixed')
        .webSansSerifFont('serif')
        .minLogicalFontSize(1)
        .horizontalScrollBarAccess(true)
        .verticalScrollBarAccess(true)
        .pinchSmooth(true)
        .onPageEnd((event) => {
          console.log('web pageEnd==>' + event.url);
          this.isPageEnd = 0;
        })
        .onSslErrorEvent((event: SslErrorEvent) => {
          if (event) {
            console.log('onSslErrorEvent url: ' + event.url);
            console.log('onSslErrorEvent error: ' + event.error);
            console.log('onSslErrorEvent originalUrl: ' + event.originalUrl);
            console.log('onSslErrorEvent referrer: ' + event.referrer);
            console.log('onSslErrorEvent isFatalError: ' + event.isFatalError);
            console.log('onSslErrorEvent isMainFrame: ' + event.isMainFrame);
            console.log('onSslErrorEvent handler: ' + event.handler);
            event.handler.handleConfirm();
          }
        })
    }
  }
}
