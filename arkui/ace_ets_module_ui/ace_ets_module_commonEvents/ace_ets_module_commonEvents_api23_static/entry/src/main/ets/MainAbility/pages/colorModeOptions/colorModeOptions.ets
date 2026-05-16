/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

'use static'

import {
  Column,
  ColumnOptions,
  Button,
  Text,
  Entry,
  Component,
  Image,
  $r,
  FlexAlign
} from '@ohos.arkui.component';
import componentSnapshot from '@ohos.arkui.componentSnapshot';
import { DynamicRangeMode } from '@ohos.arkui.component';
import { AppStorage } from '@ohos.arkui.stateManagement';
import colorSpaceManager from '@ohos.graphics.colorSpaceManager';

@Entry
@Component
struct colorModeOptions {
  // Test ColorModeOptions - colorSpace
  @Builder
  buildImage1() {
    Image($r('sys.media.ohos_ic_public_voice'))
      .width(100)
      .height(100)
      .id('imageColorSpace')
  }

  // Test ColorModeOptions - isAuto
  @Builder
  buildImage2() {
    Image($r('sys.media.ohos_ic_public_voice'))
      .width(100)
      .height(100)
      .id('imageIsAuto')
  }

  // Test DynamicRangeModeOptions - dynamicRangeMode
  @Builder
  buildImage3() {
    Image($r('sys.media.ohos_ic_public_voice'))
      .width(100)
      .height(100)
      .id('imageDynamicRangeMode')
  }

  // Test DynamicRangeModeOptions - isAuto
  @Builder
  buildImage4() {
    Image($r('sys.media.ohos_ic_public_voice'))
      .width(100)
      .height(100)
      .id('imageDynamicRangeIsAuto')
  }

  build() {
    Column({ space: 1 } as ColumnOptions) {
      Button('色域')
        .id('btnColorModeColorSpace')
        .width('100%').layoutWeight(1).constraintSize({ minHeight: 0, maxHeight: '11%' }).fontSize(9)
        .onClick(() => {
          let colorModeOptions: componentSnapshot.ColorModeOptions = {
            colorSpace: colorSpaceManager.ColorSpace.SRGB
          };
          AppStorage.setOrCreate<componentSnapshot.ColorModeOptions>('colorModeOptionsColorSpace', colorModeOptions);
        })
      Button('isAuto·T')
        .id('btnColorModeIsAutoTrue')
        .width('100%').layoutWeight(1).constraintSize({ minHeight: 0, maxHeight: '11%' }).fontSize(9)
        .onClick(() => {
          let colorModeOptions: componentSnapshot.ColorModeOptions = { isAuto: true };
          AppStorage.setOrCreate<componentSnapshot.ColorModeOptions>('colorModeOptionsIsAutoTrue', colorModeOptions);
        })
      Button('isAuto·F')
        .id('btnColorModeIsAutoFalse')
        .width('100%').layoutWeight(1).constraintSize({ minHeight: 0, maxHeight: '11%' }).fontSize(9)
        .onClick(() => {
          let colorModeOptions: componentSnapshot.ColorModeOptions = { isAuto: false };
          AppStorage.setOrCreate<componentSnapshot.ColorModeOptions>('colorModeOptionsIsAutoFalse', colorModeOptions);
        })
      Button('DR·HIGH')
        .id('btnDynamicRangeModeHigh')
        .width('100%').layoutWeight(1).constraintSize({ minHeight: 0, maxHeight: '11%' }).fontSize(9)
        .onClick(() => {
          let dynamicRangeModeOptions: componentSnapshot.DynamicRangeModeOptions = {
            dynamicRangeMode: DynamicRangeMode.HIGH
          };
          AppStorage.setOrCreate<componentSnapshot.DynamicRangeModeOptions>('dynamicRangeModeOptionsHigh', dynamicRangeModeOptions);
        })
      Button('DR·CST')
        .id('btnDynamicRangeModeConstraint')
        .width('100%').layoutWeight(1).constraintSize({ minHeight: 0, maxHeight: '11%' }).fontSize(9)
        .onClick(() => {
          let dynamicRangeModeOptions: componentSnapshot.DynamicRangeModeOptions = {
            dynamicRangeMode: DynamicRangeMode.CONSTRAINT
          };
          AppStorage.setOrCreate<componentSnapshot.DynamicRangeModeOptions>('dynamicRangeModeOptionsConstraint', dynamicRangeModeOptions);
        })
      Button('DR·STD')
        .id('btnDynamicRangeModeStandard')
        .width('100%').layoutWeight(1).constraintSize({ minHeight: 0, maxHeight: '11%' }).fontSize(9)
        .onClick(() => {
          let dynamicRangeModeOptions: componentSnapshot.DynamicRangeModeOptions = {
            dynamicRangeMode: DynamicRangeMode.STANDARD
          };
          AppStorage.setOrCreate<componentSnapshot.DynamicRangeModeOptions>('dynamicRangeModeOptionsStandard', dynamicRangeModeOptions);
        })
      Button('DR自·T')
        .id('btnDynamicRangeIsAutoTrue')
        .width('100%').layoutWeight(1).constraintSize({ minHeight: 0, maxHeight: '11%' }).fontSize(9)
        .onClick(() => {
          let dynamicRangeModeOptions: componentSnapshot.DynamicRangeModeOptions = { isAuto: true };
          AppStorage.setOrCreate<componentSnapshot.DynamicRangeModeOptions>('dynamicRangeModeOptionsIsAutoTrue', dynamicRangeModeOptions);
        })
      Button('DR自·F')
        .id('btnDynamicRangeIsAutoFalse')
        .width('100%').layoutWeight(1).constraintSize({ minHeight: 0, maxHeight: '11%' }).fontSize(9)
        .onClick(() => {
          let dynamicRangeModeOptions: componentSnapshot.DynamicRangeModeOptions = { isAuto: false };
          AppStorage.setOrCreate<componentSnapshot.DynamicRangeModeOptions>('dynamicRangeModeOptionsIsAutoFalse', dynamicRangeModeOptions);
        })
    }
    .width('100%')
    .height('100%')
    .padding({ left: '3%', right: '3%', top: '1%', bottom: '1%' })
    .justifyContent(FlexAlign.SpaceEvenly)
  }
}
