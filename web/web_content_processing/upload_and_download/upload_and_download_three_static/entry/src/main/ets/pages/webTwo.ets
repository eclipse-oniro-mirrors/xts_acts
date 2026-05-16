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

import { Entry, Text,Column, Component, Button, ClickEvent, Web, Row, Stack } from '@ohos.arkui.component'  // TextAttribute should be insert by ui-plugins
import { State} from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import Utils from '../../src/test/Utils.test';
import events_emitter from '@ohos.events.emitter';
import emitter from '@ohos.events.emitter';
import { Callback, RecordData, BusinessError } from '@ohos.base'
import web_webview from '@ohos.web.webview';

export class StringFields {
  public str: string = '';
}

@Entry
@Component
struct Second {
  stringObj: StringFields  = new StringFields ();
  @State outputStr: string = '';
  webviewCtl: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  controller2: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  delegate: web_webview.WebDownloadDelegate = new web_webview.WebDownloadDelegate();
  @State str: string = 'emitonDownloadFailed';
  @State embedStatus: string = '';
  @State eventType: string = '';
  @State setDownloadDelegateKey: boolean = false;


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
        Button('web click').key('webcomponenttwo').onClick((e: ClickEvent) => {
          console.info('key==>' + this.stringObj.str)
          switch (this.stringObj.str) {

            case 'emitonDownloadFailed': {
              try {
                this.webviewCtl.setDownloadDelegate(this.delegate);
                Utils.emitEvent(true, 6)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'emitRefreshTrue': {
              try {
                this.webviewCtl.refresh(true);
                Utils.emitEvent(true, 7)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case 'emitRefreshFalse': {
              try {
                this.webviewCtl.refresh(false);
                Utils.emitEvent(true, 8)
              } catch (error) {
                error = error as BusinessError;
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
          }
        })
      }

      Stack() {
        Web({ src: 'www.baidu.com', controller: this.webviewCtl, incognitoMode: true })
          .fileAccess(true)
          .enableNativeEmbedMode(false)
          .javaScriptAccess(true)
          .domStorageAccess(true)
          .onlineImageAccess(true)
          .enableFollowSystemFontWeight(false)

        Web({ src: 'www.baidu.com', controller: this.controller2})
          .enableImageAnalyzer(undefined)
          .rotateRenderEffect(undefined)
          .enableWebAVSession(undefined)
          .editMenuOptions(undefined)
          .onAdsBlocked(undefined)
          .onOverrideErrorPage(undefined)
          .copyOptions(undefined)
          .enableNativeEmbedMode(undefined)
          .layoutMode(undefined)
          .verticalScrollBarAccess(undefined)
          .horizontalScrollBarAccess(undefined)
          .forceDisplayScrollBar(undefined)
          .onSslErrorEvent(undefined)
          .onSslErrorEventReceive(undefined)
          .onContextMenuHide(undefined)
          .onContextMenuShow(undefined)
          .onScreenCaptureRequest(undefined)
          .onPermissionRequest(undefined)
          .onInterceptRequest(undefined)
          .onHttpAuthRequest(undefined)
          .onResourceLoad(undefined)
          .onShowFileSelector(undefined)
          .onHttpErrorReceive(undefined)
          .onErrorReceive(undefined)
          .onRequestSelected(undefined)
          .onLoadFinished(undefined)
          .onLoadStarted(undefined)
          .onPageEnd(undefined)
          .metaViewport(undefined)
          .initialScale(undefined)
          .databaseAccess(undefined)
          .textZoomRatio(undefined)
          .overScrollMode(undefined)
          .domStorageAccess(undefined)
          .onlineImageAccess(undefined)
          .fileAccess(undefined)
          .javaScriptAccess(undefined)
          .onFirstScreenPaint(undefined)
          .blankScreenDetectionConfig(undefined)
          .onDetectedBlankScreen(undefined)
          .forceEnableZoom(undefined)
          .onActivateContent(undefined)
          .enableFollowSystemFontWeight(undefined)
          .enableHapticFeedback(undefined)
          .onInterceptKeyboardAttach(undefined)
          .onViewportFitChanged(undefined)
          .onOverrideUrlLoading(undefined)
          .onIntelligentTrackingPreventionResult(undefined)
          .onNavigationEntryCommitted(undefined)
          .onControllerAttached(undefined)
          .onLoadIntercept(undefined)
          .onLargestContentfulPaint(undefined)
          .onFirstMeaningfulPaint(undefined)
          .onFirstContentfulPaint(undefined)
          .onAudioStateChanged(undefined)
          .onPageVisible(undefined)
          .defaultTextEncodingFormat(undefined)
          .minLogicalFontSize(undefined)
          .minFontSize(undefined)
          .defaultFontSize(undefined)
          .defaultFixedFontSize(undefined)
          .onFullScreenEnter(undefined)
          .onFullScreenExit(undefined)
          .onConsole(undefined)
          .onTitleReceive(undefined)
          .onProgressChange(undefined)
      }
    }
  }
}