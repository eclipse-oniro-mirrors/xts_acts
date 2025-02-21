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

import animator, { AnimatorResult, AnimatorOptions } from '@ohos.animator';

@Entry
@Component
struct AnimatorInterpolatingSpringTest {
  private TAG: string = '[AnimatorTest]';
  private backAnimator: AnimatorResult | undefined = undefined;
  private flag: boolean = false;
  @State wid: number = 100;
  @State hei: number = 100;
  @State velocity: number = 0;
  @State stiffnes: number = 1;
  @State damping: number = 1;
  @State curve: string = 'linear';
  @State delay: number = 0;
  @State fill: "none" | "forwards" | "backwards" | "both" = 'forwards';
  @State myDirection: "normal" | "reverse" | "alternate" | "alternate-reverse" = 'normal';
  @State iteration: number = 1;
  @State duration: number = 1000;
  @State onframenum: number = 0;
  @State onframeflag: boolean = false;
  @State numflag: string = 'null';
  useInterpolating: boolean = false;
  private animatorOption: AnimatorOptions | undefined = undefined;

  create() {
    if (this.useInterpolating == true) {
      this.curve = `interpolating-spring(${this.velocity},1,${this.stiffnes},${this.damping})`;
    } else {
      this.curve = 'linear'
    }
    this.animatorOption = {
      duration: 1000,
      easing: this.curve,
      delay: this.delay,
      fill: this.fill,
      direction: this.myDirection,
      iterations: this.iteration,
      begin: 100,
      end: 200
    };
    console.info(this.TAG, "animator create, option:" + JSON.stringify(this.animatorOption));
    this.backAnimator = animator.create(this.animatorOption);
    this.backAnimator.onfinish = () => {
      this.flag = true
      this.numflag = 'onfinish'
      console.info(this.TAG, 'backAnimator onfinish')
    }
    this.backAnimator.onrepeat = () => {
      this.numflag = 'onrepeat'
      console.info(this.TAG, 'backAnimator repeat')
    }
    this.backAnimator.oncancel = () => {
      this.numflag = 'oncancel'
      console.info(this.TAG, 'backAnimator oncancel')
    }
    this.backAnimator.onframe = (value: number) => {
      this.onframenum = value
      this.onframeflag = true
      console.info(this.TAG, 'onframe value:' + value)
      this.wid = value
      this.hei = value
    }
  }

  aboutToDisappear() {
    this.backAnimator = undefined;
  }

  aboutToAppear() {

  }

