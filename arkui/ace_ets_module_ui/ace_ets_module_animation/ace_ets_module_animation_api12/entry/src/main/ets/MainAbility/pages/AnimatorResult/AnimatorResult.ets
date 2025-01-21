/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import animator, { AnimatorResult } from '@ohos.animator';

@Entry
@Component
struct AnimatorTest1 {
  private TAG: string = '[AnimatorTest]';
  private backAnimator: AnimatorResult | undefined = undefined;
  private flag: boolean = false;
  @State wid: number = 100;
  @State hei: number = 100;
  @State onFrameText: string = '';
  @State onRepeatText: string = '';

  create() {
    let _this = this
    this.backAnimator = animator.create({
      duration: 2000,
      easing: "ease",
      delay: 0,
      fill: "forwards",
      direction: "normal",
      iterations: 2,
      begin: 100,
      end: 200
    })
    this.backAnimator.onFinish = () => {
      _this.flag = true
      console.info(_this.TAG, 'backAnimator onfinish')
    }
    this.backAnimator.onRepeat = () => {
      console.info(_this.TAG, 'backAnimator repeat')
      _this.onRepeatText = 'onRepeat'
    }
    this.backAnimator.onCancel = () => {
      console.info(_this.TAG, 'backAnimator cancel')
    }
    this.backAnimator.onFrame = (value) => {
      _this.wid = value
      _this.hei = value
      _this.onFrameText = 'onFrame'
    }
  }

  aboutToDisappear() {
    // 由于backAnimator在onframe中引用了this, this中保存了backAnimator，
    // 在自定义组件消失时应该将保存在组件中的backAnimator置空，避免内存泄漏
    this.backAnimator = undefined;
  }

  build() {
    Column() {
      Column() {
        Column()
          .width(this.wid)
          .height(this.hei)
          .backgroundColor(Color.Red)
      }
      .width('100%')
      .height(300)

      Column() {
        Text(this.onFrameText)
          .id('onFrame')
        Text(this.onRepeatText)
          .id('onRepeat')
      }

      Column() {
        Row() {
          Button('create')
            .fontSize(30)
            .fontColor(Color.Black)
            .onClick(() => {
              this.create()
            })
            .id('create')
        }
        .padding(10)

        Row() {
          Button('play')
            .fontSize(30)
            .fontColor(Color.Black)
            .onClick(() => {
              this.flag = false
              if (this.backAnimator) {
                this.backAnimator.play()
              }
            })
            .id('play')
        }
        .padding(10)
      }
    }
  }
}