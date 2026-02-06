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
  TextOverflow
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { ClickEvent } from '@ohos.arkui.component';
import { UIContext } from '@ohos.arkui.UIContext';

@Entry
@Component
struct ImageExample1 {
  @State top: number = 10
  @State bottom: number = 10
  @State left: number = 10
  @State right: number = 10

  build() {
    Column() {
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Auto }) {
        Text('').height('10%').textAlign(TextAlign.Center)
        Text('' + this.top).id('top_test').height('5%').textAlign(TextAlign.Center)
        Text('' + this.bottom).id('bottom_test').height('5%').textAlign(TextAlign.Center)
        Text('' + this.left).id('left_test').height('5%').textAlign(TextAlign.Center)
        Text('' + this.right).id('right_test').height('5%').textAlign(TextAlign.Center)
        Row() {
          // 加载png格式图片
          Image($r('app.media.icon'))
            .width('20%')
            .height('20%')
            .resizable({
              slice: {
                top: this.top,
                bottom: this.bottom,
                left: this.left,
                right: this.right
              }
            })
            .overlay('png', { align: Alignment.Bottom, offset: { x: 0, y: 20 } })
        }

        Row() {
          Button('changeTop').onClick((e: ClickEvent) => {
            this.top = 30
          }).id('changeTop').width('40%')

          Button('changeBottom').onClick((e: ClickEvent) => {
            this.bottom = 0
          }).id('changeBottom').width('40%')
        }.height('10%')

        Row() {
          Button('changeleft').onClick((e: ClickEvent) => {
            this.left = 30
          }).id('changeleft').width('40%')

          Button('changeright').onClick((e: ClickEvent) => {
            this.right = 0
          }).id('changeright').width('40%')
        }.height('10%')

      }
    }.height('100%').width(360)
  }
}