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
import { Entry,Component,$r,Builder,List, ListItem,Marquee,NavDestination,Navigation,NavPathStack,HorizontalAlign,Menu,MenuItemOptions,FontStyle,MenuItem,Font,Dimension,BorderRadiuses,ListItemGroup,LoadingProgress,Padding,Column,StickyStyle,ImageAnimator,ImageSpan,Alignment,Hyperlink,BreakpointsReference,GridRowDirection,TextOverflow,GridCol,ColumnOptions,Grid,GridItem,Gauge,FormComponent,Visibility,FormDimension,Divider,Counter,DataPanel,DatePicker,BorderImageOption,BorderOptions,AdaptiveColor,BackgroundEffectOptions,BorderStyle,RepeatMode,GradientDirection,Image,Checkbox,Blank,MarkStyle,ResourceColor,CheckboxGroup,Text,Toggle,ToggleType,FlexAlign,Color,Flex,ButtonType,FlexDirection,ItemAlign,Row,Button,ClickEvent,Week,GridRow,FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle, CalendarAlign, CalendarPicker,EdgeEffect,Curve,SwiperDisplayMode,ArrowPosition, Select,BlurStyle,MenuAlignType,TextInputController,TextAlign,AlphabetIndexer} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,
} from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
// import { PanelModifier } from "@ohos.arkui.modifier";
//
//
// class CustomModifier extends PanelModifier {
//   applyNormalAttribute(instance: PanelAttribute): void {
//     super.applyNormalAttribute?.(instance);
//   }
//   onChange1() {
//     this.backgroundMask('#ff11bb44')
//   }
// }

@Entry
@Component
struct TestPanelPage {
//   @State customModifier: PanelModifier = new CustomModifier()
//     .backgroundMask('#ff000000')
//     .customHeight(10)
//   @State customModifier1: PanelModifier = new CustomModifier()
//     .miniHeight(20)
//     .halfHeight(300)
//     .fullHeight(800)
//     .type(PanelType.Foldable)
//     .showCloseIcon(true)
//     .show(true)
//     .mode(PanelMode.Full)
//     .dragBar(true)

  build() {
    Column() {
//       Panel(true)
//         .key('PanelKey2')
// //         .attributeModifier(this.customModifier as CustomModifier).height('30%')
//       Panel(true)
//         .key('PanelKey3')
//         .backgroundMask('#ff000000').height('30%')
//       Panel(true)
//         .key('PanelKey1')
//         .attributeModifier(this.customModifier1 as CustomModifier).height('30%')
      Button("change value").onClick((e: ClickEvent) => {
//         (this.customModifier as CustomModifier).onChange1();
      }).key("changeButton")
    }
		.width('100%')
    .height('100%')
  }
}
