import { ArcSlider, ArcSliderOptions, ArcSliderPosition, ArcSliderValueOptions, ArcSliderLayoutOptions, ArcSliderStyleOptions, ArcSliderValueOptionsConstructorOptions, ArcSliderLayoutOptionsConstructorOptions, ArcSliderStyleOptionsConstructorOptions, ArcSliderOptionsConstructorOptions } from '@ohos.arkui.advanced.ArcSlider'

@Entry
@ComponentV2
struct ArcSlider1 {
  scroll: Scroller = new Scroller()

  valueOptionsConstructorOptions: ArcSliderValueOptionsConstructorOptions = {
    progress: 50,
    min: 5,
    max: 95
  }

  layoutOptionsConstructorOptions: ArcSliderLayoutOptionsConstructorOptions = {
    reverse: true,
	  position: ArcSliderPosition.LEFT
  }

  styleOptionsConstructorOptions: ArcSliderStyleOptionsConstructorOptions = {
    trackThickness: 8,
    activeTrackThickness: 20,
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
    onChange: (value: number) => {
    }
  }
  arcSliderOptions: ArcSliderOptions = new ArcSliderOptions(this.arcSliderOptionsConstructorOptions)

  build() {
    Scroll(this.scroll) {
      Column({ space: 5 }) {
        List({ space: 5, initialIndex: 0 }) {
          ListItem() {
            ArcSlider().key('arcSliderTest001')
          }.backgroundColor(Color.Black)
        }
      }
    }
  }
}