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
  Circle,
  RadioAttribute,
  AttributeModifier
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

type RadioBuilder = @Builder(config: RadioConfiguration) => void;

class MyRadioStyle implements ContentModifier<RadioConfiguration> {
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
      .id('RadioM_Circle')
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

@Observed
export class MyModifier1 implements AttributeModifier<RadioAttribute> {
  public isUndefined1: boolean = true;
  public isUndefined2: boolean = true;
  public isUndefined3: boolean = true;
  public cnt: int = 0

  applyNormalAttribute(instance: RadioAttribute): void {
    instance
      .checked(this.isUndefined1 ? undefined : true)
      .radioStyle(this.isUndefined2 ? undefined : {
        checkedBackgroundColor: '#FFFF00FF'
      } as RadioStyle)
      .onChange(this.isUndefined3 ? undefined : (isChecked: boolean) => {
        this.cnt++;
      })
  }
}

@Entry
@Component
struct Index {
  @State myModifier1: MyModifier1 = new MyModifier1();

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Text(`change:${this.myModifier1.cnt}`)
        .id('RadioM_text')
      Row({ space: 5 } as RowOptions) {
        Radio({ value: 'Radio1', group: 'radioGroup' })
          .id('RadioM_1')
          .attributeModifier(this.myModifier1)
        Radio({ value: 'Radio2', group: 'radioGroup' })
          .id('RadioM_2')
      }

      Row() {
        Button('btn1 : ' + this.myModifier1.isUndefined1)
          .id('RadioM_btn1')
          .onClick((e: ClickEvent) => {
            this.myModifier1.isUndefined1 = !this.myModifier1.isUndefined1
          })
        Button('btn2 : ' + this.myModifier1.isUndefined2)
          .id('RadioM_btn2')
          .onClick((e: ClickEvent) => {
            this.myModifier1.isUndefined2 = !this.myModifier1.isUndefined2
          })
      }

      Row() {
        Button('btn3 : ' + this.myModifier1.isUndefined3)
          .id('RadioM_btn3')
          .onClick((e: ClickEvent) => {
            this.myModifier1.isUndefined3 = !this.myModifier1.isUndefined3
          })
      }
    }
    .width('100%').height('100%')
  }
}