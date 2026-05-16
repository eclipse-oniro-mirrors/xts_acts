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
  OutlineOptions,
  CommonAttribute,
  AttributeModifier,
  Image,
  $r,
  OutlineStyle,
  Color
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
export class MyOutlineModifier implements AttributeModifier<CommonAttribute> {
  public isChange: boolean = true;

  applyNormalAttribute(instance: CommonAttribute): void {
    if (this.isChange) {
      instance.outline({
        width: {
          left: 3,
          right: 6,
          top: 10,
          bottom: 15
        },
        color: {
          left: '#e3bbbb',
          right: Color.Blue,
          top: Color.Red,
          bottom: Color.Green
        },
        radius: {
          topLeft: 10,
          topRight: 20,
          bottomLeft: 40,
          bottomRight: 80
        },
        style: {
          left: OutlineStyle.DOTTED,
          right: OutlineStyle.DOTTED,
          top: OutlineStyle.SOLID,
          bottom: OutlineStyle.DASHED
        }
      } as OutlineOptions)
    } else {
      instance.outline(undefined)
    }
  }
}

@Entry
@Component
struct OutlineModifier {
  @State isChange: boolean = true
  @State modifier: MyOutlineModifier = new MyOutlineModifier();

  build() {
    Column() {
      Image($r('app.media.startIcon'))
        .width(150)
        .height(150)
        .id('outlineModifierTest')
        .attributeModifier(this.modifier)
      Button('点击切换Undefined').id('outlineModifier').onClick((event: ClickEvent) => {
        this.modifier.isChange = !this.modifier.isChange
      })
    }
  }
}