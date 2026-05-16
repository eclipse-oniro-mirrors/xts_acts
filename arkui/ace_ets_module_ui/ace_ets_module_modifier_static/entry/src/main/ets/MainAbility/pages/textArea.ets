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
import { Entry,Component,Video,Resource,$r,TextArea,TextAreaAttribute, FontStyle,CopyOptions,BarState,TextContentStyle,TextPicker,TextAreaController,PlaybackSpeed,$rawfile,Column,Margin,ColumnOptions,Text,Color,Flex,FlexDirection,ItemAlign,Row,Button,ClickEvent,Week,FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle, CalendarAlign, CalendarPicker,EdgeEffect,Curve,SwiperDisplayMode,ArrowPosition, Select,BlurStyle,MenuAlignType,TextInputController,TextAlign,AlphabetIndexer} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,
} from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
 import { TextAreaModifier } from "@ohos.arkui.modifier";

 class CustomModifier extends TextAreaModifier {
  applyNormalAttribute(instance: TextAreaAttribute): void {
    // super.applyNormalAttribute?.(instance);
  }
  onChangeTextArea() {

    this.fontStyle(FontStyle.Normal)

  }
}

@Entry
@Component
struct TextAreaPage {
  @State text: string = 'This is a test string to test TestArea'
  controller: TextAreaController = new TextAreaController()
  @State customModifier: TextAreaAttribute = new CustomModifier()
    .fontStyle(FontStyle.Italic)
    .copyOption(CopyOptions.None)
    .textAlign(TextAlign.Start)
    .fontWeight("100")
    .fontSize(12)
    .fontFamily("fontFamily")
    .placeholderFont({ size: 16, weight: 400 })
    .placeholderColor("#FF000000")
    .maxLength(40)
    .maxLines(20)
    .selectionMenuHidden(true)
    .barState(BarState.On)
    .style(TextContentStyle.INLINE)
    .enableKeyboardOnFocus(true)
    .caretColor("#FF000000")
    .showCounter(false)
    .fontColor("#FF123456")

  build() {
    Row(){
      Button("change value").onClick((e: ClickEvent) => {
        (this.customModifier as CustomModifier).onChangeTextArea();
      }).key("changeButton")

      TextArea({ text: this.text, controller: this.controller })
      .attributeModifier(this.customModifier as CustomModifier)
      .key('textArea')
      .width(200)
      .height(100)
    }
  }
}