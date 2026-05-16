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
// xxx.ets
import { webview } from '@kit.ArkWeb';
import { pasteboard } from '@kit.BasicServicesKit';
import { waitForExist } from '../../test/WaitTest.test';
import Utils from '../../test/Utils';
import events_emitter from '@ohos.events.emitter';
interface PreviewBuilderParam {
  previewImage: Resource | string | undefined;
  width: number;
  height: number;
  url:Resource | string | undefined;
  progressValue:number;
  progressVisible:boolean;
}

const EVENT_ID_SET_SUITE_KEY = 177201;

@Entry
@Component
struct SelectionMenuLongPress {
  controller: webview.WebviewController = new webview.WebviewController();
  @Builder PreviewBuilder($$: PreviewBuilderParam){
    Column() {
      Stack(){
        Text('')
          .padding(5)
          .width('100%')
          .textAlign(TextAlign.Start)
          .backgroundColor(Color.White)
          .copyOption(CopyOptions.LocalDevice)
          .maxLines(1)
          .textOverflow({overflow:TextOverflow.Ellipsis})
        Progress({ value: this.progressValue, total: 100, type: ProgressType.Linear })
          .style({ strokeWidth: 3, enableSmoothEffect: true })
          .backgroundColor(Color.White)
          .opacity(this.progressVisible?1:0)
          .backgroundColor(Color.White)
      }.alignContent(Alignment.Bottom)
      Web({src:$$.url, controller:new webview.WebviewController()})
        .javaScriptAccess(true)
        .fileAccess(true)
        .onlineImageAccess(true)
        .imageAccess(true)
        .domStorageAccess(true)
        .onPageBegin(()=>{
          this.progressValue = 0;
          this.progressVisible = true;
        })
        .onProgressChange((event)=>{
          this.progressValue = event.newProgress;
        })
        .onPageEnd(()=>{
          this.progressVisible = false;
        })
    }.width($$.width).height($$.height)
  }




  private result: WebContextMenuResult | undefined = undefined;
  @State previewImage: Resource | string | undefined = undefined;
  @State previewWidth: number = 1;
  @State previewHeight: number = 1;
  @State previewWidthImage: number = 1;
  @State previewHeightImage: number = 1;
  @State enableWebHapticFeedback: boolean = true;
  // @State enableMenuHapticFeedback: boolean = true;
  @State menuHapticMode:HapticFeedbackMode = HapticFeedbackMode.DISABLED;
  @State scaleValue: number = 1;
  @State pinchValue: number = 1;
  @State offsetX:number = 0;
  @State offsetY:number = 0;
  @State positionX:number = 0;
  @State positionY:number = 0;
  @State linkURL:string = "www.baidu.com";
  @State progressValue:number = 0;
  @State progressVisible:boolean = true;
  @State isReceive: number = -1;
  @State str: string = 'WebElementType01'
  @State isPageEnd: number = -1;

  @Builder
  MenuBuilder() {
    Menu() {
      MenuItem({ content: '复制链接', })
        .onClick(() => {
          const pasteboardData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, this.linkURL);
          const systemPasteboard = pasteboard.getSystemPasteboard();
          systemPasteboard.setData(pasteboardData);
        })
      MenuItem({content:'打开链接'})
        .onClick(()=>{
          this.controller.loadUrl(this.linkURL);
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
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 1;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("web test").key('WebElementTypeButton').onClick(async () => {
          console.info("key==>" + this.str)
          await Utils.waitForExist(()=>this.isReceive, this.str+' isReceive', 1, 1000);
          await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
          switch (this.str) {
            case "WebElementType01": {
              let strJson = getInspectorByKey('WebElementTypeLink');
              let obj: ESObject = JSON.parse(strJson);
              console.info("[testScrollBar001] textResize:" + obj.$attrs.content);
              Utils.emitEvent(obj.$attrs.content, 177210)
              break;
            }

          }
        })
      }
      Text('WebElementType').id('WebElementTypeLink').fontSize(18)
      Web({ src: $rawfile("newbee.html"), controller: this.controller })
        .height('90%')
        .scale({x:this.scaleValue, y:this.scaleValue, z:1})
        .enableHapticFeedback(this.enableWebHapticFeedback)
        .translate({x:this.offsetX, y:this.offsetY, z:0})
        .javaScriptAccess(true)
        .fileAccess(true)
        .onlineImageAccess(true)
        .imageAccess(true)
        .domStorageAccess(true)
        .bindSelectionMenu(WebElementType.LINK, this.MenuBuilder, WebResponseType.LONG_PRESS,
          {
            onAppear: () => {},
            onDisappear: () => {
              this.result?.closeContextMenu();
            },
            preview: this.PreviewBuilder({
              previewImage: this.previewImage,
              width: this.previewWidth,
              height: this.previewHeight,
              url:this.linkURL,
              progressValue:this.progressValue,
              progressVisible:this.progressVisible
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
            this.previewWidthImage = px2vp(event.param.getPreviewWidth());
            this.previewHeightImage = px2vp(event.param.getPreviewHeight());
            this.previewWidth = 500;
            this.previewHeight = 500;
            if (event.param.getSourceUrl().indexOf("resource://rawfile/") == 0) {
              this.previewImage = $rawfile(event.param.getSourceUrl().substr(19));
            } else {
              this.previewImage = event.param.getSourceUrl();
            }
            if (event.param.getLinkUrl().indexOf("resource://rawfile/") == 0) {
              this.linkURL = event.param.getLinkUrl().substr(19);
            } else {
              this.linkURL = event.param.getLinkUrl();
            }
            let hitTestValue = this.controller.getLastHitTest();
            console.log('lzy hitTestValue extral', hitTestValue.extra);
            console.log('lzy hitTestValue', hitTestValue.type)
            console.log('lzy event getLinkUrl', event.param.getLinkUrl())
            console.log('lzy linkURL:', this.linkURL)
            console.log('lzy sourceURL', event.param.getSourceUrl())
            console.log('lzy previewWidth', event.param.getPreviewWidth())
            console.log('lzy previewHeight', event.param.getPreviewHeight())
            console.log('lzy x', event.param.x())
            console.log('lzy y', event.param.y())
            return true;
          }
          return false;
        })
        .onPageEnd((event) => {
          console.log('onPageEnd url:' + event.url);
          this.isPageEnd = 1;
        })
    }

  }
  onBackPress(): boolean | void {
    if (this.controller.accessStep(-1)) {
      this.controller.backward();
      return true;
    } else {
      return false;
    }
  }
}