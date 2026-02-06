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
import { Entry, Column, Component, Margin, Builder,Row,ToggleConfiguration,
  TimePicker, Toggle, TimePickerFormat,ClickEvent,
  Text, TextPicker,Color,Button,FontWeight,Color,ToggleType,ColumnOptions
,ContentModifier,ToggleConfiguration,WrappedBuilder,wrapBuilder,CustomBuilderT} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

class MySwitchStyle implements ContentModifier<ToggleConfiguration> {
  constructor() {}
  applyContent(): WrappedBuilder<CustomBuilderT<ToggleConfiguration>>{
    return wrapBuilder<CustomBuilderT<ToggleConfiguration>>(buildSwitch)
  }
}
@Builder function buildSwitch(config: ToggleConfiguration) {
  Column({ space: 10 } as ColumnOptions) {
    Text(String(config.isOn)).id('ToggleContentModifier_text')
    Row() {
      Button('关闭')
        .id('ToggleContentModifier_false')
        .onClick((e:ClickEvent) => {
          config.triggerChange(false);
        })
      Button('开启')
        .id('ToggleContentModifier_true')
        .onClick((e:ClickEvent) => {
          config.triggerChange(true);
        })
    }
  }
}

@Entry
@Component
struct ToggleContentModifierTest {
  build() {
    Column({ space: 50 } as ColumnOptions) {
      Toggle({ type: ToggleType.Switch, isOn: false})
        .contentModifier(new MySwitchStyle())
        .onChange((isOn: boolean):void => {
          console.info('Switch Log:' + isOn)
        })
    }.height('100%').width('100%')
  }
}