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
struct XComponentType1 {
  @State XComponentType1: XComponentType = XComponentType.SURFACE
  private surfaceId : string =''
  xcomponentController: XComponentController = new XComponentController()

  build() {
    Column() {
      XComponent({
        id: 'xcomponent1',
        type: XComponentType.SURFACE,
        controller: this.xcomponentController
      }).id('xcomponent_1')
        .onLoad(() => {
          this.xcomponentController.setXComponentSurfaceSize({surfaceWidth:1920,surfaceHeight:1080});
          this.surfaceId = this.xcomponentController.getXComponentSurfaceId()
          console.log(this.surfaceId)
        })
        .width('640px')
        .height('480px')
        .margin(5)

      XComponent({
        id: 'xcomponent2',
        type: XComponentType.COMPONENT,
        controller: this.xcomponentController
      }).id('xcomponent_2')
        .onLoad(() => {
          this.xcomponentController.setXComponentSurfaceSize({surfaceWidth:1920,surfaceHeight:1080});
          this.surfaceId = this.xcomponentController.getXComponentSurfaceId()
          console.log(this.surfaceId)
        })
        .width('640px')
        .height('480px')
        .margin(5)

      XComponent({
        id: 'xcomponent3',
        type: XComponentType.TEXTURE,
        controller: this.xcomponentController
      }).id('xcomponent_3')
        .onLoad(() => {
          this.xcomponentController.setXComponentSurfaceSize({surfaceWidth:1920,surfaceHeight:1080});
          this.surfaceId = this.xcomponentController.getXComponentSurfaceId()
          console.log(this.surfaceId)
        })
        .width('640px')
        .height('480px')
        .margin(5)
    }
    .backgroundColor(Color.Black)
    .position({x: 0, y: 48})
  }
}