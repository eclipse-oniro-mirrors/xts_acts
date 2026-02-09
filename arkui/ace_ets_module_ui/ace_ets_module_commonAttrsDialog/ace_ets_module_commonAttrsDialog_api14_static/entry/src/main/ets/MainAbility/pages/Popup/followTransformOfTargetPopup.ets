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
import  matrix4  from '@ohos.matrix4'
import {
  Entry,
  Column,
  Component,
  Flex,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Text,
  Button,
  FontWeight,
  ButtonType,
  ClickEvent,
  Margin,
  FlexOptions,
  ColumnOptions,
  TextAlign,
  Scroll,
  Image,
  Color,
  $rawfile,
  DragEvent,
  $r,
  ResourceStr,
  HoverModeAreaType,
  DismissDialogAction,
// // CustomDialog,
// // CustomDialogController,
  TextInput,
  TextInputOptions,
  DismissReason,
  Offset,
  Builder,
  PopupOptions,
  ClickEvent,
  CustomPopupOptions,
  PopupStateChangeParam
// // PopoverDialog
// // PopoverOptions
// // AlertDialog
// // ActionSheet
// // ContextMenu
} from '@ohos.arkui.component'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage, Link } from '@ohos.arkui.stateManagement';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '../../../../../hypium/index';
import { State } from '@ohos.arkui.stateManagement'

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

  build() {
    Column({ space: 50 } as ColumnOptions) {
      Column({ space: 30 } as ColumnOptions) {
        Button('followTransformOfTarget = true')
          .id('followId')
          .onClick((e:ClickEvent) => {
            this.followTransformOfTarget = true
          })

        Button('animationBtn').id('animationBtn').onClick((e:ClickEvent) => {
          this.translateX = 100
          this.translateY = 100
          this.scaleX = 0.5
          this.scaleY = 2
          this.rotateAngle = 90
        })

        Button('popup')
          .id('popup')
          .onClick((e:ClickEvent) => {
            this.handlePopup = !this.handlePopup
          })
          .bindPopup(this.handlePopup, {
            message: 'popup',
            messageOptions: {
              textColor: Color.Red,
              font: {
                size: '14vp',
                weight: FontWeight.Bolder
              }
            },
            mask: false,
            autoCancel: false,
            followTransformOfTarget: this.followTransformOfTarget,
            onStateChange: (e:PopupStateChangeParam) => {
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
          } as PopupOptions)
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