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
import { Entry,Column,Component,Position,Button,FlexAlign,XComponentParameters,XComponentType,VideoController,XComponent,XComponentController,SurfaceRect,ImageFit,Video,VerticalAlign,ImageAnalyzerType,ColumnOptions,Row,ClickEvent,SeekMode,PlaybackSpeed,Resource,Text,$rawfile,$r } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
@Entry
@Component
struct getXComponentSurfaceRect1 {
  private surfaceId: string = ''
  private xComponentContext: Record<string, Object> = {} as Record<string, Object>
  xComponentController: XComponentController = new XComponentController()
  //@State rect: SurfaceRect | null = null
  @State rectString: string = ''
  // public static rectStringStatic: string = ''

  build() {
    Column() {
      Text(this.rectString).id("getXComponentSurfaceRect1_text")
        .fontSize(12)
      XComponent({
        id: 'xcomponent',
        type: XComponentType.TEXTURE,
        nativeXComponentHandler: ((value0: long): void => {}),
        controller: this.xComponentController
      } as XComponentParameters)
        .onLoad((): void => {
          this.surfaceId = this.xComponentController.getXComponentSurfaceId()
          // this.xComponentContext = this.xComponentController.getXComponentContext() as Record<string, Object>
          let surfaceRect: SurfaceRect = { offsetX: 20, offsetY: 20, surfaceWidth: 500, surfaceHeight: 500 }
          console.log('JSON.stringify(surfaceRect)========' + JSON.stringify(surfaceRect))
          this.xComponentController.setXComponentSurfaceRect(surfaceRect)
          this.rectString = JSON.stringifyJsonElement(JSON.parseJsonElement(JSON.stringify(this.xComponentController.getXComponentSurfaceRect())))
          console.log('this.rectString=====' + this.rectString)
          // getXComponentSurfaceRect1.rectStringStatic = this.rectString

        })
        .width('640px')
        .height('480px')
    }
    .position({ x: 0, y: 48 } as Position)
  }
}