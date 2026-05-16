/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
struct GridRowAlignItemsNullUndefinedTest {
  build() {
    Column() {
      // ========== alignItems tests ==========
      Row() {
        // Test alignItems default value (未设置 alignItems)
        GridRow({ columns: 5, gutter: { x: 5, y: 10 } }) {
          ForEach([Color.Red, Color.Orange, Color.Yellow], (color: Color, index: number) => {
            GridCol({ span: 1 }) {
              Row()
                .width('100%')
                .height(`${(index + 1) * 20}%`)
            }
            .borderColor(color)
            .borderWidth(2)
          })
        }
        .id('gridrow_alignitems_default')
        .width('30%')
        .height('80%')
        .backgroundColor(0xF0F0F0)
        .border({ color: '#880606', width: 2 })

        // Test alignItems with null parameter
        GridRow({ columns: 5, gutter: { x: 5, y: 10 } }) {
          ForEach([Color.Red, Color.Orange, Color.Yellow], (color: Color, index: number) => {
            GridCol({ span: 1 }) {
              Row()
                .width('100%')
                .height(`${(index + 1) * 20}%`)
            }
            .borderColor(color)
            .borderWidth(2)
          })
        }
        .id('gridrow_alignitems_null')
        .width('30%')
        .height('80%')
        .backgroundColor(0xF0F0F0)
        .border({ color: '#880606', width: 2 })
        .alignItems(null)

        // Test alignItems with undefined parameter
        GridRow({ columns: 5, gutter: { x: 5, y: 10 } }) {
          ForEach([Color.Red, Color.Orange, Color.Yellow], (color: Color, index: number) => {
            GridCol({ span: 1 }) {
              Row()
                .width('100%')
                .height(`${(index + 1) * 20}%`)
            }
            .borderColor(color)
            .borderWidth(2)
          })
        }
        .id('gridrow_alignitems_undefined')
        .width('30%')
        .height('80%')
        .backgroundColor(0xF0F0F0)
        .border({ color: '#880606', width: 2 })
        .alignItems(undefined)
      }
      .width('100%')
      .height('50%')
      .justifyContent(FlexAlign.SpaceEvenly)

      // ========== alignItems valid value tests ==========
      Row() {
        // Test alignItems with ItemAlign.Start (对照)
        GridRow({ columns: 5, gutter: { x: 5, y: 10 } }) {
          ForEach([Color.Red, Color.Orange, Color.Yellow], (color: Color, index: number) => {
            GridCol({ span: 1 }) {
              Row()
                .width('100%')
                .height(`${(index + 1) * 20}%`)
            }
            .borderColor(color)
            .borderWidth(2)
          })
        }
        .id('gridrow_alignitems_start')
        .width('30%')
        .height('80%')
        .backgroundColor(0xF0F0F0)
        .border({ color: '#880606', width: 2 })
        .alignItems(ItemAlign.Start)

        // Test alignItems with ItemAlign.Center
        GridRow({ columns: 5, gutter: { x: 5, y: 10 } }) {
          ForEach([Color.Red, Color.Orange, Color.Yellow], (color: Color, index: number) => {
            GridCol({ span: 1 }) {
              Row()
                .width('100%')
                .height(`${(index + 1) * 20}%`)
            }
            .borderColor(color)
            .borderWidth(2)
          })
        }
        .id('gridrow_alignitems_center')
        .width('30%')
        .height('80%')
        .backgroundColor(0xF0F0F0)
        .border({ color: '#880606', width: 2 })
        .alignItems(ItemAlign.Center)

        // Test alignItems with ItemAlign.End
        GridRow({ columns: 5, gutter: { x: 5, y: 10 } }) {
          ForEach([Color.Red, Color.Orange, Color.Yellow], (color: Color, index: number) => {
            GridCol({ span: 1 }) {
              Row()
                .width('100%')
                .height(`${(index + 1) * 20}%`)
            }
            .borderColor(color)
            .borderWidth(2)
          })
        }
        .id('gridrow_alignitems_end')
        .width('30%')
        .height('80%')
        .backgroundColor(0xF0F0F0)
        .border({ color: '#880606', width: 2 })
        .alignItems(ItemAlign.End)
      }
      .width('100%')
      .height('50%')
      .justifyContent(FlexAlign.SpaceEvenly)
    }
    .width('100%')
    .height('100%')
    .padding(2)
  }
}
