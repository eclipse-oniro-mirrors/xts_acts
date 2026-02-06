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


@Entry
@Component
struct SetXComponentSurfaceRotation1 {
  private surfaceId: string = ''
  private xComponentContext: Record<string, () => void> = {}
  xComponentController: XComponentController = new XComponentController()
  @State SurfaceRotation: SurfaceRotationOptions | null = null

  build() {
    Column() {
      Text(JSON.stringify(this.SurfaceRotation)).id("setXComponentSurfaceRotation_text")
        .fontSize(12)
      XComponent({
        id: 'xcomponent',
        type: XComponentType.TEXTURE,
        controller: this.xComponentController
      })
        .onLoad(() => {
          let SurfaceRotation: SurfaceRotationOptions = { lock: false }
          this.xComponentController.setXComponentSurfaceRotation(this.SurfaceRotation)
          this.SurfaceRotation = this.xComponentController.getXComponentSurfaceRotation()
        })
        .width('640px')
        .height('480px')
    }
    .position({ x: 0, y: 48 })
  }
}