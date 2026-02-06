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
  Entry,Component,$r,Scroll,Builder,List,ListItem,Resource,AnimateParam,Search,TextAlign,Axis,NavBarPosition,FlexAlign,NavPathInfo,NavDestinationContext,
  NavigationTitleMode,Image,NavigationMode,Column,Navigation,ButtonType,NavDestination,Stack,ColumnOptions,TextInput,SearchController,NavigationOperation,PanGesture,
  Position,EffectType,Text,Color,Flex,FlexDirection,ItemAlign,Row,Button,ClickEvent,NavDestinationMode,Dimension,TextOverflow,GestureEvent,PopInfo,
  FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle, CalendarAlign, Visibility,NavigationCommonTitle,NavDestinationCommonTitle,Alignment,BarStyle,LaunchMode
,NavPathStack} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,Provide
} from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';
class resultClassTest {
  constructor(value: string) {
    this.value = value;
  }
  value: string = 'text'
}


@Entry
@Component
struct NavigationOnPop {
  @State str1:string = ''
  @State pageInfos: NavPathStack = new NavPathStack();


  @Builder
  pageOneTmp() {
    NavDestination() {
      Column({ space: 10 } as ColumnOptions) {
        Button('pop')
          .onClick((e: ClickEvent) => {
            this.pageInfos.pop(new resultClassTest('pageOnePop'));
          })
          .id('NavigationOnPop_pop')
      }
    }.title('pageOne')
  }


  @Builder
  PageMap(name: string, param:Object|null|undefined): void {
    if (name === 'pageOne') {
      this.pageOneTmp()
    }
  }

  build() {
    Column({ space: 5 } as ColumnOptions){
      Text(this.str1).id('NavigationOnPop_text1')

      Navigation(this.pageInfos) {
        Column({ space: 10 } as ColumnOptions) {
          Button('pushPath pageOne')
            .onClick((e: ClickEvent)=>{
              console.log('+++++++++++++++++++1')
              this.pageInfos.pushPath(new NavPathInfo('pageOne','str',(popInfo: PopInfo)=>{
                console.log('+++++++++++++++++++2')
                console.log('popInfo.info.param'+popInfo.info.param)
                this.str1 = 'page:' + popInfo.info.name + ';param:' + popInfo.info.param + ';result:' + JSON.stringify(popInfo.result);
              }))
            })
            .id('NavigationOnPop_pageOne')
        }
      }
      .title('NavIndex')
      .navDestination(this.PageMap)
    }

  }
}
