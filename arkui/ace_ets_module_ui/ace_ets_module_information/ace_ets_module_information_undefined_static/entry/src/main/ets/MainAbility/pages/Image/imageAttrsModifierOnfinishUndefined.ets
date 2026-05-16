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
  AttributeModifier,
  ImageAttribute
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
export class MyModifier implements AttributeModifier<ImageAttribute> {
  public isOnFinish: boolean = false;
  public cnt : int = 0;

  applyNormalAttribute(instance: ImageAttribute): void {
    instance
      .onFinish(this.isOnFinish ? undefined : () => {
        this.cnt++;
      })
  }
}

@Entry
@Component
struct ImageOnfinish {
  @State myModifier: MyModifier = new MyModifier();

  build() {
    Column() {
      Image($r('app.media.onfinish'))
        .height('10%')
        .attributeModifier(this.myModifier)

      Button(`onFinish:${this.myModifier.cnt}`).width(100).height(40).margin(30)
        .id('MyButtonAttributeModifier')


      Button('isOnFinish : ' + this.myModifier.isOnFinish).onClick((e: ClickEvent) => {
        this.myModifier.isOnFinish = !this.myModifier.isOnFinish;
      })
        .id('Image_onFinish')
    }
    .width('100%')
    .height('100%')
  }
}