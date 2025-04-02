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

@ComponentV2
struct ChildRequire {
  @Param @Require childRequireMsg: string

  build() {
    Row({ space: 3 }) {
      Text(this.childRequireMsg).id('tvChildRequireMsg')
    }
  }
}

@ComponentV2
struct ChildArrParam {
  @Param childSet: Set<number> = new Set()
  @Param childMap: Map<string, string> = new Map()
  @Param childDate: Date = new Date('2000/01/01')

  build() {
    Column({ space: 3 }) {
      Text(Array.from(this.childSet).toString()).id('tvChildSet')
      Text(this.childMap.get('map')).id('tvChildMap')
      Text(this.childDate.toTimeString()).id('tvChildDate')
    }
  }
}

@ComponentV2
struct ChildParentParm {
  @Param nestChildMsg: string = ''

  build() {
    Row({ space: 3 }) {
      Text(this.nestChildMsg).id('tvNestChild')
      ChildRequire({ childRequireMsg: this.nestChildMsg })
    }
  }
}

@ComponentV2
struct ChildUnionParm {
  @Param childUnionType: number | null | undefined = 0

  build() {
    Row() {
      Text(JSON.stringify(this.childUnionType)).id('tvChildUnionType')
    }
  }
}

@ComponentV2
export struct ChildParam {
  @Param childMsg: string = ''
  @Event changeChildMsg: () => void = () => {
  }

  build() {
    Column({ space: 3 }) {
      Text(this.childMsg).id('tvChildMsgEvent').onClick(() => {
        this.changeChildMsg()
      })
    }
  }
}


@Entry
@ComponentV2
export struct ParamTest {
  @Local message: string = 'message'
  @Local set: Set<number> = new Set([1, 1, 1, 1])
  @Local map: Map<string, string> = new Map()
  @Local date: Date = new Date('2024/07/15')
  @Local unionType: number | null | undefined = null

  aboutToAppear(): void {
    this.map.set('map', 'Map')
  }

  build() {
    Scroll() {
      Column({ space: 5 }) {
        Column({ space: 3 }) {
          Button('ChangeArrParam')
            .id('btnChangeArrParam')
            .onClick(() => {
              this.set.clear()
              this.set.add(5)
              this.set.add(5)
              this.map.set('map', 'value0')
              this.date.setTime(this.date.getTime() + 1000)
            })
          ChildArrParam({ childSet: this.set, childMap: this.map, childDate: this.date })
        }

        Column({ space: 3 }) {
          Text(JSON.stringify(this.unionType))
            .id('tvUnionType')
            .onClick(() => {
              this.unionType = 100
            })
          ChildUnionParm({ childUnionType: this.unionType })
        }

        Column({ space: 3 }) {
          Text(this.message)
            .id('tvNestGrandpa')
            .onClick(() => {
              this.message = 'tvNestGrandpa'
            })
          ChildParentParm({ nestChildMsg: this.message })
        }

        Column({ space: 3 }) {
          Text(this.message).id('tvMsgEvent')
          ChildParam({
            childMsg: this.message, changeChildMsg: () => {
              this.message = 'ARKUI'
            }
          })
        }
      }
      .alignItems(HorizontalAlign.Start)
      .justifyContent(FlexAlign.Start)
    }
    .width('100%')
    .scrollBar(BarState.Off)
  }
}