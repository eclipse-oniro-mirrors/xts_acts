'use static'

import {
  Entry,
  Text,
  Column,
  Component,
  Button,
  ClickEvent,
  $r,
  ColumnOptions,
  BorderOptions,
  Row,
  TapGestureHandler,
  GestureModifier,
  UIGestureEvent,
  GestureEvent,
  GesturePriority,
  Builder,
  Color,
  RowOptions
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import inspector from '@ohos.arkui.inspector'

@Observed
export class MyButtonModifier implements GestureModifier {
  public value: string = '666';
  public count: int = 0;

  applyGesture(event: UIGestureEvent): void {
    event.addGesture(
      new TapGestureHandler({ count: 1, fingers: 1 })
        .tag('aaa')
        .onAction((event: GestureEvent) => {
          console.log('button tap ' + JSON.stringify(event.repeat));
          this.count++;
          this.value = 'Click' + this.count;
        }),
      GesturePriority.PRIORITY
    )
  }
}

@Entry
@Component
struct Index {
  @State modifier: MyButtonModifier = new MyButtonModifier();
  @State isGestureModifier: boolean = false;


  build() {
    Column({ space: 5 } as ColumnOptions) {
      Text(this.modifier.value)
        .id('GM_text')

      Column()
        .id('GM_column')
        .gestureModifier(this.isGestureModifier ? undefined : this.modifier)
        .borderWidth(1)
        .width('100%')
        .height('10%')

      Button('btn1 : ' + this.isGestureModifier)
        .id('GM_btn1')
        .onClick((e: ClickEvent) => {
          this.isGestureModifier = !this.isGestureModifier
        })

    }
  }
}