/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import web_webview from '@ohos.web.webview';
import Utils from '../../test/Utils';
import { BusinessError } from '@ohos.base';
import events_emitter from '@ohos.events.emitter';
import { Driver, MouseButton, UiWindow, ON, On } from '@kit.TestKit';
import { webview } from '@kit.ArkWeb';
import { Context } from '@kit.AbilityKit';
import { util } from '@kit.ArkTS';
import { image } from '@kit.ImageKit';
import { fileIo, fileUri } from '@kit.CoreFileKit';
import { photoAccessHelper } from '@kit.MediaLibraryKit';
import { http } from '@kit.NetworkKit';
const EVENT_ID_SET_SUITE_KEY = 177009;
const driver = Driver.create();

  @Entry
  @Component
  struct BindMenuTest {
  @State enableDefaultMenu: boolean  = true
  @State enableContextMenuShow: boolean  = false
  pageInfos: NavPathStack = new NavPathStack();
  controller: webview.WebviewController = new webview.WebviewController();
  private result: WebContextMenuResult | undefined = undefined;
  @State linkUrl: string = '';
  @State offsetX: number = 0;
  @State offsetY: number = 0;
  @State showMenu: boolean = false;
  uiContext: UIContext = this.getUIContext();
  @State imageStr: string = '';
  @State pixelMap: image.PixelMap | undefined = undefined;
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;
  @State flag:number = 0;
  @State str: string = "";


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
    console.info("web page bindSelectionMenuType01");
    if (eventData != null) {
      console.info("bindSelectionMenuType01:" + JSON.stringify(eventData));
      if (eventData.data?.ACTION != null) {
        this.str = eventData.data?.ACTION;
        this.isReceive = 1;
      }
    }
  }

  build() {
        Column({space: 10}) {
          Row() {
            Button("web test").key('webEnableDefaultContextMenu').onClick(async () => {
              console.info("key==>" + this.str)
              await Utils.waitForExist(()=>this.isReceive, this.str+' isReceive', 1, 1000);
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              switch (this.str) {
                case "EnableDefaultContextMenu01": {
                  this.isPageEnd = -1;
                  this.enableDefaultMenu = true;
                  this.controller.loadUrl("resource://rawfile/LocalImage.html");
                  await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                  let webRect = Utils.getComponentRect('enableDefaultContextMenuButton');
                  let downX = Math.round(globalThis.winLeft + webRect.left + (webRect.right - webRect.left) / 2);
                  let downY = Math.round(globalThis.winTop + webRect.top + (webRect.bottom - webRect.top) / 2);
                  await driver.mouseClick({ x: downX, y: downY }, MouseButton.MOUSE_BUTTON_RIGHT);
                  Utils.sleep(1000);
                  let buttonOne = await driver.findComponent(ON.text('复制'));
                  console.log('EnableDefaultContextMenu01pp' + buttonOne);
                  await buttonOne.click();
                  Utils.sleep(1000);
                  if(buttonOne !== null) {
                    Utils.emitEvent(true, 20260325)
                  }
                  break;
                }

                case "EnableDefaultContextMenu02": {
                  this.isPageEnd = -1;
                  // 设为 false则禁用默认菜单
                  this.enableDefaultMenu = false;
                  this.controller.loadUrl("resource://rawfile/LocalImage.html");
                  await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                  let webRect = Utils.getComponentRect('enableDefaultContextMenuButton');
                  let downX = Math.round(globalThis.winLeft + webRect.left + (webRect.right - webRect.left) / 2);
                  let downY = Math.round(globalThis.winTop + webRect.top + (webRect.bottom - webRect.top) / 2);
                  await driver.mouseClick({ x: downX, y: downY }, MouseButton.MOUSE_BUTTON_RIGHT);
                  Utils.sleep(1000);
                  let buttonOne = await driver.findComponent(ON.text('复制'));
                  console.log('EnableDefaultContextMenu02pp' + buttonOne);
                  Utils.sleep(1000);
                  // 设为 false则禁用默认菜单
                  if(buttonOne == null) {
                    Utils.emitEvent(true, 20260326)
                  }
                  break;
                }

                case "EnableDefaultContextMenu03": {
                  this.isPageEnd = -1;
                  // 设为 truee则可以用默认菜单
                  this.enableDefaultMenu = true;
                  this.controller.loadUrl("resource://rawfile/canvas.html");
                  await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                  let webRect = Utils.getComponentRect('enableDefaultContextMenuButton');
                  let downX = Math.round(globalThis.winLeft + webRect.left + (webRect.right - webRect.left) / 2);
                  let downY = Math.round(globalThis.winTop + webRect.top + (webRect.bottom - webRect.top) / 2);
                  await driver.mouseClick({ x: downX, y: downY }, MouseButton.MOUSE_BUTTON_RIGHT);
                  Utils.sleep(1000);
                  let buttonOne = await driver.findComponent(ON.text('复制'));
                  console.log('EnableDefaultContextMenu03pp' + buttonOne);
                  Utils.sleep(1000);
                  // 设为 true则可以用默认菜单
                  if(buttonOne !== null) {
                    Utils.emitEvent(true, 20260327)
                  }
                  break;
                }


                case "EnableDefaultContextMenu04": {
                  this.isPageEnd = -1;
                  // 设为 false则禁用默认菜单
                  this.enableDefaultMenu = false;
                  this.controller.loadUrl("resource://rawfile/canvas.html");
                  await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                  let webRect = Utils.getComponentRect('enableDefaultContextMenuButton');
                  let downX = Math.round(globalThis.winLeft + webRect.left + (webRect.right - webRect.left) / 2);
                  let downY = Math.round(globalThis.winTop + webRect.top + (webRect.bottom - webRect.top) / 2);
                  await driver.mouseClick({ x: downX, y: downY }, MouseButton.MOUSE_BUTTON_RIGHT);
                  Utils.sleep(1000);
                  let buttonOne = await driver.findComponent(ON.text('复制'));
                  console.log('EnableDefaultContextMenu04pp' + buttonOne);
                  Utils.sleep(1000);
                  // 设为 false则禁用默认菜单
                  if(buttonOne == null) {
                    Utils.emitEvent(true, 20260328)
                  }
                  break;
                }

                case "EnableDefaultContextMenu05": {
                  this.isPageEnd = -1;
                  // 设为 true则可以默认菜单
                  this.enableDefaultMenu = true;
                  this.controller.loadUrl("resource://rawfile/videoOnline.html");
                  await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                  let webRect = Utils.getComponentRect('enableDefaultContextMenuButton');
                  let downX = Math.round(globalThis.winLeft + webRect.left + (webRect.right - webRect.left) / 2);
                  let downY = Math.round(globalThis.winTop + webRect.top + (webRect.bottom - webRect.top) / 2);
                  await driver.mouseClick({ x: downX, y: downY }, MouseButton.MOUSE_BUTTON_RIGHT);
                  Utils.sleep(1000);
                  let buttonOne = await driver.findComponent(ON.text('复制'));
                  console.log('EnableDefaultContextMenu05pp' + buttonOne);
                  Utils.sleep(1000);
                  // 设为 true可以默认菜单
                  if(buttonOne !== null) {
                    Utils.emitEvent(true, 20260329)
                  }
                  break;
                }


                case "EnableDefaultContextMenu06": {
                  this.isPageEnd = -1;
                  // 设为 false则禁用默认菜单
                  this.enableDefaultMenu = false;
                  this.controller.loadUrl("resource://rawfile/videoOnline.html");
                  await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                  let webRect = Utils.getComponentRect('enableDefaultContextMenuButton');
                  let downX = Math.round(globalThis.winLeft + webRect.left + (webRect.right - webRect.left) / 2);
                  let downY = Math.round(globalThis.winTop + webRect.top + (webRect.bottom - webRect.top) / 2);
                  await driver.mouseClick({ x: downX, y: downY }, MouseButton.MOUSE_BUTTON_RIGHT);
                  Utils.sleep(1000);
                  let buttonOne = await driver.findComponent(ON.text('复制'));
                  console.log('EnableDefaultContextMenu06pp' + buttonOne);
                  Utils.sleep(1000);
                  // 设为 false则禁用默认菜单
                  if(buttonOne == null) {
                    Utils.emitEvent(true, 20260330)
                  }
                  break;
                }


                case "EnableDefaultContextMenu07": {
                  this.isPageEnd = -1;
                  // 设为 true则可以默认菜单
                  this.enableDefaultMenu = true;
                  this.controller.loadUrl("resource://rawfile/audioOnline.html");
                  await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                  let webRect = Utils.getComponentRect('enableDefaultContextMenuButton');
                  let downX = Math.round(globalThis.winLeft + webRect.left + (webRect.right - webRect.left) / 2);
                  let downY = Math.round(globalThis.winTop + webRect.top + (webRect.bottom - webRect.top) / 2);
                  await driver.mouseClick({ x: downX, y: downY }, MouseButton.MOUSE_BUTTON_RIGHT);
                  Utils.sleep(1000);
                  let buttonOne = await driver.findComponent(ON.text('复制'));
                  console.log('EnableDefaultContextMenu07pp' + buttonOne);
                  Utils.sleep(1000);
                  // 设为 true则可以默认菜单
                  if(buttonOne !== null) {
                    Utils.emitEvent(true, 20260331)
                  }
                  break;
                }

                case "EnableDefaultContextMenu08": {
                  this.isPageEnd = -1;
                  // 设为 false则禁用默认菜单
                  this.enableDefaultMenu = false;
                  this.controller.loadUrl("resource://rawfile/audioOnline.html");
                  await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                  let webRect = Utils.getComponentRect('enableDefaultContextMenuButton');
                  let downX = Math.round(globalThis.winLeft + webRect.left + (webRect.right - webRect.left) / 2);
                  let downY = Math.round(globalThis.winTop + webRect.top + (webRect.bottom - webRect.top) / 2);
                  await driver.mouseClick({ x: downX, y: downY }, MouseButton.MOUSE_BUTTON_RIGHT);
                  Utils.sleep(1000);
                  let buttonOne = await driver.findComponent(ON.text('复制'));
                  console.log('EnableDefaultContextMenu08pp' + buttonOne);
                  Utils.sleep(1000);
                  // 设为 false则禁用默认菜单
                  if(buttonOne == null) {
                    Utils.emitEvent(true, 20260332)
                  }
                  break;
                }
                case "EnableDefaultContextMenu09": {
                  this.isPageEnd = -1;
                  // 设为 true则可以默认菜单
                  this.enableDefaultMenu = true;
                  this.controller.loadUrl("resource://rawfile/Hyperlinks.html");
                  await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                  let webRect = Utils.getComponentRect('enableDefaultContextMenuButton');
                  let downX = Math.round(globalThis.winLeft + webRect.left + (webRect.right - webRect.left) / 2);
                  let downY = Math.round(globalThis.winTop + webRect.top + (webRect.bottom - webRect.top) / 2);
                  await driver.mouseClick({ x: downX, y: downY }, MouseButton.MOUSE_BUTTON_RIGHT);
                  Utils.sleep(1000);
                  let buttonOne = await driver.findComponent(ON.text('复制'));
                  console.log('EnableDefaultContextMenu09pp' + buttonOne);
                  Utils.sleep(1000);
                  // 设为 true则可以默认菜单
                  if(buttonOne !== null) {
                    Utils.emitEvent(true, 20260333)
                  }
                  break;
                }
                case "EnableDefaultContextMenu10": {
                  this.isPageEnd = -1;
                  // 设为 false则禁用默认菜单
                  this.enableDefaultMenu = false;
                  this.controller.loadUrl("resource://rawfile/Hyperlinks.html");
                  await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                  let webRect = Utils.getComponentRect('enableDefaultContextMenuButton');
                  let downX = Math.round(globalThis.winLeft + webRect.left + (webRect.right - webRect.left) / 2);
                  let downY = Math.round(globalThis.winTop + webRect.top + (webRect.bottom - webRect.top) / 2);
                  await driver.mouseClick({ x: downX, y: downY }, MouseButton.MOUSE_BUTTON_RIGHT);
                  Utils.sleep(1000);
                  let buttonOne = await driver.findComponent(ON.text('复制'));
                  console.log('EnableDefaultContextMenu10pp' + buttonOne);
                  Utils.sleep(1000);
                  // 设为 false则禁用默认菜单
                  if(buttonOne == null) {
                    Utils.emitEvent(true, 20260334)
                  }
                  break;
                }

              }
            })
          }
          Web({ src: $rawfile("LocalImage.html"), controller: this.controller }).key('enableDefaultContextMenuButton')
            .enableDefaultContextMenu(this.enableDefaultMenu)
            .onContextMenuShow((event: OnContextMenuShowEvent) => {
              console.log('pyyytt');
              return this.enableContextMenuShow
            })
            .onPageEnd((event) => {
              console.log('onPageEnd url:' + event.url);
              this.isPageEnd = 1;
            })
        }
        .width('100%')
        .height('100%')
      }
}