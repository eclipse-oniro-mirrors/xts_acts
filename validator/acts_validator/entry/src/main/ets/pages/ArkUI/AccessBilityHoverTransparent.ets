/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
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

const TAG = '[onAccessibilityHoverTransparent]';

@Entry
@Component
struct AccessibilityHoverTransparentDemo {
  @State name: string = 'onAccessibilityHoverTransparent';
  @State stepTips: string = '测试目的: 验证无障碍接口onAccessibilityHoverTransparent\n' + '\n' +
    '操作步骤: 开启屏幕朗读\n' +
    '1、触摸accessibilityLevel_yes文本\n' +
    '2、触摸accessibilityLevel_no文本\n' +
    '3、触摸accessibilityLevel_auto文本\n' +
    '4、触摸accessibilityLevel_no-hide-descendants文本\n' + '\n' +
    '预期结果: ' + '\n' +
    '1、触摸accessibilityLevel_yes文本后, 页面未出现 onAccessibilityHoverTransparent_fail文本\n' +
    '2、触摸accessibilityLevel_no文本后,页面出现onAccessibilityHoverTransparent_pass文本\n' +
    '3、触摸accessibilityLevel_auto文本后,页面未出现 onAccessibilityHoverTransparent_auto文本\n' +
    '4、触摸accessibilityLevel_no-hide-descendants文本后,页面出现onAccessibilityHoverTransparent_hide文本';
  @State isOk: boolean = false;
  @State active: boolean = false;
  @State intervalNum: number = 0;
  @State yesEnable: boolean = false;
  // 默认不支持
  @State onAccessibilityHoverTransparentEnable: boolean = false;
  @State color: Color = Color.Blue;
  @State text1: string = '';
  @State text2: string = '';
  @State text3: string = '';
  @State text4: string = '';

  @Builder
  PassBtn(text: Resource, isFullScreen: boolean) {
    if (this.isOk === false) {
      Button({ stateEffect: this.isOk }) {
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
      Button({ stateEffect: this.isOk }) {
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
      });
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
      if (this.text1 === 'onAccessibilityHoverTransparent_pass' &&
        this.text2 !== 'onAccessibilityHoverTransparent_fail' &&
        this.text3 !== 'onAccessibilityHoverTransparent_auto' &&
        this.text4 === 'onAccessibilityHoverTransparent_hide') {
        this.isOk = true;
      }
    }, 500);
  }

  onPageHide() {
    clearInterval(this.intervalNum);
  }

  aboutToDisappear() {
    clearInterval(this.intervalNum);
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
          });
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
          Text(`是否设备支持屏幕朗读`).fontColor(Color.Green).fontSize('18fp').margin({top:20})
        }
        .height('5%')
        Row() {
          Column() {
            Button(`不支持`)
              .borderRadius(8)
              .backgroundColor(0x317aff)
              .width('30%')
              .enabled(!this.yesEnable)
              .opacity(!this.yesEnable ? 1 : 0.4)
              .onClick(async () => {
              })
          }
          Column() {
            Button(`支持`)
              .borderRadius(8)
              .backgroundColor(0x317aff)
              .width('30%')
              .onClick(async () => {
                this.yesEnable = true;
                this.onAccessibilityHoverTransparentEnable = true;
              })
          }
        }
        .height('10%')
        Text(this.text1).key('hoverTest1').height('5%')
        Text(this.text2).key('hoverTest2').height('5%')
        Text(this.text3).key('hoverTest3').height('5%')
        Text(this.text4).key('hoverTest4').height('5%')
        Text('accessibilityLevel_yes').height('10%')
          .enabled(this.onAccessibilityHoverTransparentEnable)
          .opacity(this.onAccessibilityHoverTransparentEnable ? 1 : 0.4)
          .backgroundColor(this.color)
          .borderWidth(1)
          .accessibilityLevel('yes')
          .onAccessibilityHoverTransparent((event) => {
            // accessibilityLevel为yes时，hover不会触发回调
            console.info('testHover_' + JSON.stringify(event))
            this.text2 = 'onAccessibilityHoverTransparent_fail'
          })
        Text('accessibilityLevel_no').height('10%')
          .enabled(this.onAccessibilityHoverTransparentEnable)
          .opacity(this.onAccessibilityHoverTransparentEnable ? 1 : 0.4)
          .backgroundColor(this.color)
          .borderWidth(1)
          .accessibilityLevel('no')
          .onAccessibilityHoverTransparent((event) => {
            // accessibilityLevel为no时，hover会触发回调
            console.info('testHover_' + JSON.stringify(event))
            this.text1 = 'onAccessibilityHoverTransparent_pass'
          })
        Text('accessibilityLevel_auto').height('10%')
          .enabled(this.onAccessibilityHoverTransparentEnable)
          .opacity(this.onAccessibilityHoverTransparentEnable ? 1 : 0.4)
          .backgroundColor(this.color)
          .borderWidth(1)
          .accessibilityLevel('auto')
          .onAccessibilityHoverTransparent((event) => {
            // accessibilityLevel为auto时，hover不会触发回调
            console.info('testHover_' + JSON.stringify(event))
            this.text3 = 'onAccessibilityHoverTransparent_auto'
          })
        Text('accessibilityLevel_no-hide-descendants').height('10%')
          .enabled(this.onAccessibilityHoverTransparentEnable)
          .opacity(this.onAccessibilityHoverTransparentEnable ? 1 : 0.4)
          .backgroundColor(this.color)
          .borderWidth(1)
          .accessibilityLevel('no-hide-descendants')
          .onAccessibilityHoverTransparent((event) => {
            // accessibilityLevel为no-hide-descendants时，hover会触发回调
            console.info('testHover_' + JSON.stringify(event))
            this.text4 = 'onAccessibilityHoverTransparent_hide'
          })
      }.height('80%')
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
    }.width('100%')
    .height('100%')
    .backgroundColor('#F1F3F5')
  }

}