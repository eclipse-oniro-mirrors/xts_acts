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
  LinearGradientBlurOptions,
  CommonAttribute,
  AttributeModifier,
  Image,
  $r,
  GradientDirection
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
export class MyLinearGradientBlurModifier implements AttributeModifier<CommonAttribute> {
  public isChange: boolean = true;

  applyNormalAttribute(instance: CommonAttribute): void {
    if (this.isChange) {
      instance.linearGradientBlur(60.0, {
        fractionStops: [[0, 0], [0, 0.33], [1, 0.66], [1, 1]],
        direction: GradientDirection.Bottom
      } as LinearGradientBlurOptions)
    } else {
      instance.linearGradientBlur(undefined, {
        fractionStops: [[0, 4], [0, 0.8], [2, 0.66], [1, 5]],
        direction: GradientDirection.Bottom
      } as LinearGradientBlurOptions)
    }
  }
}

@Entry
@Component
struct LinearGradientBlurModifier {
  @State isChange: boolean = true
  @State modifier: MyLinearGradientBlurModifier = new MyLinearGradientBlurModifier();

  build() {
    Column() {
      Image($r('app.media.startIcon'))
        .width(150)
        .height(150)
        .id('linearGradientBlurModifierTest')
        .attributeModifier(this.modifier)
      Button('点击切换Undefined').id('linearGradientBlurModifier').onClick((event: ClickEvent) => {
        this.modifier.isChange = !this.modifier.isChange
      })
    }
  }
}