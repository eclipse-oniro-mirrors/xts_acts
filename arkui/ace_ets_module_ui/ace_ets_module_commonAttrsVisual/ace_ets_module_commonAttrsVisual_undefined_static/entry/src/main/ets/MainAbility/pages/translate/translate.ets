'use static'
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { State } from '@ohos.arkui.stateManagement'
import {
  Entry,
  Text,
  Column,
  Component,
  Button,
  ClickEvent,
  Row,
  TranslateOptions,
  Margin
} from '@ohos.arkui.component'
import matrix4 from '@ohos.matrix4'

@Entry
@Component
struct TranslatePage {
  @State isShow: boolean | undefined = true;

  build() {
    Column() {
      Text('translate').width('90%').fontColor('#CCCCCC').padding(10).fontSize(14)
      Row()
        .translate(this.isShow ? { x: 100, y: 10, z: 50 } as TranslateOptions : undefined)
        .width(100)
        .height(100)
        .backgroundColor('#AFEEEE')
        .margin({ bottom: 10 } as Margin)
        .id('translateTest')
      Button('translate: ')
        .id('translate')
        .onClick((e: ClickEvent) => {
          this.isShow = !this.isShow;
        })
    }.width(300)
    .height(300)
  }
}