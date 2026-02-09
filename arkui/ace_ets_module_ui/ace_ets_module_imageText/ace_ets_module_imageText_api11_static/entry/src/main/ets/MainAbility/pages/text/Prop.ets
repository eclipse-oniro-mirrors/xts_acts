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
import {
  Entry,
  Component,
  Flex,
  Scroll,
  Column,
  Text,
  ClickEvent,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  FontWeight,
  Button,
} from '@ohos.arkui.component'
import {
  State,
  PropRef
} from '@ohos.arkui.stateManagement'
@Entry
@Component
struct prop {
  @State value: number = 0
  private content: string = "prop Page";
  @State isPlaying: boolean = false
  @State countDownStartValue: number = 10

  onPageShow() {
    console.info('PropRef page show called');
  }

  onBuildDone() {
    console.info('PropRef page build done called');
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Scroll() {
        Column() {
          Text(`${this.content}`)
            .fontSize(50)
            .fontWeight(FontWeight.Bold)
          Column() {
            Text(`${this.countDownStartValue}`)
              .key("Text001")
            Button('+1 - Nuggets in New Game') {
              Text('+1 - Nuggets in New Game')
            }.onClick((e:ClickEvent) => {
              this.countDownStartValue += 1
            })

            Button('-1  - Nuggets in New Game') {
              Text('-1  - Nuggets in New Game')
            }.onClick((e:ClickEvent) => {
              this.countDownStartValue -= 1
            })

            CountDownComponent({ count: this.countDownStartValue, costOfOneAttempt: 2 })
          }
        }
      }
    }
    .key('flex')
    .width('100%')
    .height('100%')
  }
}

@Component
struct CountDownComponent {
  @PropRef count: number
  private costOfOneAttempt: number = 0

  build() {
    Column() {
      Text(`${this.count}`)
        .key("Text002")
    }
  }
}