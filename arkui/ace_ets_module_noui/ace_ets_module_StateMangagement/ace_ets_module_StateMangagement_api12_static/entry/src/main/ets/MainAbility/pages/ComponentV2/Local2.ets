'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
//支持自定义组件生命周期回调
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
  Color,FontWeight,
  FlexAlign,ComponentV2,TabsController,Tabs
} from '@ohos.arkui.component'
import {
  State,
  Watch,
  Link,Local,
  StorageLink,ObservedV2,Trace,Param,Event
} from '@ohos.arkui.stateManagement'
@Entry
@ComponentV2
struct pageLocal {
  @Local textColor: Color = Color.Black;
  @Local num: number = 0

  onPageShow() {
    this.num = 5
  }

  onPageHide() {
    console.log('page onPageHide');
  }

  onBackPress() { // 不设置返回值按照false处理
    this.textColor = Color.Grey
    this.num = 0
    return false
  }

  aboutToAppear() {
    this.textColor = Color.Blue
  }

  build() {
    Column() {
      Text(`num: ${this.num}`).id('num_text')
        .fontSize(9)
        .fontWeight(FontWeight.Bold)
        .fontColor(this.textColor)
        .onClick(():void => {
          this.num += 5
        })
    }
    .width('100%')
  }
}