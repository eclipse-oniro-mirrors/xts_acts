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
  Text,
  ImageAnimatorAttribute,
  AttributeModifier
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Observed
export class MyPointModifier implements AttributeModifier<ImageAnimatorAttribute> {
  public message: string = 'Hello World';
  public isOnStart: boolean = true;
  public isOnPause: boolean = true;
  public isOnCancel: boolean = true;
  public isOnFinish: boolean = true;
  public isOnRepeat: boolean = true;

  applyNormalAttribute(instance: ImageAnimatorAttribute): void {
    instance
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
  }
}

@Entry
@Component
struct ImageAnimatorExample {
  scroller: Scroller = new Scroller();
  @State modifier: MyPointModifier = new MyPointModifier()
  @State iterationsNum: int = 1;
  @State state: AnimationStatus = AnimationStatus.Initial

  build() {
    Column() {
      Text(this.modifier.message)
        .id('ImageAnimatorM_text')
      ImageAnimator()
        .id('ImageAnimatorM')
        .images([
          {
            src: $r('app.media.background')
          } as ImageFrameInfo,
          {
            src: $r('app.media.icon'),
          } as ImageFrameInfo,
        ])
        .state(this.state)
        .iterations(this.iterationsNum)
        .attributeModifier(this.modifier)
        .width('60%')
        .height('28%')


      Row() {
        Button('start').padding(5)
          .id('ImageAnimatorM_start')
          .onClick(() => {
            this.state = AnimationStatus.Running
          })
        Button('pause').padding(5)
          .id('ImageAnimatorM_pause')
          .onClick(() => {
            this.state = AnimationStatus.Paused // 显示当前帧图片
          })
        Button('cancel').padding(5)
          .id('ImageAnimatorM_cancel')
          .onClick(() => {
            this.state = AnimationStatus.Initial // 显示动画的起始帧图片
          })
        Button('iterations')
          .id('ImageAnimatorM_iterations')
          .onClick((e: ClickEvent) => {
            this.iterationsNum = -1;
          })
        Button('resetText')
          .id('ImageAnimatorM_resetText')
          .onClick((e: ClickEvent) => {
            this.modifier.message = 'Hello World';
          })
      }

      Row() {
        Button('isOnStart : ' + this.modifier.isOnStart)
          .id('ImageAnimatorM_onStart')
          .onClick((e: ClickEvent) => {
            this.modifier.isOnStart = !this.modifier.isOnStart;
          })
        Button('isOnPause : ' + this.modifier.isOnPause)
          .id('ImageAnimatorM_onPause')
          .onClick((e: ClickEvent) => {
            this.modifier.isOnPause = !this.modifier.isOnPause;
          })
      }

      Row() {
        Button('isOnCancel : ' + this.modifier.isOnCancel)
          .id('ImageAnimatorM_onCancel')
          .onClick((e: ClickEvent) => {
            this.modifier.isOnCancel = !this.modifier.isOnCancel;
          })
        Button('isOnFinish : ' + this.modifier.isOnFinish)
          .id('ImageAnimatorM_onFinish')
          .onClick((e: ClickEvent) => {
            this.modifier.isOnFinish = !this.modifier.isOnFinish;
          })
      }

      Button('isOnRepeat : ' + this.modifier.isOnRepeat)
        .id('ImageAnimatorM_onRepeat')
        .onClick((e: ClickEvent) => {
          this.modifier.isOnRepeat = !this.modifier.isOnRepeat;
        })

    }
    .width('100%')
    .height('100%')

  }
}
