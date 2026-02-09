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
import { AnimatorOptions, AnimatorResult } from '@ohos.animator';
import {
  Button,
  ClickEvent,
  Column,
  Component,
  Entry,
  Margin,
  Padding,
  Row
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import promptAction from '@ohos.promptAction';
@Entry
@Component
struct ColumnExample {
  @State divWidth: number = 120;
  @State divHeight: number = 120;
  @State animation1: AnimatorResult = this.getUIContext().createAnimator({
    duration: 3000,
    easing: 'ease',
    delay: 0,
    fill: 'forwards',
    direction: "normal",
    iterations: 1,
    begin: 200,
    end: 270
  } as AnimatorOptions);

  onPageShow() {
    this.animation1.onRepeat = () => {
      let repeatoptions: AnimatorOptions = {
        duration: 2000,
        easing: 'ease',
        delay: 0,
        fill: 'none',
        iterations: 1,
        direction: 'alternate',
        begin: 180,
        end: 240
      };
      this.animation1.reset(repeatoptions);
      this.animation1.play();
    };
  }

  build() {
    Column() {
      Column() {
        Column() {
          Column().width(this.divWidth).height(this.divHeight).backgroundColor(0xAFEEEE)
        }.width('100%')
      }.width('100%').padding({ top: 5 } as Padding)

      Column() {
        Row() {
          Button('play').borderRadius(8).backgroundColor(0x317aff).width(90).onClick((e: ClickEvent) => {
            this.animation1.onFrame = (value: number) => {
              this.divWidth = value
              this.divHeight = value
            };
            this.animation1.play();
          });
          Button('update').borderRadius(8).backgroundColor(0x317aff).width(90).onClick((e: ClickEvent) => {
            // let newoptions: AnimatorOptions = {
            //   duration: 5000,
            //   iterations: 2,
            //   begin: 120,
            //   end: 180
            // };
            let newoptions: AnimatorOptions = {
              duration: 5000,
              easing: 'ease',
              delay: 0,
              fill: 'none',
              direction: 'normal',
              iterations: 2,
              begin: 120,
              end: 180
            };
            this.animation1.reset(newoptions);
            this.animation1.play();
          });
          Button('create').borderRadius(8).backgroundColor(0x317aff).width(90).onClick((e: ClickEvent) => {
            let newoptions: AnimatorOptions = {
              duration: 5000,
              easing: 'friction',
              delay: 0,
              fill: 'forwards',
              direction: "normal",
              iterations: 2,
              begin: 120,
              end: 180
            };
            this.animation1.reset(newoptions);
          });
        }.margin({ top: 5 } as Margin)

        Row() {
          Button('pause').borderRadius(8).backgroundColor(0x317aff).width(90).onClick((e: ClickEvent) => {
            this.animation1.pause();
          });
          Button('finish').borderRadius(8).backgroundColor(0x317aff).width(90).onClick(() => {
            // this.animation1.onFinish = () => {
            //   this.getUIContext().showToast({
            //     message: 'finish'
            //   } as promptAction.ShowToastOptions)
            // };
            this.animation1.finish();
          });
        }.margin({ top: 5 } as Margin)

        Row() {
          Button('cancel').borderRadius(8).backgroundColor(0x317aff).width(90).onClick((e: ClickEvent) => {
            this.animation1.cancel();
          });
          Button('reverse').borderRadius(8).backgroundColor(0x317aff).width(90).onClick((e: ClickEvent) => {
            this.animation1.reverse();
          });
        }.margin({ top: 5 } as Margin)
      }.margin({ top: 30 } as Margin)
    }
  }
}
