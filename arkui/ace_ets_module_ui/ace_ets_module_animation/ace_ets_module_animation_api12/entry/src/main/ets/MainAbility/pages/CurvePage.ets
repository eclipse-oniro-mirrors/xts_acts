import { curves, router } from '@kit.ArkUI'

@Entry
@Component
struct CurvePage {
  @State cube_size: number = 50

  build() {
    Column({ space: 5 }) {
      Column(){
      }.width(this.cube_size).height(this.cube_size).backgroundColor(Color.Black)

      Button('EaseInOut')
        .id('easeInOutId')
        .height('10%')
        .onClick(()=>{
        this.getUIContext().animateTo({curve:curves.initCurve(Curve.EaseInOut),onFinish:()=>{
          this.cube_size = 30
          AppStorage.setOrCreate('cube_size', 30);
        }},()=>{
          this.cube_size = 200
        })
      })

      Button('FastOutSlowIn')
        .id('fastOutSlowIn')
        .height('10%')
        .onClick(()=>{
        this.getUIContext().animateTo({curve:curves.init(Curve.FastOutSlowIn),onFinish:()=>{
          this.cube_size = 50
          AppStorage.setOrCreate('cube_size', 50);
        }},()=>{
          this.cube_size = 200
        })
      })

      Button('springMotion')
        .id('springMotionId')
        .height('10%')
        .onClick(()=>{
        this.getUIContext().animateTo({curve:curves.springMotion(0.5,0.8,1),onFinish:()=>{
          this.cube_size = 20
          AppStorage.setOrCreate('cube_size', 20);
        }},()=>{
          this.cube_size = 200
        })
      })

      Button('responsiveSpringMotion')
        .id('responsiveSpringId')
        .height('10%')
        .onClick(()=>{
        this.getUIContext().animateTo({curve:curves.responsiveSpringMotion(0.1,0.8,0.2),onFinish:()=>{
          this.cube_size = 60
          AppStorage.setOrCreate('cube_size', 60);
        }},()=>{
          this.cube_size = 200
        })
      })
    }
    .width('100%')
    .margin({ top: 15 })
  }
}

