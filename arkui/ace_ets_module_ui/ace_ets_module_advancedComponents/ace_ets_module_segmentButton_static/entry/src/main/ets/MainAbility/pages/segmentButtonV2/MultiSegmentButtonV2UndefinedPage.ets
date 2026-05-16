'use static'
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
import {
  Entry,
  Local,
  ComponentV2,
  $r,
  Column,
  ColorMetrics,
  LengthMetrics,
  MultiCapsuleSegmentButtonV2,
  SegmentButtonV2Items,
  ColorMetrics,
  Color,
  BackgroundEffectOptions,
  BlurStyle,
  BackgroundBlurStyleOptions,
  Scroll,
  LocalizedPadding,
  Text,
  FontWeight,
  Flex,
  Direction,
  ColumnOptions,
  BlurStyleActivePolicy,
  AdaptiveColor,
  Button,
  FlexWrap,
  FlexAlign
} from '@kit.ArkUI';
import { SizeT } from '@ohos.arkui.node'

@Entry
@ComponentV2
struct MultiSegmentButtonV2UndefinedPage {
  @Local textItems: SegmentButtonV2Items = new SegmentButtonV2Items([
    { text: 'a' },
    { text: 'b' },
    { text: 'c' },
    { text: 'd' },
    { icon: $r('sys.media.ohos_ic_public_device_phone') },
    { symbol: $r('sys.symbol.phone') },
  ]);
  @Local selectedIndexes: int[] = [];


  build() {
    Scroll() {
      Column() {
        Text('MultiSegmentButtonV2UndefinedPage')
          .height('5%')
        MultiCapsuleSegmentButtonV2({
          items: this.textItems,
          selectedIndexes: this.selectedIndexes,
          itemBackgroundColor: ColorMetrics.resourceColor($r('sys.color.segment_button_v2_multi_capsule_button_background')),
        })
          .backgroundColor(Color.White)
          .width('100%')

        Flex({ wrap: FlexWrap.Wrap }) {
          Button('[-1]')
            .onClick(() => {
              this.selectedIndexes = [-1];
            })
            .height('5%')
        }

        MultiCapsuleSegmentButtonV2({
          items: this.textItems,
          selectedIndexes: [0, 2],
          $selectedIndexes: undefined,
          onItemClicked: undefined,
          itemMinFontScale: undefined,
          itemMaxFontScale: undefined,
          itemSpace: undefined,
          itemFontColor: undefined,
          itemSelectedFontColor: undefined,
          itemFontSize: undefined,
          itemSelectedFontSize: undefined,
          itemFontWeight: undefined,
          itemSelectedFontWeight: undefined,
          itemBorderRadius: undefined,
          itemBackgroundColor: undefined,
          itemBackgroundEffect: undefined,
          itemSelectedBackgroundColor: undefined,
          itemIconSize: undefined,
          itemIconFillColor: undefined,
          itemSelectedIconFillColor: undefined,
          itemSymbolFontSize: undefined,
          itemSymbolFontColor: undefined,
          itemSelectedSymbolFontColor: undefined,
          itemMinHeight: undefined,
          itemBackgroundBlurStyle: undefined,
          itemBackgroundBlurStyleOptions: undefined,
          itemPadding: undefined,
          languageDirection: undefined
        })
          .backgroundColor(Color.White)
          .borderRadius(8)
          .padding(8)
          .width('100%')
      }
      .constraintSize({ minHeight: '100%' })
      .justifyContent(FlexAlign.Start)
      .padding(16)
    }
    .backgroundColor($r('sys.color.comp_background_focus'))
    .width('100%')
    .height('100%')

  }
}