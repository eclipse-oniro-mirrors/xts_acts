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
import webview from '@ohos.web.webview';
import Utils from '../../test/Utils';
import business_error from '@ohos.base';

@Entry
@Component
struct webViewWebResourceTypeProps2 {
  controller: webview.WebviewController = new webview.WebviewController();
  schemeHandler: webview.WebSchemeHandler = new webview.WebSchemeHandler()
  @State emitKey: string = '';
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = true;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;


  onPageShow() {
      let valueChangeEvent: events_emitter.InnerEvent = {
          eventId: 10,
          priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }
  
  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
      if (eventData != null) {
          console.info('valueChangeCallBack:' + JSON.stringify(eventData));
          if (eventData.data != null && eventData.data.ACTION != null) {
              this.emitKey = eventData.data.ACTION;
          }
      }
  }
  
  build() {
      Column() {
          Row() {
              Button('web click')
              .key('webViewWebResourceTypeProps2')
              .onClick(async () => {
                  console.info('key==>' + this.emitKey)
                  await Utils.sleep(2000)
                  switch (this.emitKey) {
                    case 'emitWebView_webResourceType_SUB_RESOURCE': {
                        this.controller.loadUrl('https://www.baidu.com')
                        await Utils.sleep(2000)
                        console.log('webResourceTypeProp:' + webview.WebResourceType.SUB_RESOURCE)
                        if(webview.WebResourceType.SUB_RESOURCE.toString() === '6'){
                          Utils.emitEvent(true, 1550)
                        }
                        break;
                    }
                    case 'emitWebView_webResourceType_SERVICE_WORKER': {
                        this.controller.loadUrl('https://m.iqiyi.com')
                        await Utils.sleep(2000)
                        console.log('webResourceTypeProp:' + webview.WebResourceType.SERVICE_WORKER)
                        if(webview.WebResourceType.SERVICE_WORKER.toString() === '15'){
                          Utils.emitEvent(true, 1551)
                        }
                        break;
                    }

                    case 'emitWebView_webResourceType_PLUGIN_RESOURCE': {
                      this.controller.loadUrl('https://www.baidu.com')
                      await Utils.sleep(2000)
                      console.log('webResourceTypeProp:' + webview.WebResourceType.PLUGIN_RESOURCE)
                      if(webview.WebResourceType.PLUGIN_RESOURCE.toString() === '17'){
                        Utils.emitEvent(true, 1552)
                      }
                      break;
                    }

                    case 'emitWebView_webResourceType_NAVIGATION_PRELOAD_MAIN_FRAME': {
                      this.controller.loadUrl('https://www.baidu.com')
                      await Utils.sleep(2000)
                      console.log('webResourceTypeProp:' + webview.WebResourceType.NAVIGATION_PRELOAD_MAIN_FRAME)
                      if(webview.WebResourceType.NAVIGATION_PRELOAD_MAIN_FRAME.toString() === '19'){
                        Utils.emitEvent(true, 1553)
                      }
                      break;
                    }

                    case 'emitWebView_webResourceType_NAVIGATION_PRELOAD_SUB_FRAME': {
                      this.controller.loadUrl('https://www.baidu.com')
                      await Utils.sleep(2000)
                      console.log('webResourceTypeProp:' + webview.WebResourceType.NAVIGATION_PRELOAD_SUB_FRAME)
                      if(webview.WebResourceType.NAVIGATION_PRELOAD_SUB_FRAME.toString() === '20'){
                        Utils.emitEvent(true, 1554)
                      }
                      break;
                    }
                  }
              })
          }
          Web({ src: '', controller: this.controller })
                .javaScriptAccess(this.javaScriptAccess)
                .fileAccess(this.fileAccess)
                .imageAccess(this.imageAccess)
                .domStorageAccess(this.domStorageAccess)
                .onlineImageAccess(this.onlineImageAccess)
                .databaseAccess(this.databaseAccess)
            .onControllerAttached(() => {
              try {
                this.schemeHandler.onRequestStart(
                  (request: webview.WebSchemeHandlerRequest, resourceHandler: webview.WebResourceHandler) => {
                    console.log('[schemeHandler] onRequestStart')
                    request.getFrameUrl()
                    request.getRequestResourceType()
                    return false;
                  }
                )

                this.schemeHandler.onRequestStop((request: webview.WebSchemeHandlerRequest) => {
                  console.log('[schemeHandler] onRequestStop')
                });

                this.controller.setWebSchemeHandler('https', this.schemeHandler);
                this.controller.setWebSchemeHandler('http', this.schemeHandler);
                this.controller.setWebSchemeHandler('resource', this.schemeHandler);
              } catch (error) {
                let e: business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
            })
      }
  }
}
