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
  FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle, CalendarAlign, Visibility,NavigationCommonTitle,NavDestinationCommonTitle,Alignment,BarStyle,LaunchMode
,NavPathStack} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,Provide
} from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';
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

  pushPathByName1(name: string, param: string, animated?: boolean | undefined): void{
    super.pushPathByName(name,param,animated)
  }

  pop(result?: Object | undefined, animated?: boolean | undefined): NavPathInfo | undefined {
    if(result == undefined){
      return super.pop(animated)
    }
    return super.pop(result as Object, animated as boolean)
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
struct NavPathStack22{
  derivedStack:DerivedNavPathStack = new DerivedNavPathStack()
  @State text1:string = ''

  @Builder
  PageOne(){
    NavDestination(){
      Column(){
        Text('pageOne').id('NavPathStack2_pageOne_text1')
      }
    }
    .title('pageOne')
    .onWillAppear((): void => {
      this.text1 += 'pageOne onWillAppear' + ' '
    })
    .onAppear((): void => {
      this.text1 += 'pageOne onAppear' + ' '
    })
    .onWillShow((): void => {
      this.text1 += 'pageOne onWillShow' + ' '
    })
    .onShown((): void => {
      this.text1 += 'pageOne onShown' + ' '
    })
    .onWillHide((): void => {
      this.text1 += 'pageOne onWillHide' + ' '
    })
    .onHidden((): void => {
      this.text1 += 'pageOne onHidden' + ' '
    })
    .onWillDisappear((): void => {
      this.text1 += 'pageOne onWillDisappear' + ' '
    })
    .onDisAppear((): void => {
      this.text1 += 'pageOne onDisAppear' + ' '
    })
  }

  @Builder
  PageTwo(){
    NavDestination(){
      Column(){
        Text('pageTwo').id('NavPathStack2_pageOne_text1')
      }
    }
    .title('pageTwo')
    .onWillAppear((): void => {
      this.text1 += 'pageTwo onWillAppear' + ' '
    })
    .onAppear((): void => {
      this.text1 += 'pageTwo onAppear' + ' '
    })
    .onWillShow((): void => {
      this.text1 += 'pageTwo onWillShow' + ' '
    })
    .onShown((): void => {
      this.text1 += 'pageTwo onShown' + ' '
    })
    .onWillHide((): void => {
      this.text1 += 'pageTwo onWillHide' + ' '
    })
    .onHidden((): void => {
      this.text1 += 'pageTwo onHidden' + ' '
    })
    .onWillDisappear((): void => {
      this.text1 += 'pageTwo onWillDisappear' + ' '
    })
    .onDisAppear((): void => {
      this.text1 += 'pageTwo onDisAppear' + ' '
    })
  }

  @Builder
  PageThree(){
    NavDestination(){
      Column(){
        Text('pageThree').id('NavPathStack2_pageOne_text1')
      }
    }
    .title('pageThree')
    .onWillAppear((): void => {
      this.text1 += 'pageThree onWillAppear' + ' '
    })
    .onAppear((): void => {
      this.text1 += 'pageThree onAppear' + ' '
    })
    .onWillShow((): void => {
      this.text1 += 'pageThree onWillShow' + ' '
    })
    .onShown((): void => {
      this.text1 += 'pageThree onShown' + ' '
    })
    .onWillHide((): void => {
      this.text1 += 'pageThree onWillHide' + ' '
    })
    .onHidden((): void => {
      this.text1 += 'pageThree onHidden' + ' '
    })
    .onWillDisappear((): void => {
      this.text1 += 'pageThree onWillDisappear' + ' '
    })
    .onDisAppear((): void => {
      this.text1 += 'pageThree onDisAppear' + ' '
    })
  }


  @Builder
  pageMap(name:string){
    if (name == 'pageOne'){
      this.PageOne()
    }else if(name == 'pageTwo'){
      this.PageTwo()
    }else if(name == 'pageThree'){
      this.PageThree()
    }
  }

  build() {
    Navigation(this.derivedStack){
      Scroll(){
        Column(){
          Text(this.text1).id('NavPathStack22_text1').height('5%')
          Button('pushPath pageOne').onClick((event: ClickEvent) => {
            this.derivedStack.pushPath(new NavPathInfo('pageOne',null))
          }).id('NavPathStack22_btn1').height('5%')
          Button('pushPathByName pageTwo').onClick((event: ClickEvent) => {
            console.log('++++++++++++++++++1')
            this.derivedStack.pushPathByName1('pageTwo','a')
            console.log('++++++++++++++++++2')
          }).id('NavPathStack22_btn2').height('5%')
          Button('pop').onClick((event: ClickEvent) => {
            console.log('++++++++++++++++++3')
            this.derivedStack.pop()
            console.log('++++++++++++++++++4')
          }).id('NavPathStack22_btn3').height('5%')
        }
      }.height('100%')
    }
    .title('navigation')
    .navDestination(this.pageMap)
    .mode(NavigationMode.Split)
    .navBarWidth('30%')
  }
}




