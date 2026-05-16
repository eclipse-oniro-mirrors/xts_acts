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
import { Entry,Component,$r,Builder,List, ListItem,Marquee,NavDestination,PolygonAttribute,Navigation,Polygon,Path,NavPathStack,HorizontalAlign,Menu,MenuItemOptions,FontStyle,MenuItem,Font,Dimension,BorderRadiuses,ListItemGroup,LoadingProgress,Padding,Column,StickyStyle,ImageAnimator,ImageSpan,Alignment,Hyperlink,BreakpointsReference,GridRowDirection,TextOverflow,GridCol,ColumnOptions,Grid,GridItem,Gauge,FormComponent,Visibility,FormDimension,Divider,Counter,DataPanel,DatePicker,BorderImageOption,BorderOptions,AdaptiveColor,BackgroundEffectOptions,BorderStyle,RepeatMode,GradientDirection,Image,Checkbox,Blank,MarkStyle,ResourceColor,CheckboxGroup,Text,Toggle,ToggleType,FlexAlign,Color,Flex,ButtonType,FlexDirection,ItemAlign,Row,Button,ClickEvent,Week,GridRow,FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle, CalendarAlign, CalendarPicker,EdgeEffect,Curve,SwiperDisplayMode,ArrowPosition, Select,BlurStyle,MenuAlignType,TextInputController,TextAlign,AlphabetIndexer} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,
} from '@ohos.arkui.stateManagement';
import { PolygonModifier } from "@ohos.arkui.modifier";

//修改基类
class CustomModifier extends PolygonModifier {

  applyNormalAttribute(instance: PolygonAttribute): void {
    // super.applyNormalAttribute?.(instance);
  }

  onChange() {
    this.points([[1, 1], [50, 100], [100, 0]])
  }
}


@Entry
@Component
  struct PolygonExample {
  @State customModifier: PolygonModifier = new CustomModifier()
    .points([[0, 0], [50, 100], [100, 0]]);
  build() {
    Column({ space: 10 } as ColumnOptions) {
      Button("change value").onClick((e: ClickEvent) => {
        (this.customModifier as CustomModifier).onChange();
      }).key("changeButton")

      Polygon({ width: 200, height: 150 })
        .attributeModifier(this.customModifier  as CustomModifier)
        .fill(Color.Green)
        .key('polygon1')
    }.width('100%')
  }
}

