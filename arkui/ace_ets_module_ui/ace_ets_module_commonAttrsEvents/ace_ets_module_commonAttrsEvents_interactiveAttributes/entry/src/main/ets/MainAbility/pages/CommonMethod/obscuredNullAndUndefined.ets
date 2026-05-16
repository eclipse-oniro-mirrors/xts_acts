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
struct ObscuredNullAndUndefined {
  @State obscuredText: string = '';

  build() {
    Column() {
      Text(this.obscuredText)
        .id('obscuredText')
        .width('100%')
        .height('10%')

      Text('Test obscured null')
        .id('btnObscuredNull')
        .width('100%')
        .height('45%')
        .obscured(null)
        .onClick(() => {
          this.obscuredText = 'null';
        })

      Text('Test obscured undefined')
        .id('btnObscuredUndefined')
        .width('100%')
        .height('45%')
        .obscured(undefined)
        .onClick(() => {
          this.obscuredText = 'undefined';
        })
    }
    .width('100%')
    .height('100%')
  }
}


