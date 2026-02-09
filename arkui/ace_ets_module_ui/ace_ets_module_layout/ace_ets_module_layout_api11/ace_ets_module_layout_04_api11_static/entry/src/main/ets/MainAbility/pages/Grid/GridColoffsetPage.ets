'use static';
/**
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
import { GlobalContext } from './../../common/GlobalContext';
import { ValueT } from './../../common/Value';
import { MessageManager, Callback, Message } from './../../common/MessageManager';
import { Entry, Component, Column, BreakpointsReference,Row, GridCol, GridColOptions, Color, GridRow,GridColColumnOption, GutterOption, BreakPoints, GridRowDirection, ForEach, Margin } from '@ohos.arkui.component'
import { State,AppStorage } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct GridColOffSetExample {
  @State bgColors: Color[] = [Color.Red, Color.Orange, Color.Yellow, Color.Green, Color.Pink, Color.Grey, Color.Blue, Color.Brown]
  @State currentBp: string = 'unknown'
  @State  gridColoffsetValue : int = -3;
  messageManager: MessageManager<int> = new MessageManager<int>()
  onPageShow() {
    console.info('GridColOffset onPageShow')
    AppStorage.setOrCreate<MessageManager<int>>("messageManager",  this.messageManager);
    let callback: Callback<int> = (message: Message<int>) => {
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
        gutter: { x: 5, y: 10 } as GutterOption,
        breakpoints: { value: ["400vp", "600vp", "800vp"],
          reference: BreakpointsReference.WindowSize } as BreakPoints,
        direction: GridRowDirection.Row
      }) {
        ForEach(this.bgColors, (color: Color, index?: number) => {
          GridCol({ span: { xs: 1, sm: 2, md: 3, lg: 4 } as GridColColumnOption} as GridColOptions) {
            Row().width("100%").height("20vp")
          }.borderColor(color).borderWidth(2).gridColOffset(this.gridColoffsetValue).key('keykey'+index)
        })
      }.width("100%").height("100%")

      .onBreakpointChange((breakpoint: string) => {
        this.currentBp = breakpoint
      })
    }.width('80%').margin({ left: 10, top: 5, bottom: 5 } as Margin).height(200)
    .border({ color: '#880606', width: 2 })
  }
}