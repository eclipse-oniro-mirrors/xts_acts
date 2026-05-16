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
  ClickEvent,
  FlexAlign
} from '@ohos.arkui.component';
import componentSnapshot from '@ohos.arkui.componentSnapshot';
import { DynamicRangeMode } from '@ohos.arkui.component';
import { AppStorage } from '@ohos.arkui.stateManagement';
import colorSpaceManager from '@ohos.graphics.colorSpaceManager';

@Entry
@Component
struct snapshotOptions {
  // Test SnapshotOptions - colorMode
  @Builder
  buildImage1() {
    Image($r('sys.media.ohos_ic_public_voice'))
      .width(100)
      .height(100)
      .id('imageColorMode')
  }

  // Test SnapshotOptions - dynamicRangeMode
  @Builder
  buildImage2() {
    Image($r('sys.media.ohos_ic_public_voice'))
      .width(100)
      .height(100)
      .id('imageDynamicRangeMode')
  }

  build() {
    Column({ space: 1 } as ColumnOptions) {
      Button('快照·色·T')
        .id('btnSnapshotColorModeIsAutoTrue')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '12%' })
        .fontSize(9)
        .onClick(() => {
          // Test colorMode - isAuto true
          let colorModeOptions: componentSnapshot.ColorModeOptions = {
            colorSpace: colorSpaceManager.ColorSpace.SRGB,
            isAuto: true
          };
          let snapshotOptions: componentSnapshot.SnapshotOptions = {
            colorMode: colorModeOptions
          };
          AppStorage.setOrCreate<componentSnapshot.SnapshotOptions>('snapshotOptionsColorModeIsAutoTrue', snapshotOptions);
        })

      Button('快照·色·F')
        .id('btnSnapshotColorModeIsAutoFalse')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '12%' })
        .fontSize(9)
        .onClick(() => {
          // Test colorMode - isAuto false
          let colorModeOptions: componentSnapshot.ColorModeOptions = {
            colorSpace: colorSpaceManager.ColorSpace.SRGB,
            isAuto: false
          };
          let snapshotOptions: componentSnapshot.SnapshotOptions = {
            colorMode: colorModeOptions
          };
          AppStorage.setOrCreate<componentSnapshot.SnapshotOptions>('snapshotOptionsColorModeIsAutoFalse', snapshotOptions);
        })

      Button('快照·DR·H')
        .id('btnSnapshotDynamicRangeModeHigh')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '12%' })
        .fontSize(9)
        .onClick(() => {
          // Test dynamicRangeMode - HIGH
          let dynamicRangeModeOptions: componentSnapshot.DynamicRangeModeOptions = {
            dynamicRangeMode: DynamicRangeMode.HIGH,
            isAuto: false
          };
          let snapshotOptions: componentSnapshot.SnapshotOptions = {
            dynamicRangeMode: dynamicRangeModeOptions
          };
          AppStorage.setOrCreate<componentSnapshot.SnapshotOptions>('snapshotOptionsDynamicRangeModeHigh', snapshotOptions);
        })

      Button('快照·DR·C')
        .id('btnSnapshotDynamicRangeModeConstraint')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '12%' })
        .fontSize(9)
        .onClick(() => {
          // Test dynamicRangeMode - CONSTRAINT
          let dynamicRangeModeOptions: componentSnapshot.DynamicRangeModeOptions = {
            dynamicRangeMode: DynamicRangeMode.CONSTRAINT,
            isAuto: false
          };
          let snapshotOptions: componentSnapshot.SnapshotOptions = {
            dynamicRangeMode: dynamicRangeModeOptions
          };
          AppStorage.setOrCreate<componentSnapshot.SnapshotOptions>('snapshotOptionsDynamicRangeModeConstraint', snapshotOptions);
        })

      Button('快照·DR·S')
        .id('btnSnapshotDynamicRangeModeStandard')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '12%' })
        .fontSize(9)
        .onClick(() => {
          // Test dynamicRangeMode - STANDARD
          let dynamicRangeModeOptions: componentSnapshot.DynamicRangeModeOptions = {
            dynamicRangeMode: DynamicRangeMode.STANDARD,
            isAuto: false
          };
          let snapshotOptions: componentSnapshot.SnapshotOptions = {
            dynamicRangeMode: dynamicRangeModeOptions
          };
          AppStorage.setOrCreate<componentSnapshot.SnapshotOptions>('snapshotOptionsDynamicRangeModeStandard', snapshotOptions);
        })

      Button('快照·DR·T')
        .id('btnSnapshotDynamicRangeModeIsAutoTrue')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '12%' })
        .fontSize(9)
        .onClick(() => {
          // Test dynamicRangeMode - isAuto true
          let dynamicRangeModeOptions: componentSnapshot.DynamicRangeModeOptions = {
            dynamicRangeMode: DynamicRangeMode.HIGH,
            isAuto: true
          };
          let snapshotOptions: componentSnapshot.SnapshotOptions = {
            dynamicRangeMode: dynamicRangeModeOptions
          };
          AppStorage.setOrCreate<componentSnapshot.SnapshotOptions>('snapshotOptionsDynamicRangeModeIsAutoTrue', snapshotOptions);
        })

      Button('快照·DR·F')
        .id('btnSnapshotDynamicRangeModeIsAutoFalse')
        .width('100%')
        .layoutWeight(1)
        .constraintSize({ minHeight: 0, maxHeight: '12%' })
        .fontSize(9)
        .onClick(() => {
          // Test dynamicRangeMode - isAuto false
          let dynamicRangeModeOptions: componentSnapshot.DynamicRangeModeOptions = {
            dynamicRangeMode: DynamicRangeMode.HIGH,
            isAuto: false
          };
          let snapshotOptions: componentSnapshot.SnapshotOptions = {
            dynamicRangeMode: dynamicRangeModeOptions
          };
          AppStorage.setOrCreate<componentSnapshot.SnapshotOptions>('snapshotOptionsDynamicRangeModeIsAutoFalse', snapshotOptions);
        })
    }
    .width('100%')
    .height('100%')
    .padding({ left: '3%', right: '3%', top: '1%', bottom: '1%' })
    .justifyContent(FlexAlign.SpaceEvenly)
  }
}
