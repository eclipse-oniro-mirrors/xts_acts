/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
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
import { CustomColors, CustomTheme } from '@ohos.arkui.theme';
import { brownThemeColors } from './customTheme/BrownCustomThemeColor';
import { greenThemeColors } from './customTheme/GreenCustomThemeColor';
import { redThemeColors } from './customTheme/RedCustomThemeColor';
import { systemColors } from './systemTheme/SystemColors';

export class CustomThemeImpl implements CustomTheme {
  public colors?: CustomColors;

  constructor(colors: CustomColors) {
    this.colors = colors;
  }
}
export const brownCustomTheme: CustomTheme = new CustomThemeImpl(brownThemeColors);
export const greenCustomTheme: CustomTheme =  new CustomThemeImpl(greenThemeColors);
export const redCustomTheme: CustomTheme =  new CustomThemeImpl(redThemeColors);
export const systemDefaultTheme: CustomTheme = new CustomThemeImpl(systemColors);