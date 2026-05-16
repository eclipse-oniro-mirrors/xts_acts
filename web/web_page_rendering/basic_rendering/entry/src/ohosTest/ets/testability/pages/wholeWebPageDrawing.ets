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

import events_emitter from '@ohos.events.emitter';
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
import Utils from '../../test/Utils';
import web_webview from '@ohos.web.webview'
import image from "@ohos.multimedia.image";
import { BusinessError } from '@ohos.base';
import { waitForExist } from '../../test/WaitTest.test';
@Entry
@Component
struct wholeWebPageDrawing {
  @State str: string = "";
  @State isReceive: number = -1;
  @State isComplete: number = -1;
  controller: web_webview.WebviewController = new web_webview.WebviewController();

  aboutToAppear(): void {
    try {
      web_webview.WebviewController.enableWholeWebPageDrawing();
    } catch (error) {
      console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
    }
  }

  onPageShow(){
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 152180,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }
  onPageHide() {
    events_emitter.off(152180)
  }
  private valueChangeCallBack = (eventData: ESObject) => {
    console.info("webOnSslError page valueChangeCallBack");
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("wholeWebPageDrawing").key('wholeWebPageDrawingButton').onClick(async () => {
          console.info("key==>" + this.str)
          await waitForExist(() => this.isComplete, this.str, 0);
          await waitForExist(() => this.isReceive, this.str, 0);
          this.isReceive = -1;
          switch (this.str) {
            case "wholeWebPageDrawing0100": {
              try {
                this.controller.webPageSnapshot({ id: "hello", size: { width: 100, height: 100 } }, (error, result) => {
                  if (error) {
                    console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                    return;
                  }
                  if (result) {
                    console.info('return id is:'+result?.id);
                    Utils.emitEvent(result?.id, 152190)
                  }
                });
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "wholeWebPageDrawing0200": {
              try {
                this.controller.webPageSnapshot({ id: "hello", size: { width: 100, height: 100 } }, (error, result) => {
                  if (error) {
                    console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                    return;
                  }
                  if (result) {
                    console.info('status id is:'+result?.status);
                    Utils.emitEvent(result?.status, 152200)
                  }
                });
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "wholeWebPageDrawing0300": {
              try {
                this.controller.webPageSnapshot({ id: "hello", size: { width: 100, height: 100 } }, (error, result) => {
                  if (error) {
                    console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                    return;
                  }
                  if (result) {
                    console.info('size id is:'+result?.size?.width);
                    Utils.emitEvent(result?.size?.width, 152210)
                  }
                });
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "wholeWebPageDrawing0400": {
              try {
                this.controller.webPageSnapshot({ id: "hello", size: { width: 100, height: 100 } }, (error, result) => {
                  if (error) {
                    console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                    return;
                  }
                  if (result) {
                    console.info('size id is:'+result.size?.height);
                    Utils.emitEvent(result?.size?.height, 152220)
                  }
                });
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "wholeWebPageDrawing0500": {
              try {
                this.controller.webPageSnapshot({ id: "hello", size: { width: 100, height: 100 } }, (error, result) => {
                  if (error) {
                    console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                    return;
                  }
                  if (result) {
                    console.info('imagePixelMap id is:'+ result?.imagePixelMap?.isEditable);
                    Utils.emitEvent(result.imagePixelMap?.isEditable, 152230)
                  }
                });
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
            case "wholeWebPageDrawing0600": {
              try {
                this.controller.webPageSnapshot({ id: "hello", size: { width: 100, height: 100 } }, (error, result) => {
                  if (error) {
                    console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                    return;
                  }
                  if (result) {
                    console.info('imagePixelMap id is:'+result.imagePixelMap?.isStrideAlignment);
                    Utils.emitEvent(result?.imagePixelMap?.isStrideAlignment, 152240)
                  }
                });
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
          }
        })
      }
      Web({src: 'www.example.com', controller: this.controller, renderMode: RenderMode.ASYNC_RENDER})
        .onPageEnd((event) => {
          console.log('web pageEnd==>' + event.url);
          this.isComplete = 0;
        })
    }
  }
}