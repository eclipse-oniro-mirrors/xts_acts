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
// import { ComponentContent, LevelOrder, PromptAction, OverlayManager } from '@kit.ArkUI';

import { LevelOrder } from '@ohos.promptAction'
import { UIContext,PromptAction,OverlayManager } from '@ohos.arkui.UIContext'
import { ComponentContent } from '@ohos.arkui.node'
import {
  Entry,
  Component,
  $r,
  Column,
  ColumnOptions,
  Text,
  Color,
  Flex,
  FlexDirection,
  ItemAlign,
  Row,
  Button,
  ClickEvent,
  Week,ForEach,applyStyles,CommonMethod,
  FontWeight,RowOptions,Position,HorizontalAlign,wrapBuilder,CustomBuilderT,
  Axis,AlertDialogParamWithButtons,DialogAlignment,DialogButtonStyle,DialogAlignment,
  Margin,TransitionEffect,FlexAlign,TransitionEdge,AlertDialogParamWithConfirm,
  PickerTextStyle, CalendarAlign, CalendarPicker,Builder,TextOverflow, TextHeightAdaptivePolicy,
  ArrowPosition, Select,BlurStyle,MenuAlignType,TextInputController,
} from '@ohos.arkui.component';
import {
  State,
  Link,
  PropRef,AppStorage,StorageLink
} from '@ohos.arkui.stateManagement';
class Params {
  public text: string = ''
  public offset: Position

  constructor(text: string, offset: Position) {
    this.text = text
    this.offset = offset
  }
}

@Builder
function builderText(params: Params) {
  Column() {
    Text(params.text)
      .fontWeight(FontWeight.Bold)
  }
  .alignItems(HorizontalAlign.Center)
  .justifyContent(FlexAlign.End)
  .width(150)
  .height(80)
  .opacity(1)
  .backgroundColor(Color.Red)
  .offset(params.offset)
}

class SetParam {
  public title?: string
  public func?: () => void
}


function componentTextStyle(instance: CommonMethod) {

  instance.backgroundColor(Color.Orange)
  instance.margin(3)
  instance.padding(3)
  instance.borderWidth(1.0)}

@Component
export struct MyComponent {
  title: string = 'test'
  func: () => void = () => {
  }


  pressedStyle(instance: CommonMethod) {instance.backgroundColor(0x238E23)}


  normalStyles(instance: CommonMethod) {instance.backgroundColor(0x0000ff)}

  build() {
    Text(this.title)
      .key(this.title)
      .fontSize(10)
      .backgroundColor(0x0000ff)
      .fontColor(0xffffff)
      .padding(5)
      .onClick(this.func)
      .applyStyles(this.pressedStyle)
      .applyStyles(this.normalStyles)
  }
}

