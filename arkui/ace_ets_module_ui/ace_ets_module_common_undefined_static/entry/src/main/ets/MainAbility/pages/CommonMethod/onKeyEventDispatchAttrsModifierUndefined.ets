'use static'

import {
  Entry,
  Text,
  Column,
  Component,
  Button,
  ClickEvent,
  Callback,
  KeyEvent,
  Row,
  AttributeModifier,
  ColumnAttribute
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
export class MyModifier implements AttributeModifier<ColumnAttribute> {
  @State public isOnKeyEventDispatchUndefined: boolean = true;
  @State public text: string = ''

  applyNormalAttribute(instance: ColumnAttribute): void {
    instance
      .onKeyEventDispatch(this.isOnKeyEventDispatchUndefined ? (event: KeyEvent): boolean => {
        this.text = 'parentTab'
        console.info('the parent key is ' + JSON.stringify(event))
        return true
      } : undefined)
  }
}

@Entry
@Component
struct onKeyEventExample4 {
  @State myModifier: MyModifier = new MyModifier();

  build() {
    Column() {
      Column() {
        Row() {
          Text(this.myModifier.text).key('textModifier')
        }

        Button('KeyEvent')
          .onKeyEventDispatch((event: KeyEvent): boolean => {
            this.myModifier.text = 'childTab'
            console.info('the child key is ' + JSON.stringify(event))
            return false
          })

      }
      .height('50%')
      .width('100%')
      .padding(35)
      .attributeModifier(this.myModifier)

      Column() {
        Button('isOnKeyEventDispatchUndefined : ' + this.myModifier.isOnKeyEventDispatchUndefined)
          .onClick((e: ClickEvent) => {
            this.myModifier.isOnKeyEventDispatchUndefined = !this.myModifier.isOnKeyEventDispatchUndefined
          })
          .key('Common_OnKeyEventDispatch')
      }
    }
  }
}