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
import { Theme } from '@ohos.arkui.theme';

export const frameTime = 1000;
export function sleep(time: number) {
  return new Promise((resolve: (value: string) => void) => {
    setTimeout(() => {
      resolve("ok");
    }, time);
  }).then(() => {
    console.info(`update frame over: ${time} ms`);
  })
}

export function fillMap<T>(map: Map<string, T>, keys: string[], values: T[]) {
  keys.forEach((item, index) => {
    const value: T = values[index];
    map.set(item, value);
  })
}

export interface DataClass {
  text: string;
  token: ResourceColor;
}

export function setBaseTokens(data: DataClass[], theme: Theme) {
 data.push({
    text: 'brand',
    token: theme.colors.brand,
  });
 data.push({
    text: 'warning',
    token: theme.colors.warning,
  });
 data.push({
    text: 'alert',
    token: theme.colors.alert,
  });
 data.push({
    text: 'confirm',
    token: theme.colors.confirm,
  });
}

export function setFontData(data: DataClass[], theme: Theme)  {
 data.push({
    text: 'fontPrimary',
    token: theme.colors.fontPrimary,
  });
 data.push({
    text: 'fontSecondary',
    token: theme.colors.fontSecondary,
  });
 data.push({
    text: 'fontTertiary',
    token: theme.colors.fontTertiary,
  });
 data.push({
    text: 'fontFourth',
    token: theme.colors.fontFourth,
  });
 data.push({
    text: 'fontEmphasize',
    token: theme.colors.fontEmphasize,
  });
 data.push({
    text: 'fontOnPrimary',
    token: theme.colors.fontOnPrimary,
  });
 data.push({
    text: 'fontOnSecondary',
    token: theme.colors.fontOnSecondary,
  });
 data.push({
    text: 'fontOnTertiary',
    token: theme.colors.fontOnTertiary,
  });
 data.push({
    text: 'fontOnFourth',
    token: theme.colors.fontOnFourth,
  });
}

export function setIconData(data: DataClass[], theme: Theme) {
 data.push({
    text: 'iconPrimary',
    token: theme.colors.iconPrimary,
  });
 data.push({
    text: 'iconSecondary',
    token: theme.colors.iconSecondary,
  });
 data.push({
    text: 'iconTertiary',
    token: theme.colors.iconTertiary,
  });
 data.push({
    text: 'iconFourth',
    token: theme.colors.iconFourth,
  });
 data.push({
    text: 'iconEmphasize',
    token: theme.colors.iconEmphasize,
  });
 data.push({
    text: 'iconSubEmphasize',
    token: theme.colors.iconSubEmphasize,
  });
 data.push({
    text: 'iconOnPrimary',
    token: theme.colors.iconOnPrimary,
  });
 data.push({
    text: 'iconOnSecondary',
    token: theme.colors.iconOnSecondary,
  });
 data.push({
    text: 'iconOnTertiary',
    token: theme.colors.iconOnTertiary,
  });
 data.push({
    text: 'iconOnFourth',
    token: theme.colors.iconOnFourth,
  });
}

export function setBackgroundData(data: DataClass[], theme: Theme) {
 data.push({
    text: 'backgroundPrimary',
    token: theme.colors.backgroundPrimary,
  });
 data.push({
    text: 'backgroundSecondary',
    token: theme.colors.backgroundSecondary,
  });
 data.push({
    text: 'backgroundTertiary',
    token: theme.colors.backgroundTertiary,
  });
 data.push({
    text: 'backgroundFourth',
    token: theme.colors.backgroundFourth,
  });
 data.push({
    text: 'backgroundEmphasize',
    token: theme.colors.backgroundEmphasize,
  });
}

export function setCompBackgroundData(data: DataClass[], theme: Theme) {
 data.push({
    text: 'compBackgroundPrimary',
    token: theme.colors.compBackgroundPrimary,
  });
 data.push({
    text: 'compBackgroundPrimaryTran',
    token: theme.colors.compBackgroundPrimaryTran,
  });
 data.push({
    text: 'compBackgroundPrimaryContrary',
    token: theme.colors.compBackgroundPrimaryContrary,
  });
 data.push({
    text: 'compBackgroundGray',
    token: theme.colors.compBackgroundGray,
  });
 data.push({
    text: 'compBackgroundSecondary',
    token: theme.colors.compBackgroundSecondary,
  });
 data.push({
    text: 'compBackgroundTertiary',
    token: theme.colors.compBackgroundTertiary,
  });
 data.push({
    text: 'compBackgroundEmphasize',
    token: theme.colors.compBackgroundEmphasize,
  });
 data.push({
    text: 'compBackgroundNeutral',
    token: theme.colors.compBackgroundNeutral,
  });
}

export function setCompData(data: DataClass[], theme: Theme) {
 data.push({
    text: 'compForegroundPrimary',
    token: theme.colors.compForegroundPrimary,
  });
 data.push({
    text: 'compDivider',
    token: theme.colors.compDivider,
  });
 data.push({
    text: 'compCommonContrary',
    token: theme.colors.compCommonContrary,
  });
 data.push({
    text: 'compBackgroundFocus',
    token: theme.colors.compBackgroundFocus,
  });
 data.push({
    text: 'compFocusedPrimary',
    token: theme.colors.compFocusedPrimary,
  });
 data.push({
    text: 'compFocusedSecondary',
    token: theme.colors.compFocusedSecondary,
  });
 data.push({
    text: 'compFocusedTertiary',
    token: theme.colors.compFocusedTertiary,
  });
 data.push({
    text: 'compEmphasizeSecondary',
    token: theme.colors.compEmphasizeSecondary,
  });
 data.push({
    text: 'compEmphasizeTertiary',
    token: theme.colors.compEmphasizeTertiary,
  });
}

export function setInteractiveData(data: DataClass[], theme: Theme) {
 data.push({
    text: 'interactiveHover',
    token: theme.colors.interactiveHover,
  });
 data.push({
    text: 'interactivePressed',
    token: theme.colors.interactivePressed,
  });
 data.push({
    text: 'interactiveFocus',
    token: theme.colors.interactiveFocus,
  });
 data.push({
    text: 'interactiveActive',
    token: theme.colors.interactiveActive,
  });
 data.push({
    text: 'interactiveSelect',
    token: theme.colors.interactiveSelect,
  });
 data.push({
    text: 'interactiveClick',
    token: theme.colors.interactiveClick,
  });
}
