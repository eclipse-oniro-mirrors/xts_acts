/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
struct TransitionEffectOpacity {
  @State flag: boolean = true;
  @State show: string = 'show';

  build() {
    Column() {
      Button(this.show).height('5%').margin(10).id('showId')
        .onClick(() => {
          if (this.flag) {
            this.show = 'hide';
          } else {
            this.show = 'show';
          }
          this.flag = !this.flag;
        })
      if (this.flag) {
        Column() {
          Row() {
            Image($r('app.media.icon')).width('5%').height('5%')
              .transition(TransitionEffect.OPACITY.animation({ duration: 1000 }))
          }
          Image($r('app.media.icon'))
            .width('5%')
            .height('5%')
            .margin({ top: 5 })
            .transition(TransitionEffect.scale({ x: 0, y: 0 }).animation({ duration: 1000 }))
          Text('view').margin({ top: 5 })
        }
        .id('column1')
        .transition(TransitionEffect.opacity(0.99).animation({ duration: 1000 }),
          (transitionIn: boolean) => {
            console.info('transition finish, transitionIn:' + transitionIn);
          }
        )
      }
      if (this.flag) {
        Column() {
          Row() {
            Image($r('app.media.icon')).width('5%').height('5%')
              .transition(TransitionEffect.OPACITY.animation({ duration: 1000 }))
          }
          Image($r('app.media.icon'))
            .width('5%')
            .height('5%')
            .margin({ top: 5 })
            .transition(TransitionEffect.scale({ x: 1, y: 1 }).animation({ duration: 1000 }))
          Text('view').margin({ top: 5 })
        }
        .id('column2')
        .transition(TransitionEffect.opacity(0).animation({ duration: 1000 }),
          (transitionIn: boolean) => {
            console.info('transition finish, transitionIn:' + transitionIn);
          }
        )
      }
      if (this.flag) {
        Column() {
          Row() {
            Image($r('app.media.icon')).width('5%').height('5%')
              .transition(TransitionEffect.OPACITY.animation({ duration: 1000 }))
          }
          Image($r('app.media.icon'))
            .width('5%')
            .height('5%')
            .margin({ top: 5 })
            .transition(TransitionEffect.scale({ x: -1, y: -1 }).animation({ duration: 1000 }))
          Text('view').margin({ top: 5 })
        }
        .id('column3')
        .transition(TransitionEffect.opacity(-1).animation({ duration: 1000 }),
          (transitionIn: boolean) => {
            console.info('transition finish, transitionIn:' + transitionIn);
          }
        )
      }
      if (this.flag) {
        Column() {
          Row() {
            Image($r('app.media.icon')).width('5%').height('5%')
              .transition(TransitionEffect.OPACITY.animation({ duration: 1000 }))
          }
          Image($r('app.media.icon'))
            .width('5%')
            .height('5%')
            .margin({ top: 10 })
            .transition(TransitionEffect.scale({ x: 0, y: 0 }).animation({ duration: 1000 }))
          Text('view').margin({ top: 5 })
        }
        .id('column4')
        .transition(TransitionEffect.opacity(1).animation({ duration: 1000 }),
          (transitionIn: boolean) => {
            console.info('transition finish, transitionIn:' + transitionIn);
          }
        )
      }
      if (this.flag) {
        Column() {
          Row() {
            Image($r('app.media.icon')).width('5%').height('5%')
              .transition(TransitionEffect.OPACITY.animation({ duration: 1000 }))
          }
          Image($r('app.media.icon'))
            .width('5%')
            .height('5%')
            .margin({ top: 5 })
            .transition(TransitionEffect.scale({ x: 0, y: 0 }).animation({ duration: 1000 }))
        }
        .id('column5')
        .transition(TransitionEffect.opacity(2).animation({ duration: 1000 }),
          (transitionIn: boolean) => {
            console.info('transition finish, transitionIn:' + transitionIn);
          }
        )
      }
    }.width('100%')
  }
}