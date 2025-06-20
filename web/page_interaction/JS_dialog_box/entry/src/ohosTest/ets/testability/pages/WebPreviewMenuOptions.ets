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
import prompt from '@system.prompt';
import Utils from '../../test/Utils';
import events_emitter from '@ohos.events.emitter';
import webView from '@ohos.web.webview';
import PermissionsUtils from '../../test/PermissionsUtils';
import { Driver, ON } from '@ohos.UiTest';
import common from '@ohos.app.ability.common';
import { waitForExist} from '../../test/WaitTest';

interface PreviewBuilderParam {
  previewImage: Resource | string | undefined;
  width: number;
  height: number;
}

@Builder function PreviewBuilderGlobal($$: PreviewBuilderParam) {
  Column() {
    Image($$.previewImage)
      .objectFit(ImageFit.Fill)
      .autoResize(true)
  }.width($$.width).height($$.height)
}

@Entry
@Component
struct WebComponent {
  controller: webView.WebviewController = new webView.WebviewController();
  private result: WebContextMenuResult | undefined = undefined;

  @State previewImage: Resource | string | undefined = undefined;
  @State previewWidth: number = 1;
  @State previewHeight: number = 1;
  @State menuHapticMode:HapticFeedbackMode = HapticFeedbackMode.DISABLED;
  @State scaleValue: number = 1;
  @State pinchValue: number = 1;
  @State offsetX:number = 0;
  @State offsetY:number = 0;
  @State positionX:number = 0;
  @State positionY:number = 0;
  @State str: string = ""
  @State userAgentPC:string = "";
  @State isReceive: number = -1;

