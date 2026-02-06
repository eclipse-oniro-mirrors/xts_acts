/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2020-2020. All rights reserved.
 */
/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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
struct Index {
  @State message: string = 'Hello World';

  build() {

    Column() {
      Row() {
        XComponent({
          id: 'player',
          type: XComponentType.SURFACE,
          libraryname: 'player'
        })
          .height("100%")
          .width("100%")
          .zIndex(0)
      }
      .width("100%")
      .height(400)
      // .aspectRatio(16/9)
      .backgroundColor('#ffe30b0b')


      Row() {
        XComponent({
          id: 'playerRed',
          type: XComponentType.SURFACE,
          libraryname: 'playerRed'
        })
          .height("100%")
          .width("100%")
          .zIndex(0)
      }
      .width("100%")
      .height(200)
      .margin({ top: 20 })
      // .aspectRatio(16/9)
      .backgroundColor('#ff99de5f')
    }
    .backgroundColor('white')
    .width('100%')
    .height('100%')
    .padding({ top: 40 })
  }
}