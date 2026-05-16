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
struct TransitionNullUndefinedTest {
  build() {
    Scroll(){
      Column() {
        Row(){
          Image($r('app.media.icon')).width('30%').margin({ top: 10 }).id('TransitionEffectRotateEmpty')
            .transition(TransitionEffect.rotate({centerX:'',centerY:'',angle:''}))
          Image($r('app.media.icon')).width('30%').margin({ top: 10 }).id('TransitionEffectRotateNull')
            .transition(TransitionEffect.rotate(null))
          Image($r('app.media.icon')).width('30%').margin({ top: 10 }).id('TransitionEffectRotateUndefined')
            .transition(TransitionEffect.rotate(undefined))
        }
        Row(){
          Image($r('app.media.icon')).width('30%').margin({ top: 10 }).id('TransitionEffectScaleEmpty')
            .transition(TransitionEffect.scale({centerX:'',centerY:''}))
          Image($r('app.media.icon')).width('30%').margin({ top: 10 }).id('TransitionEffectScaleNull')
            .transition(TransitionEffect.scale(null))
          Image($r('app.media.icon')).width('30%').margin({ top: 10 }).id('TransitionEffectScaleUndefined')
            .transition(TransitionEffect.scale(undefined))
        }
        Row(){
          Image($r('app.media.icon')).width('50%').margin({ top: 10 }).id('TransitionEffectOpacityNull')
            .transition(TransitionEffect.opacity(null))
          Image($r('app.media.icon')).width('50%').margin({ top: 10 }).id('TransitionEffectOpacityUndefined')
            .transition(TransitionEffect.opacity(undefined))
        }
        Row(){
          Image($r('app.media.icon')).width('50%').margin({ top: 10 }).id('TransitionEffectAsymmetricNull')
            .transition(TransitionEffect.asymmetric(null,null))
          Image($r('app.media.icon')).width('50%').margin({ top: 10 }).id('TransitionEffectAsymmetricUndefined')
            .transition(TransitionEffect.asymmetric(undefined,undefined))
        }
        Row(){
          Image($r('app.media.icon')).width('25%').margin({ top: 10 }).id('TransitionEffectAnimationNull')
            .transition(TransitionEffect.OPACITY.animation(null))
          Image($r('app.media.icon')).width('25%').margin({ top: 10 }).id('TransitionEffectAnimationUndefined')
            .transition(TransitionEffect.OPACITY.animation(undefined))
          Image($r('app.media.icon')).width('25%').margin({ top: 10 }).id('TransitionEffectAnimationEmpty1')
            .transition(TransitionEffect.OPACITY.animation({curve:'',finishCallbackType:FinishCallbackType.LOGICALLY}))
          Image($r('app.media.icon')).width('25%').margin({ top: 10 }).id('TransitionEffectAnimationEmpty2')
            .transition(TransitionEffect.OPACITY.animation({curve:'',finishCallbackType:FinishCallbackType.REMOVED}))
        }
        Row(){
          Image($r('app.media.icon')).width('50%').margin({ top: 10 }).id('TransitionEffectCombineNull')
            .transition(TransitionEffect.OPACITY.combine(null))
          Image($r('app.media.icon')).width('50%').margin({ top: 10 }).id('TransitionEffectCombineUndefined')
            .transition(TransitionEffect.OPACITY.combine(undefined))
        }
      }.width('100%')
    }
  }
}