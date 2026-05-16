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
import { Entry,Component,$r,Column,ColumnOptions,DatePickerAttribute,Counter,DataPanel,DatePicker,BorderImageOption,BorderOptions,AdaptiveColor,BackgroundEffectOptions,BorderStyle,RepeatMode,GradientDirection,Image,Checkbox,Blank,MarkStyle,ResourceColor,CheckboxGroup,Text,Toggle,ToggleType,FlexAlign,Color,Flex,ButtonType,FlexDirection,ItemAlign,Row,Button,ClickEvent,Week,FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle, CalendarAlign, CalendarPicker,EdgeEffect,Curve,SwiperDisplayMode,ArrowPosition, Select,BlurStyle,MenuAlignType,TextInputController,TextAlign,AlphabetIndexer} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,
} from '@ohos.arkui.stateManagement';
import { DatePickerModifier } from "@ohos.arkui.modifier";
//
class CustomModifier extends DatePickerModifier {

  applyNormalAttribute(instance: DatePickerAttribute): void {
    // super.applyNormalAttribute?.(instance);
  }

  onChange1() {
    this.textStyle({ color: '#ff0000FF', font: { size: '27fp', weight: FontWeight.Normal } })
  }
}

@Entry
@Component
struct DatePickerExample {
  @State customModifier: DatePickerModifier = new CustomModifier()
    .selectedTextStyle({ color: '#ff182431', font: { size: '18fp', weight: FontWeight.Normal } })
    .disappearTextStyle({ color: '#FF000000', font: { size: '8fp', weight: FontWeight.Lighter } })
    .textStyle({ color: '#ff0000FF', font: { size: '26fp', weight: FontWeight.Normal } })
    .lunar(true);
  private selectedDate: Date = new Date('2021-08-08')

  build() {
    Column() {
      Button("change value").onClick((e: ClickEvent) => {
        (this.customModifier as CustomModifier).onChange1();
      }).key("changeButton")

      DatePicker({
        start: new Date('1970-1-1'),
        end: new Date('2100-1-1'),
        selected: this.selectedDate
      })
      .key('DatePicker')
      .attributeModifier(this.customModifier as CustomModifier)
    }
    .width('100%')
    .height('100%')
  }
}
