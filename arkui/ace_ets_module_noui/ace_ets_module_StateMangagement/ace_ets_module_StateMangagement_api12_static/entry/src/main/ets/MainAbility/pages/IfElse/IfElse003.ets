'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
  ClickEvent,
  ForEach,
  Text,
  Row,
  List,
  ListItem,
  Color,
  FlexAlign
} from '@ohos.arkui.component'
import {
  State,
  Watch,
  Link,
  StorageLink
} from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
// 003 嵌套
@Entry
@Component
struct IfElse003 {
  @State one: boolean = false;
  @State two: boolean = false;
  aboutToAppear() {
    let uiContext = this.getUIContext();
    try {
      let router = uiContext.getRouter();
      AppStorage.setOrCreate<Router>('IfElse003', router);
    } catch (error) {
      console.log('error ' + error);
    }
  }
  build() {
    Column() {
      Column() {
        Text('if/else嵌套，不同的分支显示不同的颜色')
          .fontSize(9)
          .fontColor(Color.Gray)
        Row() {
          Button('改变状态1')
            .id('btn_1')
            .onClick((e: ClickEvent) => {
              this.one = !this.one;
            })
          Button('改变状态2')
            .id('btn_2')
            .onClick((e: ClickEvent) => {
              this.two = !this.two;
            })
        }
        Column() {
          if (this.one) {
            Text('状态1为真')
              .id('text_1')
              .fontSize(9)
              .backgroundColor('#aaffaa')
            if (this.two) {
              Text('状态1为真，状态2为真')
                .id('text_11')
                .fontSize(9)
                .backgroundColor('#00aaaa')
            } else {
              Text('状态1为真，状态2为假')
                .id('text_12')
                .fontSize(9)
                .backgroundColor('#aaaaff')
            }
          } else {
            Text('状态1为假')
              .id('text_2')
              .fontSize(9)
              .backgroundColor('#ffaaaa')
            if (this.two) {
              Text('状态1为假，状态2为真')
                .id('text_21')
                .fontSize(9)
                .backgroundColor('#00aaaa')
            } else {
              Text('状态1为假，状态2为假')
                .id('text_22')
                .fontSize(9)
                .backgroundColor('#aaaaff')
            }
          }
        }
      }
      .width('100%')
      .border({ width: 1 })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}