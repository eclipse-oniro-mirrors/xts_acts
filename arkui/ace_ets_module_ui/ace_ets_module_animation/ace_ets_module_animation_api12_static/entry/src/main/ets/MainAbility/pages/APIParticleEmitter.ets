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
  Alignment,
  Button,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  Curve,
  EmitterProperty,
  Entry,
  Particle,
  ParticleEmitterShape,
  ParticleType,
  ParticleUpdater,
  Stack,
  Text
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import CommonFunc from '../common/Common';

@Entry
@Component
struct APIParticleEmitter {
  @State text: string = 'start'
  @State emitterProperties: Array<EmitterProperty> = [
    {
      index: 0,
      emitRate: 100,
      position: { x: 60, y: 80 },
      size: { width: 200, height: 200 }
    } as EmitterProperty
  ]

  aboutToAppear() {
    console.log('test start page')
  }

  build() {
    Column({ space: 10 } as ColumnOptions) {
      Text(this.text)
        .fontSize(30)
        .fontWeight(700)
        .key('APIParticleEmitter_Text01')
      Stack() {
        Text()
          .width('50%')
          .height('50%')
          .backgroundColor(Color.Black)
        Stack()
        Particle({
          particles: [
            {
              emitter: {
                particle: {
                  type: ParticleType.POINT,
                  config: {
                    radius: 5
                  },
                  count: 400,
                  lifetime: -1
                },
                emitRate: 10,
                position: [0, 0],
                shape: ParticleEmitterShape.CIRCLE
              },
              color: {
                range: [Color.Red, Color.Yellow],
                updater: {
                  type: ParticleUpdater.CURVE,
                  config: [
                    {
                      from: Color.White,
                      to: Color.Pink,
                      startMillis: 0,
                      endMillis: 3000,
                      curve: Curve.EaseIn
                    },
                    {
                      from: Color.Pink,
                      to: Color.Orange,
                      startMillis: 3000,
                      endMillis: 5000,
                      curve: Curve.EaseIn
                    },
                    {
                      from: Color.Orange,
                      to: Color.Pink,
                      startMillis: 5000,
                      endMillis: 8000,
                      curve: Curve.EaseIn
                    },
                  ]
                }
              },
            },
          ]
        })
          .width('50%')
          .height('50%')
          .emitter(this.emitterProperties)
          .key('APIParticleEmitter_Particle')
      }

      Button('get content').id('APIParticleEmitter_Button')
        .onClick((e: ClickEvent) => {
          console.log('APIParticleEmitter_Button11')
          let strJson = inspector.getInspectorByKey('APIParticleEmitter_Particle');
          await CommonFunc.sleep(2000);
          if (JSON.parseJsonElement(strJson)
            .getElement('$attrs')?.getArray('emitter')
            && (JSON.parseJsonElement(strJson)
              .getElement('$attrs')?.getArray('emitter')?.length as Int) > 0) {
            this.text = JSON.parseJsonElement(strJson)
              .getElement('$attrs').getArray('emitter')[0].getString('index') + ''
          } else {
            this.text = 'does not exist'
          }
        })
    }
    .width("100%")
    .height("100%")
    .align(Alignment.Center)
  }
}