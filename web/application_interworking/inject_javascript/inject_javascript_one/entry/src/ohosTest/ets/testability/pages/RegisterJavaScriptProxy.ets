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

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    };
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack);
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data?.ACTION != null) {
        this.str = eventData.data.ACTION;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("web click").key('webcomponenttwo').onClick(async () => {
          console.info("key==>" + this.str);
          switch (this.str) {
            case "emitRegisterJavaScriptProxyTwo": {
              this.webviewCtl.loadUrl("resource://rawfile/indexweb.html")
              await Utils.sleep(2000);
              this.webviewCtl.registerJavaScriptProxy(this.testObjtest, "objName", ["test", "toString", "testNumber", "testBool", "webString"]);
              await Utils.sleep(2000);
              this.webviewCtl.refresh();
              await Utils.sleep(2000);
              setTimeout(() => {
                this.webviewCtl.runJavaScript('htmlTest()', (error, result) => {
                  if (error) {
                    console.info(`run JavaScript error: ` + JSON.stringify(error));
                    return;
                  }
                  if (result) {
                    console.info("emitRegisterJavaScriptProxy==>" + result);
                    Utils.emitEvent(result, 37);
                  }
                })
              }, 3000)
              break;
            }
            default:
              console.info("can not match case");
          }
        })
      }

      Web({ src: 'www.baidu.com', controller: this.webviewCtl, incognitoMode: true })
        .fileAccess(true)
        .javaScriptOnDocumentEnd(this.scripts)
        .enableNativeEmbedMode(false)
        .javaScriptAccess(true)
        .domStorageAccess(true)
        .onlineImageAccess(true)
        .javaScriptOnDocumentStart(this.scripts)
        .overScrollMode(OverScrollMode.NEVER)
    }
  }
}