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
import { Entry,Component,$r,Builder,List, ListItem,ListItemGroup,LoadingProgress,Padding,Column,LoadingProgressAttribute,StickyStyle,ImageAnimator,ImageSpan,Alignment,Hyperlink,BreakpointsReference,GridRowDirection,TextOverflow,GridCol,ColumnOptions,Grid,GridItem,Gauge,FormComponent,Visibility,FormDimension,Divider,Counter,DataPanel,DatePicker,BorderImageOption,BorderOptions,AdaptiveColor,BackgroundEffectOptions,BorderStyle,RepeatMode,GradientDirection,Image,Checkbox,Blank,MarkStyle,ResourceColor,CheckboxGroup,Text,Toggle,ToggleType,FlexAlign,Color,Flex,ButtonType,FlexDirection,ItemAlign,Row,Button,ClickEvent,Week,GridRow,FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle, CalendarAlign, CalendarPicker,EdgeEffect,Curve,SwiperDisplayMode,ArrowPosition, Select,BlurStyle,MenuAlignType,TextInputController,TextAlign,AlphabetIndexer} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,
} from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { LoadingProgressModifier } from "@ohos.arkui.modifier";
//
class CustomModifier extends LoadingProgressModifier {
  applyNormalAttribute(instance: LoadingProgressAttribute): void {
    // super.applyNormalAttribute?.(instance);
  }

  onChange1() {
    this.enableLoading(true)
  }
}

@Entry
@Component
struct LoadingProgressExampleAdd {
  @State customModifier: LoadingProgressModifier = new CustomModifier()
    .color(Color.Blue)
    .enableLoading(true)

  build() {
    Column({ space: 5 } as ColumnOptions) {
    Button("change value").onClick((e: ClickEvent) => {
      (this.customModifier as CustomModifier).onChange1();
    }).key("changeButton")
    Column({ space: 5 } as ColumnOptions) {
      Text('Orbital LoadingProgress ').fontSize(9).fontColor(0xCCCCCC).width('90%')
      LoadingProgress()
        .key('ArkUX_Stage_loadingProgress_attrs_static_0100')
        .attributeModifier(this.customModifier as CustomModifier)
    }
    .width('100%')
    .margin({ top: 5 } as Margin)
    }
    .margin({ top: 5 } as Margin)
  }
}