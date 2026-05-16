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
const EVENT_ID_SET_SUITE_KEY = 177008;
const TAG = 'WebContextMenuResult ';
const driver = Driver.create();

  @Entry
  @Component
  struct BindMenuTest {
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

  async savePhoto(srcFilePath: string, fileNameExtension: string) {
    let srcFile: fileIo.File | undefined = undefined;
    let desFile: fileIo.File | undefined = undefined;
    let context = this.getUIContext().getHostContext() as Context;
    try {
      // 1、基于弹窗授权的方式获取媒体库的目标uri
      let srcFileUri = fileUri.getUriFromPath(srcFilePath);
      let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(context);
      let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [
        {
          fileNameExtension: fileNameExtension,
          photoType: photoAccessHelper.PhotoType.IMAGE,
        },
      ];
      let desFileUris: Array<string> = await phAccessHelper.showAssetsCreationDialog(
        [ srcFileUri, ], photoCreationConfigs);

      // 2、将来源于应用沙箱的照片内容写入媒体库的目标uri
      desFile = await fileIo.open(desFileUris[0], fileIo.OpenMode.WRITE_ONLY);
      srcFile = await fileIo.open(srcFileUri, fileIo.OpenMode.READ_ONLY);
      await fileIo.copyFile(srcFile.fd, desFile.fd);
      this.getUIContext().getPromptAction().showToast({ message: '已保存至相册！' });
    } catch (err) {
      console.error(TAG, `Failed to save photo: ${JSON.stringify(err)}`);
    } finally {
      if (srcFile) {
        fileIo.closeSync(srcFile);
        srcFile = undefined;
      }
      if (desFile) {
        fileIo.closeSync(desFile);
        desFile = undefined;
      }
    }
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
          if(this.flag == 1) {
            Utils.emitEvent("image", 20230319)
            console.log('image');
          } else if(this.flag == 2) {
            console.log('onLineImage');
            Utils.emitEvent("onLineImage", 20230320)
          } else if(this.flag == 3) {
            console.log('canvas');
            Utils.emitEvent("canvas", 20230321)
          }
          this.showMenu = false;
        })
    }
    .width(150)
    .height(110)
  }

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
            Button("web test").key('webSaveImageMenu').onClick(async () => {
              console.info("key==>" + this.str)
              await Utils.waitForExist(()=>this.isReceive, this.str+' isReceive', 1, 1000);
              await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
              switch (this.str) {
                case "SaveImageMenu01": {
                  this.flag = 1;
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/LocalImage.html");
                  await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                  let webRect = Utils.getComponentRect('WebContextMenuResult');
                  let downX = Math.round(globalThis.winLeft + webRect.left + (webRect.right - webRect.left) / 2);
                  let downY = Math.round(globalThis.winTop + webRect.top + (webRect.bottom - webRect.top) / 2);
                  await driver.mouseClick({ x: downX, y: downY }, MouseButton.MOUSE_BUTTON_RIGHT);
                  Utils.sleep(1000);
                  let buttonOne = await driver.findComponent(ON.text('保存图片'));
                  await buttonOne.click();
                  break;
                }

                case "SaveImageMenu02": {
                  this.flag = 2;
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/online.html");
                  await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                  let webRect = Utils.getComponentRect('WebContextMenuResult');
                  let downX = Math.round(globalThis.winLeft + webRect.left + (webRect.right - webRect.left) / 2);
                  let downY = Math.round(globalThis.winTop + webRect.top + (webRect.bottom - webRect.top) / 2);
                  await driver.mouseClick({ x: downX, y: downY }, MouseButton.MOUSE_BUTTON_RIGHT);
                  Utils.sleep(1000);
                  let buttonOne = await driver.findComponent(ON.text('保存图片'));
                  await buttonOne.click();
                  break;
                }

                case "SaveImageMenu03": {
                  this.flag = 3;
                  this.isPageEnd = -1;
                  this.controller.loadUrl("resource://rawfile/canvas.html");
                  await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                  let webRect = Utils.getComponentRect('WebContextMenuResult');
                  let downX = Math.round(globalThis.winLeft + webRect.left + (webRect.right - webRect.left) / 2);
                  let downY = Math.round(globalThis.winTop + webRect.top + (webRect.bottom - webRect.top) / 2);
                  await driver.mouseClick({ x: downX, y: downY }, MouseButton.MOUSE_BUTTON_RIGHT);
                  Utils.sleep(1000);
                  let buttonOne = await driver.findComponent(ON.text('保存图片'));
                  await buttonOne.click();
                  Utils.sleep(3000);
                  break;
                }

              }
            })
          }
          Web({ src: $rawfile('canvas.html'), controller: this.controller }).key('WebContextMenuResult')
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
            .bindMenu(this.showMenu, this.MenuBuilder(), {
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
            .onDownloadStart(async (event)=>{
              //获取uri并拉起picker另存图片
              if (event) {
                console.info(TAG, 'url:' + event.url);
                console.info(TAG, 'userAgent:' + event.userAgent);
                console.info(TAG, 'contentDisposition:' + event.contentDisposition);
                console.info(TAG, 'contentLength:' + event.contentLength);
                console.info(TAG, 'mimetype:' + event.mimetype);
                this.imageStr = event.url;
                await this.saveImage();
              }
            })
            .onPageEnd(() => {
              this.isPageEnd = 1
            })
        }
        .width('100%')
        .height('100%')
      }
}