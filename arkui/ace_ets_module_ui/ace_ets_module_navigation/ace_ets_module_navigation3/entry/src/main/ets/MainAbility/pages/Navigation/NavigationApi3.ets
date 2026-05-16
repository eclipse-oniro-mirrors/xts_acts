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
struct NavigationApi3 {
  pageInfos: NavPathStack = new NavPathStack()
  isUseInterception: boolean = false;
  @State mode: NavigationMode = NavigationMode.Stack;

  @Builder
  PageMap(name:string){
    if (name === 'pageOne'){
      pageOne()
    }else if (name === 'pageTwo'){
      pageTwo()
    }
  }

  build() {
    Navigation(this.pageInfos) {
      Column() {
        Button('pushPath', { stateEffect: true, type: ButtonType.Capsule })
          .width('80%')
          .height(40)
          .margin(20)
          .onClick(() => {
            this.pageInfos.setInterception({
              modeChange:(mode:NavigationMode) => {
                this.pageInfos.pushPath({ name: 'pageOne' });
              }
            })
            this.mode = NavigationMode.Split;
          })
          .key('NavigationApi3_btn1')

      }
    }.title('NavIndex').navDestination(this.PageMap).mode(this.mode)
  }
}


@Component
export struct pageOne {

  pageInfos: NavPathStack = new NavPathStack()

  build() {
    NavDestination() {
      Column(){
        Text('pageOne').id('NavigationApi3_text1')
      }

    }.title('pageOne')
    .onBackPressed(() => {
      const popDestinationInfo = this.pageInfos.pop() // 弹出路由栈栈顶元素
      console.log('pop' + '返回值' + JSON.stringify(popDestinationInfo))
      return true
    }).onReady((context: NavDestinationContext) => {
      this.pageInfos = context.pathStack
    })
  }
}
@Component
export struct pageTwo {

  pageInfos: NavPathStack = new NavPathStack()

  build() {
    NavDestination() {

    }.title('pageTwo')
    .onBackPressed(() => {
      const popDestinationInfo = this.pageInfos.pop() // 弹出路由栈栈顶元素
      console.log('pop' + '返回值' + JSON.stringify(popDestinationInfo))
      return true
    }).onReady((context: NavDestinationContext) => {
      this.pageInfos = context.pathStack
    })
  }
}