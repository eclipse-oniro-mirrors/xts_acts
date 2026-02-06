/*
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

import testNapi from 'libentry.so'
import web_webview from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import Utils from '../../test/Utils';
import { waitForExist } from '../../test/WaitTest.test';
import { BusinessError } from '@kit.BasicServicesKit';
import { URL_EXAMPLE, URL_EXAMPLE_HTTP, URL_BAIDU} from '../../test/Config.test';

@Entry
@Component
struct WebUrlRegexRulesSetNull {

  controller: web_webview.WebviewController = new web_webview.WebviewController('ArkWeb');
  @State emitKey: string = ''
  @State isReceive: number = 0
  @State isPageEnd: number = -1
  @State matchUrlRegexRuleSetNull: string = 'no match'


  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 251223,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(251223)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.emitKey = eventData.data.ACTION;
        this.isReceive = 1
      }
    }
  }

  aboutToAppear() {
    console.info('start run testcase!!!')
  }


  build() {
    Column() {
      Row() {
        Column() {
          Button('UrlRegexRules set null').key('UrlRegexRulesSetNull')
            .onClick(async () => {
              await waitForExist(()=>this.isReceive, 'UrlRegexRulesSetNull_isReceive', 1, 1000)
              await waitForExist(()=>this.isPageEnd, 'UrlRegexRulesSetNull_isPageEnd', 1, 1000)
              console.info('key==>' + this.emitKey)
              this.isReceive = 0
              switch (this.emitKey) {
                case 'testUrlRegexRulesSetNull': {
                  this.matchUrlRegexRuleSetNull = 'no match'
                  this.isPageEnd = -1
                  this.controller.loadUrl(URL_EXAMPLE_HTTP)
                  await waitForExist(()=>this.isPageEnd, 'testUrlRegexRulesSetNull_isPageEnd', 1, 1000)
                  await waitForExist(()=>this.matchUrlRegexRuleSetNull, 'testUrlRegexRulesSetNull', 'no match', 3000)
                  Utils.emitEvent(this.matchUrlRegexRuleSetNull,25122301)
                  break
                }

              }
            })
        }
      }
      Web({src: $rawfile('runJSTest.html'), controller: this.controller})
        .javaScriptAccess(true)
        .fileAccess(true)
        .domStorageAccess(true)
        .databaseAccess(true)
        .runJavaScriptOnDocumentStart([{
            script: 'console("urlRegexRules set null")',
            scriptRules: [],
            urlRegexRules: [{
                secondLevelDomain: null, rule: null
            }]
        }])
        .runJavaScriptOnHeadEnd([{
            script: 'console("urlRegexRules set null")',
            scriptRules: [],
            urlRegexRules: [{
                secondLevelDomain: null, rule: null
            }]
        }])
        .runJavaScriptOnDocumentEnd([{
            script: 'console("urlRegexRules set null")',
            scriptRules: [],
            urlRegexRules: [{
                secondLevelDomain: null, rule: null
            }]
        }])
        .onControllerAttached(() => {
          console.log('onControllerAttached webId:' + this.controller.getWebId())
        })
        .onPageBegin((event) => {
          console.log('onPageBegin url:' + event.url)
        })
        .onPageEnd((event) => {
          console.log('onPageEnd url:' + event.url)
          this.isPageEnd = 1
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
        .onConsole((event: OnConsoleEvent) => {
            let msg = event.message.getMessage()
            console.log('onConsole getMessage: ' + msg);
            if (msg === 'urlRegexRules set null') {
                this.matchUrlRegexRuleSetNull = msg
            }
            return false
        })

    }
  }
}
