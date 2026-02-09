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
import router from '@ohos.router';
import { BusinessError } from '@ohos.base';
import {
  Alignment,
  AlignRuleOption,
  Axis,
  BlurStyle,
  Builder,
  Button,
  ClickEvent,
  Color,
  Column,
  CommonMethod,
  Component,
  Configuration,
  ConstraintSizeOptions,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  FontWeight,
  ForEach,
  GeometryInfo,
  GradientDirection,
  HitTestMode,
  HorizontalAlign,
  HoverEffect,
  Image,
  ItemAlign,
  KeyEvent,
  KeyType,
  Layoutable,
  List,
  ListItem,
  LocalizedAlignRuleOptions,
  Margin,
  Measurable,
  MeasureResult,
  Navigation,
  NavigationTitleMode,
  RepeatMode,
  Row,
  Search,
  SizeResult,
  Stack,
  TapGesture,
  Text,
  TextAlign,
  TextOverflow,
  VerticalAlign
} from '@ohos.arkui.component';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage, State } from '@ohos.arkui.stateManagement';

interface RouterData {
  data?: string
  data1?: string
  data2?: RouterDataParam
}

interface RouterDataParam {
  data3?: number[]
}

@Entry
@Component
struct OhosRouterA {
  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Text('A Page')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
      Button('Push')
        .key('pushButtonA')
        .backgroundColor('#FF0B8FE2')
        .fontSize(20)
        .margin({ top: 20 } as Margin)
        .onClick((e: ClickEvent) => {

          const routerInstance = AppStorage.get<Router>("router") as Router
          routerInstance.pushUrl({
            url: 'pages/ohosRouterB',
            params: {
              data: 'B Page'
            } as RouterData
          });
        });
      Button('back')
        .key('pushButtonA')
        .backgroundColor('#FF0B8FE2')
        .fontSize(20)
        .margin({ top: 20 } as Margin)
        .onClick((e: ClickEvent) => {
          const routerInstance = AppStorage.get<Router>("router") as Router
          routerInstance.pushUrl({
            url: 'pages/ohosRouterB',
            params: {
              data: 'B Page'
            } as RouterData
          });
        });
      Button('pushUrl')
        .key('pushButtonA1')
        .backgroundColor('#FF0B8FE2')
        .fontSize(20)
        .margin({ top: 20 } as Margin)
        .onClick((e: ClickEvent) => {
          try {
            const routerInstance = AppStorage.get<Router>("router") as Router
            routerInstance.pushUrl({
              url: 'pages/routerpage2',
              params: {
                data1: 'message',
                data2: {
                  data3: [123, 456, 789]
                } as RouterDataParam,
              } as RouterData,
            })
              .then(() => {
                // success
              })
          } catch (error: Error) {
            console.error(`pushUrl args error code is ${(error as BusinessError)?.code}, message is ${(error as Error)?.message}`);
          }

        });
      Button('pushUrl')
        .key('pushButtonA1')
        .backgroundColor('#FF0B8FE2')
        .fontSize(20)
        .margin({ top: 20 } as Margin)
        .onClick((e: ClickEvent) => {
          try {
            const routerInstance = AppStorage.get<Router>("router") as Router
            routerInstance.pushUrl({
              url: 'pages/routerpage2',
              params: {
                data1: 'message',
                data2: {
                  data3: [123, 456, 789]
                } as RouterDataParam,
              } as RouterData,
            }, router.RouterMode.Standard)
              .then(() => {
                // success
              })
          } catch (error: Error) {
            console.error(`pushUrl args error code is ${(error as BusinessError)?.code}, message is ${(error as Error)?.message}`);
          }
          ;
        });

      Button('replaceUr2')
        .key('pushButtonA2')
        .backgroundColor('#FF0B8FE2')
        .fontSize(20)
        .margin({ top: 20 } as Margin)
        .onClick((e: ClickEvent) => {
          try {
            const routerInstance = AppStorage.get<Router>("router") as Router
            routerInstance.replaceUrl({
              url: 'pages/detail',
              params: {
                data1: 'message',
              } as RouterData,
            }, router.RouterMode.Standard)
              .then(() => {
                // success
              })
          } catch (error: Error) {
            console.error(`replaceUrl args error code is ${(error as BusinessError)?.code}, message is ${(error as Error)?.message}`);
          }
          ;
        });
      Button('replaceUrl')
        .key('pushButtonA1')
        .backgroundColor('#FF0B8FE2')
        .fontSize(20)
        .margin({ top: 20 } as Margin)
        .onClick((e: ClickEvent) => {
          try {
            const routerInstance = AppStorage.get<Router>("router") as Router
            routerInstance.replaceUrl({
              url: 'pages/detail',
              params: {
                data1: 'message',
              } as RouterData,
            })
              .then(() => {
                // success
              })
          } catch (error: Error) {
            console.info(`replaceUrl args error code is ${(error as BusinessError)?.code}, message is ${(error as Error)?.message}`);
          }

        });

      Button('clear')
        .key('pushButtonA')
        .backgroundColor('#FF0B8FE2')
        .fontSize(20)
        .margin({ top: 20 } as Margin)
        .onClick((e: ClickEvent) => {
          const routerInstance = AppStorage.get<Router>("router") as Router
          routerInstance.pushUrl({
            url: 'pages/ohosRouterB',
            params: {
              data: 'B Page'
            } as RouterData
          });
        });
      Button('getLength')
        .key('pushButtonA')
        .backgroundColor('#FF0B8FE2')
        .fontSize(20)
        .margin({ top: 20 } as Margin)
        .onClick((e: ClickEvent) => {
          const routerInstance = AppStorage.get<Router>("router") as Router
          routerInstance.pushUrl({
            url: 'pages/ohosRouterB',
            params: {
              data: 'B Page'
            } as RouterData
          });
        });
      Button('enableAlertBeforeBackPage')
        .key('pushButtonA')
        .backgroundColor('#FF0B8FE2')
        .fontSize(20)
        .margin({ top: 20 } as Margin)
        .onClick((e: ClickEvent) => {
          const routerInstance = AppStorage.get<Router>("router") as Router
          routerInstance.pushUrl({
            url: 'pages/ohosRouterB',
            params: {
              data: 'B Page'
            } as RouterData
          });
        });
      Button('enableBackPageAlert')
        .key('pushButtonA')
        .backgroundColor('#FF0B8FE2')
        .fontSize(20)
        .margin({ top: 20 } as Margin)
        .onClick((e: ClickEvent) => {
          try {
            const routerInstance = AppStorage.get<Router>("router") as Router
            routerInstance.showAlertBeforeBackPage({
              message: 'Message Info'
            });
          } catch (error: Error) {
            console.error(`enableBackPageAlert failed, code is ${(error as BusinessError)?.code}, message is ${(error as Error)?.message}`);
          }
        });

      Button('disableAlertBeforeBackPage')
        .key('pushButtonA')
        .backgroundColor('#FF0B8FE2')
        .fontSize(20)
        .margin({ top: 20 } as Margin)
        .onClick((e: ClickEvent) => {
          const routerInstance = AppStorage.get<Router>("router") as Router
          routerInstance.pushUrl({
            url: 'pages/ohosRouterB',
            params: {
              data: 'B Page'
            } as RouterData
          });
        });
    }.width('100%').height('100%')
  }
}