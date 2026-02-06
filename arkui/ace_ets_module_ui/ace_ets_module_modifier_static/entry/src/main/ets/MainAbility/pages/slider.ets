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
import { Entry,Component,$r,Builder,Search,Slider,SliderBlockType, Path,SliderAttribute,Span,Stack,SliderStyle,SearchController,ButtonAttribute,SharedTransitionEffectType,List,NavPathStack, Position,ListItem,Ellipse,LineCapStyle,LineJoinStyle,NavDestination,Shape,Path,RichEditorController,Polyline,Progress,RowOptions,Navigation,Polygon,ProgressType,Path,HorizontalAlign,Menu,MenuItemOptions,FontStyle,MenuItem,Font,Dimension,BorderRadiuses,ListItemGroup,LoadingProgress,Padding,Column,StickyStyle,ImageAnimator,ImageSpan,Alignment,Hyperlink,BreakpointsReference,GridRowDirection,TextOverflow,GridCol,ColumnOptions,Grid,GridItem,Gauge,FormComponent,Visibility,FormDimension,Divider,Counter,DataPanel,DatePicker,BorderImageOption,BorderOptions,AdaptiveColor,BackgroundEffectOptions,BorderStyle,RepeatMode,GradientDirection,Image,Checkbox,Blank,MarkStyle,ResourceColor,CheckboxGroup,Text,Toggle,ToggleType,FlexAlign,Color,Flex,ButtonType,FlexDirection,ItemAlign,Row,Button,ClickEvent,Week,GridRow,FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle, CalendarAlign, CalendarPicker,EdgeEffect,Curve,SwiperDisplayMode,ArrowPosition, Select,BlurStyle,MenuAlignType,TextInputController,TextAlign,AlphabetIndexer} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,
} from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { SliderModifier } from "@ohos.arkui.modifier";

class CustomModifier extends SliderModifier {
  applyNormalAttribute(instance: SliderAttribute): void {
    // super.applyNormalAttribute?.(instance);
  }

  onChange1() {
    this.stepSize("2px")
  }
}

@Entry
@Component
struct SliderTest {
  @State message: string = 'Hello Worlds'
  @State str: string = '200'
  @State inSetValueOne: number = 40;
//
  @State customModifier: SliderModifier = new CustomModifier()
    .stepSize("1px")
    .stepColor("#FFFF0000")
    .blockBorderWidth(50)
    .trackBorderRadius(30)
    .showTips(true)
    .blockBorderColor("#FFFF0000")
    .blockStyle({ type: SliderBlockType.SHAPE})
    .blockSize({ width: '10px', height: '10px' })
    .blockColor("#FFFF0000")
    .trackColor("#FFFF0000")
    .selectedColor("#FFFF0000")
    .showSteps(false)
    .trackThickness('2px')

  build() {
    Row() {
      Column() {
        Button("change value").onClick((e: ClickEvent) => {
          (this.customModifier as CustomModifier).onChange1();
        }).key("changeButton")

        Slider({
          value: this.inSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.InSet
        })
          .key('slider')
          .attributeModifier(this.customModifier as CustomModifier)
      }
      .width('100%')
    }
    .height('100%')
  }
}