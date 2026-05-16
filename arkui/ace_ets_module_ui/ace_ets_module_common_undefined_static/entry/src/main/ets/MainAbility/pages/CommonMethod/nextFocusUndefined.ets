'use static'
import {
  Entry,
  Component,
  Column,
  Button,
  ColumnOptions,
  ClickEvent,
  AttributeModifier,
  ButtonAttribute,
  Row,
  FocusMovement,
  Optional,
  focusControl
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'



@Entry
@Component
struct Index {
  @State idList: string[] = ['A', 'B', 'C', 'D', 'E', 'F'];
  @State isNextFocusUndefined: boolean = true;
  @State value: string = 'C'
  build() {
    Column({space: 10} as ColumnOptions) {
      Column({ space: 10 } as ColumnOptions) {
        Row() {
          Button('id: ' + this.idList[0])
            .id(this.idList[0])
            .nextFocus(this.isNextFocusUndefined ? { forward: 'C' } as Optional<FocusMovement> : undefined);
          Button('id: ' + this.idList[1])
            .id(this.idList[1])
          Button(this.value)
            .onFocus(() => {
              this.value = 'suc'
            })
            .id(this.idList[2]);
          Button('id: ' + this.idList[3])
            .id(this.idList[3])
          Button('id: ' + this.idList[4])
            .id(this.idList[4]);
          Button('id: ' + this.idList[5])
            .id(this.idList[5])
        }
      }


      Column({ space: 5 } as ColumnOptions) {
        Button('req')
          .id('FE_req')
          .onClick((e: ClickEvent) => {
            focusControl.requestFocus('A')
          })
        Button('resetValue')
          .id('resetValue')
          .onClick((e: ClickEvent) => {
            this.value = 'C';
          })
        Button('isNextFocusUndefined : ' + this.isNextFocusUndefined)
          .onClick((e: ClickEvent) => {
            this.isNextFocusUndefined = !this.isNextFocusUndefined
          })
          .id('Common_nextFocus')
      }
    }
  }
}