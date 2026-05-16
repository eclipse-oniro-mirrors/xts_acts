/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
struct navDestinationFullScreenOverlayPage {
  @Provide('pageInfos') pageInfos: NavPathStack = new NavPathStack()

  @Builder
  pageMap(name: string) {
    if (name == 'fullOverTrue') {
      fullOverTrue()
    } else if (name == 'fullOverFalse') {
      fullOverFalse()
    } else if (name == 'fullOverUndefined') {
      fullOverUndefined()
    } else if (name == 'fullOverNull') {
      fullOverNull()
    }
  }

  build() {
    Navigation(this.pageInfos) {
      Column({space: '5vp'}) {
        Button('push fullOverTrue').id('fullOverTrue_1').onClick(() => {
          this.pageInfos.pushPath({name: 'fullOverTrue'} )
        }).height('10%')
        Button('push fullOverFalse').id('fullOverFalse_1').onClick(() => {
          this.pageInfos.pushPath({name: 'fullOverFalse'} )
        }).height('10%')
        Button('push fullOverUndefined').id('fullOverUndefined_1').onClick(() => {
          this.pageInfos.pushPath({name: 'fullOverUndefined'} )
        }).height('10%')
        Button('push fullOverNull').id('fullOverNull_1').onClick(() => {
          this.pageInfos.pushPath({name: 'fullOverNull'} )
        }).height('10%')
      }
      .width('100%')
      .height('100%')
    }
    .id('navigation_full_width')
    .title('Title_fullScreenOverlay')
    .titleMode(NavigationTitleMode.Mini)
    .navDestination(this.pageMap)
    .mode(NavigationMode.Split)
  }
}

@Component
struct fullOverTrue {
  @Consume('pageInfos') pageInfos: NavPathStack;
  @State info: string = '';
  build() {
    NavDestination() {
      Button('push fullOverFalse').id('fullOverFalse').onClick(() => {
        this.pageInfos.pushPath({name: 'fullOverFalse'} )
      }).height('10%')
    }
    .id('navDestination_full_true')
    .title('fullScreenOverlay_true')
    .fullScreenOverlay(true)
  }
}

@Component
struct fullOverFalse {
  @Consume('pageInfos') pageInfos: NavPathStack;
  build() {
    NavDestination() {
      Button('push fullOverUndefined').id('fullOverUndefined').onClick(() => {
        this.pageInfos.pushPath({name: 'fullOverUndefined'} )
      }).height('10%')
    }
    .id('navDestination_full_false')
    .title('fullScreenOverlay_false')
    .fullScreenOverlay(false)
  }
}

@Component
struct fullOverUndefined {
  @Consume('pageInfos') pageInfos: NavPathStack;
  build() {
    NavDestination() {
      Button('push fullOverNull').id('fullOverNull').onClick(() => {
        this.pageInfos.pushPath({name: 'fullOverNull'} )
      }).height('10%')
    }
    .id('navDestination_full_undefined')
    .title('fullScreenOverlay_undefined')
    .fullScreenOverlay(undefined)
  }
}

@Component
struct fullOverNull {
  @Consume('pageInfos') pageInfos: NavPathStack;
  build() {
    NavDestination() {
      Text('fullScreenOverlay: null')
    }
    .id('navDestination_full_null')
    .title('fullScreenOverlay_null')
    .fullScreenOverlay(null)
  }
}