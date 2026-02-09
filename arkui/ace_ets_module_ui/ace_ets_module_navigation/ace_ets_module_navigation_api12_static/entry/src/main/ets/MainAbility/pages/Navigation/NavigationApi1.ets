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
  Position,EffectType,Text,Color,Flex,FlexDirection,ItemAlign,Row,Button,ClickEvent,NavDestinationMode,Dimension,TextOverflow,GestureEvent,
  FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle, CalendarAlign, Visibility,NavigationCommonTitle,NavDestinationCommonTitle,Alignment,BarStyle,LaunchMode
,NavPathStack} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,Provide
} from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';
@Entry
@Component
struct NavigationApi1 {
  pageInfos: NavPathStack = new NavPathStack()
  isUseInterception: boolean = false;

  @Builder
  PageMap(name:string){
    if (name === 'pageOne'){
      pageOne()
    }else if (name === 'pageTwo'){
      pageTwo()
    }
  }

  build() {
    Navigation(this.pageInfos) {
      Column() {
        Button('pushPath', { stateEffect: true, type: ButtonType.Capsule })
          .width('80%')
          .height(40)
          .margin(20)
          .onClick((e: ClickEvent) => {
            this.pageInfos.pushPath(new NavPathInfo('pageTwo',null))
            console.log("==============================")
            this.pageInfos.setInterception({
              willShow: (from: NavDestinationContext | "navBar", to: NavDestinationContext | "navBar",
                         operation: NavigationOperation, animated: boolean) => {
                console.log("==============================1")
                this.pageInfos.pop();
                console.log("==============================2")
                try{
                  this.pageInfos.pushPath(new NavPathInfo('pageOne',null)) //第二次执行的时候appDied
                }catch(err){
                  console.log('======================pushPathError',err)
                }
                console.log("==============================3")
              }
            })
          })
          .key('NavigationApi1_btn1')

      }
    }.title('NavIndex').navDestination(this.PageMap)
  }
}


@Component
export struct pageOne {

  pageInfos: NavPathStack = new NavPathStack()

  build() {
    NavDestination() {
      Column(){
        Text('pageOne').id('NavigationApi1_text1')
      }

    }.title('pageOne')
    .onBackPressed(() => {
      console.log("==============================pageOne1")
      const popDestinationInfo = this.pageInfos.pop() // 弹出路由栈栈顶元素
      console.log("==============================pageOne2")
      console.log('pop' + '返回值' + JSON.stringify(popDestinationInfo))
      console.log("==============================pageOne2.1")
      return true
    }).onReady((context: NavDestinationContext) => {
      console.log("==============================pageOne3")
      this.pageInfos = context.pathStack
      console.log("==============================pageOne4")
    })
  }
}
@Component
export struct pageTwo {

  pageInfos: NavPathStack = new NavPathStack()

  build() {
    NavDestination() {

    }.title('pageTwo')
    .onBackPressed((): boolean => {
      console.log("==============================pageTwo1")
      const popDestinationInfo = this.pageInfos.pop() // 弹出路由栈栈顶元素
      console.log("==============================pageTwo2")
      console.log('pop' + '返回值' + JSON.stringify(popDestinationInfo))
      console.log("==============================pageTwo3")
      return true
    }).onReady((context: NavDestinationContext) => {
      console.log("==============================pageTwo4")
      this.pageInfos = context.pathStack
      console.log("==============================pageTwo5")
    })
  }
}