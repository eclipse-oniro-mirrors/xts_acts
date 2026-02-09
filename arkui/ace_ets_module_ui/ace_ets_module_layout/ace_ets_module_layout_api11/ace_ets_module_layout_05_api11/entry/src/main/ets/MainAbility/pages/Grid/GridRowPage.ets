/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

type MessageData = string | number | GutterOption | BreakPoints | GridRowDirection

@Entry
@Component
struct GridRowPage {
  @State bgColors: Color[] = [Color.Red, Color.Orange, Color.Yellow, Color.Green, Color.Pink, Color.Grey, Color.Blue, Color.Brown]
  @State currentBp: string = 'unknown'
  @State gutter: GutterOption = { x: 5, y: 10 }
  @State columns: number = 4
  @State breakpoints: BreakPoints = { value: ["400vp", "600vp", "800vp"], reference: BreakpointsReference.WindowSize }
  @State grDirection: GridRowDirection = GridRowDirection.Row
  messageManager: MessageManager<MessageData> = new MessageManager()

  onPageShow() {
    console.info('GridRowPage onPageShow')
    let value: Value<MessageData> = {
      name: 'messageManager', message: this.messageManager
    }
    GlobalContext.getContext().setObject('value', value);
    let callback: Callback<MessageData> = message => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'currentBp') {
        this.currentBp = message.value as string
      }
      if (message.name == 'columns') {
        this.columns = message.value as number
      }
      if (message.name == 'gutter') {
        this.gutter = message.value as GutterOption
      }
      if (message.name == 'breakpoints') {
        this.breakpoints = message.value as BreakPoints
      }
      if (message.name == 'grDirection') {
        this.grDirection = message.value as GridRowDirection
      }
    }
    this.messageManager.registerCallback(callback)
  }

  build() {
    Column() {
      Text('currentBp:' + this.currentBp).fontSize(18).margin(15).key('currentBp')
      GridRow({
        columns: this.columns,
        gutter: this.gutter,
        breakpoints: this.breakpoints,
        direction: this.grDirection
      }) {
        ForEach(this.bgColors, (color: Color) => {
          GridCol({ span: { xs: 1, sm: 2, md: 3, lg: 4 } }) {
            Row().width("100%").height("20vp")
          }.borderColor(color).borderWidth(2)
        })
      }.width("100%").height("100%").key('gridRow')
      .onBreakpointChange((breakpoint) => {
        this.currentBp = breakpoint
      })
      
      GridRow() {
        ForEach(this.bgColors, (color: Color) => {
          GridCol({ span: { xs: 1, sm: 2, md: 3, lg: 4 } }) {
            Row().width("100%").height("20vp")
          }.borderColor(color).borderWidth(2)
        })
      }.width("100%").height("100%").key('gridRow_default')
    }.width('80%').margin({ left: 10, top: 5, bottom: 5 }).height(200)
    .border({ color: '#880606', width: 2 })
  }
}