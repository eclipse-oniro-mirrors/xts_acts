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
  ClickEvent
} from '@ohos.arkui.component'
@Entry
@Component

struct LightUpEffectPage{
  @State isShow: boolean | undefined = true;

  build(){
    Column(){
      Text('This is the text content with letterSpacing 0.')
        .letterSpacing(0)
        .fontSize(12)
        .border({ width: 1 })
        .padding(10)
        .width('50%')
        .lightUpEffect(this.isShow ? 0.6 : undefined)
        .id('lightUpEffectTest')
      Button('lightUpEffect: ')
        .id('lightUpEffect')
        .onClick((e: ClickEvent) => {
          this.isShow = !this.isShow;
        })
    }.width(300)
    .height(300)
  }
}