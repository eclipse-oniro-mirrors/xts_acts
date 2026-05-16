/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { image } from '@kit.ImageKit';
import { CursorController } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import { expect } from '@ohos/hypium';
import effectKit from '@ohos.effectKit';

@Entry
@Component
struct CustomCursorExample {
  cursorController: CursorController = this.getUIContext().getCursorController();
  @State pixelMap: image.PixelMap | undefined = undefined;
  @State pixel: image.PixelMap | undefined = undefined;
  @State historyX: number = 0;
  @State historyY: number = 0;

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

      const fileData: Uint8Array = await resourceMgr.getRawFileContent('cursor.png');
      const buffer = fileData.buffer.slice(0);

      const imageSource = image.createImageSource(buffer);

      const pixelMap = await imageSource.createPixelMap({
        desiredSize: { width: 32, height: 32},
      })
      expect(pixelMap.isEditable).assertFalse();
      expect(pixelMap.isStrideAlignment).assertFalse();
      console.info('www data pixelMap isEditable ', pixelMap.isEditable)
      console.info('www data pixelMap isStrideAlignment ', pixelMap.isStrideAlignment)
      let pixel = effectKit.createEffect(pixelMap).getPixelMap();
      console.info('www data pixelMap isEditable ', pixel.isEditable)
      console.info('www data pixelMap isStrideAlignment ', pixel.isStrideAlignment)
      expect(pixel.isEditable).assertTrue();
      expect(pixel.isStrideAlignment).assertTrue()
      this.pixelMap = pixelMap;
      this.pixel = pixel;
      console.info('Custom cursor loaded successfully');

      this.cursorController.setCustomCursor(this.pixelMap, null, null);
      this.cursorController.setCustomCursor(this.pixel, null, null);

    } catch (error) {
      let err = error as BusinessError;
      console.error(`Failed to load cursor: ${err.code}, ${err.message}`);
    }
  }
  build() {
    Column() {
      Button('1')
        .margin(20)
        .id('button01')
        .backgroundColor(Color.Blue)
        .onClick(() => {
          this.loadPixelMapFromRawFile();
        })

      Text('MouseEvent').textAlign(TextAlign.Center).margin({ bottom: 10 })

      Button('2')
        .id('button02')
        .type(ButtonType.ROUNDED_RECTANGLE)
        .margin({ bottom: 15 })
        .onMouse((event: MouseEvent) => {
          let points = event.getHistoricalPoints?.();
          if (points && points.length > 0) {
            let lastPoint = points[points.length - 1];
            this.historyX = lastPoint.x;
            this.historyY = lastPoint.y;
          }
        })

      Text(`${this.historyX}`).id('getHistoricalPointsX').textAlign(TextAlign.Center).margin({ bottom: 10 })

      Text(`${this.historyY}`).id('getHistoricalPointsY').textAlign(TextAlign.Center).margin({ bottom: 10 })
    }
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .width('100%')
    .height('100%')
  }

  aboutToDisappear(): void {
    if (this.pixelMap) {
      this.pixelMap.release();
      this.pixelMap = undefined;
    }
    this.cursorController.restoreDefault();
  }
}