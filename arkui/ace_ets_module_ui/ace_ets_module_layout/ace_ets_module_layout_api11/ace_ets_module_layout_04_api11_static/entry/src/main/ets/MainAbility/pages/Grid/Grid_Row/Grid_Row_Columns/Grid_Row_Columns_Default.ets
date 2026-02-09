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
import { Entry, Component, Column, Color, GridRow, GridRowDirection, Margin, ForEach, GridCol, Row } from '@ohos.arkui.component'
import { State,AppStorage } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct Grid_Row_Columns_Default {
  @State bgColors: Color[] = [Color.Red, Color.Orange, Color.Yellow, Color.Green, Color.Pink, Color.Grey, Color.Blue, Color.Brown, Color.Green, Color.Pink, Color.Grey, Color.Blue, Color.Brown];
  @State GridRowColumns: int = 12;

  build() {
    Column() {
      GridRow({
        columns: this.GridRowColumns,
        gutter: 5,
        direction: GridRowDirection.Row
      }) {
        ForEach(this.bgColors, (color: Color, index?: number) => {
          GridCol({ span: 1 }) {
            Row().width("100%").height("20vp")
          }.borderColor(color).borderWidth(2).key('GridRow_Columns_' + index)
        })
      }.width("100%").height("100%").key('GridRow_Columns_001')
    }.width('90%').margin({ left: 10, top: 5, bottom: 5 } as Margin).height(200)
    .border({ color: '#880606', width: 2 })
  }
}