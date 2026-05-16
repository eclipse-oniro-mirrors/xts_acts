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



import { Entry, Component, Column, Row, Button, ClickEvent, Web, ScriptItem, ClickEvent, OnConsoleEvent, SslErrorEvent } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import { BusinessError, Callback, RecordData } from '@ohos.base';

import web_webview from '@ohos.web.webview';
import emitter from '@ohos.events.emitter';
import events_emitter from '@ohos.events.emitter';

import Utils from '../../src/test/Util.test';
import waitForExist from '../../src/test/WaitTest.test';
import { URL_EXAMPLE, URL_EXAMPLE_HTTP, URL_BAIDU} from '../../src/test/Config.test';


@Entry
@Component
struct WebUrlRegexRules {

  controller: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  @State str: string = '';
  @State isReceive: int = 0
  @State isPageEnd: int = -1
  @State scriptDOMStartMessage: string = ''
  @State scriptHeadMessage: string = ''
  @State scriptDOMEndMessage: string = ''
  @State matchUrlRegexRulesEmpty: string = 'no match'
  @State matchSecondLevelDomainRuleEmpty: string = 'no match'
  @State matchRuleEmpty: string = 'no match'
  @State matchSecondLevelDomainEmpty: string = 'no match'

  @State scriptDOMStart: Array<ScriptItem> = [
     {
        script: 'console.log("scriptDOMStart:http urlRegexRules ok")',
        scriptRules: [],
        urlRegexRules: [{secondLevelDomain: 'baidu.com', rule: '^https:\\/\\/www.*'}]
     } as ScriptItem,
     {
        script: 'console.log("urlRegexRules empty")',
        scriptRules: [],
        urlRegexRules: []
     } as ScriptItem,
     {
        script: 'console.log("urlRegexRules rule empty")',
        scriptRules: [],
        urlRegexRules: [{secondLevelDomain: 'baidu.com', rule: ''}]
     } as ScriptItem,
     {
        script: 'console.log("urlRegexRules secondLevelDomain empty")',
        scriptRules: [],
        urlRegexRules: [{secondLevelDomain: '', rule: '^https:\\/\\/'}]
     } as ScriptItem,
  ];

  @State scriptHead: Array<ScriptItem> = [
     {
        script: 'console.log("scriptHead:http urlRegexRules ok")',
        scriptRules: [],
        urlRegexRules: [{secondLevelDomain: 'baidu.com', rule: '^https:\\/\\/www.*'}]
     } as ScriptItem,
     {
        script: 'console.log("urlRegexRules empty")',
        scriptRules: [],
        urlRegexRules: []
     } as ScriptItem,
     {
        script: 'console.log("urlRegexRules rule empty")',
        scriptRules: [],
        urlRegexRules: [{secondLevelDomain: 'baidu.com', rule: ''}]
     } as ScriptItem,
     {
        script: 'console.log("urlRegexRules secondLevelDomain empty")',
        scriptRules: [],
        urlRegexRules: [{secondLevelDomain: '', rule: '^https:\\/\\/'}]
     } as ScriptItem,
  ];

  @State scriptDOMEnd: Array<ScriptItem> = [
     {
        script: 'console.log("scriptDOMEnd:http urlRegexRules ok")',
        scriptRules: [],
        urlRegexRules: [{secondLevelDomain: 'baidu.com', rule: '^https:\\/\\/www.*'}]
     } as ScriptItem,
     {
        script: 'console.log("urlRegexRules empty")',
        scriptRules: [],
        urlRegexRules: []
     } as ScriptItem,
     {
        script: 'console.log("urlRegexRules rule empty")',
        scriptRules: [],
        urlRegexRules: [{secondLevelDomain: 'baidu.com', rule: ''}]
     } as ScriptItem,
     {
        script: 'console.log("urlRegexRules secondLevelDomain empty")',
        scriptRules: [],
        urlRegexRules: [{secondLevelDomain: '', rule: '^https:\\/\\/'}]
     } as ScriptItem,
  ];

