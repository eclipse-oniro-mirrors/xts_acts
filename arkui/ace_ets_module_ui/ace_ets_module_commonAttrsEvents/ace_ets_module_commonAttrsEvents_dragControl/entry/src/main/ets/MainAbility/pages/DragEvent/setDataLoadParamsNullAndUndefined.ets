/*
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
import { unifiedDataChannel} from '@kit.ArkData';

import { dragController } from '@kit.ArkUI';
import { image } from '@kit.ImageKit';

@Entry
@Component
struct DragEventSetDataLoadParams {
  @State setDataLoadParamsResult: string = ''
  @State setDataLoadParamsNullResult: string = ''
  @State setDataLoadParamsUndefinedResult: string = ''
  @State pixmap: image.PixelMap | undefined = undefined
  @State unifiedData1: unifiedDataChannel.UnifiedData | undefined = undefined
  @State previewData: DragItemInfo | undefined = undefined
  @State udKey: string = ''
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
    Column() {
      // // 拖拽测试区域
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

      // 测试按钮
      Button('Test Null Params')
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
            AppStorage.setOrCreate('setDataLoadParamsNullResult', this.udKey);
          } catch (error) {
            AppStorage.setOrCreate('setDataLoadParamsNullResult', 'ERROR');
            AppStorage.setOrCreate('setDataLoadParamsNullError', error.message);
          }
        })

      Button('Test Undefined Params')
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
            AppStorage.setOrCreate('setDataLoadParamsUndefinedResult', this.udKey);
          } catch (error) {
            AppStorage.setOrCreate('setDataLoadParamsUndefinedResult', 'ERROR');
            AppStorage.setOrCreate('setDataLoadParamsUndefinedError', error.message);
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
    .height('100%')
    .padding(20)
  }

  private resetStates(): void {
    this.setDataLoadParamsResult = '';
    this.setDataLoadParamsNullResult = '';
    this.setDataLoadParamsUndefinedResult = '';
    this.udKey = '';
    AppStorage.clear();
  }
}