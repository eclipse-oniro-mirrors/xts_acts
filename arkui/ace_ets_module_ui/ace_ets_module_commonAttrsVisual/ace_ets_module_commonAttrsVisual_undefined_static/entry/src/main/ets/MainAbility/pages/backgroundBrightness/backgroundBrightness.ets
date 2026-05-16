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

import {
  Entry,
  Text,
  Column,
  Component,
  Button,
  ClickEvent,
  BackgroundBrightnessOptions,
  Row
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
@Entry
@Component

struct BackgroundBrightnessPage{
  @State isShow: boolean | undefined = true;
  @State show: boolean | undefined = false;


  build(){
    Column(){
      Row() {
        Text('BackgroundBrightness')
      }
      .width(200)
      .height(100)
      .backgroundBrightness(this.isShow ? {
        rate:0.5,
        lightUpDegree:0.5
      } as BackgroundBrightnessOptions : undefined)
      .id('backgroundBrightnessTest')
      Button('backgroundBrightness: ')
        .id('backgroundBrightness')
        .onClick((e: ClickEvent) => {
          this.isShow = !this.isShow;
        })
    }.width(300)
    .height(300)
  }
}