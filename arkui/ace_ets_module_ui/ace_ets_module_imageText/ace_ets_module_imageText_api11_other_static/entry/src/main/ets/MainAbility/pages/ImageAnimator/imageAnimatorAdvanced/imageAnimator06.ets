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
import {
  Entry,
  Column,
  Component,
  Button,
  Text,
  Row,
  Color,
  $r,
  Margin,
  ColumnOptions,
  Flex,
  Scroll,
  Padding,
  Position,
  Builder,
  Image,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Alignment,
  TextAlign,
  TextOverflow,
  XComponentController,
  ImageAnimator,
  FillMode,
  $rawfile
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { ClickEvent } from '@ohos.arkui.component';
import { UIContext } from '@ohos.arkui.UIContext';

@Entry
@Component
struct imageAnimator06 {
  private surfaceId: string = ''
  private xComponentContext: Record<string, () => void> = {} as Record<string, () => void>
  xComponentController: XComponentController = new XComponentController()

  build() {
    Column() {
      ImageAnimator()
        .images([
          {
            src: $rawfile('yyy.png')
          }
        ])
        .fillMode(FillMode.None)
        .width(340)
        .height(240)
        .onStart(() => {
          console.info('imageAnimator06 Start')
        })
        .onPause(() => {
          console.info('imageAnimator06 Pause')
        })
        .onRepeat(() => {
          console.info('imageAnimator06 Repeat')
        })
        .onCancel(() => {
          console.info('imageAnimator06 Cancel')
        })
        .onFinish(() => {
          console.info('imageAnimator06 Finish')
        })
        .id('imageAnimator06')
    }
    .backgroundColor(Color.Black)
  }
}