'use static';
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
import {LevelMode} from '@ohos.promptAction';
import {
  Entry,
  Column,
  Component,
  Button,
  ClickEvent,
  Text,
  Row,AlertDialogParamWithButtons,FlexOptions,ColumnOptions,RowOptions,Flex,
  Scroll,FontWeight,TextAlign,ForEach,ListItem,LocalizedBorderRadiuses,$$,SheetOptions,FlexAlign,CustomDialogController,TextInput,CustomDialogControllerOptions,
  ButtonType,Scroller,Color,Rectangle,ActionSheetOptions,ControlSize,DialogAlignment,TextInputController,Margin,CustomStyles,CommonMethod,TextAttribute,ColumnAttribute,SheetInfo,ActionSheetButtonOptions,ActionSheetOffset,BlurStyle
} from '@ohos.arkui.component'
import {
  State,
  Link,
  PropRef,
  Observed,
  ObjectLink,
} from '@ohos.arkui.stateManagement'
import { UIContext, Router,KeyboardAvoidMode,PromptAction } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
import { BuilderNode,FrameNode } from '@ohos.arkui.node';
import { ImmersiveMode } from '@ohos.promptAction';
import { LengthMetrics } from '@ohos.arkui.node';
import { Callback } from '@ohos.base';
import promptAction from '@ohos.promptAction';

//@Preview
@Component
export struct MyComponent {
  title: string = 'test'
  func: () => void = () => {
  }

  NormalStyles: CustomStyles = (instance: CommonMethod): void => {
    instance.backgroundColor(Color.Gray);
  };
  PressedStyles: CustomStyles = (instance: CommonMethod): void => {
    instance.backgroundColor(Color.Blue);
  };

  build() {
    Text(this.title)
      .key(this.title)
      .fontSize(10)
      .backgroundColor(0x0000ff)
      .fontColor(0xffffff)
      .padding(5)
      .onClick(this.func)
      .stateStyles({
        normal: this.NormalStyles,
        pressed: this.PressedStyles
      })
  }
}

function superFancyText1(this: TextAttribute){
  this.fontSize(9);
  this.width('100%');
  return this;
}

function superFancyText2(this: TextAttribute){
  this.fontSize(15);
  this.backgroundColor(Color.Orange)
  this.width('100%');
  this.margin(3)
  this.padding(3)
  this.borderWidth(1.0)
  return this;
}

function superFancyColumn(this: ColumnAttribute){
  this.backgroundColor(Color.Pink)
  this.width('100%');
  this.padding(10)
  this.borderWidth(1.0)
  return this;
}


@Entry
@Component
struct actionSheetMode {
  // promptAction = this.getUIContext().getPromptAction()
  scroller: Scroller = new Scroller()
  @State showInSubWindow: boolean = false
  @State levelMode: LevelMode | undefined = undefined
  node: BuilderNode<Object[]> | null = null;
  frameNode: FrameNode | null = null;
  @State levelUniqueId: int | undefined = undefined
  @State immersiveMode: ImmersiveMode | undefined = undefined
  @State isModal: boolean = true
  @State maskRect: Rectangle = {
    x: 0,
    y: 130,
    width: '100%',
    height: '100%'
  } as Rectangle
  WillAppear: ()=>void = () => {
    console.info('---1237---    dialog onWillAppear')
  }
  DidAppear: ()=>void = () => {
    console.info('---1237---    dialog onDidAppear')
  }
  willDisappear: ()=>void = () => {
    console.info('---1237---    dialog onWillDisappear')
  }
  DidDisappear: ()=>void = () => {
    console.info('---1237---    dialog onDidDisappear')
  }

  aboutToAppear() {
    this.levelUniqueId = this.getUniqueId().toInt();
  }

  build() {
    Scroll(this.scroller) {
      Column({ space: 5 } as ColumnOptions) {
        Text('返回首页')
        .superFancyText2()
          .onClick((event: ClickEvent) => {
            this.getUIContext().getRouter().pushUrl({
              url: 'MainAbility/pages/actionSheet/index'
            }, router.RouterMode.Standard)
          })
          .id('back')

        Column({ space: 5 } as ColumnOptions) {
          Row({ space: 3 }  as RowOptions ) {
            MyComponent({
              title: 'levelMode: OVERLAY', func: (): void => {
                this.levelMode = LevelMode.OVERLAY
              }
            })
            MyComponent({
              title: 'levelMode: EMBEDDED', func: (): void => {
                this.levelMode = LevelMode.EMBEDDED
              }
            })

          }

          Row({ space: 3 }  as RowOptions ) {
            MyComponent({
              title: 'undefined', func: (): void => {
                this.levelMode = undefined
              }
            })
            MyComponent({
              title: 'null', func: (): void => {
                this.levelMode = undefined
              }
            })

          }
          Row({ space: 3 }  as RowOptions ) {
            MyComponent({
              title: 'uniqId: Normal value', func: () :void => {
                const node: FrameNode | null = this.getUIContext().getFrameNodeById('pageCol') || null;
                this.levelUniqueId = node!.getUniqueId().toInt();
              }
            })
            MyComponent({
              title: 'uniqId: Abnormal value', func: () :void => {
                this.levelUniqueId = 1237 as Int
              }
            })
          }

          Row({ space: 3 }  as RowOptions ) {
            MyComponent({
              title: 'imMode: default', func: (): void => {
                this.immersiveMode = ImmersiveMode.DEFAULT
              }
            })
            MyComponent({
              title: 'imMode: extend', func: (): void => {
                this.immersiveMode = ImmersiveMode.EXTEND
              }
            })
          }

          MyComponent({
            title: 'imMode: invalid', func: (): void => {
              this.immersiveMode = ImmersiveMode.DEFAULT
            }
          })
        }
        .superFancyColumn()

        Column({ space: 5 } as ColumnOptions) {
          Text(`列表选择弹窗`)
            .id('showSheet')
            .superFancyText2()
            .onClick((event: ClickEvent) => {
              this.getUIContext().showActionSheet({
                levelMode: this.levelMode,
                levelUniqueId: this.levelUniqueId,
                immersiveMode: this.immersiveMode,
                showInSubWindow: this.showInSubWindow,
                isModal: this.isModal,
                onWillAppear: this.WillAppear,
                onDidAppear: this.DidAppear,
                onWillDisappear: this.willDisappear,
                onDidDisappear: this.DidDisappear,
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
                } as ActionSheetButtonOptions,
                cancel: () => {
                  console.log('actionSheet canceled')
                },
                alignment: DialogAlignment.Bottom,
                offset: { dx: 0, dy: -10 } as ActionSheetOffset,
                sheets: [
                  {
                    title: 'apples',
                    action: () => {
                      console.log('apples')
                    }
                  } as SheetInfo,
                  {
                    title: 'bananas',
                    action: () => {
                      console.log('bananas')
                    }
                  } as SheetInfo,
                  {
                    title: 'pears',
                    action: () => {
                      console.log('pears')
                    }
                  } as SheetInfo
                ] as SheetInfo[],
                backgroundColor: Color.Orange,
                backgroundBlurStyle: BlurStyle.NONE
              } as ActionSheetOptions)
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