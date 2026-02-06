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


@Entry
@Component
struct rotatePage {
  private Matrix1: matrix4.Matrix4Transit = matrix4.identity() as matrix4.Matrix4Transit
  private matrix1: matrix4.Matrix4Transit = this.Matrix1
    .rotate({
      x: 0,
      y: 0,
      z: 1,
      angle: 45
    } as matrix4.RotateOption) as matrix4.Matrix4Transit

  build() {
    Column() {
      Image($r('app.media.icon')).transform(this.matrix1)
        .width('40%')
        .height(100)
        .id('rotatePage_image')
    }.width('100%').margin({ top: 50 } as Margin)
  }
}