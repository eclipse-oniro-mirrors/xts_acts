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

import promptAction from '@ohos.promptAction';
import FirstDialog from '../model/FirstDialog';
import router from '@ohos.router';

@Entry
@Component
struct EnableShowHideWithContentCover {
  @State enableValue: boolean = true;
  private stack: NavPathStack = new NavPathStack();
  @State name: string = 'EnableShowHideWithContentCover';
  @State stepTips: string = '操作步骤：\n' +
    '1、点击按钮pushOne\n2、将应用切换到后台\n' +
    '3、将应用切换到前台\n' +
    '预期结果：\n' +
    '1、跳转到PageOne页面\n2、控制台打印日志信息: VisibilityChangeReason hide:  2\n' +
    '3、控制台打印日志信息: VisibilityChangeReason show:  2';
  @State isVue: boolean = false;
  @State intervalNum: number = 0;

  @Builder
  PassBtn(text: Resource, isFullScreen: boolean) {
    if (this.isVue == false) {
      Button({ stateEffect: this.isVue }) {
        Image($r('app.media.ic_public_pass'))
          .width('20vp')
          .height('20vp')
      }
      .margin({ bottom: '20vp' })
      .width('30%')
      .height('30vp')
      .backgroundColor(Color.Grey)
      .opacity(0.4)
      .onClick(() => {
      })
    } else {
      Button({ stateEffect: this.isVue }) {
        Image($r('app.media.ic_public_pass'))
          .width('20vp')
          .height('20vp')
      }
      .margin({ bottom: '20vp' })
      .width('30%')
      .height('30vp')
      .backgroundColor(Color.Grey)
      .onClick(() => {
        router.back({
          url: 'pages/ArkUI/ArkUI_index',
          params: {
            result: 'true ', title: this.name,
          }
        })
        promptAction.showToast({
          message: '通过', duration: 1000
        });
      })
    }
  }

  @Builder
  FailBtn(text: Resource, isFullScreen: boolean) {
    Button() {
      Image($r('app.media.ic_public_fail'))
        .width('20vp')
        .height('20vp')
    }
    .margin({ bottom: '20vp' })
    .width('30%')
    .height('30vp')
    .backgroundColor(Color.Grey)
    .onClick(() => {
      router.back({
        url: 'pages/ArkUI/ArkUI_index',
        params: {
          result: 'false', title: this.name,
        }
      })
      promptAction.showToast({
        message: '失败', duration: 1000
      });
    })
  }

  aboutToAppear() {
    FirstDialog.ChooseDialog(this.stepTips, this.name);
    console.log('dafaf')
  }

  onPageShow() {
    this.intervalNum = setInterval(() => {
     this.isVue = true;
    }, 1000)
  }

  onPageHide() {
    clearInterval(this.intervalNum)
  }

  aboutToDisappear() {
    clearInterval(this.intervalNum)
  }


  @Builder
  pageMap(name: string) {
    if (name == 'pageOne') {
      PageOne2()
    }
  }

  build() {
    Column() {
      Row() {
        Button() {
          Image($r('app.media.ic_public_back'))
            .width('20vp')
            .height('18vp')
            .margin({ left: '20vp' })
        }
        .backgroundColor(Color.Black)
        .size({ width: '40vp', height: '30vp' })
        .onClick(() => {
          router.back({
            url: 'pages/ArkUI/ArkUI_index',
            params: { result: 'None' }
          })
        })

        Text(this.name)
          .fontColor(Color.White)
          .fontSize('18fp')
          .margin({ left: '-20vp' })
        Text('hello')
          .fontColor(Color.White)
          .visibility(Visibility.Hidden)
      }
      .backgroundColor(Color.Black)
      .height('10%')
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      Column() {
        Navigation(this.stack){
          Button('pushOne').onClick(() => {
            this.stack.pushPath({name: 'pageOne'})
          })
        }
        .titleMode(NavigationTitleMode.Mini)
        .title('Navigation')
        .enableVisibilityLifecycleWithContentCover(this.enableValue)
        .navDestination(this.pageMap)
        .mode(NavigationMode.Stack)
      }
      .height('80%')
      .width('100%')
      .backgroundColor(Color.White)

      Row() {
        this.PassBtn($r('app.string.btn_fullscreen'), true);
        Button() {
          Image($r('app.media.ic_public_help'))
            .width('20vp')
            .height('20vp')
        }
        .margin({ bottom: '20vp' })
        .width('30%')
        .height('30vp')
        .backgroundColor(Color.Grey)
        .onClick(() => {
          AlertDialog.show(
            {
              title: '操作提示',
              message: this.stepTips,
              confirm: {
                value: 'OK',
                action: () => {
                }
              }
            }
          )
        })

        this.FailBtn($r('app.string.btn_fullscreen'), true);
      }
      .height('10%')
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .backgroundColor(Color.Black)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F1F3F5')
  }
}

@Component
struct PageOne2 {
  private stack: NavPathStack | undefined = undefined;
  @State appStateValue: string = ''

  build() {
    NavDestination() {
      Button('back').onClick(() => {
        this.stack?.pop()
      })
      Text('VisibilityChangeReason.APP_STATE value: ')
      Text(this.appStateValue)
    }.title('PageOne')
    .onReady((ctx: NavDestinationContext) => {
      this.stack = ctx.pathStack;
    })
    .onShown((callback) => {
      console.log('VisibilityChangeReason show: ', callback as VisibilityChangeReason == VisibilityChangeReason.APP_STATE);
      console.log('VisibilityChangeReason show: ', JSON.stringify(callback as VisibilityChangeReason))
      this.appStateValue = JSON.stringify(callback as VisibilityChangeReason)
    })
    .onHidden((callback) => {
      console.log('VisibilityChangeReason hide: ', callback as VisibilityChangeReason == VisibilityChangeReason.APP_STATE);
      console.log('VisibilityChangeReason hide: ', JSON.stringify(callback as VisibilityChangeReason))
      this.appStateValue = JSON.stringify(callback as VisibilityChangeReason)
    })
  }
}

