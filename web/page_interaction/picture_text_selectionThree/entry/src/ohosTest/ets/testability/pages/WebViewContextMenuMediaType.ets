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
const EVENT_ID_SET_SUITE_KEY = 183112;
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
  @State flag:number = 1;
  @State ContextMenuDataMediaTypeArr: ContextMenuDataMediaType[] = [ContextMenuDataMediaType.NONE,ContextMenuDataMediaType.IMAGE, ContextMenuDataMediaType.VIDEO,
    ContextMenuDataMediaType.AUDIO,ContextMenuDataMediaType.CANVAS]

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
        Button("WebViewController click").key('WebViewgContextMenuMediaTypeButton').onClick(async () => {
          console.info("key==>" + this.str)
          await Utils.waitForExist(()=>this.isReceive, this.str+' isReceive', 1, 1000);
          await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
          switch (this.str) {
            case "emitContextMenuMediaTypeVideo": {
              try {
                this.flag = 1;
                console.log('emitContextMenuMediaTypeVideo9999')
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("video.html"))
                await waitForExist(()=>this.isPageEnd, 'emitContextMenuMediaTypeVideo IsPageEnd', 0);
                let webRect = Utils.getComponentRect('ContextMenuMediaTypeButton');
                let downX = Math.round(globalThis.winLeft + webRect.left + (webRect.right - webRect.left) / 2);
                let downY = Math.round(globalThis.winTop + webRect.top + (webRect.bottom - webRect.top) / 2);
                await driver.mouseClick({ x: downX, y: downY }, MouseButton.MOUSE_BUTTON_RIGHT);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
            case "emitContextMenuMediaTypeText": {
              try {
                this.flag = 2;
                console.log('emitContextMenuMediaTypeText9999')
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("text.html"))
                await waitForExist(()=>this.isPageEnd, 'emitContextMenuMediaTypeText IsPageEnd', 0);
                let webRect = Utils.getComponentRect('ContextMenuMediaTypeButton');
                let downX = Math.round(globalThis.winLeft + webRect.left + (webRect.right - webRect.left) / 2);
                let downY = Math.round(globalThis.winTop + webRect.top + (webRect.bottom - webRect.top) / 2);
                await driver.mouseClick({ x: downX, y: downY }, MouseButton.MOUSE_BUTTON_RIGHT);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "emitContextMenuMediaTypeImage": {
              try {
                this.flag = 3;
                console.log('emitContextMenuMediaTypeImage9999')
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("image.html"))
                await waitForExist(()=>this.isPageEnd, 'emitContextMenuMediaTypeImage IsPageEnd', 0);
                let webRect = Utils.getComponentRect('ContextMenuMediaTypeButton');
                let downX = Math.round(globalThis.winLeft + webRect.left + (webRect.right - webRect.left) / 2);
                let downY = Math.round(globalThis.winTop + webRect.top + (webRect.bottom - webRect.top) / 2);
                await driver.mouseClick({ x: downX, y: downY }, MouseButton.MOUSE_BUTTON_RIGHT);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }



            case "emitContextMenuMediaTypeAudio": {
              try {
                this.flag = 4;
                console.log('emitContextMenuMediaTypeAudio9999')
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("audio.html"))
                await waitForExist(()=>this.isPageEnd, 'emitContextMenuMediaTypeAudio IsPageEnd', 0);
                let webRect = Utils.getComponentRect('ContextMenuMediaTypeButton');
                let downX = Math.round(globalThis.winLeft + webRect.left + (webRect.right - webRect.left) / 2);
                let downY = Math.round(globalThis.winTop + webRect.top + (webRect.bottom - webRect.top) / 2);
                await driver.mouseClick({ x: downX, y: downY }, MouseButton.MOUSE_BUTTON_RIGHT);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "emitContextMenuMediaTypeCanvas": {
              try {
                this.flag = 5;
                console.log('emitContextMenuMediaTypeCanvas9999')
                this.isPageEnd = -1;
                this.controller.loadUrl($rawfile("canvas.html"))
                await waitForExist(()=>this.isPageEnd, 'emitContextMenuMediaTypeCanvas IsPageEnd', 0);
                let webRect = Utils.getComponentRect('ContextMenuMediaTypeButton');
                let downX = Math.round(globalThis.winLeft + webRect.left + (webRect.right - webRect.left) / 2);
                let downY = Math.round(globalThis.winTop + webRect.top + (webRect.bottom - webRect.top) / 2);
                await driver.mouseClick({ x: downX, y: downY }, MouseButton.MOUSE_BUTTON_RIGHT);
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

          }
        })
      }

      Web({ src: 'https://www.baidu.com', controller: this.controller })
        .key('ContextMenuMediaTypeButton')
        .onPageEnd((event) => {
          console.log('web pageEnd==>' + event.url);
          this.isPageEnd = 0;
        })
      // 触发自定义弹窗
        .onContextMenuShow((event) => {
          if (event) {
            this.result = event.result
            console.info("onContextMenuShow getContextMenuMediaType = " + event.param.getContextMenuMediaType());
            if(this.flag == 1) {
              console.log('emitContextMenuMediaTypeVideo');
              Utils.emitEvent(this.ContextMenuDataMediaTypeArr[event.param.getContextMenuMediaType()],20251103)
            } else if(this.flag == 2) {
              console.log('emitContextMenuMediaTypeText2');
              Utils.emitEvent(this.ContextMenuDataMediaTypeArr[event.param.getContextMenuMediaType()],20251104)
            } else if(this.flag == 3) {
              console.log('emitContextMenuMediaTypeImage2');
              Utils.emitEvent(this.ContextMenuDataMediaTypeArr[event.param.getContextMenuMediaType()],20251105)
            } else if(this.flag == 4) {
              console.log('emitContextMenuMediaTypeAudio2');
              Utils.emitEvent(this.ContextMenuDataMediaTypeArr[event.param.getContextMenuMediaType()],20251106)
            } else if(this.flag == 5) {
              console.log('emitContextMenuMediaTypeCanvas2');
              Utils.emitEvent(this.ContextMenuDataMediaTypeArr[event.param.getContextMenuMediaType()],20251107)
            }


          }
          console.info(TAG, `x: ${this.offsetX}, y: ${this.offsetY}`);
          this.showMenu = true;
          this.offsetX = 0;
          this.offsetY = Math.max(px2vp(event?.param.y() ?? 0) - 0, 0);
          return true;
        })
        .bindPopup(this.showMenu,
          {
            builder: this.MenuBuilder(),
            enableArrow: false,
            placement: Placement.LeftTop,
            // offset: { x: this.offsetX, y: this.offsetY },
            mask: false,
            onStateChange: (e) => {
              if (!e.isVisible) {
                this.showMenu = false;
                this.result!.closeContextMenu();
              }
            }
          })
      }
    .key('RowSize')
  }
}

