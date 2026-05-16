'use static'
/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
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
 
import { AppStorage, State } from '@ohos.arkui.stateManagement'
import { Router, UIContext, CursorController } from '@ohos.arkui.UIContext';
import router from '@ohos.router';
import {
  $r,
  Button,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  Entry,
  GestureEvent,
  HorizontalAlign,
  Image,
  LongPressGesture,
  Margin,
  Padding,
  Row,
  SourceTool,
  Text,
  MouseEvent,
  MouseHistoricalPoint
} from '@ohos.arkui.component'
import componentSnapshot from '@ohos.arkui.componentSnapshot';
import image from '@ohos.multimedia.image';
import { BusinessError } from '@ohos.base';

@Entry
@Component
struct CustomCursorExample {
  cursorController: CursorController = this.getUIContext().getCursorController();
  @State pixelMap: image.PixelMap | undefined = undefined;
  @State historyX: number = 0;
  @State historyY: number = 0;
  @State pointCount: number = 0;

  async loadPixelMapFromRawFile(): Promise<void> {
    try {
      const uiContext = this.getUIContext();
      if (!uiContext) {
        console.error('UIContext is undefined');
        return;
      }

      const context = uiContext.getHostContext();
      if (!context) {
        console.error('HostContext is undefined');
        return;
      }

      const resourceMgr = context.resourceManager;
      if (!resourceMgr) {
        console.error('ResourceManager is undefined');
        return;
      }

      const fileData: Uint8Array = await resourceMgr.getRawFileContent('wjy.jpg');
      const buffer = fileData.buffer.slice(0);

      const imageSource = image.createImageSource(buffer);

      const pixelMap = await imageSource?.createPixelMap({
        desiredSize: { width: 32, height: 32 }
      });

      this.pixelMap = pixelMap;
      console.info('Custom cursor loaded successfully');
    } catch (error) {
      let err = error as BusinessError;
      console.error(`Failed to load cursor: ${err.code}, ${err.message}`);
    }
  }

  build() {
    Column() {
      Button('1')
        .id('button01')
        .onClick(()=>{
          this.loadPixelMapFromRawFile();
        })
      Button('2')
        .id('button02')
        .onClick(()=>{
          this.cursorController.setCustomCursor(this.pixelMap!, undefined, undefined);
        })
      Button('onMouse')
        .id('button03')
        .fontSize(24)
        .onMouse((event: MouseEvent): void => {
          if (event) {
            let allHistoricalPoints : Array<MouseHistoricalPoint> | undefined = event.getHistoricalPoints();
            if (allHistoricalPoints !== undefined && allHistoricalPoints.length > 0) {
              this.pointCount = allHistoricalPoints.length;
              for (let idx = 0; idx < allHistoricalPoints.length; idx++) {
                console.info("[TEST INFO]  [getHistoricalPoints()]"+ JSON.stringify(allHistoricalPoints[idx]))
                if (idx + 1 == allHistoricalPoints.length) {
                  console.info("[TEST INFO]  [getHistoricalPoints()] [end] allHistoricalPoints.length = %d", allHistoricalPoints.length)
                  this.historyX = allHistoricalPoints[idx].x;
                  this.historyY = allHistoricalPoints[idx].y;
                }
              }
            }
          }
        })
      Text(`X 坐标：${this.historyX}`)
        .id('getHistoricalPointsX')
        .fontSize(22)
        .margin({ top: 20 })
    }
    .width('100%')
    .height('100%')
    .padding({ top: 30 })
  }

  aboutToDisappear(): void {
    if (this.pixelMap) {
      this.pixelMap?.release();
      this.pixelMap = undefined;
    }
    this.cursorController.restoreDefault();
  }
}