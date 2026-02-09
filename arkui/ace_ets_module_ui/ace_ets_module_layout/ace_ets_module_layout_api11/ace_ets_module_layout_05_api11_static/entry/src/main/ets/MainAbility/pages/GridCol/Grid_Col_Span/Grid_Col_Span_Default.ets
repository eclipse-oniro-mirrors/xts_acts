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
import { Entry, Component, Column, Color, GridRow, BreakpointsReference, GridCol, GutterOption, BreakPoints, GridRowDirection, ForEach } from '@ohos.arkui.component'
import { State,AppStorage } from '@ohos.arkui.stateManagement';
@Entry
@Component
struct Grid_Col_Span_Default {
  @State bgColors: Color[] = [Color.Red, Color.Orange, Color.Yellow, Color.Green, Color.Pink, Color.Grey, Color.Blue, Color.Brown];
  @State currentBp: string = 'unknown';

  onPageShow() {
    console.info('Grid_Col_Span_Default onPageShow');
  }

  build() {
    Column() {
      GridRow({
        columns: 6,
        gutter: { x: 10, y: 10 } as GutterOption,
        breakpoints: { value: ["50vp", "100vp", "150vp", "200vp", "300vp"],
          reference: BreakpointsReference.ComponentSize } as BreakPoints,
        direction: GridRowDirection.Row
      }) {
        ForEach(this.bgColors, (color: Color, index?: int) => {
          GridCol() {

          }.borderColor(color).borderWidth(2).key("Grid_Col_Span_Default_0" + index).height(50)
        })
      }.width("100%").height("100%")
      .onBreakpointChange((breakpoint: string) => {
        this.currentBp = breakpoint
      })
    }.width('300vp').height(500)
    .border({ color: '#880606', width: 2 })
  }
}