/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import {
  OnPageBeginEvent,
  OnPageEndEvent,
  Entry,
  Component,
  Column,
  Row,
  Button,
  ClickEvent,
  ScriptItem,
  Web
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import webView from '@ohos.web.webview'
import { BusinessError } from '@ohos.base';
import emitter from '@ohos.events.emitter';
import Utils from '../../src/test/Util.test';
import events_emitter from '@ohos.events.emitter';
import { Callback, RecordData } from '@ohos.base'
import image from '@ohos.multimedia.image';
import { UIContext, Router } from '@ohos.arkui.UIContext'
export class StringFields {
  public str: string = '';
}

@Entry
@Component
struct WebRunJavaScriptOnDocumentStartUndefinedTest {
  stringObj: StringFields  = new StringFields ();
  controller: webView.WebviewController = new webView.WebviewController(undefined);
  @State emitKey: string = '';
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  @State str: string = ''
  @State scripts: Array<ScriptItem>|undefined = undefined

  aboutToAppear() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack: Callback<events_emitter.EventData> = (eventData: events_emitter.EventData): void => {
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      const data = eventData.data as Record<string, RecordData>;
      if (data != null && data['ACTION'] != null) {
        let strValue: string = String(data['ACTION']);
        this.stringObj.str = strValue;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('WebRunJavaScriptOnDocumentStartUndefinedTestButton click').key('WebRunJavaScriptOnDocumentStartUndefinedTestButton').onClick((e: ClickEvent) => {
          console.info('key==>' + this.stringObj.str)
          switch (this.stringObj.str) {
            case 'testRunJavaScriptOnDocumentStartSetUndefined001': {
              try {
                this.isPageEnd = -1
                this.scripts = [{ script: "if (typeof(Storage) !== 'undefined') {" +
                  "   localStorage.setItem('color', 'SetUndefined');" +
                  '}', scriptRules: ['*'] }]
                this.controller.refresh()
                let resultOne:string = 'resultOne'
                setTimeout(() =>{
                  this.controller.runJavaScript('getResult()', (error, result) => {
                    if (error) {
                      console.info('testRunJavaScriptOnDocumentStartSetUndefined1 getResult() return error: ' + error);
                      resultOne = String(error.code)
                    }
                    if (result) {
                      console.info('testRunJavaScriptOnDocumentStartSetUndefined1 getResult() return result: ' + result);
                      resultOne = result
                    }
                  });
                }, 2000)
                this.isPageEnd = -1
                this.scripts = undefined
                this.controller.refresh()
                let resultTwo:string = 'resultTwo'
                setTimeout(() =>{
                  this.controller.runJavaScript('getResult()', (error, result) => {
                    if (error) {
                      console.info('testRunJavaScriptOnDocumentStartSetUndefined2 getResult() return error: ' + error);
                      resultTwo = String(error.code)
                    }
                    if (result) {
                      console.info('testRunJavaScriptOnDocumentStartSetUndefined2 getResult() return result: ' + result);
                      resultTwo = result
                    }
                  });
                }, 3000)
                setTimeout(() =>{
                  if (resultOne === '"SetUndefined"' &&  resultTwo === '""') {
                    Utils.emitEvent(resultTwo,25112521)
                  } else {
                    Utils.emitEvent(resultOne,25112521)
                  }
                }, 5000)

              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                Utils.emitEvent(error.code,25112521);
              }
              break;
            }

            case 'SwitchNextPageStatic' : {
              let uiContext: UIContext = this.getUIContext();
              let router: Router = uiContext.getRouter();
              router.pushUrl({ url: 'pages/WebRunJavaScriptOnDocumentEndUndefinedTest' })
              console.log('push URL success')
              break;
            }

          }
        })
      }
      Web({ src: 'resource://rawfile/runJavaScriptOnDocumentStart.html', controller: this.controller })
        .javaScriptAccess(true)
        .domStorageAccess(true)
        .runJavaScriptOnDocumentStart(this.scripts)
        .onPageBegin((event: OnPageBeginEvent): void => {
          if (event) {
            console.log('runJavaScriptOnDocumentStart onPageBegin url:' + event.url);
          }
        })
        .onPageEnd((event: OnPageEndEvent): void => {
          if (event) {
            this.isPageEnd = 0;
            console.log('runJavaScriptOnDocumentStart onPageEnd url:' + event.url);
          }
        })
        .onConsole((event) => {
          if (event) {
            console.log('runJavaScriptOnDocumentStart');
          }
          return false
        })
        .width('100%')
        .height('100%')
    }
  }
}
