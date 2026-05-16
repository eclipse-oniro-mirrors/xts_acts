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
struct TextPickerSelectedAreaExample {
  private select: number = 1
  private apfruits: string[] = ['apple1', 'apple2', 'apple3', 'apple4']
  @State textFlag: string = ''
  build() {
    Column() {
      Text(this.textFlag).id('textFlag').height('5%').width('90%').margin({ top: 10, bottom: 10 }).textAlign(TextAlign.Center)
      TextPicker({
        range: this.apfruits,
        selected: this.select
      }).id('textPicker')
        .width('90%')
        .height('80%')
        .onChange((value: string | string[], index: number | number[]) => {
          console.info('Picker item changed, value: ' + value + ', index: ' + index)
        })
        .onScrollStop((value: string | string[], index: number | number[]) => {
          console.info('Picker scroll stopped, value: ' + value + ', index: ' + index)
        })
        .onEnterSelectedArea((value: string | string[], index: number | number[]) => {
          this.textFlag = 'enter'
          console.info('Picker item enter selected area, value: ' + value + ', index: ' + index)
        })
        .id('textPicker')
    }.alignItems(HorizontalAlign.Center).width('100%').height('90%')
  }
}