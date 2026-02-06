'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { CustomColors } from '@ohos.arkui.theme';
import { ResourceColor } from '@ohos.arkui.component'

export class BrownCustomThemeColors implements CustomColors {
  public brand?: ResourceColor = '#FF8B6B8A';
  public warning?: ResourceColor = '#FF8B6B5E';
  public alert?: ResourceColor = '#FF8B6B5F';
  public confirm?: ResourceColor = '#FF8B6B60';
  public fontPrimary?: ResourceColor = '#FF8B6B61';
  public fontSecondary?: ResourceColor = '#FF8B6B62';
  public fontTertiary?: ResourceColor = '#FF8B6B63';
  public fontFourth?: ResourceColor = '#FF8B6B64';
  public fontEmphasize?: ResourceColor = '#FF8B6B65';
  public fontOnPrimary?: ResourceColor = '#FF8B6B66';
  public fontOnSecondary?: ResourceColor = '#FF8B6B67';
  public fontOnTertiary?: ResourceColor = '#FF8B6B68';
  public fontOnFourth?: ResourceColor = '#FF8B6B69';
  public iconPrimary?: ResourceColor = '#FF8B6B6A';
  public iconSecondary?: ResourceColor = '#FF8B6B6B';
  public iconTertiary?: ResourceColor = '#FF8B6B6C';
  public iconFourth?: ResourceColor = '#FF8B6B6D';
  public iconEmphasize?: ResourceColor = '#FF8B6B6E';
  public iconSubEmphasize?: ResourceColor = '#FF8B6B6F';
  public iconOnPrimary?: ResourceColor = '#FF8B6B70';
  public iconOnSecondary?: ResourceColor = '#FF8B6B71';
  public iconOnTertiary?: ResourceColor = '#FF8B6B72';
  public iconOnFourth?: ResourceColor = '#FF8B6B73';
  public backgroundPrimary?: ResourceColor = '#FF8B6B74';
  public backgroundSecondary?: ResourceColor = '#FF8B6B75';
  public backgroundTertiary?: ResourceColor = '#FF8B6B76';
  public backgroundFourth?: ResourceColor = '#FF8B6B77';
  public backgroundEmphasize?: ResourceColor = '#FF8B6B78';
  public compForegroundPrimary?: ResourceColor = '#FF8B6B8B';
  public compBackgroundPrimary?: ResourceColor = '#FF8B6B79';
  public compBackgroundPrimaryTran?: ResourceColor = '#FF8B6B8C';
  public compBackgroundPrimaryContrary?: ResourceColor = '#FF8B6B7A';
  public compBackgroundGray?: ResourceColor = '#FF8B6B7B';
  public compBackgroundSecondary?: ResourceColor = '#FF8B6B7C';
  public compBackgroundTertiary?: ResourceColor = '#FF8B6B7D';
  public compBackgroundEmphasize?: ResourceColor = '#FF8B6B7E';
  public compBackgroundNeutral?: ResourceColor = '#FF8B6B7F';
  public compEmphasizeSecondary?: ResourceColor = '#FF8B6B80';
  public compEmphasizeTertiary?: ResourceColor = '#FF8B6B81';
  public compDivider?: ResourceColor = '#FF8B6B82';
  public compCommonContrary?: ResourceColor = '#FF8B6B83';
  public compBackgroundFocus?: ResourceColor = '#FF8B6B8D';
  public compFocusedPrimary?: ResourceColor = '#FF8B6B8E';
  public compFocusedSecondary?: ResourceColor = '#FF8B6B8F';
  public compFocusedTertiary?: ResourceColor = '#FF8B6B90';
  public interactiveHover?: ResourceColor = '#FF8B6B84';
  public interactivePressed?: ResourceColor = '#FF8B6B85';
  public interactiveFocus?: ResourceColor = '#FF8B6B86';
  public interactiveActive?: ResourceColor = '#FF8B6B87';
  public interactiveSelect?: ResourceColor = '#FF8B6B88';
  public interactiveClick?: ResourceColor = '#FF8B6B89';
}

export const brownThemeColors: BrownCustomThemeColors = new BrownCustomThemeColors()