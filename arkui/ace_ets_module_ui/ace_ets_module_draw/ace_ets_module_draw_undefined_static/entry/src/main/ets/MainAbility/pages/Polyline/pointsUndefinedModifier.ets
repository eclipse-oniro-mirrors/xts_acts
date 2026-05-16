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
  Entry, Text, Column, Component, Button, ClickEvent, Polyline, Row, Color, Resource, AttributeModifier,
  PolylineAttribute
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import { Observed } from '@ohos.arkui.stateManagement'

@Observed
export class MyModifier implements AttributeModifier<PolylineAttribute> {
  public isPoints: boolean = false;
  applyNormalAttribute(instance: PolylineAttribute): void {
    instance
      .points(this.isPoints ? [[20.0, 0.0], [0.0, 100.0], [100.0, 90.0]] as
      Array<[String|Double|Resource, String|Double|Resource]> : undefined)
  }
}

@Entry
@Component
struct Points1 {
  @State modifier: MyModifier = new MyModifier();

  build() {
    Column() {
      Text('action points')
      Polyline()
        .id('polyline_action_modifier')
        .width('90%')
        .height('30%')
        .fillOpacity(0)
        .stroke(Color.Red)
        .strokeWidth(8)
        .attributeModifier(this.modifier)

      Row() {
        Button('0' + this.modifier.isPoints).onClick((event: ClickEvent) => {
          this.modifier.isPoints = !this.modifier.isPoints;
        }).margin(5).id('points_action_modifier')
      }
    }
    .width('100%')
    .height('100%')
  }
}