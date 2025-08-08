/*
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
import { AnimateCallback, CustomTransition} from './CustomNavigationUtils';
import observer from '@ohos.arkui.observer'

@Entry
@Component
struct NavigationApi5{
  @State pageInfos:NavPathStack = new NavPathStack()
  isInterception:boolean = true
  @State text:string = ''

  navDesUpdateCallback(info:NavDestinationInfo){
    console.log(`info,${JSON.stringify(info)}`)
  }
  observerOn(){
    observer.on('scrollEvent', (info) => {
      console.info('scrollEventInfo', JSON.stringify(info.uniqueId));
    });
  }
  observerOff(){
    observer.off('navDestinationUpdate',this.navDesUpdateCallback)
  }

  @Builder
  PageOne(){
    NavDestination(){
      Text('pageOne').id('NavigationApi5_text1')
    }
    .title('pageOne')
    .onReady((context:NavDestinationContext) => {
      this.text = JSON.stringify(context.getConfigInRouteMap()?.pageSourceFile)
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
          Button('push pageOne').onClick(() => {
            this.pageInfos.pushPath({name:'pageOne'})
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
      CustomTransition.getInstance().operation = operation;
      if (CustomTransition.getInstance().interactive){
        let customAnimation: NavigationAnimatedTransition = {
          onTransitionEnd:(isSuccess:boolean) => {
            CustomTransition.getInstance().recoverState();
            CustomTransition.getInstance().proxy = undefined;
          },
          transition:(transitionProxy:NavigationTransitionProxy) => {
            CustomTransition.getInstance().proxy = transitionProxy;
            let targetIndex:string|undefined = operation !== NavigationOperation.POP ? to.navDestinationId?.toString() : from.navDestinationId?.toString();
            if (targetIndex) {
              CustomTransition.getInstance().fireInteractiveAnimation(targetIndex,operation)
            }
          },
          isInteractive:CustomTransition.getInstance().interactive
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
          let fromParam:AnimateCallback = CustomTransition.getInstance().getAnimateParam(from.navDestinationId.toString());
          let toParam:AnimateCallback = CustomTransition.getInstance().getAnimateParam(to.navDestinationId.toString());
          let isPush:boolean = operation !== NavigationOperation.POP;
          if (operation !== NavigationOperation.POP){
            if (toParam.start) {
              toParam.start(isPush,false);
            }
            animateTo({duration:500,onFinish:() => {
              transitionProxy.finishTransition();
            }},() => {
              if (toParam.finish) {
                toParam.finish(isPush,false)
              }
            })
          }else{
            if (toParam.start) {
              toParam.start(isPush,true);
            }
            animateTo({duration:500,onFinish:() => {
              transitionProxy.finishTransition();
            }},() => {
              if (fromParam.finish) {
                fromParam.finish(isPush,true)
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

