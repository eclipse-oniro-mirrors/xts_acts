/**
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
import { componentSnapshot } from '@kit.ArkUI';
import { image } from '@kit.ImageKit';

@Entry
@Component
struct SnapshotExample {
  @State pixmap: image.PixelMap | undefined = undefined
  @State value: string = ''
  @State init1: string = 'init'
  @State init2: string = 'init'

  build() {
    Column() {
      Row() {
        Text(this.value).key('text')
        Image(this.pixmap)
          .width('50%')
          .height('20%')
          .border({ color: Color.Black, width: 2 })
          .margin(5)
          .key('componentSnapshot')
        Image($r('app.media.icon'))
          .autoResize(true)
          .width('50%')
          .height('20%')
          .margin(5)
          .id('root')
      }

      Button('click to generate UI snapshot')
        .onClick(() => {
          try {
            let pixelmap = componentSnapshot.getSync('root', {
              scale: 2, waitUntilRenderFinished: true, region: {
                left: 20,
                right: 20,
                top: 10,
                bottom: 20
              }
            })
            this.pixmap = pixelmap
            this.value = 'suc'
          } catch (error) {
            console.error('getSync errorCode: ' + error.code + ' message: ' + error.message)
          }
        }).margin(10)
        .id('button1')

      Button(this.init1).onClick(() => {
        try {
          componentSnapshot.getSync(undefined)
        } catch (e) {
          this.init1 = e.code
          console.log(`startDataLoading errorCode: ${e.code}, errorMessage: ${e.message}`);
        }

      }).id('button2')

      Button(this.init2).onClick(() => {
        try {
          componentSnapshot.getSync("1234")
        } catch (e) {
          this.init2 = e.code
          console.log(`startDataLoading errorCode: ${e.code}, errorMessage: ${e.message}`);
        }

      }).id('button3')
    }
    .width('100%')
    .height('100%')
    .alignItems(HorizontalAlign.Center)
  }
}