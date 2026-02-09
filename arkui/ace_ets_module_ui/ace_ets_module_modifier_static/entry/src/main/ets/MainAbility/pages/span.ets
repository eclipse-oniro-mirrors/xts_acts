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
import { Entry,Component,$r,Builder,Search,Scroll,Span,TextCase,SpanAttribute,TextDecorationType, RichEditor,Stack,ModifierKey,SearchController,ButtonAttribute,SharedTransitionEffectType,List,NavPathStack, Position,ListItem,Ellipse,LineCapStyle,LineJoinStyle,NavDestination,Shape,Path,RichEditorController,Polyline,Progress,RowOptions,Navigation,Polygon,ProgressType,Path,HorizontalAlign,Menu,MenuItemOptions,FontStyle,MenuItem,Font,Dimension,BorderRadiuses,ListItemGroup,LoadingProgress,Padding,Column,StickyStyle,ImageAnimator,ImageSpan,Alignment,Hyperlink,BreakpointsReference,GridRowDirection,TextOverflow,GridCol,ColumnOptions,Grid,GridItem,Gauge,FormComponent,Visibility,FormDimension,Divider,Counter,DataPanel,DatePicker,BorderImageOption,BorderOptions,AdaptiveColor,BackgroundEffectOptions,BorderStyle,RepeatMode,GradientDirection,Image,Checkbox,Blank,MarkStyle,ResourceColor,CheckboxGroup,Text,Toggle,ToggleType,FlexAlign,Color,Flex,ButtonType,FlexDirection,ItemAlign,Row,Button,ClickEvent,Week,GridRow,FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle, CalendarAlign, CalendarPicker,EdgeEffect,Curve,SwiperDisplayMode,ArrowPosition, Select,BlurStyle,MenuAlignType,TextInputController,TextAlign,AlphabetIndexer} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,
} from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { SpanModifier } from "@ohos.arkui.modifier";

class CustomModifier extends SpanModifier {
  applyNormalAttribute(instance: SpanAttribute): void {
    // super.applyNormalAttribute?.(instance);
  }

  onChange1() {
    this.textCase(TextCase.LowerCase)
  }
}

@Entry
@Component
struct SpanExample {
  @State customModifier1: CustomModifier = new CustomModifier()
    .lineHeight(0)
    .textCase(TextCase.Normal)
    .letterSpacing(0)
    .decoration({ type: TextDecorationType.LineThrough, color: Color.Red })
    .fontColor(Color.Grey)
    .font({ size: 40, weight: 16, family: "fontFamily", style: FontStyle.Normal })

	@State customModifier2: CustomModifier = new CustomModifier()
    .fontFamily("fontFamily")
    .fontWeight(FontWeight.Bolder)
    .fontStyle(FontStyle.Normal)
    .fontSize(20)

  build() {
    Column() {
      Button("change value").onClick((e: ClickEvent) => {
        (this.customModifier1 as CustomModifier).onChange1();
      }).key("changeButton")

      Text() {
      	Span('I am')
		.attributeModifier(this.customModifier1 as CustomModifier)
		.key('SpanKey1')
	  }
	  Text() {
      	Span('I am')
		.attributeModifier(this.customModifier2 as CustomModifier)
		.key('SpanKey2')
	  }

    }
    .margin({ top: 5 } as Margin)
  }
}