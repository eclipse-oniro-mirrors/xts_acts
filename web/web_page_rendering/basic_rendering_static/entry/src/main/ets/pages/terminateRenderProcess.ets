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
import {
  Entry,
  Text,
  TextAttribute,
  Column,
  Component,
  Button,
  ButtonAttribute,
  ClickEvent,
  Row,
  OnOverScrollEvent,
} from '@ohos.arkui.component'
import hilog from '@ohos.hilog';
import { Driver, ON } from '@ohos.UiTest';
import events_emitter from '@ohos.events.emitter';
import { Web } from '@ohos.arkui.component';
import { BusinessError, RecordData } from '@ohos.base';
import Utils from '../../src/test/Util.test.ets';
import web_webview from '@ohos.web.webview'
import { Callback } from '@ohos.base'
import { State } from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import { UIContext, Router } from '@ohos.arkui.UIContext'

@Entry
@Component
struct webviewTerminateRenderProcess {
  controller: web_webview.WebviewController = new web_webview.WebviewController(undefined);
  @State str: string = 'emitTerminateRenderProcess0100';
  @State userAgentPC: string = '';

  aboutToAppear() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }


  private valueChangeCallBack: Callback<events_emitter.EventData> = (eventData: events_emitter.EventData): void => {
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      const data = eventData.data as Record<string, RecordData>;
      if (data != null && data['ACTION'] != null) {
        let strValue: string = String(data['ACTION']);
        this.str = strValue;
        console.info('this.str has been updated to: ' + this.str);
      }
    }
  }

  build() {
    Column(undefined) {
      Row() {
        Button('web click2').key('TerminateRenderProcess').onClick((e: ClickEvent) => {
          console.log('key==>' + this.str)
          switch (this.str) {
            case 'emitTerminateRenderProcess0100': {
              try {
                  this.userAgentPC = this.controller.getUserAgent();
                  if ((this.userAgentPC).includes('PC')) {
                    Utils.emitEvent(true, 5300)
                    return;
                  } else if ((this.userAgentPC).includes('Tablet')) {
                    Utils.emitEvent(true, 5300)
                    return;
                  }
                  this.controller.loadUrl('www.baidu.com');
                let result = this.controller.terminateRenderProcess();
                hilog.info(0x0000, 'testTag', 'terminateRenderProcess result: ' + result);
                Utils.emitEvent(result, 5300)
              } catch (error: BusinessError) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }



            case 'emitTerminateRenderProcess0200': {
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes('PC')) {
                  Utils.emitEvent(true, 5304)
                  break;
                } else if ((this.userAgentPC).includes('Tablet')) {
                  Utils.emitEvent(true, 5304)
                  break;
                }
                this.controller.loadUrl('resource://rawfile/index.html')
                let result = this.controller.terminateRenderProcess();
                hilog.info(0x0000, 'testTag', 'terminateRenderProcess result: ' + result);
                Utils.emitEvent(result, 5304)
              } catch (error: BusinessError) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
              }
              break;
            }

            case 'emitTerminateRenderProcess0300': {
              try {
                this.userAgentPC = this.controller.getUserAgent();
                if ((this.userAgentPC).includes('PC')) {
                  Utils.emitEvent(true, 5306)
                  break;
                } else if ((this.userAgentPC).includes('Tablet')) {
                  Utils.emitEvent(true, 5306)
                  break;
                }
                this.controller.loadUrl('resource://rawfile/index.html')
                let result = this.controller.terminateRenderProcess();
                hilog.info(0x0000, 'testTag', 'terminateRenderProcess result: ' + result);
                this.controller.slideScroll(500, 500);
                Utils.emitEvent(true, 5306)
              } catch (error: BusinessError) {
                console.error(`ErrorCode: ${error.code},  Message: ${error.message}`);
                }
              break;
            }

            case 'emitonSwitchNextPage': {
              let uiContext: UIContext = this.getUIContext();
              let router: Router = uiContext.getRouter();
              router.pushUrl({ url: 'pages/webOnFirstContFour' })
              console.log('push URL success')
            }

          }
        })
      }

      Web({ src: 'resource://rawfile/index.html', controller: this.controller })
        .onOverScroll((event: OnOverScrollEvent): void => {
          hilog.info(0x0000, 'testTag', 'x = ' + event.xOffset)
          hilog.info(0x0000, 'testTag', 'y = ' + event.yOffset)
          Utils.emitEvent(false, 5306)
        })
    }
  }
}
