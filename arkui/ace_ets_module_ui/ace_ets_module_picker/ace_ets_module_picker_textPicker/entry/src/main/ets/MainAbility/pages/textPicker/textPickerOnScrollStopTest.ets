/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
@Entry
@Component
struct onScrollStopTest {
  private fruits: string[] = ['apple1', 'apple2', 'apple3', 'apple4']
  private select: number | number[] = 0
  @State v: string = ''
  @State canLoop: boolean = true
  @State message: string = ''
  @State message1: string = ''

  build() {
    Column({ space: 20 }) {
      Text(this.message).id('text')
      TextPicker({ range: this.fruits })
        .id('myTextPicker')
        .canLoop(this.canLoop)
        .onScrollStop((value: string | string[], index: number | number[]) => {
          this.message = 'stop'
        })
        .height('50%')
      Divider()
    }
    .height('100%')
    .width('100%')
  }
}