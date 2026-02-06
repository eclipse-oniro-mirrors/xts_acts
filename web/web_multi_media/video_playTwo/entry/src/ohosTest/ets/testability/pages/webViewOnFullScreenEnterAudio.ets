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
import web_webview from '@ohos.web.webview';
import Utils from '../../test/Utils';
import { waitForExist } from '../../test/WaitTest.test';
import { Driver, ON } from '@kit.TestKit';

@Entry
@Component
struct webViewOnFullScreenEnterInfoAudio {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  handler: FullScreenExitHandler = new FullScreenExitHandler();
  @State str: string = '';
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = true;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State checkEleResult: string = '';
  @State isReceive:number = -1;
  @State isPageEnd:number = -1;
  @State isEnd:number = -1;
  
  onPageShow() {
      let valueChangeEvent: events_emitter.InnerEvent = {
          eventId: 300420,
          priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(300420)
  }
  
  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
      if (eventData != null) {
          console.info('valueChangeCallBack:' + JSON.stringify(eventData));
          if (eventData.data != null && eventData.data.ACTION != null) {
              this.str = eventData.data.ACTION;
              this.isReceive = 0;
          }
      }
  }
  
  build() {
      Column() {
          Row() {
              Button('web click')
              .key('webViewOnFullScreenEnterInfoAudio')
              .onClick(async () => {
                  console.info('key==>' + this.str)
                  await waitForExist(()=>this.isReceive,  this.str + 'IsReceive', 0);
                  await waitForExist(()=>this.isPageEnd, this.str + 'IsPageEnd', 0);
                  this.isReceive = -1;
                  switch (this.str) {
                    case 'emitOnfullscreenenterAudioInfo': {
                        sendEventByKey('TestwebViewOnFullScreenEnterAudioInfo', 10, '');
                        await Utils.sleep(2000);
                        try {
                            this.controller.runJavaScript('elementFullScreen()', (error, result) => {
                                console.log('The elementFullScreen() return value is: ${result}');
                            })
                            await Utils.sleep(2000);
                            this.controller.runJavaScript('checkIsFullScreen()', (error, result) => {
                                this.checkEleResult = JSON.stringify(result)
                                console.log('The checkIsFullScreen() return value is: ${result}');
                            })
                        } catch (error) {
                            console.error('ErrorCode: ${error.code}, Message: ${error.message}');
                            
                        }
                        break;
                    }
                  }
              })
          }
          Web({ src: $rawfile('fullScreenAudioTest.html'), controller: this.controller })
                .key('TestwebViewOnFullScreenEnterAudioInfo')
                .javaScriptAccess(this.javaScriptAccess)
                .fileAccess(this.fileAccess)
                .imageAccess(this.imageAccess)
                .domStorageAccess(this.domStorageAccess)
                .onlineImageAccess(this.onlineImageAccess)
                .databaseAccess(this.databaseAccess)
                
                .onFullScreenEnter((event) => {
                    console.log('onFullScreenEnter...')
                    this.handler = event.handler
                    console.log('this.handler: ' + JSON.stringify(this.handler))
                    console.log('videoWidth: ' + event.videoWidth)
                    console.log('videoHeight: ' + event.videoHeight)
                    let isVideoWidth = event.videoWidth != null && event.videoWidth == 0
                    let isVideoHeight = event.videoHeight != null && event.videoHeight == 0
                    Utils.emitEvent(isVideoWidth && isVideoHeight, 300430)
                    Utils.emitEvent(true, 300430)
                })
                .onPageEnd(()=>{
                    console.log('onpageEnd*******')
                    this.isPageEnd = 0;
                })
      }
  }
}
