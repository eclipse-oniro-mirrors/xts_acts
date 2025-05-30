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
@ObservedV2
class InfoB {
  @Trace memberSet: Set<number> = new Set([0, 1, 2, 3, 4]);
}

@Entry
@Component
struct TrackSet {
  info: InfoB = new InfoB();

  build() {
    Row() {
      Column() {
        ForEach(Array.from(this.info.memberSet.entries()), (item: [number, string]) => {
          Text(`${item[0]}`)
            .id(`TrackSet_${item[0]}A`)
            .fontSize(9)
          Divider()
        })
        Button('init set')
          .onClick(() => {
            this.info.memberSet = new Set([0, 1, 2, 3, 4]);
          })
        Button('set new one')
          .id('TrackSet_aA')
          .onClick(() => {
            this.info.memberSet.add(5);
          })
        Button('clear')
          .onClick(() => {
            this.info.memberSet.clear();
          })
        Button('delete the first one')
          .onClick(() => {
            this.info.memberSet.delete(0);
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}