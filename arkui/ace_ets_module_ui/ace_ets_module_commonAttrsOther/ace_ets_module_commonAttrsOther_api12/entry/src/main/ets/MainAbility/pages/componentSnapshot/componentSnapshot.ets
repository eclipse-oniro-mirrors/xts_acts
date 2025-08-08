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

import componentSnapshot from '@ohos.arkui.componentSnapshot';
import image from '@ohos.multimedia.image';

@Entry
@Component
struct ComponentSnapshotExample {
  @State pixmap: image.PixelMap | undefined = undefined
  @State waitUntilRenderFinished: boolean = false

  build() {
    Column() {
      Row() {
        Image(this.pixmap).width(20).height(20).border({ color: Color.Black, width: 2 }).margin(5)
        Image($r('app.media.icon')).autoResize(true).width(20).height(20).margin(5).id("root")
      }
      Button(this.waitUntilRenderFinished.toString()).id('ComponentSnapshot_id')
        .onClick(() => {
          this.waitUntilRenderFinished = true
          componentSnapshot.get('root', {scale : 2, waitUntilRenderFinished : this.waitUntilRenderFinished})
            .then((pixmap: image.PixelMap) => {
              this.pixmap = pixmap
            }).catch((err:Error) => {
            console.log('error: ' + err)
          })
        }).margin(10)
    }
    .width('100%')
    .height('100%')
    .alignItems(HorizontalAlign.Center)
  }
}