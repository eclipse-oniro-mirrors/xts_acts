/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import webview from '@ohos.web.webview';
import Utils from '../../test/Utils';
import business_error from '@ohos.base';
import {waitForExist} from '../../test/WaitTest';
import { CommonConstants } from '../../test/Config';

@Entry
@Component
struct webViewGetSecurityLevel {
  controller: webview.WebviewController = new webview.WebviewController();
  schemeHandler: webview.WebSchemeHandler = new webview.WebSchemeHandler()
  @State emitKey: string = '';
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = true;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State isFrameResourceType: boolean = false
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 160030,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide(): void {
    events_emitter.off(160030)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.emitKey = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('web click')
          .key('webViewGetSecurityLevelButton')
          .onClick(async () => {
            await waitForExist(()=>this.isReceive, this.emitKey, 0);
            console.info('key==>' + this.emitKey);
            this.isReceive = -1;
            switch (this.emitKey) {
              case 'emitWebViewGetSecurityLevel01': {
                try {
                  this.isPageEnd = -1;
                  this.controller.loadUrl('https://weixin://dl/moments');
                  await waitForExist(()=>this.isPageEnd, this.emitKey, 0);
                  let securityLevel = this.controller.getSecurityLevel();
                  console.log('securityLevel===>'+securityLevel)
                  if (securityLevel === 0) {
                    Utils.emitEvent('success', 160040);
                  } else {
                    Utils.emitEvent('fail', 160040);
                  }
                } catch (error) {
                  let e:business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                }
                break;
              }
              case 'testWebViewGetSecurityLevelSecure': {
                  try {
                    this.isPageEnd = -1;
                    this.controller.loadUrl(CommonConstants.URL_HTTPS_BAIDU);
                    await waitForExist(()=>this.isPageEnd, 'testWebViewGetSecurityLevelSecure_isPageEnd', 0, 1000);
                    let securityLevel = this.controller.getSecurityLevel();
                    console.log('securityLevel===>'+securityLevel)
                    Utils.emitEvent(securityLevel, 25102202);
                  } catch (error) {
                    let e:business_error.BusinessError = error as business_error.BusinessError;
                    console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    Utils.emitEvent('fail', 25102202);
                  }
                  break;
              }
              case 'testWebViewGetSecurityLevelWarning': {
                  try {
                    this.isPageEnd = -1;
                    this.controller.loadUrl(CommonConstants.URL_HTTP_EXAMPLE);
                    await waitForExist(()=>this.isPageEnd, 'testWebViewGetSecurityLevelWarning_isPageEnd', 0, 1000);
                    let securityLevel = this.controller.getSecurityLevel();
                    console.log('securityLevel===>'+securityLevel)
                    Utils.emitEvent(securityLevel, 25102203);
                  } catch (error) {
                    let e:business_error.BusinessError = error as business_error.BusinessError;
                    console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    Utils.emitEvent('fail', 25102203);
                  }
                  break;
              }
              case 'testWebViewGetSecurityLevelDangerous': {
                  try {
                    this.isPageEnd = -1;
                    this.controller.loadUrl(CommonConstants.URL_HTTPS_EXPIREDBADSSL);
                    await waitForExist(()=>this.isPageEnd, 'testWebViewGetSecurityLevelDangerous_isPageEnd', 0, 1000);
                    let securityLevel = this.controller.getSecurityLevel();
                    console.log('securityLevel===>'+securityLevel)
                    Utils.emitEvent(securityLevel, 25102204);
                  } catch (error) {
                    let e:business_error.BusinessError = error as business_error.BusinessError;
                    console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                    Utils.emitEvent('fail', 25102204);
                  }
                  break;
              }
            }
          })
      }
      Web({ src: '', controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .onPageEnd(()=>{
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
