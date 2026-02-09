'use static';
/*
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

import { PageInfo, Router, UIContext } from '@ohos.arkui.UIContext';
import {
  $$,
  $r,
  Alignment,
  BindOptions,
  Button,
  ButtonType,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  FlexOptions,
  FontWeight,
  HorizontalAlign,
  Image,
  ItemAlign,
  Margin,
  NavDestination,
  Navigation,
  NavPathStack,
  Row,
  Scroll,
  SheetOptions,
  SheetType,
  Text,
  TextAlign,
  TextArea
} from '@ohos.arkui.component'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { AppStorage, Link, Provide, State } from '@ohos.arkui.stateManagement';
import { Hypium } from '../../../../../hypium/index';

@Entry
@Component
struct getPageInfoByUniqueIdExample {
  @Provide({ alias: 'pageInfos' }) pageInfos: NavPathStack = new NavPathStack();

  build() {
    Column() {
      Navigation(this.pageInfos) {
        NavDestination() {
          MyComponentUniqueId()
        }
      }.id('getNavigationInfoByUniqueId_id')
    }
  }
}

@Component
struct MyComponentUniqueId {
  @State pageInfo1: string = 'Init'
  @State navigationInfo: string = 'Init'

  build() {
    Column() {
      Button(this.pageInfo1).id('getPageInfoByUniqueId')
      Button(this.navigationInfo).id('getNavigationInfoByUniqueId')
        .onClick((e: ClickEvent) => {
          try {
            const uiContext: UIContext = this.getUIContext();
            const uniqueId: Int = this.getUniqueId();
            console.log('test start getData uniqueId is: ' + uniqueId)

            const pageInfo: PageInfo = uiContext.getPageInfoByUniqueId(uniqueId);
            // console.log('test start getData pageInfo is: ' + JSON.stringify(pageInfo))

            this.pageInfo1 = '' + JSON.stringify(pageInfo.routerPageInfo?.index)
            // console.info('test start getData pageInfo is: ' + this.pageInfo);

            this.navigationInfo = '' + JSON.stringify(uiContext.getNavigationInfoByUniqueId(uniqueId)?.navigationId)
            // console.info('navigationInfo: ' + this.navigationInfo);
          } catch (err) {
            console.log('test start get error is: ' + err)
          }

        })
      TextArea({
        text: this.navigationInfo
      })
        .width('100%')
        .height(100)
    }
    .width('100%')
    .alignItems(HorizontalAlign.Center)
  }
}