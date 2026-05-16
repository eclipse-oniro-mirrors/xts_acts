// checkbox
import {RadioModifier}from '@ohos.arkui.modifier'
@Entry
@Component
struct CheckboxExample {

  //Tab1
  @State mRadio1Value: String = ''
  @State modifier:RadioModifier = new RadioModifier().onChange((isChecked: boolean) => {
    console.log('form003 Radio_modifier one status is ' + isChecked)
    if(isChecked){
      this.mRadio1Value = 'true'
    }else{
      this.mRadio1Value = 'false'
    }
  })

  @State mRadio1Value1: String = ''
  @State modifier1:RadioModifier = new RadioModifier().onChange((isChecked: boolean) => {
    console.log('form003 Radio_modifier one status is ' + isChecked)
    if(isChecked){
      this.mRadio1Value1 = 'true'
    }else{
      this.mRadio1Value1 = 'false'
    }
  })


  build() {
    Column() {
      Radio({ value: 'mRadio1', group: 'mRadioGroup' }).checked(false)
        .radioStyle({
          checkedBackgroundColor: Color.Pink
        })
        .height(50)
        .width(50)
        .attributeModifier(this.modifier as RadioModifier)
        .id('mRadio1')
      Text(this.mRadio1Value.toString()).key('mRadio1Value')
      Radio({ value: 'mRadio2', group: 'mRadioGroup' }).checked(true)
        .radioStyle({
          checkedBackgroundColor: Color.Pink
        })
        .height(50)
        .width(50)
        .id('mRadio2')
        .attributeModifier(this.modifier1 as RadioModifier)
      Text(this.mRadio1Value1.toString()).key('mRadio1Value1')
    }.width('100%')
  }
}
