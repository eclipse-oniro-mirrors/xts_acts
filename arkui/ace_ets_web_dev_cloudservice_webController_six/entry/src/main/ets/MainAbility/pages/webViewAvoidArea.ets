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
          .key('webViewAvoidAreaButton')
          .onClick(async () => {
            console.info('key==>' + this.emitKey);
            this.controller.refresh();
            await Utils.sleep(2000);
            switch (this.emitKey) {
              case 'emitWebViewAvoidArea01': {
                try {
                  if (Utils.isPC(this.controller) ) {
                    Utils.emitEvent('success', 6201);
                    return
                  }
                  this.isCreateSuccess = false;
                  this.controller.loadUrl($rawfile('contain.html'));
                } catch (error) {
                  let e:business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                }
                break;
              }
              case 'emitWebViewAvoidArea02': {
                try {
                  if (Utils.isPC(this.controller) ) {
                    Utils.emitEvent('success', 6202);
                    return
                  }
                  this.isCreateSuccess = false;
                  this.controller.loadUrl($rawfile('auto.html'));
                  if (this.isCreateSuccess === false) {
                    Utils.emitEvent('success', 6202);
                  }
                } catch (error) {
                  let e:business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                }
                break;
              }
              case 'emitWebViewAvoidArea03': {
                if (Utils.isPC(this.controller) ) {
                  Utils.emitEvent('success', 6203);
                  return
                }
                try {
                  this.isCreateSuccess = false;
                  this.controller.loadUrl($rawfile('cover.html'));
                } catch (error) {
                  let e:business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                }
                break;
              }
              case 'emitWebViewAvoidArea04': {
                try {
                  if (Utils.isPC(this.controller) ) {
                    Utils.emitEvent('success', 6204);
                    return
                  }
                  this.isCreateSuccess = false;
                  this.controller.loadUrl($rawfile('default.html'));
                  if (this.isCreateSuccess === false) {
                    Utils.emitEvent('success', 6204);
                  }
                } catch (error) {
                  let e:business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                }
                break;
              }
              case 'emitWebViewAvoidArea05': {
                try {
                  if (Utils.isPC(this.controller) ) {
                    Utils.emitEvent('success', 6205);
                    return
                  }
                  this.controller.loadUrl($rawfile('expandAreaCover.html'));
                  if (this.avoidAreaChangeStr.length > 0) {
                    Utils.emitEvent('success', 6205);
                  }
                } catch (error) {
                  let e:business_error.BusinessError = error as business_error.BusinessError;
                  console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
                }
                break;
              }
              case 'emitWebViewAvoidAreaOther': {
                try {
                  if (Utils.isPC(this.controller) ) {
                    Utils.emitEvent('success', 6206);
                    return
                  }
                  this.isCreateSuccess = false
                  this.controller.loadUrl($rawfile('viewportOther.html'));
                  if (this.isCreateSuccess === false) {
                    Utils.emitEvent('success', 6206);
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
              Utils.emitEvent('success', 6201);
            }
          }
          if (this.emitKey == 'emitWebViewAvoidArea03') {
            if (viewportFit === 2) {
              Utils.emitEvent('success', 6203);
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
