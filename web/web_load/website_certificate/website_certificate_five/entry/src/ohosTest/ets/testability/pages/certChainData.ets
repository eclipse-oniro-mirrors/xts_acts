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
import { Driver, ON, UiDirection, BY, UiDriver } from '@ohos.UiTest';
import events_emitter from '@ohos.events.emitter';

@Entry
@Component
struct certChainData {
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  @State str: string = "certChainData01";
  @State show:boolean = true;
  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 10,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      if (eventData.data?.ACTION != null) {
        this.str = eventData.data?.ACTION;
      }
    }
  }
  build() {
    Column() {

      Row() {
        Button("web Test").key('certChainDataWeb').onClick(async () => {
          console.info("key==>" + this.str)
          switch (this.str) {

            case "certChainData01": {
              let driver = Driver.create();
              await Utils.sleep(2000);
              let button = await driver.findComponent(ON.id('toggleButton'));
              await button.click()
              await Utils.sleep(2000);
              let buttonOne = await driver.findComponent(ON.text('确定'));
              await buttonOne.click()
              await Utils.sleep(2000);
              break;
            }


          }
        }).margin(10)
        Button('切换Web').onClick(() => {
          this.show = false
        }).key('toggleButton')
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
                    Utils.emitEvent(true, 202412099)
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
          })
      }

    }
  }
}