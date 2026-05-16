/**

 Copyright (c) 2025 Huawei Device Co., Ltd.
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */
import router from '@ohos.router';
import promptAction from '@ohos.promptAction';
import fs from '@ohos.file.fs';
import FirstDialog from '../model/FirstDialog';
import { BusinessError } from '@ohos.base';
import { ChipGroup, IconGroupSuffix, SymbolGlyphModifier } from '@kit.ArkUI';

const TAG = '[chipGroupTest]';

@Builder
function defaultFunction(): void {
}

@Component
struct SectionGroup {
  @Prop
  @Require
  title: ResourceStr;
  @BuilderParam
  @Require
  content: () => void = defaultFunction;

  build() {
    Column({ space: 4 }) {
      Text(this.title)
        .fontColor('#FF666666')
        .fontSize(12)
      Column({ space: 8 }) {
        this.content()
      }
    }
    .alignItems(HorizontalAlign.Start)
    .width('100%')
  }
}

@Component
struct SectionItem {
  @Prop
  @Require
  title: ResourceStr;
  @BuilderParam
  @Require
  content: () => void = defaultFunction;

  build() {
    Column({ space: 12 }) {
      Text(this.title)
      this.content()
    }
    .onClick(() => {

    })
    .backgroundColor('#FFFFFFFF')
    .borderRadius(12)
    .padding(12)
    .width('100%')

  }
}

@Entry
@Component
struct chipGroupTest {
  @State name: string = 'chipGroupTest';
  @State StepTips: string = '不支持屏幕朗读直接按照失败处理走豁免\n'+'设备支持屏幕朗读时\n' + '操作步骤:\n' +
    '1、点击单选区域和多选区域组件的后缀图标，观察朗读内容，双击后缀图标\n' + '\n' +
    '1、朗读内容为：保存，按钮，选项后缀图标\n'
  @State vueStatus: boolean = false;
  @State status1: boolean = false;
  @State status2: boolean = false;
  @State status3: boolean = false;
  @State status4: boolean = false;
  @State active: boolean = false;
  @State intervalNum: number = 0;
  @State yesEnable: boolean = false
  // 默认不支持
  @State onAccessibilityHoverEnable: boolean = false;
  @State color: Color = Color.Blue;
  @State currentIndex: number = 0
  @State selectedFontColor: string = '#007DFF'
  @State fontColor: string = '#182431'

  @LocalBuilder
  Suffix() {
    IconGroupSuffix({
      items: [
        {
          icon: { src: $r('sys.media.ohos_ic_public_more'), },
          accessibilityText: '更多',
          accessibilityDescription: '新手提醒',
          action: () => {
            this.getUIContext().getPromptAction().showToast({ message: '更多按钮被点击！' });
          },
        }, {
        symbol: new SymbolGlyphModifier($r('sys.symbol.more')),
        accessibilityText: '更多',
        accessibilityDescription: '新手提醒',
        action: () => {
          this.getUIContext().getPromptAction().showToast({
            message: '更多按钮被点击！'
          });
        }
      },
        {
          icon: { src: $r('sys.media.ohos_ic_public_more'), },
          accessibilityText: '更多',
          accessibilityDescription: '新手提醒',
          accessibilityLevel: 'no',
          action: () => {
            this.getUIContext().getPromptAction().showToast({
              message: '更多按钮被点击！'
            });
          }
        }
      ]
    })
  }

