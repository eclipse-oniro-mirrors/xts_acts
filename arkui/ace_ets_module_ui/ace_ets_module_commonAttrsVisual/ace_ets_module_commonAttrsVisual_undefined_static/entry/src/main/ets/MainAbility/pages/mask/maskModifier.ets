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
  $r,
  Color,
  ProgressMask,
  Image,
  AttributeModifier,
  ImageAttribute,
  Row
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
export class MyMaskModifier implements AttributeModifier<ImageAttribute> {
  public isChange: boolean = true;

  applyNormalAttribute(instance: ImageAttribute): void {
    if (this.isChange) {
      instance.mask(new ProgressMask(10.0, 100.0, Color.Gray))
    } else {
      instance.mask(undefined)
    }
  }
}

@Entry
@Component
struct MaskModifierTest {
  @State modifier: MyMaskModifier = new MyMaskModifier();
  build() {
    Row() {
      Column() {
        Text('mask').fontSize(12).width('75%').fontColor('#DCDCDC')
        Image($r('app.media.startIcon'))
          .width('500px').height('280px')
          .id('maskModifierTest')
          .attributeModifier(this.modifier)
          .height('100%')
          .width('100%')
        Button('点击切换Undefined').id('maskModifier').onClick((event: ClickEvent) => {
          this.modifier.isChange = !this.modifier.isChange
        })
      }
      .width(400)
    }
    .height(400)
  }
}