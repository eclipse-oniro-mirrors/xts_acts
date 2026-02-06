/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
  @State stepTips: string =
    '设备支持屏幕朗读时\n' + '操作步骤:\n' + '1、分别点击单选区域和多选区域组件的的后缀图标删除符号，观察朗读内容\n' +
      '\n' +
      '预期结果：1、朗读内容为：保存，按钮，选项后缀图标\n' +
      '2、朗读内容为：删除，按钮，删除文本\n';
  @State isVue: boolean = false;
  @State intervalNum: number = 0;
  @State yesEnable: boolean = false
  // 默认不支持
  @State onAccessibilityHoverEnable: boolean = false;
  @State passed: boolean = false

  @LocalBuilder
  Suffix() {
    IconGroupSuffix({
      items: [
        {
          icon: { src: $r('sys.media.ohos_ic_public_more'), },
          accessibilityText: '更多',
          accessibilityDescription: '新手提醒',
          action: () => {
            this.getUIContext().getPromptAction().showToast({
              message: '更多按钮被点击！'
            });
          },
        },
        {
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
      this.isVue = true;
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

      Column({ space: 10 }) {
        Row() {
          Text(`是否设备支持屏幕朗读`).fontColor(Color.Green).fontSize('18fp').margin({ top: 15 })
        }

        Row() {
          Column() {
            Button(`不支持`)
              .borderRadius(8)
              .backgroundColor(0x317aff)
              .width('30%')
              .enabled(!this.yesEnable)
              .opacity(!this.yesEnable ? 1 : 0.4)
              .onClick(async () => {
                this.isVue = true
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
              SectionItem({ title: '单选 无后缀区域' }) {
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
                          this.getUIContext().getPromptAction().showToast({
                            message: '后缀图标被点击！'
                          });
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
                          this.getUIContext().getPromptAction().showToast({
                            message: '后缀图标被点击！'
                          });
                        }
                      }
                    },
                    {
                      label: { text: '选项3' },
                      closeOptions: {
                        accessibilityText: '删除',
                        accessibilityDescription: '删除文本',
                        accessibilityLevel: 'yes'
                      },
                      allowClose: true
                    },
                    {
                      label: { text: '选项4' },
                      closeOptions: {
                        accessibilityText: '删除',
                        accessibilityDescription: '删除文本',
                        accessibilityLevel: 'yes'
                      },
                      allowClose: true
                    },
                    {
                      label: { text: '选项5' },
                      closeOptions: {
                        accessibilityText: '删除',
                        accessibilityDescription: '删除文本',
                        accessibilityLevel: 'yes'
                      },
                      allowClose: true
                    },
                  ]
                })
              }

              SectionItem({ title: '单选 有后缀区域' }) {
                ChipGroup({
                  items: [
                    {
                      label: { text: '选项1' },
                      closeOptions: {
                        accessibilityText: '删除',
                        accessibilityDescription: '删除文本',
                        accessibilityLevel: 'yes'
                      },
                      allowClose: true
                    },
                    {
                      label: { text: '选项2' },
                      closeOptions: {
                        accessibilityText: '删除',
                        accessibilityDescription: '删除文本',
                        accessibilityLevel: 'yes'
                      },
                      allowClose: true
                    },
                    {
                      label: { text: '选项3' },
                      closeOptions: {
                        accessibilityText: '删除',
                        accessibilityDescription: '删除文本',
                        accessibilityLevel: 'yes'
                      },
                      allowClose: true
                    },
                    {
                      label: { text: '选项4' },
                      closeOptions: {
                        accessibilityText: '删除',
                        accessibilityDescription: '删除文本',
                        accessibilityLevel: 'yes'
                      },
                      allowClose: true
                    },
                    {
                      label: { text: '选项5' },
                      closeOptions: {
                        accessibilityText: '删除',
                        accessibilityDescription: '删除文本',
                        accessibilityLevel: 'yes'
                      },
                      allowClose: true
                    },
                  ],
                  suffix: this.Suffix.bind(this),
                })
              }
            }
          }

          Column({ space: 10 }) {
            SectionGroup({ title: '多选区' }) {
              SectionItem({ title: '多选 无后缀区域' }) {
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
                          this.getUIContext().getPromptAction().showToast({
                            message: '后缀图标被点击！'
                          });
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
                          this.getUIContext().getPromptAction().showToast({
                            message: '后缀图标被点击！'
                          });
                        }
                      }
                    },
                    {
                      label: { text: '选项3' },
                      closeOptions: {
                        accessibilityText: '删除',
                        accessibilityDescription: '删除文本',
                        accessibilityLevel: 'yes'
                      },
                      allowClose: true
                    },
                    {
                      label: { text: '选项4' },
                      closeOptions: {
                        accessibilityText: '删除',
                        accessibilityDescription: '删除文本',
                        accessibilityLevel: 'yes'
                      },
                      allowClose: true
                    },
                    {
                      label: { text: '选项5' },
                      closeOptions: {
                        accessibilityText: '删除',
                        accessibilityDescription: '删除文本',
                        accessibilityLevel: 'yes'
                      },
                      allowClose: true
                    },
                  ],
                  multiple: true
                })
              }

              SectionItem({ title: '多选 有后缀区域' }) {
                ChipGroup({
                  items: [
                    {
                      label: { text: '选项1' },
                      closeOptions: {
                        accessibilityText: '删除',
                        accessibilityDescription: '删除文本',
                        accessibilityLevel: 'yes'
                      },
                      allowClose: true
                    },
                    {
                      label: { text: '选项2' },
                      closeOptions: {
                        accessibilityText: '删除',
                        accessibilityDescription: '删除文本',
                        accessibilityLevel: 'yes'
                      },
                      allowClose: true
                    },
                    {
                      label: { text: '选项3' },
                      closeOptions: {
                        accessibilityText: '删除',
                        accessibilityDescription: '删除文本',
                        accessibilityLevel: 'yes'
                      },
                      allowClose: true
                    },
                    {
                      label: { text: '选项4' },
                      closeOptions: {
                        accessibilityText: '删除',
                        accessibilityDescription: '删除文本',
                        accessibilityLevel: 'yes'
                      },
                      allowClose: true
                    },
                    {
                      label: { text: '选项5' },
                      closeOptions: {
                        accessibilityText: '删除',
                        accessibilityDescription: '删除文本',
                        accessibilityLevel: 'yes'
                      },
                      allowClose: true
                    },
                  ],
                  suffix: this.Suffix.bind(this),
                  multiple: true,
                })
              }
            }
          }
        }

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