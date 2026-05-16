'use static'
import {
  Entry,
  Column,
  Component,
  Button,
  Margin,
  Color,
  Text
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct Index {
  @State message: string = 'set monopolizeEvents false';
  @State monopolize: boolean | undefined = true;

  build() {
    Column() {
      Text(this.message)
        .fontSize(22)
        .margin(10)

      Button('change monopolizeEvents undefined')
        .fontSize(22)
        .margin(10)
        .onClick(() => {
          this.monopolize = this.monopolize === undefined ? true : undefined
          if (this.monopolize) {
            this.message = 'set monopolizeEvents true'
          } else {
            this.message = 'set monopolizeEvents undefined'
          }
        })
        .id('button_monopolizeEvents')

      Column() {
        Column() {
        }
        .monopolizeEvents(this.monopolize)
        .width('100%')
        .height('40%')
        .backgroundColor(Color.Blue)
        .id('commonmethod_monopolizeEvents')
      }
      .backgroundColor(Color.Gray)
      .height('100%')
      .width('100%')
    }
    .height('100%')
  }
}