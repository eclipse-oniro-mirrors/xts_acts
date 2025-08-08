/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { ComponentContent, FrameNode } from '@kit.ArkUI';
import emitter from '@ohos.events.emitter';
import window from '@ohos.window';

let innerEvent: emitter.InnerEvent = {
  eventId: 1,
  priority: emitter.EventPriority.HIGH
};

@Builder
function buildText() {
  Column() {
    Menu() {
      MenuItem({ startIcon: $r('app.media.icon'), content: '菜单选项1' }).id('menuItem')
      MenuItem({ startIcon: $r('app.media.icon'), content: '菜单选项2' })
    }
  }
  .onAreaChange((oldValue: Area, newValue: Area) => {
    let menuPosition: Position = { x: newValue.globalPosition.x, y: newValue.globalPosition.y };
    let eventData: emitter.EventData = {
      data: {
        'menuPosition': menuPosition
      }
    };
    emitter.emit(innerEvent, eventData);

  })
  .width('30%')
}

@Entry
@Component
struct Index {
  @State menuPosition: Position = { x: 0, y: 0 };
  @State textPosition1: Position = { x: 0, y: 0 };
  @State textPosition2: Position = { x: 0, y: 0 };
  @State textPosition3: Position = { x: 0, y: 0 };
  @State left: number = 0;
  @State top: number = 0;

  onPageShow(): void {
    let context = this.getUIContext().getHostContext();
    window.getLastWindow(context).then((data) => {
      let windowClass: window.Window = data;
      let rect = windowClass.getWindowProperties().windowRect;
      this.left = this.getUIContext().px2vp(rect.left);
      this.top = this.getUIContext().px2vp(rect.top);
    });
  }

  callback: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
    let tempX: number = eventData.data && eventData.data['menuPosition']['x']
    let tempY: number = eventData.data && eventData.data['menuPosition']['y']
    this.menuPosition.x = tempX - this.left;
    this.menuPosition.y = tempY - this.top;

  }

  build() {
    Column() {
      Text(this.menuPosition.x + '').id('menuPositionX')
      Text(this.menuPosition.y + '').id('menuPositionY')
      Text(this.textPosition1.x + '').id('textPositionX1')
      Text(this.textPosition1.y + '').id('textPositionY1')
      Text(this.textPosition2.x + '').id('textPositionX2')
      Text(this.textPosition2.y + '').id('textPositionY2')
      Text(this.textPosition3.x + '').id('textPositionX3')
      Text(this.textPosition3.y + '').id('textPositionY3')
      Button('openMenu1')
        .id('btn1')
        .fontSize(20)
        .width(200)
        .height(100)
        .margin({ top: 50, left: 100 })
        .onAreaChange((oldValue: Area, newValue: Area) => {
          this.textPosition1.x = newValue.globalPosition.x;
          this.textPosition1.y = newValue.globalPosition.y;
        })
        .onClick(() => {
          let context = this.getUIContext()
          const contentNode = new ComponentContent(context, wrapBuilder(buildText));
          const promptAction = context.getPromptAction();
          let uniqueId = this.getUniqueId();
          let frameNode: FrameNode | null = context.getFrameNodeByUniqueId(uniqueId);
          emitter.on(innerEvent, this.callback);
          promptAction.openMenu(contentNode, { id: 'btn1', componentId: frameNode?.getUniqueId() }, {
            anchorPosition: { x: 10, y: 20 },
          })
        })

      Button('openMenu2')
        .id('btn2')
        .fontSize(20)
        .width(200)
        .height(100)
        .margin({ top: 50, left: 100 })
        .onAreaChange((oldValue: Area, newValue: Area) => {
          this.textPosition2.x = newValue.globalPosition.x;
          this.textPosition2.y = newValue.globalPosition.y;
        })
        .onClick(() => {
          let context = this.getUIContext()
          const contentNode = new ComponentContent(context, wrapBuilder(buildText));
          const promptAction = context.getPromptAction();
          let uniqueId = this.getUniqueId();
          let frameNode: FrameNode | null = context.getFrameNodeByUniqueId(uniqueId);
          emitter.on(innerEvent, this.callback);
          promptAction.openMenu(contentNode, { id: 'btn2', componentId: frameNode?.getUniqueId() }, {
            anchorPosition: { x: -10, y: -20 },
          })
        })

      Button('openMenu3')
        .id('btn3')
        .fontSize(20)
        .width(200)
        .height(100)
        .margin({ top: 50, left: 100 })
        .onAreaChange((oldValue: Area, newValue: Area) => {
          this.textPosition3.x = newValue.globalPosition.x;
          this.textPosition3.y = newValue.globalPosition.y;
        })
        .onClick(() => {
          let context = this.getUIContext()
          const contentNode = new ComponentContent(context, wrapBuilder(buildText));
          const promptAction = context.getPromptAction();
          let uniqueId = this.getUniqueId();
          let frameNode: FrameNode | null = context.getFrameNodeByUniqueId(uniqueId);
          emitter.on(innerEvent, this.callback);
          promptAction.openMenu(contentNode, { id: 'btn3', componentId: frameNode?.getUniqueId() }, {
            anchorPosition: { x: -10, y: 10 },
          })
        })

    }
    .alignItems(HorizontalAlign.Start)
    .width('100%')
    .height('100%')
  }
}