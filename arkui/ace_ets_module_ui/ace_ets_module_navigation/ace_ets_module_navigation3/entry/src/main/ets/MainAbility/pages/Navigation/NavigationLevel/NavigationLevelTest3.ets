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
struct NavigationLevelTest3 {
  @State message:string = ''
  @State pageInfos: NavPathStack = new NavPathStack();

  @Builder
  pageOneTmp() {
    NavDestination() {
      Column({ space: 10 }) {
        Button('pushPath pageOne')
          .onClick(() => {
            this.pageInfos.pushPath({ name: 'pageOne' , param:'mes'})
          })
          .id('NavigationLevelTest3_btn2')

        Button('removeByName pageOne')
          .onClick(() => {
            this.message = 'removeByName:' + this.pageInfos.removeByName('pageOne')
          })
          .id('NavigationLevelTest3_btn3')
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
      Text(this.message).id('NavigationLevelTest3_text1')

      Navigation(this.pageInfos) {
        Column({space:10}) {
          Button('pushPath pageOne')
            .onClick(() => {
              this.pageInfos.pushPath({ name: 'pageOne' , param:'mes'})
            })
            .id('NavigationLevelTest3_btn1')
        }
      }
      .mode(NavigationMode.Stack)
      .title('NavIndex')
      .navDestination(this.PageMap)
    }

  }
}

