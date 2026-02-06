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

import { Entry, Component, AttributeModifier, ContainerSpanAttribute, Column, TextArea, Text, ContainerSpan, $r,
  ColumnOptions, ImageSpan, ContainerSpan } from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';

class ContainerSpanAttributeModifier implements AttributeModifier<ContainerSpanAttribute> {
  applyNormalAttribute(instance: ContainerSpanAttribute): void {
    instance.textBackgroundStyle({ color: "#7F007DFF", radius: {topLeft: "12vp", topRight: "12vp", bottomLeft:"12vp", bottomRight:"12vp"}})
  }
}

@Entry
@Component
struct ContainerSpanModifier1 {
  @State value: string = 'init'
  @State modifier: ContainerSpanAttributeModifier = new ContainerSpanAttributeModifier();

  aboutToAppear(): void {
    this.value = "ContainerSpanModifier initialized";
  }

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Text(){
        ContainerSpan() {
          ImageSpan($r('app.media.icon'))
            .id('ContainerSpanModifier_get_radius')
        }
        .attributeModifier(this.modifier)
      }.height('20%')

      TextArea({ text: this.value })
        .id('ContainerSpanModifier_get_type')
        .height('10%')
    }
  }
}