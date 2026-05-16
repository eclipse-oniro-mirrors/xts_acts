'use static'
import {
  Entry,
  Column,
  Component,
  Button,
  Margin,
  Color,
  Text,
  ColumnOptions,
  AttributeModifier,
  CommonAttribute,
  TouchEvent,
  HorizontalAlign,
  FlexAlign,
  TouchType
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
export class MyMonopolizeModifier implements AttributeModifier<CommonAttribute> {
  @State public controlValue: boolean | undefined = true

  applyNormalAttribute(instance: CommonAttribute): void {
    if (this.controlValue === undefined) {
      instance.monopolizeEvents(undefined)
    } else if (this.controlValue === true) {
      instance.monopolizeEvents(true)
    }
  }
}

@Entry
@Component
struct Index {
  @State outMsg: string = 'outer: (none)'
  @State inMsg: string = 'inner: (none)'
  @State modifier: MyMonopolizeModifier = new MyMonopolizeModifier()

  aboutToAppear() {
    this.modifier.controlValue = true
  }

  build() {
    Column({ space: 12 } as ColumnOptions) {
      Column() {
        Text('case4: dynamic (true / undefined)')
          .fontSize(18)
          .margin({ top: 6, bottom: 6 } as Margin)
        Column({ space: 10 } as ColumnOptions) {
          Button('undefined' + this.modifier.controlValue)
            .onClick(() => {
              this.modifier.controlValue = this.modifier.controlValue === undefined ? true : undefined
            })
            .id('button_monopolizeEventsModifier')
        }
        .width('100%')

        Column() {
          Column() {
            Text('inner area').fontSize(16).margin({ top: 6 } as Margin)
            Text(this.inMsg).fontSize(14).margin({ top: 2, bottom: 8 } as Margin)
          }
          .height(80)
          .width('92%')
          .backgroundColor(Color.Blue)
          .attributeModifier(this.modifier)
          .onTouch((e: TouchEvent) => {
            if (e.type === TouchType.Down) {
              this.inMsg = `inner column touch down`
              console.info('inner column touch down')
            }
          })
          .id('commonmethod_monopolizeEventsModifier')
        }
        .height(100)
        .width('100%')
        .backgroundColor(0xEEEEEE)
        .onTouch((e: TouchEvent) => {
          if (e.type === TouchType.Down) {
            this.outMsg = `outside column touch down`
            console.info('outside column touch down')
          }
        })

        Text(this.outMsg).fontSize(14).margin({ top: 4, bottom: 8 } as Margin)
        Button('清空本 case 日志')
          .onClick(() => {
            this.inMsg = 'inner: (none)'
            this.outMsg = 'outer: (none)'
          })
      }
      .width('100%')
      .margin({ bottom: 16 } as Margin)
    }
    .width('100%')
    .padding(12)
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Start)
  }
}
