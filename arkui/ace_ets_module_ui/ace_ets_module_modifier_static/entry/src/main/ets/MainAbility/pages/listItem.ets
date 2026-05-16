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
import { Entry,Component,$r,Builder,List,ListItemAttribute,SwipeEdgeEffect, ListItem,Padding,Column,ImageAnimator,ImageSpan,Alignment,Hyperlink,BreakpointsReference,GridRowDirection,TextOverflow,GridCol,ColumnOptions,Grid,GridItem,Gauge,FormComponent,Visibility,FormDimension,Divider,Counter,DataPanel,DatePicker,BorderImageOption,BorderOptions,AdaptiveColor,BackgroundEffectOptions,BorderStyle,RepeatMode,GradientDirection,Image,Checkbox,Blank,MarkStyle,ResourceColor,CheckboxGroup,Text,Toggle,ToggleType,FlexAlign,Color,Flex,ButtonType,FlexDirection,ItemAlign,Row,Button,ClickEvent,Week,GridRow,FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle, CalendarAlign, CalendarPicker,EdgeEffect,Curve,SwiperDisplayMode,ArrowPosition, Select,BlurStyle,MenuAlignType,TextInputController,TextAlign,AlphabetIndexer} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,
} from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { ListItemModifier } from "@ohos.arkui.modifier";

class CustomModifier extends ListItemModifier {

  applyNormalAttribute(instance: ListItemAttribute): void {
    // super.applyNormalAttribute?.(instance);
  }

  onChange() {
    this.selectable(false)
  }
}


@Entry
@Component
struct List_itemOnSelect {
  @State customModifier: ListItemModifier = new CustomModifier()
    .selected(true)
    .selectable(true)
    .swipeAction({
      edgeEffect: SwipeEdgeEffect.Spring
    })

  @Builder
  itemEnd() {
    Row() {
      Button("Del").margin("4vp").key("Del")
      Button("Set").margin("4vp").key("Set")
    }.padding("4vp").justifyContent(FlexAlign.SpaceEvenly)
  }

  build() {
    Column() {
      Button("change value").onClick((e: ClickEvent) => {
        (this.customModifier as CustomModifier).onChange();
      }).key("changeButton")

      Button('Log Json Data')
        .onClick((e: ClickEvent) => {
          console.log(inspector.getInspectorByKey('ListItemKey1'))
        })
      Button("Click2").fontSize(50)
        .onClick((e: ClickEvent) => {
          console.info("Click2" + JSON.stringify(inspector.sendEventByKey("Del", 10, "")));
        }).key("Click2")
      List({ space: 10 }) {
        ListItem() {
          Text("Hello world") {
          }
          .width('100%')
          .height(100)
          .fontSize(16)
          .textAlign(TextAlign.Center)
          .borderRadius(10)
          .backgroundColor(0xFFFFFF)
        }
        .key("ListItemKey1")
        .attributeModifier(this.customModifier as CustomModifier)
      }
    }
    .padding(10)
    .backgroundColor(0xDCDCDC)
    .width('100%')
    .height('100%')
  }
}

