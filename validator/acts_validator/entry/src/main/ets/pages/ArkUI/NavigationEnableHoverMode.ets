/*
* Copyright (c) 2023 Hunan OpenValley Digital Industry Development Co., Ltd.
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

import router from '@ohos.router';
import FirstDialog from '../model/FirstDialog';
import promptAction from '@ohos.promptAction';

@Entry
@Component
struct NavigationEnableHoverMode {
  @State name: string = 'NavigationEnableHoverMode';
  @State stepTips: string = '操作步骤：1、使用折叠屏手机运行测试\n2、手动折叠手机屏幕(上下折叠)' +
    '\n' + '预期结果：MainTitle悬浮在下屏的上方位置';
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
      }.width('30%')
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
        Navigation() {
          Column().height('80%')
          Row() {
            this.PassBtn($r('app.string.btn_fullscreen'), true);
            Button() {
              Image($r('app.media.ic_public_help'))
                .width('20vp')
                .height('20vp')
            }
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
        .title('MainTitle', { enableHoverMode: true })
        .titleMode(NavigationTitleMode.Full)
        .height('100%')
        .width('100%')
        .backgroundColor(Color.White)
      }
      .width('100%')
      .height('100%')
      .backgroundColor('#F1F3F5')
    }
  }
}