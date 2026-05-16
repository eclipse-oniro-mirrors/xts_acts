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
struct RestoreIdNullAndUndefined {
  @State restoreIdText: string = '';

  build() {
    Column() {
      Text(this.restoreIdText)
        .id('restoreIdText')
        .width('100%')
        .height('10%')

      List({ space: '1%' }) {
        ForEach([0, 1, 2, 3, 4], (item: number) => {
          ListItem() {
            Text('' + item)
              .width('100%')
              .height('45%')
              .textAlign(TextAlign.Center)
          }
        }, (item: number) => item.toString())
      }
      .id('listRestoreIdNull')
      .width('100%')
      .height('20%')
      .restoreId(null)

      List({ space: '1%' }) {
        ForEach([0, 1, 2, 3, 4], (item: number) => {
          ListItem() {
            Text('' + item)
              .width('100%')
              .height('45%')
              .textAlign(TextAlign.Center)
          }
        }, (item: number) => item.toString())
      }
      .id('listRestoreIdUndefined')
      .width('100%')
      .height('20%')
      .restoreId(undefined)

      Button('Test restoreId null')
        .id('btnRestoreIdNull')
        .width('100%')
        .height('45%')
        .onClick(() => {
          this.restoreIdText = 'null';
        })

      Button('Test restoreId undefined')
        .id('btnRestoreIdUndefined')
        .width('100%')
        .height('45%')
        .onClick(() => {
          this.restoreIdText = 'undefined';
        })
    }
    .width('100%')
    .height('100%')
  }
}
