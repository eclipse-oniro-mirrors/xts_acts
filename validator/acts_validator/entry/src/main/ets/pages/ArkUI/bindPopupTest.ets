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

import { ComponentContent, FrameNode } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import router from '@ohos.router';
import promptAction from '@ohos.promptAction';
import FirstDialog from '../model/FirstDialog';

const TAG = '[bindPopupTest]';

class Params {
  private text: string = ''

  constructor(text: string) {
    this.text = text;
  }
}
@Builder
function buildText(param?: Params) {
  Column() {
    Text('popup').fontSize(24)
  }.width(100).height(50).padding(5)
}

@Entry
@Component
struct bindPopupTest {
  @State handlePopup1: boolean = false;
  @State handlePopup2: boolean = false;
  @State handlePopup3: boolean = false;
  @State handlePopup4: boolean = false;
  @State handlePopup5: boolean = false;
  @State handlePopup6: boolean = false;
  @State openPopup: string = 'init'
  @State name: string = 'bindPopup_borderLinearGradient_Test';
  @State stepTips: string = '操作步骤:\n' + '1.点击页面中不同的按钮\n' +
    '2.观察弹出气泡的描边线性渐变效果\n' +
    '预期结果：\n' + '1.PopupOptions类型气泡的描边线性渐变显示正常并符合参数设置\n' +
    '2.CustomPopupOptions类型气泡的描边线性渐变显示正常并符合参数设置\n' +
    '3.PopupCommonOptions类型气泡的描边线性渐变显示正常并符合参数设置\n';
  @State isOk: boolean = false;
  @State intervalNum: number = 0;
  @State uri: string = '';
  @State blockArr: string[] = [];
  uiContext = this.getUIContext();
  udKey: string = '';

