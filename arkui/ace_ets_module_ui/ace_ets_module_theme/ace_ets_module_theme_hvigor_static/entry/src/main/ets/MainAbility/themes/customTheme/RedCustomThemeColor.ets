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

export class RedCustomThemeColors implements CustomColors {
  public brand?: ResourceColor = '#FFD53060';
  public warning?: ResourceColor = '#FFD53034';
  public alert?: ResourceColor = '#FFD53035';
  public confirm?: ResourceColor = '#FFD53036';
  public fontPrimary?: ResourceColor = '#FFD53037';
  public fontSecondary?: ResourceColor = '#FFD53038';
  public fontTertiary?: ResourceColor = '#FFD53039';
  public fontFourth?: ResourceColor = '#FFD5303A';
  public fontEmphasize?: ResourceColor = '#FFD5303B';
  public fontOnPrimary?: ResourceColor = '#FFD5303C';
  public fontOnSecondary?: ResourceColor = '#FFD5303D';
  public fontOnTertiary?: ResourceColor = '#FFD5303E';
  public fontOnFourth?: ResourceColor = '#FFD5303F';
  public iconPrimary?: ResourceColor = '#FFD53040';
  public iconSecondary?: ResourceColor = '#FFD53041';
  public iconTertiary?: ResourceColor = '#FFD53042';
  public iconFourth?: ResourceColor = '#FFD53043';
  public iconEmphasize?: ResourceColor = '#FFD53044';
  public iconSubEmphasize?: ResourceColor = '#FFD53045';
  public iconOnPrimary?: ResourceColor = '#FFD53046';
  public iconOnSecondary?: ResourceColor = '#FFD53047';
  public iconOnTertiary?: ResourceColor = '#FFD53048';
  public iconOnFourth?: ResourceColor = '#FFD53049';
  public backgroundPrimary?: ResourceColor = '#FFD5304A';
  public backgroundSecondary?: ResourceColor = '#FFD5304B';
  public backgroundTertiary?: ResourceColor = '#FFD5304C';
  public backgroundFourth?: ResourceColor = '#FFD5304D';
  public backgroundEmphasize?: ResourceColor = '#FFD5304E';
  public compForegroundPrimary?: ResourceColor = '#FFD53061';
  public compBackgroundPrimary?: ResourceColor = '#FFD5304F';
  public compBackgroundPrimaryTran?: ResourceColor = '#FFD53062';
  public compBackgroundPrimaryContrary?: ResourceColor = '#FFD53050';
  public compBackgroundGray?: ResourceColor = '#FFD53051';
  public compBackgroundSecondary?: ResourceColor = '#FFD53052';
  public compBackgroundTertiary?: ResourceColor = '#FFD53053';
  public compBackgroundEmphasize?: ResourceColor = '#FFD53054';
  public compBackgroundNeutral?: ResourceColor = '#FFD53055';
  public compEmphasizeSecondary?: ResourceColor = '#FFD53056';
  public compEmphasizeTertiary?: ResourceColor = '#FFD53057';
  public compDivider?: ResourceColor = '#FFD53058';
  public compCommonContrary?: ResourceColor = '#FFD53059';
  public compBackgroundFocus?: ResourceColor = '#FFD53063';
  public compFocusedPrimary?: ResourceColor = '#FFD53064';
  public compFocusedSecondary?: ResourceColor = '#FFD53065';
  public compFocusedTertiary?: ResourceColor = '#FFD53066';
  public interactiveHover?: ResourceColor = '#FFD5305A';
  public interactivePressed?: ResourceColor = '#FFD5305B';
  public interactiveFocus?: ResourceColor = '#FFD5305C';
  public interactiveActive?: ResourceColor = '#FFD5305D';
  public interactiveSelect?: ResourceColor = '#FFD5305E';
  public interactiveClick?: ResourceColor = '#FFD5305F';
}

export const redThemeColors: RedCustomThemeColors = new RedCustomThemeColors();