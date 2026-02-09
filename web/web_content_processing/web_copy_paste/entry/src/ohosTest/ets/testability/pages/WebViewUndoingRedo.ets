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

// xxx.ets
import { pasteboard } from '@kit.BasicServicesKit';
import { BusinessError,systemDateTime, deviceInfo } from '@kit.BasicServicesKit';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import router from '@ohos.router'
import events_emitter from '@ohos.events.emitter';
import webview from '@ohos.web.webview';
import Utils from '../../test/Utils.test';
import { waitForExist, waitForComponent } from '../../test/WaitTest.test';
import { Driver, ON, MouseButton } from '@ohos.UiTest';
const TAG = 'ContextMenu';

@Entry
@Component
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController();
  private result: WebContextMenuResult | undefined = undefined;
  @State linkUrl: string = '';
  @State offsetX: number = 0;
  @State offsetY: number = 0;
  @State showMenu: boolean = false;
  @State emitKey: string = '';
  @State isReceive: number = -1;
  @State str:string = '';
  @State isPageEnd: number = -1;
  aboutToAppear() {

  }

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 130700,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(130700);
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 0;
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
        content: '撤销',
      })
        .width(100)
        .height(50)
        .onClick(() => {
          this.result?.undo();
          this.showMenu = false;
        })
      MenuItem({
        content: '重做',
      })
        .width(100)
        .height(50)
        .onClick(() => {
          this.result?.redo();
          this.showMenu = false;
        })
      MenuItem({
        content: '粘贴纯文本本',
      })
        .width(100)
        .height(50)
        .onClick(() => {
          this.result?.pasteAndMatchStyle();
          this.showMenu = false;
        })
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
    .height(300)
  }
  build() {
    Column() {
      Row() {
        Button("web click")
          .key("webviewUndoingRedoButton")
          .onClick(async () => {
            console.info("key==>" + this.str)
            await waitForExist(()=>this.isReceive, this.str, 0);
            await waitForExist(()=>this.isPageEnd, this.str, 0);
            this.isReceive = -1;
            switch (this.str) {
              case "emitWebviewUndoingRedo": {
                try {
                  if(!canIUse('SystemCapability.UIDesign.HDSPattern.Standard')) {
                    console.log('pbbbnetment');
                    Utils.emitEvent(true, 130710)
                  } else {
                    console.log('pbbbnetment333');
                    let driver: Driver = Driver.create();
                    let webRect = Utils.getComponentRect('webviewundoingredokey');
                    let RedoButton = await waitForComponent("webviewundoingredokey", 10000);
                    await RedoButton.click();
                    await driver.triggerKey(2001);
                    let softKeyBoard = await driver.waitForComponent(ON.type('Canvas'),10000);
                    if (softKeyBoard != null) {
                      await driver.pressBack()
                    }
                    let downX = Math.round(globalThis.winLeft + webRect.left + (webRect.right - webRect.left) / 2);
                    let downY = Math.round(globalThis.winTop + webRect.top + (webRect.bottom - webRect.top) / 2);
                    await driver.mouseClick({ x: downX, y: downY }, MouseButton.MOUSE_BUTTON_RIGHT);
                    let buttonThree = await driver.waitForComponent(ON.text('撤销'),10000);
                    await buttonThree.click();
                    this.controller.runJavaScript("getEditText()", (error, result) => {
                      if (error) {
                        console.info(`emitScrollableTwo runJavaScript error: ` + JSON.stringify(error))
                        return;
                      } else {
                        Utils.emitEvent(true, 130710)
                      }
                    })
                  }
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
              case "emitWebviewUndoingRedo002": {
                try {
                  if(!canIUse('SystemCapability.UIDesign.HDSPattern.Standard')) {
                    console.log('pbbbnetment0000');
                    Utils.emitEvent(true, 130720)
                  } else {
                    console.log('pbbbnetment444');
                    this.controller.loadUrl("resource://rawfile/index.html");
                    await waitForExist(()=>this.isPageEnd, this.str, 0);
                    let driver: Driver = Driver.create();
                    let webRect = Utils.getComponentRect('webviewundoingredokey');
                    let RedoButton = await waitForComponent("webviewundoingredokey", 10000);
                    await RedoButton.click();
                    await driver.triggerKey(2001);
                    let softKeyBoard = await driver.waitForComponent(ON.type('Canvas'),10000);
                    if (softKeyBoard != null) {
                      await driver.pressBack()
                    }
                    let downX = Math.round(globalThis.winLeft + webRect.left + (webRect.right - webRect.left) / 2);
                    let downY = Math.round(globalThis.winTop + webRect.top + (webRect.bottom - webRect.top) / 2);
                    await driver.mouseClick({ x: downX, y: downY }, MouseButton.MOUSE_BUTTON_RIGHT);
                    let buttonThree = await driver.waitForComponent(ON.text('撤销'),10000);
                    await buttonThree.click();
                    await driver.mouseClick({ x: downX, y: downY }, MouseButton.MOUSE_BUTTON_RIGHT);
                    let buttonFour = await driver.waitForComponent(ON.text('重做'),10000);
                    await buttonFour.click();
                    this.controller.runJavaScript("getEditText()", (error, result) => {
                      if (error) {
                        console.info(`emitScrollableTwo runJavaScript error: ` + JSON.stringify(error))
                        return;
                      } else {
                        Utils.emitEvent(true, 130720)
                        console.log("emitScrollableTwo runJavaScript.result: "  + result);
                      }
                    })
                  }
                } catch (error) {
                  console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
                break;
              }
            }
          })

      }


      Web({ src: $rawfile("index.html"), controller: this.controller })
        .key('webviewundoingredokey')
        .javaScriptAccess(true)
          // 触发自定义弹窗
        .onContextMenuShow((event) => {
          if (event) {
            this.result = event.result
            console.info("x coord = " + event.param.x());
            console.info("link url = " + event.param.getLinkUrl());
            this.linkUrl = event.param.getLinkUrl();
          }
          console.info(TAG, `x: ${this.offsetX}, y: ${this.offsetY}`);
          this.showMenu = true;
          this.offsetX = 0;
          this.offsetY = 0;
          return true;
        })
        .bindPopup(this.showMenu,
          {
            builder: this.MenuBuilder(),
            enableArrow: false,
            placement: Placement.LeftTop,
            offset: { x: this.offsetX, y: this.offsetY },
            mask: false,
            onStateChange: (e) => {
              if (!e.isVisible) {
                this.showMenu = false;
                this.result!.closeContextMenu();
              }
            }
          })
        .onPageEnd((event) => {
          console.log('web pageEnd==>' + event.url);
          this.isPageEnd = 0;
        })
    }
  }
}

