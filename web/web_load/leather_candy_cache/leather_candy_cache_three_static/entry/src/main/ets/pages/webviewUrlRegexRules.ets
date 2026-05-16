/*
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
import { Entry, Text,  Column, Component, Button,  ClickEvent,  Web, Row, Stack,OnLoadInterceptEvent,OnConsoleEvent,SslErrorEvent,ScriptItem } from '@ohos.arkui.component'
import { State} from '@ohos.arkui.stateManagement'
import { Area, OnPageBeginEvent } from '@ohos.arkui.component'
import Utils from '../../src/test/Utils.test';
import hilog from '@ohos.hilog';
import events_emitter from '@ohos.events.emitter';
import { Callback } from '@ohos.base'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import common from '@ohos.app.ability.common';
import webview from '@ohos.web.webview';
import emitter from '@ohos.events.emitter';
import { Callback, RecordData ,BusinessError } from '@ohos.base'
interface PageBeginParam {
  url: string
}
@Entry
@Component
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController('ArkWeb');
  controllerOne: webview.WebviewController = new webview.WebviewController(undefined);
  @State str: string = ''
  @State isReceive: number = 0
  @State isPageEnd: number = -1
  @State scriptDOMStartMessage: string = ''
  @State scriptHeadMessage: string = ''
  @State scriptDOMEndMessage: string = ''
  @State matchUrlRegexRulesEmpty: string = 'no match'
  @State matchSecondLevelDomainRuleEmpty: string = 'no match'
  @State matchRuleEmpty: string = 'no match'
  @State matchSecondLevelDomainEmpty: string = 'no match'

  @State scriptDOMStart: Array<ScriptItem> = [
    {
      script: 'SyncObj.NdkJsBridge()',
      scriptRules: [],
      urlRegexRules: [{secondLevelDomain: 'baidu.com', rule: '.*baidu.*'}]
    },
    {
      script: 'ASyncObj.NdkAsyncJsBridge()',
      scriptRules: [],
      urlRegexRules: [{secondLevelDomain: 'baidu.com', rule: '.*baidu.*'}]
    },
    {
      script: 'SyncObjEx.NdkJsBridgeEx()',
      scriptRules: [],
      urlRegexRules: [{secondLevelDomain: 'baidu.com', rule: '^https:\\/\\/'}]
    },
    {
      script: 'ASyncObjEx.NdkAsyncJsBridgeEx()',
      scriptRules: [],
      urlRegexRules: [{secondLevelDomain: 'baidu.com', rule: '^https:\\/\\/'}]
    },
    {
      script: 'console.log("scriptDOMStart:http urlRegexRules ok")',
      scriptRules: [],
      urlRegexRules: [{secondLevelDomain: 'baidu.com', rule: '^https:\\/\\/www.*'}]
    },
    {
      script: 'console.log("urlRegexRules empty")',
      scriptRules: [],
      urlRegexRules: []
    },
    {
      script: 'console.log("urlRegexRules rule empty")',
      scriptRules: [],
      urlRegexRules: [{secondLevelDomain: 'baidu.com', rule: ''}]
    },
    {
      script: 'console.log("urlRegexRules secondLevelDomain empty")',
      scriptRules: [],
      urlRegexRules: [{secondLevelDomain: '', rule: '^https:\\/\\/'}]
    },
  ] as Array<ScriptItem>;

  @State scriptHead: Array<ScriptItem> = [
    {
      script: 'SyncObj.NdkJsBridge()',
      scriptRules: [],
      urlRegexRules: [{secondLevelDomain: 'baidu.com', rule: '^https:\\/\\/'}]
    },
    {
      script: 'ASyncObj.NdkAsyncJsBridge()',
      scriptRules: [],
      urlRegexRules: [{secondLevelDomain: 'baidu.com', rule: '^https:\\/\\/'}]
    },
    {
      script: 'SyncObjEx.NdkJsBridgeEx()',
      scriptRules: [],
      urlRegexRules: [{secondLevelDomain: 'baidu.com', rule: '^https:\\/\\/'}]
    },
    {
      script: 'ASyncObjEx.NdkAsyncJsBridgeEx()',
      scriptRules: [],
      urlRegexRules: [{secondLevelDomain: 'baidu.com', rule: '^https:\\/\\/'}]
    },
    {
      script: 'console.log("scriptHead:http urlRegexRules ok")',
      scriptRules: [],
      urlRegexRules: [{secondLevelDomain: 'baidu.com', rule: '^https:\\/\\/www.*'}]
    },
    {
      script: 'console.log("urlRegexRules empty")',
      scriptRules: [],
      urlRegexRules: []
    },
    {
      script: 'console.log("urlRegexRules rule empty")',
      scriptRules: [],
      urlRegexRules: [{secondLevelDomain: 'baidu.com', rule: ''}]
    },
    {
      script: 'console.log("urlRegexRules secondLevelDomain empty")',
      scriptRules: [],
      urlRegexRules: [{secondLevelDomain: '', rule: '^https:\\/\\/'}]
    },
  ] as Array<ScriptItem>;

  @State scriptDOMEnd: Array<ScriptItem> = [
    {
      script: 'SyncObj.NdkJsBridge()',
      scriptRules: [],
      urlRegexRules: [{secondLevelDomain: 'baidu.com', rule: '.*baidu.*'}]
    },
    {
      script: 'ASyncObj.NdkAsyncJsBridge()',
      scriptRules: [],
      urlRegexRules: [{secondLevelDomain: 'baidu.com', rule: '.*baidu.*'}]
    },
    {
      script: 'SyncObjEx.NdkJsBridgeEx()',
      scriptRules: [],
      urlRegexRules: [{secondLevelDomain: 'baidu.com', rule: '^https:\\/\\/'}]
    },
    {
      script: 'ASyncObjEx.NdkAsyncJsBridgeEx()',
      scriptRules: [],
      urlRegexRules: [{secondLevelDomain: 'baidu.com', rule: '^https:\\/\\/'}]
    },
    {
      script: 'console.log("scriptDOMEnd:http urlRegexRules ok")',
      scriptRules: [],
      urlRegexRules: [{secondLevelDomain: 'baidu.com', rule: '^https:\\/\\/www.*'}]
    },
    {
      script: 'console.log("urlRegexRules empty")',
      scriptRules: [],
      urlRegexRules: []
    },
    {
      script: 'console.log("urlRegexRules rule empty")',
      scriptRules: [],
      urlRegexRules: [{secondLevelDomain: 'baidu.com', rule: ''}]
    },
    {
      script: 'console.log("urlRegexRules secondLevelDomain empty")',
      scriptRules: [],
      urlRegexRules: [{secondLevelDomain: '', rule: '^https:\\/\\/'}]
    },
  ] as Array<ScriptItem>;


  aboutToAppear() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack: Callback<emitter.EventData> = (eventData: emitter.EventData): void => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      const data = eventData.data as Record<string, RecordData>;
      if (data && data['ACTION'] != null) {
        console.info('Received ACTION value: ' + data['ACTION']);
        let strValue: string = String(data['ACTION']);
        console.info('strValue has been updated to: ' + strValue);
        this.str = strValue;
        console.info('this.str has been updated to: ' + this.str);
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('web click').key('UrlRegexRules').onClick((): void => {
          console.info('key==>' + this.str)
          switch (this.str) {
            case 'emitUrlRegexRulesSecondLevelDomainStatic': {
              try {
                this.matchSecondLevelDomainEmpty = 'no match'
                this.isPageEnd = -1
                this.controller.loadUrl("www.baidu.com")
                setTimeout(() => {
                  Utils.emitEvent(this.matchSecondLevelDomainEmpty,260326151)
                }, 4000)
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 260326151);
              }
              break;
            }

            case 'emitUrlRegexRulesRuleStatic': {
              try {
                this.matchUrlRegexRulesEmpty = 'no match'
                this.isPageEnd = -1
                this.controller.loadUrl("www.baidu.com")
                setTimeout(() => {
                  Utils.emitEvent(this.matchUrlRegexRulesEmpty,260326152)
                }, 2000)
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(`${error.code}`, 260326152);
              }
              break;
            }
          }
        })
      }

      Stack() {
        Web({ src: 'resource://rawfile/runJSTest.html', controller: this.controller })
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
          })
          .onSslErrorEvent((event: SslErrorEvent):void=> {
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
          .onConsole((event: OnConsoleEvent):boolean => {
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
}
