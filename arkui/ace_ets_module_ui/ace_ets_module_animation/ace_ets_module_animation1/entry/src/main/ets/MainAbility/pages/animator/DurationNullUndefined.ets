import { AnimatorResult, SimpleAnimatorOptions } from '@kit.ArkUI';

@Entry
@Component
struct DurationNullUndefined {
  private TAG: string = '[AnimatorTest]'
  private backAnimator: AnimatorResult | undefined = undefined
  private backAnimator2: AnimatorResult | undefined = undefined
  private flag: boolean = false
  @State translate_: number = 0

  create() {
    this.backAnimator = this.getUIContext()?.createAnimator(
      new SimpleAnimatorOptions(0, 100)
        .duration(undefined)
    )
    this.backAnimator.onFinish = ()=> {
      this.flag = true
      AppStorage.setOrCreate('flag', this.flag);
      console.info(this.TAG, 'backAnimator onFinish')
    }
    this.backAnimator.onFrame = (value:number)=> {
      this.translate_ = value
    }
  }

  createUndefined() {
    this.backAnimator2 = this.getUIContext()?.createAnimator(
      new SimpleAnimatorOptions(0, 100)
        .duration(null)
    )
    this.backAnimator2.onFinish = ()=> {
      this.flag = true
      AppStorage.setOrCreate('flag', this.flag);
      console.info(this.TAG, 'backAnimator onFinish')
    }
    this.backAnimator2.onFrame = (value:number)=> {
      this.translate_ = value
    }
  }

  aboutToDisappear() {
    // 自定义组件消失时调用finish使未完成的动画结束，避免动画继续运行。
    // 由于backAnimator在onframe中引用了this, this中保存了backAnimator，
    // 在自定义组件消失时应该将保存在组件中的backAnimator置空，避免内存泄漏
    this.backAnimator?.finish();
    this.backAnimator = undefined;
    this.backAnimator2?.finish();
    this.backAnimator2 = undefined;
  }

  build() {
    Column() {
      Column() {
        Column() {
          Column()
            .width(100)
            .height(100)
            .translate({x: this.translate_})
            .backgroundColor(Color.Green)
        }
        // .width('100%')
        // .height(300)

        Column() {
          Button('create')
            .fontColor(Color.White)
            .onClick(() => {
              this.create()
            })
        }
        .padding(5).height('5%')

        Column() {
          Button('play')
            .fontColor(Color.White)
            .onClick(() => {
              this.flag = false
              if(this.backAnimator){
                this.backAnimator.play()
              }
            })
        }
        .padding(5).height('5%')

        Column() {
          Button('createUndefined')
            .fontColor(Color.White)
            .onClick(() => {
              this.createUndefined()
            })
        }
        .padding(5).height('5%')

        Column() {
          Button('playUndefined')
            .fontColor(Color.White)
            .onClick(() => {
              this.flag = false
              if(this.backAnimator){
                this.backAnimator.play()
              }
            })
        }
        .padding(5).height('5%')

        Column() {
          Button('reset')
            .fontColor(Color.White)
            .onClick(() => {
              if (this.flag) {
                this.flag = false
                if(this.backAnimator){
                  this.backAnimator.reset(
                    new SimpleAnimatorOptions(0, -100)
                  )
                }
              } else {
                console.info(this.TAG, 'Animation not ended')
              }
            })
        }
        .padding(10).height('5%')
      }
    }
  }
}