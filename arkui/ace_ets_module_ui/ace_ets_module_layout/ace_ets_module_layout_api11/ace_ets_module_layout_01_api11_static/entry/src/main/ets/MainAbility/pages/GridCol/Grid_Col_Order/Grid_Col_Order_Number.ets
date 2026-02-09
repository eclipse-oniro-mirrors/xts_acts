'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd
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

import { MessageManager, Callback, Message } from '../../../common/MessageManager';
import {Entry,Component,Column,Text,Flex,Color,BreakpointsReference,FlexDirection,ForEach,ColumnOptions,Grid,Button,ClickEvent,Scroll,Alignment,ItemAlign,Margin,TextAlign,TextOverflow,FontWeight,GridRow,FlexAlign,GridCol,GridRowDirection} from '@ohos.arkui.component'
import {State,AppStorage} from '@ohos.arkui.stateManagement'



@Entry
@Component
struct Grid_Col_Order_Number {
  @State addOrder: int = 0;
  @State currentBp: string = 'unknown';
  messageManager: MessageManager<number> = new MessageManager<number>();

  onPageShow() {
    console.info('Grid_Col_Order_Number onPageShow');
    AppStorage.setOrCreate<MessageManager<number>>("messageManager",  this.messageManager);
    let callback: Callback<number> = (message: Message<number>) => {
      console.error('message = ' + message.name + "--" + message.value);
      if (message.name == 'addOrder') {
        this.addOrder = message.value as int;
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