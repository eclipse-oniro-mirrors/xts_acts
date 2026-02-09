/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { OnConsoleEvent,Color,Builder, OnPermissionRequestEvent,NativeEmbedDataInfo, PermissionRequest, Entry, Component, Column, Row, Button, WrappedBuilder,ClickEvent,TouchEvent, Web ,TextInput,ViewportFit,OnViewportFitChangedCallback,Stack} from "@ohos.arkui.component"
import Utils from '../../src/test/Util.test';
import web_webview from '@ohos.web.webview';
import webview from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import { Callback } from '@ohos.base'
import { State } from "@ohos.arkui.stateManagement" // should be insert by ui-plugins
import deviceInfo from '@ohos.deviceInfo';
import { canIUse } from '@internal.full.global'
import { BusinessError } from '@ohos.base'
import {OnNativeEmbedVisibilityChangeCallback,NativeEmbedDataInfo,Edges,Position ,TextInput,NativeEmbedDataInfo,OnNativeEmbedVisibilityChangeCallback,NativeEmbedTouchInfo,wrapBuilder} from "@ohos.arkui.component"
import { Driver, ON } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import common from '@ohos.app.ability.common';
import { AppStorage } from '@ohos.arkui.stateManagement'
import window from '@ohos.window';
import util from '@ohos.util';
import { CustomBuilderT ,ForEach,NodeContainer,NativeEmbedVisibilityInfo,SslErrorEvent,OnSslErrorEventCallback,OnConfirmEvent,OnTitleReceiveEvent,OnFaviconReceivedEvent, OnTouchIconUrlReceivedEvent,KeyEvent,OnSearchResultReceiveEvent,OnPromptEvent,OnAlertEvent,OnPageEndEvent,OnProgressChangeEvent,NativeEmbedStatus,OnPageBeginEvent,OnRefreshAccessedHistoryEvent,OnLoadInterceptEvent,OnScaleChangeEvent} from '@ohos.arkui.component';
import { UIContext } from '@ohos.arkui.UIContext';
import { BuilderNode, FrameNode, NodeController, NodeRenderType } from '@ohos.arkui.node';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '../../../hypium';
import testsuite from '../../src/test/List.test';
import { wrapBuilder,Text,TouchType} from "@ohos.arkui.component"
import image from '@ohos.multimedia.image';
import { JsProxyObject } from '../../src/test/Interfaces';
import emitter from '@ohos.events.emitter';
import { Callback, RecordData } from '@ohos.base'

class StringFields {
  public str: string = '';
}
@Entry
@Component
struct webViewWebResourceTypeProps {
  stringObj: StringFields  = new StringFields ();
  controller: webview.WebviewController = new webview.WebviewController(undefined);
  schemeHandler: webview.WebSchemeHandler = new webview.WebSchemeHandler()
  @State emitKey: string = '';
  @State str: string = '';
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = true;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State userAgent: string = 'Mozilla/5.0 (Window NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko)' +
    'Chrome/105.0.0.0 Safari/537.36 Edg/105.0.1343.27';

  aboutToAppear() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack: Callback<events_emitter.EventData> = (eventData: events_emitter.EventData): void => {
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      const data = eventData.data as Record<string, RecordData>;
      if (data != null && data['ACTION'] != null) {
        let strValue: string = String(data['ACTION']);
        this.stringObj.str = strValue;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('web click')
          .key('webViewWebResourceTypeProps')
          .onClick((e: ClickEvent) => {
            console.info('key==>' + this.stringObj.str)
            this.controller.loadUrl('resourve://rawfile/resourceType.html')

            switch (this.stringObj.str) {
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

                if(webview.WebResourceType.WORKER.toString() === '9'){
                  Utils.emitEvent(true,1351)
                }
                break;
              }
              case 'emitWebView_webResourceType_SHARED_WORKER': {
                console.log('webResourceTypeProp:' + webview.WebResourceType.SHARED_WORKER)
                this.controller.loadUrl('http://114.115.208.239:8070/colombo_test/webResourceType/sharedWorker/sharedWorker.html')

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

                if(webview.WebResourceType.PING.toString() === '14'){
                  Utils.emitEvent(true,1356)
                }
                break;
              }
              case 'emitWebView_webResourceType_CSP_REPORT': {
                console.log('webResourceTypeProp:' + webview.WebResourceType.CSP_REPORT)
                this.controller.loadUrl('resource://rawfile/csp.html')

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
              (request: webview.WebSchemeHandlerRequest, resourceHandler: webview.WebResourceHandler) :boolean=> {
                console.log('[schemeHandler] onRequestStart')
                request.getFrameUrl()
                request.getRequestResourceType()
                return false;
              }
            )

            this.schemeHandler.onRequestStop((request: webview.WebSchemeHandlerRequest):void => {
              console.log('[schemeHandler] onRequestStop')
            });

            this.controller.setWebSchemeHandler('https', this.schemeHandler);
            this.controller.setWebSchemeHandler('http', this.schemeHandler);
            this.controller.setWebSchemeHandler('resource', this.schemeHandler);
          } catch (error) {
            //let e: business_error.BusinessError = error as business_error.BusinessError;
           hilog.info(0X0000,"testTag",`ErrorCode: ` + error );
          }
        })
    }
  }
}
