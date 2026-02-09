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
struct WebUrlRegexRules {

  controller: web_webview.WebviewController = new web_webview.WebviewController('ArkWeb');
  @State emitKey: string = ''
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
  ];

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
  ];

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
  ];


  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 251224,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(251224)
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
    web_webview.WebviewController.setWebDebuggingAccess(true);
    testNapi.nativeWebInitTwo('ArkWeb');
  }


  build() {
    Column() {
      Row() {
        Column() {
          Button('UrlRegexRules test').key('UrlRegexRules')
            .onClick(async () => {
              await waitForExist(()=>this.isReceive, 'UrlRegexRules_isReceive', 1, 1000)
              await waitForExist(()=>this.isPageEnd, 'UrlRegexRules_isPageEnd', 1, 1000)
              console.info('key==>' + this.emitKey)
              this.isReceive = 0
              switch (this.emitKey) {
                case 'testUrlRegexRules001': {
                  this.isPageEnd = -1
                  this.controller.loadUrl(URL_BAIDU)
                  await waitForExist(()=>this.isPageEnd, 'testUrlRegexRules001_isPageEnd', 1, 1000)
                  await waitForExist(()=>this.scriptHeadMessage, 'testUrlRegexRules001_HeadEnd', 'scriptHead:http urlRegexRules ok', 1000)
                  Utils.emitEvent(this.scriptHeadMessage,25122401)
                  break
                }
                case 'testUrlRegexRules002': {
                  this.isPageEnd = -1
                  this.controller.loadUrl(URL_BAIDU)
                  await waitForExist(()=>this.isPageEnd, 'testUrlRegexRules002_isPageEnd', 1, 1000)
                  await waitForExist(()=>this.scriptDOMStartMessage, 'testUrlRegexRules002_HeadEnd', 'scriptDOMStart:http urlRegexRules ok', 1000)
                  Utils.emitEvent(this.scriptDOMStartMessage,25122402)
                  break
                }
                case 'testUrlRegexRules003': {
                  this.isPageEnd = -1
                  this.controller.loadUrl(URL_BAIDU)
                  await waitForExist(()=>this.isPageEnd, 'testUrlRegexRules003_isPageEnd', 1, 1000)
                  await waitForExist(()=>this.scriptDOMEndMessage, 'testUrlRegexRules003_HeadEnd', 'scriptDOMEnd:http urlRegexRules ok', 1000)
                  Utils.emitEvent(this.scriptDOMEndMessage,25122403)
                  break
                }
                case 'testUrlRegexRules004': {
                  this.matchUrlRegexRulesEmpty = 'no match'
                  this.isPageEnd = -1
                  this.controller.loadUrl(URL_BAIDU)
                  await waitForExist(()=>this.isPageEnd, 'testUrlRegexRules004_isPageEnd', 1, 1000)
                  await waitForExist(()=>this.matchUrlRegexRulesEmpty, 'testUrlRegexRules004_Empty', 'no match', 3000)
                  Utils.emitEvent(this.matchUrlRegexRulesEmpty,25122404)
                  break
                }
                case 'testUrlRegexRules005': {
                  this.matchSecondLevelDomainEmpty = 'no match'
                  this.isPageEnd = -1
                  this.controller.loadUrl(URL_BAIDU)
                  await waitForExist(()=>this.isPageEnd, 'testUrlRegexRules005_isPageEnd', 1, 1000)
                  await waitForExist(()=>this.matchSecondLevelDomainEmpty, 'testUrlRegexRules005_sldEmpty', 'no match', 3000)
                  Utils.emitEvent(this.matchSecondLevelDomainEmpty,25122405)
                  break
                }
                case 'testUrlRegexRules006': {
                  this.matchRuleEmpty = 'no match'
                  this.isPageEnd = -1
                  this.controller.loadUrl(URL_BAIDU)
                  await waitForExist(()=>this.isPageEnd, 'testUrlRegexRules006_isPageEnd', 1, 1000)
                  await waitForExist(()=>this.matchRuleEmpty, 'testUrlRegexRules006_ruleEmpty', 'no match', 3000)
                  Utils.emitEvent(this.matchRuleEmpty,25122406)
                  break
                }
                case 'testUrlRegexRules007': {
                  this.matchSecondLevelDomainRuleEmpty = 'no match'
                  this.isPageEnd = -1
                  this.controller.loadUrl(URL_BAIDU)
                  await waitForExist(()=>this.isPageEnd, 'testUrlRegexRules007_isPageEnd', 1, 1000)
                  await waitForExist(()=>this.matchSecondLevelDomainRuleEmpty, 'testUrlRegexRules007_ruleEmpty', 'no match', 3000)
                  Utils.emitEvent(this.matchSecondLevelDomainRuleEmpty,25122407)
                  break
                }
                case 'testUrlRegexRules008': {
                  testNapi.resetResult()
                  let ret = testNapi.registerForHeadReady()
                  console.log('testUrlRegexRules008 registerForHeadReady:' + ret)
                  this.isPageEnd = -1
                  this.controller.loadUrl(URL_BAIDU)
                  await waitForExist(()=>this.isPageEnd, 'testUrlRegexRules008_isPageEnd', 1, 3000)
                  await waitForExist(()=>testNapi.getResultOne(), 'testUrlRegexRules008_getResultOne', 'NdkJsBridge;NdkJsBridge;NdkJsBridge;', 1000)
                  let resultOne = testNapi.getResultOne()
                  console.log('testUrlRegexRules008 getResultOne:' + resultOne)
                  Utils.emitEvent(resultOne,25122408)
                  break
                }
                case 'testUrlRegexRules009': {
                  testNapi.resetResult()
                  let ret = testNapi.registerForHeadReady()
                  console.log('testUrlRegexRules009 registerForHeadReady:' + ret)
                  this.isPageEnd = -1
                  this.controller.loadUrl(URL_BAIDU)
                  await waitForExist(()=>this.isPageEnd, 'testUrlRegexRules009_isPageEnd', 1, 3000)
                  await waitForExist(()=>testNapi.getResultTwo(), 'testUrlRegexRules009_getResultTwo', 'NdkAsyncJsBridge;NdkAsyncJsBridge;NdkAsyncJsBridge;', 1000)
                  let resultTwo = testNapi.getResultTwo()
                  console.log('testUrlRegexRules009 getResultTwo:' + resultTwo)
                  Utils.emitEvent(resultTwo,25122409)
                  break
                }
                case 'testUrlRegexRules010': {
                  testNapi.resetResult()
                  let ret = testNapi.registerForHeadReady()
                  console.log('testUrlRegexRules010 registerForHeadReady:' + ret)
                  this.isPageEnd = -1
                  this.controller.loadUrl(URL_BAIDU)
                  await waitForExist(()=>this.isPageEnd, 'testUrlRegexRules010_isPageEnd', 1, 3000)
                  await waitForExist(()=>testNapi.getResultThree(), 'testUrlRegexRules010_getResultThree', 'NdkJsBridgeEx;NdkJsBridgeEx;NdkJsBridgeEx;', 1000)
                  let resultThree = testNapi.getResultThree()
                  console.log('testUrlRegexRules010 getResultThree:' + resultThree)
                  Utils.emitEvent(resultThree,25122410)
                  break
                }
                case 'testUrlRegexRules011': {
                  testNapi.resetResult()
                  let ret = testNapi.registerForHeadReady()
                  console.log('testUrlRegexRules011 registerForHeadReady:' + ret)
                  this.isPageEnd = -1
                  this.controller.loadUrl(URL_BAIDU)
                  await waitForExist(()=>this.isPageEnd, 'testUrlRegexRules011_isPageEnd', 1, 3000)
                  await waitForExist(()=>testNapi.getResultFour(), 'testUrlRegexRules011_getResultFour', 'NdkAsyncJsBridgeEx;NdkAsyncJsBridgeEx;NdkAsyncJsBridgeEx;', 1000)
                  let resultFour = testNapi.getResultFour()
                  console.log('testUrlRegexRules011 getResultFour:' + resultFour)
                  Utils.emitEvent(resultFour,25122411)
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
