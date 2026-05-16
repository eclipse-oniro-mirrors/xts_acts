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
import router from '@ohos.router';
import {
  Entry,
  Column,
  Component,
  Button,
  ClickEvent,
  Text,FlexDirection,ItemAlign,Divider,$r,$$,MenuItem,BlurStyleActivePolicy,AdaptiveColor,ThemeColorMode,MenuElement,
  Row,AlertDialogParamWithButtons,FlexOptions,ColumnOptions,RowOptions,Flex,Builder,MenuItemOptions,ResourceStr,Menu,BackgroundBlurStyleOptions,BlurStyle,
  Scroll,FontWeight,TextAlign,ForEach,ListItem,LocalizedBorderRadiuses,$$,SheetOptions,FlexAlign,CustomDialogController,TextInput,CustomDialogControllerOptions,
  ButtonType,Scroller,Color,Rectangle,ActionSheetOptions,ControlSize,DialogAlignment,TextInputController,Margin,BorderRadiuses
} from '@ohos.arkui.component'
import { LevelMode } from '@ohos.promptAction';
import {
  State,
  Link,
  PropRef,
  Observed,
  ObjectLink,
} from '@ohos.arkui.stateManagement'
import { UIContext, Router,KeyboardAvoidMode,PromptAction } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
import { BuilderNode,FrameNode } from '@ohos.arkui.node';
import { LengthMetrics,ComponentContent } from '@ohos.arkui.node';
import { Callback,BusinessError } from '@ohos.base';
import { Router } from '@ohos.arkui.UIContext';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { Hypium } from '../../../../../hypium';
import testsuite from '../../../../src/test/List.test'

@Entry
@Component
struct Index {

  aboutToAppear(){
    try {
      let router1 = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', router1);
    } catch (error) {
      console.log('error ' + error);
    }
  }

  build() {
    Flex({ direction:FlexDirection.Column, alignItems:ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Text('Hello World')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
      Button('') {
        Text('next page')
          .fontSize(25)
          .fontWeight(FontWeight.Bold)
      }.type(ButtonType.Capsule)
      .margin({
        top: 20
      } as Margin)
      .backgroundColor('#0D9FFB')
      .onClick(():void => {

      })
    }
    .width('100%')
    .height('100%')
  }
}