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
struct navigation_add3_2 {
  @Provide('pageInfos') pageInfos: NavPathStack = new NavPathStack()
  isUseInterception: boolean = false;
  @State from:string = ''
  @State to:string = ''
  @State operation:string = ''
  @State animated:boolean = false
  @Builder pageOne(){
    NavDestination() {
      Column(){
        Text('pageOne').id('navigation_add3_2_pageOne_text1')
        Button('pageTwo').onClick((event: ClickEvent) => {
          this.pageInfos.pushPathByName('pageTwo','1')
          this.pageInfos.setInterception({
            willShow: (from: NavDestinationContext | "navBar", to: NavDestinationContext | "navBar",
                       operation: NavigationOperation, animated: boolean) => {

              if (typeof from === "string") {
                console.log("target page is navigation home");
                return;
              }
              let target1: NavDestinationContext = from as NavDestinationContext;
              let target2: NavDestinationContext = to as NavDestinationContext;
              if (target2.pathInfo.name === 'pageTwo') {
                this.from =  JSON.stringify(target1.pathInfo.name)
                this.to =  JSON.stringify(target2.pathInfo.name)
                this.operation =  String(operation)
                this.animated =  animated
              }
            }
          })

        })
          .id('navigation_add3_2_pageOne_btn1')
      }

    }.title('pageOne')
    .onBackPressed(() => {
      const popDestinationInfo = this.pageInfos.pop() // 弹出路由栈栈顶元素
      console.log('pop' + '返回值' + JSON.stringify(popDestinationInfo))
      return true
    })
  }

  @Builder pageTwo(){
    NavDestination() {
      Column(){
        Text('pageTwo').id('navigation_add3_2_pageTwo_text1')
        Button('popToIndex').onClick((event: ClickEvent) => {
          this.pageInfos.popToIndex(0)
          this.pageInfos.setInterception({
            willShow: (from: NavDestinationContext | "navBar", to: NavDestinationContext | "navBar",
                       operation: NavigationOperation, animated: boolean) => {

              if (typeof from === "string") {
                console.log("target page is navigation home");
                return;
              }
              let target1: NavDestinationContext = from as NavDestinationContext;
              let target2: NavDestinationContext = to as NavDestinationContext;
              if (target2.pathInfo.name === 'pageOne') {
                this.from =  JSON.stringify(target1.pathInfo.name)
                this.to =  JSON.stringify(target2.pathInfo.name)
                this.operation =  String(operation)
                this.animated =  animated
              }
            }
          })

        })
          .id('navigation_add3_2_pageTwo_btn1')

      }
    }.title('pageTwo')
    .onBackPressed(() => {
      const popDestinationInfo = this.pageInfos.pop() // 弹出路由栈栈顶元素
      console.log('pop' + '返回值' + JSON.stringify(popDestinationInfo))
      return true
    })
  }

  @Builder
  PageMap(name:string){
    if (name === 'pageOne'){
      this.pageOne()
    }else if (name === 'pageTwo'){
      this.pageTwo()
    }
  }

  build() {
    Navigation(this.pageInfos) {
      Column() {
        Text(this.from).id('navigation_add3_2_text1').height('5%')
        Text(this.to).id('navigation_add3_2_text2').height('5%')
        Text(this.operation).id('navigation_add3_2_text3').height('5%')
        Text('' + this.animated).id('navigation_add3_2_text4').height('5%')
        Button('pushOne', { stateEffect: true, type: ButtonType.Capsule })
          .width('80%')
          .height(40)
          .margin(20)
          .onClick(() => {
            this.pageInfos.pushPath({name:'pageOne'})

          })
          .key('navigation_add3_2_btn1')
          .height('5%')
      }
    }.title('NavIndex').navDestination(this.PageMap).mode(NavigationMode.Split)
    .navBarWidth('30%')
  }
}

