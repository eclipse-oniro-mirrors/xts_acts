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
import Utils from '../../test/Utils';
import { BusinessError } from '@ohos.base';
import events_emitter from '@ohos.events.emitter';
import { Driver, MouseButton, UiWindow, ON, On } from '@kit.TestKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

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

const EVENT_ID_SET_SUITE_KEY = 177001;
const DOMAIN = 0x0000;
let driver: Driver = Driver.create();

@Entry
@Component
struct WebComponent {
  controller: web_webview.WebviewController = new web_webview.WebviewController();

  private result: WebContextMenuResult | undefined = undefined;
  @State previewImage: Resource | string | undefined = undefined;
  @State previewWidth: number = 0;
  @State previewHeight: number = 0;
  @State str: string = "bindSelectionMenuType01";
  @State userAgentPC:string = "";
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;
  @State isOnContextMenuShow: number = -1;

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

  @Builder
  TextMenuBuilder() {
    Menu() {
      MenuItem({ content: '复制', })
        .onClick(() => {
          this.result?.copy();
          Utils.emitEvent(true, 20250919)
        })
      MenuItem({ content: '复制图片', })
        .onClick(() => {
          this.result?.copyImage();
          // this.result?.closeContextMenu();
        })
      MenuItem({ content: '全选', })
        .onClick(() => {
          this.result?.selectAll();
          // this.result?.closeContextMenu();
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
    Column() {

      Row() {
        Button("web test").key('webcomponentSelectionMenu').onClick(async () => {
          console.info("key==>" + this.str)
          await Utils.waitForExist(()=>this.isReceive, this.str+' isReceive', 1, 1000);
          await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
          switch (this.str) {
            case "bindSelectionMenuType01": {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes("PC")) {
                  Utils.emitEvent(true, 177010)
                  break;
                }
                await Utils.waitForReleaseDriver(this.str, driver)
                this.isOnContextMenuShow = -1;
                let button = await driver.findComponent(ON.id('bindSelectionMenuType'));
                await button.longClick();
                await Utils.waitForExist(()=>this.isOnContextMenuShow, this.str+' isOnContextMenuShow', 1, 1000);
                try{
                  let buttonOne = await driver.findComponent(ON.text('复制'));
                  await buttonOne.click()
                }catch (err){
                  this.result?.closeContextMenu();
                }
                break;
            }
            case "bindSelectionMenuType02": {
                this.isPageEnd = -1;
                this.controller.refresh()
                await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
                Utils.emitEvent(MenuType.PREVIEW_MENU, 177020)
                break;
            }
          case "bindSelectionMenuType03": {
            this.isPageEnd = -1;
            await Utils.waitForExist(()=>this.isPageEnd, this.str+'TextMenuBuilder', 1, 1000);
            let buttonOne = await driver.findComponent(ON.text('这是一段文字'));
            let point = await buttonOne.getBoundsCenter();
            await driver.mouseClick(point, MouseButton.MOUSE_BUTTON_RIGHT);
            await Utils.sleep(2000);
            let buttonTwo = await driver.findComponent(ON.text('复制'));
            await buttonTwo.click()
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
            Utils.emitEvent(this.previewWidth > 0 && this.previewHeight > 0, 177010)
            if (event.param.getSourceUrl().indexOf("resource://rawfile/") == 0) {
              this.previewImage = $rawfile(event?.param.getSourceUrl().substr(19));
            } else {
              this.previewImage = event?.param.getSourceUrl();
            }
            this.isOnContextMenuShow = 1
            return true;
          }
          return false;
        }).margin(80)
        .onPageEnd((event) => {
          console.log('onPageEnd url:' + event.url);
          this.isPageEnd = 1;
        })
        .bindSelectionMenu(WebElementType.TEXT, this.TextMenuBuilder, WebResponseType.RIGHT_CLICK,
          {
            onAppear: () => {
              hilog.info(DOMAIN, 'testTag', '%{public}s', 'xj_test TEXT RIGHT_CLICK onAppear');
            },
            onDisappear: () => {
              hilog.info(DOMAIN, 'testTag', '%{public}s', 'xj_test TEXT RIGHT_CLICK onDisappear');
            },
            onMenuShow: () => {
              hilog.info(DOMAIN, 'testTag', '%{public}s', 'xj_test TEXT RIGHT_CLICK onMenuShow');
            },
            onMenuHide: () => {
              hilog.info(DOMAIN, 'testTag', '%{public}s', 'xj_test TEXT RIGHT_CLICK onMenuHide');
            }
          })
        .onContextMenuHide(() => {
          hilog.info(DOMAIN, 'testTag', '%{public}s', 'xj_test app onContextMenuHide ');
          this.result = undefined;
        })
    }
  }
}