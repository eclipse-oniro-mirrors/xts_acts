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

const TAG = '[Marquee]';

@Entry
@Component
struct marquee {
  @State rating: number = 0;
  @State address: string = '';
  @State FillColor: string = '#FF000000';
  @State name: string = 'Marquee';
  @State StepTips: string = '操作步骤：' + '\n' + '1、打开是否从右至左播放选择按钮\n2、设置速度为20' +
    '\n3、设置循环次数为2\n4、点击开始按钮\n5、观察跑马灯是否按照预期设定运行' + '\n' + '预期结果：设置选项与最终播放效果一致则通过';
  @State Vue: boolean = false;
  @State active: boolean = false;
  @State intervalNum: number = 0;
  @State start: boolean = false;
  @State fromStart: boolean = false;
  @State step: number = 10;
  @State loop: number = 0;
  @State rolling: boolean = false;
  @State marqueeSrc: string = '欢迎来到validator,我是validator跑马灯';
  @State mColor: Color = Color.Gray;

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
      if (this.step === 20 && this.loop === 2 && this.fromStart === true && this.rolling === true) {
        this.Vue = true;
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
        Column() {
          Marquee({
            start: this.start,
            step: this.step,
            loop: this.loop,
            fromStart: this.fromStart,
            src: this.marqueeSrc
          })
            .width(300)
            .height(100)
            .fontColor(Color.White)
            .fontSize(35)
            .allowScale(false)
            .fontWeight(FontWeight.Bold)
            .backgroundColor(Color.Gray)
            .margin({ bottom: 40 })
            .onStart(() => {
              Logger.info(TAG, 'Marquee animation complete onStart')
            })
            .onBounce(() => {
              Logger.info(TAG, 'Marquee animation complete onBounce')
            })
            .onFinish(() => {
              Logger.info(TAG, 'Marquee animation complete onFinish')
              this.start = false
              this.loop = 0
            })
          Button(this.start ? '停止' : '开始')
            .onClick(() => {
              this.start = !this.start
              this.rolling = !this.rolling
            })
            .id('test_marqueeButton')
            .width(150)
            .height(45)
            .margin({ bottom: 20 })
        }
        .backgroundColor(Color.White)
        .borderRadius(24)
        .width('100%')
        .padding(15)
        .width('100%')

        Text('选项')
          .fontSize(18)
          .height(22)
          .alignSelf(ItemAlign.Start)
          .margin({ left: 12, top: 12 })
        Column() {
          Row() {
            Text('是否从右至左播放')
              .fontSize(18)
              .height(22)
              .alignSelf(ItemAlign.Start)
              .margin({ left: 12, top: 12 })
              .width('50%')
            Blank()
            Toggle({ type: ToggleType.Switch, isOn: this.fromStart })
              .onChange((isOn) => {
                this.fromStart = isOn
              }).id('test_toggle')
          }.width('100%')
          .height(50)

          Row() {
            Text('设置速度')
              .fontSize(18)
              .height(22)
              .alignSelf(ItemAlign.Start)
              .margin({ left: 12, top: 12 })
              .width('50%')
            Blank()
            Counter() {
              Text(this.step.toString())
            }
            .onInc(() => {
              this.step++
            })
            .onDec(() => {
              if (this.step > 0) {
                this.step--
              }
            })
          }.width('100%')
          .height(50)

          Row() {
            Text('循环次数')
              .fontSize(18)
              .height(22)
              .alignSelf(ItemAlign.Start)
              .margin({ left: 12, top: 12 })
              .width('50%')
            Blank()
            Counter() {
              Text(this.loop.toString())
            }
            .onInc(() => {
              this.loop++
            })
            .onDec(() => {
              if (this.loop > 0) {
                this.loop--
              }
            })
          }.width('100%')
          .height(50)
        }
        .backgroundColor(Color.White)
        .borderRadius(24)
        .width('100%')
        .padding(15)
        .width('100%')
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

