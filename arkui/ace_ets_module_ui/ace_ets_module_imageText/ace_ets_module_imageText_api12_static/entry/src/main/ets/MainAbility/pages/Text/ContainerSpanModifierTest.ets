'use static';
/*
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
 
import { ContainerSpanModifier } from '@ohos.arkui.modifier';
import {
  Entry, Component,ImageSpanAlignment,HorizontalAlign,ContainerSpanAttribute,
  Column, Color, Span, Text, ContainerSpan, ImageSpan, TextBackgroundStyle, $r
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

class MyContainerSpanModifier extends ContainerSpanModifier {
  applyNormalAttribute(instance: ContainerSpanAttribute): void {
    instance
      .textBackgroundStyle({color:Color.Red,radius:10} as 	TextBackgroundStyle)

  }
}
@Entry
@Component
struct ContainerSpanModifierTest {
  @State ContainerSpanModifier1:MyContainerSpanModifier = new MyContainerSpanModifier()
  build() {
    Column() {
      Text() {
        ContainerSpan() {
          ImageSpan($r('app.media.app_icon'))
            .width('40vp')
            .height('40vp')
            .verticalAlign(ImageSpanAlignment.CENTER)
          Span('I\'m ContainerSpan attributeModifier').fontSize('16fp').fontColor(Color.White)
        }.attributeModifier(this.ContainerSpanModifier1 as MyContainerSpanModifier)
      }.id('ContainerSpanModifierText')
    }.width('100%').alignItems(HorizontalAlign.Center)
  }
}