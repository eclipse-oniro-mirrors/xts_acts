'use static';

import {
  Entry,
  Text,
  Column,
  Component,
  Button,
  ClickEvent,
  Stack,
  FontWeight,
  Color,
  ClickEvent,
  Row,
  ButtonAttribute,
  Scroll,
  Margin
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import {
  EmitterParticleOptions,
  Particles,
  ParticleType,
  Particle,
  ParticleEmitterShape,
  ParticleUpdater,
  Curve,
  Padding,
  Alignment,
  RippleFieldOptions,
  DisturbanceFieldShape,
  FieldRegion,
  ColumnOptions,
  ParticleAttribute,
  ParticleOptions
} from '@kit.ArkUI'

@Entry
@Component
struct VelocityFields {
  @State count: int = 1000
  @State particle: EmitterParticleOptions = {
    type: ParticleType.POINT, // 粒子类型
    config: {
      radius: 1 // 圆点半径
    },
    count: this.count, // 粒子总数
    lifetime: 9000, // 粒子生命周期，单位ms
    lifetimeRange: 100 // 粒子生命周期取值范围，单位ms
  } as EmitterParticleOptions

  build() {
    Column() {
      Button('speedBtn').onClick(() => {
      }).margin({ top: '5%' } as Margin)
      Stack() {
        Text()
        // .width(300).height(300)
          .backgroundColor(Color.Black)
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
            } as ParticleOptions
          ]
        } as Particles)
          .width(300)
          .height(300)
          .margin({ top: 30 } as Margin)
          .velocityFields([
            {
              velocity: { x: 100, y: 100 }, // 速度场的速度值
              region: {
                // 速度场的影响区域
                shape: DisturbanceFieldShape.RECT, // 速度场影响区域的形状
                position: { x: 150, y: 150 }, // 速度场影响区域的区域中心
                size: { width: 200, height: 200 } // 速度场影响区域的大小
              } as FieldRegion
            }
          ])
          .key('particleId2')
      }
      .width('100%')
      .height(300)
      .align(Alignment.Center)
    }
  }
}
