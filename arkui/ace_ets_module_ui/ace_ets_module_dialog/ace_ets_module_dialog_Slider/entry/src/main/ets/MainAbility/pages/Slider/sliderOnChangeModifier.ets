// checkbox
import {SliderModifier}from '@ohos.arkui.modifier'
@Entry
@Component
struct CheckboxExample {

  @State mOutSetValueOne: number = 40
  @State mOutSetValueTwo: number = 40
  @State modifier: SliderModifier = new SliderModifier().onChange((value: number, mode: SliderChangeMode) => {
    this.mOutSetValueOne = value
    console.info('form005 Slider_Modifier_value1111:' + value + 'mode:' + mode.toString())
  })
  @State modifier1: SliderModifier = new SliderModifier().onChange((value: number, mode: SliderChangeMode) => {
    this.mOutSetValueTwo = value
    console.info('form005 Slider_Modifier_value1111:' + value + 'mode:' + mode.toString())
  })


  build() {
    Column() {
      Button('Button1').onClick((event: ClickEvent) => {
        this.mOutSetValueOne = 66
      })
        .id('sliderButtonOne')
      Button('Button2').onClick((event: ClickEvent) => {
        this.mOutSetValueTwo = 80
      })
        .id('sliderButtonTwo')
      Column(){
        Column(){
          Slider({
            value: this.mOutSetValueOne,
            min: 0,
            max: 100,
            style: SliderStyle.OutSet
          })
            .showTips(true)
            .attributeModifier(this.modifier as SliderModifier)
          Text(this.mOutSetValueOne.toString()).key('mOutSetValueOneKey')
        }
        Column(){
          Slider({
            value: this.mOutSetValueTwo,
            min: 0,
            max: 100,
            style: SliderStyle.OutSet
          })
            .showSteps(true)
            .attributeModifier(this.modifier1 as SliderModifier)
          Text(this.mOutSetValueTwo.toString()).key('mOutSetValueTwoKey')
        }
      }
    }.width('100%')
  }
}
