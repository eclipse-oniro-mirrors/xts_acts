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
import { waitForExist } from '../../test/WaitTest.test';
@Entry
@Component
struct WebViewControllerZoom {
  @State str: string = ""
  @State zoom: number = 0
  @State zoomState: string = ''
  @State userAgentPC:string = "";
  @State isComplete: number = -1;
  @State isReceive: number = -1;
  controller: webView.WebviewController = new webView.WebviewController();

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 153150,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(153150)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("WebViewControllerZoom").key('WebViewControllerZoom').onClick(async () => {
          console.info("key==>" + this.str)
          await waitForExist(() => this.isComplete, this.str, 0);
          await waitForExist(() => this.isReceive, this.str, 0);
          this.isReceive = -1;
          switch (this.str) {
            case "emitWebZoom001": {
              this.zoomState = 'zoom'
              this.zoom = 1.5
              this.controller.zoom(this.zoom)
              break;
            }
            case "emitWebZoomMax001": {
              this.zoomState = 'maxZoom'
              this.zoom = 10
              try {
                this.controller.zoom(this.zoom)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitWebZoomMin001": {
              this.zoom = 1
              try {
                this.controller.zoom(this.zoom)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
                Utils.emitEvent(true, 153180)
                this.controller.zoom(1)
              break;
            }
            case "emitZoomIn001": {
              this.zoomState = 'zoomIn'
              try {
                this.controller.zoomIn()
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitZoomInMax001": {
              this.zoom = 5
              this.controller.zoom(this.zoom)
              try {
                this.controller.zoomIn()
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
                this.controller.zoom(0.2)
                Utils.emitEvent(true, 153190)
              break;
            }
            case "emitZoomOut001": {
              this.zoomState = 'zoomOut'
              this.controller.zoom(1.25)
              this.isComplete = -1;
              this.controller.refresh();
              await waitForExist(() => this.isComplete, this.str, 0);
              try {
                this.controller.zoomOut()
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitZoomOutMin001": {
              this.zoom = 1
              this.controller.zoom(this.zoom)
              try {
                this.controller.zoomOut()
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
                Utils.emitEvent(true, 153210)
              break;
            }

            case "emitZoomOutMin001": {
              this.zoom = 1
              this.controller.zoom(this.zoom)
              try {
                this.controller.zoomOut()
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
                Utils.emitEvent(true, 153210)
              break;
            }
          }
        })
      }

      Web({ src: $rawfile("indexJru.html"), controller: this.controller })
        .onScaleChange((event) => {
          console.log('onScaleChange changed from ' + event.oldScale + ' to ' + event.newScale)
          switch (this.zoomState) {
            case 'zoom': {
              if (this.zoom * 100 == event.newScale) {
                Utils.emitEvent(true, 153160)
              }
              break
            }
            case 'maxZoom': {
              this.userAgentPC = this.controller.getUserAgent();
              if ((this.userAgentPC).includes("PC")) {
                let zoomCount = this.zoom * 100 > 400 ? 400 : this.zoom
                if (zoomCount == event.newScale) {
                  Utils.emitEvent(true, 153170)
                }
                break
              }
              let zoomCount = this.zoom * 100 > 500 ? 500 : this.zoom
              if (zoomCount == event.newScale) {
                Utils.emitEvent(true, 153170)
              }
              break
            }
            case 'zoomIn': {
              if (125 == event.newScale) {
                Utils.emitEvent(true, 153220)
              } else {
                Utils.emitEvent(false, 153220)
              }
              break
            }
            case 'zoomOut': {
              if (100 == event.newScale) {
                Utils.emitEvent(true, 153200)
              }
              break
            }
          }
        })
        .onPageEnd((event) => {
          console.log('web pageEnd==>' + event.url);
          this.isComplete = 0;
        })
    }
  }
}
