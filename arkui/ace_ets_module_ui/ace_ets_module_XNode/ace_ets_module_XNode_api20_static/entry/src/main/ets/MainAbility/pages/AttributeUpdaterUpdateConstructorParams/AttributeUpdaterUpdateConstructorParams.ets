'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
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
  TextAttribute,
  ButtonAttribute,
  Row,
  TextAlign
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
// 自定义Text组件的AttributeUpdater
import { AttributeUpdater } from '@ohos.arkui.modifier';

export class MyTextModifier extends AttributeUpdater<TextAttribute> {
  initializeModifier(instance: TextAttribute) {
  }
}

@Entry
@Component
struct AttributeUpdaterUpdateConstructorParams {
  private modifier: MyTextModifier = new MyTextModifier();

  build() {
    Row() {
      Column() {
        Text('Initialize')
          .id('text_update_constructor_params')
          .attributeModifier(this.modifier)
          .fontSize(14)
          .border({ width: 1 })
          .textAlign(TextAlign.Center)
          .lineHeight(20)
          .width(50)
          .height(30)
          .backgroundColor('#fff7f7f7')
          .onClick(() => {
            this.modifier.updateConstructorParams('Updated');
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}