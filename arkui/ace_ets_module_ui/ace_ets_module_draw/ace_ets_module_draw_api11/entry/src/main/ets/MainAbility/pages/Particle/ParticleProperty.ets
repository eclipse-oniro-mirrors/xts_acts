/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

@Entry
@Component
struct ParticleExample {
  @State
  myCount : number = 100
  flag : boolean = false;
  build() {
    Column(){
      Stack() {
        Particle({particles:[
          {
            emitter:{
              particle:{
                type:ParticleType.IMAGE,
                config:{
                  src:$r("app.media.icon"),
                  size:[10,10]
                },
                count: this.myCount,
                lifetime:10000
              },
              emitRate:3,
              shape:ParticleEmitterShape.CIRCLE
            },
            color:{
              range:[Color.White,Color.White]
            },
            opacity:{
              range:[1.0,1.0],
              updater:{
                type:ParticleUpdater.CURVE,
                config:[
                  {
                    from:0,
                    to:1.0,
                    startMillis:0,
                    endMillis:6000
                  },
                  {
                    from:1.0,
                    to:.0,
                    startMillis:6000,
                    endMillis:10000
                  }
                ]
              }
            },
            scale:{
              range:[0.1,1.0],
              updater:{
                type:ParticleUpdater.CURVE,
                config:[
                  {
                    from: 0,
                    to: 1.5,
                    startMillis: 0,
                    endMillis: 8000,
                    curve: Curve.EaseIn
                  }

                ]
              }
            },
            velocity:{
              speed:[1.0,0.0],
              angle:[2.0,0.0]
            },
            acceleration:{
              speed:{
                range:[3,9],
                updater:{
                  type: ParticleUpdater.RANDOM,
                  config:[
                    {
                      from:10,
                      to:20,
                      startMillis:0,
                      endMillis:3000,
                      curve:Curve.EaseIn
                    },
                    {
                      from:10,
                      to:2,
                      startMillis:3000,
                      endMillis:8000,
                      curve:Curve.EaseIn
                    }
                  ]
                }
              },
              angle:{
                range:[0,180],
                updater:{
                  type:ParticleUpdater.CURVE,
                  config:[{
                    from:1,
                    to:2,
                    startMillis:0,
                    endMillis:1000,
                    curve:Curve.EaseIn
                  },
                    {
                      from:50,
                      to:-50,
                      startMillis:1000,
                      endMillis:3000,
                      curve:Curve.EaseIn
                    },
                    {
                      from:3,
                      to:5,
                      startMillis:3000,
                      endMillis:8000,
                      curve:Curve.EaseIn
                    }
                  ]
                }
              }
            },
            spin:{
              range:[0.1,1.0],
              updater:{
                type:ParticleUpdater.NONE,
                config:[
                  {
                    from: 0,
                    to: 360,
                    startMillis: 0,
                    endMillis: 8000,
                    curve: Curve.EaseIn
                  }
                ]
              }
            },
          }
          ,{
          emitter:{
            particle:{
              type:ParticleType.IMAGE,
              config:{
                src:$r('app.media.icon'),
                size:[10,10]
              },
              count: this.myCount,
              lifetime:10000
            },
            emitRate:3,
            shape:ParticleEmitterShape.ELLIPSE
          },
          color:{
            range:[Color.White,Color.White]
          },
          opacity:{
            range:[1.0,1.0],
            updater:{
              type:ParticleUpdater.CURVE,
              config:[
                {
                  from:0,
                  to:1.0,
                  startMillis:0,
                  endMillis:6000
                },
                {
                  from:1.0,
                  to:.0,
                  startMillis:6000,
                  endMillis:10000
                }
              ]
            }
          },
          scale:{
            range:[0.1,1.0],
            updater:{
              type:ParticleUpdater.CURVE,
              config:[
                {
                  from: 0,
                  to: 2.0,
                  startMillis: 0,
                  endMillis: 10000,
                  curve: Curve.EaseIn
                }

              ]
            }
          },
          acceleration:{
            speed:{
              range:[3,9],
              updater:{
                type: ParticleUpdater.CURVE,
                config:[
                  {
                    from:10,
                    to:20,
                    startMillis:0,
                    endMillis:3000,
                    curve:Curve.EaseIn
                  },
                  {
                    from:10,
                    to:2,
                    startMillis:3000,
                    endMillis:8000,
                    curve:Curve.EaseIn
                  }
                ]
              }
            },
            angle:{
              range:[0,180],
              updater:{
                type:ParticleUpdater.CURVE,
                config:[{
                  from:1,
                  to:2,
                  startMillis:0,
                  endMillis:1000,
                  curve:Curve.EaseIn
                },
                  {
                    from:50,
                    to:-50,
                    startMillis:0,
                    endMillis:3000,
                    curve:Curve.EaseIn
                  },
                  {
                    from:3,
                    to:5,
                    startMillis:3000,
                    endMillis:10000,
                    curve:Curve.EaseIn
                  }
                ]
              }
            }
          },
          spin:{
            range:[0.1,1.0],
            updater:{
              type:ParticleUpdater.CURVE,
              config:[
                {
                  from: 0,
                  to: 360,
                  startMillis: 0,
                  endMillis: 10000,
                  curve: Curve.EaseIn
                }
              ]
            }
          },
        },{
          emitter:{
            particle:{
              type:ParticleType.IMAGE,
              config:{
                src:$r('app.media.icon'),
                size:[10,10]
              },
              count: this.myCount,
              lifetime:10000
            },
            emitRate:3,
            shape:ParticleEmitterShape.CIRCLE
          },
          color:{
            range:[Color.White,Color.White]
          },
          opacity:{
            range:[1.0,1.0],
            updater:{
              type:ParticleUpdater.CURVE,
              config:[
                {
                  from:0,
                  to:1.0,
                  startMillis:0,
                  endMillis:6000
                },
                {
                  from:1.0,
                  to:.0,
                  startMillis:6000,
                  endMillis:10000
                }
              ]
            }
          },
          scale:{
            range:[0.1,1.0],
            updater:{
              type:ParticleUpdater.CURVE,
              config:[
                {
                  from: 0,
                  to: 2.0,
                  startMillis: 0,
                  endMillis: 10000,
                  curve: Curve.EaseIn
                }

              ]
            }
          },
          acceleration:{
            speed:{
              range:[3,9],
              updater:{
                type: ParticleUpdater.CURVE,
                config:[
                  {
                    from:10,
                    to:20,
                    startMillis:0,
                    endMillis:3000,
                    curve:Curve.EaseIn
                  },
                  {
                    from:10,
                    to:2,
                    startMillis:3000,
                    endMillis:8000,
                    curve:Curve.EaseIn
                  }
                ]
              }
            },
            angle:{
              range:[0,180],
              updater:{
                type:ParticleUpdater.CURVE,
                config:[{
                  from:1,
                  to:2,
                  startMillis:0,
                  endMillis:1000,
                  curve:Curve.EaseIn
                },
                  {
                    from:50,
                    to:-50,
                    startMillis:1000,
                    endMillis:3000,
                    curve:Curve.EaseIn
                  },
                  {
                    from:3,
                    to:5,
                    startMillis:3000,
                    endMillis:8000,
                    curve:Curve.EaseIn
                  }
                ]
              }
            }
          },
          spin:{
            range:[0.1,1.0],
            updater:{
              type:ParticleUpdater.CURVE,
              config:[
                {
                  from: 0,
                  to: 360,
                  startMillis: 0,
                  endMillis: 10000,
                  curve: Curve.EaseIn
                }
              ]
            }
          },
        }
        ]
        }).width(300).height(300).id("Particle_Property").borderColor(Color.Black)
      }.width(500).height(500).align(Alignment.Center)
    }.width("100%").height("100%")

  }
}