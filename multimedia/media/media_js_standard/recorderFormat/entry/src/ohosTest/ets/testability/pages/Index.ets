/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import router from '@ohos.router';

@Entry
@Component
struct Index {
  aboutToAppear() {
    console.info('TestAbility index aboutToAppear')
  }
  @State message: string = 'Hello World'
  private surfaceId: string = ''
  private xComponentContext: Record<string, () => void> = {}
  xComponentController: XComponentController = new XComponentController()
  private surfaceId2: string = ''
  private xComponentContext2: Record<string, () => void> = {}
  xComponentController2: XComponentController = new XComponentController()
  build() {
    Row() {
      XComponent({
        id: 'xcomponent',
        type: XComponentType.SURFACE,
        controller: this.xComponentController
      })
        .onLoad(() => {
          this.xComponentController.setXComponentSurfaceSize({ surfaceWidth: 640, surfaceHeight: 480 })
          this.surfaceId = this.xComponentController.getXComponentSurfaceId()
          this.xComponentContext = this.xComponentController.getXComponentContext() as Record<string, () => void>
          globalThis.value = this.surfaceId
        })
        .width('640px')
        .height('480px')
        .backgroundColor(Color.Red)

      XComponent({
        id: 'xcomponent2',
        type: XComponentType.SURFACE,
        controller: this.xComponentController2
      })
        .onLoad(() => {
          this.xComponentController2.setXComponentSurfaceSize({ surfaceWidth: 640, surfaceHeight: 480 })
          this.surfaceId2 = this.xComponentController2.getXComponentSurfaceId()
          this.xComponentContext2 = this.xComponentController2.getXComponentContext() as Record<string, () => void>
          globalThis.value2 = this.surfaceId2
        })
        .width('640px')
        .height('480px')
        .backgroundColor(Color.Yellow)
    }
    .backgroundColor(Color.Black)
    .position({ x: 0, y: 48 })
  }
}