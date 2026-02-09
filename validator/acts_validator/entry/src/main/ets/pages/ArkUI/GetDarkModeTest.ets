/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import FirstDialog from '../model/FirstDialog';
import  uiAppearance  from '@ohos.uiAppearance';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct GetDarkModeTest {
  @State name: string = 'GetDarkModeTest';
  @State stepTips: string = '测试目的：验证getDarkMode获取系统设置的深浅色模式。\n' +
      '操作步骤：\n' +
      '1、点击按钮ALWAYS_DARK\n' +
      '2、点击按钮ALWAYS_LIGHT\n' +
      '预期结果：\n' +
      '1、文本信息显示为: getDarkMode dark: true\n' +
      '2、文本信息显示为: getDarkMode light: true';
  @State isVue: boolean = false;
  @State active: boolean = false;
  @State intervalNum: number = 0;
  @State isDarkMode: boolean = false;
  @State isLightMode: boolean = false;

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
  }

  onPageShow() {
    this.intervalNum = setInterval(() => {
      if(this.isDarkMode && this.isLightMode) {
        this.isVue = true;
      }
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

      Column({ space: 12 }) {

        Button('ALWAYS_DARK')
          .onClick(() => {

            try {
              uiAppearance.setDarkMode(uiAppearance.DarkMode.ALWAYS_DARK, (error) => {
                if (error) {
                  console.error('Set dark-mode failed, ' + error.message);
                } else {
                  console.info('Set dark-mode successfully.');
                  let darkMode = uiAppearance.getDarkMode();
                  if ( darkMode == uiAppearance.DarkMode.ALWAYS_DARK ) {
                    this.isDarkMode = true;
                    console.log('getDarkMode value: ', darkMode);
                  }
                }
              });
            } catch (error) {
              let message = (error as BusinessError).message;
              console.error('Set dark-mode failed, ' + message);
            }
          })

        Button('ALWAYS_LIGHT')
          .onClick(() => {
            try {
              uiAppearance.setDarkMode(uiAppearance.DarkMode.ALWAYS_LIGHT, (error) => {
                if (error) {
                  console.error('Set dark-mode failed, ' + error.message);
                } else {
                  console.info('Set dark-mode successfully.');
                  let darkMode = uiAppearance.getDarkMode();
                  if ( darkMode == uiAppearance.DarkMode.ALWAYS_LIGHT ) {
                    this.isLightMode = true;
                    console.log('getDarkMode value: ', darkMode);
                  }
                }
              });
            } catch (error) {
              let message = (error as BusinessError).message;
              console.error('Set dark-mode failed, ' + message);
            }
          })

        Text('getDarkMode dark:' + this.isDarkMode + '').fontSize(10).fontColor(Color.Red)
        Text('getDarkMode light:' + this.isLightMode + '').fontSize(10).fontColor(Color.Red)

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

    }.width('100%')
    .height('100%')
    .backgroundColor('#F1F3F5')
  }
}