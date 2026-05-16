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
  Button,
  ClickEvent,
  Color,
  Column,
  Component,
  Entry,
  Margin,
  Text
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct AnimateToImmediatelyExample {
  @State widthSize: number = 250
  @State heightSize: number = 100
  @State opacitySize: number = 0
  @State text: string = ''
  private flag: boolean = true

  onDidBuild() {
    this.text = ''
  }

  build() {
    Column() {
      Text(this.text).key('animateToTest')
      Column()
        .width(this.widthSize)
        .height(this.heightSize)
        .backgroundColor(Color.Green)
        .opacity(this.opacitySize)
      Button('change size')
        .margin(30)
        .key('animateToTestBt')
        .onClick((e: ClickEvent) => {
          if (this.flag) {
            this.getUIContext().animateToImmediately({
              delay: 0,
              duration: 1000
            }, () => {
              this.opacitySize = 1
            })
            this.getUIContext().animateTo({
              delay: 1000,
              duration: 1000
            }, () => {
              this.text = 'animateToImmediately'
              this.widthSize = 150
              this.heightSize = 60
            })
          } else {
            this.getUIContext().animateToImmediately({
              delay: 0,
              duration: 1000
            }, () => {
              this.text = 'animateToImmediately'
              this.widthSize = 250
              this.heightSize = 100
            })
            this.getUIContext().animateTo({
              delay: 1000,
              duration: 1000
            }, () => {
              this.opacitySize = 0
            })
          }
          this.flag = !this.flag
        })
    }.width('100%').margin({ top: 5 } as Margin)
  }
}