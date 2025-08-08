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

import { router, BuilderNode } from '@kit.ArkUI';

@Preview
@Component
export struct MyComponent {
  title: string = 'test'
  func: () => void = () => {
  }

  @Styles
  pressedStyle() {
    .backgroundColor(0x238E23)
  }

  @Styles
  normalStyles() {
    .backgroundColor(0x0000ff)
  }

  build() {
    Text(this.title)
      .key(this.title)
      .fontSize(10)
      .backgroundColor(0x0000ff)
      .fontColor(0xffffff)
      .padding(5)
      .onClick(this.func)
      .stateStyles({ pressed: this.pressedStyle, normal: this.normalStyles })
  }
}

@Extend(Text)
function paramTextStyle() {
  .fontSize(9)
  .width('100%')
}

@Extend(Text)
function componentTextStyle() {
  .fontSize(15)
  .backgroundColor(Color.Orange)
  .margin(3)
  .padding(3)
  .borderWidth(1.0)
}

@Extend(Column)
function columnStyle() {
  .borderWidth(1.0)
  .padding(10)
  .width('100%')
  .backgroundColor(Color.Pink)
}


@Entry
@Component
struct showActionSheetMode {
  scroller: Scroller = new Scroller()
  @State showInSubWindow: boolean = false
  @State levelMode: LevelMode | undefined | null = 0
  node: BuilderNode<Object[]> | null = null;
  frameNode: FrameNode | null = null;
  @State levelUniqueId: number | undefined = this.getUniqueId()
  @State immersiveMode: ImmersiveMode | undefined | null = 0
  @State isModal: boolean = true
  @State maskRect: Rectangle = {
    x: 0,
    y: 130,
    width: '100%',
    height: '100%'
  }

  aboutToAppear() {
    this.levelUniqueId = this.getUniqueId();
  }

  build() {
    Scroll(this.scroller) {
      Column({ space: 5 }) {
        Text('返回首页')
          .componentTextStyle()
          .onClick(() => {
            router.pushUrl({
              url: 'MainAbility/pages/actionSheet/index'
            }, router.RouterMode.Standard)
          })
          .id('back')

        Column({ space: 5 }) {

          Row({ space: 3 }) {
            MyComponent({
              title: 'levelMode: OVERLAY', func: () => {
                this.levelMode = 0
              }
            })
            MyComponent({
              title: 'levelMode: EMBEDDED', func: () => {
                this.levelMode = 1
              }
            })

          }

          Row({ space: 3 }) {
            MyComponent({
              title: 'undefined', func: () => {
                this.levelMode = undefined
              }
            })
            MyComponent({
              title: 'null', func: () => {
                this.levelMode = null
              }
            })

          }

          Row({ space: 3 }) {
            MyComponent({
              title: 'uniqId: Normal value', func: () => {
                const node: FrameNode | null = this.getUIContext().getFrameNodeById('pageCol') || null;
                this.levelUniqueId = node?.getUniqueId();
              }
            })
            MyComponent({
              title: 'uniqId: Abnormal value', func: () => {
                this.levelUniqueId = 1237
              }
            })
          }


          Row({ space: 3 }) {
            MyComponent({
              title: 'imMode: default', func: () => {
                this.immersiveMode = 0
              }
            })
            MyComponent({
              title: 'imMode: extend', func: () => {
                this.immersiveMode = 1
              }
            })

          }

          MyComponent({
            title: 'imMode: invalid', func: () => {
              this.immersiveMode = 7
            }
          })
        }
        .columnStyle()

        Column({ space: 5 }) {
          Text(`showActionSheet`)
            .id('showActionSheet')
            .componentTextStyle()
            .onClick(() => {
              this.getUIContext().showActionSheet({
                levelMode: this.levelMode,
                levelUniqueId: this.levelUniqueId,
                immersiveMode: this.immersiveMode,

                showInSubWindow: this.showInSubWindow,
                isModal: this.isModal,

                maskRect: this.maskRect,
                title: 'ActionSheet title',
                subtitle: 'ActionSheet subtitle',
                message: 'message',
                autoCancel: true,
                confirm: {
                  defaultFocus: true,
                  value: 'Confirm button',
                  action: () => {
                    console.log('Get Alert Dialog handled')
                  }
                },
                cancel: () => {
                  console.log('actionSheet canceled')
                },
                alignment: DialogAlignment.Bottom,
                offset: { dx: 0, dy: -10 },
                sheets: [
                  {
                    title: 'apples',
                    action: () => {
                      console.log('apples')
                    }
                  },
                  {
                    title: 'bananas',
                    action: () => {
                      console.log('bananas')
                    }
                  },
                  {
                    title: 'pears',
                    action: () => {
                      console.log('pears')
                    }
                  }
                ],
                backgroundColor: Color.Orange,
                backgroundBlurStyle: BlurStyle.NONE
              })
            })
        }
        .id('pageCol')
        .width('100%')
      }
      .justifyContent(FlexAlign.Start)
      .width('100%')
      .height('100%')
    }
    .width('100%')
    .height('100%')
  }
}