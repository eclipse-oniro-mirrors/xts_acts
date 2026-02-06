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
import { Entry,Component,$r,Builder,List, ListItem,Marquee,Menu,MenuItemAttribute,MenuItemOptions,FontStyle,MenuItem,Font,Dimension,BorderRadiuses,ListItemGroup,LoadingProgress,Padding,Column,StickyStyle,ImageAnimator,ImageSpan,Alignment,Hyperlink,BreakpointsReference,GridRowDirection,TextOverflow,GridCol,ColumnOptions,Grid,GridItem,Gauge,FormComponent,Visibility,FormDimension,Divider,Counter,DataPanel,DatePicker,BorderImageOption,BorderOptions,AdaptiveColor,BackgroundEffectOptions,BorderStyle,RepeatMode,GradientDirection,Image,Checkbox,Blank,MarkStyle,ResourceColor,CheckboxGroup,Text,Toggle,ToggleType,FlexAlign,Color,Flex,ButtonType,FlexDirection,ItemAlign,Row,Button,ClickEvent,Week,GridRow,FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle, CalendarAlign, CalendarPicker,EdgeEffect,Curve,SwiperDisplayMode,ArrowPosition, Select,BlurStyle,MenuAlignType,TextInputController,TextAlign,AlphabetIndexer} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,
} from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { MenuItemModifier } from "@ohos.arkui.modifier";

class CustomModifier extends MenuItemModifier {
  applyNormalAttribute(instance: MenuItemAttribute): void {
    // super.applyNormalAttribute?.(instance);
  }
  onChange1() {
    this.labelFontColor(Color.Orange)
  }
}

@Entry
@Component
struct menuItemPage {
  @State customModifier: MenuItemModifier = new CustomModifier()
    .contentFont({ size: 10 })
    .contentFontColor(Color.Blue)
    .labelFont({ size: 15 })
    .labelFontColor(Color.Red)
    .selected(true)
    .selectIcon(true)

  build() {
    Row() {
      Column() {
        Button("change value").onClick((e: ClickEvent) => {
          (this.customModifier as CustomModifier).onChange1();
        }).key("changeButton")
        Menu() {
          MenuItem({
            content: "content1",
            endIcon: "resource/base/media/icon.png",
            labelInfo: "labelInfo1",
          } as MenuItemOptions)
          .key("menuItem_options1")
          .attributeModifier(this.customModifier as CustomModifier)
        }
      }
      .width('100%')
    }
    .height('100%')
  }
}