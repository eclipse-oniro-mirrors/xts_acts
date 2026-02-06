/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
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

@Entry
@Component
struct VelocityFields {
  @State count: number = 1000
  @State particle: EmitterParticleOptions<ParticleType> = {
    type: ParticleType.POINT, // 粒子类型
    config: {
      radius: 1 // 圆点半径
    },
    count: this.count, // 粒子总数
    lifetime: 9000, // 粒子生命周期，单位ms
    lifetimeRange: 100 // 粒子生命周期取值范围，单位ms
  }
  build() {
    Column() {
      Button('speedBtn').onClick(() => {
      }).margin({top: '5%'})
      Stack() {
        Text()
          .width(300).height(300).backgroundColor(Color.Black)
        Particle({
          particles: [
            {
              emitter: {
                particle: {
                  type: ParticleType.POINT, // 粒子类型
                  config: {
                    radius: 2 // 圆点半径
                  },
                  count: 1000, // 粒子总数
                  lifetime: 1000, // 粒子生命周期，单位ms
                  lifetimeRange: 0 // 粒子生命周期取值范围，单位ms
                },
                emitRate: 120, // 每秒发射粒子数
                position: [0, 0],
                size: [300, 300],
                shape: ParticleEmitterShape.RECTANGLE // 发射器形状
              },
              color: {
                range: [Color.White, Color.White], // 初始颜色范围
              },
              opacity: {
                range: [1.0, 1.0],
                updater: {
                  type: ParticleUpdater.CURVE, // 透明度按曲线变化
                  config: [
                    {
                      from: 1.0,
                      to: 0.0,
                      startMillis: 0,
                      endMillis: 1000,
                      curve: Curve.EaseIn
                    }
                  ]
                }
              },
            }
          ]
        }).width(300).height(300)
          .margin({ top: 30 })
          .velocityFields([
            {
              velocity: { x: 100, y: 0 }, // 速度场的速度值
              region: {
                // 速度场的影响区域
                shape: DisturbanceFieldShape.RECT, // 速度场影响区域的形状
                position: { x: 150, y: 150 }, // 速度场影响区域的区域中心
                size: { width: 200, height: 200 } // 速度场影响区域的大小
              }
            }
          ]).id('particleId2')
      }.width('100%').height(300).align(Alignment.Center)
    }
  }
}