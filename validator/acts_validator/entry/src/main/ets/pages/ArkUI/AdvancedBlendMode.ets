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
import { uiEffect } from '@kit.ArkGraphics2D';
import ConfigurationConstant from '@ohos.app.ability.ConfigurationConstant';
import common from '@ohos.app.ability.common';

const TAG = '[MaskDemo]';

let blender: uiEffect.BrightnessBlender = uiEffect.createBrightnessBlender({
  cubicRate: 0.5,
  quadraticRate: 0.5,
  linearRate: 0.5,
  degree: 0.5,
  saturation: 0.5,
  positiveCoefficient: [2.3, 4.5, 2.0],
  negativeCoefficient: [0.5, 2.0, 0.5],
  fraction: 0
});

interface GeneratedObjectLiteralInterface_1 {
  radius: number;
  color: Color;
  offsetX: number;
  offsetY: number;
}

const textShadowStyle: GeneratedObjectLiteralInterface_1 = {
  radius: 10,
  color: Color.Yellow,
  offsetX: 2,
  offsetY: 2
};

enum BlendApplyType {
  FAST,
  OFFSCREEN,
  OFFSCREEN_WITH_BACKGROUND
}

@Entry
@Component
export struct MaskDemo {
  @State name: string = 'AdvancedBlendMode';
  @State useOffscreen: boolean = false;
  @State absVue: boolean = false;
  @State intervalNum: number = 0;
  @State stepTips: string = '接口是系统接口需要调用系统接口\n' +
    '操作步骤:\n' + '1、点击未启用按钮，观察文字渐隐效果\n' +
    '预期结果：\n' + '1、文字出现渐隐效果\n';
  @State mUseOffscreen: boolean = false;
  @State blendApplyType: BlendApplyType | null | undefined = BlendApplyType.OFFSCREEN_WITH_BACKGROUND;
  @State isBrightnessEnabled: boolean = false;
  @State isTextColorEnabled: boolean = false;
  @State isTextShadowEnabled: boolean = false;
  @State isDark: boolean = false;
  @State isItalic: boolean = false;
  @State context: common.UIAbilityContext = getContext(this) as common.UIAbilityContext;

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
      if (this.mUseOffscreen) {
        this.absVue = true;
      }
    }, 100);
  }

  @Builder
  PassBtn(text: Resource, isFullScreen: boolean) {
    if (this.absVue == false) {
      Button({ stateEffect: false }) {
        Image($r('app.media.ic_public_pass'))
          .width('20vp')
          .height('20vp')
      }
      .margin({ bottom: '20vp' })
      .width('30%')
      .height('30vp')
      .backgroundColor(Color.Grey)
      .opacity(0.4)
      .enabled(false)
      .onClick(() => {})
    } else {
      Button({ stateEffect: true }) {
        Image($r('app.media.ic_public_pass'))
          .width('20vp')
          .height('20vp')
      }
      .margin({ bottom: '20vp' })
      .width('30%')
      .height('30vp')
      .backgroundColor(Color.Grey)
      .enabled(true)
      .opacity(1)
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
        if (this.mUseOffscreen) {
          Stack() {
            Column() {
              Text(String.fromCodePoint(0x1F600) + 'بۇلۇڭغۇم ئۇيغۇرچەدەك بۇرۇنغۇ چاغلىق， رەشىتلىك ۋە ئۇرۇمچىدىكى خېمتەر ئەگەرىدەك خۇشاللىقى， ئۇرۇمچىدىكى يېڭى يېزىدەك يېقىملىقى， ئۇرۇمچىدىكى قەشقەر دەرۋازىسىدەك تەكلىكلىقى بىلەن يېزىلگەن بۇرۇنغۇ مەزمۇن. ئۇرۇمچى， ئۇلۇغ خەلقۇمۇزىڭ ئۇرۇمچى ئۇلۇسلىك ئۇلۇغ شەھىرى， شىنجاڭ ئۇيغۇر ئاپتونوم رايونىڭ مۈلۈك， ئىسلام ئىشلەر， تېخنىك， تۇرۇش， ' +
              String.fromCodePoint(0x1F600))
                .fontSize(25)
                .fontColor(this.isTextColorEnabled ? Color.Red : Color.White)
                .textShadow(this.isTextShadowEnabled ? textShadowStyle : null)
                .fontStyle(this.isItalic ? FontStyle.Italic : FontStyle.Normal)
            }
            .advancedBlendMode(this.isBrightnessEnabled ? blender : null, BlendApplyType.FAST)
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
              .blendMode(BlendMode.DST_IN, BlendApplyType.FAST)
          }
          .margin({ top: 20 })
          .advancedBlendMode(BlendMode.SRC_OVER, this.blendApplyType)
          .width('100%')
          .height('20%')
        } else {
          Stack() {
            Column() {
              Text(String.fromCodePoint(0x1F600) + 'بۇلۇڭغۇم ئۇيغۇرچەدەك بۇرۇنغۇ چاغلىق， رەشىتلىك ۋە ئۇرۇمچىدىكى خېمتەر ئەگەرىدەك خۇشاللىقى， ئۇرۇمچىدىكى يېڭى يېزىدەك يېقىملىقى， ئۇرۇمچىدىكى قەشقەر دەرۋازىسىدەك تەكلىكلىقى بىلەن يېزىلگەن بۇرۇنغۇ مەزمۇن. ئۇرۇمچى， ئۇلۇغ خەلقۇمۇزىڭ ئۇرۇمچى ئۇلۇسلىك ئۇلۇغ شەھىرى， شىنجاڭ ئۇيغۇر ئاپتونوم رايونىڭ مۈلۈك， ئىسلام ئىشلەر， تېخنىك， تۇرۇش， ' +
                String.fromCodePoint(0x1F600))
                .fontSize(25)
                .fontColor(this.isTextColorEnabled ? Color.Red : Color.White)
                .textShadow(this.isTextShadowEnabled ? textShadowStyle : null)
                .fontStyle(this.isItalic ? FontStyle.Italic : FontStyle.Normal)
            }
          }
          .margin({ top: 20 })
          .width('100%')
          .height('20%')
        }

        Button(this.isBrightnessEnabled ? '关闭提亮' : '开启提亮')
          .backgroundColor(this.isBrightnessEnabled ? Color.Green : Color.Blue)
          .fontColor(Color.White)
          .padding({ left: 20, right: 20, top: 5, bottom: 5 })
          .margin({ top: 20 })
          .onClick(() => {
            this.isBrightnessEnabled = !this.isBrightnessEnabled;
          })
        Column() {
          Row({ space: 10 }) {
            Button(this.mUseOffscreen ? '已启用' : '未启用')
              .backgroundColor(this.mUseOffscreen ? Color.Orange : Color.Gray)
              .fontColor(Color.White)
              .padding({ left: 20, right: 20 })
              .onClick(() => {
                this.mUseOffscreen = !this.mUseOffscreen;
             })

            Button('OFFSCREEN')
              .backgroundColor(this.blendApplyType === BlendApplyType.OFFSCREEN ? Color.Orange : Color.Gray)
              .fontColor(Color.White)
              .padding({ left: 15, right: 15 })
              .onClick(() => {
                this.blendApplyType = BlendApplyType.OFFSCREEN;
              })

            Button('WITH_BACKGROUND')
              .backgroundColor(this.blendApplyType === BlendApplyType.OFFSCREEN_WITH_BACKGROUND ?
               Color.Orange : Color.Gray)
              .fontColor(Color.White)
              .padding({ left: 15, right: 15 })
              .onClick(() => {
                this.blendApplyType = BlendApplyType.OFFSCREEN_WITH_BACKGROUND;
              })
          }
          .margin({ top: 10 })

        }
        .justifyContent(FlexAlign.Center)

        Row() {
          Text('useBrightnessAndGradientColor:')
            .fontColor(Color.Red)
            .margin({ right: 10 })
            Button('FAST')
              .backgroundColor(this.blendApplyType === BlendApplyType.FAST ? Color.Orange : Color.Gray)
              .fontColor(Color.White)
              .padding({ left: 15, right: 15 })
              .onClick(() => {
                this.blendApplyType = BlendApplyType.FAST;
              })
            }
        .margin({ top: 10 })
      }
      .height('80%')
      .width('100%')
      .backgroundColor(Color.Black)
      .justifyContent(FlexAlign.Center);

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