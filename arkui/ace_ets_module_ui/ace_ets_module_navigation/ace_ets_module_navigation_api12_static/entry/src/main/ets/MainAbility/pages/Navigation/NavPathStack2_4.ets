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
  pushPathByName2(name: string, param: Object, onPop:Callback<PopInfo> , animated?: boolean | undefined): void{
    super.pushPathByName(name,param,onPop,animated)
  }
  pushDestination(info: NavPathInfo, animated?: boolean): Promise<void> {
    return super.pushDestination(info,animated)
  }

  pushDestinationByName1(name: string, param: Object, animated?: boolean ): Promise<void>{
    return super.pushDestinationByName(name,param,animated)
  }
  pushDestinationByName2(name: string, param: Object,onPop:Callback<PopInfo> , animated?: boolean ): Promise<void>{
    return super.pushDestinationByName(name,param,onPop,animated)
  }

  pop(result?: Object | undefined, animated?: boolean | undefined): NavPathInfo | undefined {
    return super.pop(result as Object,animated as boolean)
  }

  popToName(name: string, result?: Object , animated?: boolean): Int {
    return super.popToName(name,result as Object,animated as boolean)
  }

  popToIndex(index: int, result?: Object|undefined, animated?: boolean|undefined): void {
    return super.popToIndex(index,result as Object,animated as boolean)
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
struct NavPathStack2_4{
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
        Text('navigation').id('NavPathStack2_4_text1').height('5%')

        Button('pushPath pageOne').onClick((event: ClickEvent) => {
          this.derivedStack.pushPath(new NavPathInfo('pageOne',null))
        }).id('NavPathStack2_4_btn1').height('5%')

        Button('pushPathByName pageTwo').onClick((event: ClickEvent) => {
          this.derivedStack.pushPathByName1('pageTwo',new param('ok'))
        }).id('NavPathStack2_4_btn2').height('5%')

        Button('pushPathByName(onPop) pageThree').onClick((event: ClickEvent) => {
          this.derivedStack.pushPathByName2('pageThree',new param('ok'),(popInfo) => {
            console.log(popInfo.info.name)
          })
        }).id('NavPathStack2_4_btn3').height('5%')

        Button('pushDestination pageOne').onClick((event: ClickEvent) => {
          this.derivedStack.pushDestination(new NavPathInfo('pageOne',null))
        }).id('NavPathStack2_4_btn4').height('5%')

        Button('pushDestinationByName pageOne').onClick((event: ClickEvent) => {
          this.derivedStack.pushDestinationByName1('pageOne',new param('ok'))
        }).id('NavPathStack2_4_btn5').height('5%')

        Button('pushDestinationByName(onPop) pageOne').onClick((event: ClickEvent) => {
          this.derivedStack.pushDestinationByName2('pageOne',new param('ok'),(popInfo) => {
            console.log(popInfo.info.name)
          })
        }).id('NavPathStack2_4_btn6').height('5%')

        Button('pop').onClick((event: ClickEvent) => {
          let mes = this.derivedStack.pop()
          if (mes){
            console.log(JSON.stringify(mes))
          }
        }).id('NavPathStack2_4_btn7').height('5%')

        Button('pop(result)').onClick((event: ClickEvent) => {
          let mes = this.derivedStack.pop(new param('pop ok'),true)
          if (mes){
            console.log(JSON.stringify(mes))
          }
        }).id('NavPathStack2_4_btn8').height('5%')

        Button('popToName pageOne').onClick((event: ClickEvent) => {
          let mes = this.derivedStack.popToName('pageOne')
          console.log('' + mes)
        }).id('NavPathStack2_4_btn9').height('5%')

        Button('popToName(result) pageOne').onClick((event: ClickEvent) => {
          let mes = this.derivedStack.popToName('pageOne',new param('pop ok'))
          console.log('' + mes)
        }).id('NavPathStack2_4_btn10').height('5%')

        Button('popToIndex 0').onClick((event: ClickEvent) => {
          this.derivedStack.popToIndex(0)
        }).id('NavPathStack2_4_btn11').height('5%')

        Button('popToIndex(result) 0').onClick((event: ClickEvent) => {
          console.log('++++++++++++++++++++1')
          this.derivedStack.popToIndex(0,new param('pop ok')) //app died
          console.log('++++++++++++++++++++2')
        }).id('NavPathStack2_4_btn12').height('5%')
      }
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
        Text('pageOne').id('NavPathStack2_4_pageOne_text1')
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
        Text('pageTwo').id('NavPathStack2_4_pageTwo_text1')
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
        Text('pageThree').id('NavPathStack2_4_pageThree_text1')
      }
    }
    .title('pageThree')
  }
}
