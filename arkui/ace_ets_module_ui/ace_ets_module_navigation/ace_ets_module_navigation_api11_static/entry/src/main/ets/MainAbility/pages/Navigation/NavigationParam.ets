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
import {
  Entry,Component,$r,Scroll,Builder,List,ListItem,Resource,AnimateParam,Search,TextAlign,Axis,NavBarPosition,
  NavigationTitleMode,Image,NavigationMode,Column,Navigation,ButtonType,NavDestination,Stack,ColumnOptions,TextInput,
  Position,EffectType,EffectComponent,Text,Color,Flex,FlexDirection,ItemAlign,Row,Button,ClickEvent,NavDestinationMode,Dimension,
  FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle, CalendarAlign,NavigationCommonTitle,NavDestinationCommonTitle,HorizontalAlign
,NavPathStack} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,Provide
} from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';
import {MessageManager,Callback,Message } from '../../common/MessageManager';
@Entry
@Component
struct NavigationParam {
  private arr: number[] = new Array<number>(0, 1, 2)

  @Builder
  NavigationTitle() {
    Column() {
      Text('CustomBuilder_Title')
        .fontColor('#182431')
        .fontSize(30)
        .lineHeight(100)
        .fontWeight(700)
    }
  }

  @Builder
  NavigationCustomTitle() {
    Column() {
      Text('NavigationCustomTitle')
        .onClick((e: ClickEvent) => {
        })
        .fontColor('#182431')
        .fontSize(30)
        .lineHeight(100)
        .fontWeight(700)
    }.alignItems(HorizontalAlign.Start)
  }

  build() {
    Column() {
      Navigation({}) {
        List({ space: 5, initialIndex: 0 }) {
          ForEach(this.arr, (item: number) => {
            ListItem() {
              Text('' + item)
                .width('90%')
                .height(30)
                .backgroundColor('#3366CC')
                .borderRadius(15)
                .fontSize(16)
                .textAlign(TextAlign.Center)
            }
          }, (item: number) => String(item))
        }
        .listDirection(Axis.Vertical)
        .height(90)
        .margin({ top: 10, left: 18 } as Margin)
        .width('100%')
      }
      .title($r("app.string.test_title"))
      .titleMode(NavigationTitleMode.Free)
      .key('NavigationParam_Navigation1')

      Navigation({}) {
        List({ space: 5, initialIndex: 0 }) {
          ForEach(this.arr, (item: number) => {
            ListItem() {
              Text('' + item)
                .width('90%')
                .height(30)
                .backgroundColor('#3366CC')
                .borderRadius(15)
                .fontSize(16)
                .textAlign(TextAlign.Center)
            }
          }, (item: number) => String(item))
        }
        .listDirection(Axis.Vertical)
        .height(90)
        .margin({ top: 10, left: 18 } as Margin)
        .width('100%')
      }
      .title("test_string_title")
      .titleMode(NavigationTitleMode.Free)
      .key('NavigationParam_Navigation2')
    }
  }
}
