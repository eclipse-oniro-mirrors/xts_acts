/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { display, window } from '@kit.ArkUI';

@Component
struct Page1 {
  @State info: string = '';
  private stack: NavPathStack | undefined = undefined;
  private displayClass:display.Display = display.getDefaultDisplaySync();
  private Orientation = this.displayClass.orientation;
  aboutToAppear(): void {
    console.log('Page1 Orientation:'+this.Orientation);
    AppStorage.setOrCreate('testOrientation', this.Orientation);
  }

  build() {
    NavDestination() {
      Stack({alignContent: Alignment.Center}) {
        Button('push 2 page').onClick(() => {
          this.stack?.pushPath({name: 'Page2'});
        }).id('page2')
      }.width('100%').height('100%')
    }
    .width('100%').height('100%')
    .title('Page1')
    .enableStatusBar(true) // 显示状态栏
    .enableNavigationIndicator(true) // 显示导航条
    .backgroundColor('#ffbaece9')
    .onResult((result: ESObject)=>{
      this.info = result as string;
    })
    .onReady((ctx: NavDestinationContext) => {
      this.stack = ctx.pathStack;
    })
  }
}

@Component
struct Page2 {
  private stack: NavPathStack | undefined = undefined;
  private displayClass:display.Display = display.getDefaultDisplaySync();
  private Orientation = this.displayClass.orientation;
  aboutToAppear(): void {
    console.log('Page1 Orientation:'+this.Orientation);
    AppStorage.setOrCreate('testOrientation', this.Orientation);
  }
  build() {
    NavDestination() {
      Stack({alignContent: Alignment.Center}) {
        Button('push page 1').onClick(() => {
          this.stack?.pushPath({name: 'Page1'});
        }).id('page1')
      }.width('100%').height('100%')
    }
    .width('100%').height('100%')
    .title('Page2')
    .enableStatusBar(false) // 隐藏状态栏
    .enableNavigationIndicator(false) // 隐藏导航条
    .backgroundColor('#ffecb8b8')
    .ignoreLayoutSafeArea([LayoutSafeAreaType.SYSTEM], [LayoutSafeAreaEdge.TOP, LayoutSafeAreaEdge.BOTTOM])
    .onReady((ctx: NavDestinationContext) => {
      this.stack = ctx.pathStack;
    })
  }
}

@Entry
@Component
struct ExamplePage {
  private stack: NavPathStack = new NavPathStack();

  aboutToAppear(): void {
    this.stack.pushPath({name: "Page1"});
  }

  @Builder
  MyPageMap(name: string) {
    if (name === 'Page1') {
      Page1();
    } else {
      Page2();
    }
  }

  build() {
    Navigation(this.stack) {
    }
    .width('100%')
    .height('100%')
    .hideNavBar(true)
    .navDestination(this.MyPageMap)
    .onFocus(() => {
      AppStorage.setOrCreate('pageContext', getContext(this))
      let displayOri = display.getDefaultDisplaySync().orientation;
      console.log(' displayOri : ' + displayOri);
      AppStorage.setOrCreate('displayOri', displayOri)
    })
  }
}