  @Builder
  MenuBuilder() {
    Menu() {
      MenuItem({ content: '复制', })
        .onClick(() => {
          this.result?.copy();
          this.result?.closeContextMenu();
        })
      MenuItem({ content: '全选', })
        .onClick(() => {
          this.result?.selectAll();
          this.result?.closeContextMenu();
        })
    }
  }
  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(10)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }


  build() {
    Column() {
      Button("web click")
        .key('WebHapticFeedbackButton')
        .onClick(async () => {
          console.info("key==>" + this.str)
          await waitForExist(()=>this.isReceive, this.str, 0);
          switch (this.str) {
            case "emitWebHapticFeedback001": {
              try {
                let driver = Driver.create();
                let buttonOne = await driver.findComponent(ON.id('menuDISABLED'));
                await buttonOne.click();
                await Utils.sleep(2000);
                let buttonTwo = await driver.findComponent(ON.id('selectionMenuKey'));
                await buttonTwo.longClick();
                await Utils.sleep(1000);
                this.userAgentPC = this.controller.getUserAgent();
                if (!(this.userAgentPC).includes("PC")) {
                  let buttonThree = await driver.findComponent(ON.text('复制'));
                  await buttonThree.click();
                  await Utils.sleep(1000);
                  Utils.emitEvent('HapticFeedbackMode.DISABLED', 20250517)
                } else {
                  Utils.emitEvent('HapticFeedbackMode.DISABLED', 20250517)
                }

              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "emitWebHapticFeedback002": {
              try {
                let driver = Driver.create();
                let buttonOne = await driver.findComponent(ON.id('menuENABLE'));
                await buttonOne.click();
                await Utils.sleep(2000);
                let buttonTwo = await driver.findComponent(ON.id('selectionMenuKey'));
                await buttonTwo.longClick();
                await Utils.sleep(1000);
                this.userAgentPC = this.controller.getUserAgent();
                if (!(this.userAgentPC).includes("PC")) {
                  let buttonThree = await driver.findComponent(ON.text('复制'));
                  await buttonThree.click();
                  await Utils.sleep(1000);
                  Utils.emitEvent('HapticFeedbackMode.ENABLED', 20250518)
                } else {
                  Utils.emitEvent('HapticFeedbackMode.ENABLED', 20250518)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;

            }

            case "emitWebHapticFeedback003": {
              try {
                let driver = Driver.create();
                let buttonOne = await driver.findComponent(ON.id('menuAUTO'));
                await buttonOne.click();
                await Utils.sleep(2000);
                let buttonTwo = await driver.findComponent(ON.id('selectionMenuKey'));
                await buttonTwo.longClick();
                await Utils.sleep(1000);
                this.userAgentPC = this.controller.getUserAgent();
                if (!(this.userAgentPC).includes("PC")) {
                  let buttonThree = await driver.findComponent(ON.text('复制'));
                  await buttonThree.click();
                  await Utils.sleep(1000);
                  Utils.emitEvent('HapticFeedbackMode.AUTO', 20250519)
                } else {
                  Utils.emitEvent('HapticFeedbackMode.AUTO', 20250519)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
          }
        })

      Row () {
        Text("MenuHapticFeedbackMode:"+this.menuHapticMode)
      }
      Row () {
        Button('DISABLED')
          .margin({
            top: 5,
            right: 5,
          })
          .key('menuDISABLED')
          .onClick(() => {
            this.menuHapticMode = HapticFeedbackMode.DISABLED;
            prompt.showToast({
              message: "MenuHapticFeedback：" + this.menuHapticMode,
              duration: 1000
            })
            this.controller.refresh();
          })
        Button('ENABLE')
          .margin({
            top: 5,
            right: 5,
          })
          .key('menuENABLE')
          .onClick(() => {
            this.menuHapticMode = HapticFeedbackMode.ENABLED;
            prompt.showToast({
              message: "MenuHapticFeedback：" + this.menuHapticMode,
              duration: 1000
            })
            this.controller.refresh();
          })
        Button('AUTO')
          .margin({
            top: 5,
            right: 5,
          })
          .key('menuAUTO')
          .onClick(() => {
            this.menuHapticMode = HapticFeedbackMode.AUTO;
            prompt.showToast({
              message: "MenuHapticFeedback：" + this.menuHapticMode,
              duration: 1000
            })
            this.controller.refresh();
          })
      }

      Web({ src: $rawfile("selectionMenu.html"), controller: this.controller })
        .key('selectionMenuKey')
        .scale({x:this.scaleValue, y:this.scaleValue, z:1})
        .enableHapticFeedback(true)
        .translate({x:this.offsetX, y:this.offsetY, z:0})
        .bindSelectionMenu(WebElementType.IMAGE, this.MenuBuilder, WebResponseType.LONG_PRESS,
          {
            onAppear: () => {},
            onDisappear: () => {
              this.result?.closeContextMenu();
            },
            preview: PreviewBuilderGlobal({
              previewImage: this.previewImage,
              width: this.previewWidth,
              height: this.previewHeight
            }),
            menuType: MenuType.PREVIEW_MENU,
            previewMenuOptions : {
              hapticFeedbackMode : this.menuHapticMode
            }
          })
        .zoomAccess(true)
        .onContextMenuShow((event) => {
          if (event) {
            this.result = event.result;
            if (event.param.getLinkUrl()) {
              return false;
            }
            this.previewWidth = px2vp(event.param.getPreviewWidth());
            this.previewHeight = px2vp(event.param.getPreviewHeight());
            if (event.param.getSourceUrl().indexOf("resource://rawfile/") == 0) {
              this.previewImage = $rawfile(event.param.getSourceUrl().substr(19));
            } else {
              this.previewImage = event.param.getSourceUrl();
            }
            return true;
          }
          return false;
        })
        .gesture(
          PinchGesture({fingers:3})
            .onActionStart((event)=>{
              console.log("Pinch start");
            })
            .onActionUpdate((event)=>{
              if(event){
                this.scaleValue = this.pinchValue * event.scale;
                console.log("Pinch update scaleValue:" + this.scaleValue);
              }
            })
        )
        .gesture(
          PanGesture()
            .onActionUpdate((event)=>{
              console.log("Pan update")
              this.offsetX = this.positionX + event.offsetX;
              this.offsetY = this.positionY + event.offsetY;
            })
        )
        .onTouch(()=>{
          console.log("Web on Touch");
        })
    }
    .onTouch(()=>{
      console.log("Column on Touch");
    })
  }
}