/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
struct FolderStackNullUndefinedTest {
  build() {
    Column() {
      // ========== alignContent tests ==========
      Row() {
        // Valid parameters (对照)
        FolderStack() {
          Text('A')
            .width('50%')
            .height('50%')
            .backgroundColor(0xAFEEEE)
        }
        .width('30%')
        .height('60%')
        .backgroundColor(0xF0F0F0)
        .alignContent(Alignment.TopStart)
        .id('folderstack_aligncontent_valid')

        // alignContent with null
        FolderStack() {
          Text('A')
            .width('50%')
            .height('50%')
            .backgroundColor(0xAFEEEE)
        }
        .width('30%')
        .height('60%')
        .backgroundColor(0xF0F0F0)
        .alignContent(null)
        .id('folderstack_aligncontent_null')

        // alignContent with undefined
        FolderStack() {
          Text('A')
            .width('50%')
            .height('50%')
            .backgroundColor(0xAFEEEE)
        }
        .width('30%')
        .height('60%')
        .backgroundColor(0xF0F0F0)
        .alignContent(undefined)
        .id('folderstack_aligncontent_undefined')
      }
      .width('100%')
      .height('30%')
      .justifyContent(FlexAlign.SpaceEvenly)

      // ========== enableAnimation tests ==========
      Row() {
        // Valid parameters (对照)
        FolderStack() {
          Text('A')
            .width('50%')
            .height('50%')
            .backgroundColor(0xAFEEEE)
        }
        .width('20%')
        .height('60%')
        .backgroundColor(0xF0F0F0)
        .enableAnimation(true)
        .id('folderstack_enableanimation_true')

        // enableAnimation with null
        FolderStack() {
          Text('A')
            .width('50%')
            .height('50%')
            .backgroundColor(0xAFEEEE)
        }
        .width('20%')
        .height('60%')
        .backgroundColor(0xF0F0F0)
        .enableAnimation(null)
        .id('folderstack_enableanimation_null')

        // enableAnimation with undefined
        FolderStack() {
          Text('A')
            .width('50%')
            .height('50%')
            .backgroundColor(0xAFEEEE)
        }
        .width('20%')
        .height('60%')
        .backgroundColor(0xF0F0F0)
        .enableAnimation(undefined)
        .id('folderstack_enableanimation_undefined')

        // enableAnimation with false
        FolderStack() {
          Text('A')
            .width('50%')
            .height('50%')
            .backgroundColor(0xAFEEEE)
        }
        .width('20%')
        .height('60%')
        .backgroundColor(0xF0F0F0)
        .enableAnimation(false)
        .id('folderstack_enableanimation_false')
      }
      .width('100%')
      .height('30%')
      .justifyContent(FlexAlign.SpaceEvenly)

      // ========== autoHalfFold tests ==========
      Row() {
        // Valid parameters (对照)
        FolderStack() {
          Text('A')
            .width('50%')
            .height('50%')
            .backgroundColor(0xAFEEEE)
        }
        .width('20%')
        .height('60%')
        .backgroundColor(0xF0F0F0)
        .autoHalfFold(true)
        .id('folderstack_autohalffold_true')

        // autoHalfFold with null
        FolderStack() {
          Text('A')
            .width('50%')
            .height('50%')
            .backgroundColor(0xAFEEEE)
        }
        .width('20%')
        .height('60%')
        .backgroundColor(0xF0F0F0)
        .autoHalfFold(null)
        .id('folderstack_autohalffold_null')

        // autoHalfFold with undefined
        FolderStack() {
          Text('A')
            .width('50%')
            .height('50%')
            .backgroundColor(0xAFEEEE)
        }
        .width('20%')
        .height('60%')
        .backgroundColor(0xF0F0F0)
        .autoHalfFold(undefined)
        .id('folderstack_autohalffold_undefined')

        // autoHalfFold with false
        FolderStack() {
          Text('A')
            .width('50%')
            .height('50%')
            .backgroundColor(0xAFEEEE)
        }
        .width('20%')
        .height('60%')
        .backgroundColor(0xF0F0F0)
        .autoHalfFold(false)
        .id('folderstack_autohalffold_false')
      }
      .width('100%')
      .height('30%')
      .justifyContent(FlexAlign.SpaceEvenly)
    }
    .width('100%')
    .height('100%')
    .padding(2)
  }
}
