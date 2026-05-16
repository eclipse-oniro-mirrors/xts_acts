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
import window from '@ohos.window'
import { waitForExist } from '../../test/WaitTest.test';
@Entry
@Component
struct webViewAvoidArea {
  controller: webview.WebviewController = new webview.WebviewController();
  schemeHandler: webview.WebSchemeHandler = new webview.WebSchemeHandler()
  @State emitKey: string = '';
  @State javaScriptAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State domStorageAccess: boolean = true;
  @State imageAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State databaseAccess: boolean = true;
  @State isFrameResourceType: boolean = false;
  @State avoidAreaChangeStr: string = '';
  @State safeEdge: Array <SafeAreaEdge>=[SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM, SafeAreaEdge.START, SafeAreaEdge.END];
  @State screenHeight: number = 0;
  @State isCreateSuccess: boolean = false;
  @State ViewportFitArr:ViewportFit[] = [ViewportFit.AUTO,ViewportFit.CONTAINS,ViewportFit.COVER]
  @State isComplete: number = -1;
  @State isReceive: number = -1;
  aboutToAppear() {
    window.getLastWindow(getContext(this)).then(currentWindow =>{
      let property = currentWindow.getWindowProperties();
      let avoidArea = currentWindow.getWindowAvoidArea(window.AvoidAreaType.TYPE_KEYBOARD);
      this.avoidAreaChangeStr = JSON.stringify(avoidArea);
      // 初始化显示区域高度
      this.screenHeight = px2vp(property.windowRect.height - avoidArea.bottomRect.height);
      // 监视软键盘的弹出和收起
      currentWindow.on('avoidAreaChange', async data => {
        if (data.type !== window.AvoidAreaType.TYPE_KEYBOARD) {
          return;
        }
        this.screenHeight = px2vp(property.windowRect.height - data.area.bottomRect.height);
      })
    })
  }
  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 153550,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }
  onPageHide() {
    events_emitter.off(153550)
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
          .key('webViewAvoidAreaButton')
          .onClick(async () => {
            console.info('key' + this.emitKey);
            await waitForExist(() => this.isReceive, this.emitKey, 0);
            this.isReceive = -1;
            console.info('key==>' + this.emitKey);
            this.controller.refresh();
            console.info('key==>' + this.emitKey)

            switch (this.emitKey) {
              case 'emitWebViewAvoidArea01': {
                try {
                  this.isCreateSuccess = false;
                  this.isComplete = -1;
                  this.controller.loadUrl($rawfile('contain.html'));
                  await waitForExist(() => this.isComplete, this.emitKey, 0);
                } catch (error) {
                  let e:business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                }
                break;
              }
              case 'emitWebViewAvoidArea02': {
                try {
                  this.isCreateSuccess = false;
                  this.isComplete = -1;
                  this.controller.loadUrl($rawfile('auto.html'));
                  await waitForExist(() => this.isComplete, this.emitKey, 0);
                  if (this.isCreateSuccess === false) {
                    Utils.emitEvent(this.ViewportFitArr[ViewportFit.AUTO], 153570);
                  }
                } catch (error) {
                  let e:business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                }
                break;
              }
              case 'emitWebViewAvoidArea03': {
                try {
                  this.isCreateSuccess = false;
                  this.isComplete = -1;
                  this.controller.loadUrl($rawfile('cover.html'));
                  await waitForExist(() => this.isComplete, this.emitKey, 0);
                } catch (error) {
                  let e:business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                }
                break;
              }
              case 'emitWebViewAvoidArea04': {
                try {
                  this.isCreateSuccess = false;
                  this.isComplete = -1;
                  this.controller.loadUrl($rawfile('default.html'));
                  await waitForExist(() => this.isComplete, this.emitKey, 0);
                  if (this.isCreateSuccess === false) {
                    Utils.emitEvent(this.ViewportFitArr[ViewportFit.AUTO], 153590);
                  }
                } catch (error) {
                  let e:business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                }
                break;
              }
              case 'emitWebViewAvoidAreaOther': {
                try {
                  this.isCreateSuccess = false
                  this.isComplete = -1;
                  this.controller.loadUrl($rawfile('viewportOther.html'));
                  await waitForExist(() => this.isComplete, this.emitKey, 0);
                  if (this.isCreateSuccess === false) {
                    Utils.emitEvent('success', 153600);
                  }
                } catch (error) {
                  let e:business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                }
                break;
              }
            }
          })
      }
      Web({ src: '', controller: this.controller })
        .onPageEnd((event) => {
          console.log('pageEnd==>' + event.url);
          this.isComplete = 0;
        })
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(this.fileAccess)
        .imageAccess(this.imageAccess)
        .domStorageAccess(this.domStorageAccess)
        .onlineImageAccess(this.onlineImageAccess)
        .databaseAccess(this.databaseAccess)
        .expandSafeArea([SafeAreaType.SYSTEM, SafeAreaType.CUTOUT, SafeAreaType.KEYBOARD], this.safeEdge)
        .onViewportFitChanged((data) => {
          let jsonData = JSON.stringify(data);
          let viewportFit: ViewportFit = JSON.parse(jsonData).viewportFit;
          if (viewportFit) {
            this.isCreateSuccess = true;
          }
          if (this.emitKey == 'emitWebViewAvoidArea01') {
            if (viewportFit === 1) {
              Utils.emitEvent(this.ViewportFitArr[ViewportFit.CONTAINS], 153560);
            }
          }
          if (this.emitKey == 'emitWebViewAvoidArea03') {
            if (viewportFit === 2) {
              Utils.emitEvent(this.ViewportFitArr[ViewportFit.COVER], 153580);
            }
          }
        })
      TextInput({
        text: '请输入'
      })
        .width('90%')
        .height('150px')
        .defaultFocus(true)

    }
  }
}
