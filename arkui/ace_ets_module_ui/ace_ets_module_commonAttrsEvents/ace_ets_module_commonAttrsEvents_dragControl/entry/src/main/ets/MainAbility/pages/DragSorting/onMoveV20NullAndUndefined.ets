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
struct OnMoveV20NullAndUndefined {
  private arr: number[] = [0, 1, 2, 3, 4];

  build() {
    Column() {
      List() {
        ForEach(this.arr, (item: number) => {
          ListItem() {
            Text('' + item)
              .width('100%')
              .height('5%')
              .textAlign(TextAlign.Center)
          }
          .id('listItemV20_0_' + item)
        }, (item: number) => item.toString())
          .onMove(null, null)
      }
      .id('listOnMoveV20NullNull')
      .width('100%')
      .height('25%')

      List() {
        ForEach(this.arr, (item: number) => {
          ListItem() {
            Text('' + item + '_nu')
              .width('100%')
              .height('5%')
              .textAlign(TextAlign.Center)
          }
          .id('listItemV20_1_' + item)
        }, (item: number) => item.toString())
          .onMove(null, undefined)
      }
      .id('listOnMoveV20NullUndefined')
      .width('100%')
      .height('25%')

      List() {
        ForEach(this.arr, (item: number) => {
          ListItem() {
            Text('' + item + '_un')
              .width('100%')
              .height('5%')
              .textAlign(TextAlign.Center)
          }
          .id('listItemV20_2_' + item)
        }, (item: number) => item.toString())
          .onMove(undefined, null)
      }
      .id('listOnMoveV20UndefinedNull')
      .width('100%')
      .height('25%')

      List() {
        ForEach(this.arr, (item: number) => {
          ListItem() {
            Text('' + item + '_uu')
              .width('100%')
              .height('5%')
              .textAlign(TextAlign.Center)
          }
          .id('listItemV20_3_' + item)
        }, (item: number) => item.toString())
          .onMove(undefined, undefined)
      }
      .id('listOnMoveV20UndefinedUndefined')
      .width('100%')
      .height('25%')
    }
    .width('100%')
    .height('100%')
  }
}
