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
struct NavPathInfoIsEntry {
  @State message:string = 'hello'
  @State pageInfos: NavPathStack = new NavPathStack();

  @Builder
  pageOneTmp() {
    NavDestination() {
      Column({ space: 10 }) {
        Button('pop')
          .onClick(() => {
            this.pageInfos.pop({res:'success'})
          })
          .id('NavPathInfoIsEntry_btn2')
      }
    }.title('pageOne')
  }

  @Builder
  PageMap(name: string) {
    if (name === 'pageOne') {
      this.pageOneTmp()
    }
  }

  build() {
    Column({ space: 5 }) {
      Navigation(this.pageInfos) {
        Column({ space: 10 }) {
          Text(this.message).id('NavPathInfoIsEntry_text1')

          Button('pushPath pageOne')
            .onClick(() => {
              this.pageInfos.pushDestination({
                name: 'pageOne', param: 'mes', isEntry: true, onPop: (popInfo: PopInfo) => {
                  this.message = 'isEntry is: ' + JSON.stringify(popInfo.info.isEntry);
                }
              })
            })
            .id('NavPathInfoIsEntry_btn1')
        }
      }
      .title('Navigation')
      .mode(NavigationMode.Stack)
      .navDestination(this.PageMap)
    }
  }
}