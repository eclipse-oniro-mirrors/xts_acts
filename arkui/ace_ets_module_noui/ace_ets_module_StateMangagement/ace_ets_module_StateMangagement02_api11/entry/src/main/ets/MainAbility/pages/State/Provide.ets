/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
 
import hilog from '@ohos.hilog';

@Component
struct ProvideB {
  aboutToAppear() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility index aboutToAppear');
  }

  @Consume reviewVotes: number
  @Consume('a') c: string
  @Consume sad: string
  @Consume('a') d: number
  @Consume('a') b: number
  @Consume('o') i: number
  @Consume('o') f: number

  build() {
    Column() {
      Text(`reviewVotes ${this.reviewVotes}`).id("ProvideB1").height('5%')
      Text(`descent same nickname dif name dif type ${this.c}`).id("ProvideB2").height('5%')
      Text(`descent none nickname same name dif type ${this.sad}`).id("ProvideB3").height('5%')
      Text(`descent same nickname dif name same type ${this.d}`).id("ProvideB4").height('5%')
      Text(`descent same nickname same name same type ${this.b}`).id("ProvideB5").height('5%')
      Text(`descent dif nickname dif same type ${this.i}`).id("ProvideB6").height('5%')

      Button(`reviewVotes ${this.reviewVotes}, give +1`)
        .height('5%')
        .onClick(() => this.reviewVotes += 1)
        .id("ProvideBReviewVotes")

      Row() {
        Button("change a")
          .height('5%')
          .width('50%')
          .onClick(() => {
            this.c = "changed"
          }).id("ProvideBChangeA")
        Button("change d")
          .height('5%')
          .width('50%')
          .onClick(() => {
            this.sad = "changed"
          }).id("ProvideBChangeD")
      }

      Row() {
        Button("change c")
          .height('5%')
          .width('33%')
          .onClick(() => {
            this.d += 1
          }).id("ProvideBChangeC")
        Button("change b")
          .height('5%')
          .width('33%')
          .onClick(() => {
            this.b += 1
          }).id("ProvideBChangeB")
        Button("change f")
          .height('5%')
          .width('33%')
          .onClick(() => {
            this.f += 1
            this.i += 2
          }).id("ProvideBChangeF")
      }
    }
    .width('100%')
    
  }
}


@Entry
@Component
struct ProvideA {
  aboutToAppear() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility index aboutToAppear');
  }

  @Provide reviewVotes: number = 0
  @Provide('a') b: number = 0
  @Provide sad: number = 0
  @Provide('o') i: number = 0

  build() {
    Column() {
      Button("Reset").id("ProvideA_reset").height('5%')
        .onClick(() => {
          this.reviewVotes = 0
          this.b = 0
          this.sad = 0
          this.i = 0
        })
      Text(`parent descent same nickname ${this.b}`).id("ProvideA1").height('5%')
      Text(`parent none nickname same name dif type ${this.sad}`).id("ProvideA2").height('5%')
      Text(`multi son single parent ${this.i}`).id("ProvideA3").height('5%')
      Button(`reviewVotes ${this.reviewVotes}, give +1`)
        .height('5%')
        .onClick(() => this.reviewVotes += 1)
        .id("ProvideAReviewVotes")
      Row() {
        Button("change a")
          .height('5%')
          .width('33%')
          .onClick(() => {
            this.b += 1
          }).id("ProvideAChangeA")
        Button("change b")
          .height('5%')
          .width('33%')
          .onClick(() => {
            this.sad += 1
          }).id("ProvideAChangeB")
        Button("change f")
          .height('5%')
          .width('33%')
          .onClick(() => {
            this.i += 1
          }).id("ProvideAChangeF")
      }

      ProvideB()
    }
    .width('100%')
  }
}
