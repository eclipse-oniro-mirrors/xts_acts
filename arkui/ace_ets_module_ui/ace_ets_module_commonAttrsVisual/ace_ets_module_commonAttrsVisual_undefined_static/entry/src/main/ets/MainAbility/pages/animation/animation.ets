'use static'
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

import {
  Entry,
  Text,
  Column,
  Component,
  Button,
  ClickEvent,
  AnimateParam,
  Curve,
  PlayMode
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct AnimationPage {
  @State isState: boolean = true;
  @State rotateAngle: number = 0;
  @State content: string = 'animation start';

  build() {
    Column() {
      Text(this.content).id('animationContent')
      Button('change animation')
        .height('20%')
        .width('90%')
        .margin('5%')
        .onClick(() => {
          this.rotateAngle = (this.rotateAngle === 0 ? 90 : 0);
        })
        .rotate({ angle: this.rotateAngle })
        .animation(this.isState ? undefined : {
          curve: Curve.EaseOut,
          playMode: PlayMode.Normal,
          onFinish: () => {
            this.content = 'animation onFinish success';
            console.log('animation onFinish success')
          }} as AnimateParam)
        .id('animationTest')
      Button('animation: ' + this.isState)
        .id('animation_change')
        .onClick((e: ClickEvent) => {
          this.isState = !this.isState
        })
    }.width(300)
    .height(300)
  }
}