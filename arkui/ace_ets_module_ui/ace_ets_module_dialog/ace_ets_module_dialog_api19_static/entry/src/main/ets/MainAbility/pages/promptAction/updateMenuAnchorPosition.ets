'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { ComponentContent, FrameNode } from '@ohos.arkui.node';
import {
  $r,
  Builder,
  Button,
  Column,
  Component,
  Entry,
  Menu,
  MenuItem,
  MenuItemOptions,
  Text,
  wrapBuilder,
  Area,
  Margin,
  Position,
  HorizontalAlign
} from '@ohos.arkui.component';
import { Link, State } from '@ohos.arkui.stateManagement';
import emitter from '@ohos.events.emitter';
import { RecordData } from '@ohos.base';

let innerEvent: emitter.InnerEvent = {
  eventId: 1,
  priority: emitter.EventPriority.HIGH
};
@Builder
function buildText() {
  Column() {
    Menu(){
      MenuItem({ startIcon: $r('app.media.icon'), content: '菜单选项1' } as MenuItemOptions)
      MenuItem({ startIcon: $r('app.media.icon'), content: '菜单选项2' } as MenuItemOptions)
    }
  }
    .onAreaChange((oldValue: Area, newValue: Area) => {
      let menuPosition: Position = { x: newValue.globalPosition.x, y: newValue.globalPosition.y };
      let eventData: emitter.EventData = {
        data: {
          'menuPosition': menuPosition
        } as Record<String,RecordData>
      };
      emitter.emit(innerEvent, eventData);

    })
  .width('30%')
}
type Callback<T> = (eventData: emitter.EventData) => void;
@Entry
@Component
struct Index {
  @State menuPosition: Position = { x: 0, y: 0 } as Position;
  @State textPosition1: Position = { x: 0, y: 0 } as Position;
  @State textPosition2: Position = { x: 0, y: 0 } as Position;
  @State textPosition3: Position = { x: 0, y: 0 } as Position;
  callback: Callback<emitter.EventData> = (eventData: emitter.EventData) => {
    if(eventData.data){
      let tempX: number = (eventData.data as ESObject).getProperty('menuPosition').getProperty('x').toNumber()
      let tempY: number = (eventData.data as ESObject).getProperty('menuPosition').getProperty('y').toNumber()
      this.menuPosition.x = tempX;
      this.menuPosition.y = tempY;
    }
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
      Button('updateMenu1')
        .id('btn1')
        .fontSize(20)
        .width(200)
        .height(100)
        .margin({ top: 50, left: 100 }  as Margin)
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
          // promptAction.openMenu(contentNode, { id: 'btn1', componentId: frameNode?.getUniqueId().toInt() },{
          //   anchorPosition:{x:10, y:10},
          // })
          // setTimeout(() => {
          //   promptAction.updateMenu(contentNode, {
          //     anchorPosition:{x:20, y:20},
          //   })
          // }, 4000);
        })

      Button('updateMenu2')
        .id('btn2')
        .fontSize(20)
        .width(200)
        .height(100)
        .margin({ top: 50, left: 100 } as Margin)
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
          // promptAction.openMenu(contentNode, { id: 'btn2', componentId: frameNode?.getUniqueId().toInt() },{
            // anchorPosition:{x:-10, y:-20},
          // })
          // setTimeout(() => {
            // promptAction.updateMenu(contentNode, {
              // anchorPosition:{x:10, y:20},
            // })
          // }, 4000);
        })

      Button('updateMenu3')
        .id('btn3')
        .fontSize(20)
        .width(200)
        .height(100)
        .margin({ top: 50, left: 100 } as Margin)
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
          // promptAction.openMenu(contentNode, { id: 'btn3', componentId: frameNode?.getUniqueId().toInt() },{
            // anchorPosition:{x:20, y:-20},
          // })
          // setTimeout(() => {
            // promptAction.updateMenu(contentNode, {
              // anchorPosition:{x:-20, y:20},
            // })
          // }, 4000);
        })

    }
    .alignItems(HorizontalAlign.Start)
    .width('100%')
    .height('100%')
  }
}