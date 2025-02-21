/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import {CustomTransition} from './CustomNavigationUtils'
let durationOne = 1000
@Entry
@Component
struct navigationApi1{
  @State opacity1:number = 1
  @State timeout: number = 1000
  @State durationOne: number = 1000
  @State text: string = ''

  @Provide('pageInfo') pageInfos:NavPathStack = new  NavPathStack()

  @Builder PageMap(name:string){
    if (name === 'pageOne'){
      pageOne()
    }
  }

  aboutToAppear(){
    CustomTransition.getInstance().registerNavParam('Index',(isPush:boolean, onFinish: ()=> void, isexit:boolean, isPop:boolean) => {
      if (isexit && isPop == false) {
        this.opacity1 = 0
        animateTo({duration: durationOne, onFinish:onFinish}, () => {
          this.opacity1 = 1
        })
      }else if (isPush && isPop == false){
        this.opacity1 = 0
        animateTo({duration: durationOne, onFinish:onFinish}, () => {
          this.opacity1 = 1
        })
      }else if (isPop){
        this.opacity1 = 0
        animateTo({duration: durationOne, onFinish:onFinish}, () => {
          this.opacity1 = 1
        })
      }
    })
  }

  build(){
    Navigation(this.pageInfos){
      Column(){
        Text(this.text).width('80%').fontSize(12).key('navigationApi1_text1')
        Button('pushPath').onClick(() => {
          this.pageInfos.pushPath({name: 'pageOne'})
        }).id('navigationApi1_btn1')
      }.opacity(this.opacity1)
    }
    .mode(NavigationMode.Split)
    .title('main')
    .navDestination(this.PageMap)
    .customNavContentTransition((from: NavContentInfo, to: NavContentInfo, operation: NavigationOperation) => {
      this.text = NavigationOperation[operation] + ''
      if (from.mode == NavDestinationMode.DIALOG || to.mode == NavDestinationMode.DIALOG) {
        return undefined;
      }
      console.log(`current info: ${to.name}, index: ${to.index}, mode: ${to.mode}`);
      console.log(`pre info: ${from.name}, index: ${from.index}, mode: ${from.mode}`);
      console.log(`operation: ${operation}`)
      if (from.index === -1) {
        return undefined;
      }
      let customAnimation: NavigationAnimatedTransition = {
        onTransitionEnd: () => {

        },
        timeout: 700,
        transition: (transitionContext)=>{
          let onFinish:() => void = () => {
            transitionContext.finishTransition()
          }

          let fromAnimatedFunc: (isPush: boolean, onFinish: () => void,isexit: boolean, isPop: boolean) => void
          fromAnimatedFunc = CustomTransition.getInstance().getNavParam(transitionContext.from.name)
          if (fromAnimatedFunc != undefined && operation === NavigationOperation.PUSH) {
            fromAnimatedFunc(operation === NavigationOperation.PUSH, onFinish,false,false)
          }else if (fromAnimatedFunc != undefined && operation === NavigationOperation.POP) {
            fromAnimatedFunc(operation === NavigationOperation.POP, onFinish,false,false)
          }

          let toAnimatedFunc:(isPush:boolean,onFinish:() => void, isexit:boolean, isPop:boolean) => void
          toAnimatedFunc = CustomTransition.getInstance().getNavParam(transitionContext.to.name)
          if (toAnimatedFunc != undefined && operation == NavigationOperation.PUSH) {
            toAnimatedFunc(operation == NavigationOperation.PUSH, onFinish,true,false)
          }
        }
      };
      return customAnimation;
    })
  }
}

@Component
export  struct  pageOne{
  @Consume('pageInfo') pageInfos:NavPathStack
  @State opacity1: number = 1
  @State duration: number = durationOne

  aboutToAppear(){
    CustomTransition.getInstance().registerNavParam('Index',(isPush:boolean, onFinish: ()=> void, isexit:boolean, isPop:boolean) => {
      if (isexit && isPop == false) {
        this.opacity1 = 0
        animateTo({duration: durationOne, onFinish:onFinish}, () => {
          this.opacity1 = 1
        })
      }else if (isPush && isPop == false){
        this.opacity1 = 0
        animateTo({duration: durationOne, onFinish:onFinish}, () => {
          this.opacity1 = 1
        })
      }else if (isPop){
        this.opacity1 = 0
        animateTo({duration: durationOne, onFinish:onFinish}, () => {
          this.opacity1 = 1
        })
      }
    })
  }

  aboutToDisappear(){
    CustomTransition.getInstance().unRegisterNavParam('pageOne')
  }

  build(){
    Scroll(){
      NavDestination(){
        Column(){
          Button('pop').onClick(() => {
            this.pageInfos.pop()
          }).id('navigationApi1_btn2')
        }.width('100%').height('100%')
      }.title('pageOne').opacity(this.opacity1)
    }
  }
}