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

import Utils from '../../test/Utils';
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import {waitForAssert, waitForExist} from '../../test/WaitTest.test';
import { Driver, ON } from '@kit.TestKit';

let driver = Driver.create();
@Entry
@Component
struct webOnBeforeUnloadTwo {
  controller: webView.WebviewController = new webView.WebviewController();
  uiContext: UIContext = this.getUIContext();
  @State emitKey: string = '';
  @State message: Array<string> = [];
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  @State isShowConfirm: boolean = false;
  @State isShowCancel: boolean = false;
  @State searchTotalNumber:number = -1;
  @State isSearchEnd: boolean = false;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 141419,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(141419)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
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
        Button('webOnBeforeUnloadTwo click')
          .key('WebOnBeforeUnloadTwoButton')
          .onClick(async () => {
            await waitForExist(()=>this.isReceive, this.emitKey, 0, 1000);
            await waitForExist(()=>this.isPageEnd, this.emitKey, 0, 1000);
            console.info('key==>' + this.emitKey);
            this.isReceive = -1;
            this.isShowConfirm = false;
            this.isShowCancel = false;
            this.isSearchEnd = false;
            this.searchTotalNumber = -1;
            this.controller.clearHistory();
            this.controller.removeCache(true);
            switch (this.emitKey) {
              case 'emitOnBeforeUnloadHandleConfirm': {
                try {
                  await Utils.waitAndClickComponent('onBeforeUnloadTwoWebView',driver);
                  this.controller.runJavaScript('myRefresh()', (error, result) => {
                    if (error) {
                      console.error(`runJavaScript ErrorCode: ${error.code},  Message: ${error.message}`);
                    }
                    if (result) {
                      console.info(`runJavaScript The test() return value is: ${result}`);
                    }
                  })
                  let confirmButton = await driver.waitForComponent(ON.text('确定'), 10000);
                  if (confirmButton) {
                    confirmButton.click();
                    console.log(this.emitKey + 'confirmButton click==>')
                  }
                  await waitForExist(()=>this.isShowConfirm, this.emitKey, true, 1000);
                  if (this.isShowConfirm) {
                    this.controller.searchAllAsync('确定');
                    await waitForExist(()=>this.isSearchEnd, this.emitKey, true, 1000);
                    Utils.emitEvent(this.searchTotalNumber, 26031043);
                  } else {
                    Utils.emitEvent(false, 26031043);
                  }
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case 'emitOnBeforeUnloadHandleCancel': {
                try {
                  await Utils.waitAndClickComponent('onBeforeUnloadTwoWebView',driver);
                  this.controller.runJavaScript('myRefresh()', (error, result) => {
                    if (error) {
                      console.error(`runJavaScript ErrorCode: ${error.code},  Message: ${error.message}`);
                    }
                    if (result) {
                      console.info(`runJavaScript The test() return value is: ${result}`);
                    }
                  })
                  let cancelButton = await driver.waitForComponent(ON.text('取消'), 10000);
                  if (cancelButton) {
                    cancelButton.click();
                    console.log(this.emitKey + 'cancelButton click==>')
                  }
                  await waitForExist(()=>this.isShowCancel, this.emitKey, true, 1000);
                  if (this.isShowCancel) {
                    this.controller.searchAllAsync('取消');
                    await waitForExist(()=>this.isSearchEnd, this.emitKey, true, 1000);
                    Utils.emitEvent(this.searchTotalNumber, 26031044);
                  } else {
                    Utils.emitEvent(false, 26031044);
                  }
                } catch (error) {
                  console.error(`catch ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
            }
         })
      }
      Web({ src: $rawfile('onBeforeUnload.html'), controller: this.controller })
        .key('onBeforeUnloadTwoWebView')
        .onPageEnd((event) => {
          if (event) {
            console.log('onBeforeUnload onPageEnd url:' + event.url);
            this.isPageEnd = 0;
          }
        })
        .onBeforeUnload((event) => {
          if (event) {
            console.log('onBeforeUnload isReload==>' + event.isReload);
            this.uiContext.showAlertDialog({
              title: 'onBeforeUnload',
              message: 'text',
              primaryButton: {
                value: '取消',
                action: () => {
                  event.result.handleCancel();
                  this.isShowCancel = true;
                }
              },
              secondaryButton: {
                value: '确定',
                action: () => {
                  event.result.handleConfirm();
                  this.isShowConfirm = true;
                }
              },
              cancel: () => {
                event.result.handleCancel();
              }
            })
          }
          return true
        })
        .onSearchResultReceive(ret => {
          if (ret) {
            console.log('onSearchResultReceive nul numberOfMatches==>' + ret.numberOfMatches);
            this.isSearchEnd = ret.isDoneCounting;
            this.searchTotalNumber = ret.numberOfMatches;
          }
        })
        .width('100%')
        .height('100%')
    }
  }
}
