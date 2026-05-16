'use static';
/*
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
  Row,
  Color,
  WrappedBuilder,
  Circle,
  ContentModifier,
  wrapBuilder,
  Builder,
  CircleOptions,
  ToggleConfiguration,
  Toggle,
  ToggleType,
  SwitchStyle
} from '@ohos.arkui.component';

import { State, Link } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import promptAction from '@ohos.promptAction'
import { LevelOrder, LevelMode } from '@ohos.promptAction'

type ToggleBuilder = @Builder (config: ToggleConfiguration) => void;

class MyButtonStyle implements ContentModifier<ToggleConfiguration> {
  public selectedColor: Color = Color.White;
  lamp: string = 'string';

  constructor(selectedColor: Color, lamp: string) {
    this.selectedColor = selectedColor;
    this.lamp = lamp;
  }

  applyContent(): WrappedBuilder<ToggleBuilder> {
    return wrapBuilder(buildButton);
  }
}

@Builder
function buildButton(config: ToggleConfiguration) {
  Column() {
    Circle({ width: 150, height: 150 } as CircleOptions)
      .id('Circle')
      .fill(config.isOn ? (config.contentModifier as MyButtonStyle).selectedColor : Color.Blue)
    Row() {
      Button('蓝' + JSON.stringify((config.contentModifier as MyButtonStyle).lamp))
        .id('Toggle_blue')
        .onClick(() => {
          config.triggerChange(false);
        })
      Button('黄' + JSON.stringify((config.contentModifier as MyButtonStyle).lamp))
        .id('Toggle_yellow')
        .onClick(() => {
          config.triggerChange(true);
        })
    }
  }
}

@Entry
@Component
struct Index {
  @State contentModifier: ContentModifier<ToggleConfiguration> | undefined = new MyButtonStyle(Color.Yellow, '灯');
  @State isContentModifier: boolean = false;
  @State isSwitchStyle: boolean = false;
  @State isSwitchPointColor: boolean = false;
  @State isSelectedColor: boolean = true;
  @State isOnChange: boolean = true;
  @State message: string = 'hello';

  build() {
    Column() {
      Text(this.message)
        .id('Toggle_text')
      Toggle({ type: ToggleType.Switch, isOn: true })
        .id('Toggle')
        .enabled(true)
        .contentModifier(this.isContentModifier ? undefined : this.contentModifier)
        .switchStyle(this.isSwitchStyle ? undefined : {
          pointRadius: 15,
          trackBorderRadius: 10,
          pointColor: '#D2B48C',
          unselectedColor: Color.Pink
        } as SwitchStyle)
        .switchPointColor(this.isSwitchPointColor ? undefined : Color.Orange)
        .selectedColor(this.isSelectedColor ? undefined : '#FF0000FF')


      Toggle({ type: ToggleType.Switch, isOn: true })
        .id('Toggle2')
        .onChange(this.isOnChange ? (isOn: boolean) => {
          this.message = 'onChange'
        } : undefined)
      Row() {
        Button('isContentModifier: ' + this.isContentModifier)
          .id('Toggle_contentModifier')
          .onClick((e: ClickEvent) => {
            this.isContentModifier = !this.isContentModifier;
          })
        Button('SwitchStyleUndefined: ' + this.isSwitchStyle)
          .id('Toggle_switchStyle')
          .onClick((e: ClickEvent) => {
            this.isSwitchStyle = !this.isSwitchStyle;
          })
      }

      Row() {
        Button('isSwitchPointColor: ' + this.isSwitchPointColor)
          .id('Toggle_switchPointColor')
          .onClick((e: ClickEvent) => {
            this.isSwitchPointColor = !this.isSwitchPointColor;
          })
        Button('isSelectedColor: ' + this.isSelectedColor)
          .id('Toggle_selectedColor')
          .onClick((e: ClickEvent) => {
            this.isSelectedColor = !this.isSelectedColor;
          })
      }

      Row() {
        Button('resetText')
          .id('Toggle_resetText')
          .onClick((e: ClickEvent) => {
            this.message = 'hello';
          })
        Button('isOnChange: ' + this.isOnChange)
          .id('Toggle_onChange')
          .onClick((e: ClickEvent) => {
            this.isOnChange = !this.isOnChange;
          })
      }

    }.height('100%').width('100%')
  }
}