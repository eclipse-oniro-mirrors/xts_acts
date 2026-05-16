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
struct TextPickerSelectedBackgroundStylePage {
  @State selectedIndex: number = 0;
  private apfruits: string[] = ['apple1', 'apple2', 'apple3', 'apple4'];
  private orfruits: string[] = ['orange1', 'orange2', 'orange3', 'orange4'];
  private pefruits: string[] = ['peach1', 'peach2', 'peach3', 'peach4'];
  private multi: string[][] = [this.apfruits, this.orfruits, this.pefruits];
  build() {
    Column() {
      TextPicker({
        range: this.multi,
        selected: this.selectedIndex,
      })
        .id('textPicker1')
        .selectedBackgroundStyle({
          color : Color.Red,
          borderRadius: {
            topLeft:15,
            topRight:15,
            bottomLeft:15,
            bottomRight:15
          },
        })
      TextPicker({
        range: this.multi,
        selected: this.selectedIndex,
      })
        .id('textPicker2')
        .selectedBackgroundStyle({
          color : '#FFFFFFFF',
          borderRadius : {
            topLeft: 15,
            bottomLeft: 15,
            topRight: 15,
            bottomRight: 15,
          }
        })
      TextPicker({
        range: this.multi,
        selected: this.selectedIndex,
      })
        .id('textPicker3')
        .selectedBackgroundStyle({
          color : 0xffffff,
          borderRadius : {
            topLeft: '15',
            bottomLeft: '15',
            topRight: '15',
            bottomRight: '15',
          }
        })
      TextPicker({
        range: this.multi,
        selected: this.selectedIndex,
      })
        .id('textPicker4')
        .selectedBackgroundStyle({
          color : $r('app.color.start_window_background'),
          borderRadius : {
            topLeft: $r('app.string.topLeft'),
            bottomLeft: $r('app.string.bottomLeft'),
            topRight: $r('app.string.topRight'),
            bottomRight: $r('app.string.bottomRight'),
          }
        })
      TextPicker({
        range: this.multi,
        selected: this.selectedIndex,
      })
        .id('textPicker5')
        .selectedBackgroundStyle({
          color : undefined,
          borderRadius : {
            topLeft: undefined,
            bottomLeft: undefined,
            topRight: undefined,
            bottomRight: undefined,
          }
        })
    }
  }
}