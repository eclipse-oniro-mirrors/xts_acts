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
import { Value } from './../../../common/Value';
import { MessageManager, Callback, Message } from './../../../common/MessageManager';

@Entry
@Component
struct Grid_Col_Order_GridColColumnOption {
  @State addWidth: string = '0';
  @State currentBp: string = 'unknown';
  messageManager: MessageManager<string> = new MessageManager();

  onPageShow() {
    console.info('Grid_Col_Order_GridColColumnOption onPageShow');
    let value: Value<string> = {
      name: 'messageManager', message: this.messageManager
    }
    GlobalContext.getContext().setObject('value', value);
    let callback: Callback<string> = (message: Message<string>) => {
      console.error('message = ' + message.name + "--" + message.value);
      if (message.name == 'addWidth') {
        this.addWidth = message.value;
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
        GridCol({
          span: 6,
          order: {
            xs: 1,
            sm: 2,
            md: 3,
            lg: 4,
            xl: 5,
            xxl: 6
          }
        }) {

        }.borderColor(Color.Pink).borderWidth(2).key("Grid_Col_Order_GridColColumnOption_01").height(50)

        GridCol({
          span: 6,
          order: {
            xs: 2,
            sm: 3,
            md: 4,
            lg: 5,
            xl: 0,
            xxl: 1
          }
        }) {

        }.borderColor(Color.Black).borderWidth(2).key("Grid_Col_Order_GridColColumnOption_02").height(50)

        GridCol({
          span: 6,
          order: {
            xs: 3,
            sm: 1,
            md: 5,
            lg: -3,
            xl: 1,
            xxl: 2
          }
        }) {

        }.borderColor(Color.Green).borderWidth(2).key("Grid_Col_Order_GridColColumnOption_03").height(50)

        GridCol({
          span: 6,
          order: {
            xs: 5,
            sm: 4,
            md: 3,
            lg: 2,
            xl: 5,
            xxl: -1
          }
        }) {

        }.borderColor(Color.Yellow).borderWidth(2).key("Grid_Col_Order_GridColColumnOption_04").height(50)

      }.width("100%").height("100%")
      .onBreakpointChange((breakpoint) => {
        this.currentBp = breakpoint
      })
    }.width(this.addWidth).height(350)
    .border({ color: '#880606', width: 2 })
  }
}