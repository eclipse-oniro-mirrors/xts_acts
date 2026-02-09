/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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


import dragController from "@ohos.arkui.dragController"
import UDMF from '@ohos.data.unifiedDataChannel';
import componentSnapshot from '@ohos.arkui.componentSnapshot';
import image from '@ohos.multimedia.image';

@Entry
@Component
struct DragController1 {
  @State pixmap?: image.PixelMap = undefined

  @Builder DraggingBuilder() {
    Column() {
      Text("DraggingBuilder")
    }
    .width(100)
    .height(100)
    .backgroundColor(Color.Blue)
  }

  @Builder PixmapBuilder() {
    Column() {
      Text("PixmapBuilder")
    }
    .width(100)
    .height(100)
    .backgroundColor(Color.Blue)
  }

  build() {
    Column() {
      Button('touch to execute drag')
        .onTouch((event) => {
          if (event.type == TouchType.Down) {
            let text = new UDMF.Text()
            let unifiedData = new UDMF.UnifiedData(text)

            let dragInfo: dragController.DragInfo = {
              pointerId: 0,
              data: unifiedData,
              extraParams: ''
            }
            componentSnapshot.createFromBuilder(this.PixmapBuilder.bind(this)).then((pix: image.PixelMap) => {
              this.pixmap = pix;
              let dragItemInfo: DragItemInfo = {
                pixelMap: this.pixmap,
                builder: this.DraggingBuilder.bind(this),
                extraInfo: "DragItemInfoTest"
              }
              dragController.executeDrag(dragItemInfo, dragInfo)
                .then((eve) => {
                  if (eve.event?.getResult() == DragResult.DRAG_SUCCESSFUL) {
                    // ...
                  } else if (eve.event?.getResult() == DragResult.DRAG_FAILED) {
                    // ...
                  }
                })
                .catch((err: Error) => {
                })
            })
          }
        })
    }
    .width('100%')
    .height('100%')
  }
}