/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import webview from '@ohos.web.webview';
import Utils from '../../test/Utils.test';
import { waitForExist} from '../../test/WaitTest.test';
import { pasteboard } from '@kit.BasicServicesKit';
const EVENT_ID_SET_SUITE_KEY = 183004;
const TAG = 'ContextMenu';


@Entry
@Component
struct WebComponent {
  @State emitKey: string = '';
  @State isReceive: number = -1;
  @State str:string = ''
  @State isPageEnd: number = -1;
  private webController: webview.WebviewController = new webview.WebviewController();
  private result: WebContextMenuResult | undefined = undefined;
  @State previewImage: Resource | string | undefined = undefined;
  @State previewWidth: number = 0;
  @State previewHeight: number = 0;
  @State ocr_switch: boolean | undefined = false;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_SUITE_KEY,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_SUITE_KEY)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 1;
      }
    }
  }


  build() {
    Column() {
      Button("web click").key('EnableImageAnalyzerButton').onClick(async () => {
        console.info("key==>" + this.str)
        await Utils.waitForExist(()=>this.isReceive, this.str+' isReceive', 1, 1000);
        switch (this.str) {
          case "emitEnableImageAnalyzer01": {
            await Utils.sleep(2000)
            this.ocr_switch = true;
            Utils.emitEvent(this.ocr_switch, 20230121)
            break;
          }
          case "emitEnableImageAnalyzer02": {
            await Utils.sleep(2000)
            this.ocr_switch = false;
            Utils.emitEvent(this.ocr_switch, 20230122)
            break;
          }
        }
      })

      Web({ src: "https://news.cctv.com/2024/07/26/ARTIFhpkAcJhY8BTmarjj7QD240726.shtml", controller: this.webController })
        .onContextMenuShow((event) => {
          if (event) {
            this.result = event.result;
            if (event.param.getLinkUrl()) {
              return false;
            }
            this.previewWidth = px2vp(event.param.getPreviewWidth());
            this.previewHeight = px2vp(event.param.getPreviewHeight());
            if (event.param.getSourceUrl().indexOf("resource://rawfile/") == 0) {
              this.previewImage = $rawfile(event.param.getSourceUrl().substr(19));
            } else {
              this.previewImage = event.param.getSourceUrl();
            }
            return true;
          }
          return false;
        })
        .enableImageAnalyzer(this.ocr_switch)
    }
  }
}
