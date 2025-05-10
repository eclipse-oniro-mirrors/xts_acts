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
import web_webview from '@ohos.web.webview';
import Utils from '../../test/Utils';
import { Driver, ON } from '@ohos.UiTest';
import events_emitter from '@ohos.events.emitter';


@Entry
@Component
struct WebComponent {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  @State str: string = "enableWebAVSession01";
  @State options: WebMediaOptions = { resumeInterval: 10, audioExclusive: true }

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      if (eventData.data?.ACTION != null) {
        this.str = eventData.data?.ACTION;
      }
    }
  }
  build() {
    Column() {

      Row() {
        Button("web test").key('enableWebAVSessionButton').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "enableWebAVSession01": {
              let driver = Driver.create();
              await Utils.sleep(2000);
              let strJson = getInspectorByKey('textContent');
              console.info("[textResize] component strJson:" + strJson);
              let obj: ESObject = JSON.parse(strJson);
              console.info("[testScrollBar001] textResize:" + obj.$attrs.content);
              Utils.emitEvent(obj.$attrs.content, 20250207)
              await Utils.sleep(1000);
              break;
            }

          }
        })
      }


      Text('enableWebAVSession').fontSize(14).id('textContent')
      Web({src:"https://assets-res-cn.c.huawei.com/file-html-app/f34ffa0a861df9c482702aaf92c842d620240806183443/index.html#/", controller:this.controller})
        // Web({src:$rawfile('iframeVideoPoster.html'), controller:this.controller})
        .mediaOptions(this.options)
        .javaScriptAccess(true)
        .zoomAccess(false)
        .fileAccess(true)
        .imageAccess(true)
        .domStorageAccess(true)
        .onlineImageAccess(true)
        .databaseAccess(true)
        .mediaPlayGestureAccess(true)
        .enableWebAVSession(true)

    }
  }
}