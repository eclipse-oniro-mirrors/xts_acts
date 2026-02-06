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
  controller3: webview.WebviewController = new webview.WebviewController();
  controller4: webview.WebviewController = new webview.WebviewController();
  @State timeoutTime:number = 1000;
  @State isReceive: number = -1;
  @State str:string = 'emitWaitForAttached'
  @State flagOne:Boolean = false;
  @State flagTwo:Boolean = false;
  @State flagThree: Boolean = false;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 141311,
      priority: events_emitter.EventPriority.LOW
    };
    events_emitter.once(valueChangeEvent, this.valueChangeCallBack);
  }
  onPageHide(){
    events_emitter.off(141311)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    console.info('web page valueChangeCallBack');
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data?.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 0;
      }
    }
  }

  async aboutToAppear() {
    this.controller1.waitForAttached(this.timeoutTime).then((state: webview.ControllerAttachState)=>{
      if (state == webview.ControllerAttachState.UNATTACHED) {
        console.log('NEU controller1 is UNATTACHED.');
        this.flagOne = true;
      } else {
        console.log('NEU controller1 is ATTACHED');

      }
    })

    this.controller3.waitForAttached(this.timeoutTime).then((state: webview.ControllerAttachState)=>{
      if (state == webview.ControllerAttachState.UNATTACHED) {
        console.log('NEU controller3 is UNATTACHED.');
        this.flagTwo = true;
      } else {
        console.log('NEU controller3 is ATTACHED');
      }
    })


    this.controller4.waitForAttached(this.timeoutTime).then((state: webview.ControllerAttachState)=>{
      if (state == webview.ControllerAttachState.UNATTACHED) {
        this.flagThree = true;
        console.log('NEU controller4 is UNATTACHED.');
      } else {
        console.log('NEU controller4 is ATTACHED');
      }
    })

  }

  build() {
    Column() {
      Row() {
        Button('web click').key('webWaitForAttachedButton').onClick(async () => {
          console.info('key==>' + this.str);
          await waitForExist(()=>this.isReceive, this.str, 0);
          this.isReceive = -1;
          switch (this.str) {
            case 'emitWaitForAttached': {
              console.log('pbbmmmmmm' + this.flagOne);
              console.log('pbbeeeee' + this.flagTwo);
              console.log('pbbbbbbbbb' + this.flagThree);
              if(this.flagOne && this.flagTwo && this.flagThree) {
                Utils.emitEvent(true, 141320);
              }
              break;
            }

          }
        })
      }
      Row() {
        Button() {
          Text('waitForAttached测试页')
            .fontWeight(FontWeight.Bold).fontColor(Color.White).textAlign(TextAlign.Center)
        }
        .type(ButtonType.Capsule)
        .width('30%')
        .key('ceshi1')
        .height('80%')
        .backgroundColor('#0D9FFB')
        .onClick(() => {
          if (this.controller1.getAttachState() == webview.ControllerAttachState.ATTACHED) {
            console.log('NEU controller is attached');
            this.controller1.loadUrl('https://webkit.org/demos/sticky-notes/index.html')
          }
        })
      }.width('100%').height('5%').justifyContent(FlexAlign.SpaceAround)

      Web({ src: $rawfile('basic.html'), controller: this.controller2  }).height('30%')

    }
  }
}