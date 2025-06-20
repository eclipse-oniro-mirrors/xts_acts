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

@Entry
@Component
struct WebViewZoomRatio {
  @State str: string = ""
  @State text: string = ''
  @State fontSize: number = 16
  @State zoom: number = 0
  @State zoomAtio: number = 0
  controller: webView.WebviewController = new webView.WebviewController();
  controllerText: TextInputController = new TextInputController()

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
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
        Button("WebViewZoomRatioTestButton").key('WebViewZoomRatioTestButton').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitZoomRatio": {
              this.zoom = -1
              this.controller.refresh()
              this.controller.runJavaScript('getFontSize()', (error, result) => {
                console.log('getFontSize return error , result ', error, result)
                if (this.fontSize.toString() == result.substring(1, result.length - 3)) {
                  Utils.emitEvent(true, 3701)
                }
              })
              break;
            }
            case "emitZoomAtio": {
              this.zoomAtio = -1
              this.controller.runJavaScript('getFontSize()', (error, result) => {
                console.log('getFontSize return error , result ', error, result)
                if (this.fontSize.toString() == result.substring(1, result.length - 3)) {
                  Utils.emitEvent(true, 3702)
                }
              })
              break;
            }
          }
        })
      }

      Row() {
        TextInput({ text: this.text, placeholder: 'input your word...', controller: this.controllerText })
          .placeholderColor(Color.Grey)
          .placeholderFont({ size: 14, weight: 400 })
          .caretColor(Color.Blue)
          .width(400)
          .height(200)
          .margin(20)
          .fontSize(14)
          .fontColor(Color.Black)
          .onChange((value: string) => {
            this.text = value
          })
      }

      Web({ src: $rawfile("indexJru.html"), controller: this.controller })
        .textZoomRatio(this.zoom)
        .textZoomAtio(this.zoomAtio)
        .defaultFontSize(this.fontSize)
    }
  }
}
