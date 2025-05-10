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

const TAG = '[Search]';

@Entry
@Component
struct search {
  @State submitValue: string = ''
  @State FillColor: string = '#FF000000';
  @State name: string = 'Search';
  @State StepTips: string = '操作步骤：在搜索框中输入1-5中任意一个数字并点击搜索' + '\n' + '预期结果：输入的数字内容会单独出现';
  @State Vue: boolean = false;
  @State isSearch: boolean = false;
  private arrNum: Array<string> = ['1', '2', '3', '4', '5'];

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
        Search({ placeholder: '请输入数字' })
          .searchButton('搜索')
          .cancelButton({
            style: CancelButtonStyle.CONSTANT,
            icon: {
              src: $r('app.media.ic_cancel')
            }
          })
          .width('90%')
          .height(40)
          .backgroundColor('#F5F5F5')
          .placeholderColor(Color.Grey)
          .placeholderFont({ size: 14, weight: 400 })
          .textFont({ size: 14, weight: 400 })
          .onSubmit((value: string) => {
            this.isSearch = true
            this.submitValue = value
            Logger.info(TAG, 'onSubmit submitValue=>' + this.submitValue)
            if (this.submitValue === '1' || this.submitValue === '2' || this.submitValue === '3'
              || this.submitValue === '4' || this.submitValue === '5') {
              this.Vue = true;
            }
          })
          .onChange((value: string) => {
            Logger.info(TAG, 'onChange submitValue=>' + value)
            this.submitValue = ''
            if (value === '') {
              this.isSearch = false
            }
          })
          .margin(20)

        Text('提交的值为：' + this.submitValue)
          .fontSize(24)
          .fontColor(Color.White)

        if (this.submitValue === '1') {
          Column() {
            Text('1')
              .fontSize(24)
          }
          .width('80%')
          .height(30)
          .borderRadius(24)
          .backgroundColor(Color.White)
          .margin({ top: 12 })
        }

        if (this.submitValue === '2') {
          Column() {
            Text('2')
              .fontSize(24)
          }
          .width('80%')
          .height(30)
          .borderRadius(24)
          .backgroundColor(Color.White)
          .margin({ top: 12 })
        }

        if (this.submitValue === '3') {
          Column() {
            Text('3')
              .fontSize(24)
          }
          .width('80%')
          .height(30)
          .borderRadius(24)
          .backgroundColor(Color.White)
          .margin({ top: 12 })
        }

        if (this.submitValue === '4') {
          Column() {
            Text('4')
              .fontSize(24)
          }
          .width('80%')
          .height(30)
          .borderRadius(24)
          .backgroundColor(Color.White)
          .margin({ top: 12 })
        }

        if (this.submitValue === '5') {
          Column() {
            Text('5')
              .fontSize(24)
          }
          .width('80%')
          .height(30)
          .borderRadius(24)
          .backgroundColor(Color.White)
          .margin({ top: 12 })
        }

        if (!this.isSearch) {
          ForEach(this.arrNum, (str: string) => {
            Row() {
              Text(str)
                .fontSize(24)
            }
            .justifyContent(FlexAlign.Center)
            .height(30)
            .width('80%')
            .margin({ top: 12 })
            .borderRadius(24)
            .backgroundColor(Color.White)
          })
        }
      }
      .height('80%')
      .width('100%')
      .backgroundColor(Color.Black)

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

