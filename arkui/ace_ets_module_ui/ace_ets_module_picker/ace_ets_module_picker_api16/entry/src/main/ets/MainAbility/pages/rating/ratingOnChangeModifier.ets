// checkbox
import {RatingModifier}from '@ohos.arkui.modifier'
@Entry
@Component
struct CheckboxExample {

  @State rating: number = 3.5
  @State mRadio1Value: String = ''
  @State modifier:RatingModifier =  new RatingModifier().onChange((value: number) => {
    this.rating = value
    console.log('form004 rating_nodifier value is '+ this.rating)
  })


  build() {
    Column() {
      Button('ratingButton1').onClick((event: ClickEvent) => {
        this.rating = 5.0
      })
        .id('ratingButton')
      Rating({ rating: this.rating, indicator: false })
        .stars(5)
        .stepSize(0.5)
        .margin({ top: 24 })
        .attributeModifier(this.modifier as RatingModifier)
        .id('ratingModifier')
      Text(this.rating.toString()).key('ratingModifierKey')
    }.width('100%')
  }
}
