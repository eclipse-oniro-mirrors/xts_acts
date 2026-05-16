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
  OutlineStyle,
  AttributeModifier,
  Image,
  $r,
  OutlineOptions,
  Color,
  Row
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
export class MyOutlineColorModifier implements AttributeModifier<CommonAttribute> {
  public isChange: boolean = true;

  applyNormalAttribute(instance: CommonAttribute): void {
    if (this.isChange) {
      instance.outlineColor('#FF0000')
    } else {
      instance.outlineColor(undefined)
    }
  }
}

@Entry
@Component
struct OutlineColorModifier {
  @State isChange: boolean = true
  @State modifier: MyOutlineColorModifier = new MyOutlineColorModifier();

  build() {
    Column() {
      Row() {
        Image($r('app.media.startIcon'))
          .width(150)
          .height(150)
          .id('outlineColorModifierTest')
          .outline({
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
          .attributeModifier(this.modifier)
        Button('点击切换Undefined').id('outlineColorModifier').onClick((event: ClickEvent) => {
          this.modifier.isChange = !this.modifier.isChange
        })
      }

      Row() {
        Image($r('app.media.startIcon'))
          .width(150)
          .height(150)
          .id('outlineColorModifierTestUndefined')
          .outline({
            width: {
              left: 3,
              right: 6,
              top: 10,
              bottom: 15
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
      }
    }
    .width('100%')
    .height('100%')
  }
}