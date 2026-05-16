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
  ImageError,
  AttributeModifier,
  ImageAttribute
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
export class MyModifier implements AttributeModifier<ImageAttribute> {
  public isOnError: boolean = false;
  public cnt : int = 0;

  applyNormalAttribute(instance: ImageAttribute): void {
    instance
      .onError(this.isOnError ? undefined : (error: ImageError) => {
        this.cnt++;
      })
  }
}

@Entry
@Component
struct ImageOnError {
  @State isShow: boolean = false;
  @State myModifier: MyModifier = new MyModifier();

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
          .attributeModifier(this.myModifier)
      }

      Button(`onError:${this.myModifier.cnt}`).width(100).height(40).margin(30)
        .id('MyButtonAttributeModifier')

      Button('isOnError : ' + this.myModifier.isOnError).onClick((e: ClickEvent) => {
        this.myModifier.isOnError = !this.myModifier.isOnError;
      })
        .id('Image_onError')
    }
    .width('100%')
    .height('100%')
  }
}