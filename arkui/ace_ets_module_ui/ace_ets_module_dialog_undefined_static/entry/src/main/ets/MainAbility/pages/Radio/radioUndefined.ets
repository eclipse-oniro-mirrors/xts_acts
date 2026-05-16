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
  ColumnOptions,
  Component,
  Button,
  ClickEvent,
  Color,
  Row,
  $r,
  Radio,
  RadioStyle,
  RowOptions,
  Builder,
  RadioConfiguration,
  ContentModifier,
  WrappedBuilder,
  wrapBuilder,
  Circle
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

type RadioBuilder = @Builder(config:RadioConfiguration) => void;

export class MyRadioStyle implements ContentModifier<RadioConfiguration> {
  public selectedColor: Color = Color.Black;

  constructor(colorType: Color) {
    this.selectedColor = colorType;
  }

  applyContent(): WrappedBuilder<RadioBuilder> {
    return wrapBuilder(buildRadio);
  }
}

@Builder
function buildRadio(config: RadioConfiguration) {
  Row({ space: 10 } as RowOptions) {
    Circle({ width: 50, height: 50 })
      .id('Radio_Circle')
      .stroke(Color.Black)
      .fill(config.checked ? (config.contentModifier as MyRadioStyle).selectedColor : Color.White)
    Button(config.checked ? 'off' : 'on')
      .width(100)
      .backgroundColor('#2787D9')
      .onClick(() => {
        if (config.checked) {
          config.triggerChange(false);
        } else {
          config.triggerChange(true);
        }
      })
  }
}


@Entry
@Component
struct Index {
  @State isUndefined1: boolean = true;
  @State isUndefined2: boolean = true;
  @State isUndefined3: boolean = true;
  @State isUndefined4: boolean = true;
  @State cnt: int = 0
  @State myRadioStyle: MyRadioStyle = new MyRadioStyle(Color.Red);

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Text(`change:${this.cnt}`)
        .id('Radio_text')
      Row({ space: 5 } as RowOptions) {
        Radio({ value: 'Radio1', group: 'radioGroup' })
          .id('Radio_1')
          .checked(this.isUndefined1 ? undefined : true)
          .radioStyle(this.isUndefined2 ? undefined : {
            checkedBackgroundColor: '#FFFF00FF'
          } as RadioStyle)
          .onChange(this.isUndefined3 ? undefined : (isChecked: boolean) => {
              this.cnt++;
          })
        Radio({ value: 'Radio2', group: 'radioGroup' })
          .id('Radio_2')
          .contentModifier(this.isUndefined4 ? undefined :this.myRadioStyle)
      }

      Row() {
        Button('btn1 : ' + this.isUndefined1)
          .id('Radio_btn1')
          .onClick((e: ClickEvent) => {
            this.isUndefined1 = !this.isUndefined1
          })
        Button('btn2 : ' + this.isUndefined2)
          .id('Radio_btn2')
          .onClick((e: ClickEvent) => {
            this.isUndefined2 = !this.isUndefined2
          })
      }
      Row(){
        Button('btn3 : ' + this.isUndefined3)
          .id('Radio_btn3')
          .onClick((e: ClickEvent) => {
            this.isUndefined3 = !this.isUndefined3
          })
        Button('btn4 : ' + this.isUndefined4)
          .id('Radio_btn4')
          .onClick((e: ClickEvent) => {
            this.isUndefined4 = !this.isUndefined4
          })
      }
    }
    .width('100%').height('100%')
  }
}