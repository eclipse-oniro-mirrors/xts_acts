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
import { router } from '@kit.ArkUI'

@Entry
@Component
struct Index {
  build() {
    Row() {
      Column() {
        Button('ListPage')
        .fontSize(25)
        .fontWeight(FontWeight.Bold)
        .onClick(async () => {
          console.info('jump to ListPage')
          await router.pushUrl({ url: "pages/ListPage"})
          console.info('jump to ListPage over')
        })
        Button() {
          Text('navigation')
            .fontSize(25)
            .fontWeight(FontWeight.Bold)
        }
        .key('my-key2')
        .type(ButtonType.Capsule)
        .margin({ top: 20 })
        .onClick(() => {
          console.info('jump to navigation')
          router.pushUrl({url: "pages/navigation"})
          console.info('jump to navigation over')
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}

