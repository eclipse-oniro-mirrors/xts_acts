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
import { BusinessError } from '@ohos.base';

const TAG = '[Swiper]';

@Entry
@Component
struct swiper {
  @State rating: number = 0;
  @State address: string = '';
  @State FillColor: string = '#FF000000';
  @State name: string = 'Swiper';
  @State StepTips: string = '操作步骤：点击上一页或下一页按钮，可以正常翻页' + '\n' + '预期结果：轮播图能够正常翻页';
  @State Vue: boolean = false;
  @State active: boolean = false;
  @State intervalNum: number = 0;
  @State isDisableSwipe: boolean = false;
  @State itemSpace: number = 0;
  @State isVertical: boolean = false;
  @State duration: number = 400;
  @State loop: boolean = true;
  @State autoPlay: boolean = false;
  @State interval: number = 1000;
  @State count: number = 0;
  private controller: SwiperController = new SwiperController();
  private data: number[] = [];

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
    for (let i = 1; i < 11; i++) {
      Logger.info(TAG, 'data.push i =>' + i)
      this.data.push(i)
    }
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
          Text('轮播图')
            .align(Alignment.Start)
            .height('100%')
            .width('100%')
            .fontSize(16)
        }
        .height(20)
        .width('90%')
        .justifyContent(FlexAlign.Start)
        .margin({ top: 5 })

        Swiper(this.controller) {
          ForEach(this.data, (item: number, index) => {
            if (index % 2 === 0) {
              Text(item.toString())
                .width('100%')
                .height('100%')
                .fontSize(30)
                .textAlign(TextAlign.Center)
                .backgroundColor('#E6A23C')
            } else {
              Text(item.toString())
                .width('100%')
                .height('100%')
                .fontSize(30)
                .textAlign(TextAlign.Center)
                .backgroundColor('#f1f3f5')
            }
          })
        }
        .disableSwipe(this.isDisableSwipe)
        .itemSpace(this.itemSpace)
        .vertical(this.isVertical)
        .duration(this.duration)
        .loop(this.loop)
        .interval(this.interval)
        .autoPlay(this.autoPlay)
        .borderRadius(16)
        .backgroundColor(Color.White)
        .width('90%')
        .height('40%')
        .flexGrow(0)
        .margin({ top: 5 })

        Row() {
          Button('上一页')
            .fontColor(Color.Black)
            .margin({ right: 40 })
            .onClick(() => {
              this.controller.showPrevious()
              this.count++
            })

          Button('下一页')
            .fontColor(Color.Black)
            .onClick(() => {
              this.controller.showNext()
              this.count++
            })
        }
        .margin({ top: 5 })
      }
      .height('70%')
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
      .margin({ bottom: '20vp' })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F1F3F5')
  }
}

