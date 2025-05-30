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

import { MessageManager, Callback, Message } from './../../../common/MessageManager';

@Entry
@Component
struct Grid_Col_Offset_GridColColumnOption {
  @State addWidth: string = '0';
  @State addSpan: number = 2;
  @State bgColors: Color[] = [Color.Red, Color.Orange, Color.Yellow, Color.Green, Color.Pink, Color.Grey, Color.Blue, Color.Brown];
  @State currentBp: string = 'unknown';
  messageManager: MessageManager<string> = new MessageManager();

  onPageShow() {
    console.info('Grid_Col_Offset_GridColColumnOption onPageShow');
    globalThis.value = {
      name: 'messageManager', message: this.messageManager
    };
    let callback: Callback<string> = (message: Message<string>) => {
      console.error('message = ' + message.name + "--" + message.value);
      if (message.name == 'addWidth') {
        this.addWidth = message.value;
      } else if (message.name == 'addSpan') {
        this.addSpan = Number.parseInt(message.value);
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
        ForEach(this.bgColors, (color: Color, index?: number) => {
          GridCol({
            span: this.addSpan,
            offset: {
              xs: 1,
              sm: 2,
              md: 3,
              lg: 4,
              xl: 5,
              xxl: 3
            }
          }) {

          }.backgroundColor(color).key("Grid_Col_Offset_GridColColumnOption_0" + index).height(50)
        })
      }.width("100%").height("100%").key("Grid_Col_Offset_GridColColumnOption_G1")
      .onBreakpointChange((breakpoint) => {
        this.currentBp = breakpoint
      })
    }.width(this.addWidth).height(800)
    .border({ color: '#880606' })
  }
}