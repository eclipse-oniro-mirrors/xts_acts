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
import {
  Entry,
  Component,
  Column,
  Row,
  Button,
  ClickEvent,
  Web,
  UIContext,
  $rawfile,
  WebContextMenuResult,
  Menu,
  MenuItem,
  OnDownloadStartEvent,
  Placement
} from '@ohos.arkui.component'
import Utils from '../../src/test/Util.test';
import image from '@ohos.multimedia.image';
import { Hypium } from '../../../hypium/index';
import { State } from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import web_webview from '@ohos.web.webview';
import { BusinessError, Callback, RecordData } from '@ohos.base';
import events_emitter from '@ohos.events.emitter';
import { Driver, MouseButton, UiWindow, ON, On } from '@kit.TestKit';
import { webview } from '@kit.ArkWeb';
import { Context } from '@kit.AbilityKit';
import { util } from '@kit.ArkTS';
import { fileIo, fileUri } from '@kit.CoreFileKit';
import { http } from '@kit.NetworkKit';
const EVENT_ID_SET_SUITE_KEY = 177008;
const TAG = 'WebContextMenuResult ';
const driver = Driver.create();
export class StringFields {
  public str: string = '';
}
@Entry
@Component
struct BindMenuTest {
  stringObj: StringFields  = new StringFields();
  controller: webview.WebviewController = new webview.WebviewController(undefined);
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

  aboutToAppear() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_SUITE_KEY,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack: Callback<events_emitter.EventData> = (eventData: events_emitter.EventData): void => {
    if (eventData !== null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      const data = eventData.data as Record<string, RecordData>;
      if (data !== null && data['ACTION'] !== null) {
        let strValue: string = String(data['ACTION']);
        this.stringObj.str = strValue;
        console.info('this.stringObj.str has been updated to: ' + this.stringObj.str);
      }
    }
  }


  writeImageFile(filePath: string, imgData: Uint8Array): boolean {
    let file: fileIo.File | undefined = undefined;
    try {
      file = fileIo.openSync(filePath, fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.CREATE);
      fileIo.writeSync(file.fd, imgData.buffer.slice(0));
    } catch (err) {
      console.error(TAG, `Failed to write image data to sandbox: ${JSON.stringify(err)}`);
      if (file) {
        fileIo.closeSync(file);
        file = undefined;
      }
      return false;
    } finally {
      if (file) {
        fileIo.closeSync(file);
        file = undefined;
      }
    }
    return true;
  }


  async saveImage() {
    // 判断是否以固定格式开头，如果不是则为非法base64字符串图片
    if (this.imageStr.search(new RegExp('data:image/\\w+;base64,')) === 0) {
      console.log(TAG, `Is base64 image`);
      return;
    } else if (this.imageStr.search(new RegExp('resource://rawfile/')) === 0) {
      console.log(TAG, `Is rawfile image`);
      return;
    } else if (this.imageStr.search(new RegExp('https://')) === 0) {
      console.log(TAG, `Is https image`);
    } else {
      console.error(TAG, `Invalid image string ${this.imageStr}`);
      this.imageStr = "";
    }
  }


  @Builder
  MenuBuilder() {
    Menu() {
      MenuItem({content: '复制图片',})
        .width(140)
        .height(50)
        .onClick(() => {
          this.result?.copyImage();
          this.showMenu = false;
        })
      MenuItem({content: '保存图片',})
        .width(140)
        .height(50)
        .onClick(() => {
          this.result?.saveImage();
          if(this.flag === 1) {
            Utils.emitEvent("image", 20230319)
            console.log('image');
          } else if(this.flag === 2) {
            console.log('onLineImage');
            Utils.emitEvent("onLineImage", 20230320)
          } else if(this.flag === 3) {
            console.log('canvas');
            Utils.emitEvent("canvas", 20230321)
          }
          this.showMenu = false;
        })
    }
    .width(150)
    .height(110)
  }


  build() {
    Column() {
      Row() {
        Button("web test").key('webSaveImageMenu').onClick((e: ClickEvent) => {
          console.info("key==>" +  this.stringObj.str)
          switch ( this.stringObj.str) {
            case "SaveImageMenuStatic01": {
              this.flag = 1;
              console.log('ppp' + 'SaveImageMenuStatic01');
              this.controller.loadUrl("resource://rawfile/LocalImage.html");
              break;
            }

            case "SaveImageMenuStatic02": {
              this.flag = 2;
              console.log('ppp2' + 'SaveImageMenuStatic01');
              this.controller.loadUrl("resource://rawfile/online.html");
              break;
            }

            case "SaveImageMenuStatic03": {
              this.flag = 3;
              console.log('ppp3' + 'SaveImageMenuStatic01');
              this.controller.loadUrl("resource://rawfile/canvas.html");
              break;
            }

          }
        })
      }
      Web({ src: $rawfile('LocalImage.html'), controller: this.controller }).key('WebContextMenuResultButton')
        .onContextMenuHide(() => {
          this.result?.closeContextMenu();
        })
        .onContextMenuShow((event) => {
          if (event) {
            this.result = event.result
            console.info(TAG + 'x coord = ' + event.param.x());
            console.info(TAG + 'link url = ' + event.param.getLinkUrl());
            this.linkUrl = event.param.getLinkUrl();
          }
          console.info(TAG, `x: ${this.offsetX}, y: ${this.offsetY}`);
          this.showMenu = true;
          this.offsetX = 0;
          this.offsetY = Math.max(this.uiContext!.px2vp(event?.param.y() ?? 0) - 0, 0);
          return true;
        })
        .bindMenu(this.showMenu, this.MenuBuilder, {
          enableArrow: false,
          placement: Placement.LeftTop,
          offset: {x: this.offsetX,y: this.offsetY},
          mask: false,
          onDisappear: () => {
            this.showMenu = false;
            this.result?.closeContextMenu();
          },
          showInSubWindow: false
        })
        .fileAccess(true)
        .javaScriptAccess(true)
        .domStorageAccess(true)
        .onPageEnd(() => {
          this.isPageEnd = 1
        })
    }
    .width('100%')
    .height('100%')
  }
}
