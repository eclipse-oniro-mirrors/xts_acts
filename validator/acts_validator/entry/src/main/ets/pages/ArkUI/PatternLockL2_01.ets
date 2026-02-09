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
import fs from '@ohos.file.fs';
import FirstDialog from '../model/FirstDialog';
import { BusinessError } from '@ohos.base';
import { LengthMetrics, PatternLockModifier } from '@kit.ArkUI';

const TAG = '[PatternLockL2_01]';

@Entry
@Component
struct PatternLockL2_01 {
  @State rating: number = 0;
  @State FillColor: string = '#FF000000';
  @State name: string = 'PatternLockL2_01';
  @State StepTips: string = '操作步骤：在两个九宫格中画出自己想设置的密码，点击确认按钮' + '\n' + '预期结果：背景圆环及连线被宫格圆点完全覆盖';
  @State Vue: boolean = false;
  @State passwords: Number[] = [];
  @State customModifier: PatternLockModifier = new PatternLockModifier()
    .sideLength('47.5%')
    .circleRadius(9)
    .pathStrokeWidth(18)
    .regularColor('#ff182431')
    .activeColor('#B0C4DE')
    .selectedColor('#228B22')
    .pathColor('#90EE90')
    .backgroundColor('#F5F5F5')
    .autoReset(true)
    .activateCircleStyle({
      radius: LengthMetrics.vp(8)
    })
  private patternLockController: PatternLockController = new PatternLockController();
  private patternLockController1: PatternLockController = new PatternLockController();

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

      Column({ space: 10 }) {
        Row({ space: 5 }){
          Column({ space: 5 }){
            Text("原生属性").fontColor(Color.Red).margin({ top: 10 })
            PatternLock(this.patternLockController)
              .sideLength('47.5%')
              .circleRadius(9)
              .pathStrokeWidth(18)
              .regularColor('#ff182431')
              .activeColor('#B0C4DE')
              .selectedColor('#228B22')
              .pathColor('#90EE90')
              .backgroundColor('#F5F5F5')
              .autoReset(true)
              .activateCircleStyle({
                radius: LengthMetrics.vp(8)
              })
          }
          Column({ space: 5 }){
            Text("Modifier").fontColor(Color.Red).margin({ top: 10 })
            PatternLock(this.patternLockController1)
              .attributeModifier(this.customModifier)
          }
        }

        Button('确认')
          .width('30%')
          .height('6%')
          .onClick(() => {
            this.Vue = true;
          })
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