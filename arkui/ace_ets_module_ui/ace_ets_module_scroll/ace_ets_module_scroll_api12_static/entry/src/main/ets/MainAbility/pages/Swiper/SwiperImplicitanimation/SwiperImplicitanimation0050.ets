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
  Entry,
  Component,
  SwiperController,
  Column,
  RepeatItem,
  ClickEvent,
  ColumnOptions,
  Swiper,
  Button,
  Text,
  Repeat,
  TextAlign,
  Color
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct SwiperImplicitanimation0050 {
  private swiperController: SwiperController = new SwiperController()
  @State arr: number[] = [1, 2, 3, 4, 5, 6] as number[]
  @State onAnimationStart: string = ''

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Swiper(this.swiperController) {
        Repeat<number>(this.arr)
          .each((obj: RepeatItem<number>) => {
            Text('' + obj.item)
              .textAlign(TextAlign.Center)
              .backgroundColor(Color.Orange)
              .width(400)
              .height(160)
          })
      }
      .onChange((index: int): void => {
        this.onAnimationStart = index + ''
      })

      Button('nets').onClick((event: ClickEvent) => {
        this.swiperController.showNext()
      }).id('btnswiper0050')
      Text(this.onAnimationStart).key('implicitanimation_0050')

    }
  }
}