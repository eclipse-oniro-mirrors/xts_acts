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
//002 测试自定义组件冻结V2  Navigation
import prompt from '@system.prompt';

@Entry
@ComponentV2
struct MyNavigationTestStack1 {
  @Provider('navigationInfoProvider') navigationInfo: NavPathStack = new NavPathStack();
  @Local message: number = 0;

  @Monitor('message')
  info() {
    console.info(`freeze-test MyNavigation message callback ${this.message}`);
  }

  @Builder
  PageMap(name: string) {
    if (name === 'pageOne') {
      pageOneStack1({ message: this.message })
    } else if (name === 'pageTwo') {
      pageTwoStack1({ message: this.message })
    } else if (name === 'pageThree') {
      pageThreeStack1({ message: this.message })
    }
  }

  build() {
    Column() {
      Button('change message')
        .id('changeMessage')
        .onClick(() => {
          this.message++;
        })
      Navigation(this.navigationInfo) {
        Column() {
          Button('Next Page', { stateEffect: true, type: ButtonType.Capsule })
            .onClick(() => {
              this.navigationInfo.pushPath({ name: 'pageOne' }); //将name指定的NavDestination页面信息入栈
            })
            .id('NextPage0')
        }
      }.title('NavIndex')
      .navDestination(this.PageMap)
      .mode(NavigationMode.Stack)
    }
  }
}

@ComponentV2
struct pageOneStack1 {
  @Consumer('navigationInfoProvider') navigationInfo: NavPathStack = new NavPathStack();
  @Local index: number = 1;
  @Param message: number = 0;

  build() {
    NavDestination() {
      Column() {
        NavigationContentMsgStack1({ message: this.message, index: this.index })
        Text('cur stack size:' + `${this.navigationInfo.size()}`)
          .fontSize(9)
        Button('Next Page', { stateEffect: true, type: ButtonType.Capsule })
          .onClick(() => {
            this.navigationInfo.pushPathByName('pageTwo', null);
          })
          .id('NextPage1')
        Button('Back Page', { stateEffect: true, type: ButtonType.Capsule })
          .onClick(() => {
            this.navigationInfo.pop();
          })
          .id('BackPage1')
      }.width('100%').height('100%')
    }.title('pageOne')
    .onBackPressed(() => {
      this.navigationInfo.pop();
      return true;
    })
  }
}

@ComponentV2
struct pageTwoStack1 {
  @Consumer('navigationInfoProvider') navigationInfo: NavPathStack = new NavPathStack();
  @Local index: number = 2;
  @Param message: number = 0;

  build() {
    NavDestination() {
      Column() {
        NavigationContentMsgStack1({ message: this.message, index: this.index })
        Text('cur stack size:' + `${this.navigationInfo.size()}`)
          .fontSize(9)
        Button('Next Page', { stateEffect: true, type: ButtonType.Capsule })
          .onClick(() => {
            this.navigationInfo.pushPathByName('pageThree', null);
          })
          .id('NextPage2')
        Button('Back Page', { stateEffect: true, type: ButtonType.Capsule })
          .onClick(() => {
            this.navigationInfo.pop();
          })
          .id('BackPage2')
      }
    }.title('pageTwo')
    .onBackPressed(() => {
      this.navigationInfo.pop();
      return true;
    })
  }
}

@ComponentV2
struct pageThreeStack1 {
  @Consumer('navigationInfoProvider') navigationInfo: NavPathStack = new NavPathStack();
  @Local index: number = 3;
  @Param message: number = 0;

  build() {
    NavDestination() {
      Column() {
        NavigationContentMsgStack1({ message: this.message, index: this.index })
        Text('cur stack size:' + `${this.navigationInfo.size()}`)
          .fontSize(9)
        Button('Next Page', { stateEffect: true, type: ButtonType.Capsule })
          .height('3%')
          .onClick(() => {
            this.navigationInfo.pushPathByName('pageOne', null);
          })
          .id('NextPage3')
        Button('Back Page', { stateEffect: true, type: ButtonType.Capsule })
          .height('3%')
          .onClick(() => {
            this.navigationInfo.pop();
          })
          .id('BackPage3')
      }
    }.title('pageThree')
    .onBackPressed(() => {
      this.navigationInfo.pop();
      return true;
    })
  }
}

@ComponentV2({ freezeWhenInactive: true })
struct NavigationContentMsgStack1 {
  @Param message: number = 0;
  @Param index: number = 0;

  @Monitor('message')
  info() {
    prompt.showToast({ message: `NavigationContent message:${this.message} index:${this.index}`, duration: 500 })
  }

  build() {
    Column() {
      Text('msg:' + `${this.message}`)
        .fontSize(9)
        .fontWeight(FontWeight.Bold)
      Text('index:' + `${this.index}`)
        .fontSize(9)
        .fontWeight(FontWeight.Bold)
    }
  }
}
