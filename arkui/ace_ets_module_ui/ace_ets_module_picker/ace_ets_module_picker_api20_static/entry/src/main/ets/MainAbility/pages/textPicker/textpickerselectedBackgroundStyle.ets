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

import { Entry, Column, Component, Flex, FlexDirection, ItemAlign, FlexAlign, Text, Button, FontWeight,
  Row, ClickEvent, Margin, ButtonType, TextPicker,Color} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import { MessageManager, Callback } from '../../common/MessageManager';

@Entry
@Component
struct TextPickerPage {
  @State selectedIndex: number = 0;
  private apfruits: string[] = ['apple1', 'apple2', 'apple3', 'apple4'];
  private orfruits: string[] = ['orange1', 'orange2', 'orange3', 'orange4'];
  private pefruits: string[] = ['peach1', 'peach2', 'peach3', 'peach4'];
  private multi: string[][] = [this.apfruits, this.orfruits, this.pefruits];
  build() {
    Column() {
      TextPicker({
        range: this.multi,
        selected: this.selectedIndex as int,
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
    }
  }
}