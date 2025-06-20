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

@Entry
@Component
struct NavigationLevelTest13 {
  @State pageInfos: NavPathStack = new NavPathStack();
  @State childNavStack: NavPathStack = new NavPathStack();

  @Builder
  pageOneTmp() {
    NavDestination() {
      Column({ space: 10 }) {
        Text('pageOne').id('NavigationLevelTest13_text1')
      }
    }.title('pageOne')
  }

  @Builder
  pageTwoTmp() {
    NavDestination() {
      Column({ space: 10 }) {
        Text('pageTwo')
      }
    }.title('pageTwo')
  }

  @Builder
  PageMap(name: string) {
    if (name === 'pageOne') {
      this.pageOneTmp()
    } else if (name === 'pageTwo') {
      this.pageTwoTmp()
    }
  }

  build() {
    Column({space:5}){
      Navigation(this.pageInfos) {
        Column({space:10}) {
          Navigation(this.childNavStack) {
            Button('push Path to parent Navigation')
              .id('NavigationLevelTest13_btn1')
              .onClick(() => {
                let parentStack = this.childNavStack.getParent();
                parentStack?.pushPath({ name: "pageOne"})
                console.log('parent:' + JSON.stringify(parentStack))
              })
          }
          .clip(true)
          .mode(NavigationMode.Stack)
          .backgroundColor(Color.Orange)
          .width('80%')
          .height('80%')
          .title('ChildNavigation')
          .titleMode(NavigationTitleMode.Mini)
        }
      }
      .mode(NavigationMode.Stack)
      .title('Navigation')
      .navDestination(this.PageMap)
      .titleMode(NavigationTitleMode.Mini)
    }
  }
}