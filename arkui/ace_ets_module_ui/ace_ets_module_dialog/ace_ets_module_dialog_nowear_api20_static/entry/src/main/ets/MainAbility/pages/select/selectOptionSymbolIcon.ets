'use static';
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
import {
  Entry,
  Text,
  Column,
  Component,
  Color,
  $r,
  ColumnOptions,
  SymbolGlyphModifier,
  SelectOption,
  ResourceStr,
  Select
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
interface SelectOptionItem  {
  value: 	ResourceStr;
  symbolIcon?: SymbolGlyphModifier;
  icon?: 	ResourceStr;
}

@Entry
@Component
struct SelectOptionSymbolIcon {
  @State textValue: string = ''
  @State symbolModifier1: SymbolGlyphModifier =
    new SymbolGlyphModifier($r('sys.symbol.ohos_wifi')).fontColor([Color.Red]);
  @State symbolModifier2: SymbolGlyphModifier =
    new SymbolGlyphModifier($r('sys.symbol.ohos_star')).fontColor([Color.Green]);
  @State options: SelectOption [] = [
    { value: 'aaa', symbolIcon: this.symbolModifier1, icon: $r('app.media.startIcon') } as SelectOption,
    { value: 'bbb', symbolIcon: undefined, icon: $r('app.media.startIcon') } as SelectOption,
    { value: 'ccc', symbolIcon: this.symbolModifier2 } as SelectOption,
    { value: 'ddd', symbolIcon: undefined } as SelectOption
  ];

  build() {
    Column({ space: 20 } as ColumnOptions) {
      Text(this.textValue).id('symbolIconValue')
      Select(this.options)
        .id('selectOptions001')
        .onSelect((index: Int, text?: string) => {
          const selectedOption:SelectOption = this.options[index];
          if (selectedOption.value === 'aaa' && selectedOption?.symbolIcon) {
            this.textValue = 'sys.symbol.ohos_wifi';
          } else if (selectedOption.value === 'ccc' && selectedOption?.symbolIcon) {
            this.textValue = 'sys.symbol.ohos_star';
          } else {
            this.textValue = ''
          }
        })
    }.width('100%')
  }
}