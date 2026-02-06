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
import { ResourceColor } from '@ohos.arkui.component'

export class Colors {
  public static readonly colors: Map<string, string> = new Map<string, string>([
    ['brand', 'sys.color.brand'],
    ['warning', 'sys.color.warning'],
    ['alert', 'sys.color.alert'],
    ['confirm', 'sys.color.confirm'],
    ['fontPrimary', 'sys.color.font_primary'],
    ['fontSecondary', 'sys.color.font_secondary'],
    ['fontTertiary', 'sys.color.font_tertiary'],
    ['fontFourth', 'sys.color.font_fourth'],
    ['fontEmphasize', 'sys.color.font_emphasize'],
    ['fontOnPrimary', 'sys.color.font_on_primary'],
    ['fontOnSecondary', 'sys.color.font_on_secondary'],
    ['fontOnTertiary', 'sys.color.font_on_tertiary'],
    ['fontOnFourth',  'sys.color.font_on_fourth'],
    ['iconPrimary', 'sys.color.icon_primary'],
    ['iconSecondary', 'sys.color.icon_secondary'],
    ['iconTertiary', 'sys.color.icon_tertiary'],
    ['iconFourth', 'sys.color.icon_fourth'],
    ['iconEmphasize', 'sys.color.icon_emphasize'],
    ['iconSubEmphasize', 'sys.color.icon_sub_emphasize'],
    ['iconOnPrimary', 'sys.color.icon_on_primary'],
    ['iconOnSecondary', 'sys.color.icon_on_secondary'],
    ['iconOnTertiary', 'sys.color.icon_on_tertiary'],
    ['iconOnFourth', 'sys.color.icon_on_fourth'],
    ['backgroundPrimary', 'sys.color.background_primary'],
    ['backgroundSecondary', 'sys.color.background_secondary'],
    ['backgroundTertiary', 'sys.color.background_tertiary'],
    ['backgroundFourth', 'sys.color.background_fourth'],
    ['backgroundEmphasize', 'sys.color.background_emphasize'],
    ['compForegroundPrimary', 'sys.color.comp_foreground_primary'],
    ['compBackgroundPrimary', 'sys.color.comp_background_primary'],
    ['compBackgroundPrimaryTran', 'sys.color.comp_background_primary_tran'],
    ['compBackgroundPrimaryContrary', 'sys.color.comp_background_primary_contrary'],
    ['compBackgroundGray', 'sys.color.comp_background_gray'],
    ['compBackgroundSecondary', 'sys.color.comp_background_secondary'],
    ['compBackgroundTertiary', 'sys.color.comp_background_tertiary'],
    ['compBackgroundEmphasize', 'sys.color.comp_background_emphasize'],
    ['compBackgroundNeutral', 'sys.color.neutral'],
    ['compEmphasizeSecondary', 'sys.color.comp_emphasize_secondary'],
    ['compEmphasizeTertiary', 'sys.color.comp_emphasize_tertiary'],
    ['compDivider', 'sys.color.comp_divider'],
    ['compCommonContrary', 'sys.color.comp_common_contrary'],
    ['compBackgroundFocus', 'sys.color.comp_background_focus'],
    ['compFocusedPrimary', 'sys.color.comp_focused_primary'],
    ['compFocusedSecondary', 'sys.color.comp_focused_secondary'],
    ['compFocusedTertiary', 'sys.color.comp_focused_tertiary'],
    ['interactiveHover', 'sys.color.interactive_hover'],
    ['interactivePressed', 'sys.color.interactive_pressed'],
    ['interactiveFocus', 'sys.color.interactive_focus'],
    ['interactiveActive', 'sys.color.interactive_active'],
    ['interactiveSelect', 'sys.color.interactive_select'],
    ['interactiveClick', 'sys.color.interactive_click']
  ]);
}

export interface DataClass {
  text: string;
  token: ResourceColor;
}