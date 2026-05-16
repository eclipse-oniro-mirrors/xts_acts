'use static'
/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {
  Entry,
  Row,
  Stack,
  Text,
  Column,
  Component,
  Button,
  ClickEvent,
  GestureRecognizer,
  TouchRecognizer,
  AttributeModifier,
  CommonAttribute,
  GestureCollectIntervention,
  TapGesture,
  HitTestMode,
  TouchEvent,
  RowOptions,
  Color,
  TouchType,
  GestureCollectInterceptCallback,
  BaseGestureEvent,
  TouchTestDoneCallback,
  GestureJudgeResult,
  GestureRecognizerJudgeBeginCallback
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import {
  CommonModifier,
} from '@ohos.arkui.modifier'

@Entry
@Component
struct GestureInterceptStatic {
  @State intervention: GestureCollectIntervention = GestureCollectIntervention.CONTINUE
  @State row1: number = 0;
  @State row2: number = 0;
  @State button1: number = 0;
  @State stack: number = 0;

  build() {
    Column(){
      Stack() {
        Row() {
          Text('Background Layer')
        }
        .width('100%')
        .height('100%')
        .backgroundColor(Color.Gray)
        .id('row1')
        .onTouch((e?: TouchEvent) => {
          if (e?.type == TouchType.Down) {
            console.log('Row1 clicked');
            this.row1 = 1
          }
        })
        .hitTestBehavior(HitTestMode.Transparent)

        Row({ space: 10 } as RowOptions) {
          Button('button1')
            .onTouch((e?: TouchEvent) => {
              if (e?.type == TouchType.Down) {
                console.log('Button1 clicked');
                this.button1 = 1
              }
            })
            .id('button1')
            .hitTestBehavior(HitTestMode.Transparent)

          Button('button2')
            .id('button2')
            .onTouch((e?: TouchEvent) => {
              if (e?.type == TouchType.Down) {
                console.log('Button2 clicked');
              }
            })
            .hitTestBehavior(HitTestMode.Transparent)
        }
        .id('row2')
        .width('100%')
        .height('100%')
        .onTouch((e?: TouchEvent) => {
          if (e?.type == TouchType.Down) {
            console.log('Row2 clicked');
            this.row2 = 1
          }
        })
        .gesture(TapGesture().tag('Tap2').onAction(() => {
          console.log('recognizers  tapGesture');
        }))
        .hitTestBehavior(HitTestMode.Transparent)
        .onGestureCollectIntercept((recognizers: Array<GestureRecognizer>,
          touchRecognizers?: Array<TouchRecognizer> | undefined) => {
          if(!touchRecognizers || !recognizers) {
            return GestureCollectIntervention.CONTINUE;
          } else {
            let ii = recognizers[0].getEventTargetInfo().getUniqueId();

            for (let i = 0; i < touchRecognizers.length; i++) {
              let m = touchRecognizers[i].getEventTargetInfo().getUniqueId();
              console.log('testLog getUniqueId ' + m)
              if(touchRecognizers[i].isHostBelongsTo(ii) == true){
                console.log('testLog touchRecognizers isHostBelongsTo')
              } else if(touchRecognizers[i].isHostBelongsTo(ii) == false){
                console.log('testLog touchRecognizers not isHostBelongsTo')
              }
            }
            for (let i0 = 0; i0 < recognizers.length; i0++) {
              let n = recognizers[i0].getEventTargetInfo().getUniqueId();
              console.log('testLog getUniqueId ' + n)
              if(recognizers[i0].isHostBelongsTo(n) == true){
                console.log('testLog GestureRecognizer isHostBelongsTo')
              } else if(recognizers[i0].isHostBelongsTo(n) == false){
                console.log('testLog GestureRecognizer not isHostBelongsTo')
              }
            }
          }
          return this.intervention;
        })
      }
      .height('30%')
      .onTouch((e?: TouchEvent) => {
        if (e?.type == TouchType.Down) {
          console.log('stack clicked');
          this.stack = 1
        }
      })

      Row() {
        Button('0').onClick(() => {
          this.intervention = GestureCollectIntervention.CONTINUE
        }).layoutWeight(1).id('0')
        Button('1').onClick(() => {
          this.intervention = GestureCollectIntervention.DISCARD_LOWER
        }).layoutWeight(1).id('1')
        Button('2').onClick(() => {
          this.intervention = GestureCollectIntervention.DISCARD_HIGHER
        }).layoutWeight(1).id('2')
        Button('3').onClick(()=>{
          this.intervention = GestureCollectIntervention.DISCARD_SELF
        }).layoutWeight(1).id('3')
        Button('4').onClick(()=>{
          this.intervention = GestureCollectIntervention.DISCARD_LOWER_PRIORITY_SIBLINGS
        }).layoutWeight(1).id('4')
        Button('clear').onClick(()=>{
          this.stack = 0
          this.row1 = 0
          this.row2 = 0
          this.button1 = 0
        }).layoutWeight(1).id('clear')
      }

      Row(){
        Text('result' + this.stack + this.row1 + this.row2 + this.button1).id('InterceptTest')
      }
    }.height('80%')
  }
}
