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

const EVENT_ID_SET_EMIT_KEY = 200550;

@Entry
@Component
struct webAttribute {
  controller: WebController = new WebController()
  dialogController: CustomDialogController | null = null
  @State str: string = ""
  @State loadedResource: string = ""
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_EMIT_KEY,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_EMIT_KEY)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 1;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("WebAttribute click").key('WebAttributeButton').onClick(async () => {
          await Utils.waitForExist(()=>this.isReceive, 'WebAttributeButtonIsReceive', 1, 1000);
          console.info("key==>" + this.str);
          this.isReceive = -1;
          switch (this.str) {

            case "testOnResourceLoad001": {
              try {
                this.controller.loadUrl({ url: "resource://rawfile/geolocation.html" });
              } catch (error) {
                console.error(`Errorcode: ${error.code}, Message: ${error.message}`);
                Utils.emitEvent(String(error.code), 200560)
              }
              break;
            }

          }
        })
      }


      Web({ src: $rawfile('webPart1index.html'), controller: this.controller })
        .onResourceLoad((event) => {
          if (event) {
            console.info("onResourceLoad==>" + event.url)
            Utils.emitEvent(event.url, 200560);
          }
        })
    }
  }
}