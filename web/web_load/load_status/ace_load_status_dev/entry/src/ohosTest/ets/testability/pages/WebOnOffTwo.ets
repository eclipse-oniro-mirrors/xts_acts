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
import { webview } from '@kit.ArkWeb';
import { BusinessError } from '@kit.BasicServicesKit';
import Utils from '../../test/Utils';
import events_emitter from '@ohos.events.emitter';
import { waitForExist} from '../../test/WaitTest.test';

@Entry
@Component
struct WebComponent {
  controller1: webview.WebviewController = new webview.WebviewController();
  controller2: webview.WebviewController = new webview.WebviewController();
  @State flagOne:Boolean = false;
  @State flagTwo:Boolean = false;
  @State flagThree:Boolean = false;
  @State isReceive: number = -1;
  @State str:string = 'emitOnOffTwo'

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 141341,
      priority: events_emitter.EventPriority.LOW
    };
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack);
  }

  onPageHide(){
    events_emitter.off(141341)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info("web page valueChangeCallBack");
    if (eventData != null) {
      console.info("valueChangeCallBack:" + JSON.stringify(eventData));
      if (eventData.data?.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }

  aboutToAppear() {
    const handleControllerAttachStateChange = (state: webview.ControllerAttachState) => {
      if (state == webview.ControllerAttachState.UNATTACHED) {
        console.log('NEU Controller is unattached.');
      } else {
        console.log('NEU Controller is attached.===3');
        this.flagThree = true
      }
    };
    try {
      // 注册回调以接收controller绑定状态更改通知
      this.controller1.on('controllerAttachStateChange', (state: webview.ControllerAttachState)=>{
        if (state == webview.ControllerAttachState.UNATTACHED) {
          console.log('NEU Controller is unattached.');
        } else {
          console.log('NEU Controller is attached.===1');
          this.controller1.off('controllerAttachStateChange');
          this.flagOne = true
        }
      })
    } catch (error) {
      console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
    }

    try {
      // 注册回调以接收controller绑定状态更改通知
      this.controller1.on('controllerAttachStateChange', (state: webview.ControllerAttachState)=>{
        if (state == webview.ControllerAttachState.UNATTACHED) {
          console.log('NEU Controller is unattached.');
        } else {
          console.log('NEU Controller is attached.===2');
          this.flagTwo = true
        }
      })
    } catch (error) {
      console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
    }
    try {
      // 注册回调以接收controller绑定状态更改通知
      this.controller1.on('controllerAttachStateChange', handleControllerAttachStateChange);
    } catch (error) {
      console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
    }
  }


  build() {
    Column() {
      Row() {
        Button("web click").key('OnOffTwoButton').onClick(async () => {
          console.info("key==>" + this.str);
          await waitForExist(()=>this.isReceive, this.str, 0);
          this.isReceive = -1;
          switch (this.str) {
            case "emitOnOffTwo": {
              console.log('pbb999' + this.flagOne);
              console.log('pbbkkkkk' + this.flagTwo);
              console.log('pbbppppp' + this.flagThree);
              // await Utils.sleep(2000);
              if(this.flagOne && !this.flagTwo && !this.flagThree) {
                console.log('999999ppppppp')
                Utils.emitEvent(true, 141380);
              }
              break;
            }

          }
        })
      }
      Row() {
        Button() {
          Text('dataAccess\n测试页')
            .fontWeight(FontWeight.Bold).fontColor(Color.White).textAlign(TextAlign.Center)
        }
        .type(ButtonType.Capsule)
        .width('22%')
        .key('ceshi1')
        .height('80%')
        .backgroundColor('#0D9FFB')
        .onClick(() => {
          if (this.controller1.getAttachState() == webview.ControllerAttachState.ATTACHED) {
            console.log("NEU controller is attached");
            this.controller1.loadUrl('https://webkit.org/demos/sticky-notes/index.html')
          }
        })

      }.width('100%').height('5%').justifyContent(FlexAlign.SpaceAround)

      Web({ src: $rawfile('basic.html'), controller: this.controller1 })
    }
  }
}