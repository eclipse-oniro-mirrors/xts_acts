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
              .key('webViewWebResourceTypeProps')
              .onClick(async () => {
                  console.info('key==>' + this.emitKey)
                  this.controller.loadUrl($rawfile('resourceType.html'))
                  await Utils.sleep(1000)
                  switch (this.emitKey) {
                    case 'emitWebView_webResourceType_MAIN_FRAME': {
                        console.log('webResourceTypeProp:' + webview.WebResourceType.MAIN_FRAME)
                        if(webview.WebResourceType.MAIN_FRAME.toString() === '0'){
                          Utils.emitEvent(true,1343)
                        }
                        break;
                    }
                    case 'emitWebView_webResourceType_SUB_FRAME': {
                        console.log('webResourceTypeProp:' + webview.WebResourceType.SUB_FRAME)
                        if(webview.WebResourceType.SUB_FRAME.toString() === '1'){
                          Utils.emitEvent(true,1344)
                        }
                        break;
                    }
                    case 'emitWebView_webResourceType_STYLE_SHEET': {
                        console.log('webResourceTypeProp:' + webview.WebResourceType.STYLE_SHEET)
                        if(webview.WebResourceType.STYLE_SHEET.toString() === '2'){
                          Utils.emitEvent(true,1345)
                        }
                        break;
                    }
                    case 'emitWebView_webResourceType_SCRIPT': {
                        console.log('webResourceTypeProp:' + webview.WebResourceType.SCRIPT)
                        if(webview.WebResourceType.SCRIPT.toString() === '3'){
                          Utils.emitEvent(true,1346)
                        }
                        break;
                    }
                    case 'emitWebView_webResourceType_IMAGE': {
                        console.log('webResourceTypeProp:' + webview.WebResourceType.IMAGE)
                        if(webview.WebResourceType.IMAGE.toString() === '4'){
                          Utils.emitEvent(true,1347)
                        }
                        break;
                    }
                    case 'emitWebView_webResourceType_FONT_RESOURCE': {
                        console.log('webResourceTypeProp:' + webview.WebResourceType.FONT_RESOURCE)
                        if(webview.WebResourceType.FONT_RESOURCE.toString() === '5'){
                          Utils.emitEvent(true,1348)
                        }
                        break;
                    }
                    case 'emitWebView_webResourceType_OBJECT': {
                        console.log('webResourceTypeProp:' + webview.WebResourceType.OBJECT)
                        if(webview.WebResourceType.OBJECT.toString() === '7'){
                          Utils.emitEvent(true,1349)
                        }
                        break;
                    }
                    case 'emitWebView_webResourceType_MEDIA': {
                        console.log('webResourceTypeProp:' + webview.WebResourceType.MEDIA)
                        if(webview.WebResourceType.MEDIA.toString() === '8'){
                          Utils.emitEvent(true,1350)
                        }
                        break;
                    }
                    case 'emitWebView_webResourceType_WORKER': {
                        console.log('webResourceTypeProp:' + webview.WebResourceType.WORKER)
                        this.controller.loadUrl('http://114.115.208.239:8070/colombo_test/webResourceType/worker/worker.html')
                        await Utils.sleep(1000)
                        if(webview.WebResourceType.WORKER.toString() === '9'){
                          Utils.emitEvent(true,1351)
                        }
                        break;
                    }
                    case 'emitWebView_webResourceType_SHARED_WORKER': {
                        console.log('webResourceTypeProp:' + webview.WebResourceType.SHARED_WORKER)
                        this.controller.loadUrl('http://114.115.208.239:8070/colombo_test/webResourceType/sharedWorker/sharedWorker.html')
                        await Utils.sleep(1000)
                        if(webview.WebResourceType.SHARED_WORKER.toString() === '10'){
                          Utils.emitEvent(true,1352)
                        }
                        break;
                    }
                    case 'emitWebView_webResourceType_PREFETCH': {
                        console.log('webResourceTypeProp:' + webview.WebResourceType.PREFETCH)
                        if(webview.WebResourceType.PREFETCH.toString() === '11'){
                          Utils.emitEvent(true,1353)
                        }
                        break;
                    }
                    case 'emitWebView_webResourceType_FAVICON': {
                        console.log('webResourceTypeProp:' + webview.WebResourceType.FAVICON)
                        if(webview.WebResourceType.FAVICON.toString() === '12'){
                          Utils.emitEvent(true,1354)
                        }
                        break;
                    }
                    case 'emitWebView_webResourceType_XHR': {
                        console.log('webResourceTypeProp:' + webview.WebResourceType.XHR)
                        if(webview.WebResourceType.XHR.toString() === '13'){
                          Utils.emitEvent(true,1355)
                        }
                        break;
                    }
                    case 'emitWebView_webResourceType_PING': {
                        console.log('webResourceTypeProp:' + webview.WebResourceType.PING)
                        this.controller.runJavaScript('triggerPingHref()')
                        await Utils.sleep(1000)
                        if(webview.WebResourceType.PING.toString() === '14'){
                          Utils.emitEvent(true,1356)
                        }
                        break;
                    }
                    case 'emitWebView_webResourceType_CSP_REPORT': {
                        console.log('webResourceTypeProp:' + webview.WebResourceType.CSP_REPORT)
                        this.controller.loadUrl($rawfile('csp.html'))
                        await Utils.sleep(1000)
                        if(webview.WebResourceType.CSP_REPORT.toString() === '16'){
                          Utils.emitEvent(true,1357)
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
                          Utils.emitEvent(true,1358)
                        }
                        if(webview.WebResourceType.SERVICE_WORKER.toString() === '15'){
                          Utils.emitEvent(true,1358)
                        }
                        if(webview.WebResourceType.PLUGIN_RESOURCE.toString() === '17'){
                          Utils.emitEvent(true,1358)
                        }
                        if(webview.WebResourceType.NAVIGATION_PRELOAD_MAIN_FRAME.toString() === '19'){
                          Utils.emitEvent(true,1358)
                        }
                        if(webview.WebResourceType.NAVIGATION_PRELOAD_SUB_FRAME.toString() === '20'){
                          Utils.emitEvent(true,1358)
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
