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
  FillMode
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { ClickEvent } from '@ohos.arkui.component';
import { UIContext } from '@ohos.arkui.UIContext';

@Entry
@Component
struct imageAnimator03 {
  private surfaceId: string = ''
  private xComponentContext: Record<string, () => void> = {} as Record<string, () => void>
  xComponentController: XComponentController = new XComponentController()

  build() {
    Column() {
      ImageAnimator()
        .images([
          {
            src: 'images/test1.jpg',
            width: '100px'
          },
          {
            src: 'images/test1.jpg',
            width: 100
          },
          {
            src: 'images/test1.jpg',
            width: '50%'
          },
          {
            src: 'images/test1.jpg',
            width: 'xxx'
          },
          {
            src: 'images/test1.jpg',
            width: 90
          }
        ])
        .fillMode(FillMode.None)
        .width(340)
        .height(240)
        .onStart(() => {
          console.info('imageAnimator03 Start')
        })
        .onPause(() => {
          console.info('imageAnimator03 Pause')
        })
        .onRepeat(() => {
          console.info('imageAnimator03 Repeat')
        })
        .onCancel(() => {
          console.info('imageAnimator03 Cancel')
        })
        .onFinish(() => {
          console.info('imageAnimator03 Finish')
        })
        .id('imageAnimator03')
    }
    .backgroundColor(Color.Black)
  }
}