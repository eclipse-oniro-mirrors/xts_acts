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
  setInterception(interception: NavigationInterception): void {
    return super.setInterception(interception)
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
struct NavPathStack18{
  derivedStack:DerivedNavPathStack = new DerivedNavPathStack()

  @Builder
  pageMap(name:string){
    if (name == 'pageOne'){
      PageOne()
    }else if(name == 'pageTwo'){
      PageTwo()
    }else if(name == 'pageThree'){
      PageThree()
    }
  }

  build() {
    Navigation(this.derivedStack){
      Column(){
        Button('pushPath pageOne').onClick((event: ClickEvent) => {
          console.log('++++++++++++++1')
          this.derivedStack.pushPath(new NavPathInfo('pageOne',new param('ok')))
        }).id('NavPathStack18_btn1')

        Button('pushPathByName pageTwo').onClick((event: ClickEvent) => {
          console.log('++++++++++++++2')
          this.derivedStack.pushPathByName1('pageTwo',new param('ok'))
          console.log('++++++++++++++2.1')
        }).id('NavPathStack18_btn2')

        Button('跳转到pageTwo,调用didShow,pushPath到pageThree').onClick((event: ClickEvent) => {
          console.log('++++++++++++++3')
          this.derivedStack.pushPath(new NavPathInfo('pageTwo',null))
          this.derivedStack.setInterception({
            willShow:(from:NavDestinationContext| "navBar",to:NavDestinationContext|"navBar",operation:NavigationOperation,animated:boolean) => {
            },
            didShow:(from:NavDestinationContext| "navBar",to:NavDestinationContext|"navBar",operation:NavigationOperation,animated:boolean) => {
              if (typeof to === "string") {
                return
              }
              let target:NavDestinationContext = to as NavDestinationContext
              if (target.pathInfo.name === 'pageTwo'){
                target.pathStack.pop()
                this.derivedStack.pushPath(new NavPathInfo('pageThree',null))
              }
            }
          })
        }).id('NavPathStack18_btn3')

      }
    }
    .title('navigation')
    .navDestination(this.pageMap)
    .mode(NavigationMode.Split)
  }
}


@Component
struct  PageOne{
  derivedStack:DerivedNavPathStack = new DerivedNavPathStack()

  build() {
    NavDestination(){
      Column(){
        Text('pageOne').id('NavPathStack18_pageOne_text1')
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
        Text('pageTwo').id('NavPathStack18_pageTwo_text1')
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
        Text('pageThree').id('NavPathStack18_pageThree_text1')
      }
    }
    .title('pageThree')
  }
}
