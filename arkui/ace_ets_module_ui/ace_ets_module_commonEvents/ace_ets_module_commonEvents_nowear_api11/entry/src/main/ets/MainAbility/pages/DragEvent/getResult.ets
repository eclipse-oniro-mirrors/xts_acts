/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import UDC from '@ohos.data.unifiedDataChannel';
import promptAction from '@ohos.promptAction';
import { BusinessError } from '@ohos.base';

@Entry
@Component
struct getResult {
  @State targetImage1: string = '';
  @State targetImage2: string = '';
  @State targetImage3: string = '';
  @State targetImage4: string = '';
  @State targetImage5: string = '';
  @State targetImage: string = '';
  @State targetText: string = 'Drag Text';
  @State imgState: Visibility = Visibility.Visible;
  @State abstractContent: string = "abstract";
  @State textContent: string = "";

  getDataFromUdmfRetry(event: DragEvent, callback: (data: DragEvent) => void) {
    try {
      let data: UnifiedData = event.getData();
      if (!data) {
        return false;
      }
      let records: Array<UDC.UnifiedRecord> = data.getRecords();
      if (!records || records.length <= 0) {
        return false;
      }
      callback(event);
      return true;
    } catch (e) {
      console.log("getData failed, code = " + (e as BusinessError).code + ", message = " +
      (e as BusinessError).message);
      return false;
    }
  }

  getDataFromUdmf(event: DragEvent, callback: (data: DragEvent) => void) {
    if (this.getDataFromUdmfRetry(event, callback)) {
      return;
    }
    setTimeout(() => {
      this.getDataFromUdmfRetry(event, callback);
    }, 1500);
  }

  build() {
    Row() {
      Column() {
        Image($r('app.media.icon'))
          .draggable(true)
          .height('10%')
          .visibility(this.imgState)
          .id('images')
          .onDragStart(() => {

          })
          .onDragEnd((event) => {
            if (event.getResult() === DragResult.DRAG_SUCCESSFUL) {
              promptAction.showToast({ duration: 100, message: 'Drag Success' });
            } else if (event.getResult() === DragResult.DRAG_FAILED) {
              promptAction.showToast({ duration: 100, message: 'Drag failed' });
            } else if (event.getResult() === DragResult.DRAG_CANCELED) {
              promptAction.showToast({ duration: 100, message: 'Drag DRAG_CANCELED' });
            }
          })
        Text('DragResult.DRAG_SUCCESSFUL')
          .width('100%')
          .height('5%')
        Image(this.targetImage)
          .height('15%')
          .width('100%')
          .draggable(true)
          .margin({ left: 15 })
          .border({ color: Color.Black, width: 1 })
          .id('success')
          .onDrop((event: DragEvent) => {
            this.getDataFromUdmf((event as DragEvent), (event: DragEvent) => {
              let records: Array<UDC.UnifiedRecord> = event.getData().getRecords();
              this.targetImage = (records[0] as UDC.Image).imageUri;
              event.useCustomDropAnimation = false;
              event.setResult(DragResult.DRAG_SUCCESSFUL);
              AppStorage.setOrCreate('DRAG_SUCCESSFUL', DragResult.DRAG_SUCCESSFUL)
            })
          })

        Text('DragResult.DRAG_FAILED')
          .height('5%')
        Image(this.targetImage1)
          .height('15%')
          .width('100%')
          .draggable(true)
          .margin({ left: 15 })
          .id('failed')
          .border({ color: Color.Black, width: 1 })
          .onDrop((event: DragEvent) => {
            event.setResult(DragResult.DRAG_FAILED);
            AppStorage.setOrCreate('DRAG_FAILED', DragResult.DRAG_FAILED)

          })
      }.width('45%')
      .height('100%')


      Column() {
        Text('DragResult.DRAG_CANCELED')
          .height('5%')
        Image(this.targetImage2)
          .height('15%')
          .width('100%')
          .draggable(true)
          .margin({ left: 15 })
          .border({ color: Color.Black, width: 1 })
          .id('canceled')
          .onDrop((event: DragEvent) => {
            event.setResult(DragResult.DRAG_CANCELED);
            AppStorage.setOrCreate('DRAG_CANCELED', DragResult.DRAG_CANCELED)

          })

        Text('DragResult.DROP_ENABLED')
          .height('5%')
        Image(this.targetImage3)
          .height('15%')
          .width('100%')
          .draggable(true)
          .margin({ left: 15 })
          .border({ color: Color.Black, width: 1 })
          .id('enabled')
          .onDrop((event: DragEvent) => {
            this.getDataFromUdmf((event as DragEvent), (event: DragEvent) => {
              let records: Array<UDC.UnifiedRecord> = event.getData().getRecords();
              this.targetImage3 = (records[0] as UDC.Image).imageUri;
              event.setResult(DragResult.DROP_ENABLED);
              AppStorage.setOrCreate('DROP_ENABLED', DragResult.DROP_ENABLED)

            })
          })

        Text('DragResult.DROP_DISABLED')
          .height('5%')
        Image(this.targetImage4)
          .height('15%')
          .width('100%')
          .draggable(true)
          .margin({ left: 15 })
          .border({ color: Color.Black, width: 1 })
          .id('disabled')
          .onDrop((event: DragEvent) => {
            event.setResult(DragResult.DROP_DISABLED);
            AppStorage.setOrCreate('DROP_DISABLED', DragResult.DROP_DISABLED)
          })
      }.width('45%')
      .height('100%')
      .margin({ left: '5%' })
    }
    .height('90%')
  }
}