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
@ObservedV2
class ClassB {
  @Trace name: string

  constructor(name: string) {
    this.name = name
  }
}

@ComponentV2
struct Child {
  @Param childParamMsg: string = 'childParamMsg'

  build() {
    Column() {
      Text(this.childParamMsg).id('tvChildParamMsg')
    }
  }
}


@Entry
@ComponentV2
struct LocalTest {
  @Local message: string = 'hello'
  @Local count: number = 0
  @Local countJoint: number | undefined = 0
  @Local tvArr: string[] = ['message', 'message1']
  @Local tvDate: Date = new Date('2024/01/01')
  @Local tvMap: Map<string, number> = new Map()
  @Local tvSet: Set<string> = new Set(['1', '1', '2'])
  @Local classB: ClassB = new ClassB('hello')

  aboutToAppear(): void {
    this.tvMap.set('key0', 1)
  }

  build() {
    Column({ space: 5 }) {
      Column({ space: 3 }) {
        Text(this.message)
          .id('tvParamMsg')
          .onClick(() => {
            this.message = 'ARKUI'
          })
        Child({ childParamMsg: this.message })
      }
      Text(this.countJoint?.toString())
        .id('countJoint')
        .onClick(() => {
          this.countJoint = 1
        })
      Column({ space: 3 }) {
        Text(this.tvArr[0])
          .id('tvArr')
          .onClick(() => {
            this.tvArr[0] = 'tvArr'
          })
        Text(this.tvDate.toDateString())
          .id('tvDate')
          .onClick(() => {
            this.tvDate = new Date('2024/01/02')
          })
        Text(this.tvMap.get('key0')?.toString())
          .id('tvMap')
          .onClick(() => {
            this.tvMap.set('key0', 2)
          })
        Text(Array.from(this.tvSet.values()).toString())
          .id('tvSet')
          .onClick(() => {
            this.tvSet.add('3')
          })
      }
      Text(this.count.toString())
        .id('tvCount')
        .onClick(() => {
          this.count = 2
        })
      Text(this.classB.name)
        .id('tvTraceName')
        .onClick(()=> {
          this.classB.name = 'tvTraceName'
        })
      Column({space: 3}) {
        Text(this.tvArr.length.toString())
          .id('tvAddItem')
          .onClick(()=>{
            this.tvArr.push('item' + this.tvArr.length)
          })
        Text(this.tvArr.length.toString())
          .id('tvRemoveItem')
          .onClick(()=> {
            this.tvArr.shift()
          })
      }
    }
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Start)
    .width('100%')
    .height('100%')
  }
}