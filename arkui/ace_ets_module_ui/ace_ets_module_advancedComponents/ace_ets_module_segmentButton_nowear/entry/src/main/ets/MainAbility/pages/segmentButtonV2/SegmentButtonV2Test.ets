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
import { CapsuleSegmentButtonV2, SegmentButtonV2Items, LengthMetrics, ColorMetrics} from '@kit.ArkUI';

@Entry
@ComponentV2
struct CapsuleSegmentButtonV2Example {

  @Local itemSelectedFontSize: LengthMetrics = LengthMetrics.fp(18)
  @Local itemSelectedFontWeight: FontWeight = FontWeight.Medium
  @Local itemIconFillColor: ColorMetrics = ColorMetrics.resourceColor('#99000000')
  @Local itemSelectedIconFillColor: ColorMetrics = ColorMetrics.resourceColor('#FF000000')
  @Local itemSymbolFontSize: LengthMetrics = LengthMetrics.fp(20)
  @Local itemMinHeight: LengthMetrics = LengthMetrics.vp(80)
  @Local itemPadding: LocalizedPadding = { top: LengthMetrics.vp(30),
    bottom: LengthMetrics.vp(30),
    start: LengthMetrics.vp(30),
    end: LengthMetrics.vp(30) }
  @Local itemShadow: ShadowStyle = ShadowStyle.OUTER_DEFAULT_XS
  @Local buttonBackgroundColor: ColorMetrics = ColorMetrics.resourceColor('#FF00FF00')
  @Local buttonBackgroundBlurStyle: BlurStyle = BlurStyle.Thin
  @Local buttonPadding: LengthMetrics = LengthMetrics.fp(20)

  @Local textSelectedIndex: number = 0;
  @Local textItems: SegmentButtonV2Items = new SegmentButtonV2Items([
    { text: '语文' },
    { text: '数学' },
    { text: '英语' },
    { text: '地理' },
  ]);
  @Local hybridSelectedIndex: number = 0;
  @Local hybridItems: SegmentButtonV2Items = new SegmentButtonV2Items([
    { text: '手机', symbol: $r('sys.symbol.phone') },
    { text: '平板', symbol: $r('sys.symbol.pad') },
    { text: '2in1', symbol: $r('sys.symbol.matebook') },
    { text: '智能穿戴', symbol: $r('sys.symbol.watch') },
  ]);

  @Local imageSelectedIndex: number = 0;
  @Local imageItems: SegmentButtonV2Items = new SegmentButtonV2Items([
    { icon: $r('sys.media.ohos_ic_public_device_phone') },
    { icon: $r('sys.media.ohos_ic_public_device_pad') },
    { icon: $r('sys.media.ohos_ic_public_device_matebook') },
    { icon: $r('sys.media.ohos_ic_public_device_watch') },
  ]);

  build() {
    Scroll() {
      Column({ space: 12 }) {
        CapsuleSegmentButtonV2({
          items: this.textItems,
          selectedIndex: this.textSelectedIndex!!,
          itemSelectedFontSize: this.itemSelectedFontSize,
          itemSelectedFontWeight: this.itemSelectedFontWeight,
          itemPadding: this.itemPadding,
          itemShadow: this.itemShadow,
          buttonBackgroundColor: this.buttonBackgroundColor,
          buttonBackgroundBlurStyle: this.buttonBackgroundBlurStyle,
          buttonBackgroundBlurStyleOptions: undefined,
          buttonPadding: this.buttonPadding,
        }).key('TabSegmentButtonV2_01')

        CapsuleSegmentButtonV2({
          items: this.hybridItems,
          selectedIndex: this.hybridSelectedIndex!!,
          itemSymbolFontSize: this.itemSymbolFontSize,
        }).key('TabSegmentButtonV2_02')

        CapsuleSegmentButtonV2({
          items: this.imageItems,
          selectedIndex: this.imageSelectedIndex!!,
          itemMinHeight: this.itemMinHeight,
          itemIconSize: {
            width: LengthMetrics.vp(30),
            height: LengthMetrics.vp(30)
          },
          itemIconFillColor: this.itemIconFillColor,
          itemSelectedIconFillColor: this.itemSelectedIconFillColor,
          buttonBackgroundColor: this.itemSelectedIconFillColor,
          buttonBackgroundBlurStyle: this.buttonBackgroundBlurStyle,
          buttonBackgroundBlurStyleOptions: undefined,
          buttonPadding: this.buttonPadding,

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