/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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

import router from '@ohos.router';
import web_webview from '@ohos.web.webview';
import prompt from '@system.prompt';
import Utils from '../../test/Utils';
import { waitForExist } from '../../test/WaitTest.test';
import events_emitter from '@ohos.events.emitter';
import { Driver, ON } from '@ohos.UiTest';
const EVENT_ID_SET_SUITE_KEY = 133850;

@Extend(Button)
function bu() {
  .width('25%')
  .type(ButtonType.Capsule)
  .backgroundColor(Color.Orange)
  .fontSize(8)
}


const phoneUserAgent: string = "Mozilla/5.0 (Linux;Android 9; VRD-AL10; HMSCore 6.3.0.331) AppleWebKit/537.36 (KHTML, like Gecko) CHrome/92.0.4515.105 HuaweuBrowser/12.0.4.1 Mobile Safari/537.36";
const pcUserAgent: string = "Mozilla/5.0 (Window NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) CHrome/105.0.0.0 Safari/537.36 Edg/105.0.1343.27";

@CustomDialog
export struct NewWebViewComp {
  dialogController: CustomDialogController;
  url?: string;
  @State text: string = '日志在这里显示'
  @State multitAccess: boolean = true;
  @State fileAccess: boolean = true;
  @State onlineImageAccess: boolean = true;
  @State domStorageAccess: boolean = true;
  @State imageAccess: boolean = true;
  @State zoomAccess: boolean = true;
  @State geolocationAccess: boolean = true;
  @State allowWindow: boolean = true;
  private controller: web_webview.WebviewController = new web_webview.WebviewController();
  private dialog: ESObject;

  build() {
    Column() {
      Row({ space: 5 }) {
        Web({ src: $rawfile('indexTwo.html'), controller: this.controller })
          .fileAccess(this.fileAccess)
          .onlineImageAccess(this.onlineImageAccess)
          .domStorageAccess(this.domStorageAccess)
          .imageAccess(this.imageAccess)
          .zoomAccess(this.zoomAccess)
          .geolocationAccess(this.geolocationAccess)
          .javaScriptAccess(true)
          .databaseAccess(true)
          .backgroundColor(Color.Orange)
          .onWindowExit(() => {
            this.dialogController.close();
          })
      }
    }
  }
}

@Entry
@Component
struct OnWindowNew {
  @State gameLeft: string = "console.info('webgame gameLeft'); _main.paddle.moveLeft();";
  @State gameRight: string = "console.info('webgame gameRight'); _main.paddle.moveRight();";
  @State gameStart: string = "console.info('webgame gameStart'); _main.game.start = _main.game.start_RUNNING; _main.ball.fired = true";
  @State gameReset: string = "console.info('webgame gameReset'); if (_main.game.start === _main.game.start_GAMEOVER) { _main.game.start = _main.game.start_START; _main.start()}";
  @State removeDesc: string = "console.info('webgame removeDesc'); y=document.getElementsBytagName('div')[0]; y.parentNode.removeChild(y)";
  @State setJavaScriptOpenWindowFlagInZoom: boolean = true;
  @State setMultiWindowFlag: boolean = true;
  @State multitAccess: boolean = true;
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  dialogController: CustomDialogController | null = null;
  popController: web_webview.WebviewController | null = null;
  @State allowWindow: boolean = true;
  @State str: string = "";
  @State isPageEnd: number = -1;
  @State isReceive: number = -1;


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
      if (eventData.data?.ACTION != null) {
        this.str = eventData.data?.ACTION;
        this.isReceive = 1;
      }
    }
  }


  build() {
    Column() {
      Row() {
        Button("web click").key('WebOnWindowNewButton').onClick(async () => {
          await waitForExist(() => this.isPageEnd, this.str, 0);
          console.info("key==>" + this.str)
          switch (this.str) {
            case "emitOnWindowNew": {
              this.isPageEnd = -1;
              let driver: Driver = Driver.create();
              this.controller.loadUrl($rawfile("indexTwo.html"));
              await waitForExist(() => this.isPageEnd, this.str, 0);
              this.controller.runJavaScript('clickA()');
              break;
            }

            default:
              console.info("can not match case");
          }
        })
      }

      Web({ src: $rawfile('indexTwo.html'), controller: this.controller })
        .javaScriptAccess(true)
        .backgroundColor(Color.Orange)
        .userAgent(pcUserAgent)
        .domStorageAccess(true)
        .fileAccess(true)
        .onlineImageAccess(true)
        .imageAccess(true)
        .overviewModeAccess(true)
        .zoomAccess(true)
        .databaseAccess(true)
        .multiWindowAccess(true)
        .allowWindowOpenMethod(true)
        .onWindowNew((event) => {
          console.info('zfh window ts onWindowNew isAlert: ' + event.isAlert + ', isUserTrigger: ' + event.isUserTrigger + ', targetUrl: ' + event.targetUrl);
          if (this.dialogController != null) {
            console.info('zfh window this.dialogController != null');
            this.dialogController.close();
          }
          let targetUrlNew: string = event.targetUrl;

          this.popController = new web_webview.WebviewController();
          console.info('zfh window onWindowNew start');
          this.dialogController = new CustomDialogController({
            builder: NewWebViewComp({ url: targetUrlNew, controller: this.popController }),
            autoCancel: false,
            customStyle: true
          });
          console.info('zfh window onWindowNew start2');
          this.dialogController.open();

          event.handler.setWebController(this.popController);
          console.info('zfh window onWindowNew start3');
          console.info('zfh window ts onWindowNew isAlert: ' + event.isAlert + ', isUserTrigger: ' + event.isUserTrigger + ', targetUrl: ' + event.targetUrl);
          console.log('pbb22'+'isAlert'+event.isAlert+'isUserTrigger'+event.isUserTrigger+'targetUrl'+event.targetUrl)
          Utils.emitEvent('isAlert'+event.isAlert+'isUserTrigger'+event.isUserTrigger+'targetUrl'+event.targetUrl, 20251126);
        })
        .onWindowExit(() => {
          console.info('closewindow');
          this.dialogController!.close();
        })
        .onPageEnd((event) => {
          console.log('web pageEnd==>' + event.url);
          this.isPageEnd = 0;
        })
    }
  }
}