  build() {
    Scroll() {
      Column() {
        Column() {
          Text('onframe:' + this.onframeflag).key('onframe').fontSize(10)
          Text(String(this.onframenum)).key('onframe-value').fontSize(10)
          Text('backAnimator-onback:' + this.numflag).key('backAnimator-onback').fontSize(10)
          Column()
            .width(this.wid)
            .height(this.hei)
            .backgroundColor(Color.Red)
        }
        .width('100%')
        .height(210)

        Column() {
          Row() {
            Button('create')
              .key('create')
              .fontSize(10)
              .fontColor(Color.Black)
              .onClick(() => {
                this.create()
              })
            Button('play')
              .key('play')
              .fontSize(10)
              .fontColor(Color.Black)
              .onClick(() => {
                this.flag = false;
                if (this.backAnimator) {
                  console.info(this.TAG, 'animator play')
                  this.backAnimator.play()
                }
              })
            Button('pause')
              .key('pause')
              .fontSize(10)
              .fontColor(Color.Black)
              .onClick(() => {
                if (this.backAnimator) {
                  console.info(this.TAG, 'animator pause')
                  this.backAnimator.pause()
                }
              })
            Button('finish')
              .key('finish')
              .fontSize(10)
              .fontColor(Color.Black)
              .onClick(() => {
                this.flag = true;
                if (this.backAnimator) {
                  this.backAnimator.finish()
                }
              })
            Button('reverse')
              .key('reverse')
              .fontSize(10)
              .fontColor(Color.Black)
              .onClick(() => {
                this.flag = false;
                if (this.backAnimator) {
                  this.backAnimator.reverse()
                }
              })
            Button('cancel')
              .key('cancel')
              .fontSize(10)
              .fontColor(Color.Black)
              .onClick(() => {
                if (this.backAnimator) {
                  this.backAnimator.cancel()
                }
              })
          }

          Row() {
            Button('reset')
              .key('reset')
              .fontSize(10)
              .fontColor(Color.Black)
              .onClick(() => {
                if (this.flag) {
                  if (this.backAnimator) {
                    if (this.useInterpolating == true) {
                      this.curve = `interpolating-spring(${this.velocity},1,${this.stiffnes},${this.damping})`;
                    } else {
                      this.curve = 'linear';
                    }
                    this.animatorOption = {
                      duration: 2000,
                      easing: this.curve,
                      delay: this.delay,
                      fill: this.fill,
                      direction: this.myDirection,
                      iterations: this.iteration,
                      begin: 100,
                      end: 200
                    };
                    this.backAnimator.reset(this.animatorOption);
                    console.info(this.TAG, "animator create, option:" + JSON.stringify(this.animatorOption));
                  }
                } else {
                  console.info(this.TAG, "animator not ended");
                }
              })
            Column() {
              Text(`curve:${this.curve}`).key('curve')
              Row() {
                Button('interpolating-springn')
                  .key('interpolating-springn')
                  .onClick(() => {
                    this.useInterpolating = true;
                    this.curve = `interpolating-spring(${this.velocity},1,${this.stiffnes},${this.damping})`;
                  })
                Button('linear')
                  .key('linear')
                  .onClick(() => {
                    this.useInterpolating = false
                    this.curve = 'linear'
                  })
              }
            }
          }

          Column() {
            Text(`velocity:${this.velocity}`)
            Row() {
              Button('-10')
                .onClick(() => {
                  this.velocity = -10;
                })
              Button('0')
                .onClick(() => {
                  this.velocity = 0;
                })
              Button('10')
                .key('velocity')
                .onClick(() => {
                  this.velocity = 10;
                })
            }
          }

          Column() {
            Text(`stiffness:${this.stiffnes}`)
            Row() {
              Button('-1')
                .onClick(() => {
                  this.stiffnes = -1
                })
              Button('1')
                .key('stiffness')
                .onClick(() => {
                  this.stiffnes = 1
                })
              Button('228')
                .onClick(() => {
                  this.stiffnes = 228
                })
            }
          }

          Column() {
            Text(`damping:${this.damping}`)
            Row() {
              Button('-1')
                .onClick(() => {
                  this.damping = -1;
                })
              Button('1')
                .onClick(() => {
                  this.damping = 1;
                })
              Button('15')
                .key('damping')
                .onClick(() => {
                  this.damping = 15;
                })
              Button('30')
                .onClick(() => {
                  this.damping = 30;
                })
              Button('40')
                .onClick(() => {
                  this.damping = 40;
                })
            }
          }

          Column() {
            Text(`delay:${this.delay}`)
            Row() {
              Button('-500')
                .onClick(() => {
                  this.delay = -500
                })
              Button('0')
                .onClick(() => {
                  this.delay = 0
                })
              Button('500')
                .onClick(() => {
                  this.delay = 500
                })
            }
          }

          Column() {
            Text(`fill:${this.fill}`)
            Row() {
              Button('none')
                .onClick(() => {
                  this.fill = 'none'
                })
              Button('forwards')
                .onClick(() => {
                  this.fill = 'forwards'
                })
              Button('backwards')
                .onClick(() => {
                  this.fill = 'backwards'
                })
              Button('both')
                .onClick(() => {
                  this.fill = 'both'
                })
            }
          }

          Column() {
            Text(`direction:${this.myDirection}`)
            Row() {
              Button('normal').fontSize(10)
                .onClick(() => {
                  this.myDirection = 'normal'
                })
              Button('reverse').fontSize(10)
                .onClick(() => {
                  this.myDirection = 'reverse'
                })
              Button('alternate').fontSize(10)
                .onClick(() => {
                  this.myDirection = 'alternate'
                })
              Button('alternate-reverse').fontSize(10)
                .onClick(() => {
                  this.myDirection = 'alternate-reverse'
                })
            }
          }

          Column() {
            Text(`iteration:${this.iteration}`)
            Row() {
              Button('1')
                .onClick(() => {
                  this.iteration = 1;
                })
              Button('2')
                .onClick(() => {
                  this.iteration = 2;
                })
              Button('-1')
                .onClick(() => {
                  this.iteration = -1;
                })
              Button('0')
                .onClick(() => {
                  this.iteration = 0;
                })
              Button('-2')
                .onClick(() => {
                  this.iteration = -2;
                })
            }
          }
        }
      }
    }.scrollable(ScrollDirection.Vertical)
    .width('100%')
    .height('100%')
  }
}