'use static';
/*
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
  Component,
  Column,
  Flex,
  Row,
  Text,
  Color,
  ListScroller,
  Builder,
  Margin,
  List,
  VisibleListContentInfo,
  ScrollState,
  Button,
  ClickEvent,
  Scroller,
  Padding,
  ListItem,
  StickyStyle
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct listItem_testcase {
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9] as number[]
  @State editFlag: boolean = false
  @State active: boolean = false

  build() {
    Column() {
      Column() {
        List() {
          ListItem() {
            Text('sticky:None , item1111')
              .width('100%')
              .height(40)
              .fontSize(12)
          }
          .key('listitem')

          ListItem() {
            Text('sticky:Normal , item2222')
              .width('100%')
              .height(40)
              .fontSize(12)
          }
          .key('listitem2')

          ListItem() {
            Text('sticky:Opacity , item3333')
              .width('100%')
              .height(40)
              .fontSize(12)
          }
          .key('listitem3')

          ListItem() {
            Text('sticky:Opacity , item4444')
              .width('100%')
              .height(40)
              .fontSize(12)
          }
          .key('listitem4')
        }
      }.width('100%').height('100%').backgroundColor(0xDCDCDC).padding({ top: 5 } as Padding)
    }.width(300)
    .height(300)
    .borderColor(Color.Pink)
    .borderWidth(2)
  }
}

