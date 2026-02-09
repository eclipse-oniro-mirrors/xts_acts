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

import Utils from '../../test/Utils.test';
import webView from '@ohos.web.webview';
import events_emitter from '@ohos.events.emitter';
import image from '@ohos.multimedia.image';
import { Hypium } from '@ohos/hypium';
import { waitForExist} from '../../test/WaitTest.test';
import { AbilityConstant, Configuration, ConfigurationConstant, UIAbility, Want } from '@kit.AbilityKit';
import { webview } from '@kit.ArkWeb';
import { pasteboard } from '@kit.BasicServicesKit';
import { Driver, MouseButton, UiWindow, ON, On } from '@kit.TestKit';
const EVENT_ID_SET_SUITE_KEY = 183119;
let driver = Driver.create();
const TAG = 'ContextMenu';

@Entry
@Component
struct webViewController {
  controller: webview.WebviewController = new webview.WebviewController();
  private result: WebContextMenuResult | undefined = undefined;
  @State linkUrl: string = '';
  @State offsetX: number = 0;
  @State offsetY: number = 0;
  @State showMenu: boolean = false;
  @State str: string = ""
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  @State FileSelectorParamGetMimeTypes: Array<String> = []
  @State uri: string = "file://docs/storage/Users/currentUser/Documents/1.json";

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_SUITE_KEY,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_SUITE_KEY)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 1;
      }
    }
  }


  @Builder
  // 构建自定义菜单及触发功能接口
  MenuBuilder() {
    // 以垂直列表形式显示的菜单。
    Menu() {
      // 展示菜单Menu中具体的item菜单项。
      MenuItem({
        content: '粘贴',
      })
        .width(100)
        .height(50)
        .onClick(() => {
          this.result?.paste();
          this.showMenu = false;
        })
      MenuItem({
        content: '复制链接',
      })
        .width(100)
        .height(50)
        .onClick(() => {
          let pasteData = pasteboard.createData('text/plain', this.linkUrl);
          pasteboard.getSystemPasteboard().setData(pasteData, (error) => {
            if (error) {
              return;
            }
          })
          this.showMenu = false;
        })
      MenuItem({
        content: '复制',
      })
        .width(100)
        .height(50)
        .onClick(() => {
          this.result?.copy();
          this.showMenu = false;
        })
    }
    .width(150)
    .height(450)
  }

  build() {
    Column() {
      Row() {
        Button("WebViewController click").key('WebViewGetMimeTypesButton').onClick(async () => {
          console.info("key==>" + this.str)
          await Utils.waitForExist(()=>this.isReceive, this.str+' isReceive', 1, 1000);
          await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
          switch (this.str) {
            case "emitWebViewGetMimeTypes01": {
                this.isPageEnd = -1
                this.controller.loadUrl("resource://rawfile/showFileSelector.html")
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                let buttonOne = await driver.findComponent(ON.text('选择文件'));
                await buttonOne.click()
                await Utils.waitForReleaseDriver(this.str, driver)
                if(this.FileSelectorParamGetMimeTypes.length > 0) {
                  Utils.emitEvent(true, 20251111);
                }
                this.isPageEnd = -1
                this.controller.loadUrl("resource://rawfile/showFileSelector.html")
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                break;
            }

            case "emitWebViewGetMimeTypes02": {
                this.isPageEnd = -1
                this.controller.loadUrl("resource://rawfile/showFileSelector02.html")
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                let buttonOne = await driver.findComponent(ON.text('选择文件'));
                await buttonOne.click()
                await Utils.waitForReleaseDriver(this.str, driver)
                if(this.FileSelectorParamGetMimeTypes.length == 0) {
                  Utils.emitEvent(true, 20251112);
                }
                this.isPageEnd = -1
                this.controller.loadUrl("resource://rawfile/showFileSelector.html")
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              break;

            }



          }
        })
      }

      Web({ src: $rawfile('showFileSelector.html'), controller: this.controller })
        .javaScriptAccess(true)
        .key("onShowFileSelectorKey")
        .onPageEnd((event) => {
          this.isPageEnd = 1
        })
        .onShowFileSelector((event) => {
          if (event) {
            console.log('MyFileUploader onShowFileSelector invoked')
            console.info('getTitle:', event.fileSelector.getTitle())
            console.info('getMode:', event.fileSelector.getMode())
            console.info('getAcceptType:', event.fileSelector.getAcceptType())
            console.info('isCapture:', event.fileSelector.isCapture())
            console.info('getMimeTypes:', event.fileSelector.getMimeTypes())
            event.result.handleFileList([this.uri]);
            this.FileSelectorParamGetMimeTypes  = event.fileSelector.getMimeTypes()
          }
          return true
        })
        .fileAccess(true)
    }
    .key('RowSize')

  }
}

