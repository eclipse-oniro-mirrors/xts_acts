/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
 
import { unifiedDataChannel, uniformTypeDescriptor } from '@kit.ArkData';
import { promptAction } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

class imageModifier implements AttributeModifier<ImageModifier> {
  isDark: boolean = false

  applyNormalAttribute(instance: ImageModifier): void {
    instance.onDragEnter((event)=>{
      let dragSource = (event as DragEvent).getDragSource();
      let isRemote = (event as DragEvent).isRemote();
    })
  }
}


@Entry
@Component
struct Index {
  @State targetImage: string = '';
  @State targetText: string = 'Drag Text';
  @State imageWidth: number = 100;
  @State imageHeight: number = 100;
  @State imgState: Visibility = Visibility.Visible;
  @State abstractContent: string = "abstract";
  @State textContent: string = "";
  @State backGroundColor: Color = Color.Transparent;
  @State modifier: imageModifier = new imageModifier()

  @Builder
  pixelMapBuilder() {
    Column() {
      Image($r('app.media.apple'))
        .width(120)
        .height(120)
        .backgroundColor(Color.Yellow)
    }
  }

  getDataFromUdmfRetry(event: DragEvent, callback: (data: DragEvent) => void) {
    try {
      let data: UnifiedData = event.getData();
      if (!data) {
        return false;
      }
      let records: Array<unifiedDataChannel.UnifiedRecord> = data.getRecords();
      if (!records || records.length <= 0) {
        return false;
      }
      callback(event);
      return true;
    } catch (e) {
      console.log("getData failed, code = " + (e as BusinessError).code + ", message = " + (e as BusinessError).message);
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

  private PreDragChange(preDragStatus: PreDragStatus): void {
    if (preDragStatus == PreDragStatus.READY_TO_TRIGGER_DRAG_ACTION) {
      this.backGroundColor = Color.Red;
    } else if (preDragStatus == PreDragStatus.ACTION_CANCELED_BEFORE_DRAG
      || preDragStatus == PreDragStatus.PREVIEW_LANDING_FINISHED) {
      this.backGroundColor = Color.Blue;
    }
  }

  build() {
    Row() {
      Column() {
        Image($r('app.media.apple'))
          .id('startDrag')
          .onDrop((dragEvent?: DragEvent) => {
            let dragSource = (dragEvent as DragEvent).getDragSource();
            AppStorage.setOrCreate('dragSource1', dragSource)
            let isRemote = (dragEvent as DragEvent).isRemote();
             AppStorage.setOrCreate('isRemote1', isRemote)
          })
          .onDragStart((event)=>{
            let dragSource = (event as DragEvent).getDragSource();
            let isRemote = (event as DragEvent).isRemote();
             AppStorage.setOrCreate('dragSource2', dragSource)
             AppStorage.setOrCreate('isRemote2', isRemote)
          })
          .onDragEnter((event)=>{
            let dragSource = (event as DragEvent).getDragSource();
            let isRemote = (event as DragEvent).isRemote();
            AppStorage.setOrCreate('dragSource3', dragSource)
             AppStorage.setOrCreate('isRemote3', isRemote)
          })
          .onDragMove((event)=>{
            let dragSource = (event as DragEvent).getDragSource();
            let isRemote = (event as DragEvent).isRemote();
            AppStorage.setOrCreate('dragSource4', dragSource)
             AppStorage.setOrCreate('isRemote4', isRemote)
          })
          .onDragLeave((event)=>{
            let dragSource = (event as DragEvent).getDragSource();
            let isRemote = (event as DragEvent).isRemote();
             AppStorage.setOrCreate('dragSource5', dragSource)
             AppStorage.setOrCreate('isRemote5', isRemote)
          })
          .width('20%')
          .height('20%')
          .draggable(true)
          .visibility(this.imgState)

      }.width('45%')
      .height('45%')
      Column() {
        Image(this.targetImage)
          .width(this.imageWidth)
          .height(this.imageHeight)
          .id('endDrag')
          .draggable(true)
          .margin({ left: '10%' })
          .border({ color: Color.Black, width: 1 })
          .allowDrop([uniformTypeDescriptor.UniformDataType.IMAGE])
          .onDragEnter((event)=>{
            let dragSource = (event as DragEvent).getDragSource();
            AppStorage.setOrCreate('dragSource', dragSource)
            let isRemote = (event as DragEvent).isRemote();
            AppStorage.setOrCreate('isRemote', isRemote)
          })
          .attributeModifier(this.modifier)
      }.width('45%')
      .height('45%')
      .margin({ left: '5%' })
  }
   }
}