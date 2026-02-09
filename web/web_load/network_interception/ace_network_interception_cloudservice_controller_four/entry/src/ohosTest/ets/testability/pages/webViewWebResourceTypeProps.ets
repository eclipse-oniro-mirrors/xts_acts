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
import webview from '@ohos.web.webview';
import Utils from '../../test/Utils';
import business_error from '@ohos.base';
import { waitForExist } from '../../test/WaitTest.test';

@Entry
@Component
struct webViewWebResourceTypeProps {
  controller: webview.WebviewController = new webview.WebviewController();
  schemeHandler: webview.WebSchemeHandler = new webview.WebSchemeHandler()
  @State emitKey: string = '';
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = true;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State userAgent: string = 'Mozilla/5.0 (Window NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko)' +
         'Chrome/105.0.0.0 Safari/537.36 Edg/105.0.1343.27';
  @State isReceive:number = -1;
  @State isPageEnd: number = -1;

  onPageShow() {
      let valueChangeEvent: events_emitter.InnerEvent = {
          eventId: 124511,
          priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(124511)
  }
  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
      if (eventData != null) {
          console.info('valueChangeCallBack:' + JSON.stringify(eventData));
          if (eventData.data != null && eventData.data.ACTION != null) {
              this.emitKey = eventData.data.ACTION;
              this.isReceive = 0
          }
      }
  }
  
