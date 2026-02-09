/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
 
import { LengthMetrics } from '@kit.ArkUI';

@Entry
@Component
struct ParticleEmitter {
  @State widthSize: number = 250;
  @State heightSize: number = 100;
  @State rotateAngle: number = 0;
  @State flag: boolean = true;
  @State message: string = 'Hello World';
  @State myLifTime:number = 2000
  @State emitterProperties: Array<EmitterProperty> = [
    {
      index: 0,
      emitRate: 500,
      position: { x: 0, y: 0 },
      size: { width: 300, height: 300 },
      annulusRegion: {
        center: {x:LengthMetrics.percent(0.5), y:LengthMetrics.percent(0.5)},
        outerRadius: LengthMetrics.px(150),
        innerRadius: LengthMetrics.px(100),
        startAngle: 0,
        endAngle: 360
      }
    }
  ]

  build() {
    Column() {
      Stack() {
        Text()
          .width(300).height(300).backgroundColor(Color.Black)
        Particle({
          particles: [
            {
              emitter: {
                particle: {
                  type: ParticleType.POINT,
                  config: {
                    radius: 3
                  },
                  count: 50000,
                  lifetime: this.myLifTime,
                  lifetimeRange: 100
                },
                emitRate: 500,
                position: [0, 0],
                shape: ParticleEmitterShape.ANNULUS,//发射器形状为环形
                annulusRegion: {
                  center: {x:LengthMetrics.percent(0.5), y:LengthMetrics.percent(0.5)},
                  outerRadius: LengthMetrics.px(150),
                  innerRadius: LengthMetrics.px(100),
                  startAngle: 0,
                  endAngle: 360
                }
              },
              color: {
                range: [Color.White, Color.Blue],
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
                  ]
                }
              },
              scale: {
                range: [0.0, 0.0],
                updater: {
                  type: ParticleUpdater.CURVE,
                  config: [
                    {
                      from: 0.0,
                      to: 0.5,
                      startMillis: 0,
                      endMillis: 3000,
                      curve: Curve.EaseIn
                    }
                  ]
                }
              },
            }
          ]
        }).width(300).height(300).key('particle').emitter(this.emitterProperties)
      }.width('100%').height('50%').align(Alignment.Center)
      Button('GetInspector').id('getInspectorId').onClick(()=>{
        let filterTree =  getInspectorByKey('particle');
        if (filterTree) {
          let myjson: string = 'XHQ' + JSON.stringify(JSON.parse(filterTree)?.$attrs?.particles)
          console.log('XHQ' + JSON.stringify(JSON.parse(filterTree)?.$attrs?.particles[0]?.emitter?.annulusRegion));
          console.log('XHQ' + JSON.stringify(JSON.parse(filterTree)?.$attrs?.particles[0]?.emitter?.annulusRegion?.center?.x));
          AppStorage.setOrCreate('xValue', JSON.stringify(JSON.parse(filterTree)?.$attrs?.particles[0]?.emitter?.annulusRegion?.center?.x)); 
          console.log('XHQ' + JSON.stringify(JSON.parse(filterTree)?.$attrs?.particles[0]?.emitter?.annulusRegion?.center?.y));
          AppStorage.setOrCreate('yValue', JSON.stringify(JSON.parse(filterTree)?.$attrs?.particles[0]?.emitter?.annulusRegion?.center?.y));
          console.log('XHQ' + JSON.stringify(JSON.parse(filterTree)?.$attrs?.particles[0]?.emitter?.annulusRegion?.innerRadius));
          AppStorage.setOrCreate('innerRadius', JSON.stringify(JSON.parse(filterTree)?.$attrs?.particles[0]?.emitter?.annulusRegion?.innerRadius));
          console.log('XHQ' + JSON.stringify(JSON.parse(filterTree)?.$attrs?.particles[0]?.emitter?.annulusRegion?.outerRadius));
          AppStorage.setOrCreate('outerRadius', JSON.stringify(JSON.parse(filterTree)?.$attrs?.particles[0]?.emitter?.annulusRegion?.outerRadius));
          console.log('XHQ' + JSON.stringify(JSON.parse(filterTree)?.$attrs?.particles[0]?.emitter?.annulusRegion?.startAngle));
          AppStorage.setOrCreate('startAngle', JSON.stringify(JSON.parse(filterTree)?.$attrs?.particles[0]?.emitter?.annulusRegion?.startAngle));
          console.log('XHQ' + JSON.stringify(JSON.parse(filterTree)?.$attrs?.particles[0]?.emitter?.annulusRegion?.endAngle));
          AppStorage.setOrCreate('endAngle', JSON.stringify(JSON.parse(filterTree)?.$attrs?.particles[0]?.emitter?.annulusRegion?.endAngle));
          console.log('XHQ2' + JSON.stringify(JSON.parse(filterTree)?.$attrs?.emitter));
        }
      })
      Button('Update').onClick(()=>{
        this.flag = !this.flag
        this.emitterProperties = [
          {
            index: 0,
            emitRate: 500,
            position: { x: 0, y: 0 },
            size: { width: 300, height: 300 },
            annulusRegion: {
              center: {x:LengthMetrics.percent(0.5), y:LengthMetrics.percent(0.5)},
              outerRadius: LengthMetrics.px(this.flag?150:300),
              innerRadius: LengthMetrics.px(this.flag?100:250),
              startAngle: 0,
              endAngle: 360
            }

          }
        ]
      })
    }
    .height('100%')
    .width('100%')
  }
}