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
  ImageError
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct ImageOnError {
  @State isOnError: boolean = false;
  @State isShow: boolean = false;
  @State cnt : int = 0;

  build() {
    Column() {
      Button(this.isShow ? 'try to show image' : 'unShow image')
        .width('80%')
        .height(80)
        .fontColor(Color.White)
        .onClick(() => {
          this.isShow = !this.isShow;
        })
        .id('Image_showError')
      if(this.isShow){
        Image('xx')
          .height('10%')
          .onError(this.isOnError ? undefined : (error: ImageError) => {
            this.cnt++;
          })
      }

      Button(`onError:${this.cnt}`).width(100).height(40).margin(30)
        .id('MyButton')

      Button('isOnError : ' + this.isOnError).onClick((e: ClickEvent) => {
        this.isOnError = !this.isOnError;
      })
        .id('Image_onError')
    }
    .width('100%')
    .height('100%')
  }
}