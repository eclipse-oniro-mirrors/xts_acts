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
  CommonAttribute,
  AttributeModifier,
  Image,
  $r
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
export class MySepiaModifier implements AttributeModifier<CommonAttribute> {
  public isChange: boolean = true;

  applyNormalAttribute(instance: CommonAttribute): void {
    if (this.isChange) {
      instance.sepia(0.8)
    } else {
      instance.sepia(undefined)
    }
  }
}

@Entry
@Component
struct SepiaModifier {
  @State isChange: boolean = true
  @State modifier: MySepiaModifier = new MySepiaModifier();

  build() {
    Column() {
      Image($r('app.media.startIcon'))
        .width(200)
        .height(200)
        .id('sepiaModifierTest')
        .attributeModifier(this.modifier)
      Button('点击切换Undefined').id('sepiaModifier').onClick((event: ClickEvent) => {
        this.modifier.isChange = !this.modifier.isChange
      })
    }
  }
}