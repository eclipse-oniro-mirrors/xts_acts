'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { Callback, MessageManager } from '../../utils/MessageManager';
import { AnimatorOptions, AnimatorResult, PlayMode } from '@ohos.animator';
import {
  Button,
  ClickEvent,
  Color,
  Column,
  Component,
  Curve,
  Entry,
  ExpectedFrameRateRange,
  FlexAlign,
  ForEach,
  List,
  ListItem,
  Margin,
  Row,
  Scroll,
  ScrollDirection,
  Text
} from '@ohos.arkui.component'
import { AppStorage, Link, State, StorageLink, Watch } from '@ohos.arkui.stateManagement'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import curves from '@ohos.curves';

class AnimatorOption implements AnimatorOptions {
  duration: Int = 0;
  easing: string = '';
  delay: Int = 0;
  fill: "none" | "forwards" | "backwards" | "both" = 'forwards';
  direction: "normal" | "reverse" | "alternate" | "alternate-reverse" = 'normal';
  iterations: Int = 0;
  begin: number = 0;
  end: number = 0;

  constructor(duration: Int, easing: string, delay: Int, fill: "none" | "forwards" | "backwards" | "both",
    direction: "normal" | "reverse" | "alternate" | "alternate-reverse", iterations: Int, begin: number,
    end: number) {
    this.duration = duration
    this.easing = easing
    this.delay = delay
    this.fill = fill
    this.direction = direction
    this.iterations = iterations
    this.begin = begin
    this.end = end
  }
}

