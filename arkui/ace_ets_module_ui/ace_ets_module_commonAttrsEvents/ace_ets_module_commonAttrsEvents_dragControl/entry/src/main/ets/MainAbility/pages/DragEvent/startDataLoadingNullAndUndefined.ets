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
import { unifiedDataChannel, uniformTypeDescriptor } from '@kit.ArkData';
import { fileUri } from '@kit.CoreFileKit';
import { fileIo as fs } from '@kit.CoreFileKit';
import { common } from '@kit.AbilityKit';
import { image } from '@kit.ImageKit';
import { dragController } from '@kit.ArkUI';

@Entry
@Component
struct DragEventStartDataLoading {
  @State startDataLoadingResult: string = ''
  @State startDataLoadingNullResult: string = ''
  @State startDataLoadingUndefinedResult: string = ''
  @State pixmap: image.PixelMap | undefined = undefined
  @State unifiedData1: unifiedDataChannel.UnifiedData | undefined = undefined
  @State previewData: DragItemInfo | undefined = undefined
  @State udKey: string = ''
  @State cancelResult: string = ''
  destPath: string = '/data/';
  fileConflictOptions: unifiedDataChannel.FileConflictOptions = unifiedDataChannel.FileConflictOptions.OVERWRITE
  progressIndicator: unifiedDataChannel.ProgressIndicator = unifiedDataChannel.ProgressIndicator.DEFAULT

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
      // 测试按钮
      Button('Test Null Options')
        .width('90%')
        .height('8%')
        .fontSize(16)
        .key('testNull')
        .onClick(() => {
          this.resetStates();
        })
        .onDrop((event?: DragEvent, extraParams?: string) => {
          try {
            this.udKey = (event as DragEvent).startDataLoading(null);
            AppStorage.setOrCreate('startDataLoadingNullResult', 'SUCCESS');
          } catch (error) {
            AppStorage.setOrCreate('startDataLoadingNullResult', 'ERROR');
            AppStorage.setOrCreate('startDataLoadingNullError', error.message);
          }
        })

      Button('Test Undefined Options')
        .width('90%')
        .height('8%')
        .fontSize(16)
        .key('testUndefined')
        .onClick(() => {
          this.resetStates();
        })
        .onDrop((event?: DragEvent, extraParams?: string) => {
          try {
            this.udKey = (event as DragEvent).startDataLoading(undefined);
            AppStorage.setOrCreate('startDataLoadingUndefinedResult', 'SUCCESS');
          } catch (error) {
            AppStorage.setOrCreate('startDataLoadingUndefinedResult', 'ERROR');
            AppStorage.setOrCreate('startDataLoadingUndefinedError', error.message);
          }
        })

      Button('Cancel Data Loading')
        .width('90%')
        .height('8%')
        .fontSize(16)
        .key('cancel')
        .onClick(() => {
          try {
            this.getUIContext().getDragController().cancelDataLoading(this.udKey);
            this.cancelResult = 'SUCCESS';
            AppStorage.setOrCreate('cancelResult', 'SUCCESS');
          } catch (e) {
            this.cancelResult = e.code;
            AppStorage.setOrCreate('cancelResult', e.code);
          }
        })
        .margin({ top: '3%' })

      Button('Reset States')
        .width('90%')
        .height('8%')
        .fontSize(16)
        .key('resetStates')
        .onClick(() => {
          this.resetStates();
        })
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
      }
      .height('25%')
      .width('90%')
      .margin({ top: 20 })
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }

  private resetStates(): void {
    this.startDataLoadingResult = '';
    this.startDataLoadingNullResult = '';
    this.startDataLoadingUndefinedResult = '';
    this.udKey = '';
    this.cancelResult = '';
    AppStorage.clear();
  }
}