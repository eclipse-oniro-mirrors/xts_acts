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
import { Entry,Component,$r,Builder,List,PolylineAttribute, ListItem,Marquee,NavDestination,Polyline,Navigation,Polygon,Path,NavPathStack,HorizontalAlign,Menu,MenuItemOptions,FontStyle,MenuItem,Font,Dimension,BorderRadiuses,ListItemGroup,LoadingProgress,Padding,Column,StickyStyle,ImageAnimator,ImageSpan,Alignment,Hyperlink,BreakpointsReference,GridRowDirection,TextOverflow,GridCol,ColumnOptions,Grid,GridItem,Gauge,FormComponent,Visibility,FormDimension,Divider,Counter,DataPanel,DatePicker,BorderImageOption,BorderOptions,AdaptiveColor,BackgroundEffectOptions,BorderStyle,RepeatMode,GradientDirection,Image,Checkbox,Blank,MarkStyle,ResourceColor,CheckboxGroup,Text,Toggle,ToggleType,FlexAlign,Color,Flex,ButtonType,FlexDirection,ItemAlign,Row,Button,ClickEvent,Week,GridRow,FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle, CalendarAlign, CalendarPicker,EdgeEffect,Curve,SwiperDisplayMode,ArrowPosition, Select,BlurStyle,MenuAlignType,TextInputController,TextAlign,AlphabetIndexer} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,
} from '@ohos.arkui.stateManagement';
import { PolylineModifier } from "@ohos.arkui.modifier";

class CustomModifier extends PolylineModifier {

  applyNormalAttribute(instance: PolylineAttribute): void {
    // super.applyNormalAttribute?.(instance);
  }
  onChange() {
    this.points([[1, 1], [20, 61], [100, 101]])
  }
}

@Entry
@Component
  struct PolyLinePointsExample {
  @State customModifier: PolylineModifier = new CustomModifier()
    .points([[0, 0], [20, 60], [100, 100]]);
  build() {
    Column({ space: 10 } as ColumnOptions) {
      Button("change value").onClick((e: ClickEvent) => {
        (this.customModifier as CustomModifier).onChange();
      }).key("changeButton")

      Polyline({ width: 100, height: 100 })
        .attributeModifier(this.customModifier as CustomModifier)
        .key("polyLine")
        .fillOpacity(0)
        .stroke(Color.Blue)
        .strokeWidth(3)

        Polyline({ width: 100, height: 100 })
        .points([[0, 0], [20, 60], [100, 100]])
        .key("polyLine1")
        .fillOpacity(0)
        .stroke(Color.Blue)
        .strokeWidth(3)

      Polyline({ width: 100, height: 100 })
        .points([[1, 1], [20, 61], [100, 101]])
        .key("polyLine2")
        .fillOpacity(0)
        .stroke(Color.Blue)
        .strokeWidth(3)

    }.width('100%')
  }
}

