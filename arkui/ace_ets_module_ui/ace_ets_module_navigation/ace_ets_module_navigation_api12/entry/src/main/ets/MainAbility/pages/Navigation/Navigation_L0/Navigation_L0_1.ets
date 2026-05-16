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

@Entry
@Component
struct Navigation_L0_1 {
  @Provide('pageInfos') pageInfos: NavPathStack = new NavPathStack();
  @State willShow:string = '';
  @State didShow:string = '';
  @State modeChange:string = '';

  @Builder PageMap(name:string){
    if (name === 'pageOne'){
      Navigation_L0_1_pageOne({
        willShow:this.willShow,
        didShow:this.didShow,
        modeChange:this.modeChange,
      })
    }else if (name === 'pageTwo'){
      Navigation_L0_1_pageTwo()
    }
  }

  build() {
    Navigation(this.pageInfos) {
      Button('pushPath pageOne').onClick((event: ClickEvent) => {
        this.pageInfos.pushPath({name:'pageOne'})
      }).id('Navigation_L0_1_btn1').height('5%')
      Text(this.willShow).id('Navigation_L0_1_text1').height('5%')
      Text(this.didShow).id('Navigation_L0_1_text2').height('5%')
      Text(this.modeChange).id('Navigation_L0_3_text1').height('5%')
    }
    .navDestination(this.PageMap)
    .height('100%')
    .width('100%')
    .title('navigation')
    .mode(NavigationMode.Split)
    .navBarWidth('30%')
  }
}

@Component
struct Navigation_L0_1_pageOne{
  @Consume('pageInfos') pageInfos:NavPathStack;
  @Link willShow:string;
  @Link didShow:string;
  @Link modeChange:string;
  build() {
    NavDestination(){
      Button('pushPath pageTwo').onClick((event: ClickEvent) => {
        this.pageInfos.pushPath({name:'pageTwo'})
        this.pageInfos.setInterception({
          willShow: (from: NavDestinationContext | "navBar", to: NavDestinationContext | "navBar",
                     operation: NavigationOperation, animated: boolean) => {
            if (typeof to === "string") {
              console.log("target page is navigation home");
              return;
            }
            let target1: NavDestinationContext = from as NavDestinationContext;
            let target2: NavDestinationContext = to as NavDestinationContext;
            this.willShow = JSON.stringify(target1.pathInfo.name) + ' ' + JSON.stringify(target2.pathInfo.name) + ' ' + operation + ' ' + animated

          },
          didShow: (from: NavDestinationContext | "navBar", to: NavDestinationContext | "navBar",
                    operation: NavigationOperation, isAnimated: boolean) => {

            if (typeof from === "string") {
              console.log("current transition is from navigation home");
            } else {
              console.log(`current transition is from  ${(from as NavDestinationContext).pathInfo.name}`)
            }
            if (typeof to === "string") {
              console.log("current transition to is navBar");
            } else {
              console.log(`current transition is to ${(to as NavDestinationContext).pathInfo.name}`);
            }

            let target1: NavDestinationContext = from as NavDestinationContext;
            let target2: NavDestinationContext = to as NavDestinationContext;
            this.didShow = JSON.stringify(target1.pathInfo.name) + ' ' + JSON.stringify(target2.pathInfo.name) + ' ' + operation + ' ' + isAnimated

          }
        })
      }).id('Navigation_L0_1_pageOne_btn1')

    }.title('pageOne')
  }
}

@Component
struct Navigation_L0_1_pageTwo{
  build() {
    NavDestination() {

    }.title('pageTwo')
  }
}
