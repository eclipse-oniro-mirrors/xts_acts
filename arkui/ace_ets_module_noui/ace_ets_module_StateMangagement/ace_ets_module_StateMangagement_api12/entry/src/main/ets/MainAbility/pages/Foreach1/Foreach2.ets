/**
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
struct ForEachKey {
  @State simpleList: Array<string> = ['one', 'two', 'three'];
  @State simpleList2: Array<string> = ['one', 'two', 'three'];

  build() {
    Column() {
      ForEach(this.simpleList, (item: string) => {
        Text(item)
          .fontSize(9)
          .key(item)
      }, (item: string) => item)

      ForEach(this.simpleList, (item: string) => {
        Text(item)
          .fontSize(9)
          .key(item + item)
      }, (item: string, index: number) => {
        return 'same key'; // 定义相同键值
      })
    }
    .width('100%')
  }
}