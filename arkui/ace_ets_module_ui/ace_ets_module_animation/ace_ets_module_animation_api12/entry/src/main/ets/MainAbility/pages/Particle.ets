@Entry
@Component
struct ParticlePage {
  build() {
    Stack() {
      Text()
        .width(100).height(100).backgroundColor(Color.Black)
      Particle({particles:[
        {
          emitter:{

            particle:{

              type:ParticleType.POINT,//粒子类型
              config:{
                radius:10//圆点半径
              },
              count: 500,//粒子总数
              lifetime:10000,//粒子生命周期，单位ms
              lifetimeRange:100//粒子生命周期取值范围，单位ms
            },
            emitRate:10,//每秒发射粒子数
            position:[0,0],
            shape:ParticleEmitterShape.RECTANGLE//发射器形状
          },
          color:{
            range:[Color.Red,Color.Yellow],//初始颜色范围
            distributionType: DistributionType.GAUSSIAN,
            updater:{
              type:ParticleUpdater.RANDOM,//变化方式为曲线变化
              config:{
                r:[1,20],
                g:[1,20],
                b:[1,20],
                a:[1,20]
              }
            }
          },
          acceleration:{//加速度的配置，从大小和方向两个维度变化，speed表示加速度大小，angle表示加速度方向
            speed:{
              range:[3,9],
              updater:{
                type:ParticleUpdater.RANDOM,
                config:[1,20]
              }
            },
            angle:{
              range:[90,90]
            }
          }

        }
      ]
      }).width(100).height(100)
        .id('particleId')


    }.width("100%").height("100%").align(Alignment.Center)
  }
}