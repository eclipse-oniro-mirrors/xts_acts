/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { matrix4 } from '@kit.ArkUI'

@Entry
@Component
struct followTransformOfTargetPopup {
  @State handlePopup: boolean = false
  @State followTransformOfTarget: boolean = false
  @State translateX: number = 0
  @State translateY: number = 0
  @State scaleX: number = 1
  @State scaleY: number = 1
  @State rotateAngle: number = 0

  @Builder popupBuilder() {
    Column() {
      Text('Custom Popup').fontSize('14vp').fontColor(Color.Red).fontWeight(FontWeight.Bolder)
    }
  }
  build() {
    Column({ space: 50 }) {
      Column({ space: 30 }) {
        Button('followTransformOfTarget = true')
          .id('followId')
          .onClick(() => {
            this.followTransformOfTarget = true
          })
        Button('animationBtn').id('animationBtn').onClick(() => {
          this.translateX = 200
          this.translateY = 200
          this.scaleX = 0.5
          this.scaleY = 2
          this.rotateAngle = 90
        })

        Button('popup')
          .id('popup')
          .onClick(() => {
            this.handlePopup = !this.handlePopup
          })
          .bindPopup(this.handlePopup, {
            builder:this.popupBuilder(),
            mask: false,
            autoCancel: false,
            followTransformOfTarget: this.followTransformOfTarget,
            onStateChange: (e) => {
              if (!e.isVisible) {
                this.followTransformOfTarget = false
                this.handlePopup = false
                this.translateX = 0
                this.translateY = 0
                this.scaleX = 1
                this.scaleY = 1
                this.rotateAngle = 0
              }
            },
          })
          .transform(matrix4.identity()
            .translate({ x: this.translateX, y: this.translateY })
            .scale({ x: this.scaleX, y: this.scaleY })
            .rotate({
              x: 0,
              y: 0,
              z: 1,
              angle: this.rotateAngle
            }))
      }.justifyContent(FlexAlign.Center)
      Column(){
        Text('followTransformOfTarget: '+this.followTransformOfTarget).id('followTransformOfTarget')
        Text('handlePopup: '+this.handlePopup)
        Text('rotateAngle: '+this.rotateAngle)
        Text('translateX: '+this.translateX)
        Text('translateY: '+this.translateY)
        Text('scaleX: '+this.scaleX)
        Text('scaleY: '+this.scaleY)
      }
    }.height('100%').width('100%')
  }
}