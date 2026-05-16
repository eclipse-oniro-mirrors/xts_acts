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
import GlobalContext from './../../common/GlobalContext';
import { Value } from './../../common/Value';
import { MessageManager, Callback } from './../../common/MessageManager';

type MessageData = number

@Entry
@Component
struct GridColOffSetExample {
  @State bgColors: Color[] = [Color.Red, Color.Orange, Color.Yellow, Color.Green, Color.Pink, Color.Grey, Color.Blue, Color.Brown]
  @State currentBp: string = 'unknown'
  @State  gridColoffsetValue : number = -3;
  messageManager: MessageManager<MessageData> = new MessageManager()
  onPageShow() {
    console.info('GridColOffset onPageShow')
    let value: Value<MessageData> = {
      name: 'messageManager', message: this.messageManager
    }
    GlobalContext.getContext().setObject('value', value);
    let callback: Callback<MessageData> = message => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'gridColoffset') {
          this.gridColoffsetValue = message.value
      }
    }
    this.messageManager.registerCallback(callback)

  }
  build() {
    Column() {
      GridRow({
        columns: 5,
        gutter: { x: 5, y: 10 },
        breakpoints: { value: ["400vp", "600vp", "800vp"],
          reference: BreakpointsReference.WindowSize },
        direction: GridRowDirection.Row
      }) {
        ForEach(this.bgColors, (color: Color, index?: number) => {
          GridCol({ span: { xs: 1, sm: 2, md: 3, lg: 4 } }) {
            Row().width("100%").height("20vp")
          }.borderColor(color).borderWidth(2).gridColOffset(this.gridColoffsetValue).key('keykey'+index)
        })
      }.width("100%").height("100%")

      .onBreakpointChange((breakpoint) => {
        this.currentBp = breakpoint
      })
    }.width('80%').margin({ left: 10, top: 5, bottom: 5 }).height(200)
    .border({ color: '#880606', width: 2 })
  }
}