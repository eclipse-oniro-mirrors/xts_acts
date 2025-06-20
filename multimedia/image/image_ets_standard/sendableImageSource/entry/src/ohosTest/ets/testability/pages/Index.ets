/*
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
struct TestIndex {
  @State message: string = 'Hello World';
  private mXComponentController: XComponentController = new XComponentController();
  private surfaceId: string = ''

  build() {
    Flex() {
      XComponent({
        id: 'CameraViewComponent',
        type: 'surface',
        controller: this.mXComponentController
      })
        .onLoad(() => {
          console.info('CameraModuleTest: OnLoad() is called')
          this.surfaceId = this.mXComponentController.getXComponentSurfaceId();
          globalThis.surfaceId = this.surfaceId
          console.info('CameraModuleTest: XComponent onLoad surfaceId :' + this.surfaceId)

        })
        .width('1920px')
        .height('1080px')
    }
  }
}