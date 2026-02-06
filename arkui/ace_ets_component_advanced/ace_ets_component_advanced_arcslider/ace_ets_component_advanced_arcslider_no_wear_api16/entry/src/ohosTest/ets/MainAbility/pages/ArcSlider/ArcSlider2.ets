import { ArcSlider, ArcSliderOptions, ArcSliderPosition, ArcSliderValueOptions, ArcSliderLayoutOptions, ArcSliderStyleOptions, ArcSliderValueOptionsConstructorOptions, ArcSliderLayoutOptionsConstructorOptions, ArcSliderStyleOptionsConstructorOptions, ArcSliderOptionsConstructorOptions } from '@ohos.arkui.advanced.ArcSlider'

@Entry
@ComponentV2
struct ArcSlider2 {
  scroll: Scroller = new Scroller()
  @Local isEnlarged: string = 'false';
  valueOptionsConstructorOptions: ArcSliderValueOptionsConstructorOptions = {
    progress: 50,
    min: 5,
    max: 95
  }

  layoutOptionsConstructorOptions: ArcSliderLayoutOptionsConstructorOptions = {
    reverse: true,
	  position: ArcSliderPosition.RIGHT
  }

  styleOptionsConstructorOptions: ArcSliderStyleOptionsConstructorOptions = {
    trackThickness: 16,
    activeTrackThickness: 36,
    trackColor: '#999999',
    selectedColor: '#00FF00',
    trackBlur: 20
  }
  valueOptions: ArcSliderValueOptions = new ArcSliderValueOptions(this.valueOptionsConstructorOptions)
  layoutOptions: ArcSliderLayoutOptions = new ArcSliderLayoutOptions(this.layoutOptionsConstructorOptions)
  styleOptions: ArcSliderStyleOptions = new ArcSliderStyleOptions(this.styleOptionsConstructorOptions)
  arcSliderOptionsConstructorOptions: ArcSliderOptionsConstructorOptions = {
    valueOptions: this.valueOptions,
    layoutOptions: this.layoutOptions,
    styleOptions: this.styleOptions,
    digitalCrownSensitivity:CrownSensitivity.LOW,
    onTouch: (event: TouchEvent) => {
    },
    onChange: (progress: number) => {
    },
    onEnlarge: (isEnlarged: boolean) => {
      this.isEnlarged = JSON.stringify(isEnlarged);
    }
  }
  arcSliderOptions: ArcSliderOptions = new ArcSliderOptions(this.arcSliderOptionsConstructorOptions)

  build() {
    Scroll(this.scroll) {
      Column({ space: 5 }) {
        List({ space: 5, initialIndex: 0 }) {
          ListItem() {
            Stack() {
              Text(this.isEnlarged).fontColor(Color.White).fontSize(50)
                .key('textTest001')
              ArcSlider({ options: this.arcSliderOptions }).key('arcSliderTest002')
            }
          }.backgroundColor(Color.Black)
        }
      }
    }
  }
}