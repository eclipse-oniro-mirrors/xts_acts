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
  Scroll
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
struct ParticleExample {
  @State count: int = 1000 as int;
  @State particle: EmitterParticleOptions = {
    type: ParticleType.POINT, // 粒子类型
    config: {
      radius: 1 // 圆点半径
    },
    count: this.count, // 粒子总数
    lifetime: 120000, // 粒子生命周期，单位ms
    lifetimeRange: 100 // 粒子生命周期取值范围，单位ms
  } as EmitterParticleOptions

  build() {
    Scroll() {
      Column() {
        Text('波动场')
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
        Stack() {
          Text()
          // .width(300)
          // .height(300)
            .backgroundColor(Color.Black)
          Particle(
            {
              particles: [
                {
                  emitter: {
                    particle: this.particle,
                    emitRate: 5000, // 每秒发射粒子数
                    position: [0, 0],
                    shape: ParticleEmitterShape.RECTANGLE, // 发射器形状
                    size: ['50%', '50%']
                  },
                  color: {
                    range: [Color.Pink, Color.Pink], // 初始颜色范围
                  },
                  scale: {
                    range: [0.2, 1.5], // 初始大小范围
                  },
                  opacity: {
                    range: [0.2, 0.8], // 初始透明度范围
                  }
                } as ParticleOptions
              ]
            } as Particles).width(300).height(300)
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
            ]).key('particleId')
        }
        .width('100%')
        .height(300)
        .align(Alignment.Center)
      }
    }
  }
}