import { LengthMetrics, LengthMetricsUnit } from '@kit.ArkUI';

@Entry
@Component
struct Vector2TTest {
  private vector2T: PositionT<LengthMetrics> = {x: LengthMetrics.percent(0.5), y: LengthMetrics.percent(0.5)};
  @State myUnit: LengthMetricsUnit = LengthMetricsUnit.DEFAULT;
  @State radius: number = 1
  @State shape: ParticleEmitterShape = ParticleEmitterShape.ANNULUS
  @State emitRate: number = 200
  @State count: number = 2000000
  private timerID: number = -1
  private centerX: LengthMetrics = LengthMetrics.percent(0.6)
  private centerY: LengthMetrics = LengthMetrics.percent(0.6)
  private inRadius: LengthMetrics = LengthMetrics.vp(120)
  private outRadius: LengthMetrics = LengthMetrics.vp(120)
  private startAngle: number = 0
  private endAngle: number = 90
  @State emitterProperties: Array<EmitterProperty> = [
    {
      index: 0,
      emitRate: 100,
      annulusRegion: {
        center: this.vector2T,
        outerRadius: this.outRadius, // 圆环的外圆半径
        innerRadius: this.inRadius, // 圆环的内圆半径
        startAngle: -90, // 圆环的起始角度
        endAngle: 270 // 圆环的结束角度
      }
    }
  ]
  @State region: ParticleAnnulusRegion = {
    center: this.vector2T,
    outerRadius: this.outRadius,
    innerRadius: this.inRadius,
    startAngle: -90,
    endAngle: 270
  }

  aboutToDisappear(): void {
    // 页面销毁时清除计时器
    if (this.timerID != -1) {
      clearInterval(this.timerID);
    }
  }

  build() {
    Column({ space: 10}) {
      Stack() {
        Text().id('textId')
          .width(300+this.myUnit).height(300+this.myUnit).backgroundColor(Color.Black)
        Particle({
          particles: [
            {
              emitter: {
                particle: {
                  type: ParticleType.POINT, // 粒子类型
                  config: {
                    radius: this.radius // 圆点半径
                  },
                  count: this.count, // 粒子总数
                  lifetime: -1 // 粒子的生命周期，-1表示粒子生命周期无限大
                },
                emitRate: this.emitRate, // 每秒发射粒子数
                shape: this.shape, //发射器形状
                annulusRegion: this.region
              },
              color: {
                range: [Color.White, Color.Pink], // 初始颜色范围
              },
            },
          ]
        }).width('100%')
          .height('100%')
          .emitter(this.emitterProperties)
          .key('particleId')
          .onClick(()=>{
            // 清除已有定时器
            if (this.timerID != -1) {
              clearInterval(this.timerID);
            }

            // 创建定时器（每秒更新）
            this.timerID = setInterval(() => {
              this.emitterProperties = [
                {
                  index: 0,
                  emitRate: this.emitRate,
                  annulusRegion: {
                    center: this.vector2T,
                    outerRadius: this.outRadius,
                    innerRadius: this.inRadius,
                    startAngle: this.startAngle,
                    endAngle: this.endAngle
                  }
                }
              ];
              if (this.endAngle >= 270) {
                if (this.timerID != -1) {
                  clearInterval(this.timerID);
                }
                return;
              }
              // 更新角度值（5度/秒）
              this.startAngle += 30;
              this.endAngle += 30;
            }, 1000);

          })
      }
      .width('100%')
      .height('100%')
      .align(Alignment.Center)
    }
  }
}