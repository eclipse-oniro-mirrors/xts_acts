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

import Utils from '../../test/Utils';
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import image from '@ohos.multimedia.image';
import { JsProxyObject } from '../../test/Interfaces';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
import { BusinessError } from '@ohos.base';
import web_webview from '@ohos.web.webview';
import { resourceConfigs } from "./Resource";

async function getData(url?: Array<string>) {
  const resourceMapArr: Array<web_webview.OfflineResourceMap> = [];
  // 读取配置，从rawfile目录中读取文件内容
  for (let config of resourceConfigs) {
    let buf: Uint8Array = new Uint8Array(0);
    if (config.localPath) {
      buf = await readRawFile(config.localPath);
    }
    resourceMapArr.push({
      urlList: url ? url : config.urlList,
      resource: buf,
      responseHeaders: config.responseHeaders,
      type: config.type,
    })
  }
  return resourceMapArr;
}

async function readRawFile(url: string) {
  try {
    return await getContext().resourceManager.getRawFileContent(url);
  } catch (err) {
    return new Uint8Array(0);
  }
}
class TestObj {
  constructor() {
  }

  test(data1: string, data2: string, data3: string): string {
    console.log("data1:" + data1)
    console.log("data2:" + data2)
    console.log("data3:" + data3)
    return "AceString"
  }

  asyncTest(data: string): void {
    console.log("async data:" + data)
  }

  toString(): void {
    console.log('toString' + "interface instead.")
  }
}

@Entry
@Component
struct injectOfflineResourcesTest {
  controller: webView.WebviewController = new webView.WebviewController();
  controllerNull: webView.WebviewController = new webView.WebviewController();
  message: webView.WebMessageExt = new webView.WebMessageExt();
  @State str: string = ""
  @State javaScriptAccess: boolean = true;
  testObj = new TestObj();
  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
    webView.WebviewController.initializeWebEngine()
  }

  onPageHide() {
    events_emitter.off(10)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
      }
    }
  }
  build() {
    Column() {
      Row() {
        Button("injectOfflineResourcesTest click").key('injectOfflineResourcesTestButton').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "testInjectOfflineResources001": {
              let msg = "testInjectOfflineResources001"
              try {
                this.controller.injectOfflineResources(await getData ());
                Utils.emitEvent(true, 20001)
              } catch (err) {
                console.error(msg + "injectOfflineResources error: " + err.code + " message " + err.message);
              }
              break;
            }
            case "testInjectOfflineResources002": {
              let msg = "testInjectOfflineResources002"
              try {
                this.controller.injectOfflineResources(undefined);
              } catch (err) {
                console.error(msg + "injectOfflineResources error: " + err.code + " message " + err.message);
                Utils.emitEvent(err.code, 20002)
              }
              break;
            }
            case "testInjectOfflineResources003": {
              let msg = "testInjectOfflineResources003"
              try {
                this.controller.injectOfflineResources(null);
              } catch (err) {
                console.error(msg + "injectOfflineResources error: " + err.code + " message " + err.message);
                Utils.emitEvent(err.code, 20003)
              }
              break;
            }
            case "testInjectOfflineResources004": {
              let msg = "testInjectOfflineResources004"
              try {
                this.controller.injectOfflineResources(await getData(['xxxx']));
              } catch (err) {
                console.error(msg + "injectOfflineResources error: " + err.code + " message " + err.message);
                Utils.emitEvent(err.code, 20004)
              }
              break;
            }
            case "testInjectOfflineResources005": {
              let msg = "testInjectOfflineResources005"
              try {
                this.controllerNull.injectOfflineResources(await getData ());
              } catch (err) {
                console.error(msg + "injectOfflineResources error: " + err.code + " message " + err.message);
                Utils.emitEvent(err.code, 20005)
              }
              break;
            }
          }
        })
      }

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .javaScriptAccess(this.javaScriptAccess)
        .javaScriptProxy({
          object: this.testObj,
          name: "objName",
          methodList: ["test", "toString"],
          asyncMethodList: ["asyncTest"],
          controller: this.controller,
        })

    }
  }
}
