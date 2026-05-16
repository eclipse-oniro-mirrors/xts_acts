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
 
import { unifiedDataChannel } from '@kit.ArkData';
import { image } from '@kit.ImageKit';
import { dragController } from "@kit.ArkUI";

@Entry
@Component
struct NormalEts {
  @State finished: boolean = false
  @State timeout1: number = 1
  @State pixmap: image.PixelMap | undefined = undefined
  @State unifiedData1: unifiedDataChannel.UnifiedData | undefined = undefined
  @State previewData: DragItemInfo | undefined = undefined
  @State msg:string = 'unit'

  loadData() {
    let timeout = setTimeout(() => {
      this.getUIContext().getComponentSnapshot().get("image1", (error: Error, pixmap: image.PixelMap) => {
        this.pixmap = pixmap
        this.previewData = {
          pixelMap: this.pixmap
        }
      })

      let data: unifiedDataChannel.Image = new unifiedDataChannel.Image();
      data.imageUri = "app.media.startIcon";
      let unifiedData = new unifiedDataChannel.UnifiedData(data);
      this.unifiedData1 = unifiedData

      this.getUIContext().getDragController().notifyDragStartRequest(dragController.DragStartRequestStatus.READY)
    }, 4000);
    this.timeout1 = timeout
  }


    build() {
      Column({space: 20}) {
        Image($r("app.media.apple"))
          .width('25%')
          .height('25%')
          .id("image1")
          .draggable(true)
          .dragPreview(this.previewData)
          .onPreDrag((status: PreDragStatus) => {
            if (status == PreDragStatus.PREPARING_FOR_DRAG_DETECTION) {
              this.loadData()
            } else {
              clearTimeout(this.timeout1);
            }
          })
          .onDragStart((event: DragEvent) => {
            if (this.finished == false) {
              this.getUIContext().getDragController().notifyDragStartRequest(dragController.DragStartRequestStatus.WAITING)
              this.msg ='success'
            } else {
              event.setData(this.unifiedData1);
            }
          })
          .onDragEnd(()=>{
            this.finished = false
          })
          Button(this.msg)
          .margin({top:'15%'})
          .id('button')
      }
      .height('50%')
      .backgroundColor(Color.Grey).margin({left: '15%'})
    }
}