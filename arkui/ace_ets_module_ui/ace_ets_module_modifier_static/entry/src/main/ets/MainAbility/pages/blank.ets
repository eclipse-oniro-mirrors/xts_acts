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
import { Entry,Component,$r,Column,ColumnOptions,Blank,Text,Toggle,ToggleType,FlexAlign,Color,Flex,ButtonType,FlexDirection,
  ItemAlign,Row,Button,ClickEvent,Week,FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle, CalendarAlign,
  CalendarPicker,EdgeEffect,Curve,SwiperDisplayMode,ArrowPosition,BlankAttribute,
  Select,BlurStyle,MenuAlignType,TextInputController,TextAlign,AlphabetIndexer} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,
} from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { BlankModifier } from "@ohos.arkui.modifier";

class CustomModifier extends BlankModifier {
  applyBlankAttribute(instance: BlankAttribute): void {
    // super.applyNormalAttribute(instance);
  }

  onChange1() {
    this.color("#FF654321")
  }
}

@Entry
@Component
struct BlankExample {
  @State customModifier: BlankModifier = new CustomModifier()
    .color("#FF123456")

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Button("change value").onClick((e: ClickEvent) => {
        (this.customModifier as CustomModifier).onChange1();
      }).key("changeButton")

      Column() {
        Blank("160")
          .attributeModifier(this.customModifier as CustomModifier)
          .key('blank')
        Toggle({ type: ToggleType.Switch }).margin({ top: 14, bottom: 14, left: 6, right: 6 } as Margin)
      }.backgroundColor(Color.Gray).padding(20)
    }
    .margin({ top: 5 } as Margin)
  }
}