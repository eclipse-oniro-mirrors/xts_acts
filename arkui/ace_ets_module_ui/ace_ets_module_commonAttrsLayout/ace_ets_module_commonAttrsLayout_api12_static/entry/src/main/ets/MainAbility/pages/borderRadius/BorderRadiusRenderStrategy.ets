'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { LengthMetrics } from '@ohos.arkui.node';
import {
  BorderRadiuses,
  Color,
  Column,
  ColumnOptions,
  Component,
  Entry,
  Length,
  Row,
  Button,
  Stack,
  Text,
  ClickEvent,
  RenderStrategy,
  Image,
  $r
} from '@ohos.arkui.component';
import { State, AppStorage } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct BorderRadiusRenderStrategy {
  @State render: RenderStrategy|undefined = undefined

  build() {
    Column({ space: 10 } as ColumnOptions) {
      Row(){
        Button('undefined')
          .id('RenderStrategyUndefined')
          .width('30%')
          .onClick((e: ClickEvent)=>{
            this.render = undefined
          })
        Button('FAST')
          .id('RenderStrategyFast')
          .width('30%')
          .onClick((e: ClickEvent)=>{
            this.render = RenderStrategy.FAST
          })
        Button('OFFSCREEN')
          .id('RenderStrategyOffscreen')
          .width('30%')
          .onClick((e: ClickEvent)=>{
            this.render = RenderStrategy.OFFSCREEN
          })
      }

      Stack() {
        Column()
          .width(200)
          .height(120)
          .backgroundColor(Color.Black)
        Stack() {
          Stack(){
            Row() {
              Image($r('app.media.icon')).width(100).height(100)
            }
            Column()
              .blur(10)
              .width(180)
              .height(100)
          }
        }
        .width(180)
        .height(100)
        .key('BorderRadiusRenderStrategy')
        .backgroundColor(Color.Pink)
        .borderRadius(50, this.render)
        .clip(true)
      }
    }.width('100%')
  }
}