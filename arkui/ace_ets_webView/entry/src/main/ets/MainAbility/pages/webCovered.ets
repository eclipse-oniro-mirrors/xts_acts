/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import web_webview from '@ohos.web.webview';
import image from "@ohos.multimedia.image"

@Entry
@Component
struct WebComponent {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  @State icon: image.PixelMap = undefined;
  @State family: string = "serif";
  @State fontSize: number = 13;
    
  build() {
    Column() {
      Button('getBackForwardEntries').key("webCovered01")
        .onClick(() => {
          try {
            let list = this.controller.getBackForwardEntries();
            let historyItem = list.getItemAtIndex(list.currentIndex);
			console.log("HistoryItem: " + JSON.stringify(historyItem));
  			this.icon = historyItem.icon;
          } catch (error) {
            console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
          }
        })
          try {
            let backData = {
                data: {
                    "ACTION": this.icon
                }
            }
            let backEvent = {
                eventId:01,
                priority:events_emitter.EventPriority.LOW
            }
            console.info("webFlag start to emit action state");
            events_emitter.emit(backEvent, backData);
      } catch (err) {
            console.info("webFlag emit action state err: " + JSON.stringify(err));
      }
    }
      Web({ src: 'www.example.com', controller: this.controller }).key("webCovered02")
        .webSerifFont(this.family)
        .webSansSerifFont(this.family)
        .minLogicalFontSize(this.fontSize)
        .onTouchIconUrlReceived((event) => {
        console.log('onTouchIconUrlReceived:' + JSON.stringify(event))
      })

      Divider().width("3%")

      Web({ src: 'www.example.com', controller: this.controller }).key("webCovered03")
        .onDataResubmitted((event) => {
          console.log('onDataResubmitted')
          event.handler.resend();
      })
    }
  }
}