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
  FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle, CalendarAlign, Visibility,NavigationCommonTitle,NavDestinationCommonTitle
,NavPathStack} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,Provide
} from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';
interface Txt {
  text: string
}
@Entry
@Component
struct navigator_testcase {
  @State active: boolean = false
  @State params: Txt = { text: 'news' } as Txt

  build() {
    Column() {
      Navigation({}) {
        Text('Navigator test  go to Navigator， back called')
      }
      .key('navigator')


      Navigation({}) {
        Text('Navigator test  go to Navigator, router called')
      }
      .key('navigator2')


      Navigation({}) {
        Text('Navigator test  go to Navigator，changed called')
      }
      .key('navigator3')

    }.width(300)
    .height(300)
    .borderColor(Color.Pink)
    .borderWidth(2)
  }
}
