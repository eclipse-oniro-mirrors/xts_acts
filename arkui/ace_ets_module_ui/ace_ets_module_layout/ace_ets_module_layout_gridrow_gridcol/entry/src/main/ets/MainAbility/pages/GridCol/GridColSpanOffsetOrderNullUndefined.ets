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
struct GridColSpanOffsetOrderNullUndefinedTest {
  build() {
    Column() {
      // ========== span tests ==========
      Row() {
        // Test span default value (未设置 span)
        GridRow({ columns: 5, gutter: { x: 5, y: 10 } }) {
          GridCol() {
            Row().width('100%').height('30vp')
          }.borderColor(Color.Red).borderWidth(2)
          .id('gridcol_span_default')
        }
        .width('30%')
        .height('60%')
        .backgroundColor(0xF0F0F0)
        .border({ color: '#880606', width: 2 })

        // Test span with null parameter
        GridRow({ columns: 5, gutter: { x: 5, y: 10 } }) {
          GridCol() {
            Row().width('100%').height('30vp')
          }.borderColor(Color.Red).borderWidth(2)
          .span(null)
          .id('gridcol_span_null')
        }
        .width('30%')
        .height('60%')
        .backgroundColor(0xF0F0F0)
        .border({ color: '#880606', width: 2 })

        // Test span with undefined parameter
        GridRow({ columns: 5, gutter: { x: 5, y: 10 } }) {
          GridCol() {
            Row().width('100%').height('30vp')
          }.borderColor(Color.Red).borderWidth(2)
          .span(undefined)
          .id('gridcol_span_undefined')
        }
        .width('30%')
        .height('60%')
        .backgroundColor(0xF0F0F0)
        .border({ color: '#880606', width: 2 })
      }
      .width('100%')
      .height('25%')
      .justifyContent(FlexAlign.SpaceEvenly)

      // ========== gridColOffset tests ==========
      Row() {
        // Test gridColOffset default value (未设置 gridColOffset)
        GridRow({ columns: 5, gutter: { x: 5, y: 10 } }) {
          GridCol({ span: 1 }) {
            Row().width('100%').height('30vp')
          }.borderColor(Color.Orange).borderWidth(2)
          GridCol({ span: 1 }) {
            Row().width('100%').height('30vp')
          }.borderColor(Color.Yellow).borderWidth(2)
          .id('gridcol_offset_default')
        }
        .width('30%')
        .height('60%')
        .backgroundColor(0xF0F0F0)
        .border({ color: '#880606', width: 2 })

        // Test gridColOffset with null parameter
        GridRow({ columns: 5, gutter: { x: 5, y: 10 } }) {
          GridCol({ span: 1 }) {
            Row().width('100%').height('30vp')
          }.borderColor(Color.Orange).borderWidth(2)
          GridCol({ span: 1 }) {
            Row().width('100%').height('30vp')
          }.borderColor(Color.Yellow).borderWidth(2)
          .gridColOffset(null)
          .id('gridcol_offset_null')
        }
        .width('30%')
        .height('60%')
        .backgroundColor(0xF0F0F0)
        .border({ color: '#880606', width: 2 })

        // Test gridColOffset with undefined parameter
        GridRow({ columns: 5, gutter: { x: 5, y: 10 } }) {
          GridCol({ span: 1 }) {
            Row().width('100%').height('30vp')
          }.borderColor(Color.Orange).borderWidth(2)
          GridCol({ span: 1 }) {
            Row().width('100%').height('30vp')
          }.borderColor(Color.Yellow).borderWidth(2)
          .gridColOffset(undefined)
          .id('gridcol_offset_undefined')
        }
        .width('30%')
        .height('60%')
        .backgroundColor(0xF0F0F0)
        .border({ color: '#880606', width: 2 })
      }
      .width('100%')
      .height('25%')
      .justifyContent(FlexAlign.SpaceEvenly)

      // ========== order tests ==========
      Row() {
        // Test order default value (未设置 order)
        GridRow({ columns: 5, gutter: { x: 5, y: 10 } }) {
          GridCol({ span: 1 }) {
            Text('1').width('100%').height('30vp').fontSize(16).textAlign(TextAlign.Center)
          }.borderColor(Color.Green).borderWidth(2)
          GridCol({ span: 1 }) {
            Text('2').width('100%').height('30vp').fontSize(16).textAlign(TextAlign.Center)
          }.borderColor(Color.Pink).borderWidth(2)
          .id('gridcol_order_default')
        }
        .width('30%')
        .height('60%')
        .backgroundColor(0xF0F0F0)
        .border({ color: '#880606', width: 2 })

        // Test order with null parameter
        GridRow({ columns: 5, gutter: { x: 5, y: 10 } }) {
          GridCol({ span: 1 }) {
            Text('1').width('100%').height('30vp').fontSize(16).textAlign(TextAlign.Center)
          }.borderColor(Color.Green).borderWidth(2)
          GridCol({ span: 1 }) {
            Text('2').width('100%').height('30vp').fontSize(16).textAlign(TextAlign.Center)
          }.borderColor(Color.Pink).borderWidth(2)
          .order(null)
          .id('gridcol_order_null')
        }
        .width('30%')
        .height('60%')
        .backgroundColor(0xF0F0F0)
        .border({ color: '#880606', width: 2 })

        // Test order with undefined parameter
        GridRow({ columns: 5, gutter: { x: 5, y: 10 } }) {
          GridCol({ span: 1 }) {
            Text('1').width('100%').height('30vp').fontSize(16).textAlign(TextAlign.Center)
          }.borderColor(Color.Green).borderWidth(2)
          GridCol({ span: 1 }) {
            Text('2').width('100%').height('30vp').fontSize(16).textAlign(TextAlign.Center)
          }.borderColor(Color.Pink).borderWidth(2)
          .order(undefined)
          .id('gridcol_order_undefined')
        }
        .width('30%')
        .height('60%')
        .backgroundColor(0xF0F0F0)
        .border({ color: '#880606', width: 2 })
      }
      .width('100%')
      .height('25%')
      .justifyContent(FlexAlign.SpaceEvenly)

      // ========== valid value tests ==========
      Row() {
        // Test span with valid value 2
        GridRow({ columns: 5, gutter: { x: 5, y: 10 } }) {
          GridCol({ span: 2 }) {
            Row().width('100%').height('30vp')
          }.borderColor(Color.Red).borderWidth(2)
          .id('gridcol_span_valid')
        }
        .width('30%')
        .height('60%')
        .backgroundColor(0xF0F0F0)
        .border({ color: '#880606', width: 2 })

        // Test gridColOffset with valid value 1
        GridRow({ columns: 5, gutter: { x: 5, y: 10 } }) {
          GridCol({ span: 1 }) {
            Row().width('100%').height('30vp')
          }.borderColor(Color.Orange).borderWidth(2)
          GridCol({ span: 1 }) {
            Row().width('100%').height('30vp')
          }.borderColor(Color.Yellow).borderWidth(2)
          .gridColOffset(1)
          .id('gridcol_offset_valid')
        }
        .width('30%')
        .height('60%')
        .backgroundColor(0xF0F0F0)
        .border({ color: '#880606', width: 2 })

        // Test order with valid value 1
        GridRow({ columns: 5, gutter: { x: 5, y: 10 } }) {
          GridCol({ span: 1 }) {
            Text('1').width('100%').height('30vp').fontSize(16).textAlign(TextAlign.Center)
          }.borderColor(Color.Green).borderWidth(2)
          GridCol({ span: 1, order: 1 }) {
            Text('2').width('100%').height('30vp').fontSize(16).textAlign(TextAlign.Center)
          }.borderColor(Color.Pink).borderWidth(2)
          .id('gridcol_order_valid')
        }
        .width('30%')
        .height('60%')
        .backgroundColor(0xF0F0F0)
        .border({ color: '#880606', width: 2 })
      }
      .width('100%')
      .height('25%')
      .justifyContent(FlexAlign.SpaceEvenly)
    }
    .width('100%')
    .height('100%')
    .padding(2)
  }
}
