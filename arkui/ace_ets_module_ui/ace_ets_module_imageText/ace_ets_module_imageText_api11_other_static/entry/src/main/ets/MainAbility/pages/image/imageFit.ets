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
  ImageFit,
  RowOptions,
  $rawfile,
  BorderStyle
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { ClickEvent } from '@ohos.arkui.component';
import { UIContext } from '@ohos.arkui.UIContext';

@Entry
@Component
struct ImageExample1 {
  private on: string = 'www.example.com';
  @State src: string = this.on;
  @State objectFit: ImageFit = ImageFit.Cover;

  build() {
    Column() {
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Start }) {
        Text('objectFit').fontSize(16).fontColor(0xcccccc).height(30)
        Row({ space: 5 } as RowOptions) {
          Image($rawfile('ic_health_heart.png'))
            .border({ width: 1 })
            .borderStyle(BorderStyle.Dashed)
            .objectFit(ImageFit.None)
            .width(110)
            .height(110)
            .overlay('None', { align: Alignment.Bottom, offset: { x: 0, y: 20 } })
          Image($rawfile('ic_health_heart.png'))
            .border({ width: 1 })
            .borderStyle(BorderStyle.Dashed)
            .objectFit(ImageFit.Auto)
            .width(110)
            .height(110)
            .overlay('Auto', { align: Alignment.Bottom, offset: { x: 0, y: 20 } })
          Image($rawfile('ic_health_heart.png'))
            .border({ width: 1 })
            .borderStyle(BorderStyle.Dashed)
            .objectFit(ImageFit.Contain)
            .width(110)
            .height(110)
            .overlay('Contain', { align: Alignment.Bottom, offset: { x: 0, y: 20 } })
        }
      }
    }
    .height(320)
    .width(360)
    .padding({ right: 10, top: 10 } as Padding)
  }
}