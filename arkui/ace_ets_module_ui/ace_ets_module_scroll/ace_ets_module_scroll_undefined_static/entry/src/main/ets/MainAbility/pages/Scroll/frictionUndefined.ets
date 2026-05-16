'use static'
import {
  Stack,
  Entry,
  Component,
  Column,
  Row,
  Button,
  ForEach,
  Text,
  TextAlign,
  BarState,
  List,
  Color,
  Margin,
  ListItem,
  Resource
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct ScrollPage {
  @State arr: String[] =
    ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20',
      '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31', '32', '33', '34', '35', '36', '37'];
  @State friction: number | Resource | undefined = 100.0;

  build() {
    Stack() {
      Column() {
        List() {
          ForEach(this.arr, (item: string) => {
            ListItem() {
              Text('item' + item)
                .width('90%')
                .height('20%')
                .borderRadius(15)
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .focusable(true)
                .focusOnTouch(true)
            }
          }, (item: string) => item)
        }
        .scrollBar(BarState.On)
        .friction(this.friction)
        .id('common_friction')
      }

      Column() {
        Button('切换 friction → ' + (this.friction === undefined ? 'undefined' : '100'))
          .height('5%')
          .onClick(() => {
            this.friction = this.friction === undefined ? 100.0 : undefined
          }).margin({ top: 5 } as Margin)
          .id('button_friction')
      }
    }.width('100%').height('100%')
  }
}