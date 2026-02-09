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
  Entry,Component,$r,Scroll,Builder,List,ListItem,Resource,AnimateParam,NavPathInfo,
  NavigationTitleMode,NavigationMode,Column,Navigation,ButtonType,NavDestination,Stack,ColumnOptions,NavigationTransitionProxy,
  Position,EffectType,EffectComponent,Text,Color,Flex,FlexDirection,ItemAlign,Row,Button,ClickEvent,NavDestinationMode,
  FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle, CalendarAlign, NavContentInfo,NavigationOperation,NavigationAnimatedTransition
,NavPathStack} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,Provide,Consume
} from '@ohos.arkui.stateManagement';
import {MessageManager,Callback,Message} from '../../../common/MessageManager';
import { AppStorage } from '@ohos.arkui.stateManagement';
import {CustomTransition} from './CustomNavigationUtils'
let durationOne = 1000
@Entry
@Component
struct navigationApi1{
  @State opacity1:number = 1
  @State timeout: number = 1000
  @State durationOne: number = 1000
  @State text: string = ''

  @Provide({alias:"pageInfo"}) pageInfos:NavPathStack = new  NavPathStack()

  @Builder PageMap(name: string, param: Object|null|undefined) {
    if (name == 'pageOne'){
      pageOne()
    }
  }

  aboutToAppear(){
    CustomTransition.getInstance().registerNavParam('Index',(isPush:boolean, onFinish: ()=> void, isexit:boolean, isPop:boolean) => {
      if (isexit && isPop == false) {
        this.opacity1 = 0
        this.getUIContext()?.animateTo({duration: durationOne, onFinish:onFinish} as AnimateParam, () => {
          this.opacity1 = 1
        })
      }else if (isPush && isPop == false){
        this.opacity1 = 0
        this.getUIContext()?.animateTo({duration: durationOne, onFinish:onFinish} as AnimateParam, () => {
          this.opacity1 = 1
        })
      }else if (isPop){
        this.opacity1 = 0
        this.getUIContext()?.animateTo({duration: durationOne, onFinish:onFinish} as AnimateParam, () => {
          this.opacity1 = 1
        })
      }
    })
  }

  build(){
    Navigation(this.pageInfos){
      Column(){
        Text(this.text).width('80%').fontSize(12).key('navigationApi1_text1')
        Button('pushPath').onClick((e:ClickEvent) => {
          this.pageInfos.pushPathByName('pageOne',null)
        }).id('navigationApi1_btn1')
      }.opacity(this.opacity1)
    }
    .mode(NavigationMode.Split)
    .navBarWidth('30%')
    .title('main')
    .navDestination(this.PageMap)
    .customNavContentTransition((from: NavContentInfo, to: NavContentInfo, operation: NavigationOperation) => {
      this.text = NavigationOperation[operation] + ''
      console.log(`current info: ${to.name}, index: ${to.index}, mode: ${to.mode}`);
      console.log(`pre info: ${from.name}, index: ${from.index}, mode: ${from.mode}`);
      console.log(`operation: ${operation}`)
      let customAnimation: NavigationAnimatedTransition = {
        onTransitionEnd: () => {

        },
        timeout: 700,
        transition: (transitionContext: NavigationTransitionProxy)=>{
          let onFinish:() => void = () => {
            transitionContext.finishTransition()
          }
          console.log(`CustomTransitiontransition1`)
          let fromAnimatedFunc: ((isPush: boolean, onFinish: () => void,isexit: boolean, isPop: boolean) => void) | undefined
          fromAnimatedFunc = CustomTransition.getInstance().getNavParam(transitionContext?.from?.name??'')
          console.log(`CustomTransitiontransition2`)
          if (fromAnimatedFunc != undefined && operation === NavigationOperation.PUSH) {
            fromAnimatedFunc(operation === NavigationOperation.PUSH, onFinish,false,false)
          }else if (fromAnimatedFunc != undefined && operation === NavigationOperation.POP) {
            fromAnimatedFunc(operation === NavigationOperation.POP, onFinish,false,false)
          }
          console.log(`CustomTransitiontransition3`)
          let toAnimatedFunc:((isPush:boolean,onFinish:() => void, isexit:boolean, isPop:boolean) => void) | undefined
          toAnimatedFunc = CustomTransition.getInstance().getNavParam(transitionContext.to.name??'')
          console.log(`CustomTransitiontransition4`)
          if (toAnimatedFunc != undefined && operation == NavigationOperation.PUSH) {
            toAnimatedFunc(operation == NavigationOperation.PUSH, onFinish,true,false)
          }
          console.log(`CustomTransitiontransition5`)
        }
      };
      return customAnimation;
    })
  }
}

@Component
export  struct  pageOne{
  @Consume('pageInfo') pageInfos:NavPathStack = new  NavPathStack()
  @State opacity1: number = 1
  @State duration: int = durationOne

  aboutToAppear(){
    CustomTransition.getInstance().registerNavParam('Index',(isPush:boolean, onFinish: ()=> void, isexit:boolean, isPop:boolean) => {
      if (isexit && isPop == false) {
        this.opacity1 = 0
        this.getUIContext()?.animateTo({duration: durationOne, onFinish:onFinish} as AnimateParam, () => {
          this.opacity1 = 1
        })
      }else if (isPush && isPop == false){
        this.opacity1 = 0
        this.getUIContext()?.animateTo({duration: durationOne, onFinish:onFinish} as AnimateParam, () => {
          this.opacity1 = 1
        })
      }else if (isPop){
        this.opacity1 = 0
        this.getUIContext()?.animateTo({duration: durationOne, onFinish:onFinish} as AnimateParam, () => {
          this.opacity1 = 1
        })
      }
    })
  }

  aboutToDisappear(){
    CustomTransition.getInstance().unRegisterNavParam('pageOne')
  }

  build(){
    NavDestination(){
      Column(){
        Button('pop').onClick((e: ClickEvent) => {
          this.pageInfos.pop()
        }).id('navigationApi1_btn2')
      }.width('100%').height('100%')
    }.title('pageOne').opacity(this.opacity1)
  }
}