'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
  Column,
  Component,
  Button,
  ClickEvent,
  ForEach,
  Text,
  Row,
  List,
  ListItem,
  Color,HorizontalAlign,
  FlexAlign,ComponentV2,TabsController,Tabs
} from '@ohos.arkui.component'
import {
  State,
  Watch,
  Link,Local,Computed,Monitor,IMonitor,
  StorageLink,ObservedV2,Trace,Param,Event
} from '@ohos.arkui.stateManagement'

@Entry
@ComponentV2
struct CompuutedMonitor {
  @Local celsius: number = 20;
  computedText1: number = 0;
  computedText2: number = 0;
  @Local showComputedText2: number = 0;
  @Local showComputedText1: number = 0;

  @Computed
  get fahrenheit(): number {
    this.computedText1 += 1;
    return this.celsius * 9 / 5 + 32; // C -> F
  }

  @Computed
  get kelvin(): number {
    this.computedText2 += 1;
    return (this.fahrenheit - 32) * 5 / 9 + 273.15; // F -> K
  }

  @Monitor(['kelvin'])
  onKelvinMonitor(mon: IMonitor) {
    console.log('kelvin changed from ' + mon.value()?.before + ' to ' + mon.value()?.now);
  }

  build() {
    Column() {
      Row() {
        Button('-')
          .width('10%')
          .height('3%')
          .fontSize(9)
          .onClick(() => {
            this.celsius--;
          })
          .id('CompuutedMonitorButton1')

        Text(`Celsius ${this.celsius.toFixed(1)}`).id('CompuutedMonitorText1')
          .height('3%')
          .fontSize(9)

        Button('+')
          .width('10%')
          .height('3%')
          .fontSize(9)
          .onClick(() => {
            this.celsius++;
          })
          .id('CompuutedMonitorButton2')
      }

      Text(`Fahrenheit ${this.fahrenheit.toFixed(2)}`).id('CompuutedMonitorText2')
        .height('3%')
        .fontSize(9)
      Text(`Kelvin ${this.kelvin.toFixed(2)}`).id('CompuutedMonitorText3')
        .height('3%')
        .fontSize(9)
      Text(this.showComputedText1.toString()).id('CompuutedMonitorText4')
        .height('3%')
        .fontSize(9)
      Text(this.showComputedText2.toString()).id('CompuutedMonitorText5')
        .height('3%')
        .fontSize(9)
      Button('showComputedText').onClick(() => {
        this.showComputedText2 = this.computedText2;
        this.showComputedText1 = this.computedText1;
      }).id('showComputedText')

    }
    .width('100%')
  }
}