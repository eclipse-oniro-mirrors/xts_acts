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
import { Entry, Column, Component, Margin, Row,TimePicker, Toggle, TimePickerFormat,ClickEvent,
  Text, TextPicker,Color,Button,FontWeight,Color,ToggleType,ColumnOptions,ToggleConfiguration } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct ToggleSwitchStyleTest {
  @State text:string = ''
  build() {
    Column({ space: 10 } as ColumnOptions) {
      Toggle({ type: ToggleType.Switch, isOn: false })
        .id('TogglePointColor_toggle')
        .switchStyle({
          pointRadius: 15,
          trackBorderRadius: 10,
          pointColor: '#FF00FF00',
          unselectedColor: '#FFFF0000' })

    }.width('100%')
  }
}