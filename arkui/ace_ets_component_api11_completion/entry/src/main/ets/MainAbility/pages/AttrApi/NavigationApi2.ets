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
struct NavigationApi2 {
  @Provide('pageInfos') pageInfos: NavPathStack = new NavPathStack()

  @Builder
  pageOneTmp2() {
    NavDestination() {
      Column({ space: 10 }) {
        Text('pageOne')

        Button('replacePath')
          .width('80%')
          .height(40)
          .onClick(() => {
            this.pageInfos.replacePath({ name: 'pageTwo' })
          })
          .id('NavigationApi2_replacePath')


      }.width('100%').height('100%')
    }.title('pageOne')
    .onBackPressed(() => {
      this.pageInfos.pop()
      return true
    })
  }

  @Builder
  pageTwoTmp2() {
    NavDestination() {
      Column({ space: 5 }) {

        Text('pageTwo')

        Button('pop')
          .width('80%')
          .height(40)
          .onClick(() => {
            this.pageInfos.pop()
          })
          .id('NavigationApi2_pop')

      }.width('100%').height('100%')
    }.title('pageTwo')
    .onBackPressed(() => {
      this.pageInfos.pop()
      return true
    })
  }

  @Builder
  PageMap(name: string) {
    if (name === 'pageOne') {
      this.pageOneTmp2()
    } else if (name === 'pageTwo') {
      this.pageTwoTmp2()
    }
  }

  build() {
    Navigation(this.pageInfos) {
      Column() {

        Text('Navigation')
          .id('NavigationApi2_text_Navigation')

        Button('pushPath', { stateEffect: true, type: ButtonType.Capsule })
          .width('80%')
          .height(40)
          .onClick(() => {
            this.pageInfos.pushPath({ name: 'pageOne' })
          })
          .id('NavigationApi2_pushPath')
      }
    }
    .title('NavIndex')
    .navDestination(this.PageMap)
    .id('NavigationApi2_Navigation')
  }
}
