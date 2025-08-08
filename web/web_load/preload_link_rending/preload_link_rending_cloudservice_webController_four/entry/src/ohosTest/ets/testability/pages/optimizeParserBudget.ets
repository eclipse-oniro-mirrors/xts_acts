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
  @State str: string = "optimizeParserBudget01";
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
        Button("web test").key('optimizeParserBudgetButton').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "optimizeParserBudget01": {
              let driver = Driver.create();
              await Utils.sleep(2000);
              let strJson = getInspectorByKey('ContentBudget');
              console.info("[textResize] component strJson:" + strJson);
              let obj: ESObject = JSON.parse(strJson);
              console.info("[testScrollBar001] textResize:" + obj.$attrs.content);
              Utils.emitEvent(obj.$attrs.content, 20250218)
              await Utils.sleep(1000);
              break;
            }

          }
        })
      }


      Text('optimizeParserBudget').fontSize(14).id('ContentBudget')
      Web({ src: 'www.example.com', controller: this.controller })
        .optimizeParserBudget(true)

    }
  }
}