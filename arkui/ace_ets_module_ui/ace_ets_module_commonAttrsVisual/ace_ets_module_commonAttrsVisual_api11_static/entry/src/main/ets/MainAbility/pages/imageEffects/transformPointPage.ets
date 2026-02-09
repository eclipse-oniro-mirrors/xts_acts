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
import emitter from '@ohos.events.emitter';
import hilog from '@ohos.hilog';
import {
  $$,
  $r,
  Alignment,
  BindOptions,
  Button,
  ButtonType,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  FlexOptions,
  FontWeight,
  Image,
  ItemAlign,
  Margin,
  Row,
  Scroll,
  SheetOptions,
  SheetType,
  Text,
  TextAlign
} from '@ohos.arkui.component'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage, Link, State } from '@ohos.arkui.stateManagement';
import { Hypium } from '../../../../../hypium/index';
import matrix4 from '@ohos.matrix4';

AppStorage.setOrCreate('transformPointPage_transformPoint0', -1)
AppStorage.setOrCreate('transformPointPage_transformPoint1', -1)

@Entry
@Component
struct Test {
  private originPoint: Array<number> = [50, 50] as Array<number>
  private matrix_1: matrix4.Matrix4Transit =
    matrix4.identity().translate({ x: 150, y: -50 } as matrix4.TranslateOption)
  private transformPoint: [Double, Double] =
    this.matrix_1.transformPoint([this.originPoint[0], this.originPoint[1]] as [Double, Double])
  private matrix_2: matrix4.Matrix4Transit =
    matrix4.identity()
      .translate({ x: this.transformPoint[0], y: this.transformPoint[1] } as matrix4.TranslateOption)

  build() {
    Column() {
      Button('getNum').onClick((e: ClickEvent) => {
        AppStorage.setOrCreate<Double>('transformPointPage_transformPoint0', this.transformPoint[0])
        AppStorage.setOrCreate<Double>('transformPointPage_transformPoint1', this.transformPoint[1])
        console.info('1111')
      }).id('transformPointPage_btn')

      Text(`矩阵变换前的坐标：[${this.originPoint}]`)
        .fontSize(16)
      Image($r('app.media.icon'))
        .width('600px')
        .height('300px')
        .margin({ top: 50 } as Margin)
      Text(`矩阵变换后的坐标：[${this.transformPoint}]`)
        .fontSize(16)
        .margin({ top: 100 } as Margin)
      Image($r('app.media.icon'))
        .width('600px')
        .height('300px')
        .margin({ top: 50 } as Margin)
        .transform(this.matrix_2)
    }.width('100%').padding(50)
  }
}