  build() {
      Column() {
          Row() {
              Button('web click')
              .key('webViewWebResourceTypeProps')
              .onClick(async () => {
                console.info('key==>' + this.emitKey)
                await waitForExist(()=>this.isReceive, this.emitKey, 0);
                await waitForExist(()=>this.isPageEnd, this.emitKey, 0);
                  switch (this.emitKey) {
                    case 'emitWebView_webResourceType_MAIN_FRAME': {
                        console.log('webResourceTypeProp:' + webview.WebResourceType.MAIN_FRAME)
                        if(webview.WebResourceType.MAIN_FRAME.toString() === '0'){
                          Utils.emitEvent(true,124500)
                        }
                        break;
                    }
                    case 'emitWebView_webResourceType_SUB_FRAME': {
                        console.log('webResourceTypeProp:' + webview.WebResourceType.SUB_FRAME)
                        if(webview.WebResourceType.SUB_FRAME.toString() === '1'){
                          Utils.emitEvent(true,124510)
                        }
                        break;
                    }
                    case 'emitWebView_webResourceType_STYLE_SHEET': {
                        console.log('webResourceTypeProp:' + webview.WebResourceType.STYLE_SHEET)
                        if(webview.WebResourceType.STYLE_SHEET.toString() === '2'){
                          Utils.emitEvent(true,124520)
                        }
                        break;
                    }
                    case 'emitWebView_webResourceType_SCRIPT': {
                        console.log('webResourceTypeProp:' + webview.WebResourceType.SCRIPT)
                        if(webview.WebResourceType.SCRIPT.toString() === '3'){
                          Utils.emitEvent(true,124530)
                        }
                        break;
                    }
                    case 'emitWebView_webResourceType_IMAGE': {
                        console.log('webResourceTypeProp:' + webview.WebResourceType.IMAGE)
                        if(webview.WebResourceType.IMAGE.toString() === '4'){
                          Utils.emitEvent(true,124540)
                        }
                        break;
                    }
                    case 'emitWebView_webResourceType_FONT_RESOURCE': {
                        console.log('webResourceTypeProp:' + webview.WebResourceType.FONT_RESOURCE)
                        if(webview.WebResourceType.FONT_RESOURCE.toString() === '5'){
                          Utils.emitEvent(true,124550)
                        }
                        break;
                    }
                    case 'emitWebView_webResourceType_OBJECT': {
                        console.log('webResourceTypeProp:' + webview.WebResourceType.OBJECT)
                        if(webview.WebResourceType.OBJECT.toString() === '7'){
                          Utils.emitEvent(true,124560)
                        }
                        break;
                    }
                    case 'emitWebView_webResourceType_MEDIA': {
                        console.log('webResourceTypeProp:' + webview.WebResourceType.MEDIA)
                        if(webview.WebResourceType.MEDIA.toString() === '8'){
                          Utils.emitEvent(true,124570)
                        }
                        break;
                    }
                    case 'emitWebView_webResourceType_WORKER': {
                        console.log('webResourceTypeProp:' + webview.WebResourceType.WORKER)
                        if(webview.WebResourceType.WORKER.toString() === '9'){
                          Utils.emitEvent(true,124580)
                        }
                        break;
                    }
                    case 'emitWebView_webResourceType_SHARED_WORKER': {
                        console.log('webResourceTypeProp:' + webview.WebResourceType.SHARED_WORKER)
                        if(webview.WebResourceType.SHARED_WORKER.toString() === '10'){
                          Utils.emitEvent(true,124590)
                        }
                        break;
                    }
                    case 'emitWebView_webResourceType_PREFETCH': {
                        console.log('webResourceTypeProp:' + webview.WebResourceType.PREFETCH)
                        if(webview.WebResourceType.PREFETCH.toString() === '11'){
                          Utils.emitEvent(true,124600)
                        }
                        break;
                    }
                    case 'emitWebView_webResourceType_FAVICON': {
                        console.log('webResourceTypeProp:' + webview.WebResourceType.FAVICON)
                        if(webview.WebResourceType.FAVICON.toString() === '12'){
                          Utils.emitEvent(true,124610)
                        }
                        break;
                    }
                    case 'emitWebView_webResourceType_XHR': {
                        console.log('webResourceTypeProp:' + webview.WebResourceType.XHR)
                        if(webview.WebResourceType.XHR.toString() === '13'){
                          Utils.emitEvent(true,124620)
                        }
                        break;
                    }
                    case 'emitWebView_webResourceType_PING': {
                        console.log('webResourceTypeProp:' + webview.WebResourceType.PING)
                        this.controller.runJavaScript('triggerPingHref()')
                        if(webview.WebResourceType.PING.toString() === '14'){
                          Utils.emitEvent(true,124630)
                        }
                        break;
                    }
                    case 'emitWebView_webResourceType_CSP_REPORT': {
                        console.log('webResourceTypeProp:' + webview.WebResourceType.CSP_REPORT)
                        this.controller.loadUrl($rawfile('csp.html'))
                        if(webview.WebResourceType.CSP_REPORT.toString() === '16'){
                          Utils.emitEvent(true,124640)
                        }
                        break;
                    }

                    default:{
                        console.log('webResourceTypeProp:' + webview.WebResourceType.SUB_RESOURCE)
                        console.log('webResourceTypeProp:' + webview.WebResourceType.SERVICE_WORKER)
                        console.log('webResourceTypeProp:' + webview.WebResourceType.PLUGIN_RESOURCE)
                        console.log('webResourceTypeProp:' + webview.WebResourceType.NAVIGATION_PRELOAD_MAIN_FRAME)
                        console.log('webResourceTypeProp:' + webview.WebResourceType.NAVIGATION_PRELOAD_SUB_FRAME)
                        if(webview.WebResourceType.SUB_RESOURCE.toString() === '6'){
                          Utils.emitEvent(true,124650)
                        }
                        if(webview.WebResourceType.SERVICE_WORKER.toString() === '15'){
                          Utils.emitEvent(true,124650)
                        }
                        if(webview.WebResourceType.PLUGIN_RESOURCE.toString() === '17'){
                          Utils.emitEvent(true,124650)
                        }
                        if(webview.WebResourceType.NAVIGATION_PRELOAD_MAIN_FRAME.toString() === '19'){
                          Utils.emitEvent(true,124650)
                        }
                        if(webview.WebResourceType.NAVIGATION_PRELOAD_SUB_FRAME.toString() === '20'){
                          Utils.emitEvent(true,124650)
                        }
                        break;
                      }
                  }
              })
          }
          Web({ src: $rawfile('resourceType.html'), controller: this.controller })
                .javaScriptAccess(this.javaScriptAccess)
                .fileAccess(this.fileAccess)
                .imageAccess(this.imageAccess)
                .domStorageAccess(this.domStorageAccess)
                .onlineImageAccess(this.onlineImageAccess)
                .databaseAccess(this.databaseAccess)
            .onControllerAttached(() => {
              this.isPageEnd = 0;
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
