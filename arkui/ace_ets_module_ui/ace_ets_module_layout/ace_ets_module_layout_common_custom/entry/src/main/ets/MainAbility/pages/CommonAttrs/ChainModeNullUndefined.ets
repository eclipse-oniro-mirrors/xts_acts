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
struct ChainModeNullUndefinedTest {
  build() {
    Row() {
      RelativeContainer() {
        Row() {
          Text('row1')
        }
        .justifyContent(FlexAlign.Center)
        .width(60)
        .height(60)
        .backgroundColor('#a3cf62')
        .alignRules({
          left: { anchor: '__container__', align: HorizontalAlign.Start },
          right: { anchor: 'ChainModeNullUndefinedTest_row2', align: HorizontalAlign.Start },
          top: { anchor: '__container__', align: VerticalAlign.Top }
        })
        .id('ChainModeNullUndefinedTest_row1')
        .chainMode(Axis.Horizontal, ChainStyle.SPREAD)

        Row() {
          Text('row2')
        }
        .justifyContent(FlexAlign.Center)
        .width(60)
        .height(60)
        .backgroundColor('#00ae9d')
        .alignRules({
          left: { anchor: 'ChainModeNullUndefinedTest_row1', align: HorizontalAlign.End },
          right: { anchor: 'ChainModeNullUndefinedTest_row3', align: HorizontalAlign.Start },
          top: { anchor: 'ChainModeNullUndefinedTest_row1', align: VerticalAlign.Top }
        })
        .id('ChainModeNullUndefinedTest_row2')

        Row() {
          Text('row3')
        }
        .justifyContent(FlexAlign.Center)
        .width(60)
        .height(60)
        .backgroundColor('#0a59f7')
        .alignRules({
          left: { anchor: 'ChainModeNullUndefinedTest_row2', align: HorizontalAlign.End },
          right: { anchor: '__container__', align: HorizontalAlign.End },
          top: { anchor: 'ChainModeNullUndefinedTest_row1', align: VerticalAlign.Top }
        })
        .id('ChainModeNullUndefinedTest_row3')

        Row() {
          Text('row4')
        }
        .justifyContent(FlexAlign.Center)
        .width(60)
        .height(60)
        .backgroundColor('#a3cf62')
        .alignRules({
          left: { anchor: '__container__', align: HorizontalAlign.Start },
          right: { anchor: 'ChainModeNullUndefinedTest_row5', align: HorizontalAlign.Start },
          center: { anchor: '__container__', align: VerticalAlign.Center }
        })
        .id('ChainModeNullUndefinedTest_row4')
        .chainMode(null, ChainStyle.SPREAD_INSIDE)

        Row() {
          Text('row5')
        }
        .justifyContent(FlexAlign.Center)
        .width(60)
        .height(60)
        .backgroundColor('#00ae9d')
        .alignRules({
          left: { anchor: 'ChainModeNullUndefinedTest_row4', align: HorizontalAlign.End },
          right: { anchor: 'ChainModeNullUndefinedTest_row6', align: HorizontalAlign.Start },
          top: { anchor: 'ChainModeNullUndefinedTest_row4', align: VerticalAlign.Top }
        })
        .id('ChainModeNullUndefinedTest_row5')

        Row() {
          Text('row6')
        }
        .justifyContent(FlexAlign.Center)
        .width(60)
        .height(60)
        .backgroundColor('#0a59f7')
        .alignRules({
          left: { anchor: 'ChainModeNullUndefinedTest_row5', align: HorizontalAlign.End },
          right: { anchor: '__container__', align: HorizontalAlign.End },
          top: { anchor: 'ChainModeNullUndefinedTest_row4', align: VerticalAlign.Top }
        })
        .id('ChainModeNullUndefinedTest_row6')

        Row() {
          Text('row7')
        }
        .justifyContent(FlexAlign.Center)
        .width(60)
        .height(60)
        .backgroundColor('#a3cf62')
        .alignRules({
          left: { anchor: '__container__', align: HorizontalAlign.Start },
          right: { anchor: 'ChainModeNullUndefinedTest_row8', align: HorizontalAlign.Start },
          bottom: { anchor: '__container__', align: VerticalAlign.Bottom }
        })
        .id('ChainModeNullUndefinedTest_row7')
        .chainMode(undefined, ChainStyle.PACKED)

        Row() {
          Text('row8')
        }
        .justifyContent(FlexAlign.Center)
        .width(60)
        .height(60)
        .backgroundColor('#00ae9d')
        .alignRules({
          left: { anchor: 'ChainModeNullUndefinedTest_row7', align: HorizontalAlign.End },
          right: { anchor: 'ChainModeNullUndefinedTest_row9', align: HorizontalAlign.Start },
          top: { anchor: 'ChainModeNullUndefinedTest_row7', align: VerticalAlign.Top }
        })
        .id('ChainModeNullUndefinedTest_row8')

        Row() {
          Text('row9')
        }
        .justifyContent(FlexAlign.Center)
        .width(60)
        .height(60)
        .backgroundColor('#0a59f7')
        .alignRules({
          left: { anchor: 'ChainModeNullUndefinedTest_row8', align: HorizontalAlign.End },
          right: { anchor: '__container__', align: HorizontalAlign.End },
          top: { anchor: 'ChainModeNullUndefinedTest_row7', align: VerticalAlign.Top }
        })
        .id('ChainModeNullUndefinedTest_row9')
      }
      .width(250).height(250)
      // .margin({ left: 50 })
      .border({ width: 2, color: '#6699FF' })
    }
    .height('100%')
  }
}