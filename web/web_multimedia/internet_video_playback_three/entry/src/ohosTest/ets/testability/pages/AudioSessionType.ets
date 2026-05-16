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
import Utils from '../../test/Utils.test';
import { webview } from '@kit.ArkWeb';
import events_emitter from '@ohos.events.emitter';
import { waitForExist} from '../../test/WaitTest.test';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct WebMediaOption {
  controller: webview.WebviewController = new webview.WebviewController();
  @State options: WebMediaOptions = {resumeInterval: -1, audioExclusive: true}
  @State options2: WebMediaOptions = {resumeInterval: -1, audioExclusive: true, audioSessionType: AudioSessionType.AMBIENT}
  @State message: string = 'Hello World';
  fontList: Array<string> = new Array<string>();
  @State audioSessionTypeArr:AudioSessionType[] = [AudioSessionType.AMBIENT]
  @State str: string = "emitAudioSessionType0100"
  @State isReceive: number = -1;


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
        this.isReceive = 0;
      }
    }
  }

  build() {
    Column() {

      Row() {
        Button("WebAudioSessionType").id('WebAudioSessionTypeButton').onClick(async () => {
          console.info("key==>" + this.str)
          await waitForExist(()=>this.isReceive, this.str, 0);
          switch (this.str) {
            case "emitAudioSessionType0100": {
              let value: string;
              try {
                Utils.emitEvent(this.audioSessionTypeArr[0], 20250621)
              } catch (error) {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              break;
            }
          }
        })
      }

      Text('ResumeInterval is -1')
      Text('被打断后无限制时长尝试恢复')
      Text('AudioSessionType is AUTO')
      Web({ src: $rawfile('audio4.html'), controller: this.controller })
        .mediaOptions(this.options)
        .javaScriptAccess(true)
        .zoomAccess(true)
        .imageAccess(true)
        .height(50)
        .fileAccess(true)
        .domStorageAccess(true)
        .onlineImageAccess(true)
        .databaseAccess(true)
        .mediaPlayGestureAccess(false)
        .cacheMode(CacheMode.None)
        .mixedMode(MixedMode.All)
      Text('AudioSessionType is AMBIENT')
      Web({ src: $rawfile('audio4.html'), controller: this.controller })
        .mediaOptions(this.options2)
        .javaScriptAccess(true)
        .zoomAccess(true)
        .imageAccess(true)
        .height(50)
        .fileAccess(true)
        .domStorageAccess(true)
        .onlineImageAccess(true)
        .databaseAccess(true)
        .mediaPlayGestureAccess(false)
        .cacheMode(CacheMode.None)
        .mixedMode(MixedMode.All)
    }
  }
}