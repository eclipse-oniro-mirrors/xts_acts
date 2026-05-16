'use static'
import {
  Entry,
  Text,
  Column,
  Row,
  Component,
  Button,
  ClickEvent,
  Scroll,
  Margin,
  Color,
  $r,
  Swiper,
  SwiperController,
  DotIndicator,
  ScrollState,
  SwiperAnimationEvent,
  TextAlign,
  Curve,
  SwiperContentWillScrollResult,
  SwiperAttribute,
  AttributeModifier,
  List,
  ForEach,
  Divider
} from '@ohos.arkui.component'
import { State, Observed } from '@ohos.arkui.stateManagement'

@Observed
export class SliderModifierTest0 implements AttributeModifier<SwiperAttribute>{
  public isUndefined: boolean = false;
  applyNormalAttribute(instance: SwiperAttribute):void{
    instance
      .indicator( this.isUndefined ? undefined : false)
  }
}

@Entry
@Component
struct SwiperExample {
  private swiperController: SwiperController = new SwiperController();
  @State modifier0:SliderModifierTest0 = new SliderModifierTest0()
  @State buttonText: string = 'false'
  @State index:number = 0;
  build() {
    Column() {
      Text('test modifier' )
      Button('isUndefined = ' + this.modifier0.isUndefined.toString())
        .onClick(() => {
          this.modifier0.isUndefined = !this.modifier0.isUndefined
        }).id('changeButton')
      Column() {
        Text('indicator').fontSize(20).margin(15).width('90%')
        Swiper(this.swiperController, () => {
          ForEach(['1', '2', '3', '4'], (item: string) => {
            Text(item.toString())
              .width('90%')
              .height(160)
              .backgroundColor('#AFEEEE')
              .textAlign(TextAlign.Center)
              .fontSize(30)
          }, (item: string) => item)
        }).attributeModifier(this.modifier0)
          .id('swiper_indicator')



        Divider().margin(10)

        Text('indicator-固定为true').fontSize(20).margin(15).width('90%')
        Swiper(this.swiperController, () => {
          ForEach(['1', '2', '3', '4'], (item: string) => {
            Text(item.toString())
              .width('90%')
              .height(160)
              .backgroundColor('#ff87CEFA')
              .textAlign(TextAlign.Center)
              .fontSize(30)
          }, (item: string) => item)
        }).indicator(true)
        Divider().margin(10)

        Text('indicator-固定为false').fontSize(20).margin(15).width('90%')
        Swiper(this.swiperController, () => {
          ForEach(['1', '2', '3', '4'], (item: string) => {
            Text(item.toString())
              .width('90%')
              .height(160)
              .backgroundColor('#ff98FB8')
              .textAlign(TextAlign.Center)
              .fontSize(30)
          }, (item: string) => item)
        }).indicator(false)
        Divider().margin(10)

        Text('indicator-默认值(不设置属性)').fontSize(20).margin(15).width('90%')
        Swiper(this.swiperController, () => {
          ForEach(['1', '2', '3', '4'], (item: string) => {
            Text(item.toString())
              .width('90%')
              .height(160)
              .backgroundColor('#ffDDA0DD')
              .textAlign(TextAlign.Center)
              .fontSize(30)
          }, (item: string) => item)
        })
      }
    }.width('100%')
  }
}