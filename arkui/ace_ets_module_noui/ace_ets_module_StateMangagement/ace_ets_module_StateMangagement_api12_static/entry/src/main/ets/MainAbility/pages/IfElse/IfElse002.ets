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
  Color,HorizontalAlign,
  FlexAlign,ComponentV2,TabsController,Tabs
} from '@ohos.arkui.component'
import {
  State,
  Watch,
  Link,Local,
  StorageLink,ObservedV2,Trace,Param,Event
} from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
// 002 @State状态变量
@Entry
@Component
struct IfElse002 {
  @State age: number = 15;
  @State val: number = 0;
  aboutToAppear() {
    let uiContext = this.getUIContext();
    try {
      let router = uiContext.getRouter();
      AppStorage.setOrCreate<Router>('IfElse002', router);
    } catch (error) {
      console.log('error ' + error);
    }
  }
  build() {
    Column() {
      Column() {
        Text('点击按钮age+1，age大于20之后文字变化')
          .fontSize(9)
          .fontColor(Color.Gray)
        Row() {
          Button('age + 1')
            .id('age_btn')
            .onClick((e: ClickEvent) => {
              this.age++;
            })
          if (this.age < 20) {
            Text(`age: ${this.age}, It's a boy.`)
              .id('age_text_1')
              .fontSize(9)
          } else {
            Text(`age: ${this.age}, It's a man.`)
              .id('age_text_2')
              .fontSize(9)
          }
        }
      }
      .width('100%')
      .border({ width: 1 })

      Column() {
        Text('点击按钮val+1，背景色根据数字大小变化')
          .fontSize(9)
          .fontColor(Color.Gray)
        Row() {
          Button('val + 1')
            .id('val_btn')
            .onClick((e: ClickEvent) => {
              this.val++;
            })
          if (this.val < 2) {
            Text(String(this.val))
              .id('val_text_1')
              .backgroundColor('#00aaaa')
              .fontSize(9)
          } else if (this.val < 5) {
            Text(String(this.val))
              .id('val_text_2')
              .backgroundColor('#aaaaff')
              .fontSize(9)
          } else if (this.val < 10) {
            Text(String(this.val))
              .id('val_text_3')
              .backgroundColor('#ffaaaa')
              .fontSize(9)
          } else {
            Text('out of range!')
              .id('val_text_4')
              .fontSize(9)
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