  @Builder
  PassBtn(text: Resource, isFullScreen: boolean) {
    if (this.vueStatus) {
      Button({ stateEffect: this.vueStatus }) {
        Image($r('app.media.ic_public_pass')).width('20vp').height('20vp')
      }.width('30%').height('30vp').backgroundColor(Color.Grey).onClick(() => {
        router.back({ url: 'pages/ArkUI/ArkUI_index', params: { result: 'true ', title: this.name, } })
        promptAction.showToast({ message: '通过', duration: 1000 });
      })
    } else {
      Button({ stateEffect: this.vueStatus }) {
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

  onPageHide() {
    clearInterval(this.intervalNum)
  }

  aboutToDisappear() {
    clearInterval(this.intervalNum)
  }

  build() {
    Scroll() {
      Column({ space: 10 }) {
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
          .width('100%')
          .height('10%')
          .height('10%')
          .width('100%')
          .height('10%')
          .width('100%')
          .justifyContent(FlexAlign.SpaceBetween)

          Row({ space: 10 }) {
            Text(`是否设备支持屏幕朗读`).fontColor(Color.Green).fontSize('18fp').margin({ top: 20 })
          }

          Row({ space: 10 }) {
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
                  this.yesEnable = true
                  this.onAccessibilityHoverEnable = true
                })
            }
          }

          Column() {
            Column({ space: 10 }) {
              SectionGroup({ title: '单选区' }) {
                ChipGroup({
                  items: [
                    {
                      prefixIcon: {
                        src: $r('app.media.icon')
                      },
                      label: { text: '选项1' },
                      suffixImageIcon: {
                        src: $r('sys.media.save_button_picture'),
                        accessibilityText: '保存',
                        accessibilityDescription: '选项后缀图标',
                        accessibilityLevel: 'auto',
                        action: () => {
                          this.status1 = true;
                          if (this.status1 && this.status2 && this.status3 && this.status4) {
                            this.vueStatus = true;
                          } else {
                            this.vueStatus = false;
                          }
                        },
                      },
                      allowClose: true
                    },
                    {
                      label: { text: '选项2' },
                      suffixSymbol: {
                        normal: new SymbolGlyphModifier($r('sys.symbol.save')),
                        activated: new SymbolGlyphModifier($r('sys.symbol.save'))
                      },
                      suffixSymbolOptions: {
                        normalAccessibility: {
                          accessibilityText: '保存',
                          accessibilityDescription: '选项后缀图标',
                          accessibilityLevel: 'auto',
                        },
                        action: () => {
                          this.status2 = true;
                          if (this.status1 && this.status2 && this.status3 && this.status4) {
                            this.vueStatus = true;
                          } else {
                            this.vueStatus = false;
                          }
                        }
                      }
                    },
                  ]
                })
              }
            }

            Column({ space: 10 }) {
              SectionGroup({ title: '多选区' }) {
                ChipGroup({
                  items: [
                    {
                      label: { text: '选项1' },
                      suffixImageIcon: {
                        src: $r('sys.media.save_button_picture'),
                        accessibilityText: '保存',
                        accessibilityDescription: '选项后缀图标',
                        accessibilityLevel: 'auto',
                        action: () => {
                          this.status3 = true;
                          if (this.status1 && this.status2 && this.status3 && this.status4) {
                            this.vueStatus = true;
                          } else {
                            this.vueStatus = false;
                          }
                        },
                      }
                    },
                    {
                      label: { text: '选项2' },
                      suffixSymbol: {
                        normal: new SymbolGlyphModifier($r('sys.symbol.save')),
                        activated: new SymbolGlyphModifier($r('sys.symbol.save'))
                      },
                      suffixSymbolOptions: {
                        normalAccessibility: {
                          accessibilityText: '保存',
                          accessibilityDescription: '选项后缀图标',
                          accessibilityLevel: 'auto',
                        },
                        action: () => {
                          this.status4 = true;
                          if (this.status1 && this.status2 && this.status3 && this.status4) {
                            this.vueStatus = true;
                          } else {
                            this.vueStatus = false;
                          }
                        }
                      }
                    },
                  ],
                  multiple: true
                })
              }
            }
          }
        }
        .layoutWeight(1)
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
        .padding({ top: 6, bottom: 6 })
        .width('100%')
        .alignItems(VerticalAlign.Center)
        .justifyContent(FlexAlign.SpaceEvenly)
        .backgroundColor(Color.Black)
      }.width('100%')
    }

  }
}