'use static'
import {
  Entry,
  Text,
  Column,
  Component,
  Button,
  ClickEvent,
  Color,
  Image,
  $r,
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct ImageOnfinish {
  @State isOnFinish: boolean = false;
  @State cnt : int = 0;

  build() {
    Column() {
      Image($r('app.media.onfinish'))
        .height('10%')
        .onFinish(this.isOnFinish ? undefined : () => {
          this.cnt++;
        })
      Button(`onFinish:${this.cnt}`).width(100).height(40).margin(30)
        .id('MyButton')

      Button('isOnFinish : ' + this.isOnFinish).onClick((e: ClickEvent) => {
        this.isOnFinish = !this.isOnFinish;
      })
        .id('Image_onFinish')
    }
    .width('100%')
    .height('100%')
  }
}