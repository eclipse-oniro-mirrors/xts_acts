/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
import Utils from '../../test/Utils';
import web_webview from '@ohos.web.webview';
import {waitForAssert, waitForExist} from '../../test/WaitTest.test';

class TestObj {
  constructor() {
  }

  test(testStr: string): string {
    console.log('Web Component str' + testStr);
    return testStr;
  }

  toString(): string {
    console.log('Web Component toString');
    if (this) {
      return "ok";
    }
    return "no";
  }

  testNumber(testNum: number): number {
    console.log('Web Component number' + testNum);
    return testNum;
  }

  testBool(testBol: boolean): boolean {
    console.log('Web Component boolean' + testBol);
    return testBol;
  }

  webString = () => {
    console.log('Web test toString');
    if (this) {
      return "ok";
    }
    return "no";
  }
}

@Entry
@Component
struct Second {
  private localStorage: string =
    "if (typeof(Storage) !== 'undefined') {" +
      "   localStorage.setItem('color', 'Red');" +
      "}";
  @State testObjtest: TestObj = new TestObj();
  webviewCtl: web_webview.WebviewController = new web_webview.WebviewController();
  @State str: string = "emitRegisterJavaScriptProxyTwo";
  @State scripts: Array<ScriptItem> = [
    { script: this.localStorage, scriptRules: ["*"] }
  ];
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 172270,
      priority: events_emitter.EventPriority.LOW
    };
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack);
  }

  onPageHide() {
    events_emitter.off(172270);
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data?.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("web click").key('webcomponenttwo').onClick(async () => {
          await waitForExist(() => this.isPageEnd, this.str, 0);
          await waitForExist(() => this.isReceive, this.str, 0);
          this.isReceive = -1;
          console.info('key==>' + this.str);
          switch (this.str) {
            case "emitRegisterJavaScriptProxyTwo": {
              this.isPageEnd = -1;
              this.webviewCtl.loadUrl("resource://rawfile/indexweb.html")
              await waitForExist(() => this.isPageEnd, this.str, 0);
              this.webviewCtl.registerJavaScriptProxy(this.testObjtest, "objName", ["test", "toString", "testNumber", "testBool", "webString"]);
              this.isPageEnd = -1;
              this.webviewCtl.refresh();
              await waitForExist(() => this.isPageEnd, this.str, 0);
              this.webviewCtl.runJavaScript('htmlTest()', (error, result) => {
                  if (error) {
                    console.info(`run JavaScript error: ` + JSON.stringify(error));
                    return;
                  }
                  if (result) {
                    console.info('emitRegisterJavaScriptProxy==>' + result);
                    Utils.emitEvent(result, 172280);
                  }
                })
              break;
            }
            default:
              console.info('can not match case');
          }
        })
      }

      Web({ src: 'www.example.com', controller: this.webviewCtl, incognitoMode: true })
        .fileAccess(true)
        .javaScriptOnDocumentEnd(this.scripts)
        .enableNativeEmbedMode(false)
        .javaScriptAccess(true)
        .domStorageAccess(true)
        .onlineImageAccess(true)
        .javaScriptOnDocumentStart(this.scripts)
        .overScrollMode(OverScrollMode.NEVER)
        .onPageEnd((event) => {
          if (event) {
            this.isPageEnd = 0;
            console.log('web onPageEnd url:' + event.url);
          }
        })
    }
  }
}