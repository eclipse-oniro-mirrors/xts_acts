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
import { Entry,Component,$r,Builder,List, ListItem,Marquee,Rect,RectAttribute, RectOptions,NavDestination,QRCode,Polyline,Progress,RowOptions,Navigation,Polygon,ProgressType,Path,NavPathStack,HorizontalAlign,Menu,MenuItemOptions,FontStyle,MenuItem,Font,Dimension,BorderRadiuses,ListItemGroup,LoadingProgress,Padding,Column,StickyStyle,ImageAnimator,ImageSpan,Alignment,Hyperlink,BreakpointsReference,GridRowDirection,TextOverflow,GridCol,ColumnOptions,Grid,GridItem,Gauge,FormComponent,Visibility,FormDimension,Divider,Counter,DataPanel,DatePicker,BorderImageOption,BorderOptions,AdaptiveColor,BackgroundEffectOptions,BorderStyle,RepeatMode,GradientDirection,Image,Checkbox,Blank,MarkStyle,ResourceColor,CheckboxGroup,Text,Toggle,ToggleType,FlexAlign,Color,Flex,ButtonType,FlexDirection,ItemAlign,Row,Button,ClickEvent,Week,GridRow,FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle, CalendarAlign, CalendarPicker,EdgeEffect,Curve,SwiperDisplayMode,ArrowPosition, Select,BlurStyle,MenuAlignType,TextInputController,TextAlign,AlphabetIndexer} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,
} from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { RectModifier } from "@ohos.arkui.modifier";

class CustomModifier extends RectModifier {
  applyNormalAttribute(instance: RectAttribute): void {
    // super.applyNormalAttribute?.(instance);
  }
  onChange() {
    this.radiusHeight(9)
  }
}

class CustomModifier1 extends RectModifier {
  applyNormalAttribute(instance: RectAttribute): void {
    // super.applyNormalAttribute?.(instance);
  }
  onChange() {
  }
}

class CustomModifier2 extends RectModifier {
  applyNormalAttribute(instance: RectAttribute): void {
    // super.applyNormalAttribute?.(instance);
  }
  onChange() {
  }
}

@Entry
@Component
struct RectTest {
  @State customModifier1: RectModifier = new CustomModifier().radiusHeight(8);
  @State customModifier2: RectModifier = new CustomModifier1().radius(6);
  @State customModifier3: RectModifier = new CustomModifier2().radiusWidth(12);
  @State value: number = 0

  build() {
      Column() {
        Button("change value").onClick((e: ClickEvent) => {
          (this.customModifier1 as CustomModifier).onChange();
        }).key("changeButton")

          Rect({ width: '80%', height: '20%' } as RectOptions)
          .key("Rect1")
            .attributeModifier(this.customModifier1 as CustomModifier)

          Rect({ width: '60%', height: '30%' } as RectOptions)
          .key("Rect2")
            .attributeModifier(this.customModifier2 as CustomModifier1)

          Rect({ width: '40%', height: '40%' } as RectOptions)
          .key("Rect3")
            .attributeModifier(this.customModifier3 as CustomModifier2)

          Rect({ width: '80%', height: '20%' } as RectOptions)
          .key("Rect11")
          .radiusHeight(8);

          Rect({ width: '60%', height: '30%' } as RectOptions )
          .key("Rect22")
          .radius(6);

          Rect({ width: '40%', height: '40%' } as RectOptions)
          .key("Rect33")
          .radiusWidth(12);

        Rect({ width: '40%', height: '40%' } as RectOptions)
          .key("Rect44")
          .radiusHeight(9);
      }
  }
}
