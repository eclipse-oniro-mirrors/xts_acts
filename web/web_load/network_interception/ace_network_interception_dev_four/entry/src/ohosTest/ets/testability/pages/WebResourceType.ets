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
import Utils from '../../test/Utils.test';
import webview from '@ohos.web.webview';
import { BusinessError } from '@ohos.base';
import { CommonConstants } from '../../test/CommonConstants.test'

const EVENT_ID_SET_EMIT_KEY = 251107;

@Entry
@Component
struct WebResourceType {
  controller: webview.WebviewController = new webview.WebviewController();
  schemeHandler: webview.WebSchemeHandler = new webview.WebSchemeHandler();
  @State str: string = ''
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  @State isWebInitPageEnd: number = -1;
  @State webResourceTypeMainFrame: number = -1;
  @State webResourceTypeSubFrame: number = -1;
  @State webResourceTypeStyleSheet: number = -1;
  @State webResourceTypeScript: number = -1;
  @State webResourceTypeImage: number = -1;
  @State webResourceTypeFontResource: number = -1;
  @State webResourceTypeMedia: number = -1;
  @State webResourceTypeObject: number = -1;
  @State webResourceTypePrefetch: number = -1;
  @State webResourceFavicon: number = -1;
  @State webResourceTypeXhr: number = -1;
  @State webResourceTypePing: number = -1;
  @State webResourceTypeServiceWorker: number = -1;

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
    console.info('web page valueChangeCallBack');
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
      Row() {
        Button('WebResourceTypeButton').id('WebResourceTypeButton').onClick(async () => {
          await Utils.waitForExist(()=>this.isReceive, 'WebResourceTypeButtonIsReceive', 1, 1000);
          await Utils.waitForExist(()=>this.isWebInitPageEnd, 'WebResourceTypeButtonIsWebInitPageEnd', 1, 1000);
          console.info('key==>' + this.str);
          if (this.isPageEnd == 1) {
            this.controller.loadUrl(CommonConstants.IQIYI_URL)
            await Utils.waitForExist(()=>this.isPageEnd, 'WebResourceTypeIsPageEnd', 2, 1000);
          }
          this.isReceive = -1;
          switch (this.str) {
            case 'testWebResourceTypeMainFrame': {
              try {
                await Utils.waitForExist(()=>this.webResourceTypeMainFrame, 'webResourceTypeMainFrame', 0, 1000);
                Utils.emitEvent(this.webResourceTypeMainFrame, 25110700)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testWebResourceTypeStyleSheet': {
              try {
                await Utils.waitForExist(()=>this.webResourceTypeStyleSheet, 'webResourceTypeStyleSheet', 2, 1000);
                Utils.emitEvent(this.webResourceTypeStyleSheet, 25110702)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testWebResourceTypeScript': {
              try {
                await Utils.waitForExist(()=>this.webResourceTypeScript, 'webResourceTypeScript', 3, 1000);
                Utils.emitEvent(this.webResourceTypeScript, 25110703)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testWebResourceTypeImage': {
              try {
                await Utils.waitForExist(()=>this.webResourceTypeImage, 'webResourceTypeImage', 4, 1000);
                Utils.emitEvent(this.webResourceTypeImage, 25110704)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testWebResourceTypeFontResource': {
              try {
                await Utils.waitForExist(()=>this.webResourceTypeFontResource, 'webResourceTypeFontResource', 5, 1000);
                Utils.emitEvent(this.webResourceTypeFontResource, 25110705)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testWebResourceFavicon': {
              try {
                await Utils.waitForExist(()=>this.webResourceFavicon, 'webResourceFavicon', 12, 1000);
                Utils.emitEvent(this.webResourceFavicon, 25110712)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testWebResourceTypeXhr': {
              try {
                await Utils.waitForExist(()=>this.webResourceTypeXhr, 'webResourceTypeXhr', 13, 1000);
                Utils.emitEvent(this.webResourceTypeXhr, 25110713)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testWebResourceTypeServiceWorker': {
              try {
                await Utils.waitForExist(()=>this.webResourceTypeServiceWorker, 'webResourceTypeServiceWorker', 15, 3000, 30);
                Utils.emitEvent(this.webResourceTypeServiceWorker, 25110715)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testWebResourceTypeSubFrame': {
              this.isPageEnd = 0
              try {
                this.controller.loadUrl($rawfile('iframe1.html'))
                await Utils.waitForExist(()=>this.isPageEnd, 'testWebResourceTypeSubFrame', 2, 1000);
                await Utils.waitForExist(()=>this.webResourceTypeSubFrame, 'webResourceTypeSubFrame', 1, 1000);
                Utils.emitEvent(this.webResourceTypeSubFrame, 25110701)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testWebResourceTypeObject': {
              this.isPageEnd = 0
              try {
                this.controller.loadUrl($rawfile('webResourceType.html'))
                await Utils.waitForExist(()=>this.isPageEnd, 'testWebResourceTypeObject', 2, 1000);
                await Utils.waitForExist(()=>this.webResourceTypeObject, 'webResourceTypeObject', 7, 1000);
                Utils.emitEvent(this.webResourceTypeObject, 25110707)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testWebResourceTypeMedia': {
              this.isPageEnd = 0
              try {
                this.controller.loadUrl($rawfile('webResourceType.html'))
                await Utils.waitForExist(()=>this.isPageEnd, 'testWebResourceTypeMedia', 2, 1000);
                await Utils.waitForExist(()=>this.webResourceTypeMedia, 'webResourceTypeMedia', 8, 1000);
                Utils.emitEvent(this.webResourceTypeMedia, 25110708)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testWebResourceTypePing': {
              this.isPageEnd = 0
              try {
                this.controller.loadUrl($rawfile('webResourceType.html'))
                await Utils.waitForExist(()=>this.isPageEnd, 'testWebResourceTypePing', 2, 1000);
                await Utils.waitForExist(()=>this.webResourceTypePing, 'webResourceTypePing', 14, 1000);
                Utils.emitEvent(this.webResourceTypePing, 25110714)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'testWebResourceTypePrefetch': {
              this.isPageEnd = 0
              try {
                this.controller.loadUrl($rawfile('webResourceType.html'))
                await Utils.waitForExist(()=>this.isPageEnd, 'testWebResourceTypePrefetch', 2, 1000);
                await Utils.waitForExist(()=>this.webResourceTypePrefetch, 'webResourceTypePrefetch', 11, 1000);
                Utils.emitEvent(this.webResourceTypePrefetch, 25110711)
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
          }
        })
      }

      Web({ src: CommonConstants.EXAMPLE_URL, controller: this.controller })
        .javaScriptAccess(true)
        .domStorageAccess(true)
        .onControllerAttached(() => {
          try {
            this.schemeHandler.onRequestStart((request: webview.WebSchemeHandlerRequest,
                resourceHandler: webview.WebResourceHandler) => {
              console.log('[schemeHandler] onRequestStart')
              try {
                console.log('[schemeHandler] onRequestStart getRequestUrl:' + request.getRequestUrl())
                console.log('[schemeHandler] onRequestStart resource type:' + request.getRequestResourceType())
                if (request.getRequestResourceType() === webview.WebResourceType.MAIN_FRAME) {
                    console.log('[schemeHandler] onRequestStart webview.WebResourceType.MAIN_FRAME')
                    this.webResourceTypeMainFrame = request.getRequestResourceType()
                }
                if (request.getRequestResourceType() === webview.WebResourceType.SUB_FRAME) {
                    console.log('[schemeHandler] onRequestStart webview.WebResourceType.SUB_FRAME')
                    this.webResourceTypeSubFrame = request.getRequestResourceType()
                }
                if (request.getRequestResourceType() === webview.WebResourceType.STYLE_SHEET) {
                    console.log('[schemeHandler] onRequestStart webview.WebResourceType.STYLE_SHEET')
                    this.webResourceTypeStyleSheet = request.getRequestResourceType()
                }
                if (request.getRequestResourceType() === webview.WebResourceType.SCRIPT) {
                    console.log('[schemeHandler] onRequestStart webview.WebResourceType.SCRIPT')
                    this.webResourceTypeScript = request.getRequestResourceType()
                }
                if (request.getRequestResourceType() === webview.WebResourceType.IMAGE) {
                    console.log('[schemeHandler] onRequestStart webview.WebResourceType.IMAGE')
                    this.webResourceTypeImage = request.getRequestResourceType()
                }
                if (request.getRequestResourceType() === webview.WebResourceType.FONT_RESOURCE) {
                    console.log('[schemeHandler] onRequestStart webview.WebResourceType.FONT_RESOURCE')
                    this.webResourceTypeFontResource = request.getRequestResourceType()
                }
                if (request.getRequestResourceType() === webview.WebResourceType.OBJECT) {
                    console.log('[schemeHandler] onRequestStart webview.WebResourceType.OBJECT')
                    this.webResourceTypeObject = request.getRequestResourceType()
                }
                if (request.getRequestResourceType() === webview.WebResourceType.MEDIA) {
                    console.log('[schemeHandler] onRequestStart webview.WebResourceType.MEDIA')
                    this.webResourceTypeMedia = request.getRequestResourceType()
                }
                if (request.getRequestResourceType() === webview.WebResourceType.PREFETCH) {
                    console.log('[schemeHandler] onRequestStart webview.WebResourceType.PREFETCH')
                    this.webResourceTypePrefetch = request.getRequestResourceType()
                }
                if (request.getRequestResourceType() === webview.WebResourceType.FAVICON) {
                    console.log('[schemeHandler] onRequestStart webview.WebResourceType.FAVICON')
                    this.webResourceFavicon = request.getRequestResourceType()
                }
                if (request.getRequestResourceType() === webview.WebResourceType.XHR) {
                    console.log('[schemeHandler] onRequestStart webview.WebResourceType.XHR')
                    this.webResourceTypeXhr = request.getRequestResourceType()
                }
                if (request.getRequestResourceType() === webview.WebResourceType.PING) {
                    console.log('[schemeHandler] onRequestStart webview.WebResourceType.PING')
                    this.webResourceTypePing = request.getRequestResourceType()
                }
                if (request.getRequestResourceType() === webview.WebResourceType.SERVICE_WORKER) {
                    console.log('[schemeHandler] onRequestStart webview.WebResourceType.SERVICE_WORKER')
                    this.webResourceTypeServiceWorker = request.getRequestResourceType()
                }

              } catch (error) {
                 console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${error as BusinessError}.message`);
              }
              return false;
            })
            this.schemeHandler.onRequestStop((request: webview.WebSchemeHandlerRequest) => {
              console.log('[schemeHandler] onRequestStop')
            });
            this.controller.setWebSchemeHandler('http', this.schemeHandler);
            this.controller.setWebSchemeHandler('https', this.schemeHandler);
            webview.WebviewController.setServiceWorkerWebSchemeHandler('http', this.schemeHandler);
            webview.WebviewController.setServiceWorkerWebSchemeHandler('https', this.schemeHandler);
          } catch (error) {
            console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${error as BusinessError}.message`);
          }
        })
        .onPageEnd((event) => {
            console.log('onPageEnd url:' + event.url)
            this.isWebInitPageEnd = 1
            if (this.isPageEnd == -1) {
                this.isPageEnd = 1
            } else {
                this.isPageEnd = 2
            }
        })
    }
  }
}