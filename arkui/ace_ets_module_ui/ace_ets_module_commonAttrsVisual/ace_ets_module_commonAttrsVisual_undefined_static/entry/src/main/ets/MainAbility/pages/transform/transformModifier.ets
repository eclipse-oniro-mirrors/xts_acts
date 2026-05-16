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
  Entry,
  Text,
  Column,
  Component,
  Button,
  ClickEvent,
  Row,
  AttributeModifier,
  RowAttribute,
  Image,
  $r
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import matrix4 from '@ohos.matrix4'

@Observed
export class MyRowAttributeModifier implements AttributeModifier<RowAttribute> {
  @State public isChange: boolean = true

  applyNormalAttribute(instance: RowAttribute): void {
    if (this.isChange) {
      instance.transform(matrix4.identity().rotate({
        x: 0,
        y: 0,
        z: 1,
        angle: 300
      }))
    } else {
      instance.transform(undefined)
    }
  }
}

@Entry
@Component
struct TransformModifier {
  @State modifier: MyRowAttributeModifier = new MyRowAttributeModifier();

  build() {
    Row() {
      Column() {
        Text('transform').fontSize(12).width('75%').fontColor('#DCDCDC')
        Row() {
          Image($r('app.media.startIcon')).width('500px').height('280px')
        }
        .height(300)
        .width('100%')
        .id('transformModifierTest')
        .attributeModifier(this.modifier)

        Button('点击切换Undefined').id('transformModifier').onClick((event: ClickEvent) => {
          this.modifier.isChange = !this.modifier.isChange
        })
      }
      .width(400)
    }
    .height(400)
  }
}