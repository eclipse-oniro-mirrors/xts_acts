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
  Entry,Component,$r,Scroll,Builder,List,ListItem,Resource,Curve,PopInfo,HorizontalAlign,AnimateParam,NavDestinationTransition,Search,TextAlign,Axis,NavBarPosition,FlexAlign,NavPathInfo,NavDestinationContext,
  NavigationTitleMode,Image,NavigationMode,Column,NavDestinationActiveReason,Navigation,ButtonType,NavDestination,Stack,ColumnOptions,TextInput,SearchController,NavigationOperation,PanGesture,
  Position,EffectType,EffectComponent,Text,Color,Flex,FlexDirection,ItemAlign,Row,Button,ClickEvent,NavDestinationMode,Dimension,TextOverflow,GestureEvent,
  FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle, CalendarAlign, Visibility,NavigationCommonTitle,NavDestinationCommonTitle,Alignment,BarStyle,LaunchMode
,NavPathStack,NavDestinationContext} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,Provide,Consume
} from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { BusinessError } from '@ohos.base';
import events_emitter from '@ohos.events.emitter'

@Component
struct PageOne {
  @State tag:Object|null|undefined = ""
  @State param:string = ""

  build() {
    NavDestination() {
      Text(this.tag?.toString() ?? "")
    }.title('pageOne Standard')
    .onActive((reason: NavDestinationActiveReason) => {
      this.tag = reason + '';
      console.log(`${this.tag} pageOne is onActive: ${reason}`);
      console.log(`${this.tag} pageOne param is : ${this.param}`);
      AppStorage.setOrCreate<NavDestinationActiveReason>('onActive', reason);
    })
    .onInactive((reason: NavDestinationActiveReason) => {
      this.tag = reason + ''
      console.log(`${this.tag} pageOne is onInActive: ${reason}`);
      AppStorage.setOrCreate<NavDestinationActiveReason>('onInactive', reason);
    })
    .onReady((context:NavDestinationContext) => {
      // this.param = context?.pathInfo?.param as string;
      console.log(`onReady pageOne is param: ${this.param}`)
    })
  }
}

@Component
export struct CommonNavigation {
  pathStack?: NavPathStack
  // @Consume('pathStack') pathStack: NavPathStack;
  title:string = ''

  @Builder
  PageBuilder(name: string, param: Object|null|undefined) {
    if (name == 'pageOne') {
      PageOne({tag: param })
    }
  }

  build() {
    Navigation(this.pathStack ?? {} as NavPathStack) {
    }.title(this.title)
    .navDestination(this.PageBuilder)
  }
}