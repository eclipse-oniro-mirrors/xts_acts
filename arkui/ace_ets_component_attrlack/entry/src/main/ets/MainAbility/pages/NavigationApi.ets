/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

interface Age {
  age
}


@Entry
@Component
struct NavigationApi {
  @Provide('pageInfos') pageInfos: NavPathStack = new NavPathStack()

  @State peo: Age = {age:18}

  @Builder pageOneTmp() {
    NavDestination() {
      Column() {
        Button('replacePath')
          .width('80%')
          .height(40)
          .onClick(() => {
            this.pageInfos.replacePath(new NavPathInfo('pageTwo',this.peo))
          })

        Button('replacePathByName')
          .width('80%')
          .height(40)
          .onClick(() => {
            this.pageInfos.replacePathByName('pageTwo',this.peo )
          })

        Button('disableAnimation')
          .width('80%')
          .height(40)
          .onClick(() => {
            this.pageInfos.disableAnimation(false)
          })

      }.width('100%').height('100%')
    }.title('pageOne')
    .onBackPressed(() => {
      this.pageInfos.pop()
      return true
    })
    // .mode(NavDestinationMode.STANDARD)
  }

  @Builder pageTwoTmp() {
    NavDestination() {
      Column({space:5}) {
        Button('pushPath', { stateEffect: true, type: ButtonType.Capsule })
          .width('80%')
          .height(40)
          .onClick(() => {
            this.pageInfos.pushPath({ name: 'pageThree' })
          })
      }.width('100%').height('100%')
    }.title('pageTwo')
    .onBackPressed(() => {
      this.pageInfos.pop()
      return true
    })
    // .mode(NavDestinationMode.DIALOG)
  }

  @Builder pageThreeTmp() {
    NavDestination() {
      Column({space:5}) {
        Text('123')
      }.width('100%').height('100%')
    }.title('pageThree')
    .onBackPressed(() => {
      this.pageInfos.pop()
      return true
    })
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
    Navigation(this.pageInfos) {
      Column() {
        Button('pushPath', { stateEffect: true, type: ButtonType.Capsule })
          .width('80%')
          .height(40)
          .onClick(() => {
            this.pageInfos.pushPath({ name: 'pageOne' })
          })
      }
    }.title('NavIndex').navDestination(this.PageMap).id('NavigationApi_Navigation')
  }
}
