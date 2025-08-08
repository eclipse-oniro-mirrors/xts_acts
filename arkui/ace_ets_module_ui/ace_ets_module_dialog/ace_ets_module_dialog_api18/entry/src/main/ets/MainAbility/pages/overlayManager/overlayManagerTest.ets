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
import { ComponentContent, LevelOrder, PromptAction, OverlayManager } from '@kit.ArkUI';

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

@Extend(Text)
function componentTextStyle() {.fontSize(15).backgroundColor(Color.Orange).margin(3).padding(3).borderWidth(1.0)}

@Component
export struct MyComponent {
  title: string = 'test'
  func: () => void = () => {
  }

  @Styles
  pressedStyle() {.backgroundColor(0x238E23)}

  @Styles
  normalStyles() {.backgroundColor(0x0000ff)}

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
      let componentContent = new ComponentContent(
        this.ctx, wrapBuilder<[Params]>(builderText),
        new Params('-100001', { x: 100, y: 10 })
      )
      this.contentArray.push(componentContent)
      this.overlayNode.addComponentContentWithOrder(componentContent, LevelOrder.clamp(-100001))
      let topOrder: LevelOrder = this.promptAction.getTopOrder();
      if (topOrder !== undefined) {
        console.error('[addComponent] topOrder: ' + topOrder.getOrder());
      }
      let bottomOrder: LevelOrder = this.promptAction.getBottomOrder();
      if (bottomOrder !== undefined) {
        console.error('[addComponent] bottomOrder: ' + bottomOrder.getOrder());
      }
    }
    },
    {
      title: '100001', func: () => {
      let componentContent = new ComponentContent(
        this.ctx, wrapBuilder<[Params]>(builderText),
        new Params('100001', { x: 100, y: 15 })
      )
      this.contentArray.push(componentContent)
      this.overlayNode.addComponentContentWithOrder(componentContent, LevelOrder.clamp(100001))
      let topOrder: LevelOrder = this.promptAction.getTopOrder();
      if (topOrder !== undefined) {
        console.error('topOrder: ' + topOrder.getOrder());
      }
      let bottomOrder: LevelOrder = this.promptAction.getBottomOrder();
      if (bottomOrder !== undefined) {
        console.error('bottomOrder: ' + bottomOrder.getOrder());
      }
    }
    },
    {
      title: 'undefined', func: () => {
      let componentContent = new ComponentContent(
        this.ctx, wrapBuilder<[Params]>(builderText),
        new Params('undefined', { x: 100, y: 20 })
      )
      this.contentArray.push(componentContent)
      this.overlayNode.addComponentContentWithOrder(componentContent, LevelOrder.clamp(undefined))
      let topOrder: LevelOrder = this.promptAction.getTopOrder();
      if (topOrder !== undefined) {
        console.error('topOrder: ' + topOrder.getOrder());
      }
      let bottomOrder: LevelOrder = this.promptAction.getBottomOrder();
      if (bottomOrder !== undefined) {
        console.error('bottomOrder: ' + bottomOrder.getOrder());
      }
    }
    },
    {
      title: '0.111', func: () => {
      let componentContent = new ComponentContent(
        this.ctx, wrapBuilder<[Params]>(builderText),
        new Params('0.111', { x: 100, y: 25 })
      )
      this.contentArray.push(componentContent)
      this.overlayNode.addComponentContentWithOrder(componentContent, LevelOrder.clamp(0.111))
      let topOrder: LevelOrder = this.promptAction.getTopOrder();
      if (topOrder !== undefined) {
        console.error('topOrder: ' + topOrder.getOrder());
      }
      let bottomOrder: LevelOrder = this.promptAction.getBottomOrder();
      if (bottomOrder !== undefined) {
        console.error('bottomOrder: ' + bottomOrder.getOrder());
      }
    }
    }
  ]
  @State top: number = 0
  @State bottom: number = 0

  build() {
    Column({ space: 5 }) {
      ForEach(this.setLevelOrder, (item: SetParam) => {
        MyComponent({ title: item.title, func: item.func })
      }, (item: SetParam) => item.title)
      Text(`Top` + this.top)
        .id('myTop')
        .componentTextStyle()
        .onClick(() => {
          let topOrder: LevelOrder = this.promptAction.getTopOrder();
          if (topOrder !== undefined) {
            AppStorage.setOrCreate('myTop', topOrder.getOrder());
            this.top = AppStorage.get('myTop') as number
            console.error('[test] topOrder: ' + topOrder.getOrder());
          }
        })
      Text(`Bottom` + this.bottom)
        .id('myBottom')
        .componentTextStyle()
        .onClick(() => {
          let bottomOrder: LevelOrder = this.promptAction.getBottomOrder();
          if (bottomOrder !== undefined) {
            AppStorage.setOrCreate('myBottom', bottomOrder.getOrder());
            this.bottom = AppStorage.get('myBottom') as number
            console.error('[test] bottomOrder: ' + bottomOrder.getOrder());
          }
        })

      Text(`Remove`)
        .id('remove')
        .componentTextStyle()
        .onClick(() => {
          if (this.arrayIndex >= 0 && this.arrayIndex < this.contentArray.length) {
            let componentContent = this.contentArray.splice(this.contentArray.length - 1, 1)
            this.overlayNode.removeComponentContent(componentContent.pop())
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