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
  FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle, CalendarAlign, Visibility,NavigationCommonTitle,NavDestinationCommonTitle,Alignment
,NavPathStack} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,Provide,Consume
} from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';
@Entry
@Component
struct navigation_add4_1 {
  @Provide pageInfos: NavPathStack = new NavPathStack();

  @Builder PagesMap(name:string){
    if (name === 'pageOne'){
      pageOne()
    }else if (name === 'pageTwo'){
      pageTwo()
    }
  }

  onPageShow(): void {
    this.pageInfos.pushPath(new NavPathInfo('pageOne',null))
  }
  build() {
    Navigation(this.pageInfos) {
      Column(){
        Button('push pageOne').onClick((event: ClickEvent) => {
          this.pageInfos.pushPath(new NavPathInfo('pageOne',null))
        })
      }
    }
    .id('navigation_add4_1_navigation')
    .mode(NavigationMode.Stack)
    .navDestination(this.PagesMap)
    .height('100%')
    .width('100%')
  }
}

@Component
struct pageOne{
  @Consume('pageInfos') pageInfos:NavPathStack;
  @State x:string = '0'
  @State text1:string = ''
  rectWidth:number = 0
  @State index:number = 0
  build(){
    NavDestination(){
      Text(this.text1)
      Button('getAllPathName').onClick((event: ClickEvent) => {
        this.text1 = JSON.stringify(this.pageInfos.getAllPathName())
        console.log('++++++++++++++pageOne',this.pageInfos.getAllPathName())
      }).id('navigation_add4_1_pageOne_btn1')
      Button('pushPageTwo').onClick((event: ClickEvent) => {
        this.index = 0
      })
      Button('pop').onClick((event: ClickEvent) => {
        this.index = 1
      })
    }
    .title('pageOne')
    .onShown(() => {
      this.x = '0'
    })
    .translate({x:this.x,y:0,z:0})
    .gesture(PanGesture()
      .onActionStart((event:GestureEvent) => {
        this.rectWidth = event.target.area.width as number;
        if (event.offsetX < 0){
          if (this.index == 0 ) {
            this.pageInfos.pushPath(new NavPathInfo('pageTwo',null))
          }else if (this.index == 1 ) {
            this.pageInfos.pop()
          }
        }else{
          this.pageInfos.pop()
        }
      })
    )
  }
}

@Component
struct pageTwo{
  @Consume('pageInfos') pageInfos:NavPathStack;
  @State x:string = '0'
  rectWidth:number = 0
  @State text1:string = ''
  @State index:number = 0
  build(){
    NavDestination(){
      Text(this.text1).id('navigation_add4_1_pageTwo_text1')
      Button('getAllPathName').onClick((event: ClickEvent) => {
        this.text1 = JSON.stringify(this.pageInfos.getAllPathName())
        console.log('++++++++++++++pageTwo',this.pageInfos.getAllPathName())
      }).id('navigation_add4_1_pageTwo_btn1')
      Button('pushPageTwo').onClick((event: ClickEvent) => {
        this.index = 0
      })
      Button('pop').onClick((event: ClickEvent) => {
        this.index = 1
      })
    }
    .title('pageTwo')
    .onShown(() => {
      this.x = '0'
    })
    .translate({x:this.x,y:0,z:0})
    .gesture(PanGesture()
      .onActionStart((event:GestureEvent) => {
        this.rectWidth = event.target.area.width as number;
        if (event.offsetX < 0){
          if (event.offsetX < 0){
            if (this.index == 0 ) {
              this.pageInfos.pushPath(new NavPathInfo('pageTwo',null))
            }else if (this.index == 1 ) {
              this.pageInfos.pop()
            }
          }else{
            this.pageInfos.pop()
          }
        }else{
          this.pageInfos.pop()
        }
      })
    )
  }
}