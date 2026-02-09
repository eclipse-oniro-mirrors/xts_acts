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
  Entry,
  Component,
  $r,
  Column,
  ColumnOptions,
  Divider,
  Counter,
  DataPanel,
  DatePicker,
  BorderImageOption,
  BorderOptions,
  AdaptiveColor,
  BackgroundEffectOptions,
  BorderStyle,
  RepeatMode,
  GradientDirection,
  Image,
  Checkbox,
  Blank,
  MarkStyle,
  ResourceColor,
  CheckboxGroup,
  Text,
  Toggle,
  ToggleType,
  FlexAlign,
  Color,
  Flex,
  ButtonType,
  FlexDirection,
  ItemAlign,
  Row,
  Button,
  ClickEvent,
  Week,
  FontWeight,
  Axis,
  Margin,
  Swiper,
  ForEach,
  PickerTextStyle,
  CalendarAlign,
  CalendarPicker,
  EdgeEffect,
  Curve,
  SwiperDisplayMode,
  ArrowPosition,
  Select,
  BlurStyle,
  MenuAlignType,
  TextInputController,
  TextAlign,
  AlphabetIndexer,
  DividerAttribute,
  LineCapStyle
} from '@ohos.arkui.component';
import { State, Link, PropRef, } from '@ohos.arkui.stateManagement';
import { DividerModifier } from "@ohos.arkui.modifier";


class CustomModifier extends DividerModifier {
  applyDividerAttribute(instance: DividerAttribute): void {
    // super.applyNormalAttribute?.(instance);
  }

  onChange1() {
    this.color("#FF654321")
  }
}

@Entry
@Component
struct BlankExample {
    @State customModifier: DividerModifier = new CustomModifier()
      .lineCap(LineCapStyle.Round)
      .strokeWidth(10)
      .color("#FF123456")
      .vertical(false)

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Button("change value").onClick((e: ClickEvent) => {
                (this.customModifier as CustomModifier).onChange1();
      }).key("changeButton")

      Column() {
        Text('Horizontal divider111').fontSize(9).backgroundColor(Color.Gray)
        Divider()
                  .attributeModifier(this.customModifier as CustomModifier)
          .key('divider')
        Text('Horizontal divider222').fontSize(9).backgroundColor(Color.Gray)
      }.backgroundColor(Color.Gray).padding(20)
    }
    .margin({ top: 5 } as Margin)
  }
}