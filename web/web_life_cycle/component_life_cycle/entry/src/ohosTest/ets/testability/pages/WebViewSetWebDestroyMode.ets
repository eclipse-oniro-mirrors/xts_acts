/**
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
import { webview } from '@kit.ArkWeb';
import { waitForExist } from '../../test/WaitTest.test';
import events_emitter from '@ohos.events.emitter';
import Utils from '../../test/Utils';

@Entry
@Component
struct WebComponent {
  aboutToAppear(): void {
    if (this.flag) {
      webview.WebviewController.setWebDestroyMode(webview.WebDestroyMode.FAST_MODE)
    } else {
      webview.WebviewController.setWebDestroyMode(webview.WebDestroyMode.NORMAL_MODE)
    }
  }

  @State webviewController: webview.WebviewController = new webview.WebviewController();
  @State flag: Boolean = true
  @State setWebDestroyModeArr: String[] = ['webview.WebDestroyMode.FAST_MODE', 'webview.WebDestroyMode.NORMAL_MODE']
  @State emitKey: string = '';
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  @State url: string = '';

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 138550,
      priority: events_emitter.EventPriority.LOW,
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(138550)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.emitKey = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('web click')
          .key('webViewSetWebDestroyModeKey')
          .onClick(async () => {
            await waitForExist(() => this.isReceive, this.emitKey, 0);
            await waitForExist(() => this.isPageEnd, this.emitKey, 0);
            console.info('key==>' + this.emitKey);
            this.isReceive = -1;
            switch (this.emitKey) {
              case 'emitwebViewSetWebDestroyMode001': {
                Utils.emitEvent(this.setWebDestroyModeArr[0], 138560)
                break;
              }
              case 'emitwebViewSetWebDestroyMode002': {
                Utils.emitEvent(this.setWebDestroyModeArr[1], 138570)
                break;
              }
            }
          })
      }

      Row() {
        Web({ src: 'www.example.com', controller: this.webviewController })
          .onPageEnd((event) => {
            console.log('onPageEnd url：' + event.url);
            this.isPageEnd = 0;
            this.url = event.url;
          })
      }
    }
  }
}