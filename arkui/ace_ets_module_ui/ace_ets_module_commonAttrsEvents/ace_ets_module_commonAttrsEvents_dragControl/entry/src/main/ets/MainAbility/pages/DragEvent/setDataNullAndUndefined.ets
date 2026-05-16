/*
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

import { unifiedDataChannel } from '@kit.ArkData';
import { image } from '@kit.ImageKit';
import { dragController } from '@kit.ArkUI';

@Entry
@Component
struct DragEventSetData {
  @State setDataResult: string = ''
  @State setDataNullResult: string = ''
  @State setDataUndefinedResult: string = ''
  @State pixmap: image.PixelMap | undefined = undefined
  @State unifiedData1: unifiedDataChannel.UnifiedData | undefined = undefined
  @State previewData: DragItemInfo | undefined = undefined

  loadData() {
    let timeout = setTimeout(() => {
      this.getUIContext().getComponentSnapshot().get('image1', (error: Error, pixmap: image.PixelMap) => {
        this.pixmap = pixmap
        this.previewData = {
          pixelMap: this.pixmap
        }
      })

      let data: unifiedDataChannel.Image = new unifiedDataChannel.Image();
      data.imageUri = 'app.media.icon';
      let unifiedData = new unifiedDataChannel.UnifiedData(data);
      this.unifiedData1 = unifiedData
      this.getUIContext().getDragController().notifyDragStartRequest(dragController.DragStartRequestStatus.READY)
    }, 1000);
  }

  build() {
    Column({ space: 20 }) {
      Text('DragEvent setData Test')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      // 测试正常设置结果
      Row() {
        Text('Set Data Result:').width('30%').fontSize(16)
        Text(this.setDataResult).width('20%').fontSize(16)
      }
      .width('90%')
      .height('10%')
      .justifyContent(FlexAlign.SpaceBetween)
      .key('setResult')
      .margin({ top: 10 })

      // 测试null参数结果
      Row() {
        Text('Null Result:').width('30%').fontSize(16)
        Text(this.setDataNullResult).width('20%').fontSize(16)
      }
      .width('90%')
      .height('10%')
      .justifyContent(FlexAlign.SpaceBetween)
      .key('nullResult')

      // 测试undefined参数结果
      Row() {
        Text('Undefined Result:').width('30%').fontSize(16)
        Text(this.setDataUndefinedResult).width('20%').fontSize(16)
      }
      .width('90%')
      .height('10%')
      .justifyContent(FlexAlign.SpaceBetween)
      .key('undefinedResult')

      // 拖拽测试区域
      Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceAround }) {
        Image($r('app.media.icon'))
          .id('image1')
          .width('25%')
          .height('25%')
          .border({ width: 1 })
          .draggable(true)
          .dragPreview(this.previewData)
          .onPreDrag((status: PreDragStatus) => {
            if (status == PreDragStatus.PREPARING_FOR_DRAG_DETECTION) {
              this.loadData()
            }
          })
          .onDragStart((event: DragEvent) => {
            if (this.unifiedData1) {
              event.setData(this.unifiedData1);
              this.setDataResult = 'SUCCESS';
              AppStorage.setOrCreate('setDataNormalResult', 'SUCCESS');
            }
          })
      }
      .height('30%')
      .width('90%')
      .margin({ top: 20 })

      // 测试按钮
      Button('Test Null Data')
        .width('90%')
        .height('8%')
        .fontSize(16)
        .key('testNull')
        .onClick(() => {
          this.resetStates();
        })
        .onDragStart((event: DragEvent) => {
          try {
            event.setData(null);
            this.setDataNullResult = 'SUCCESS';
            AppStorage.setOrCreate('setDataNullResult', 'SUCCESS');
          } catch (error) {
            this.setDataNullResult = 'ERROR: ' + error.message;
            AppStorage.setOrCreate('setDataNullResult', 'ERROR');
          }
        })

      Button('Test Undefined Data')
        .width('90%')
        .height('8%')
        .fontSize(16)
        .key('testUndefined')
        .onClick(() => {
          this.resetStates();
        })
        .onDragStart((event: DragEvent) => {
          try {
            event.setData(undefined);
            this.setDataUndefinedResult = 'SUCCESS';
            AppStorage.setOrCreate('setDataUndefinedResult', 'SUCCESS');
          } catch (error) {
            this.setDataUndefinedResult = 'ERROR: ' + error.message;
            AppStorage.setOrCreate('setDataUndefinedResult', 'ERROR');
          }
        })

      Button('Reset States')
        .width('90%')
        .height('8%')
        .fontSize(16)
        .key('resetStates')
        .onClick(() => {
          this.resetStates();
        })
    }
    .width('100%')
    .height('90%')
    .padding(20)
  }

  private resetStates(): void {
    this.setDataResult = '';
    this.setDataNullResult = '';
    this.setDataUndefinedResult = '';
    AppStorage.clear();
  }
}