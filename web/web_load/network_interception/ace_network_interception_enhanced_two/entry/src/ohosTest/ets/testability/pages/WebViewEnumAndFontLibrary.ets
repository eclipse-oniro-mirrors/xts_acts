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
import { Driver, ON } from '@ohos.UiTest';
import business_error, { BusinessError } from '@ohos.base';

class TestObj {
  constructor() {
  }

  test(): string {
    return "ArkUI Web Component"
  }

  toString(): void {
    console.log('Web Component toString')
  }
}

@Entry
@Component
struct WebViewEnumAndFontLibrary {
  @State listData: number[] = [0, 0, 0]

  @Builder
  MenuBuilder() {
    Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
      ForEach(this.listData, (index: number | undefined) => {
        Column() {
          Row() {
            Image($r("app.media.icon")).width(20).height(20).margin({ right: 5 })
            Text(`Menu${index}`).fontSize(20)
          }
          .width('100%')
          .height(30)
          .justifyContent(FlexAlign.Center)
          .align(Alignment.Center)
          .onClick((event) => {
            console.info(`imageClicked!` + event)
          })

          if (index != this.listData.length - 1) {
            Divider().height(10).width('80%').color('#ccc')
          }
        }.padding(5).height(40)
      })
    }.width(100)
  }

  controller: webView.WebviewController = new webView.WebviewController();
  testObj: TestObj = new TestObj()
  @State Permission: Boolean = false
  @State str: string = ""
  @State webResult: string = ''
  @State count: string = ""
  @State javaScriptAccess: boolean = true
  @State mode: MixedMode = MixedMode.Compatible
  @State mixedSwitch: boolean = false
  @State mixedAllSwitch: boolean = false
  @State model: WebDarkMode = WebDarkMode.Auto
  @State access: boolean = true
  @State menuX: Number = 0
  @State menuY: Number = 0
  @State LinkUrl: String = ''
  @State ImageContent: boolean = false
  @State MediaType: Number = 0
  @State SourceType: Number = 0
  @State InputFieldType: Number = 0
  @State isEditable: boolean = false
  @State EditStateFlags: Number = 0
  @State SourceUrl: String | null = null
  @State SelectionText: String = ""
  @State FileSelectorMode: Number = 0
  @State RenderExitReason: String = ''
  @State fontSize: number = 13
  @State minFontSize: number = 1
  @State webId: number = 0
  @State zoomCount: number = 100
  @State webResultText: string = ''
  @State outputStr: string = ''
  @State hasImageCbOnline: boolean = true;
  @State onContextMenuShowState: Boolean = false
  @State minLogicalFontSize: number = 13
  @State databaseAccess: boolean = true
  @State PermissionRequestState: boolean = false
  @State userAgentPC:string = "";
  WebResult: WebContextMenuResult = new WebContextMenuResult;

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
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("web click").key('buttonEnumAndFontLibrary').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {

            case "emitHasImage": {
              this.javaScriptAccess = true
              await Utils.sleep(4000);
              this.controller.loadUrl($rawfile('hasImageOne.html'))
              try {
                this.controller.hasImage((error, data) => {
                  if (error) {
                    console.info(`hasImageCbOnline error: ` + JSON.stringify(error))
                    return;
                  }
                  this.hasImageCbOnline = data;
                  console.info("hasImageCbOnline: " + data);
                });
              } catch (error) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              Utils.emitEvent(this.hasImageCbOnline, 1251);
              break;
            }
          }
        })
      }

      Row() {
        Image("media/icon.png")
          .width(110)
          .height(110)
          .border({ width: 1 })
          .overlay('jpg', { align: Alignment.Bottom, offset: { x: 0, y: 20 } })
          .key("images")
          .bindMenu(this.MenuBuilder)
          .onClick(async () => {
            let driver = Driver.create();
            let button = await driver.findComponent(ON.type('webCenter'));
            await button.longClick();
          })
      }

      Row() {
        Text(this.webResultText).fontSize(20)
      }

      Web({ src: $rawfile("indexJru.html"), controller: this.controller })
        .onControllerAttached(() => {
          try {
            let id = this.controller.getWebId();
            this.webId = id
          } catch (error) {
            let code = (error as BusinessError).code;
            let message = (error as BusinessError).message;
            console.error(`ErrorCode: ${code},  Message: ${message}`);
          }
        })
        .password(true)
        .tableData(true)
        .wideViewModeAccess(true)
        .overviewModeAccess(true)
        .textZoomAtio(this.zoomCount)
        .textZoomRatio(this.zoomCount)
        .defaultFontSize(this.fontSize)
        .key("webCenter")
        .mixedMode(this.mode)
        .darkMode(this.model)
        .minFontSize(this.minFontSize)
        .minLogicalFontSize(this.minLogicalFontSize)
        .forceDarkAccess(this.access)
        .javaScriptAccess(this.javaScriptAccess)
        .fileAccess(true)
        .imageAccess(true)
        .domStorageAccess(false)
        .onlineImageAccess(false)
        .databaseAccess(this.databaseAccess)
    }
  }
}
