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
  AdaptiveColor,
  Entry,
  BlurStyle,
  Column,
  Component,
  Button,
  ClickEvent,
  AttributeModifier,
  CommonAttribute,
  Color,
  Image,
  ThemeColorMode,
  $r
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
export class MyBackgroundBlurStyleModifier implements AttributeModifier<CommonAttribute> {
  public isChange: boolean = true;

  applyNormalAttribute(instance: CommonAttribute): void {
    if (this.isChange) {
      instance.backgroundBlurStyle(BlurStyle.Thin,
        { colorMode: ThemeColorMode.LIGHT, adaptiveColor: AdaptiveColor.DEFAULT, scale: 1.0 },
        { disableSystemAdaptation: true })
    } else {
      instance.backgroundBlurStyle(undefined, undefined, undefined)
    }
  }
}

@Entry
@Component
struct BackgroundBlurStyleModifierPage {
  @State isChange: boolean = true
  @State modifier: MyBackgroundBlurStyleModifier = new MyBackgroundBlurStyleModifier();

  build() {
    Column() {
      Image($r('app.media.startIcon'))
        .width(150)
        .height(150)
        .id('backgroundBlurStyleModifierTest')
        .attributeModifier(this.modifier)
      Button('点击切换Undefined').id('backgroundBlurStyleModifier').onClick((event: ClickEvent) => {
        this.modifier.isChange = !this.modifier.isChange
      })
    }
  }
}