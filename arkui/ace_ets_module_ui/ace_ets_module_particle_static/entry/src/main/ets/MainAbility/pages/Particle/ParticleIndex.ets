'use static';
/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { Entry, Component, Column, Text, Particle, ParticleType, DisturbanceFieldShape, FieldRegion, RippleFieldOptions, VelocityFieldOptions } from '@ohos.arkui.component';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct ParticleIndex {
  aboutToAppear() {
    try {
      let routerInstance = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', routerInstance);
    } catch (error) { console.info('[ARKUI_NEW] ParticleIndex error ' + error); }
  }
  build() {
    let rippleRegion: FieldRegion = { shape: DisturbanceFieldShape.RECT, position: { x: 0, y: 0 },
      size: { width: 100, height: 100 } };
    let rippleOpts: RippleFieldOptions = { amplitude: 10.0, wavelength: 20.0, waveSpeed: 5.0,
      attenuation: 0.5, center: { x: 50, y: 50 }, region: rippleRegion };
    let velRegion: FieldRegion = { shape: DisturbanceFieldShape.ELLIPSE, position: { x: 0, y: 0 },
      size: { width: 200, height: 200 } };
    let velOpts: VelocityFieldOptions = { velocity: { x: 0.5, y: 0.5 }, region: velRegion };
    Column() {
      Text('Particle Test').key('particleRoot').id('particleRoot').fontSize(20)
      Particle({
        particles: [{
          emitter: {
            particle: {
              type: ParticleType.POINT,
              config: { radius: 2 },
              count: 20,
            },
            emitRate: 5,
          }
        }]
      })
        .width('90%')
        .height(200)
        .rippleFields([rippleOpts])
        .velocityFields([velOpts])
        .key('particleView')
        .id('particleView')
    }.width('100%').height('100%')
  }
}
