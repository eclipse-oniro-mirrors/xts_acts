/*
 * Copyright (c) 2021~2023 Huawei Device Co., Ltd.
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
import fileio from '@ohos.fileio';
import prompt from '@system.prompt';
import cert from '@ohos.security.cert';
import {waitForAssert, waitForExist} from '../../test/WaitTest';




@Entry
@Component
struct WebSageLoadOne {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  controllerTwo: web_webview.WebviewController = new web_webview.WebviewController();
  dialogController?: CustomDialogController;
  scheme1: web_webview.WebCustomScheme = { schemeName: 'name1', isSupportCORS: true, isSupportFetch: true };
  scheme2: web_webview.WebCustomScheme = { schemeName: 'name2', isSupportCORS: true, isSupportFetch: true };
  scheme3: web_webview.WebCustomScheme = { schemeName: 'name3', isSupportCORS: true, isSupportFetch: true };
  responseweb: WebResourceResponse = new WebResourceResponse();
  @State str: string = 'emitSetHttpDnsSuccessAuto';
  @State text: boolean = false;
  @State num: number = 0;
  @State mode: WebDarkMode = WebDarkMode.Off;
  @State mode1: WebDarkMode = WebDarkMode.On;
  @State mode2: WebDarkMode = WebDarkMode.Auto;
  @State enterPageEnd: boolean = false;
  @State getString: boolean = false;
  @State getNum: boolean = false;
  @State getBoo: boolean = false;
  @State getArrayBuffer: boolean = false;
  @State getArray: boolean = false;
  @State msg1: string = '';
  @State type: number = 0;
  @State enterPageEndAuto: boolean = false;
  @State enterPageEndOff: boolean = false;
  @State outputStr: string = '';
  message: web_webview.WebMessageExt = new web_webview.WebMessageExt();
  ports: web_webview.WebMessagePort[] | null = null;
  nativePort: web_webview.WebMessagePort | null = null;
  @State webMessResult: string = ''
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;


  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 160790,
      priority: events_emitter.EventPriority.LOW
    };
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack);
  }

  onPageHide() {
    events_emitter.off(160790)
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

    try {
      web_webview.WebviewController.customizeSchemes([this.scheme1, this.scheme2, this.scheme3]);
      web_webview.WebviewController.setWebDebuggingAccess(true);
      web_webview.once('webInited', () => {
        web_webview.WebCookieManager.setCookie('https://www.huawei.com', 'a=b');
      });
    } catch (error) {
      console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
    }

  }

  build() {
    Column() {
      Row() {
        Button('web click').key('webSafeLoadButton').onClick(async () => {
          await waitForExist(() => this.isPageEnd, this.str, 0);
          await waitForExist(() => this.isReceive, this.str, 0);
          this.isReceive = -1;
          console.info('key==>' + this.str);
          switch (this.str) {
            case 'emitSetHttpDnsSuccessAuto': {
              try {
                web_webview.WebviewController.setHttpDns(web_webview.SecureDnsMode.AUTO, 'https://httpdns-browser.platform.dbankcloud.cn/dns-query{?dns}');
                this.controller.loadUrl('https://www.example.com/');
                this.enterPageEndAuto = true;
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              if (this.enterPageEndAuto) {
                Utils.emitEvent(this.controller.getTitle(), 160800);
                this.enterPageEndAuto = false;
              }
              break;
            }
            case 'emitSetHttpDnsSuccessOff': {
              try {
                web_webview.WebviewController.setHttpDns(web_webview.SecureDnsMode.OFF, 'https://httpdns-browser.platform.dbankcloud.cn/dns-query{?dns}');
                this.controller.loadUrl('https://www.example.com/');
                this.enterPageEndOff = true;
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              if (this.enterPageEndOff) {
                Utils.emitEvent(this.controller.getTitle(), 160810);
                this.enterPageEndOff = false;
              }
              break;
            }
            case 'emitGetCustomUserAgent': {
              try {
                let setUA = 'userAgent';
                this.controller.setCustomUserAgent(setUA);
                Utils.emitEvent(this.controller.getCustomUserAgent(), 160820);
              } catch (error) {
                console.error(`ErrorCode: ${error.code}, Message: ${error.message}`);
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
        .onDataResubmitted((event) => {
          console.log('onDataResubmitted');
          event.handler.resend();
        })
        .onContextMenuShow((event) => {
          console.info(event.param.getMediaType() + event.param.getSelectionText() + event.param.getSourceType());
          console.info(event.param.getInputFieldType().toString());
          console.info(event.param.isEditable().toString());
          console.info(event.param.getEditStateFlags().toString());
          event.result.paste();
          event.result.cut();
          return true;
        })
        .onHttpErrorReceive((event) => {
          event.response.setResponseIsReady(true);
        })
        .onPageEnd((event) => {
          this.isPageEnd = 0;

        })
        .darkMode(this.mode)
        .forceDarkAccess(false)
        .webSerifFont('serif')
        .webFixedFont('fixed')
        .webSansSerifFont('serif')
        .minLogicalFontSize(1)
        .horizontalScrollBarAccess(true)
        .verticalScrollBarAccess(true)
        .onTouchIconUrlReceived((event) => {
          console.log('onTouchIconUrlReceived:' + JSON.stringify(event));
        })
        .pinchSmooth(true)
        .onSslErrorEvent((event: SslErrorEvent) => {
          console.info('onSslErrorEvent url: ' + event.url);
          console.info('onSslErrorEvent error: ' + event.error);
          console.info('onSslErrorEvent originalUrl: ' + event.originalUrl);
          console.info('onSslErrorEvent referrer: ' + event.referrer);
          console.info('onSslErrorEvent isFatalError: ' + event.isFatalError);
          console.info('onSslErrorEvent isMainFrame: ' + event.isMainFrame);
          event.handler.handleConfirm();
        })
    }
  }
}