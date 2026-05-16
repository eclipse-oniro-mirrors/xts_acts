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
  focusControl,
  AttributeModifier,
  ButtonAttribute
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
export class MyModifier implements AttributeModifier<ButtonAttribute> {
  @State public isNextFocusUndefined: boolean = true;

  applyNormalAttribute(instance: ButtonAttribute): void {
    instance
      .nextFocus(this.isNextFocusUndefined ? { forward: 'CModifier' } as Optional<FocusMovement> : undefined);
  }
}

@Entry
@Component
struct Index {
  @State idList: string[] = ['A', 'B', 'C', 'D', 'E', 'F'];
  @State value: string = 'C'
  @State myModifier: MyModifier = new MyModifier();
  build() {
    Column({space: 10} as ColumnOptions) {
      Column({ space: 10 } as ColumnOptions) {
        Row() {
          Button('id: ' + this.idList[0])
            .id('AModifier')
            .attributeModifier(this.myModifier)

          Button('id: ' + this.idList[1])
            .id(this.idList[1])
          Button(this.value)
            .onFocus(() => {
              this.value = 'suc'
            })
            .id('CModifier');
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
          .id('FE_req_Modifier')
          .onClick((e: ClickEvent) => {
            focusControl.requestFocus('AModifier')
          })
        Button('resetValue')
          .id('resetValue')
          .onClick((e: ClickEvent) => {
            this.value = 'C';
          })
        Button('isNextFocusUndefined : ' + this.myModifier.isNextFocusUndefined)
          .onClick((e: ClickEvent) => {
            this.myModifier.isNextFocusUndefined = !this.myModifier.isNextFocusUndefined
          })
          .id('Common_nextFocus')
      }
    }
  }
}