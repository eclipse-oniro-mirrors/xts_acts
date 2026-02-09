/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

const TAG = '[MaskDemo]';

@Entry
@Component
export struct MaskDemo {
  @State name: string = 'AdvancedBlendMode';
  @State useOffscreen: boolean = false;
  @State absVue: boolean = false; // 控制通过按钮状态
  @State intervalNum: number = 0; // 定时器编号
  @State stepTips: string = '接口是系统接口需要调用系统接口\n' +
    '操作步骤:\n' + '1、点击按钮，观察文字渐隐效果\n' +
    '预期结果：\n' + '1、文字出现渐隐效果\n';

  aboutToAppear(): void {
    FirstDialog.ChooseDialog(this.stepTips, this.name);
  }

  aboutToDisappear(): void {
    this.getUIContext()
      .getFocusController()
      .activate(false);
    clearInterval(this.intervalNum);
  }

  onPageHide() {
    clearInterval(this.intervalNum);
  }

  onPageShow() {
    this.intervalNum = setInterval(() => {
      if (this.useOffscreen) {
        this.absVue = true;
      }
    }, 500);
  }

  @Builder
  PassBtn(text: Resource, isFullScreen: boolean) {
    if (this.absVue == false) {
      Button({ stateEffect: this.absVue }) {
        Image($r('app.media.ic_public_pass'))
          .width('20vp')
          .height('20vp')
      }
      .margin({ bottom: '20vp' })
      .width('30%')
      .height('30vp')
      .backgroundColor(Color.Grey)
      .opacity(0.4)
      .onClick(() => {})
    } else {
      Button({ stateEffect: this.absVue }) {
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
        });
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
      });
      promptAction.showToast({
        message: '失败', duration: 1000
      });
    })
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
        });

        Text(this.name)
          .fontColor(Color.White)
          .fontSize('18fp')
          .margin({ left: '-20vp' });
        Text('hello')
          .fontColor(Color.White)
          .visibility(Visibility.Hidden);
      }
      .backgroundColor(Color.Black)
      .height('10%')
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween);

      Column() {
        Stack() {
          Column() {
            Text('Test BlendApplyType OFFSCREEN WITH BACKGROUND')
              .fontSize(25)
              .fontColor(Color.Red)
              .id('BlendApplyTypeTest');
          };

          if (this.useOffscreen) {
            Column()
              .width('100%')
              .height('100%')
              .linearGradient({
                direction: GradientDirection.Right,
                colors: [
                  [Color.Transparent, 0.0],
                  [Color.Black, 0.35],
                  [Color.Black, 0.65],
                  [Color.Transparent, 1.0]
                ]
              })
              .blendMode(BlendMode.DST_IN, BlendApplyType.FAST);
          }
        }
        .margin({ top: 220 })
        .advancedBlendMode(BlendMode.SRC_OVER, BlendApplyType.OFFSCREEN_WITH_BACKGROUND)
        .id('backgroundyunxing')
        .width('100%')
        .height('15%');

        Button(this.useOffscreen ? '1' : '1')
          .onClick(() => this.useOffscreen = !this.useOffscreen)
          .id('backgroundbutton');

        Button(this.useOffscreen ? '2' : '2')
          .onClick(() => {
            AlertDialog.show({
              title: '操作提示',
              message: this.stepTips,
              confirm: {
                value: 'OK',
                action: () => {}
              }
            });
          });
      }
      .height('80%')
      .width('100%')
      .backgroundColor(Color.White);

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
          AlertDialog.show({
            title: '操作提示',
            message: this.stepTips,
            confirm: {
              value: 'OK',
              action: () => {}
            }
          });
        });
        this.FailBtn($r('app.string.btn_fullscreen'), true);
      }
      .height('10%')
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .backgroundColor(Color.Black);
    }
    .height('100%')
    .width('100%')
    .backgroundColor('#F1F3F5');
  }
}