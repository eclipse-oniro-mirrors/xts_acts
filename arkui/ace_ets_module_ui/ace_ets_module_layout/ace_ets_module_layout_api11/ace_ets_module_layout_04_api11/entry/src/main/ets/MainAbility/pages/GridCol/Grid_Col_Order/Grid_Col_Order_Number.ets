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

import GlobalContext from './../../../common/GlobalContext'
import { Value } from '../../../common/Value';
import { MessageManager, Callback, Message } from './../../../common/MessageManager';

type MessageDaata = number | string

@Entry
@Component
struct Grid_Col_Order_Number {
  @State addOrder: number = 0;
  @State currentBp: string = 'unknown';
  messageManager: MessageManager<MessageDaata> = new MessageManager();

  onPageShow() {
    console.info('Grid_Col_Order_Number onPageShow');
    let value: Value<MessageDaata> = {
      name: 'messageManager', message: this.messageManager
    }
    GlobalContext.getContext().setObject('value', value);
    let callback: Callback<MessageDaata> = (message: Message<MessageDaata>) => {
      console.error('message = ' + message.name + "--" + message.value);
      if (message.name == 'addOrder') {
        this.addOrder = message.value as number;
      }
    };
    this.messageManager.registerCallback(callback);
  }

  build() {
    Column() {
      GridRow({
        columns: 6,
        gutter: { x: 10, y: 10 },
        breakpoints: { value: ["50vp", "100vp", "150vp", "200vp", "300vp"],
          reference: BreakpointsReference.ComponentSize },
        direction: GridRowDirection.Row
      }) {
        GridCol({ span: 6, order: this.addOrder }) {

        }.borderColor(Color.Red).borderWidth(2).key("Grid_Col_Order_Number_01").height(50)

        GridCol({ span: 6 }) {

        }.borderColor(Color.Orange).borderWidth(2).key("Grid_Col_Order_Number_02").height(50)

        GridCol({ span: 6 }) {

        }.borderColor(Color.Yellow).borderWidth(2).key("Grid_Col_Order_Number_03").height(50)

        GridCol({ span: 6 }) {

        }.borderColor(Color.Green).borderWidth(2).key("Grid_Col_Order_Number_04").height(50)
      }.width("100%").height("100%")
      .onBreakpointChange((breakpoint) => {
        this.currentBp = breakpoint
      })
    }.width('300vp').height(350)
    .border({ color: '#880606', width: 2 })
  }
}