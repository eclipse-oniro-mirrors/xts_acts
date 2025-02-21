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

const TAG = '[TimePicker]';

@Entry
@Component
struct TextPickerDemo {
  @State FillColor: string = '#FF000000';
  @State name: string = 'TimePicker';
  @State StepTips: string = '操作步骤：\n1、点击12小时制按钮，切换为24小时制\n' +
    '2、将时间选为11小时11分钟' + '\n' + '预期结果：选择器显示和展示文本一致则通过';
  @State Vue: boolean = false;
  @State active: boolean = false;
  @State intervalNum: number = 0;
  @State isMilitaryTime: boolean = false;
  @State time: string = '';
  @State change: boolean = false;
  private selectedTime: Date = new Date('2023-12-1T08:00:00');

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
      if (this.change && this.time === '11小时 11分钟') {
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
        Button(!this.isMilitaryTime ? '12小时制' : '24小时制')
          .margin({ top: 30 })
          .onClick(() => {
            this.isMilitaryTime = !this.isMilitaryTime
            this.change = !this.change
          })
        TimePicker({
          selected: this.selectedTime,
        })
          .useMilitaryTime(this.isMilitaryTime)
          .onChange((value: TimePickerResult) => {
            if (value.hour) {
              this.selectedTime.setHours(value.hour, value.minute);
              this.time = value.hour.toString() + '小时 ' + value.minute + '分钟';
              console.info('select current date is: ' + JSON.stringify(value))
            }
          })
          .disappearTextStyle({ color: Color.Red, font: { size: 15, weight: FontWeight.Lighter } })
          .textStyle({ color: Color.Black, font: { size: 20, weight: FontWeight.Normal } })
          .selectedTextStyle({ color: Color.Blue, font: { size: 30, weight: FontWeight.Bolder } })
          .margin({ top: 24 })

        Column() {
          Text('您选择的时间为:')
            .fontSize(24)
            .margin({ left: 12, right: 12 })

          Text(this.time)
            .fontSize(24)
            .margin({ left: 12, right: 12, top: 18 })
        }
        .margin({ top: 48 })
        .borderWidth(2)
        .borderRadius(24)
        .borderColor(Color.Black)
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

