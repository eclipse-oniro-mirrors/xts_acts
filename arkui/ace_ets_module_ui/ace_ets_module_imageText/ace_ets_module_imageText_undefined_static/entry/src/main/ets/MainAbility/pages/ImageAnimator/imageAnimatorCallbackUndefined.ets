'use static'
import {
  Entry,
  Column,
  Component,
  Button,
  Image,
  Color,
  $r,
  Row,
  ClickEvent,
  ImageAnimator,
  AnimationStatus,
  Scroller,
  Scroll,
  Blank,
  ImageFrameInfo,
  Text
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Entry
@Component
struct ImageAnimatorExample {
  scroller: Scroller = new Scroller();
  @State message: string = 'Hello World';
  @State iterationsNum: int = 1;
  @State state: AnimationStatus = AnimationStatus.Initial
  @State isOnStart: boolean = true;
  @State isOnPause: boolean = true;
  @State isOnCancel: boolean = true;
  @State isOnFinish: boolean = true;
  @State isOnRepeat: boolean = true;

  build() {
    Column() {
      Text(this.message)
        .id('ImageAnimator_text')
      ImageAnimator()
        .id('ImageAnimator')
        .images([
          {
            src: $r('app.media.background')
          } as ImageFrameInfo,
          {
            src: $r('app.media.icon'),
          } as ImageFrameInfo,
        ])
        .state(this.state)
        .width('60%')
        .height('28%')
        .iterations(this.iterationsNum)
        .onStart(this.isOnStart ? () => {
          this.message = 'onStart'
        } : undefined)
        .onPause(this.isOnPause ? () => {
          this.message = 'onPause'
        } : undefined)
        .onCancel(this.isOnCancel ? () => {
          this.message = 'onCancel'
        } : undefined)
        .onFinish(this.isOnFinish ? () => {
          this.message = 'onFinish';
        } : undefined)
        .onRepeat(this.isOnRepeat ? () => {
          this.message = 'onRepeat';
        } : undefined)

      Row() {
        Button('start').padding(5)
          .id('ImageAnimator_start')
          .onClick(() => {
            this.state = AnimationStatus.Running
          })
        Button('pause').padding(5)
          .id('ImageAnimator_pause')
          .onClick(() => {
            this.state = AnimationStatus.Paused // 显示当前帧图片
          })
        Button('cancel').padding(5)
          .id('ImageAnimator_cancel')
          .onClick(() => {
            this.state = AnimationStatus.Initial // 显示动画的起始帧图片
          })
        Button('iterations')
          .id('ImageAnimator_iterations')
          .onClick((e: ClickEvent) => {
            this.iterationsNum = -1;
          })
        Button('resetText')
          .id('ImageAnimator_resetText')
          .onClick((e: ClickEvent) => {
            this.message = 'Hello World';
          })
      }

      Row() {
        Button('isOnStart : ' + this.isOnStart)
          .id('ImageAnimator_onStart')
          .onClick((e: ClickEvent) => {
            this.isOnStart = !this.isOnStart;
          })
        Button('isOnPause : ' + this.isOnPause)
          .id('ImageAnimator_onPause')
          .onClick((e: ClickEvent) => {
            this.isOnPause = !this.isOnPause;
          })
      }

      Row() {
        Button('isOnCancel : ' + this.isOnCancel)
          .id('ImageAnimator_onCancel')
          .onClick((e: ClickEvent) => {
            this.isOnCancel = !this.isOnCancel;
          })
        Button('isOnFinish : ' + this.isOnFinish)
          .id('ImageAnimator_onFinish')
          .onClick((e: ClickEvent) => {
            this.isOnFinish = !this.isOnFinish;
          })
      }
      Button('isOnRepeat : ' + this.isOnRepeat)
        .id('ImageAnimator_onRepeat')
        .onClick((e: ClickEvent) => {
          this.isOnRepeat = !this.isOnRepeat;
        })

    }
    .width('100%')
    .height('100%')

  }
}
