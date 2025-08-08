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

import events_emitter from '@ohos.events.emitter';
import Utils from '../../test/Utils';
import webView from '@ohos.web.webview';
import { Driver, ON, PointerMatrix } from '@ohos.UiTest';

@Entry
@Component
struct WebZoomAccessTest {
  controller: webView.WebviewController = new webView.WebviewController();
  @State str: string = "";
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = false;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State zoomAccess: boolean = false;
  @State newScale: number = 0
  @State oldScale: number = 0
  @State userAgentPC:string = "";
  @State flag: boolean = false;
  @State compareScale: number = 0

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
        Button("WebZoomAccessTestButton").key('WebZoomAccessTestButton').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "testWebZoomAccess001": {
              try {
                this.controller.loadUrl("resource://rawfile/second.html")
                await Utils.sleep(2000)
                await Utils.fingerZoom('WebZoomAccessTestWebView', true);
                await Utils.sleep(2000)
                Utils.emitEvent(this.oldScale == 0 && this.newScale == 0, 6500)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "testWebZoomAccess002": {
              try {
                await Utils.fingerZoom('WebZoomAccessTestWebView', true);
                await Utils.sleep(2000)
                await Utils.fingerZoom('WebZoomAccessTestWebView', false);
                await Utils.sleep(2000)
                Utils.emitEvent(this.oldScale == 0 && this.newScale == 0, 6502)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "testWebZoomAccess003": {
              try {
                this.userAgentPC = this.controller.getUserAgent();
                this.zoomAccess = true;
                await Utils.sleep(2000)
                if ((this.userAgentPC).includes("Wearable")) {
                  let driver: Driver = Driver.create();
                  let pointers: PointerMatrix = PointerMatrix.create(2, 3);
                  pointers.setPoint(0, 0, {
                    x: 200, y: 170
                  });
                  pointers.setPoint(0, 1, {
                    x: 200, y: 150
                  });
                  pointers.setPoint(0, 2, {
                    x: 200, y: 110
                  });
                  pointers.setPoint(1, 0, {
                    x: 200, y: 280
                  });
                  pointers.setPoint(1, 1, {
                    x: 200, y: 300
                  });
                  pointers.setPoint(1, 2, {
                    x: 200, y: 340
                  });
                  await driver.injectMultiPointerAction(pointers);
                }else{
                  await Utils.fingerZoom('WebZoomAccessTestWebView', true);
                }
                await Utils.sleep(2000)
                Utils.emitEvent(this.oldScale > 0 && this.newScale > 0 && this.newScale > this.oldScale, 6504)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "testWebZoomAccess004": {
              try {
                this.userAgentPC = this.controller.getUserAgent();
                this.zoomAccess = true;
                this.flag = true;
                await Utils.sleep(2000)
                if ((this.userAgentPC).includes("Wearable")){
                  let driver: Driver = Driver.create();
                  let pointers: PointerMatrix = PointerMatrix.create(2, 3);
                  pointers.setPoint(0, 0, {
                    x: 200, y: 170
                  });
                  pointers.setPoint(0, 1, {
                    x: 200, y: 150
                  });
                  pointers.setPoint(0, 2, {
                    x: 200, y: 110
                  });
                  pointers.setPoint(1, 0, {
                    x: 200, y: 280
                  });
                  pointers.setPoint(1, 1, {
                    x: 200, y: 300
                  });
                  pointers.setPoint(1, 2, {
                    x: 200, y: 340
                  });
                  await driver.injectMultiPointerAction(pointers);
                }else{
                  await Utils.fingerZoom('WebZoomAccessTestWebView', true);
                }
                await Utils.sleep(2000)
                this.flag = false;


                await Utils.fingerZoom('WebZoomAccessTestWebView', false);

                await Utils.sleep(2000)
                Utils.emitEvent(this.oldScale > 0 && this.newScale > 0 && this.newScale < this.compareScale, 6506)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
          }
        })
      }

      Web({ src: $rawfile('second.html'), controller: this.controller })
        .width('80%')
        .height('70%')
        .onControllerAttached(() => {
          this.controller.setCustomUserAgent('');
        })
        .key('WebZoomAccessTestWebView')
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .zoomAccess(this.zoomAccess)
        .onScaleChange((event) => {
          console.log('onScaleChange called oldScale :' + event.oldScale)
          console.log('onScaleChange called newScale :' + event.newScale)
          this.oldScale = event.oldScale
          this.newScale = event.newScale
          if(this.flag){
            this.compareScale = event.newScale
          }
        })
    }
  }
}