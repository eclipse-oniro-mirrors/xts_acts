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
import UIAbility from '@ohos.app.ability.UIAbility';
import events_emitter from '@ohos.events.emitter';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
import Utils from '../../test/Utils';
import web_webview from '@ohos.web.webview';
import Want from '@ohos.app.ability.Want';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';


export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    console.log("EntryAbility onCreate");
    web_webview.WebviewController.initializeWebEngine();
    AppStorage.setOrCreate("abilityWant", want);
    console.log("EntryAbility onCreate done");
  }
}

let loadedUrl: string;

@Entry
@Component
struct Index {
  controller: WebController = new WebController()
  responseweb: WebResourceResponse = new WebResourceResponse();
  @State str: string = "emitLoaData";
  @State text: string = "";
  @State textRatio: number = 100;
  @State zoomAccessValue: boolean = true;
  host: string = "www.spincast.org";
  realm: string = "protected example";
  username_password: string[] = [];
  origin: string = "resource://rawfile/";

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    };
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack);
  }

  private valueChangeCallBack = (eventData: ESObject) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
      }
    }
  }
  private jsObj: ESObject = {
    test: (res: ESObject) => {
      Utils.emitEvent(res, 102);
    },
    toString: (str: ESObject) => {
      console.info("ets toString:" + String(str));
    },
    register: (res: ESObject) => {
      Utils.emitEvent(res, 86);
      return "web222";
    }
  }

  aboutToAppear() {
    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
    let abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments();
    console.info('start run testcase!!!');
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
  }

  build() {
    Column() {
      Row() {
        Button("web click").key('webcomponent').onClick(async () => {
          console.info("key==>" + this.str);
          switch (this.str) {
            case "emitLoaData": {
              this.controller.loadUrl({ url: "resource://rawfile/index.html" });
              setTimeout(() => {
                this.controller.loadData({
                  data: "<html><head><title>index</title></head><body bgcolor=\"white\">Source:<pre>source</pre</body><script>function getTitle(){return document.title}</script></html>",
                  mimeType: "text/html",
                  encoding: "UTF-8"
                });
              }, 3000)
              setTimeout(() => {
                this.controller.runJavaScript({
                  script: "getTitle()", callback: (res) => {
                    Utils.emitEvent(res, 424);
                  }
                });
              }, 4000);
              break;
            }
            default:
              console.info("can not match case");
          }
        })
      }

      Web({ src: $rawfile('index.html'), controller: this.controller })
        .databaseAccess(true)
        .zoomAccess(this.zoomAccessValue)
        .textZoomRatio(this.textRatio)
        .onConsole((event) => {
          let level = event.message.getMessageLevel();
          let msg = event.message.getMessage();
          let lineNumber = event.message.getLineNumber().toString();
          let sourceId = event.message.getSourceId();
          console.log("lineNumber:" + lineNumber);
          setTimeout(() => {
            Utils.emitEvent(lineNumber, 420);
          }, 3000);
          setTimeout(() => {
            Utils.emitEvent(sourceId, 422);
          }, 3000);
          return false;
        })
    }
  }
}
