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
import Utils from '../../test/Utils';
import web_webview from '@ohos.web.webview'
import image from "@ohos.multimedia.image";
import { BusinessError } from '@ohos.base';

@Entry
@Component
struct getSurfaceId {
  @State str: string = "emitGetSurfaceId0100";
  @State checkResult: number = 0;
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  controllerOne: web_webview.WebviewController = new web_webview.WebviewController();
  @State imagePixelMap: image.PixelMap | undefined = undefined;

  


  onPageShow(){
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack = (eventData: ESObject) => {
    console.info("webOnSslError page valueChangeCallBack");
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("getSurfaceId").key('getSurfaceIdButton').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitGetSurfaceId0100": {
              try {
                let surfaceId = this.controller.getSurfaceId();
                console.log("surfaceId: " + surfaceId);
                if(surfaceId.length != 0) {
                  Utils.emitEvent(true, 28930)
                } else{
                  Utils.emitEvent(false, 28930)
                }
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                Utils.emitEvent(false, 28930)
              }
              break;
            }
            case "emitGetSurfaceId0200": {
              try {
                let surfaceId = this.controllerOne.getSurfaceId();
                console.log("surfaceId: " + surfaceId);
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                Utils.emitEvent(error.code, 28938)
              }
              break;
            }
            case "emitGetSurfaceId0300": {
              try {
                let surfaceId = this.controllerOne.getSurfaceId();
                console.log("surfaceId: " + surfaceId);
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
                Utils.emitEvent(error.message, 28939)
              }
              break;
            }
          }
        })
        Image(this.imagePixelMap)
        .height(100)
      }

      Web({src: 'www.example.com', controller: this.controller, renderMode: RenderMode.ASYNC_RENDER})
    }
  }
}