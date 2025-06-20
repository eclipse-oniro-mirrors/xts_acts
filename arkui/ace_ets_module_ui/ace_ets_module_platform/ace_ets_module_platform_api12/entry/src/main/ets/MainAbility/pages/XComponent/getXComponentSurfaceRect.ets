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


@Entry
@Component
struct getXComponentSurfaceRect1 {
  private surfaceId: string = ''
  private xComponentContext: Record<string, () => void> = {}
  xComponentController: XComponentController = new XComponentController()
  @State rect: SurfaceRect | null = null

  build() {
    Column() {
      Text(JSON.stringify(this.rect)).id("getXComponentSurfaceRect1_text")
        .fontSize(12)
      XComponent({
        id: 'xcomponent',
        type: XComponentType.TEXTURE,
        controller: this.xComponentController
      })
        .onLoad(() => {
          this.surfaceId = this.xComponentController.getXComponentSurfaceId()
          this.xComponentContext = this.xComponentController.getXComponentContext() as Record<string, () => void>
          let surfaceRect: SurfaceRect = { offsetX: 20, offsetY: 20, surfaceWidth: 500, surfaceHeight: 500 }
          this.xComponentController.setXComponentSurfaceRect(surfaceRect)
          this.rect = this.xComponentController.getXComponentSurfaceRect()
        })
        .width('640px')
        .height('480px')
    }
    .position({ x: 0, y: 48 })
  }
}