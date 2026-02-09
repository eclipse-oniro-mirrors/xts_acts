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

import { SegmentButtonV2Items, TabSegmentButtonV2,SegmentButtonV2ItemOptions } from '@ohos.arkui.advanced.SegmentButtonV2';
import { LengthMetrics, ColorMetrics } from '@ohos.arkui.node';
import { Entry, ComponentV2, Scroll, Column, ColumnOptions, FontWeight, FlexAlign,$r } from '@ohos.arkui.component';
import { Local } from '@ohos.arkui.stateManagement';

@Entry
@ComponentV2
struct TabSegmentButtonV2Example {
  @Local textSelectedIndex: Int = 0;
  @Local textItems: SegmentButtonV2Items = new SegmentButtonV2Items([
    { text: '语文' },
    { text: '数学' },
    { text: '英语' },
    { text: '地理' },
  ]);
  @Local hybridSelectedIndex: Int = 0;
  @Local hybridItems: SegmentButtonV2Items = new SegmentButtonV2Items([
    { text: '手机', symbol: $r('sys.symbol.phone') } as SegmentButtonV2ItemOptions,
    { text: '平板', symbol: $r('sys.symbol.pad') } as SegmentButtonV2ItemOptions,
    { text: '2in1', symbol: $r('sys.symbol.matebook') } as SegmentButtonV2ItemOptions,
    { text: '智能穿戴', symbol: $r('sys.symbol.watch') } as SegmentButtonV2ItemOptions,
  ]);

  @Local imageSelectedIndex: Int = 0;
  @Local imageItems: SegmentButtonV2Items = new SegmentButtonV2Items([
    { icon: $r('sys.media.ohos_ic_public_device_phone') } as SegmentButtonV2ItemOptions,
    { icon: $r('sys.media.ohos_ic_public_device_pad') } as SegmentButtonV2ItemOptions,
    { icon: $r('sys.media.ohos_ic_public_device_matebook') } as SegmentButtonV2ItemOptions,
    { icon: $r('sys.media.ohos_ic_public_device_watch') } as SegmentButtonV2ItemOptions,
  ]);


  @Local itemMinFontScale: number = 0.5
  @Local itemMaxFontScale: number = 1.2
  @Local itemSpace: LengthMetrics = LengthMetrics.vp(5)
  @Local itemFontSize: LengthMetrics = LengthMetrics.fp(15)
  @Local itemSelectedFontSize: LengthMetrics = LengthMetrics.fp(18)
  @Local itemFontColor: ColorMetrics = ColorMetrics.resourceColor('#FFFFC0CB')
  @Local itemSelectedFontColor: ColorMetrics = ColorMetrics.resourceColor('#FF0000FF')
  @Local itemFontWeight: FontWeight = FontWeight.Medium
  @Local itemSelectedFontWeight: FontWeight = FontWeight.Medium
  @Local itemBorderRadius: LengthMetrics = LengthMetrics.px(10)
  @Local itemSelectedBackgroundColor: ColorMetrics = ColorMetrics.resourceColor('#330A59F7')
  @Local itemIconFillColor: ColorMetrics = ColorMetrics.resourceColor('#99000000')
  @Local itemSelectedIconFillColor: ColorMetrics = ColorMetrics.resourceColor('#FF000000')
  @Local itemSymbolFontSize: LengthMetrics = LengthMetrics.fp(20)
  @Local itemSymbolFontColor: ColorMetrics = ColorMetrics.resourceColor('#FFFFC0CB')
  @Local itemSelectedSymbolFontColor: ColorMetrics = ColorMetrics.resourceColor('#FF0000FF')
  @Local itemMinHeight: LengthMetrics = LengthMetrics.vp(80)

  build() {
    Scroll() {
      Column({ space: 12 } as ColumnOptions) {
        TabSegmentButtonV2({
          items: this.textItems,
          selectedIndex: this.textSelectedIndex!!,
          itemMinFontScale: this.itemMinFontScale,
          itemMaxFontScale: this.itemMaxFontScale,
          itemSpace: this.itemSpace,
          itemFontSize: this.itemFontSize,
          itemSelectedFontSize: this.itemSelectedFontSize,
          itemFontColor: this.itemFontColor,
          itemSelectedFontColor: this.itemSelectedFontColor,
          itemFontWeight: this.itemFontWeight,
          itemSelectedFontWeight: this.itemSelectedFontWeight,
          itemBorderRadius: this.itemBorderRadius,
          itemSelectedBackgroundColor: this.itemSelectedBackgroundColor
        }).key('TabSegmentButtonV2_01')

        TabSegmentButtonV2({
          items: this.hybridItems,
          selectedIndex: this.hybridSelectedIndex!!,
          itemSymbolFontSize: this.itemSymbolFontSize,
          itemSymbolFontColor: this.itemSymbolFontColor,
          itemSelectedSymbolFontColor: this.itemSelectedSymbolFontColor
        }).key('TabSegmentButtonV2_02')

        TabSegmentButtonV2({
          items: this.imageItems,
          selectedIndex: this.imageSelectedIndex!!,
          itemMinHeight: this.itemMinHeight,
          itemIconSize: {
            width: LengthMetrics.vp(30),
            height: LengthMetrics.vp(30)
          },
          itemIconFillColor: this.itemIconFillColor,
          itemSelectedIconFillColor: this.itemSelectedIconFillColor,
        }).key('TabSegmentButtonV2_02')
      }
      .constraintSize({ minHeight: '100%' })
      .justifyContent(FlexAlign.Start)
      .padding(16)
    }
    .backgroundColor('#f1f3f5')
    .width('100%')
    .height('100%')
  }
}