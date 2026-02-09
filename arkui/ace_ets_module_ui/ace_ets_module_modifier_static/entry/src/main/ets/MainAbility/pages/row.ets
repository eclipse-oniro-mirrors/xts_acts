'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { Entry,Component,RowAttribute, Column, Button, VerticalAlign, FlexAlign, ColumnOptions, ClickEvent, Row, Margin
} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,
} from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { RowModifier } from "@ohos.arkui.modifier";

class CustomModifier extends RowModifier {
  applyNormalAttribute(instance: RowAttribute): void {
    // super.applyNormalAttribute?.(instance);
  }

  onChange1():void {
    this.alignItems(VerticalAlign.Top)
  }
}

@Entry
@Component
struct RowExample {
  private arr: number[] = new Array<number>(0, 1, 2, 3, 4, 5, 6, 7)
  @State customModifier: RowModifier = new CustomModifier()
    .alignItems(VerticalAlign.Center)
    .justifyContent(FlexAlign.Start)

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Button("change value").onClick((e: ClickEvent) => {
        (this.customModifier as CustomModifier).onChange1();
      }).key("changeButton")

      Row() {
      }
      .attributeModifier(this.customModifier as CustomModifier)
      .key('row')
    }
    .margin({ top: 5 } as Margin)
  }
}