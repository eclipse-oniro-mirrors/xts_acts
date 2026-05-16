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
import common from '@ohos.app.ability.common';
import { waitForExist} from '../../test/WaitTest.test';
import { Driver, ON } from '@kit.TestKit';

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

const EVENT_ID_SET_SUITE_KEY = 177501;
let driver = Driver.create();

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
  @State isPageEnd: number = -1;
  @State isOperateEnd: number = -1;

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


  build() {
    Column() {
      Row() {
        Button("web click")
        .key('WebHapticFeedbackButton')
        .onClick(async () => {
          console.info("key==>" + this.str)
          await Utils.waitForExist(()=>this.isReceive, this.str+' isReceive', 1, 1000);
          await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
          switch (this.str) {
            case "emitWebHapticFeedback001": {
              try {
                await Utils.waitForReleaseDriver(this.str+"0",driver)
                let buttonOne = await driver.findComponent(ON.id('menuDISABLED'));
                await buttonOne.click();
                await Utils.waitForReleaseDriver(this.str,driver)
                let buttonTwo = await driver.findComponent(ON.id('selectionMenuKey'));
                await buttonTwo.longClick();
                await Utils.waitForReleaseDriver(this.str,driver)
                this.userAgentPC = this.controller.getUserAgent();
                if (!(this.userAgentPC).includes("PC")) {
                  let buttonThree = await driver.findComponent(ON.text('复制'));
                  await buttonThree.click();
                  await Utils.waitForReleaseDriver(this.str,driver)
                  Utils.emitEvent('HapticFeedbackMode.DISABLED', 177510)
                } else {
                  Utils.emitEvent('HapticFeedbackMode.DISABLED', 177510)
                }

              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case "emitWebHapticFeedback002": {
              try {
                await Utils.waitForReleaseDriver(this.str+"0",driver)
                let buttonOne = await driver.findComponent(ON.id('menuENABLE'));
                await buttonOne.click();
                await Utils.waitForReleaseDriver(this.str, driver)
                let buttonTwo = await driver.findComponent(ON.id('selectionMenuKey'));
                await buttonTwo.longClick();
                await Utils.waitForReleaseDriver(this.str, driver)
                this.userAgentPC = this.controller.getUserAgent();
                if (!(this.userAgentPC).includes("PC")) {
                  let buttonThree = await driver.findComponent(ON.text('复制'));
                  await buttonThree.click();
                  await Utils.waitForReleaseDriver(this.str, driver)
                  Utils.emitEvent('HapticFeedbackMode.ENABLED', 177520)
                } else {
                  Utils.emitEvent('HapticFeedbackMode.ENABLED', 177520)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;

            }

            case "emitWebHapticFeedback003": {
              try {
                await Utils.waitForReleaseDriver(this.str, driver)
                let buttonOne = await driver.findComponent(ON.id('menuAUTO'));
                await buttonOne.click();
                await Utils.waitForReleaseDriver(this.str, driver)
                let buttonTwo = await driver.findComponent(ON.id('selectionMenuKey'));
                await buttonTwo.longClick();
                await Utils.waitForReleaseDriver(this.str, driver)
                this.userAgentPC = this.controller.getUserAgent();
                if (!(this.userAgentPC).includes("PC")) {
                  let buttonThree = await driver.findComponent(ON.text('复制'));
                  await buttonThree.click();
                  await Utils.waitForReleaseDriver(this.str+"3",driver)
                  Utils.emitEvent('HapticFeedbackMode.AUTO', 177530)
                } else {
                  Utils.emitEvent('HapticFeedbackMode.AUTO', 177530)
                }
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }
          }
        })
      }.height('5%')

      Row () {
        Text("MenuHapticFeedbackMode:"+this.menuHapticMode)
      }.height('10%')
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
      }.height('10%')

      Web({ src: $rawfile("selectionMenu.html"), controller: this.controller })
        .height('75%')
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
        .onPageEnd((event) => {
          console.log('onPageEnd url:' + event.url);
          this.isPageEnd = 1;
        })
    }
    .onTouch(()=>{
      console.log("Column on Touch");
    })
  }
}