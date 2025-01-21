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
struct ColumnsTemplateAndRowsTemplate1 {
  @State columnStart1:number = 0
  @State columnEnd1:number = 1
  @State rowStart1:number = 1
  @State rowEnd1:number = 1

  messageManager:MessageManager = new MessageManager();
  onPageShow() {
    console.info('ColumnsTemplateAndRowsTemplate1 page show called');
    globalThis.value = {
      name:'messageManager',message:this.messageManager
    }
    let callback:Callback = (message:any) => {
      console.log('message = ' + message.name + "--" + message.value);
      if (message.name == 'columnStart1') {
        this.columnStart1 = message.value;
      }else if (message.name == 'columnEnd1') {
        this.columnEnd1 = message.value;
      }else if (message.name == 'rowStart1') {
        this.rowStart1 = message.value;
      }else if (message.name == 'rowEnd1') {
        this.rowEnd1 = message.value;
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
        // .width("100%")
        // .height("100%")
        .columnStart(this.columnStart1)
        .columnEnd(this.columnEnd1)
        .rowStart(this.rowStart1)
        .rowEnd(this.rowEnd1)
        .key('ColumnsTemplateAndRowsTemplate1_GridItem_01')
      }
      .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
      .rowsTemplate('1fr 1fr 1fr 1fr 1fr')
      .width(300)
      .backgroundColor(0xFAEEE0)
      .height(300)
      .key('ColumnsTemplateAndRowsTemplate1_Grid_1')
    }.width('100%')
  }
}
