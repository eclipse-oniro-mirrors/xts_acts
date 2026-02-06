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
import { Entry,Component,$r,Builder,List, ListItem,ListItemGroup,ListItemGroupAttribute,Padding,Column,StickyStyle,ImageAnimator,ImageSpan,Alignment,Hyperlink,BreakpointsReference,GridRowDirection,TextOverflow,GridCol,ColumnOptions,Grid,GridItem,Gauge,FormComponent,Visibility,FormDimension,Divider,Counter,DataPanel,DatePicker,BorderImageOption,BorderOptions,AdaptiveColor,BackgroundEffectOptions,BorderStyle,RepeatMode,GradientDirection,Image,Checkbox,Blank,MarkStyle,ResourceColor,CheckboxGroup,Text,Toggle,ToggleType,FlexAlign,Color,Flex,ButtonType,FlexDirection,ItemAlign,Row,Button,ClickEvent,Week,GridRow,FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle, CalendarAlign, CalendarPicker,EdgeEffect,Curve,SwiperDisplayMode,ArrowPosition, Select,BlurStyle,MenuAlignType,TextInputController,TextAlign,AlphabetIndexer} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,
} from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { ListItemGroupModifier } from "@ohos.arkui.modifier";

class CustomModifier extends ListItemGroupModifier {

  applyNormalAttribute(instance: ListItemGroupAttribute): void {
    // super.applyNormalAttribute?.(instance);
  }

  onChange() {
    console.log("====================== onChange 1")
    this.divider({ strokeWidth: 13, color: '#FF123456', startMargin: 2, endMargin: 2 })
    console.log("====================== onChange 2")
  }
}

@Entry
@Component
struct ListItemGroupExample {
  @State customModifier: ListItemGroupModifier = new CustomModifier()
    .divider({ strokeWidth: 12, color: '#FF123456', startMargin: 2, endMargin: 2 })

  build() {
    Column() {
      Button("change value").onClick((e: ClickEvent) => {
        (this.customModifier as CustomModifier).onChange();
      }).key("changeButton")

      List({ space: 20 }) {
        ListItemGroup() {
          ListItem() {
            Text('Text')
              .width("100%")
              .height(100)
              .fontSize(20)
              .textAlign(TextAlign.Center)
              .backgroundColor(0xFFFFFF)
          }
        }
        .key('ListItemGroupKey1')
        .attributeModifier(this.customModifier as CustomModifier)
        .borderRadius(20)
      }
      .width('90%')
      .sticky((StickyStyle.Header | StickyStyle.Footer) as StickyStyle)
    }.width('100%').height('100%').backgroundColor(0xDCDCDC).padding({ top: 5 } as Padding)
  }
}