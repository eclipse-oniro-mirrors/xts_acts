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
import { MessageManager, Callback } from '../../../common/MessageManager';

@Entry
@Component
struct OnlyColumnsTemplate3 {
  @State columnStart1:number = 1
  @State columnEnd1:number = 2
  @State columnStart2:number = 1
  @State columnEnd2:number = 2

  messageManager:MessageManager = new MessageManager();
  onPageShow() {
    console.info('OnlyColumnsTemplate3 page show called');
    globalThis.value = {
      name:'messageManager',message:this.messageManager
    }
    let callback:Callback = (message:any) => {
      console.log('message = ' + message.name + "--" + message.value);
      if (message.name == 'columnStart1') {
        this.columnStart1 = message.value;
      }else if (message.name == 'columnEnd1') {
        this.columnEnd1 = message.value;
      }
    }
    this.messageManager.registerCallback(callback);
  }
  build() {
    Column({ space: 5 }) {
      Grid() {
        GridItem(){
          Text('1')
            .fontSize(16)
            .backgroundColor(0xFFFFFF)
            .textAlign(TextAlign.Center)
            .width("100%")
            .height("100%")
        }
        .border({width:1})
        .borderColor(0x000000)
        .height(50)
        .columnStart(this.columnStart1)
        .columnEnd(this.columnEnd1)
        .key('OnlyColumnsTemplate3_GridItem_01')
        .rowStart(2)
        .rowEnd(3)
      }
      .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
      .columnsGap(10)
      .rowsGap(10)
      .width(300)
      .backgroundColor(0xFAEEE0)
      .height("100%")
      .key('OnlyColumnsTemplate3_Grid_1')
    }.width('100%')
  }
}
