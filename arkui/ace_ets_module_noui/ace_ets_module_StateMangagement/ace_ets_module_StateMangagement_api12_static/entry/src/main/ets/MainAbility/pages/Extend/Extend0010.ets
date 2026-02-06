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
//001 测试：Extend样式组合复用
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
  DataChangeListener,
  DataOperation,
  LazyForEach,
  IDataSource,
  DataOperationType,
  Color,
  TextAttribute,
  FontStyle
} from '@ohos.arkui.component'
import {
  State,
  Watch,
  Link,
  StorageLink,
} from '@ohos.arkui.stateManagement'

// @Extend(Text)
// function pictureRendering(weightValue: number, color: Color) {
//   .fontStyle(FontStyle.Italic)
//   .fontWeight(weightValue)
//   .backgroundColor(color)
// }

function pictureRendering(this: TextAttribute, weightValue:int, color:Color) {
  this.fontStyle(FontStyle.Italic)
  this.fontWeight(weightValue)
  this.backgroundColor(color)
  return this;
}

@Entry
@Component
struct FancyUse {
  @State label: string = 'Hello World'

  build() {
    Row() {
      Text(`${this.label}`)
        .id('tv_extend0010Id')
        .pictureRendering(100, Color.Blue)
      Text(`${this.label}`)
        .id('tv_extend0020Id')
        .pictureRendering(200, Color.Pink)
      Text(`${this.label}`)
        .id('tv_extend0030Id')
        .pictureRendering(300, Color.Orange)
    }
  }
}
