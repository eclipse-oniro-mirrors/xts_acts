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
import { Entry,Component,Video,Resource,$r,TextArea,TextClockController,AttributeModifier,FontStyle,TextTimerAttribute,TextTimerController,TextTimer,FlexAlign,TextClock,TextPicker,TextAreaController,PlaybackSpeed,$rawfile,Column,Margin,ColumnOptions,Text,Color,Flex,FlexDirection,ItemAlign,Row,Button,ClickEvent,Week,FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle, CalendarAlign, CalendarPicker,EdgeEffect,Curve,SwiperDisplayMode,ArrowPosition, Select,BlurStyle,MenuAlignType,TextInputController,TextAlign,AlphabetIndexer} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,
} from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { TextTimerModifier } from "@ohos.arkui.modifier";

class CustomModifier extends TextTimerModifier {
  applyNormalAttribute(instance: TextTimerAttribute): void {
    // super.applyNormalAttribute?.(instance);
  }

  onChange1() {
    this.fontSize(5)
  }
}

class TextTimerModifier1 implements AttributeModifier<TextTimerAttribute> {
  applyNormalAttribute(instance: TextTimerAttribute): void {
    instance
      .fontSize(20)
      .fontColor(Color.Pink)
      .format('mm:ss.SS')
      .fontWeight(FontWeight.Normal)
      .fontFamily("cursive")
      .fontStyle(FontStyle.Italic)
  }
}

@Entry
@Component
struct TextTimerExample {
  textTimerController: TextTimerController = new TextTimerController()
  @State customModifier: TextTimerModifier = new CustomModifier()
    .fontSize(20)
    .fontColor(Color.Pink)
    .format('mm:ss.SS')
    .fontWeight(FontWeight.Normal)
    .fontFamily("cursive")
    .fontStyle(FontStyle.Italic)

  build() {
    Column() {
      Button("change value").onClick((e: ClickEvent) => {
        (this.customModifier as CustomModifier).onChange1();
      }).key("changeButton")
      Button('Log Json Data')
        .onClick((e: ClickEvent) => {
          console.log(inspector.getInspectorByKey('TextTimerKey1'))
        })
      TextTimer({ isCountDown: true, count: 30000, controller: this.textTimerController })
        .key('TextTimerKey1')
        .attributeModifier(this.customModifier as CustomModifier)
        .onTimer((utc: long, elapsedTime: long) => {
          console.info('textTimer notCountDown utc is：' + utc + ', elapsedTime: ' + elapsedTime)
        })
      Row() {
        Button("start").onClick((e: ClickEvent) => {
          this.textTimerController.start()
        })
        Button("pause").onClick((e: ClickEvent) => {
          this.textTimerController.pause()
        })
        Button("reset").onClick((e: ClickEvent) => {
          this.textTimerController.reset()
        })
      }
    }
  }
}
