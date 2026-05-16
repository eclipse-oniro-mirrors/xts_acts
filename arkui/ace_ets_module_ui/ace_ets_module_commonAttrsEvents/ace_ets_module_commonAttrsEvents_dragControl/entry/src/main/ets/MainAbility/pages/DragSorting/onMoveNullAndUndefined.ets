/*
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
struct OnMoveNullAndUndefined {
  @State onMoveText: string = '';
  private arr: number[] = [0, 1, 2, 3, 4];

  build() {
    Column() {
      Text(this.onMoveText)
        .id('onMoveText')
        .width('100%')
        .height('10%')

      List({ space: '1%' }) {
        ForEach(this.arr, (item: number) => {
          ListItem() {
            Text('' + item)
              .width('100%')
              .height('5%')
              .textAlign(TextAlign.Center)
          }
          .id('listItem_' + item)
        }, (item: number) => item.toString())
          .onMove(null)
      }
      .id('listOnMoveNull')
      .width('100%')
      .height('45%')

      List({ space: '1%' }) {
        ForEach(this.arr, (item: number) => {
          ListItem() {
            Text('' + item + '_undefined')
              .width('100%')
              .height('5%')
              .textAlign(TextAlign.Center)
          }
          .id('listItemUndefined_' + item)
        }, (item: number) => item.toString())
          .onMove(undefined)
      }
      .id('listOnMoveUndefined')
      .width('100%')
      .height('45%')
    }
    .width('100%')
    .height('100%')
  }
}