  aboutToAppear() {
    console.info('aboutToAppear start run testcase!!!')
    web_webview.WebviewController.setWebDebuggingAccess(true);
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 251224,
      priority: events_emitter.EventPriority.LOW
    };
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack);
  }

  onPageHide() {
    events_emitter.off(251224);
  }

  private valueChangeCallBack: Callback<events_emitter.EventData> = (eventData: events_emitter.EventData):void => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      const data = eventData.data as Record<string, RecordData>;
      if (data != null && data['ACTION'] != null) {
        this.str = String(data['ACTION']);
        try {
          this.controller.loadUrl('resource://rawfile/index.html');
        } catch (error) {
          console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
        }
        this.isReceive = 1;
      }
    }
  }




  build() {
    Column() {
      Row() {
        Column() {
          Button('UrlRegexRules test').key('UrlRegexRules')
            .onClick((e: ClickEvent) => {
              console.info('key==>' + this.str)
              this.isReceive = 0
              switch (this.str) {
                case 'testUrlRegexRules001': {
                  this.controller.loadUrl(URL_BAIDU)
                  setTimeout(() => {
                    Utils.emitEvent(this.scriptHeadMessage,25122401)

                  }, 3000)
                  break
                }
                case 'testUrlRegexRules002': {
                  this.controller.loadUrl(URL_BAIDU)
                  setTimeout(() => {
                    Utils.emitEvent(this.scriptDOMStartMessage,25122402)
                  }, 3000)
                  break
                }
                case 'testUrlRegexRules003': {
                  this.controller.loadUrl(URL_BAIDU)
                  setTimeout(() => {
                    Utils.emitEvent(this.scriptDOMEndMessage,25122403)
                  }, 3000)

                  break
                }
                case 'testUrlRegexRules004': {
                  this.matchUrlRegexRulesEmpty = 'no match'
                  this.controller.loadUrl(URL_BAIDU)
                  setTimeout(() => {
                    Utils.emitEvent(this.matchUrlRegexRulesEmpty,25122404)
                  }, 3000)
                  break
                }
                case 'testUrlRegexRules005': {
                  this.matchSecondLevelDomainEmpty = 'no match'
                  this.controller.loadUrl(URL_BAIDU)

                  setTimeout(() => {
                    Utils.emitEvent(this.matchSecondLevelDomainEmpty,25122405);
                  }, 3000)
                  break
                }
                case 'testUrlRegexRules006': {
                  this.matchRuleEmpty = 'no match'
                  this.controller.loadUrl(URL_BAIDU)
                  setTimeout(() => {
                    Utils.emitEvent(this.matchRuleEmpty,25122406);
                  }, 3000)
                  break
                }
                case 'testUrlRegexRules007': {
                  this.matchSecondLevelDomainRuleEmpty = 'no match'
                  this.controller.loadUrl(URL_BAIDU)
                  setTimeout(() => {
                    Utils.emitEvent(this.matchSecondLevelDomainRuleEmpty,25122407)
                  }, 3000)
                  break
                }

              }
            })
        }
      }
      Web({src: 'resource://rawfile/index.html', controller: this.controller})
        .javaScriptAccess(true)
        .fileAccess(true)
        .domStorageAccess(true)
        .databaseAccess(true)
        .runJavaScriptOnDocumentStart(this.scriptDOMStart)
        .runJavaScriptOnHeadEnd(this.scriptHead)
        .runJavaScriptOnDocumentEnd(this.scriptDOMEnd)
        .onControllerAttached(() => {
          console.log('onControllerAttached webId:' + this.controller.getWebId())
        })
        .onPageBegin((event) => {
          console.log('onPageBegin url:' + event.url)
        })
        .onPageEnd((event) => {
          console.log('onPageEnd url:' + event.url)
          this.isPageEnd = 1
          console.log('onPageEnd isPageEnd:' + this.isPageEnd)

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
            if (msg === 'scriptDOMStart:http urlRegexRules ok') {
                this.scriptDOMStartMessage = msg
            }
            if (msg === 'scriptDOMEnd:http urlRegexRules ok') {
                this.scriptDOMEndMessage = msg
            }
            if (msg === 'scriptHead:http urlRegexRules ok') {
                this.scriptHeadMessage = msg
            }
            if (msg === 'urlRegexRules empty') {
                this.matchUrlRegexRulesEmpty = msg
            }
            if (msg === 'urlRegexRules rule empty') {
                this.matchRuleEmpty = msg
            }
            if (msg === 'urlRegexRules secondLevelDomain empty') {
                this.matchSecondLevelDomainEmpty = msg
            }
            if (msg === 'urlRegexRules secondLevelDomain rule empty') {
                this.matchSecondLevelDomainRuleEmpty = msg
            }
            return false
        })

    }
  }
}
