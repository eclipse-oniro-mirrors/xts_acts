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
import hilog from '@ohos.hilog';
import web_webview from '@ohos.web.webview';
import testnapi from 'libweberrorcodetest.so';
import events_emitter from '@ohos.events.emitter';
import Utils from '../../test/UtilsTest.test';
import { waitForExist } from '../../test/WaitTest.test';
import { UIAbility, AbilityConstant, Want, common } from '@kit.AbilityKit';

@Entry
@Component
struct Index {
  @State webTag: string = 'web1211';
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  @State emitKey: string = '';
  controller: web_webview.WebviewController = new web_webview.WebviewController(this.webTag);

  URL1: string = 'https://'
  URL2: string = 'www.example.com'
  URL_EXAMPLE_HTTPS: string = this.URL1 + this.URL2

  aboutToAppear() {
    console.info('start run testcase!!!')
    web_webview.WebviewController.initializeWebEngine();
    testnapi.setSchemeHandler();
  }

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 825,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(825)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.emitKey = eventData.data.ACTION;
        this.isReceive = 1
      }
    }
  }

 @State message: string = 'Hello Worldxx'
   build() {
     Column() {
       Row() {
         Button('ArkWebHttpBodyStreamButton').key('ArkWebHttpBodyStreamTest').onClick(
           async () => {
             console.info('OH_ArkWebHttpBodyStream_SetAsyncReadCallback001 key==>' + this.emitKey)
             this.isReceive = -1
             switch (this.emitKey) {
               case 'OH_ArkWebHttpBodyStream_SetAsyncReadCallback001': {
                 this.isPageEnd = -1
                 try {
                   this.controller.loadUrl(this.URL_EXAMPLE_HTTPS +'/post_data.html')
                 } catch (e) {
                   console.error('OH_ArkWebHttpBodyStream_SetAsyncReadCallback001 loadUrl, e:' + e)
                 }

                 this.controller.runJavaScript("textPost('https://www.example.com/xhr','BYTES')", (error, result) => {
                   if (error) {
                     console.error('OH_ArkWebHttpBodyStream_SetAsyncReadCallback001 return error:' + error)
                   }
                   if (result) {
                     console.info('OH_ArkWebHttpBodyStream_SetAsyncReadCallback001 return result:' + result)
                   }
                 })

                 testnapi.requestStop()
                 let setAsyncReadCallback: number = testnapi.setAsyncReadCallback()
                 console.info('OH_ArkWebHttpBodyStream_SetAsyncReadCallback001 setAsyncReadCallback:' + String(setAsyncReadCallback))
                 Utils.emitEvent(setAsyncReadCallback, 20250825)
                 break
               }

               default:
                 console.error('OH_ArkWebHttpBodyStream_SetAsyncReadCallback001 default.......')
                 break
             }
           }
         )
       }
       .width('100%')
       Web({ src: $rawfile('test.html'), controller: this.controller })
         .width('50%')
         .height('100%')
         .javaScriptAccess(true)
         .databaseAccess(true)
         .fileAccess(true)
         .domStorageAccess(true)
         .cacheMode(CacheMode.Default)
         .onControllerAttached(() => {
           console.log('onControllerAttached webId:' + this.controller.getWebId())
         })
         .onPageBegin(event => {
           console.log('onPageBegin url:' + event.url)
         })
         .onPageEnd((event) => {
           testnapi.initResourceManager(this.getUIContext().getHostContext()!.resourceManager)
           this.isPageEnd = 1;
           console.log('onPageEnd url:' + event.url)
           console.log('onPageEnd this.isPageEnd:' + this.isPageEnd)
         })
     }
   }
  }