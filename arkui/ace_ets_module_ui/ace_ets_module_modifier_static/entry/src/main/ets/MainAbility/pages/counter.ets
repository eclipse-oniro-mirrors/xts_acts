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
  Counter,
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
  CounterAttribute
} from '@ohos.arkui.component';
import { State, Link, PropRef, } from '@ohos.arkui.stateManagement';
import { CounterModifier } from "@ohos.arkui.modifier";

class CustomModifier extends CounterModifier {
  applyNormalAttribute(instance: CounterAttribute): void {
    // super.applyNormalAttribute?.(instance);
  }

  onChange1() {
    this.enableInc(false)
  }
}

@Entry
@Component
struct CounterTest {
  @State customModifier: CounterModifier = new CustomModifier()
    .enableInc(true)
    .enableDec(true)
  @State value: number = 0

  build() {
    Row() {
      Column() {
        Button("change value").onClick((e: ClickEvent) => {
          (this.customModifier as CustomModifier).onChange1();
        }).key("changeButton")

        Counter() {
          Text(this.value.toString())
        }
        .key("Counter")
        .margin(100)
        .attributeModifier(this.customModifier as CustomModifier)
        .onInc((): void => {
          this.value++
        })
        .onDec((): void => {
          this.value--
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}
