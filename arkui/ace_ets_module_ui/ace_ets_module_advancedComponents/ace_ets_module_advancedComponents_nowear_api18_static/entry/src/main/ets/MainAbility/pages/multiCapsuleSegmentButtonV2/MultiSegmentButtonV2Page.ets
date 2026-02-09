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


// import { MultiCapsuleSegmentButtonV2, SegmentButtonV2Items } from '@kit.ArkUI';
import { LengthMetrics, ColorMetrics, SizeT } from '@ohos.arkui.node';
import {
  Entry,
  ComponentV2,
  Color,
  BackgroundEffectOptions,
  AdaptiveColor,
  BlurStyleActivePolicy,
  BlurStyle,
  BackgroundBlurStyleOptions,
  Scroll,
  Column,
  ColumnOptions,
  Text,
  Flex,
  FlexOptions,
  Button,
  FlexAlign,
  FlexWrap,
  ClickEvent,
  FontWeight,
  LocalizedPadding,
  Direction,
  $r
} from '@ohos.arkui.component';
import { Local } from '@ohos.arkui.stateManagement';
import { SegmentButtonV2Items, MultiCapsuleSegmentButtonV2, SegmentButtonV2ItemOptions } from '@ohos.arkui.advanced.SegmentButtonV2'

@Entry
@ComponentV2
struct MultiCapsuleSegmentButtonV2Example {
  @Local textItems: SegmentButtonV2Items = new SegmentButtonV2Items([
    { text: 'a' } as SegmentButtonV2ItemOptions,
    { text: 'b' } as SegmentButtonV2ItemOptions,
    { text: 'c' } as SegmentButtonV2ItemOptions,
    { text: 'd' } as SegmentButtonV2ItemOptions,
    { icon: $r('sys.media.ohos_ic_public_device_phone') } as SegmentButtonV2ItemOptions,
    { symbol: $r('sys.symbol.phone') } as SegmentButtonV2ItemOptions,
  ]);
  @Local selectedIndexes: Int[] = [];
  @Local itemBackgroundColor: ColorMetrics = ColorMetrics.resourceColor(Color.Red);
  @Local itemBackgroundEffect: BackgroundEffectOptions = {
    radius: 10,
    saturation: 25,
    brightness: 1.5,
    color: '#FF00FF',
    adaptiveColor: AdaptiveColor.AVERAGE,
    blurOptions: { grayscale: [20, 40] },
    policy: BlurStyleActivePolicy.ALWAYS_INACTIVE,
    inactiveColor: '#0000FF'
  };
  @Local itemBackgroundBlurStyle: BlurStyle = BlurStyle.Thin;
  @Local itemBackgroundBlurStyleOptions: BackgroundBlurStyleOptions =
    { policy: BlurStyleActivePolicy.ALWAYS_INACTIVE, inactiveColor: '#CCCCCC' };
  @Local onItemClickedNum: number = 0

  build() {
    Scroll() {
      Column({ space: 12 } as ColumnOptions) {
        Text('' + this.selectedIndexes)
          .key('selectedIndexesTest001')
        MultiCapsuleSegmentButtonV2({
          items: this.textItems,
          selectedIndexes: this.selectedIndexes,
          $selectedIndexes: (selectedIndexes:Int[]) => {
            this.selectedIndexes = selectedIndexes
            console.log('selectIndex---' + selectedIndexes)
          },
          onItemClicked: (num: Int) => {
            num = 666
            console.log('onItemClicked---' + num)
          },
          itemMinFontScale: 0.85,
          itemMaxFontScale: 3.2,
          itemSpace: LengthMetrics.vp(2),
          itemFontColor: ColorMetrics.resourceColor(Color.Orange),
          itemSelectedFontColor: ColorMetrics.rgba(255, 0, 0),
          itemFontSize: LengthMetrics.fp(0),
          itemSelectedFontSize: LengthMetrics.fp(18),
          itemFontWeight: FontWeight.Medium,
          itemSelectedFontWeight: FontWeight.Bolder,
          itemBorderRadius: LengthMetrics.vp(20),
          itemBackgroundColor: this.itemBackgroundColor,
          itemBackgroundEffect: this.itemBackgroundEffect,
          itemSelectedBackgroundColor: ColorMetrics.resourceColor(Color.Red),
          itemIconSize: { width: LengthMetrics.vp(18), height: LengthMetrics.vp(18) } as SizeT<LengthMetrics>,
          itemIconFillColor: ColorMetrics.resourceColor(Color.Pink),
          itemSelectedIconFillColor: ColorMetrics.resourceColor(Color.Blue),
          itemSymbolFontSize: LengthMetrics.vp(20),
          itemSymbolFontColor: ColorMetrics.resourceColor(Color.Brown),
          itemSelectedSymbolFontColor: ColorMetrics.resourceColor(Color.Black),
          itemMinHeight: LengthMetrics.vp(50),
          itemPadding: LengthMetrics.vp(0) as LocalizedPadding,
          languageDirection: Direction.Auto
        })
          .backgroundColor(Color.White)
          .borderRadius(8)
          .padding(8)
          .width('100%')
          .key('MCSegmentButtonSelectedIndexesId001')

        Flex({ wrap: FlexWrap.Wrap } as FlexOptions) {
          Button('[0]')
            .onClick((e: ClickEvent) => {
              this.selectedIndexes = [0];
            })
            .width(50)
            .height(50)
            .id('SelectedIndexesId001')
          Button('[1]')
            .onClick((e: ClickEvent) => {
              this.selectedIndexes = [1];
            })
            .width(50)
            .height(50)
            .id('SelectedIndexesId002')
          Button('[2]')
            .onClick((e: ClickEvent) => {
              this.selectedIndexes = [2];
            })
            .width(50)
            .height(50)
            .id('SelectedIndexesId003')
          Button('[3]')
            .onClick((e: ClickEvent) => {
              this.selectedIndexes = [3];
            })
            .width(50)
            .height(50)
            .id('SelectedIndexesId004')
          Button('[-1]')
            .onClick((e: ClickEvent) => {
              this.selectedIndexes = [-1];
            })
            .width(50)
            .height(50)
            .id('SelectedIndexesId005')
        }

        MultiCapsuleSegmentButtonV2({
          items: this.textItems,
          selectedIndexes: [0, 2],
          itemBackgroundColor: this.itemBackgroundColor,
          itemBackgroundBlurStyle: this.itemBackgroundBlurStyle,
          itemBackgroundBlurStyleOptions: this.itemBackgroundBlurStyleOptions
        })
          .backgroundColor(Color.White)
          .borderRadius(8)
          .padding(8)
          .width('100%')
          .key('MCSegmentButtonBlurStyleId001')
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
