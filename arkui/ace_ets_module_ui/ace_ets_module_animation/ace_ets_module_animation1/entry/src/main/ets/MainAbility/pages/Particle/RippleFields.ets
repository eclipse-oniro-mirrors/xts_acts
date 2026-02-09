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
struct RippleFields {
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
      Button('rippleBtn').onClick(() => {
      }).margin({top: '5%'})
      Stack() {
        Text()
          .width(300).height(300).backgroundColor(Color.Black)
        Particle({
          particles: [
            {
              emitter: {
                particle: this.particle,
                emitRate: 10000, // 每秒发射粒子数
                position: [0, 0],
                shape: ParticleEmitterShape.RECTANGLE // 发射器形状
              },
              color: {
                range: [Color.White, Color.White], // 初始颜色范围
              },
              scale: {
                range: [0.2, 1.5], // 初始大小范围
              },
              opacity: {
                range: [0.2, 0.8], // 初始透明度范围
              }
            }
          ]
        }).width(300).height(300)
          .rippleFields([
            {
              amplitude: 120, // 波动场幅值
              wavelength: 500, // 波动场的波长
              waveSpeed: 220, // 波动场的波速
              center: { x: 150, y: 150 }, // 波动场的力的中心
              attenuation: 0, // 波动场随时间的衰减系数
              region: {
                // 波动场的影响区域
                shape: DisturbanceFieldShape.RECT, // 波动场影响区域的形状
                position: { x: 150, y: 150 }, // 波动场影响区域的区域中心
                size: { width: 300, height: 300 } // 波动场影响区域的大小
              }
            }
          ]).id('particleId')
      }.width('100%').height(300).align(Alignment.Center)
    }
  }
}