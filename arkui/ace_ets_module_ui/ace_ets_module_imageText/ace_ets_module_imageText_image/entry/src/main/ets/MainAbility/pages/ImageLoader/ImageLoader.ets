/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { AnimatedDrawableDescriptor } from '@kit.ArkUI'
import { DrawableDescriptorLoadedResult } from '@ohos.arkui.drawableDescriptor'

@Entry
@Component
struct AnimatedDrawableDescriptorTestLoader {
  @State drawable1: DrawableDescriptor =
    new AnimatedDrawableDescriptor($r('app.media.img1'), { iterations: -1 })
  @State drawable2: DrawableDescriptor =
    new AnimatedDrawableDescriptor('xxx/xxx/xxx', { iterations: -1 })
  @State drawable3: DrawableDescriptor =
    new AnimatedDrawableDescriptor($r('app.media.img2'), { iterations: -1 })
  @State imageHeight: number = 0
  @State imageWidth: number = 0
  @State errorCode: string | Resource = ''

  build() {
    Column({ space: 10 }) {
      Row({ space: 5 }){
        Text('imageWidth')
        Text(String(this.imageWidth)).id('imageWidth')
      }
      Row({ space: 5 }){
        Text('imageHeight')
        Text(String(this.imageHeight)).id('imageHeight')
      }
      Row({ space: 5 }){
        Text('errorCode')
        Text(this.errorCode).id('errorCode')
      }

      Button('同步加载drawable')
        .height('6%')
        .id('btnLoadSync')
        .onClick(() => {
          try {
            let result = this.drawable1.loadSync()
            this.imageWidth = result.imageWidth
            this.imageHeight = result.imageHeight
          } catch (e) {
            console.info(`load failed`)
          }
        })

      Button('同步加载drawable-错误码场景')
        .height('6%')
        .id('btnLoadSyncErr')
        .onClick(() => {
          try {
            let result = this.drawable2.loadSync()
            this.imageWidth = result.imageWidth
            this.imageHeight = result.imageHeight
          } catch (e) {
            console.info(`load failed`)
            this.errorCode = e.code
          }
        })

      Button('异步加载drawable')
        .height('6%')
        .id('btnLoad')
        .onClick(() => {
          this.drawable3.load().then((result: DrawableDescriptorLoadedResult) => {
            try {
              this.imageWidth = result.imageWidth
              this.imageHeight = result.imageHeight
            } catch (error) {
              console.error('load failed')
            }
          }).catch((error: BusinessError<void>) => {
            console.error(`load failed, error = ${JSON.stringify(error)}`)
          })
        })

      Button('异步加载drawable-错误码场景')
        .height('6%')
        .id('btnLoadErr')
        .onClick(() => {
          this.drawable2.load().then((result: DrawableDescriptorLoadedResult) => {
            try {
              this.imageWidth = result.imageWidth
              this.imageHeight = result.imageHeight
            } catch (error) {
              console.error('load failed')
            }
          }).catch((error: BusinessError<void>) => {
            console.error(`load failed, error = ${JSON.stringify(error)}`)
            this.errorCode = String(error.code)
          })
        })
    }.width('100%').margin({ top:30 })
  }
}
