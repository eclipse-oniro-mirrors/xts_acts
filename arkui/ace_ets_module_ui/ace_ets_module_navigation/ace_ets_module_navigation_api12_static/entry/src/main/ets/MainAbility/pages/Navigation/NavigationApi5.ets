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
  Entry,Component,$r,Scroll,Builder,List,ListItem,Resource,AnimateParam,Search,TextAlign,Axis,NavDestinationInfo,NavBarPosition,FlexAlign,NavPathInfo,NavDestinationContext,
  NavigationTitleMode,Image,NavigationMode,Column,Navigation,ButtonType,NavDestination,Stack,ColumnOptions,TextInput,SearchController,NavigationOperation,PanGesture,
  Position,EffectType,Text,Color,Flex,FlexDirection,ItemAlign,NavigationTransitionProxy,Row,Button,ClickEvent,NavDestinationMode,Dimension,TextOverflow,GestureEvent,NavigationAnimatedTransition,
  FontWeight,Axis,Margin,Swiper,ForEach,PickerTextStyle, CalendarAlign, Visibility,NavContentInfo,NavigationCommonTitle,NavDestinationCommonTitle,Alignment,BarStyle,LaunchMode
,NavPathStack} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,Provide
} from '@ohos.arkui.stateManagement';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { CustomTransition } from './CustomNavigationUtils';
import observer from '@ohos.arkui.observer'

@Entry
@Component
struct NavigationApi5{
  @State pageInfos:NavPathStack = new NavPathStack()
  isInterception:boolean = true
  @State text:string = ''
  customTransition:CustomTransition = new CustomTransition()
  navDesUpdateCallback(info:NavDestinationInfo): void{
    console.log(`info,${JSON.stringify(info)}`)
  }
  observerOn(){

  }
  observerOff(){
    observer.offNavDestinationUpdate(this.navDesUpdateCallback)
  }

  @Builder
  PageOne(){
    NavDestination(){
      console.log('+++++++++++123')
      Text('pageOne').id('NavigationApi5_text1')
    }
    .title('pageOne')
    .onReady((context:NavDestinationContext) => {
      console.log('+++++++++++pageone onReady1')
      try{
        this.text = JSON.stringify(context.getConfigInRouteMap()?.pageSourceFile)  //这个方法的取值是undefined
      }catch(err){
        console.log('+++++++++++pageone onReadyError',err)
      }
      console.log('+++++++++++pageone onReady2'+this.text )
    })
  }

  @Builder
  PageMap(name:string){
    if (name == 'pageOne'){
      this.PageOne()
    }
  }

  build() {
    Navigation(this.pageInfos){
      Scroll(){
        Column(){
          Button('push pageOne').onClick((e: ClickEvent) => {
            console.log('++++++++++++++++++++++++1')
            this.pageInfos.pushPath(new NavPathInfo('pageOne',null))
            console.log('++++++++++++++++++++++++2')
          }).id('NavigationApi5_btn1')
        }
      }
    }
    .title('navigation')
    .navDestination(this.PageMap)
    .customNavContentTransition((from:NavContentInfo,to:NavContentInfo,operation:NavigationOperation) => {
      if (from.mode == NavDestinationMode.DIALOG || to.mode == NavDestinationMode.DIALOG) {
        return undefined;
      }
      if (from.index === -1 || to.index === -1) {
        return undefined
      }
      this.customTransition.getInstance().operation = operation;
      if (this.customTransition.getInstance().interactive){
        let customAnimation: NavigationAnimatedTransition = {
          onTransitionEnd:(isSuccess:boolean) => {
            this.customTransition.getInstance().recoverState();
            this.customTransition.getInstance().proxy = undefined;
          },
          transition:(transitionProxy:NavigationTransitionProxy) => {
            this.customTransition.getInstance().proxy = transitionProxy;
            let targetIndex:string|undefined = operation !== NavigationOperation.POP ? to.navDestinationId?.toString() : from.navDestinationId?.toString();
            if (targetIndex) {
              this.customTransition.getInstance().fireInteractiveAnimation(targetIndex,operation)
            }
          },
          isInteractive:this.customTransition.getInstance().interactive
        }
        return customAnimation
      }
      let customAnimation: NavigationAnimatedTransition = {
        onTransitionEnd:(isSuccess:boolean) => {
        },
        transition:(transitionProxy:NavigationTransitionProxy) => {
          if (from.navDestinationId === undefined || to.navDestinationId === undefined){
            return
          }
          let fromParam = this.customTransition?.getInstance()?.getAnimateParam(String(from?.navDestinationId));
          let toParam = this.customTransition?.getInstance()?.getAnimateParam(String(to?.navDestinationId));
          let isPush = operation !== NavigationOperation.POP;
          if (operation !== NavigationOperation.POP){
            if (toParam?.start) {
              toParam?.start?.(isPush,false);
            }
            this.getUIContext().animateTo({duration:500,onFinish:() => {
              transitionProxy.finishTransition();
            }},() => {
              if (toParam?.finish) {
                toParam?.finish?.(isPush,false)
              }
            })
          }else{
            if (toParam?.start) {
              toParam?.start?.(isPush,true);
            }
            this.getUIContext().animateTo({duration:500,onFinish:() => {
              transitionProxy.finishTransition();
            }},() => {
              if (fromParam?.finish) {
                fromParam?.finish?.(isPush,true)
              }
            })
          }
          transitionProxy.isInteractive = true
        }
      }
      return customAnimation;
    })
  }
}

