'use static';
/**
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
import {
  AnimateParam,
  Button,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  Entry,
  ExpectedFrameRateRange,
  FlexAlign,
  ForEach,
  List,
  ListItem,
  Margin,
  Row,
  Scroll,
  Text
} from '@ohos.arkui.component'
import { AppStorage, Link, State, StorageLink, Watch } from '@ohos.arkui.stateManagement'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import curves from '@ohos.curves';
import router from '@ohos.router';
import common from '@ohos.app.ability.common';

interface Param {
  curve: curves.ICurve
  onFinish: () => void
}

@Entry
@Component
struct CurvePage {
  @State cube_size: Int = 50

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Column() {
      }.width(this.cube_size).height(this.cube_size).backgroundColor(Color.Black)

      Button('EaseInOut')
        .id('easeInOutId')
        .height('10%')
        .onClick(() => {
          this.getUIContext().animateTo({
            curve: curves.initCurve(curves.Curve.EaseInOut),
            onFinish: (): void => {
              this.cube_size = 30
              AppStorage.setOrCreate('cube_size', 30);
            }
          }, () => {
            this.cube_size = 200
          })
        })

      Button('FastOutSlowIn')
        .id('fastOutSlowIn')
        .height('10%')
        .onClick((e: ClickEvent) => {
          this.getUIContext().animateTo({
            curve: curves.initCurve(curves.Curve.FastOutSlowIn),
            onFinish: (): void => {
              this.cube_size = 50
              AppStorage.setOrCreate('cube_size', 50);
            }
          }, () => {
              this.cube_size = 200
            })
        })

      Button('springMotion')
        .id('springMotionId')
        .height('10%')
        .onClick((e: ClickEvent) => {
          this.getUIContext().animateTo({
            curve: curves.springMotion(0.5, 0.8, 1),
            onFinish: (): void => {
              this.cube_size = 20
              AppStorage.setOrCreate('cube_size', 20);
            }
          }, () => {
            this.cube_size = 200
          })
        })

      Button('responsiveSpringMotion')
        .id('responsiveSpringId')
        .height('10%')
        .onClick((e: ClickEvent) => {
          this.getUIContext().animateTo({
            curve: curves.responsiveSpringMotion(0.1, 0.8, 0.2),
            onFinish: (): void => {
              this.cube_size = 60
              AppStorage.setOrCreate('cube_size', 60);
            }
          }, () => {
            this.cube_size = 200
          })
        })
    }
    .width('100%')
    .margin({ top: 15 } as Margin)
  }
}

