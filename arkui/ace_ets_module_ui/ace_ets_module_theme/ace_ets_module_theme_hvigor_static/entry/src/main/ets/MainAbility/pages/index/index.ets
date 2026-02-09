'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
  Button,
  ClickEvent,
  Column,
  Component,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  FontWeight,
  ItemAlign,
  Margin,
  Row,
  Text
} from '@ohos.arkui.component'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import common2D from '@ohos.graphics.displaySync'
import common from '@ohos.app.ability.common';
import inspector from '@ohos.arkui.inspector'
import { Colors } from '../../themes/checkSystemTokens/colorValues/ColorsTokens';
import { colorsForCheck, SystemColorsFromResources } from '../themeTokensPages/SystemColorsForCheck';

export const colorValuesKey: string = 'ColorValues';

@Entry
@Component
struct Index {
  @State message: string = 'XTS Tests';
  isSetColorValues: boolean = false

  onPageShow() {
    console.log('test : colorValues index  ' + 'on page show')
    try {
      let router1 = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', router1);
      AppStorage.setOrCreate<UIContext>('uiContext', this.getUIContext());
      if (!this.isSetColorValues) {
        let colorValues: Map<string, undefined | string> = new Map<string, undefined | string>();
        Colors.colors.forEach((_item: string, key: string) => {
          const resourceJson: string = inspector.getInspectorByKey(`${key}${colorsForCheck}`);
          const checkColor = JSON.parseJsonElement(resourceJson).getElement('$attrs').getString('backgroundColor');
          colorValues.set(key, checkColor?.toString().toUpperCase());
        });
        AppStorage.setOrCreate<Map<string, undefined | string>>(colorValuesKey, colorValues);
        this.isSetColorValues = true
      }
    } catch (error) {
      console.log('error ' + error);
    }
  }

  build() {
    Row() {
      Column() {
        Text(this.message)
        SystemColorsFromResources({postfix: ''})
      }.width('100%')
    }.height('100%')
  }
}