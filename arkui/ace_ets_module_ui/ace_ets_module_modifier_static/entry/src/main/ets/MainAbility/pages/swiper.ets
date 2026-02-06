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
import {
  Entry,
  Component,
  $r,
  Column,
  ColumnOptions,
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
  Margin,Swiper,ForEach,
  PickerTextStyle, CalendarAlign, CalendarPicker,EdgeEffect,Curve,SwiperDisplayMode,
  ArrowPosition, Select,BlurStyle,MenuAlignType,TextInputController,TextAlign,
  SwiperAttribute, DotIndicator
} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,
} from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
import { SwiperModifier } from "@ohos.arkui.modifier";

class CustomModifier extends SwiperModifier {
  applyNormalAttribute(instance: SwiperAttribute): void {
    super.applyNormalAttribute(instance);
  }

  onChange1() {
    this.index(5)
  }
}

@Entry
@Component
struct SwiperExample {
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7] as number[]

  @State customModifier: SwiperModifier = new CustomModifier()
    .nextMargin(10)
    .prevMargin(2)
    .displayCount(2)
    .displayArrow(false)
    .curve(Curve.Linear)
    .disableSwipe(true)
    .effectMode(EdgeEffect.Spring)
    .cachedCount(2)
    .displayMode(SwiperDisplayMode.STRETCH)
    .itemSpace(10)
    .vertical(true)
    .loop(true)
    .interval(4000)
    .autoPlay(true)
    .index(1)
    .indicator(
      new DotIndicator()
        .itemWidth("15vp")
        .itemHeight("15vp")
        .selectedItemWidth("15vp")
        .selectedItemHeight("15vp")
        .color("#FF123456")
        .selectedColor("#FF654321"))
    .duration(300)

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Button("change value").onClick((e: ClickEvent) => {
        (this.customModifier as CustomModifier).onChange1();
      }).key("changeButton")

      Swiper() {
        ForEach(this.arr, (item: number) => {
          Text(String(item))
            .width('90%')
            .height(160)
            .backgroundColor(0xAFEEEE)
            .textAlign(TextAlign.Center)
            .fontSize(30)
        }, (item: number) => String(item))
      }
      .attributeModifier(this.customModifier as CustomModifier)
      .key('swiper')
    }
    .margin({ top: 5 } as Margin)
  }
}