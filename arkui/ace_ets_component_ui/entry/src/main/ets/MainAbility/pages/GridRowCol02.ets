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
import {MessageManager,Callback} from '../utils/MessageManager';

@Entry
@Component
struct GridRowCol02 {
  @State Number: String[] = ['0', '1', '2', '3', '4']
  scroller: Scroller = new Scroller()
  @State rowsTemplate: string = '1fr 1fr 1fr'
  messageManager:MessageManager = new MessageManager()
  @State layoutDirection: GridDirection = GridDirection.Row

  @State text: string = ''

  onPageShow() {
    console.info('navigationPosition  onPageShow');
    globalThis.value = {
      name:'messageManager',message:this.messageManager
    }
    let callback:Callback = (message:any) => {
      console.error('message = ' + message.name + "--" + message.value);
      if (message.name == 'rowsTemplate') {
        this.rowsTemplate = message.value;
      }
      if (message.name == 'layoutDirection') {
        this.layoutDirection = message.value;
      }

    }
    this.messageManager.registerCallback(callback);
  }

  build() {
    Column({ space: 5 }) {
      Grid() {
        ForEach(this.Number, (day: string ,index1:number|undefined) => {
          ForEach(this.Number, (day: string ,index2:number|undefined) => {
            GridItem() {
              Text('' + index1 + index2)
                .fontSize(16)
                .backgroundColor(0xF9CF93)
                .width('100%')
                .height('100%')
                .textAlign(TextAlign.Center)
            }
            .key('Item' + index1 + index2)
          }, (day: string) => day)
        }, (day: string) => day)
      }
      .rowsTemplate(this.rowsTemplate)
      .columnsTemplate('1fr 1fr 1fr')
      .columnsGap(10)
      .constraintSize({minWidth:10})
      .rowsGap(10)
      .width('90%')
      .key('GridRowCol02')
      .backgroundColor(0xFAEEE0)
      .height(300)
      .margin({ top: 10 })
      .padding({ top: 10 })

    }.width('100%').margin({ top: 5 }).key('Column02')
  }
}