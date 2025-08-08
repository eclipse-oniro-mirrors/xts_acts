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

@Entry
@Component
struct webViewIncognitoMode2 {
  controller: webview.WebviewController = new webview.WebviewController();
  schemeHandler: webview.WebSchemeHandler = new webview.WebSchemeHandler()
  @State emitKey: string = '';
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = true;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State isPrivacy: boolean = false;
  @State geolocationAccess: boolean = true;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.emitKey = eventData.data.ACTION;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('web click')
          .key('webViewIncognitoModeButton2')
          .onClick(async () => {
            console.info('key==>' + this.emitKey)
            this.controller.refresh()
            await Utils.sleep(2000);
            switch (this.emitKey) {
              case 'emitWebViewIncognitoMode06': {
                try {
                  webview.WebCookieManager.configCookieSync('https://m.weibo.cn', 'testValue1232143');
                  await Utils.sleep(2000);
                  this.controller.loadUrl('https://m.weibo.cn');
                  await Utils.sleep(2000);
                  webview.WebCookieManager.clearAllCookiesSync();
                  await Utils.sleep(2000);
                  webview.WebCookieManager.clearAllCookiesSync();
                  let isExistCookie = webview.WebCookieManager.existCookie();
                  if (!isExistCookie) {
                    Utils.emitEvent('success', 8024);
                  } else {
                    Utils.emitEvent('fail', 8024);
                  }
                } catch (error) {
                  let e:business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                }
                break;
              }
            }
          })
      }
      Web({ src: '', controller: this.controller, incognitoMode: false })
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .geolocationAccess(this.geolocationAccess)
    }
  }
}
