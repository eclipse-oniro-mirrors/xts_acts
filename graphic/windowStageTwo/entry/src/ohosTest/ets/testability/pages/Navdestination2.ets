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
struct PortraitPage {
  @State info: string = '';
  private stack: NavPathStack | undefined = undefined;
  @State name:string = 'portrait';
  build() {
    NavDestination() {
      Stack({alignContent: Alignment.Center}) {
        Column(){
          Row(){
            Button('none').onClick(() => {
              this.stack?.pushPath({name: 'none'});
            }).id('nonePage')
            Row(){
              Button('getOrientation').onClick(() => {
                let Orientation:display.Orientation = display.getDefaultDisplaySync().orientation;
                console.log('PortraitPage Orientation:'+Orientation);
                AppStorage.setOrCreate('testOrientation', Orientation);

              }).id('getOrientation')
            }
          }
        }
      }.width('100%').height('100%')
    }
    .width('100%').height('100%')
    .title('PortraitPage')
    .preferredOrientation(window.Orientation.PORTRAIT) // 竖屏方向
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
struct NonePage {
  private stack: NavPathStack | undefined = undefined;
  @State name:string = 'portrait';

  build() {
    NavDestination() {
      Stack({alignContent: Alignment.Center}) {
        Column(){
          Row(){
            Button('LANDSCAPE').onClick(() => {
              this.stack?.pushPath({name: 'landscape'});
            }).id('landscape_page')
          }
          Row(){
            Button('LANDSCAPE_INVERTED').onClick(() => {
              this.stack?.pushPath({name: 'landscape_inverted'});
            }).id('landscape_invertedPage')
          }
          Row(){
            Button('USER_ROTATION_PORTRAIT').onClick(() => {
              this.stack?.pushPath({name: 'user_rotation_portrait'});
            }).id('user_rotation_portraitPage')
          }

          Row(){
            Button('USER_ROTATION_PORTRAIT_INVERTED').onClick(() => {
              this.stack?.pushPath({name: 'user_rotation_portrait_inverted'});
            }).id('user_rotation_portrait_invertedPage')
          }
          Row(){
            Button('USER_ROTATION_LANDSCAPE_INVERTED').onClick(() => {
              this.stack?.pushPath({name: 'user_rotation_landscape_inverted'});
            }).id('user_rotation_landscape_invertedPage')
          }
          Row(){
            Button('FOLLOW_DESKTOP').onClick(() => {
              this.stack?.pushPath({name: 'follow_desktop'});
            }).id('follow_desktopPage')
          }
          Row(){
            Button('getOrientation').onClick(() => {
              let Orientation:display.Orientation = display.getDefaultDisplaySync().orientation;
              console.log('NonePage Orientation:'+Orientation);
              AppStorage.setOrCreate('testOrientation', Orientation);

            }).id('getOrientation')
          }
        }
      }.width('100%').height('100%')
    }
    .width('100%').height('100%')
    .title('NonePage')
    .enableStatusBar(false) // 隐藏状态栏
    .enableNavigationIndicator(false) // 隐藏导航条
    .preferredOrientation(undefined)
    .backgroundColor('#ffecb8b8')
    .ignoreLayoutSafeArea([LayoutSafeAreaType.SYSTEM], [LayoutSafeAreaEdge.TOP, LayoutSafeAreaEdge.BOTTOM])
    .onReady((ctx: NavDestinationContext) => {
      this.stack = ctx.pathStack;
    })


  }
}

@Component
struct LandscapePage {
  private stack: NavPathStack | undefined = undefined;
  @State name:string = 'portrait';


  build() {
    NavDestination() {
      Stack({alignContent: Alignment.Center}) {
        Column(){
          Row(){
            Button('LANDSCAPE').onClick(() => {
              this.stack?.pushPath({name: 'landscape'});
            }).id('page2')
            Button('PORTRAIT_INVERTED').onClick(() => {
              this.stack?.pushPath({name: 'portrait_inverted'});
            }).id('portrait_inverted_page')
          }
          Row(){
            Button('getOrientation').onClick(() => {
              let Orientation:display.Orientation = display.getDefaultDisplaySync().orientation;
              console.log('LandscapePage Orientation:'+Orientation);
              AppStorage.setOrCreate('testOrientation', Orientation);

            }).id('getOrientation')
          }
        }
      }.width('100%').height('100%')
    }
    .width('100%').height('100%')
    .title('LandscapePage')
    .preferredOrientation(window.Orientation.LANDSCAPE) // 横屏方向
    .enableStatusBar(false) // 隐藏状态栏
    .enableNavigationIndicator(false) // 隐藏导航条
    .backgroundColor('#ffecb8b8')
    .ignoreLayoutSafeArea([LayoutSafeAreaType.SYSTEM], [LayoutSafeAreaEdge.TOP, LayoutSafeAreaEdge.BOTTOM])
    .onReady((ctx: NavDestinationContext) => {
      this.stack = ctx.pathStack;
    })


  }
}

@Component
struct Portrait_invertedPage {
  private stack: NavPathStack | undefined = undefined;
  @State name:string = 'portrait';

  build() {
    NavDestination() {
      Stack({alignContent: Alignment.Center}) {
        Column(){
          Row(){
            Button('UNSPECIFIED').onClick(() => {
              this.stack?.pushPath({name: 'unspecified'});
            }).id('page0')
            Button('PORTRAIT').onClick(() => {
              this.stack?.pushPath({name: 'portrait'});
            }).id('page1')
          }
          Row(){
            Button('getOrientation').onClick(() => {
              let Orientation:display.Orientation = display.getDefaultDisplaySync().orientation;
              console.log('Portrait_invertedPage Orientation:'+Orientation);
              AppStorage.setOrCreate('testOrientation', Orientation);

            }).id('getOrientation')
          }
        }
      }.width('100%').height('100%')
    }
    .width('100%').height('100%')
    .title('Portrait_invertedPage')
    .preferredOrientation(window.Orientation.PORTRAIT_INVERTED) // 反向竖屏方向
    .enableStatusBar(false) // 隐藏状态栏
    .enableNavigationIndicator(false) // 隐藏导航条
    .backgroundColor('#fbbcb8b8')
    .ignoreLayoutSafeArea([LayoutSafeAreaType.SYSTEM], [LayoutSafeAreaEdge.TOP, LayoutSafeAreaEdge.BOTTOM])
    .onReady((ctx: NavDestinationContext) => {
      this.stack = ctx.pathStack;
    })


  }
}
@Component
struct LandscapePage_InvertedPage {
  private stack: NavPathStack | undefined = undefined;
  @State name:string = 'portrait';

  build() {
    NavDestination() {
      Stack({alignContent: Alignment.Center}) {
        Column(){
          Row(){
            Button('UNSPECIFIED').onClick(() => {
              this.stack?.pushPath({name: 'unspecified'});
            }).id('page0')
            Button('PORTRAIT').onClick(() => {
              this.stack?.pushPath({name: 'portrait'});
            }).id('portraitPage')
          }
          Row(){
            Button('getOrientation').onClick(() => {
              let Orientation:display.Orientation = display.getDefaultDisplaySync().orientation;
              console.log('LandscapePage_InvertedPage Orientation:'+Orientation);
              AppStorage.setOrCreate('testOrientation', Orientation);

            }).id('getOrientation')
          }
        }
      }.width('100%').height('100%')
    }
    .width('100%').height('100%')
    .title('LandscapeInvertedPage')
    .preferredOrientation(window.Orientation.LANDSCAPE_INVERTED) // 反向横屏方向
    .enableStatusBar(false) // 隐藏状态栏
    .enableNavigationIndicator(false) // 隐藏导航条
    .backgroundColor('#fbbcb8b8')
    .ignoreLayoutSafeArea([LayoutSafeAreaType.SYSTEM], [LayoutSafeAreaEdge.TOP, LayoutSafeAreaEdge.BOTTOM])
    .onReady((ctx: NavDestinationContext) => {
      this.stack = ctx.pathStack;
    })


  }
}
@Component
struct User_Rotation_PortraitPage {
  private stack: NavPathStack | undefined = undefined;
  @State name:string = 'portrait';

  build() {
    NavDestination() {
      Stack({alignContent: Alignment.Center}) {
        Column(){
          Row(){
            Button('USER_ROTATION_LANDSCAPE').onClick(() => {
              this.stack?.pushPath({name: 'user_rotation_landscape'});
            }).id('user_rotation_landscapePage')
          }
          Row(){
            Button('PORTRAIT').onClick(() => {
              this.stack?.pushPath({name: 'portrait'});
            }).id('portraitPage')
          }
          Row(){
            Button('getOrientation').onClick(() => {
              let Orientation:display.Orientation = display.getDefaultDisplaySync().orientation;
              console.log('User_Rotation_PortraitPage Orientation:'+Orientation);
              AppStorage.setOrCreate('testOrientation', Orientation);

            }).id('getOrientation')
          }
        }
      }.width('100%').height('100%')
    }
    .width('100%').height('100%')
    .title('User_Rotation_PortraitPage')
    .preferredOrientation(window.Orientation.USER_ROTATION_PORTRAIT) 
    .enableStatusBar(false) // 隐藏状态栏
    .enableNavigationIndicator(false) // 隐藏导航条
    .backgroundColor('#fbbcb8b8')
    .ignoreLayoutSafeArea([LayoutSafeAreaType.SYSTEM], [LayoutSafeAreaEdge.TOP, LayoutSafeAreaEdge.BOTTOM])
    .onReady((ctx: NavDestinationContext) => {
      this.stack = ctx.pathStack;
    })


  }
}
@Component
struct User_Rotation_LandscapePage {
  private stack: NavPathStack | undefined = undefined;
  @State name:string = 'portrait';

  build() {
    NavDestination() {
      Stack({alignContent: Alignment.Center}) {
        Column(){
          Row(){
            Button('USER_ROTATION_LANDSCAPE').onClick(() => {
              this.stack?.pushPath({name: 'user_rotation_landscape'});
            }).id('user_rotation_landscapePage')
          }
          Row(){
            Button('PORTRAIT').onClick(() => {
              this.stack?.pushPath({name: 'portrait'});
            }).id('portraitPage')
          }
          Row(){
            Button('getOrientation').onClick(() => {
              let Orientation:display.Orientation = display.getDefaultDisplaySync().orientation;
              console.log('User_Rotation_LandscapePage Orientation:'+Orientation);
              AppStorage.setOrCreate('testOrientation', Orientation);

            }).id('getOrientation')
          }
        }
      }.width('100%').height('100%')
    }
    .width('100%').height('100%')
    .title('User_Rotation_LandscapePage')
    .preferredOrientation(window.Orientation.USER_ROTATION_LANDSCAPE) 
    .enableStatusBar(false) // 隐藏状态栏
    .enableNavigationIndicator(false) // 隐藏导航条
    .backgroundColor('#fbbcb8b8')
    .ignoreLayoutSafeArea([LayoutSafeAreaType.SYSTEM], [LayoutSafeAreaEdge.TOP, LayoutSafeAreaEdge.BOTTOM])
    .onReady((ctx: NavDestinationContext) => {
      this.stack = ctx.pathStack;
    })


  }
}
@Component
struct User_Rotation_Portrait_InvertedPage {
  private stack: NavPathStack | undefined = undefined;
  @State name:string = 'portrait';

  build() {
    NavDestination() {
      Stack({alignContent: Alignment.Center}) {
        Column(){
          Row(){
            Button('USER_ROTATION_LANDSCAPE_INVERTED').onClick(() => {
              this.stack?.pushPath({name: 'user_rotation_landscape_inverted'});
            }).id('user_rotation_landscape_invertedPage')
          }
          Row(){
            Button('PORTRAIT').onClick(() => {
              this.stack?.pushPath({name: 'portrait'});
            }).id('portraitPage')
          }
          Row(){
            Button('getOrientation').onClick(() => {
              let Orientation:display.Orientation = display.getDefaultDisplaySync().orientation;
              console.log('User_Rotation_Portrait_InvertedPage Orientation:'+Orientation);
              AppStorage.setOrCreate('testOrientation', Orientation);

            }).id('getOrientation')
          }
        }
      }.width('100%').height('100%')
    }
    .width('100%').height('100%')
    .title('User_Rotation_Portrait_InvertedPage')
    .preferredOrientation(window.Orientation.USER_ROTATION_PORTRAIT_INVERTED)
    .enableStatusBar(false) // 隐藏状态栏
    .enableNavigationIndicator(false) // 隐藏导航条
    .backgroundColor('#fbbcb8b8')
    .ignoreLayoutSafeArea([LayoutSafeAreaType.SYSTEM], [LayoutSafeAreaEdge.TOP, LayoutSafeAreaEdge.BOTTOM])
    .onReady((ctx: NavDestinationContext) => {
      this.stack = ctx.pathStack;
    })


  }
}
@Component
struct User_Rotation_Landscape_InvertedPage {
  private stack: NavPathStack | undefined = undefined;
  @State name:string = 'portrait';

  build() {
    NavDestination() {
      Stack({alignContent: Alignment.Center}) {
        Column(){
          Row(){
            Button('PORTRAIT').onClick(() => {
              this.stack?.pushPath({name: 'portrait'});
            }).id('portraitPage')
          }
          Row(){
            Button('getOrientation').onClick(() => {
              let Orientation:display.Orientation = display.getDefaultDisplaySync().orientation;
              console.log('User_Rotation_Landscape_InvertedPage Orientation:'+Orientation);
              AppStorage.setOrCreate('testOrientation', Orientation);

            }).id('getOrientation')
          }
        }
      }.width('100%').height('100%')
    }
    .width('100%').height('100%')
    .title('User_Rotation_Landscape_InvertedPage')
    .preferredOrientation(window.Orientation.USER_ROTATION_LANDSCAPE_INVERTED) 
    .enableStatusBar(false) // 隐藏状态栏
    .enableNavigationIndicator(false) // 隐藏导航条
    .backgroundColor('#fbbcb8b8')
    .ignoreLayoutSafeArea([LayoutSafeAreaType.SYSTEM], [LayoutSafeAreaEdge.TOP, LayoutSafeAreaEdge.BOTTOM])
    .onReady((ctx: NavDestinationContext) => {
      this.stack = ctx.pathStack;
    })


  }
}
@Component
struct Follow_DesktopPage {
  private stack: NavPathStack | undefined = undefined;
  @State name:string = 'portrait';

  build() {
    NavDestination() {
      Stack({alignContent: Alignment.Center}) {
        Column(){
          Row(){
            Button('PORTRAIT').onClick(() => {
              this.stack?.pushPath({name: 'portrait'});
            }).id('portraitPage')
          }
          Row(){
            Button('getOrientation').onClick(() => {
              let Orientation:display.Orientation = display.getDefaultDisplaySync().orientation;
              console.log('Follow_DesktopPage Orientation:'+Orientation);
              AppStorage.setOrCreate('testOrientation', Orientation);

            }).id('getOrientation')
          }
        }
      }.width('100%').height('100%')
    }
    .width('100%').height('100%')
    .title('Follow_DesktopPage')
    .preferredOrientation(window.Orientation.FOLLOW_DESKTOP) 
    .enableStatusBar(false) // 隐藏状态栏
    .enableNavigationIndicator(false) // 隐藏导航条
    .backgroundColor('#fbbcb8b8')
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
    this.stack.pushPath({name: "portrait"});
  }

  @Builder
  MyPageMap(name: string) {
    if (name === 'none') {
      NonePage();
    } else if(name === 'portrait'){
      PortraitPage();
    }else if(name === 'landscape'){
      LandscapePage();
    }else if(name === 'portrait_inverted'){
      Portrait_invertedPage();
    }else if(name === 'landscape_inverted'){
      LandscapePage_InvertedPage();
    }else if(name === 'user_rotation_portrait'){
      User_Rotation_PortraitPage();
    }else if(name === 'user_rotation_landscape'){
      User_Rotation_LandscapePage();
    }else if(name === 'user_rotation_portrait_inverted'){
      User_Rotation_Portrait_InvertedPage()
    }else if(name === 'user_rotation_landscape_inverted'){
      User_Rotation_Landscape_InvertedPage();
    } else{
      Follow_DesktopPage();
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
    })
  }
}