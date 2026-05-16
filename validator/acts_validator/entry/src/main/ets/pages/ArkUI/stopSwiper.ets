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
import router from '@ohos.router';
import promptAction from '@ohos.promptAction';
import Logger from '../model/Logger';
import fs from '@ohos.file.fs';
import FirstDialog from '../model/FirstDialog';
import { BusinessError } from '@ohos.base';

const TAG = '[stopSwiper]';

@Entry
@Component
struct stopWhenTouchedSwiper {
  @State name: string = 'stopSwiper';
  @State stepTips: string = '操作步骤：在子组件自动播放情况下，当stopWhenTouched的属性值不为false时，手指在Swiper组件屏幕上按下，停止自动播放' + '\n' + '预期结果：子组件停止自动播放';
  @State isVue: boolean = false;
  @State intervalNum: number = 0;
  @State isVertical: boolean = false;
  @State duration: number = 400;
  @State loop: boolean = true;
  @State count: number = 0;
  private controller: SwiperController = new SwiperController();
  private data: number[] = [];
  @State isAutoPlay: boolean | null | undefined = true
  @State isStopWhenTouched: boolean | null | undefined = true
  @State intervalArg: number = 1000
  @State isDigIndicator: boolean = false;

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
    for (let i = 1; i < 11; i++) {
      Logger.info(TAG, 'data.push i =>' + i)
      this.data.push(i)
    }
  }

  onPageShow() {
    this.intervalNum = setInterval(() => {
      if (this.count > 0) {
        this.isVue = true
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
            .height('15vp')
            .margin({ left: '20vp' })
        }
        .backgroundColor(Color.Black)
        .size({ width: '40vp', height: '20vp' })
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
          Text('stopWhenTouched')
            .align(Alignment.Start)
            .height('100%')
            .width('100%')
            .fontSize(16)
        }
        .height(20)
        .width('90%')
        .justifyContent(FlexAlign.Start)
        .margin({ top: 10 })

        Swiper(this.controller) {
          ForEach(this.data, (item: number, index) => {
            if ((this.isAutoPlay === true) && this.isStopWhenTouched !== false) {
              Text(item.toString())
                .width('90%')
                .height(160)
                .fontSize(30)
                .textAlign(TextAlign.Center)
                .backgroundColor('#E6A23C')
            } else {
              Text(item.toString())
                .width('90%')
                .height(160)
                .fontSize(30)
                .textAlign(TextAlign.Center)
                .backgroundColor('#f1f3f5')
            }
          }, (item: string) => item)
        }
        .autoPlay(this.isAutoPlay, { stopWhenTouched: this.isStopWhenTouched })
        .interval(this.intervalArg)
        .duration(this.duration)
        .loop(this.loop)
        .vertical(this.isVertical)
        .itemSpace(0)
        .indicator( // 设置圆点导航点样式
          this.isDigIndicator ? new DigitIndicator()// 设置数字导航点样式
            .fontColor(Color.Red)
            .selectedFontColor(Color.Blue)
            .digitFont({ size: 15, weight: FontWeight.Bold })
            .selectedDigitFont({ size: 15, weight: FontWeight.Normal }) :
          new DotIndicator()
            .itemWidth(15)
            .itemHeight(15)
            .selectedItemWidth(15)
            .selectedItemHeight(15)
            .color(Color.Gray)
            .selectedColor(Color.Blue))
        .displayArrow({
          // 设置导航点箭头样式
          showBackground: true,
          isSidebarMiddle: true,
          backgroundSize: 24,
          backgroundColor: Color.White,
          arrowSize: 18,
          arrowColor: Color.Blue
        }, false)
        .gesture(
          TapGesture({ count: 1 })
            .onAction((event: GestureEvent) => {
              if (event) {
                this.count++
              }
            })
        )

        Column({ space: 5 }) {
          Button('导航点指示器样式切换')
            .width('47%')
            .height(30)
            .margin({ top: 5 })
            .fontSize(12)
            .onClick(() => {
              this.isDigIndicator = !this.isDigIndicator
            })

          Text('LongPress:' + this.count)
          Row(){
            Button('autoPlay:' + this.isAutoPlay)
              .onClick((event: ClickEvent) => {
                this.isAutoPlay = !this.isAutoPlay
              }).margin({ bottom: 2 }).fontWeight(FontWeight.Bold).fontColor(Color.Red)
          }
          Row(){
            Button('stopWhenTouched:' + this.isStopWhenTouched)
              .onClick((event: ClickEvent) => {
                this.isStopWhenTouched = !this.isStopWhenTouched
                console.log('此时的autoPlay值为：' + this.isAutoPlay,
                  '此时的stopWhenTouched值为：' + this.isStopWhenTouched)
              }).margin({ bottom: 2 }).fontWeight(FontWeight.Bold).fontColor(Color.Red)

          }
          Button('stopWhenTouched:null')
            .height(30)
            .onClick((event: ClickEvent) => {
              this.isStopWhenTouched = null
              console.log('此时的autoPlay值为：' + this.isAutoPlay, '此时的stopWhenTouched值为：null')
            }).margin({ bottom: 2 })
          Button('stopWhenTouched:undefined')
            .height(30)
            .onClick((event: ClickEvent) => {
              this.isStopWhenTouched = undefined
              console.log('此时的autoPlay值为：' + this.isAutoPlay, '此时的stopWhenTouched值为：undefined')
            }).margin({ bottom: 2 })

        }
      }
      .height('70%')
      .width('100%')
      .backgroundColor(Color.White)

      Row() {
        this.PassBtn($r('app.string.btn_fullscreen'), true);
        Button() {
          Image($r('app.media.app_icon'))
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
      .margin({ bottom: '20vp' })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F1F3F5')
  }
}
