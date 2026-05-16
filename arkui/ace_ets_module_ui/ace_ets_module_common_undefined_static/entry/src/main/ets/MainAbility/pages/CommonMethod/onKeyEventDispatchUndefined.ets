'use static'

import { Entry, Text, Column, Component, Button, ClickEvent, Callback, KeyEvent, Row } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'


@Entry
@Component
struct onKeyEventExample4 {
  @State isOnKeyEventDispatchUndefined: boolean = true;
  @State text: string = ''

  build() {
    Column() {
      Column() {
        Row() {
          Text(this.text).key('text')
        }

        Button('KeyEvent')
          .onKeyEventDispatch((event: KeyEvent): boolean => {
            this.text = 'childTab'
            console.info('the child key is ' + JSON.stringify(event))
            return false
          })
      }
      .height('50%')
      .width('100%')
      .padding(35)
      .onKeyEventDispatch(this.isOnKeyEventDispatchUndefined ? (event: KeyEvent): boolean => {
        this.text = 'parentTab'
        console.info('the parent key is ' + JSON.stringify(event))
        return true
      } : undefined)

      Column() {
        Button('isOnKeyEventDispatchUndefined : ' + this.isOnKeyEventDispatchUndefined)
          .onClick((e: ClickEvent) => {
            this.isOnKeyEventDispatchUndefined = !this.isOnKeyEventDispatchUndefined
          })
          .key('Common_OnKeyEventDispatch')
      }
    }
  }
}