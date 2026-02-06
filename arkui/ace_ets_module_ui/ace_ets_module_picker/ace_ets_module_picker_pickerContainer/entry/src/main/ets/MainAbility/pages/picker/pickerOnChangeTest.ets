/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
struct onChangeTest {
  @State index: number = 0;
  @State selectedIndex: number = 0;
  @State color: string = '#ffff00'
  private monthArray: string[] = [];

  aboutToAppear(): void {
    for (let i = 1; i <= 12; i++) {
      this.monthArray.push(i + '月')
    }
  }

  build() {
    Row({ space: 20 }) {
      UIPickerComponent({
        selectedIndex: this.selectedIndex,
      }) {
        ForEach(this.monthArray, (item: string) => {
          Text(item)
            .textAlign(TextAlign.Center)
            .fontColor(Color.Black)
        })
      }
      .width('15%')
      .id('picker1')
      .canLoop(true)
      .onChange((index: number) => {
        console.info('Picker :onChange ' + 'index: ' + JSON.stringify(index));
        this.color = '#ff00ff'
      })
      .height('50%')
      .backgroundColor(this.color)
    }
    .height('100%')
    .width('100%')
  }
}
