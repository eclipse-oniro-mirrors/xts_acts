'use static';
/*
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
  Entry,
  Column,
  Component,
  Flex,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Text,
  Button,
  FontWeight,
  ButtonType,
  ClickEvent,
  Margin
} from '@ohos.arkui.component'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common2D from '@ohos.graphics.displaySync'

@Entry
@Component
struct Index {
  aboutToAppear() {
    try {
      let router1 = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', router1);
    } catch (error) {
      console.log('error ' + error);
    }
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Text('Hello World')
        .fontSize(50)
      Button("123") {
        Text('next page')
          .fontSize(25)
      }
      .margin({
        top: 20
      } as Margin)
      .backgroundColor('#0D9FFB')
      .onClick((e: ClickEvent) => {

      })
    }
    .width('100%')
    .height('100%')
  }
}