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
import { Entry,Component,$r,Column,ColumnOptions,Checkbox,Blank,Text,Toggle,ToggleType,FlexAlign,Color,Flex,ButtonType,
  FlexDirection,ItemAlign,Row,Button,ClickEvent,Week,FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle,
  CalendarAlign, CalendarPicker,EdgeEffect,Curve,SwiperDisplayMode,ArrowPosition, CheckboxAttribute,
  Select,BlurStyle,MenuAlignType,TextInputController,TextAlign,AlphabetIndexer} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,
} from '@ohos.arkui.stateManagement';
import { CheckboxModifier } from "@ohos.arkui.modifier";

class CustomModifier extends CheckboxModifier{

  applyNormalAttribute(instance: CheckboxAttribute): void {
    // super.applyNormalAttribute(instance);
  }

  onChange1() {
    this.unselectedColor("#FFED6F21")
  }
}

@Entry
@Component
struct checkBoxTest {
  @State customModifier: CheckboxModifier = new CustomModifier()
    .select(false)
    .selectedColor("#FFED6F21")
    .unselectedColor("#FF00FF00")
    .mark({
        strokeColor: Color.Black,
        size: 50,
        strokeWidth: 5
      })

  build() {
    Row() {
      Column() {
        Button("change value").onClick((e: ClickEvent) => {
          (this.customModifier as CustomModifier).onChange1();
        }).key("changeButton")

        Checkbox({ name: 'checkbox1', group: 'checkboxGroup1' })
          .key("Checkbox_0100")
          .attributeModifier(this.customModifier as CustomModifier)
          .onChange((value: boolean) => {
            // console.info('Checkbox1 change is' + value)
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}
