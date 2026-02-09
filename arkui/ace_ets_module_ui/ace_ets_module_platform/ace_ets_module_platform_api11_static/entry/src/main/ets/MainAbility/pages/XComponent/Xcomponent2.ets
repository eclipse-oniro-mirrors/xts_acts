'use static';
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
import { Entry,Column,Component,Button,XComponent,XComponentParameters,Position,Video,XComponentController,XComponentType,Color,TextOverflow,TextAlign,Alignment,VideoController,FlexDirection,Flex,ImageFit,Row,ItemAlign,FlexAlign,ClickEvent,SeekMode,PlaybackSpeed,Resource,Text,$rawfile,$r } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
@Entry
@Component
struct componentType {
  @State componentType: XComponentType = XComponentType.SURFACE
  private surfaceId : string =''
  xcomponentController: XComponentController = new XComponentController()

  build() {
    Column() {
      XComponent({
        id: 'xcomponent1',
        type: XComponentType.SURFACE,
        nativeXComponentHandler: ((value0: long): void => {}),
        controller: this.xcomponentController
      } as XComponentParameters).id('xcomponent_1')
        .onLoad((): void => {
          this.xcomponentController.setXComponentSurfaceRect({surfaceWidth:1920,surfaceHeight:1080});
          this.surfaceId = this.xcomponentController.getXComponentSurfaceId()
          console.log(this.surfaceId)
        })
        .width('640px')
        .height('480px')
        .margin(5)

      XComponent({
        id: 'xcomponent2',
        type: XComponentType.TEXTURE,
        nativeXComponentHandler: ((value0: long): void => {}),
        controller: this.xcomponentController
      } as XComponentParameters).id('xcomponent_2')
        .onLoad((): void => {
          this.xcomponentController.setXComponentSurfaceRect({surfaceWidth:1920,surfaceHeight:1080});
          this.surfaceId = this.xcomponentController.getXComponentSurfaceId()
          console.log(this.surfaceId)
        })
        .width('640px')
        .height('480px')
        .margin(5)

      XComponent({
        id: 'xcomponent3',
        type: XComponentType.TEXTURE,
        nativeXComponentHandler: ((value0: long): void => {}),
        controller: this.xcomponentController
      } as XComponentParameters).id('xcomponent_3')
        .onLoad((): void => {
          this.xcomponentController.setXComponentSurfaceRect({surfaceWidth:1920,surfaceHeight:1080});
          this.surfaceId = this.xcomponentController.getXComponentSurfaceId()
          console.log(this.surfaceId)
        })
        .width('640px')
        .height('480px')
        .margin(5)
    }
    .backgroundColor(Color.Black)
    .position({x: 0, y: 48} as Position)
  }
}