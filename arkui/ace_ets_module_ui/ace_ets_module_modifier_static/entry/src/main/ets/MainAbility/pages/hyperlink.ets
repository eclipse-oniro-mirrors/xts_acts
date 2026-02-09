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
  Padding,
  Column,
  Alignment,
  Hyperlink,
  BreakpointsReference,
  GridRowDirection,
  TextOverflow,
  GridCol,
  ColumnOptions,
  Grid,
  GridItem,
  Gauge,

  FormComponent,
  Visibility,
  FormDimension,
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
  GridRow,
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
  HyperlinkAttribute,
  Resource
} from '@ohos.arkui.component';
import { State, Link, PropRef, } from '@ohos.arkui.stateManagement';
import { HyperlinkModifier } from "@ohos.arkui.modifier";


class CustomModifier extends HyperlinkModifier {
	applyNormalAttribute(instance: HyperlinkAttribute): void {
		// super.applyNormalAttribute?.(instance);
	}

	onChange1() {
		this.color('#FF654321')
	}
}

@Entry
@Component
struct TestHyperlinkPage {
  mColor: Color|Int|String|Resource|undefined = '#FF123456'

  	@State customModifier: HyperlinkModifier = new CustomModifier()
  		.color(this.mColor)

  build() {
    Column() {
      Button("change value").onClick((e: ClickEvent) => {
        				(this.customModifier as CustomModifier).onChange1();
      }).key("changeButton")
      Hyperlink('https://example.com/')
        .key('HyperlinkKey1')
      				.attributeModifier(this.customModifier as CustomModifier)
    }
    .width('100%')
    .height('100%')
  }
}
