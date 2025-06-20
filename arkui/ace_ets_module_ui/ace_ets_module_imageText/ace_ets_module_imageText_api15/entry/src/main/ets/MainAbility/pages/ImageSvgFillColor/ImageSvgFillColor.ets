import { ImageModifier } from '@kit.ArkUI'

let idIndex: number = 0

@Observed
class FillColorCategory {
  imageKey: string
  buttonID: string
  image: string
  colors: (ResourceColor | ColorContent | null | undefined)[]
  colorDesc: string[]
  colorIndex: number
  alt?: string

  constructor(image: string,
    colors: (ResourceColor | ColorContent | null | undefined)[],
    colorDesc: string[],
    colorIndex: number, alt?: string) {
    idIndex += 1
    this.imageKey = 'svgFillColorImageKey' + idIndex
    this.buttonID = 'svgFillColorButton' + idIndex
    this.image = image
    this.colors = colors
    this.colorDesc = colorDesc
    this.colorIndex = colorIndex
    this.alt = alt
  }
}

@Component
struct Child {
  // 子组件Child的@ObjectLink的类型是Info
  @ObjectLink item: FillColorCategory;
  label: string = 'ViewChild';

  build() {
    Column() {
      Image($r(this.item.image))
        .width(20)
        .height(20)
        .fillColor(this.item.colors[this.item.colorIndex])
        .alt($r(this.item.alt))
        .key(this.item.imageKey)
      Button('change')
        .id(this.item.buttonID)
        .onClick(() => {
          this.item.colorIndex += 1
          this.item.colorIndex = this.item.colorIndex % this.item.colors.length
          let strJson = getInspectorByKey(this.item.imageKey);
          let obj: ESObject = JSON.parse(strJson);
          console.info(this.item.buttonID + this.item.imageKey + 'fillColor is: ' + obj.$attrs.fillColor);
        })
        .height('5%')
    }
  }
}

export let allCategories: FillColorCategory[] = [
  new FillColorCategory(
    'app.media.comment_area_like', [
    Color.Red,
    Color.Green,
    ColorContent.ORIGIN,],
    ['#FFFF0000', '#FF008000', '#FF000000'],
    0),
  new FillColorCategory('app.media.comment_area_like', [
    0xffffff,
    0xffff0000,
    ColorContent.ORIGIN],
    ['#FFFFFFFF', '#FFFF0000', '#FF000000'],
    0),
  new FillColorCategory('app.media.comment_area_like', [
    '#ffffff',
    '#ff000000',
    'rgba(255, 100, 255, 0.5)',
    ColorContent.ORIGIN,],
    ['#FFFFFFFF', '#FF000000', '#80FF64FF', '#FF000000'],
    0),
  new FillColorCategory('app.media.comment_area_like', [
    null,
    undefined,
    ColorContent.ORIGIN,],
    ['#FF000000', '#FF000000', '#FF000000'],
    0),
  new FillColorCategory('app.media.comment_area_like', [
    'xxxx',
    ColorContent.ORIGIN],
    ['#FF000000', '#FF000000'],
    0),
  new FillColorCategory('app.media.feOffset_2', [
    0xffffff,
    ColorContent.ORIGIN,],
    ['#FFFFFFFF', '#FF000000'],
    0),
  new FillColorCategory('app.media.linearGradient_2', [
    '#ffffff',
    ColorContent.ORIGIN,],
    ['#FFFFFFFF', '#FF000000'],
    0),
  new FillColorCategory('', [
    '#ffffff',
    ColorContent.ORIGIN,],
    ['#FFFFFFFF', '#FF000000'],
    0, 'app.media.logo'),
]

class MyImageModifier implements AttributeModifier<ImageAttribute> {
  isDark: boolean = false

  applyNormalAttribute(instance: ImageAttribute): void {
    instance.width(20).height(20)
    instance.key('modifierImage')
    if (this.isDark) {
      instance.fillColor(ColorContent.ORIGIN)
    } else {
      instance.fillColor(Color.Red)
    }
  }
}

@Entry
@Component
struct ImageSVGFillColor {
  @State categories: FillColorCategory[] = allCategories
  @State modifier: MyImageModifier = new MyImageModifier()

  build() {
    Column() {
      Flex({ wrap: FlexWrap.Wrap, alignContent: FlexAlign.Center }) {
        ForEach(this.categories, (item: FillColorCategory, index: number) => {
          Child({ item: item })
        })
      }
      .width('100%')
      .height('80%')

      Column() {
        Image($r('app.media.comment_area_like'))
          .attributeModifier(this.modifier)
        Button('modifier')
          .id('modifierButton')
          .onClick(() => {
            this.modifier.isDark = !this.modifier.isDark
            let strJson = getInspectorByKey('modifierImage');
            let obj: ESObject = JSON.parse(strJson);
            console.info('modifier fillColor is: ' + obj.$attrs.fillColor);
          })
          .height('5%')
      }
    }
    .width('100%').padding({ right: 10, top: 10 })
    .backgroundColor(Color.Gray)
    .height('100%')
  }
}
