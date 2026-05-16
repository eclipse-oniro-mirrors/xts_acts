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
import { Driver, ON } from '@ohos.UiTest';
import events_emitter from '@ohos.events.emitter';

const EVENT_ID_SET_EMIT_KEY = 202380;

@Entry
@Component
struct certChainData {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  @State str: string = "certChainData01";
  @State show:boolean = true;
  @State isReceive: number = -1;
  @State isShowAlert: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_EMIT_KEY,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_EMIT_KEY)
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
        Button("web Test").key('certChainDataWeb').onClick(async () => {
          await Utils.waitForExist(()=>this.isReceive, 'certChainDataWebIsReceive', 1, 1000);
          console.info("key==>" + this.str);
          this.isReceive = -1;
          switch (this.str) {

            case "certChainData01": {

              this.isShowAlert = -1;
              this.show = false
              await Utils.waitForExist(()=>this.isShowAlert, 'waitOtherWebShow', 1, 1000)
              let driver = Driver.create();
              const buttonComponent = await driver.waitForComponent(ON.text('确定'), 10000);
              await buttonComponent.click()
              break;
            }
          }
        }).margin(10)
 
      }
      if(this.show) {
        Web({ src: 'www.example.com', controller: this.controller })
      } else {
        Web({ src: 'https://expired.badssl.com', controller: this.controller })
          .onSslErrorEventReceive((event:OnSslErrorEventReceiveEvent) => {
            AlertDialog.show({
              title: 'onSslErrorEventReceive',
              message: 'text',
              primaryButton: {
                value: '确定',
                action: () => {
                  event.handler.handleConfirm();
                  console.log('333true'+event.certChainData+event.certChainData?.length)
                  if(event.certChainData) {
                    console.log('222true'+event.certChainData)
                    Utils.emitEvent(true, 202390)
                  }
                }
              },
              secondaryButton: {
                value: '取消',
                action: () => {
                  event.handler.handleCancel();
                }
              },
              cancel: () => {
                event.handler.handleCancel();
              }
            })
            this.isShowAlert = 1;
          })
      }

    }
  }
}