/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { MessageManager, Callback, Message } from '../../../common/MessageManager_T';

@Entry
@Component
struct SideBarContainerType_DefaultValue3 {
  @State arr: number[] = [1, 2, 3];
  @State current: number = 1;
  @State sideBarWidth: number = 150;
  @State maxSideBarWidth: number = 300;
  @State width1: number = 700;
  messageManager: MessageManager<number> = new MessageManager();

  onPageShow() {
    console.info('SideBarContainerType_DefaultValue3 page show called');
    globalThis.value = {
      name: 'messageManager', message: this.messageManager
    };
    let callback: Callback<number> = (message: Message<number>) => {
      console.log('message = ' + message.name + "--" + message.value);
      if (message.name == 'sideBarWidth') {
        this.sideBarWidth = message.value;
      } else if (message.name == 'maxSideBarWidth') {
        this.maxSideBarWidth = message.value;
      } else if (message.name == 'width1') {
        this.width1 = message.value;
      }
    };
    this.messageManager.registerCallback(callback);
  }

  build() {
    SideBarContainer(SideBarContainerType.AUTO) {
      Column() {
        ForEach(this.arr, (item: number) => {
          Column({ space: 5 }) {
            Text("Index0" + item)
              .fontSize(25)
              .fontColor(this.current === item ? '#0A59F7' : '#999')
              .fontFamily('source-sans-pro,cursive,sans-serif')
          }
          .onClick(() => {
            this.current = item
          })
        }, (item: string) => item)
      }.key("SideBarContainerType_DefaultValue3_SideBar_01")
      .justifyContent(FlexAlign.SpaceEvenly)
      .backgroundColor('#19000000')

      Column() {
        Text('SideBarContainer content text1').fontSize(25)
        Text('SideBarContainer content text2').fontSize(25)
      }
      .key("SideBarContainerType_DefaultValue3_sideBarContent_01")
    }
    .sideBarWidth(this.sideBarWidth)
    .maxSideBarWidth(this.maxSideBarWidth)
    .width(this.width1)
    .divider({ strokeWidth: '1vp', color: Color.Gray, startMargin: '4vp', endMargin: '4vp' })

    .key("SideBarContainerType_DefaultValue3_SideBarContainer_01")
    .onChange((value: boolean) => {
      console.info('status:' + value)
    })
  }
}
