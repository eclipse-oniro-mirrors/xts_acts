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
  Stack,
  ColumnOptions,
  SelectAttribute,
  Select,
  Font,
  ArrowPosition,
  FontStyle,
  Position,
  RowSplit,
  EffectType,
  EffectComponent,
  Text,
  Color,
  Flex,
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
  AlphabetIndexer
} from '@ohos.arkui.component';
import { State, Link, PropRef, } from '@ohos.arkui.stateManagement';
import { SelectModifier } from "@ohos.arkui.modifier";

class CustomModifier extends SelectModifier {
  applyNormalAttribute(instance: SelectAttribute): void {
    // super.applyNormalAttribute(instance);
  }

  onChange1() {
    this.fontColor("#FF123456")
  }
}

@Entry
@Component
struct SelectExample {
  font: Font = {
    size: 30,
    weight: 400,
    family: 'serif',
    style: FontStyle.Normal
  } as Font
  fontColor: string = "#FFCCCCCC"
  spaceValue: number = 8
  spaceValueString: string = '50.00vp'
  arrowPosition: ArrowPosition = ArrowPosition.END
  @State customModifier: SelectModifier = new CustomModifier()
    .selected(1)
    .value('Test')
    .font(this.font)
    .fontColor(this.fontColor)
    .selectedOptionFont({
      size: 40,
      weight: 500,
      family: 'serif',
      style: FontStyle.Normal
    })
    .selectedOptionFontColor(0x000000)
    .selectedOptionBgColor(0xCCCCCC)
    .optionBgColor(0xFFFFFF)
    .optionFont({
      size: 30,
      weight: 400,
      family: 'serif',
      style: FontStyle.Normal
    })
    .optionFontColor(0x000000)
    .menuAlign(MenuAlignType.START)
    .space(this.spaceValueString)
    .arrowPosition(this.arrowPosition)
    .optionWidth('200px')
    .optionHeight('100px')

  build() {
    Column() {
      Button("change value").onClick((e: ClickEvent) => {
        (this.customModifier as CustomModifier).onChange1();
      }).key("changeButton")
      Select([{ value: 'aaa', icon: "/common/public_icon.svg" },
        { value: 'bbb', icon: "/common/public_icon.svg" },
        { value: 'ccc', icon: "/common/public_icon.svg" },
        { value: 'ddd', icon: "/common/public_icon.svg" }])
        .onSelect((index: int): void => {
          console.info("Select:" + index)
        })
        .key('selectTest')
        .margin({ bottom: 40 } as Margin)
        .attributeModifier(this.customModifier as CustomModifier)
    }
  }
}