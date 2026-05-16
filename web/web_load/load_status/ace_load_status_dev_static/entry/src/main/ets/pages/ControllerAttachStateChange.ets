/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed
 under Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { Entry, Component, Column, Row, Button, ClickEvent, Web,  $rawfile } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import Utils from '../../src/test/Util.test';
import webview from '@ohos.web.webview';
import emitter from '@ohos.events.emitter';
import events_emitter from '@ohos.events.emitter';
import { BusinessError, Callback, RecordData } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext'
import { canIUse } from '@internal.full.global'
import { NodeController, NodeRenderType, BuilderNode } from '@ohos.arkui.node';
export class StringFields {
  public str: string = '';
}

const EVENT_ID_SET_SUITE_KEY = 141400;

@Entry
@Component
struct OnControllerAttachStateChangeError {
  stringObj: StringFields  = new StringFields ();
  controller: webview.WebviewController = new webview.WebviewController(undefined);
  @State str: string = "";
  @State isPageEnd: number = -1;
  @State attach:boolean = false;
  @State offAttachOne:boolean = false;
  @State offAttachAll:boolean = false;


  // 构建回调函数。
  handleControllerAttachStateChange: Callback<webview.ControllerAttachState> = (state: webview.ControllerAttachState): void => {
    if (state == webview.ControllerAttachState.UNATTACHED) {
      console.info('handleControllerAttachStateChange: Controller is unattached.');
    } else {
      console.info('handleControllerAttachStateChange: Controller is attached.');
    }
  };

  aboutToAppear() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)

    try {
      this.controller.onControllerAttachStateChange(this.handleControllerAttachStateChange);
    } catch (error) {
      console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
    }
    try {
      // 注册回调以接收controller绑定状态更改通知。
      this.controller.onControllerAttachStateChange((state: webview.ControllerAttachState) => {
        if (state == webview.ControllerAttachState.UNATTACHED) {
          console.info('Controller is unattached.');
        } else {
          console.info('Controller is attached.');
          this.attach = true;
        }
      })
    } catch (error) {
      console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
    }
  }
  aboutToDisappear() {
    // 取消所有注册回调。
    this.controller.offControllerAttachStateChange(this.handleControllerAttachStateChange);
    console.info('Controller is offattached.');
  }

  private valueChangeCallBack: Callback<events_emitter.EventData> = (eventData: events_emitter.EventData): void => {
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      const data = eventData.data as Record<string, RecordData>;
      if (data != null && data['ACTION'] != null) {
        let strValue: string = String(data['ACTION']);
        this.stringObj.str = strValue;
        console.info(this.stringObj.str)
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button('web click').key('onControllerAttachStateChangeErrorButton').onClick((e:ClickEvent) => {
          console.info("key==>" + this.stringObj.str);
          switch (this.stringObj.str) {
            case "testOnControllerAttachStateChange": {
              Utils.emitEvent(this.attach, 141401);
              break;
            }
            case "testOffControllerAttachStateChangeOne": {
              try {
                this.controller.offControllerAttachStateChange(this.handleControllerAttachStateChange);
                this.offAttachOne = true
              }catch(error)
              {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              Utils.emitEvent(this.offAttachOne, 141402);
              break;
            }
            case "testOffControllerAttachStateChangeAll": {
              try {
                this.controller.offControllerAttachStateChange();
                this.offAttachAll= true
              }catch(error)
              {
                console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
              }
              Utils.emitEvent(this.offAttachAll, 141403);
              break;
            }
            case 'SwitchNextPageStatic' : {
              let uiContext: UIContext = this.getUIContext();
              let router: Router = uiContext.getRouter();
              router.pushUrl({ url: 'pages/OnActivateContent' })
              console.log('push URL success')
              break;
            }
          }
        })
      }

      Web({ src: "www.example.com", controller: this.controller })
        .id('webcomponent')
        .onPageEnd(() => {
          this.isPageEnd = 0;
        })
        .width("100%")
        .height("50%")
    }
  }
}
