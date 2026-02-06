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
  Entry,Component,$r,Scroll,Builder,List,ListItem,Resource,AnimateParam,Search,TextAlign,Axis,
  NavigationTitleMode,Image,NavigationMode,Column,Navigation,ButtonType,NavDestination,Stack,ColumnOptions,
  Position,EffectType,EffectComponent,Text,Color,Flex,FlexDirection,ItemAlign,Row,Button,ClickEvent,
  FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle, CalendarAlign,List
,NavPathStack} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,Provide
} from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';
class ParamsClass {
  text: String;

  constructor(text: String) {
    this.text = text;
  }
}

@Entry
@Component
struct navigator_testcase {
  @State active: boolean = false
  @State params: ParamsClass = new ParamsClass('news')

  onPageShow() {
    console.info('Navigation page show called');
  }

  onBuildDone() {
    console.info('Navigation page build done called');
  }

  build() {
    Column() {
      Navigation({}) {
        Text('Navigation test  in Navigation，back')
      }
      .key('navigator')


      Navigation({}) {
        Text('Navigation test  in Navigation，push')
      }
      .key('navigator2')


      Navigation({}) {
        Text('Navigation test  in Navigation，replace')
      }
      .key('navigator3')

    }.width(300)
    .height(300)
    .borderColor(Color.Pink)
    .borderWidth(2)
  }
}