@Entry
@Component
struct overlayManagerTest {
  private ctx: UIContext = this.getUIContext()
  private promptAction: PromptAction = this.ctx.getPromptAction()
  private overlayNode: OverlayManager = this.ctx.getOverlayManager()
  @StorageLink('contentArray') contentArray: ComponentContent<Params>[] = []
  @StorageLink('componentContentIndex') componentContentIndex: number = 0
  @StorageLink('arrayIndex') arrayIndex: number = 0
  @StorageLink('componentOffset') componentOffset: Position = { x: 0, y: 80 }
  private setLevelOrder: SetParam[] = [
    {
      title: '-100001', func: () => {
      let componentContent : ComponentContent<Params>= new ComponentContent<Params>(this.ctx, wrapBuilder<CustomBuilderT<Params>>(builderText), new Params('-100001', { x: 100, y: 10 } as Position)
      )
      this.contentArray.push(componentContent)
      this.overlayNode.addComponentContentWithOrder(componentContent, LevelOrder.clamp(-100001))
      let topOrder: LevelOrder = this.promptAction.getTopOrder()!;
      if (topOrder !== undefined) {
        console.error('[addComponent] topOrder: ' + topOrder.getOrder());
      }
      let bottomOrder: LevelOrder = this.promptAction.getBottomOrder()!;
      if (bottomOrder !== undefined) {
        console.error('[addComponent] bottomOrder: ' + bottomOrder.getOrder());
      }
    }
    } as SetParam,
    {
      title: '100001', func: () => {
      let componentContent : ComponentContent<Params>= new ComponentContent<Params>(
        this.ctx, wrapBuilder<CustomBuilderT<Params>>(builderText),
        new Params('100001', { x: 100, y: 15 } as Position)
      )
      this.contentArray.push(componentContent)
      this.overlayNode.addComponentContentWithOrder(componentContent, LevelOrder.clamp(100001))
      let topOrder: LevelOrder = this.promptAction.getTopOrder()!;
      if (topOrder !== undefined) {
        console.error('topOrder: ' + topOrder.getOrder());
      }
      let bottomOrder: LevelOrder = this.promptAction.getBottomOrder()!;
      if (bottomOrder !== undefined) {
        console.error('bottomOrder: ' + bottomOrder.getOrder());
      }
    }
    } as SetParam,
    {
      title: 'undefined', func: () => {
      let componentContent : ComponentContent<Params>= new ComponentContent<Params>(
        this.ctx, wrapBuilder<CustomBuilderT<Params>>(builderText),
        new Params('undefined', { x: 100, y: 20 } as Position)
      )
      this.contentArray.push(componentContent)
      this.overlayNode.addComponentContentWithOrder(componentContent, LevelOrder.clamp(0))
      let topOrder: LevelOrder = this.promptAction.getTopOrder()!;
      if (topOrder !== undefined) {
        console.error('topOrder: ' + topOrder.getOrder());
      }
      let bottomOrder: LevelOrder = this.promptAction.getBottomOrder()!;
      if (bottomOrder !== undefined) {
        console.error('bottomOrder: ' + bottomOrder.getOrder());
      }
    }
    } as SetParam,
    {
      title: '0.111', func: () => {
      let componentContent : ComponentContent<Params>= new ComponentContent<Params>(
        this.ctx, wrapBuilder<CustomBuilderT<Params>>(builderText),
        new Params('0.111', { x: 100, y: 25 } as Position)
      )
      this.contentArray.push(componentContent)
      this.overlayNode.addComponentContentWithOrder(componentContent, LevelOrder.clamp(0.111))
      let topOrder: LevelOrder = this.promptAction.getTopOrder()!;
      if (topOrder !== undefined) {
        console.error('topOrder: ' + topOrder.getOrder());
      }
      let bottomOrder: LevelOrder = this.promptAction.getBottomOrder()!;
      if (bottomOrder !== undefined) {
        console.error('bottomOrder: ' + bottomOrder.getOrder());
      }
    }
    } as SetParam
  ]
  @State top: number = 0
  @State bottom: number = 0

  build() {
    Column({ space: 5 } as ColumnOptions) {
      ForEach(this.setLevelOrder, (item: SetParam) => {
        MyComponent({ title: item.title, func: item.func })
      }, (item: SetParam) => item.title as String )
      Text(`Top` + this.top)
        .id('myTop')
        .fontSize(15)
        .applyStyles(componentTextStyle)
        .onClick(() : void => {
          let topOrder: LevelOrder = this.promptAction.getTopOrder()!;
          if (topOrder !== undefined) {
            AppStorage.setOrCreate<number>('myTop', topOrder.getOrder());
            this.top = AppStorage.get<number>('myTop') as number
            console.error('[test] topOrder: ' + topOrder.getOrder());
          }
        })
      Text(`Bottom` + this.bottom)
        .id('myBottom')
        .fontSize(15)
        .applyStyles(componentTextStyle)
        .onClick(() : void => {
          let bottomOrder: LevelOrder = this.promptAction.getBottomOrder()!;
          if (bottomOrder !== undefined) {
            AppStorage.setOrCreate<number>('myBottom', bottomOrder.getOrder());
            this.bottom = AppStorage.get<number>('myBottom') as number
            console.error('[test] bottomOrder: ' + bottomOrder.getOrder());
          }
        })

      Text(`Remove`)
        .id('remove')
        .fontSize(15)
        .applyStyles(componentTextStyle)
        .onClick(() : void => {
          if (this.arrayIndex >= 0 && this.arrayIndex < this.contentArray.length) {
            let componentContent = this.contentArray.splice(this.contentArray.length - 1, 1)
            this.overlayNode.removeComponentContent(componentContent.pop() as ComponentContent<Params>)
          } else {
            console.info('arrayIndex有误')
          }
        })
    }
    .width('50%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
  }
}