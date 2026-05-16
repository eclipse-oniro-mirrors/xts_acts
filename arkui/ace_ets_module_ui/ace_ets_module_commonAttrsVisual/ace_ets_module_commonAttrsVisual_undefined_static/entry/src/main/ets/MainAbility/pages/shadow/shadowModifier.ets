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
  Column,
  Component,
  Button,
  ClickEvent,
  Image,
  ShadowOptions,
  $r,
  Color,
  ShadowType,
  AttributeModifier,
  ImageAttribute,
  Row
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
export class MyImageAttributeModifier implements AttributeModifier<ImageAttribute> {
  @State public isChange: boolean = true

  applyNormalAttribute(instance: ImageAttribute): void {
    if (this.isChange) {
      instance.shadow({
        radius: 10,
        type: ShadowType.BLUR,
        color: Color.Blue,
        offsetX: 20,
        offsetY: 20,
        fill: true
      } as ShadowOptions)
    } else {
      instance.shadow(undefined)
    }
  }
}

@Entry
@Component
struct ShadowModifier {
  @State isChange: boolean = true
  @State modifier: MyImageAttributeModifier = new MyImageAttributeModifier();

  build() {
    Row() {
      Column() {
        Image($r('app.media.startIcon'))
          .width('90%')
          .height(300)
          .id('shadowModifierTest')
          .attributeModifier(this.modifier)

        Button('点击切换Undefined').id('shadowModifier').onClick((event: ClickEvent) => {
          this.modifier.isChange = !this.modifier.isChange
        })
      }
      .width(400)
    }
    .height(400)
  }
}