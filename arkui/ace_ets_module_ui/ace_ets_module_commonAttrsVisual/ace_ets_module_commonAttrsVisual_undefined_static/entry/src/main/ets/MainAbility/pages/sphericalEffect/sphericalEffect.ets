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
  Column,
  Component,
  Button,
  ClickEvent,
  Color,
  TextInput,
  EnterKeyType
} from '@ohos.arkui.component'

@Entry
@Component
struct SphericalEffectPage {
  @State isShow: boolean | undefined = true;

  build() {
    Column() {
      TextInput({ placeholder: '请输入变化范围百分比（[0%,100%]）' })
        .width('50%')
        .height(35)
        .enterKeyType(EnterKeyType.Done)
        .caretColor(Color.Red)
        .placeholderColor(Color.Blue)
        .sphericalEffect(this.isShow ? 0.5 : undefined)
        .id('sphericalEffectTest')
      Button('sphericalEffect: ')
        .id('sphericalEffect')
        .onClick((e: ClickEvent) => {
          this.isShow = !this.isShow;
        })
    }.width(300)
    .height(300)
  }
}