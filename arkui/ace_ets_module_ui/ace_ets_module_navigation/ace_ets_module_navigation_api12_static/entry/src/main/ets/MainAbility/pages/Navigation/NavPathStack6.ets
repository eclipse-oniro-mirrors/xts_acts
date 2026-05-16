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
  id:string = '__default__'
  setId(id:string){
    this.id = id
  }
  getInfo():string{
    return "this page used Derived navPathStack,id:" + this.id
  }
  pushPath(info: NavPathInfo, animated?: boolean): void {
    super.pushPath(info,animated)
  }
  pushPathByName1(name: string, param: Object, animated?: boolean | undefined): void{
    super.pushPathByName(name,param,animated)
  }

  getAllPathName(): string[] {
    return super.getAllPathName()
  }
  getParamByIndex(index: int): Object|null|undefined {
    return super.getParamByIndex(index)
  }
  getParamByName(name: string): Array<Object|null|undefined> {
    return super.getParamByName(name)
  }
  getIndexByName(name: string): Array<int> {
    return super.getIndexByName(name)
  }
  size(): int {
    return super.size()
  }
  clear(animated?: boolean | undefined): void {
    return super.clear(animated)
  }

}
class param{
  info:string = 'default_param'

  constructor(info:string) {
    this.info= info
  }
}

@Entry
@Component
struct NavPathStack6{
  derivedStack:DerivedNavPathStack = new DerivedNavPathStack()
  @State text1:string = ''
  @State text2:string = ''
  @State text3:string = ''
  @State text4:string = ''
  @State text5:string = ''

  @Builder
  pageMap(name:string){
    if (name == 'pageOne'){
      NavPathStack6_PageOne()
    }else if(name == 'pageTwo'){
      NavPathStack6_PageTwo()
    }else if(name == 'pageThree'){
      NavPathStack6_PageThree()
    }
  }

  build() {
    Navigation(this.derivedStack){
      Column(){
        Button('pushPath pageOne').onClick((event: ClickEvent) => {
          this.derivedStack.pushPath(new NavPathInfo('pageOne',new param('ok')))
        }).id('NavPathStack6_btn1')

        Button('pushPathByName pageTwo').onClick((event: ClickEvent) => {
          this.derivedStack.pushPathByName1('pageTwo',new param('ok'))
        }).id('NavPathStack6_btn2')

        Text(this.text1).id('NavPathStack6_text1')
        Button('getAllPathName').onClick((event: ClickEvent) => {
          this.text1 = '' + JSON.stringify(this.derivedStack.getAllPathName())
        }).id('NavPathStack6_btn3')

        Button('clear').onClick((event: ClickEvent) => {
          this.derivedStack.clear()
        }).id('NavPathStack6_btn4')

        Text(this.text2).id('NavPathStack6_text2')
        Button('size').onClick((event: ClickEvent) => {
          this.text2 = '' + this.derivedStack.size()
        }).id('NavPathStack6_btn5')

        Text(this.text3).id('NavPathStack6_text3')
        Button('getParamByName pageOne').onClick((event: ClickEvent) => {
          this.text3 = JSON.stringify(this.derivedStack.getParamByName('pageOne'))
        }).id('NavPathStack6_btn6')

        Text(this.text4).id('NavPathStack6_text4')
        Button('getParamByIndex 0').onClick((event: ClickEvent) => {
          this.text4 = JSON.stringify(this.derivedStack.getParamByIndex(0))
        }).id('NavPathStack6_btn7')

        Text(this.text5).id('NavPathStack6_text5')
        Button('getIndexByName pageOne').onClick((event: ClickEvent) => {
          this.text5 = JSON.stringify(this.derivedStack.getIndexByName('pageOne'))
        }).id('NavPathStack6_btn8')



      }
    }
    .title('navigation')
    .navDestination(this.pageMap)
    .mode(NavigationMode.Split)
  }
}


@Component
struct  NavPathStack6_PageOne{
  derivedStack:DerivedNavPathStack = new DerivedNavPathStack()

  build() {
    NavDestination(){
      Column(){
        Text('pageOne').id('NavPathStack6_pageOne_text1')
      }
    }
    .title('pageOne')
  }
}

@Component
struct  NavPathStack6_PageTwo{
  derivedStack:DerivedNavPathStack = new DerivedNavPathStack()

  build() {
    NavDestination(){
      Column(){
        Text('pageTwo').id('NavPathStack6_pageTwo_text1')
      }
    }
    .title('pageTwo')
  }
}

@Component
struct  NavPathStack6_PageThree{
  derivedStack:DerivedNavPathStack = new DerivedNavPathStack()

  build() {
    NavDestination(){
      Column(){
        Text('pageThree').id('NavPathStack6_pageThree_text1')
      }
    }
    .title('pageThree')
  }
}