@Entry
@Component
struct AnimatorInterpolatingSpringTest {
  @State wid: number = 100;
  @State hei: number = 100;
  @State velocity: number = 0;
  @State stiffnes: number = 1;
  @State damping: number = 1;
  @State curve: string = 'linear';
  @State delay: Int = 0;
  @State fill: "none" | "forwards" | "backwards" | "both" = 'forwards';
  @State myDirection: "normal" | "reverse" | "alternate" | "alternate-reverse" = 'normal';
  @State iteration: Int = 1;
  @State duration: number = 1000;
  @State onframenum: number = 0;
  @State onframeflag: boolean = false;
  @State numflag: string = 'null';
  useInterpolating: boolean = false;
  private TAG: string = '[AnimatorTest]';
  private backAnimator: AnimatorResult | undefined = undefined;
  private flag: boolean = false;
  private animatorOption: AnimatorOptions = new AnimatorOption(
    1000, this.curve, this.delay, this.fill, this.myDirection, this.iteration, 100, 200)

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
    this.backAnimator = this.getUIContext().createAnimator(this.animatorOption);
    if (this.backAnimator) {

      this.backAnimator!.onFinish = () => {
        this.flag = true
        this.numflag = 'onfinish'
        console.info(this.TAG, 'backAnimator onfinish')
      }
      this.backAnimator!.onRepeat = () => {
        this.numflag = 'onrepeat'
        console.info(this.TAG, 'backAnimator repeat')
      }
      this.backAnimator!.onCancel = () => {
        this.numflag = 'oncancel'
        console.info(this.TAG, 'backAnimator oncancel')
      }
      this.backAnimator!.onFrame = (value: number) => {
        this.onframenum = value
        this.onframeflag = true
        console.info(this.TAG, 'onframe value:' + value)
        this.wid = value
        this.hei = value
      }
    }
  }

  aboutToDisappear() {
    this.backAnimator = undefined;
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
              .onClick((e: ClickEvent) => {
                this.create()
              })
            Button('play')
              .key('play')
              .fontSize(10)
              .fontColor(Color.Black)
              .onClick((e: ClickEvent) => {
                this.flag = false;
                if (this.backAnimator) {
                  console.info(this.TAG, 'animator play')
                  this.backAnimator!.play()
                }
              })
            Button('pause')
              .key('pause')
              .fontSize(10)
              .fontColor(Color.Black)
              .onClick((e: ClickEvent) => {
                if (this.backAnimator) {
                  console.info(this.TAG, 'animator pause')
                  this.backAnimator!.pause()
                }
              })
          }

          Row() {
            Button('finish')
              .key('finish')
              .fontSize(10)
              .fontColor(Color.Black)
              .onClick((e: ClickEvent) => {
                this.flag = true;
                if (this.backAnimator) {
                  this.backAnimator!.finish()
                }
              })
            Button('reverse')
              .key('reverse')
              .fontSize(10)
              .fontColor(Color.Black)
              .onClick((e: ClickEvent) => {
                this.flag = false;
                if (this.backAnimator) {
                  this.backAnimator!.reverse()
                }
              })
            Button('cancel')
              .key('cancel')
              .fontSize(10)
              .fontColor(Color.Black)
              .onClick((e: ClickEvent) => {
                if (this.backAnimator) {
                  this.backAnimator!.cancel()
                }
              })
          }

          Row() {
            Button('reset')
              .key('reset')
              .fontSize(10)
              .fontColor(Color.Black)
              .onClick((e: ClickEvent) => {
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
                    this.backAnimator!.reset(this.animatorOption);
                    console.info(this.TAG, "animator create, option:" + JSON.stringify(this.animatorOption));
                  }
                } else {
                  console.info(this.TAG, "animator not ended");
                }
              })
          }

          Column() {
            Text(`curve:${this.curve}`).key('curve')
            Row() {
              Button('interpolating-springn')
                .key('interpolating-springn')
                .onClick((e: ClickEvent) => {
                  this.useInterpolating = true;
                  this.curve = `interpolating-spring(${this.velocity},1,${this.stiffnes},${this.damping})`;
                })
              Button('linear')
                .key('linear')
                .onClick((e: ClickEvent) => {
                  this.useInterpolating = false
                  this.curve = 'linear'
                })
            }
          }

          Column() {
            Text(`velocity:${this.velocity}`)
            Row() {
              Button('-10')
                .onClick((e: ClickEvent) => {
                  this.velocity = -10;
                })
              Button('0')
                .onClick((e: ClickEvent) => {
                  this.velocity = 0;
                })
              Button('10')
                .key('velocity')
                .onClick((e: ClickEvent) => {
                  this.velocity = 10;
                })
            }
          }

          Column() {
            Text(`stiffness:${this.stiffnes}`)
            Row() {
              Button('-1')
                .onClick((e: ClickEvent) => {
                  this.stiffnes = -1
                })
              Button('1')
                .key('stiffness')
                .onClick((e: ClickEvent) => {
                  this.stiffnes = 1
                })
              Button('228')
                .onClick((e: ClickEvent) => {
                  this.stiffnes = 228
                })
            }
          }

          Column() {
            Text(`damping:${this.damping}`)
            Row() {
              Button('-1')
                .onClick((e: ClickEvent) => {
                  this.damping = -1;
                })
              Button('1')
                .onClick((e: ClickEvent) => {
                  this.damping = 1;
                })
              Button('15')
                .key('damping')
                .onClick((e: ClickEvent) => {
                  this.damping = 15;
                })
            }

            Row() {
              Button('30')
                .onClick((e: ClickEvent) => {
                  this.damping = 30;
                })
              Button('40')
                .onClick((e: ClickEvent) => {
                  this.damping = 40;
                })
            }
          }

          Column() {
            Text(`delay:${this.delay}`)
            Row() {
              Button('-500')
                .onClick((e: ClickEvent) => {
                  this.delay = -500
                })
              Button('0')
                .onClick((e: ClickEvent) => {
                  this.delay = 0
                })
              Button('500')
                .onClick((e: ClickEvent) => {
                  this.delay = 500
                })
            }
          }

          Column() {
            Text(`fill:${this.fill}`)
            Row() {
              Button('none')
                .onClick((e: ClickEvent) => {
                  this.fill = 'none'
                })
              Button('forwards')
                .onClick((e: ClickEvent) => {
                  this.fill = 'forwards'
                })
            }

            Row() {
              Button('backwards')
                .onClick((e: ClickEvent) => {
                  this.fill = 'backwards'
                })
              Button('both')
                .onClick((e: ClickEvent) => {
                  this.fill = 'both'
                })
            }
          }

          Column() {
            Text(`direction:${this.myDirection}`)
            Row() {
              Button('normal').fontSize(10)
                .onClick((e: ClickEvent) => {
                  this.myDirection = 'normal'
                })
              Button('reverse').fontSize(10)
                .onClick((e: ClickEvent) => {
                  this.myDirection = 'reverse'
                })
            }

            Row() {
              Button('alternate').fontSize(10)
                .onClick((e: ClickEvent) => {
                  this.myDirection = 'alternate'
                })
              Button('alternate-reverse').fontSize(10)
                .onClick((e: ClickEvent) => {
                  this.myDirection = 'alternate-reverse'
                })
            }
          }

          Column() {
            Text(`iteration:${this.iteration}`)
            Row() {
              Button('1')
                .onClick((e: ClickEvent) => {
                  this.iteration = 1;
                })
              Button('2')
                .onClick((e: ClickEvent) => {
                  this.iteration = 2;
                })
              Button('-1')
                .onClick((e: ClickEvent) => {
                  this.iteration = -1;
                })
            }

            Row() {
              Button('0')
                .onClick((e: ClickEvent) => {
                  this.iteration = 0;
                })
              Button('-2')
                .onClick((e: ClickEvent) => {
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