  @Builder
  PassBtn(text: Resource, isFullScreen: boolean) {
    Button({ stateEffect: this.isOk }) {
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

  aboutToAppear() {
    FirstDialog.ChooseDialog(this.stepTips, this.name);
  }

  onPageHide() {
    clearInterval(this.intervalNum);
  }

  aboutToDisappear() {
    clearInterval(this.intervalNum);
  }

  @Builder popupBuilder() {
    Row({ space: 2 }) {
      Image($r('app.media.icon')).width(24).height(24).margin({ left: -5 })
      Text('Custom Popup').fontSize(10)
    }.width(100).height(50).padding(5)
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
        Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceAround }) {
          Column({space:30}){
            Button('PopupOptions1')
              .id('button1')
              .onClick(() => {
                this.handlePopup1 = !this.handlePopup1
              })
              .bindPopup(this.handlePopup1, {
                message: 'This is a popup with PopupOptions',
                placementOnTop: true,
                outlineWidth: '1vp',
                outlineLinearGradient: {
                  direction: undefined,
                  colors: [[Color.Yellow, 0.0], ['rgba(123, 255, 100, 1.00)', 1.0]]
                },
                borderWidth: '1px',
                borderLinearGradient: {
                  direction: GradientDirection.Right,
                  colors: [[$r('app.color.color_333'), 0.2], [0xffffff, 0.8]]
                },
                onStateChange: (e) => {
                  console.info(JSON.stringify(e.isVisible))
                  if (!e.isVisible) {
                    this.handlePopup1 = false
                  }
                }
              })

            Button('PopupOptions2')
              .id('button2')
              .onClick(() => {
                this.handlePopup2 = !this.handlePopup2
              })
              .bindPopup(this.handlePopup2, {
                message: 'This is a popup with PopupOptions',
                placementOnTop: true,
                outlineWidth: '1fp',
                outlineLinearGradient: {
                  direction: GradientDirection.None,
                  colors: [[$r('app.color.color_666'), 0.0], ['rgba(123, 255, 100, 1.00)', 1.0]]
                },
                borderWidth: '1lpx',
                borderLinearGradient: {
                  direction: GradientDirection.Left,
                  colors: [['#FF0000FF', 0.2], [Color.Red, 1.0]]
                },
                onStateChange: (e) => {
                  console.info(JSON.stringify(e.isVisible))
                  if (!e.isVisible) {
                    this.handlePopup2 = false
                  }
                }
              })

            Button('CustomPopupOptions1')
              .id('button3')
              .onClick(() => {
                this.handlePopup3 = !this.handlePopup3
              })
              .bindPopup(this.handlePopup3, {
                builder: this.popupBuilder,
                placement: Placement.Top,
                mask: {color:'#33000000'},
                popupColor: Color.Yellow,
                enableArrow: true,
                showInSubWindow: false,
                outlineWidth: $r('app.string.popup_border_size'),
                outlineLinearGradient: {
                  direction: undefined,
                  colors: [[$r('app.color.color_666'), 0.0], ['rgba(123, 255, 100, 1.00)', 1.0]]
                },
                borderWidth: '1lpx',
                borderLinearGradient: {
                  direction: GradientDirection.Left,
                  colors: [['#FF0000FF', 0.2], [undefined, 1.0]]
                },
                onStateChange: (e) => {
                  if (!e.isVisible) {
                    this.handlePopup3 = false
                  }
                }
              })

            Button('CustomPopupOptions2')
              .id('button4')
              .onClick(() => {
                this.handlePopup4 = !this.handlePopup4
              })
              .bindPopup(this.handlePopup4, {
                builder: this.popupBuilder,
                placement: Placement.Top,
                mask: {color:'#33000000'},
                popupColor: Color.Yellow,
                enableArrow: true,
                showInSubWindow: false,
                outlineLinearGradient: {
                  direction: undefined,
                  colors: [[undefined, 0.0], ['rgba(227, 100, 255, 1.00)', 1.0]]
                },
                borderWidth: '1vp',
                borderLinearGradient: {
                  direction: GradientDirection.RightTop,
                  colors: [[Color.Green, 0.2], [0xffffff, 1.0]]
                },
                onStateChange: (e) => {
                  if (!e.isVisible) {
                    this.handlePopup4 = false
                  }
                }
              })
            Button('PopupCommonOptions1')
              .id('button5')
              .fontSize(20)
              .onClick(() => {
                let context = this.getUIContext()
                const contentNode = new ComponentContent(context, wrapBuilder(buildText));
                const promptAction = context.getPromptAction();
                let uniqueId = this.getUniqueId();
                let frameNode: FrameNode | null = context.getFrameNodeByUniqueId(uniqueId);
                let targetId = frameNode?.getFirstChild()?.getUniqueId();
                promptAction.openPopup(contentNode, { id: targetId }, {
                  outlineWidth: 1,
                  outlineLinearGradient: {
                    direction: GradientDirection.None,
                    colors: [[Color.Yellow, 0.1], ['rgba(227, 100, 255, 1.00)', 1.0]]
                  },
                  borderWidth: '1lpx',
                  borderLinearGradient: {
                    direction: GradientDirection.Right,
                    colors: [[null, 0.1], ['#FF0000FF', 0.9]]
                  }
                })
                  .then(() => {
                    console.info('openPopup success');
                    this.openPopup = 'openPopup'
                  })
                  .catch((err: BusinessError) => {
                    console.info('openPopup error: ' + err.code + ' ' + err.message);
                  })
                setTimeout(() => {
                  promptAction.closePopup(contentNode)
                }, 2000); //2秒后自动关闭
              })

            Button('PopupCommonOptions2')
              .id('button2')
              .fontSize(20)
              .onClick(() => {
                let context = this.getUIContext()
                const contentNode = new ComponentContent(context, wrapBuilder(buildText));
                const promptAction = context.getPromptAction();
                let uniqueId = this.getUniqueId();
                let frameNode: FrameNode | null = context.getFrameNodeByUniqueId(uniqueId);
                let targetId = frameNode?.getFirstChild()?.getUniqueId();
                promptAction.openPopup(contentNode, { id: targetId }, {
                  outlineWidth: undefined,
                  outlineLinearGradient: {
                    direction: GradientDirection.LeftBottom,
                    colors: [[undefined, 0.1], ['rgba(227, 100, 255, 1.00)', 0.8]]
                  },
                  borderWidth: 1,
                  borderLinearGradient: {
                    direction: undefined,
                    colors: [[Color.Orange, 0.1], ['#FF0000FF', 0.9]]
                  }
                })
                  .then(() => {
                    console.info('openPopup success');
                    this.openPopup = 'openPopup'
                  })
                  .catch((err: BusinessError) => {
                    console.info('openPopup error: ' + err.code + ' ' + err.message);
                  })
                setTimeout(() => {
                  promptAction.closePopup(contentNode)
                }, 2000); //2秒后自动关闭
              })
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