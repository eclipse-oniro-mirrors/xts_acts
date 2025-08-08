/**
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
import web_webview from '@ohos.web.webview';
import Utils from '../../test/UtilsTwo';
import { BusinessError } from '@ohos.base';
import { Driver, ON } from '@ohos.UiTest';
import events_emitter from '@ohos.events.emitter';

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
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  controller1: web_webview.WebviewController = new web_webview.WebviewController();

  private result: WebContextMenuResult | undefined = undefined;
  @State previewImage: Resource | string | undefined = undefined;
  @State previewWidth: number = 0;
  @State previewHeight: number = 0;
  @State str: string = "bindSelectionMenuType01";
  @State userAgentPC:string = "";

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

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page bindSelectionMenuType01");
    if (eventData != null) {
      console.info("bindSelectionMenuType01:" + JSON.stringify(eventData));
      if (eventData.data?.ACTION != null) {
        this.str = eventData.data?.ACTION;
      }
    }
  }
  build() {
    Column() {

      Row() {
        Button("web test").key('webcomponentSelectionMenu').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {


            case "bindSelectionMenuType01": {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(true, 8301)
                  break;
                }
                let driver = Driver.create();
                let button = await driver.findComponent(ON.id('bindSelectionMenuType'));
                await button.longClick();
                await Utils.sleep(2000);
                let buttonOne = await driver.findComponent(ON.text('复制'));
                await buttonOne.click()
                await Utils.sleep(1000);
                break;

            }

            case "bindSelectionMenuType02": {
                await Utils.sleep(1000);
                Utils.emitEvent(MenuType.PREVIEW_MENU, 8302)
                break;
            }


          }
        })
      }



      Web({ src: $rawfile("bindSelectionMenu.html"), controller: this.controller }).key('bindSelectionMenuType')
        .height(150).width(150).border({ width: 2, color: Color.Red })
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
            menuType: MenuType.PREVIEW_MENU
          })
        .onContextMenuShow((event:OnContextMenuShowEvent) => {
          if (event) {
            this.result = event.result;
            if (event?.param.getLinkUrl()) {
              return false;
            }

              this.previewWidth = px2vp(event?.param?.getPreviewWidth());
              this.previewHeight = px2vp(event?.param.getPreviewHeight());
            Utils.emitEvent(this.previewWidth > 0 && this.previewHeight > 0, 8301)
            if (event.param.getSourceUrl().indexOf("resource://rawfile/") == 0) {
              this.previewImage = $rawfile(event?.param.getSourceUrl().substr(19));
            } else {
              this.previewImage = event?.param.getSourceUrl();
            }
            return true;
          }
          return false;
        }).margin(80)

    }
  }
}