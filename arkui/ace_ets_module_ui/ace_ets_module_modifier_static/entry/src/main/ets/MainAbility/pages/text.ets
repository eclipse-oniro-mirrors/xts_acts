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
import { Entry,Component,Video,Resource,$r,ShadowType,CopyOptions,TextCase,TextDecorationType,TextOverflow,FontStyle,TextPicker,ShadowOptions,WordBreak,TextAttribute,TextHeightAdaptivePolicy,TextAreaController,PlaybackSpeed,$rawfile,Column,Margin,ColumnOptions,Text,Color,Flex,FlexDirection,ItemAlign,Row,Button,ClickEvent,Week,FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle, CalendarAlign, CalendarPicker,EdgeEffect,Curve,SwiperDisplayMode,ArrowPosition, Select,BlurStyle,MenuAlignType,TextInputController,TextAlign,AlphabetIndexer} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,
} from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { TextModifier } from "@ohos.arkui.modifier";

class CustomModifier extends TextModifier {
  applyNormalAttribute(instance: TextAttribute): void {
    // super.applyNormalAttribute?.(instance);
  }

  onChange1() {
    this.wordBreak(WordBreak.BREAK_ALL)
  }
}

@Entry
@Component
struct TextExample {
  private arr: number[] = new Array<number>(0, 1, 2, 3, 4, 5, 6, 7)
  @State CustomModifier1: TextModifier = new CustomModifier()
    .draggable(true)
    .wordBreak(WordBreak.NORMAL)
    .textIndent(1)
    .heightAdaptivePolicy(TextHeightAdaptivePolicy.MAX_LINES_FIRST)
    .textShadow({
      radius: 10,
      type: ShadowType.COLOR,
      color: Color.Blue,
      offsetX: 50,
      offsetY: 35,
      fill: true,
    } as ShadowOptions)
    .copyOption(CopyOptions.None)
    .baselineOffset(100)
    .textCase(TextCase.Normal)
    .letterSpacing(10)
    .decoration({ type: TextDecorationType.None, color: Color.Black })
    .maxLines(10)
    .fontFamily('fontFamily')
    .textOverflow({ overflow: TextOverflow.None })
    .lineHeight(20)
    .textAlign(TextAlign.Center)
    .fontWeight(FontWeight.Lighter)
    .fontStyle(FontStyle.Normal)
    .maxFontSize(30)
    .minFontSize(5)
    .fontColor(Color.Black)
    .fontSize(10)

  @State CustomModifier2: TextModifier = new CustomModifier()
    .font({ size: 12, weight: FontWeight.Normal })


  build() {
    Column({ space: 5 } as ColumnOptions) {
      Button("change value").onClick((e: ClickEvent) => {
        (this.CustomModifier1 as CustomModifier).onChange1();
      }).key("changeButton")

      Text('This is the text content with textAlign set to Center.')
        .attributeModifier(this.CustomModifier1 as CustomModifier)
        .key('text1')

      Text('This is the text content with textAlign set to Center.')
        .attributeModifier(this.CustomModifier2 as CustomModifier)
        .key('text2')

    }
    .margin({ top: 5 } as Margin)
  }
}