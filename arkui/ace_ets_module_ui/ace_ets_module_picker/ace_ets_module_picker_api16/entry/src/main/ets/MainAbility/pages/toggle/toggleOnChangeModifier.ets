// checkbox
import {ToggleModifier}from '@ohos.arkui.modifier'
@Entry
@Component
struct CheckboxExample {

  @State mIsOn1: String = ''
  @State mIsOn2: String = ''
  @State mIsOn3: String = ''
  @State modifier:ToggleModifier = new ToggleModifier().onChange((isOn: boolean) => {
    console.info('form006 Toggle_modifier one status is :' + isOn)
    if(isOn){
      this.mIsOn1 = 'true'
    }else{
      this.mIsOn1 = 'false'
    }
  })
  @State modifier1:ToggleModifier = new ToggleModifier().onChange((isOn: boolean) => {
    console.info('form006 Toggle_modifier one status is :' + isOn)
    if(isOn){
      this.mIsOn2 = 'true'
    }else{
      this.mIsOn2 = 'false'
    }
  })
  @State modifier2:ToggleModifier = new ToggleModifier().onChange((isOn: boolean) => {
    console.info('form006 Toggle_modifier one status is :' + isOn)
    if(isOn){
      this.mIsOn3 = 'true'
    }else{
      this.mIsOn3 = 'false'
    }
  })


  build() {
    Column() {
      Toggle({ type: ToggleType.Switch, isOn: true })
        .selectedColor('#007DFF')
        .switchPointColor('#FFFFFF')
        .attributeModifier(this.modifier as ToggleModifier)
        .id('ToggleOne')
      Toggle({ type: ToggleType.Checkbox, isOn: true })
        .size({ width: 20, height: 20 })
        .selectedColor('#007DFF')
        .attributeModifier(this.modifier1 as ToggleModifier)
        .id('ToggleTwo')
      Toggle({ type: ToggleType.Button, isOn: true }) {
        Text('status button').fontColor('#182431').fontSize(12)
      }.width(106)
      .selectedColor('rgba(0,125,255,0.20)')
      .attributeModifier(this.modifier2 as ToggleModifier)
      .id('ToggleThree')
      Text(this.mIsOn1.toString()).key('mToggleOneKey')
      Text(this.mIsOn2.toString()).key('mToggleTwoKey')
      Text(this.mIsOn2.toString()).key('mToggleThreeKey')
    }.width('100%')
  }
}
