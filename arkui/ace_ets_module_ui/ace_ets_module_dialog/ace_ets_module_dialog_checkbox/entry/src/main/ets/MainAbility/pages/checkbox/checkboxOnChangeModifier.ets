// checkbox
import {CheckboxModifier}from '@ohos.arkui.modifier'
@Entry
@Component
struct CheckboxExample {

  //Tab1
  @State checkboxOnChangeModValueTure: String = ''
  @State checkboxOnChangeModValueFalse: String = ''
  @State modifierTrue: CheckboxModifier  = new CheckboxModifier().onChange((value: boolean) => {
    if (value) {
      this.checkboxOnChangeModValueTure = 'true'
    } else {
      this.checkboxOnChangeModValueTure = 'false'
    }
  })
  @State modifierFalse: CheckboxModifier  = new CheckboxModifier().onChange((value: boolean) => {
    if (value) {
      this.checkboxOnChangeModValueFalse = 'true'
    } else {
      this.checkboxOnChangeModValueFalse = 'false'
    }
  })


  build() {
    Column() {
      Checkbox({ name: 'mcheckbox1', group: 'checkboxGroup' })
        .select(true)
        .selectedColor(0xed6f21)
        .shape(CheckBoxShape.CIRCLE)
        .attributeModifier(this.modifierTrue)
        .id('mcheckbox1')
      Text(this.checkboxOnChangeModValueTure.toString()).id('checkboxOnChangeModTrue')
      Checkbox({ name: 'mcheckbox2', group: 'checkboxGroup' })
        .select(false)
        .selectedColor(0xed6f21)
        .shape(CheckBoxShape.CIRCLE)
        .attributeModifier(this.modifierFalse)
        .id('mcheckbox2')
      Text(this.checkboxOnChangeModValueFalse.toString()).id('checkboxOnChangeModFalse')
    }.width('100%')
  }
}
