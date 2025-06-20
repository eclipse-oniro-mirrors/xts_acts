import {CheckboxGroupModifier}from '@ohos.arkui.modifier'
@Entry
@Component
struct CheckboxExample {

  //Tab1
  @State mItemNameTrue: String = ''
  @State mItemNameFalse: String = ''
  @State groupModifierTrue:CheckboxGroupModifier = new CheckboxGroupModifier()
    .onChange((itemName: CheckboxGroupResult) => {
      this.mItemNameTrue = 'CheckboxGroupModifierOnChange'
  })


  build() {
    Column() {
      CheckboxGroup({ group: 'mCheckboxGroup' })
        .checkboxShape(CheckBoxShape.ROUNDED_SQUARE)
        .selectedColor('#007DFF')
        .attributeModifier(this.groupModifierTrue as CheckboxGroupModifier)
        .id('checkbosGroupOnchange')
      Text('M Select All').fontSize(14).lineHeight(20).fontColor('#182431').fontWeight(500)
      Checkbox({ name: 'mcheckbox1', group: 'mCheckboxGroup' })
        .selectedColor('#007DFF')
        .shape(CheckBoxShape.ROUNDED_SQUARE)
      Checkbox({ name: 'mcheckbox2', group: 'mCheckboxGroup' })
        .selectedColor('#007DFF')
        .shape(CheckBoxShape.ROUNDED_SQUARE)
      Text(this.mItemNameTrue.toString()).key('checkboxGroupModifierTrue')
    }.width('100%')
  }
}