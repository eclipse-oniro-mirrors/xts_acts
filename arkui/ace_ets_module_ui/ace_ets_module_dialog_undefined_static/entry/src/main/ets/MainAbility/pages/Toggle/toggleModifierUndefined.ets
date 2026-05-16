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
  ToggleAttribute,
  AttributeModifier,
  SwitchStyle
} from '@ohos.arkui.component';

import { State, Link, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import promptAction from '@ohos.promptAction'
import { LevelOrder, LevelMode } from '@ohos.promptAction'

@Observed
export class MyToggleModifier implements AttributeModifier<ToggleAttribute> {
  public isSwitchStyle: boolean = false;
  public isSwitchPointColor: boolean = false;
  public isSelectedColor: boolean = true;
  public isOnChange: boolean = true;
  public message: string = 'hello';

  applyNormalAttribute(instance: ToggleAttribute): void {
    instance
      .switchStyle(this.isSwitchStyle ? undefined : {
        pointRadius: 15,
        trackBorderRadius: 10,
        pointColor: '#D2B48C',
        unselectedColor: Color.Pink
      } as SwitchStyle)
      .switchPointColor(this.isSwitchPointColor ? undefined : Color.Orange)
      .selectedColor(this.isSelectedColor ? undefined : '#FF0000FF')
      .onChange(this.isOnChange ? (isOn: boolean) => {
        this.message = 'onChange'
      } : undefined)
  }
}


@Observed
export class MyToggleModifier2 implements AttributeModifier<ToggleAttribute> {
  public isSwitchPointColor: boolean = false;

  applyNormalAttribute(instance: ToggleAttribute): void {
    instance
      .switchPointColor(this.isSwitchPointColor ? undefined : Color.Orange)
  }
}

@Entry
@Component
struct Index {
  @State isContentModifier: boolean = false;
  @State modifier: MyToggleModifier = new MyToggleModifier()
  @State modifier2: MyToggleModifier2 = new MyToggleModifier2()

  build() {
    Column() {
      Text(this.modifier.message)
        .id('ToggleM_text')

      Toggle({ type: ToggleType.Switch, isOn: true})
        .id('ToggleM')
        .attributeModifier(this.modifier2)

      Toggle({ type: ToggleType.Switch, isOn: true })
        .id('ToggleM2')
        .attributeModifier(this.modifier)

      Row() {
        Button('isContentModifier: ' + this.isContentModifier)
          .id('ToggleM_contentModifier')
          .onClick((e: ClickEvent) => {
            this.isContentModifier = !this.isContentModifier;
          })
        Button('SwitchStyleUndefined: ' + this.modifier.isSwitchStyle)
          .id('ToggleM_switchStyle')
          .onClick((e: ClickEvent) => {
            this.modifier.isSwitchStyle = !this.modifier.isSwitchStyle;
          })
      }

      Row() {
        Button('isSwitchPointColor: ' + this.modifier2.isSwitchPointColor)
          .id('ToggleM_switchPointColor')
          .onClick((e: ClickEvent) => {
            this.modifier2.isSwitchPointColor = !this.modifier2.isSwitchPointColor;
          })
        Button('isSelectedColor: ' + this.modifier.isSelectedColor)
          .id('ToggleM_selectedColor')
          .onClick((e: ClickEvent) => {
            this.modifier.isSelectedColor = !this.modifier.isSelectedColor;
          })
      }

      Row() {
        Button('resetText')
          .id('ToggleM_resetText')
          .onClick((e: ClickEvent) => {
            this.modifier.message = 'hello';
          })
        Button('isOnChange: ' + this.modifier.isOnChange)
          .id('ToggleM_onChange')
          .onClick((e: ClickEvent) => {
            this.modifier.isOnChange = !this.modifier.isOnChange;
          })
      }
    }.height('100%').width('100%')
  }
}