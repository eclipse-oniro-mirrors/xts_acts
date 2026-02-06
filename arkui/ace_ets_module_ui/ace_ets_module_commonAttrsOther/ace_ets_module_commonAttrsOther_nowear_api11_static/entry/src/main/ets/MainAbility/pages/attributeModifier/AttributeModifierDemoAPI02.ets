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
import {
  AttributeModifier,
  Button,
  ButtonAttribute,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  CustomBuilder,
  DragItemInfo,
  Entry,
  FlexAlign,
  GestureEvent,
  LongPressGesture,
  Margin,
  Row,
  Scroll,
  TapGesture,
  Text,
  TouchEvent,
  TouchType,
  AttributeModifierState
} from '@ohos.arkui.component'
import { AppStorage, State } from '@ohos.arkui.stateManagement'
import { Router, UIContext } from '@ohos.arkui.UIContext';

class MyButtonModifier2 implements AttributeModifier<ButtonAttribute> {
  isDark: boolean = false
  applyFocusedAttribute(instance: ButtonAttribute): void {
    instance.backgroundColor("#FF209B08")
  }
  monitoredStates():int{
    return AttributeModifierState.FOCUSED
  }
}


@Entry
@Component
struct AttributeModifierDemoAPI02 {
  @State modifier: MyButtonModifier2 = new MyButtonModifier2()
  @State enabledFlag: boolean = true


  build() {
    Row() {
      Column() {
        Button("检测此button")
          .key('AttributeModifierDemoAPI02ButtonFocus')
          .width('90%')
          .height(80)
          .attributeModifier(this.modifier)
          .enabled(this.enabledFlag)
      }
      .width('100%')
    }
    .height('100%')
  }
}