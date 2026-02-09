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
  Entry,Component,$r,Scroll,Builder,List,ListItem,Resource,PopInfo,AnimateParam,Search,TextAlign,Axis,NavBarPosition,FlexAlign,NavPathInfo,NavDestinationContext,
  NavigationTitleMode,Image,NavigationMode,Column,Navigation,ButtonType,NavDestination,Stack,ColumnOptions,TextInput,SearchController,NavigationOperation,PanGesture,
  Position,EffectType,Text,Color,Flex,FlexDirection,ItemAlign,Row,Button,ClickEvent,NavDestinationMode,Dimension,TextOverflow,GestureEvent,
  FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle, NavigationInterception,CalendarAlign, Visibility,NavigationCommonTitle,NavDestinationCommonTitle,Alignment,BarStyle,LaunchMode
,NavPathStack} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,Provide
} from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Callback } from '@ohos.base'
class DerivedNavPathStack extends NavPathStack{

  getParent(): NavPathStack | null {
    return super.getParent()
  }
}


@Entry
@Component
struct NavPathStack21{
  derivedStack:DerivedNavPathStack = new DerivedNavPathStack()
  faStack:NavPathStack = new NavPathStack()
  @State text1:string = ''

  @Builder
  pageMap(name:string){
    if (name == 'pageOne'){
      console.log('++++++++++++++++++1.2.1')
      PageOne()
      console.log('++++++++++++++++++1.2.2')
    }else if(name == 'pageTwo'){
      PageTwo()
    }else if(name == 'pageThree'){
      PageThree()
    }
  }

  build() {
    Navigation(this.faStack){
      Column(){
        Button('父navigation push pageOne').onClick((event: ClickEvent) => {
          console.log('++++++++++++++++++1.1')
          this.faStack.pushPath(new NavPathInfo('pageOne',null))
          console.log('++++++++++++++++++1.2')
        }).id('NavPathStack21_btn1')
        Text(this.text1).id('NavPathStack21_text1')
        Button('子navigation getParent且清除Navigation的路由栈').onClick((event: ClickEvent) => {
          console.log('++++++++++++++++++2.11111111')
          let stack = this.derivedStack.getParent()  //app died
          console.log('++++++++++++++++++2.1222222')
          if (stack){
            stack.clear()
            console.log('++++++++++++++++++2.1')
            this.text1 = '' + this.faStack.size()
            console.log('++++++++++++++++++2.2')
          }
        }).id('NavPathStack21_btn2')

      }
      Navigation(this.derivedStack){

      }.navDestination(this.pageMap)
    }
    .title('navigation')
    .navDestination(this.pageMap)
    .mode(NavigationMode.Split)
	.navBarWidth('30%')
  }
}


@Component
struct  PageOne{
  derivedStack:DerivedNavPathStack = new DerivedNavPathStack()

  build() {
    NavDestination(){
      Column(){
        console.log('++++++++++++++++++1.2.1.1')
        Text('pageOne').id('NavPathStack21_pageOne_text1')
        console.log('++++++++++++++++++1.2.1.2')
      }
    }
    .title('pageOne')
  }
}

@Component
struct  PageTwo{
  derivedStack:DerivedNavPathStack = new DerivedNavPathStack()

  build() {
    NavDestination(){
      Column(){
        Text('pageTwo').id('NavPathStack21_pageTwo_text1')
      }
    }
    .title('pageTwo')
  }
}

@Component
struct  PageThree{
  derivedStack:DerivedNavPathStack = new DerivedNavPathStack()

  build() {
    NavDestination(){
      Column(){
        Text('pageThree').id('NavPathStack21_pageThree_text1')
      }
    }
    .title('pageThree')
  }
}
