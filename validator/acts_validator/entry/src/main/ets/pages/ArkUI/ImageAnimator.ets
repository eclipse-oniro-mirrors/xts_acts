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
import promptAction from '@ohos.promptAction';
import Logger from '../model/Logger';
import fs from '@ohos.file.fs';
import FirstDialog from '../model/FirstDialog';
import prompt from '@ohos.promptAction'
import { BusinessError } from '@ohos.base';

const TAG = '[ImageAnimator]';

@Entry
@Component
struct imageAnimator {
  @State rating: number = 0;
  @State address: string = '';
  @State FillColor: string = '#FF000000';
  @State name: string = 'ImageAnimator';
  @State StepTips: string = '操作步骤：点击start按钮进行图片播放' + '\n' + '预期结果：图中物品从左移动到右边';
  @State Vue: boolean = false;
  @State active: boolean = false;
  @State intervalNum: number = 0;
  @State animatorState: AnimationStatus = AnimationStatus.Initial;
  @State animatorReserve: boolean = false;
  @State animatorInterations: number = 1;
  @State count: number = 0;

  @Builder
  PassBtn(text: Resource, isFullScreen: boolean) {
    if (this.Vue == false) {
      Button({ stateEffect: this.Vue }) {
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
    }
    else {
      Button({ stateEffect: this.Vue }) {
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
    FirstDialog.ChooseDialog(this.StepTips, this.name);

  }

  onPageShow() {
    this.intervalNum = setInterval(() => {
      if (this.count > 0) {
        this.Vue = true
      }
    }, 500)
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
        Row() {
          Text('逐帧播放')
            .align(Alignment.Start)
            .height('100%')
            .width('100%')
            .fontSize(16)
        }
        .height(20)
        .width('90%')
        .justifyContent(FlexAlign.Start)
        .margin({ top: 24 })

        ImageAnimator()
          .images([
            {
              src: $r('app.media.image_animator_1')
            },
            {
              src: $r('app.media.image_animator_2')
            },
            {
              src: $r('app.media.image_animator_3')
            },
            {
              src: $r('app.media.image_animator_4')
            },
            {
              src: $r('app.media.image_animator_5')
            },
            {
              src: $r('app.media.image_animator_6')
            },
            {
              src: $r('app.media.image_animator_7')
            },
            {
              src: $r('app.media.image_animator_8')
            }
          ])
          .margin({ top: 12 })
          .duration(3000)
          .fillMode(FillMode.None)
          .width('60%')
          .height('75%')
          .iterations(this.animatorInterations)
          .state(this.animatorState)
          .reverse(this.animatorReserve)
          .onStart(() => {
            prompt.showToast({
              message: 'start',
              duration: 1000
            })
            this.count++
            Logger.info(TAG, 'Start')
          })
          .onPause(() => {
            prompt.showToast({
              message: 'Pause',
              duration: 1000
            })
            Logger.info(TAG, 'Pause')
          })
          .onRepeat(() => {
            prompt.showToast({
              message: 'Repeat',
              duration: 1000
            })
            Logger.info(TAG, 'Repeat')
          })
          .onCancel(() => {
            prompt.showToast({
              message: 'Cancel',
              duration: 1000
            })
            Logger.info(TAG, 'Cancel')
          })
          .onFinish(() => {
            prompt.showToast({
              message: 'Finish',
              duration: 1000
            })
            Logger.info(TAG, 'Finish')
            this.animatorState = AnimationStatus.Stopped
          })

        Row() {
          Button('start')
            .onClick(() => {
              this.count++
              this.animatorState = AnimationStatus.Running
            })
            .width(100)
            .margin(5)
            .type(ButtonType.Normal)
            .borderRadius(20)

          Button('pause')
            .padding(5)
            .onClick(() => {
              this.animatorState = AnimationStatus.Paused
            })
            .width(100)
            .margin(5)
            .type(ButtonType.Normal)
            .borderRadius(20)

          Button('end')
            .padding(5)
            .onClick(() => {
              this.animatorState = AnimationStatus.Stopped
            })
            .width(100)
            .margin(5)
            .type(ButtonType.Normal)
            .borderRadius(20)
        }
        .margin({ top: 12 })
        .justifyContent(FlexAlign.SpaceEvenly)
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
        .width('30%')
        .height('30vp')
        .backgroundColor(Color.Grey)
        .onClick(() => {
          AlertDialog.show(
            {
              title: '操作提示',
              message: this.StepTips,
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

