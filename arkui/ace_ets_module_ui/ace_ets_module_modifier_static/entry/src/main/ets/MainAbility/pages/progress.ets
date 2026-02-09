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
import { Entry,Component,$r,Builder,List, ListItem,Marquee,NavDestination,ProgressStyleOptions,ProgressAttribute,Polyline,Progress,RowOptions,Navigation,Polygon,ProgressType,Path,NavPathStack,HorizontalAlign,Menu,MenuItemOptions,FontStyle,MenuItem,Font,Dimension,BorderRadiuses,ListItemGroup,LoadingProgress,Padding,Column,StickyStyle,ImageAnimator,ImageSpan,Alignment,Hyperlink,BreakpointsReference,GridRowDirection,TextOverflow,GridCol,ColumnOptions,Grid,GridItem,Gauge,FormComponent,Visibility,FormDimension,Divider,Counter,DataPanel,DatePicker,BorderImageOption,BorderOptions,AdaptiveColor,BackgroundEffectOptions,BorderStyle,RepeatMode,GradientDirection,Image,Checkbox,Blank,MarkStyle,ResourceColor,CheckboxGroup,Text,Toggle,ToggleType,FlexAlign,Color,Flex,ButtonType,FlexDirection,ItemAlign,Row,Button,ClickEvent,Week,GridRow,FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle, CalendarAlign, CalendarPicker,EdgeEffect,Curve,SwiperDisplayMode,ArrowPosition, Select,BlurStyle,MenuAlignType,TextInputController,TextAlign,AlphabetIndexer} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,
} from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { ProgressModifier } from "@ohos.arkui.modifier";

class CustomModifier extends ProgressModifier {
  applyNormalAttribute(instance: ProgressAttribute): void {
    // super.applyNormalAttribute?.(instance);
  }

  onChange1() {
    this.value(5)
  }
}

@Entry
@Component
struct ProgressExample {
  @State customModifier: ProgressModifier = new CustomModifier()
    .color('#FF123456')
    .value(12)
    .style({ strokeWidth: 20, scaleCount: 30, scaleWidth: 20 } as ProgressStyleOptions)

  build() {
    Column({ space: 5 } as ColumnOptions) {
    Button("change value").onClick((e: ClickEvent) => {
      (this.customModifier as CustomModifier).onChange1();
    }).key("changeButton")
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Button('Log Json Data')
        .onClick((e: ClickEvent) => {
          console.log(inspector.getInspectorByKey('ProgressKey1'))
        })
      Text("progress-Style")
        .width(100)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("styleText")
      Row({ space: 40 } as RowOptions) {
        Progress({ value: 20, total: 150, type: ProgressType.ScaleRing })
          .width(100)
          .key("ProgressKey1")
          .attributeModifier(this.customModifier as CustomModifier)
      }
    }.width("100%").height("100%")
    }
    .margin({ top: 5 } as Margin)
  }
}

