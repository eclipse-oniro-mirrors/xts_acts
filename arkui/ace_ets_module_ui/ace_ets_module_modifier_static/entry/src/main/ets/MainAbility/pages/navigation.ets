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
import { Entry,Component,$r,Builder,List, NavigationAttribute,NavBarPosition,NavigationMode,NavigationTitleMode,
  ListItem,Marquee,NavDestination,Navigation,NavPathStack,HorizontalAlign,Menu,MenuItemOptions,FontStyle,MenuItem,Font,Dimension,BorderRadiuses,ListItemGroup,LoadingProgress,Padding,Column,StickyStyle,ImageAnimator,ImageSpan,Alignment,Hyperlink,BreakpointsReference,GridRowDirection,TextOverflow,GridCol,ColumnOptions,Grid,GridItem,Gauge,FormComponent,Visibility,FormDimension,Divider,Counter,DataPanel,DatePicker,BorderImageOption,BorderOptions,AdaptiveColor,BackgroundEffectOptions,BorderStyle,RepeatMode,GradientDirection,Image,Checkbox,Blank,MarkStyle,ResourceColor,CheckboxGroup,Text,Toggle,ToggleType,FlexAlign,Color,Flex,ButtonType,FlexDirection,ItemAlign,Row,Button,ClickEvent,Week,GridRow,FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle, CalendarAlign, CalendarPicker,EdgeEffect,Curve,SwiperDisplayMode,ArrowPosition, Select,BlurStyle,MenuAlignType,TextInputController,TextAlign,AlphabetIndexer} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,
} from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { NavigationModifier } from "@ohos.arkui.modifier";


class CustomModifier extends NavigationModifier {
  applyNavigatorAttribute(instance: NavigationAttribute): void {
    // super.applyNormalAttribute?.(instance);
  }

  onChange1() {
    this.minContentWidth('20px')
  }
}

@Entry
@Component
struct NavigationPage {
  @State customModifier: NavigationModifier = new CustomModifier()
    .minContentWidth('10px')
    .navBarWidthRange(['300vp', '800vp'])
    .navBarWidth(120)
    .navBarPosition(NavBarPosition.Start)
    .mode(NavigationMode.Split)
    .backButtonIcon('resources/base/media/icon.png')
    .hideNavBar(false)
    .hideTitleBar(false)
    .title('test')
    .hideBackButton(false)
    .titleMode(NavigationTitleMode.Free)
    .hideToolBar(false)
  @State isActiveWLAN: boolean = false
  @State isActiveBluetooth: boolean = false

  build() {
    Column() {
      Button("change value").onClick((e: ClickEvent) => {
        (this.customModifier as CustomModifier).onChange1();
      }).key("changeButton")
      Navigation({}) {
        Navigation({}) {
          Row() {
            Row()
              .width(30)
              .height(30)
              .borderRadius(30)
              .margin({ left: 3, right: 10 } as Margin)
              .backgroundColor(Color.Pink)
            Text(`WLAN`)
              .fontSize(22)
              .fontWeight(500)
              .textAlign(TextAlign.Center)
          }
          .width('90%')
            .height(72)

          NavDestination() {
            Flex({ direction: FlexDirection.Row }) {
              Text('未找到可用WLAN').fontSize(30).padding({ left: 15 } as Padding)
            }
          }.hideTitleBar(false).backgroundColor('#0c182431')

        }.backgroundColor(this.isActiveWLAN ? '#ccc' : '#fff')
          .borderRadius(24)
          // .onStateChange((isActivated: boolean) => {
          //   this.isActiveWLAN = isActivated
          // })

        Navigation({}) {
          Row() {
            Row()
              .width(30)
              .height(30)
              .borderRadius(30)
              .margin({ left: 3, right: 10 } as Margin)
              .backgroundColor(Color.Pink)
            Text(`蓝牙`)
              .fontSize(22)
              .fontWeight(500)
              .textAlign(TextAlign.Center)
          }
          .width('90%')
            .height(72)

          NavDestination() {
            Flex({ direction: FlexDirection.Row }) {
              Text('未找到可用蓝牙').fontSize(30).padding({ left: 15 } as Padding)
            }
          }.hideTitleBar(false).backgroundColor('#0c182431')
        }.backgroundColor(this.isActiveBluetooth ? '#ccc' : '#fff')
          .borderRadius(24)
          // .onStateChange((isActivated: boolean) => {
          //   this.isActiveBluetooth = isActivated
          // })
      }
      .key('navigation1')
        .attributeModifier(this.customModifier as CustomModifier)
    }.height('100%')
  }
}