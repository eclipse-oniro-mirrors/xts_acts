/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { MessageManager, Callback } from '../../common/MessageManager';

@Entry
@Component
struct TextPickerEnableHapticFeedbackPage {
  @State enable: (boolean | undefined | null)[] = [true, false, undefined, null,];
  @State index: number = 0;
  @State selectedIndex: number = 0;
  private select: number = 1;
  private selects: number | number[] = 0;
  private apfruits: string[] = ['apple1', 'apple2', 'apple3', 'apple4'];
  private orfruits: string[] = ['orange1', 'orange2', 'orange3', 'orange4'];
  private pefruits: string[] = ['peach1', 'peach2', 'peach3', 'peach4'];
  private multi: string[][] = [this.apfruits, this.orfruits, this.pefruits];
  private fruits: string[] = ['apple1', 'orange2', 'peach3', 'grape4', 'banana5'];

  build() {
    Column() {
      TextPicker({
        range: this.multi,
        selected: this.selectedIndex,
      })
        .id('textPicker1')
        .enableHapticFeedback(true)
        .onChange((value: string | string[], index: number | number[]) => {
          console.info('TextPicker 多列:onChange ' + JSON.stringify(value) + ', ' + 'index: ' + JSON.stringify(index));
          if (typeof index === 'number') {
            this.selectedIndex = index;
          }
        })
        .divider({
          strokeWidth: 2,
          color: Color.Red,
          startMargin: 10,
          endMargin: 20,
        } as DividerOptions);
      TextPicker({
        range: this.multi,
        selected: this.selectedIndex,
      })
        .id('textPicker2')
        .enableHapticFeedback(false)
        .onChange((value: string | string[], index: number | number[]) => {
          console.info('TextPicker 多列:onChange ' + JSON.stringify(value) + ', ' + 'index: ' + JSON.stringify(index));
          if (typeof index === 'number') {
            this.selectedIndex = index;
          }
        })
        .divider({
          strokeWidth: 2,
          color: Color.Red,
          startMargin: 10,
          endMargin: 20,
        } as DividerOptions);
      TextPicker({
        range: this.multi,
        selected: this.selectedIndex,
      })
        .id('textPicker3')
        .enableHapticFeedback(undefined)
        .onChange((value: string | string[], index: number | number[]) => {
          console.info('TextPicker 多列:onChange ' + JSON.stringify(value) + ', ' + 'index: ' + JSON.stringify(index));
          if (typeof index === 'number') {
            this.selectedIndex = index;
          }
        })
        .divider({
          strokeWidth: 2,
          color: Color.Red,
          startMargin: 10,
          endMargin: 20,
        } as DividerOptions);
      TextPicker({
        range: this.multi,
        selected: this.selectedIndex,
      })
        .id('textPicker4')
        .enableHapticFeedback(null)
        .onChange((value: string | string[], index: number | number[]) => {
          console.info('TextPicker 多列:onChange ' + JSON.stringify(value) + ', ' + 'index: ' + JSON.stringify(index));
          if (typeof index === 'number') {
            this.selectedIndex = index;
          }
        })
        .divider({
          strokeWidth: 2,
          color: Color.Red,
          startMargin: 10,
          endMargin: 20,
        } as DividerOptions);
    }
  }
}