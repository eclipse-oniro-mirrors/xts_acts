/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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

@Entry
@Component
struct Grid_Row_Breakpoints_Negative {
  @State bgColors: Color[] = [Color.Red, Color.Orange, Color.Yellow, Color.Green, Color.Pink, Color.Grey, Color.Blue, Color.Brown];

  build() {
    Column() {
      GridRow({
        columns: {
          xs: 1,
          sm: 2,
          md: 3,
          lg: 4,
          xl: 5,
          xxl: 6
        },
        gutter: {
          x: {
            xs: 5,
            sm: 10,
            md: 15,
            lg: 20,
            xl: 25,
            xxl: 30
          },
          y: {
            xs: 5,
            sm: 10,
            md: 15,
            lg: 20,
            xl: 25,
            xxl: 30
          }
        },
        breakpoints: { value: ["-50vp", "100vp", "200vp", "100vp", "300vp"],
          reference: BreakpointsReference.ComponentSize },
        direction: GridRowDirection.Row
      }) {
        ForEach(this.bgColors, (color: Color, index?: number) => {
          GridCol({ span: 1 }) {
            Row().width("100%").height("20vp")
          }.borderColor(color).borderWidth(2).key('Grid_Row_Breakpoints_Negative' + index)
        })
      }.width("100%").height("100%")
    }.width('300vp').height(200)
  }
}