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
import events_emitter from '@ohos.events.emitter';

@Entry
@Component
struct WebControllerZoom {
  @State str: string = ""
  @State zoom: number = 0
  @State zoomState: string = ''
  webController: WebController = new WebController()

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
        Button("WebControllerZoom").key('WebControllerZoom').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitWebControllerZoom001": {
              this.zoomState = 'WebControllerZoom'
              this.zoom = 1.5
              await Utils.sleep(2000);
              this.webController.zoom(this.zoom)
              break;
            }
            case "emitWebControllerZoomMax001": {
              this.zoomState = 'WebControllerZoomMax'
              this.zoom = 10
              await Utils.sleep(2000);
              try {
                this.webController.zoom(this.zoom)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitWebControllerZoomMin001": {
              this.zoom = 1
              await Utils.sleep(2000);
              try {
                this.webController.zoom(this.zoom)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              setTimeout(() => {
                Utils.emitEvent(true, 7802)
              }, 3000)
              break;
            }
          }
        })
      }

      Web({ src: $rawfile("indexJru.html"), controller: this.webController })
        .onScaleChange((event) => {
          console.log('onScaleChange changed from ' + event.oldScale + ' to ' + event.newScale)
          switch (this.zoomState) {
            case 'WebControllerZoom': {
              if (this.zoom * 100 == event.newScale) {
                Utils.emitEvent(true, 7705)
              }
              break
            }
            case 'WebControllerZoomMax': {
              let zoomCount = this.zoom * 100 > 500 ? 500 : this.zoom
              if (zoomCount == event.newScale) {
                Utils.emitEvent(true, 7801)
              }
              break
            }
          }
        })
    }
  }
}
