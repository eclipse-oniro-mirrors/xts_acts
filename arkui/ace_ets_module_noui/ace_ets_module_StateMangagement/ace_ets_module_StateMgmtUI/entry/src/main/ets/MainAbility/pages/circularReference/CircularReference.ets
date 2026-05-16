/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { AppStorageV2, PersistenceV2, UIUtils } from '@ohos.arkui.StateManagement'

class CircularReferenceClass {
  private str: string

  constructor(str: string) {
    this.str = str
    console.info(JSON.stringify(this))
  }
}

@ObservedV2
class CircularReferenceClassV2 {
  @Trace private str: string

  constructor(str: string) {
    this.str = str
    console.info(JSON.stringify(this))
  }
}

@Observed
class CircularReferenceClassV1 {
  @Track private str: string

  constructor(str: string) {
    this.str = str
    console.info(JSON.stringify(this))
  }
}

@Builder
function circularReferenceBuilder() {
  Text('CircularReferenceBuilder')
}

let storage = new LocalStorage();
storage.setOrCreate('CircularReferenceLocalStorage', 48);

@Entry
@Component
struct CircularReferenceStruct {
  classV1: CircularReferenceClassV1 = new CircularReferenceClassV1('Hello')
  classV2: CircularReferenceClassV2 = new CircularReferenceClassV2('Hello')
  wrapBuilderVar: WrappedBuilder<[]> = wrapBuilder(circularReferenceBuilder);
  mutableBuilderVar: MutableBuilder<[]> = mutableBuilder(circularReferenceBuilder)

  aboutToAppear(): void {
    console.info(JSON.stringify(this))
    console.info(JSON.stringify(this.classV1))
    console.info(JSON.stringify(this.classV2))
    console.info(JSON.stringify(this.wrapBuilderVar))
    console.info(JSON.stringify(this.mutableBuilderVar))
    console.info(JSON.stringify(AppStorage.setOrCreate('CircularReferenceAppStorage', 47)))
    console.info(JSON.stringify(storage))
  }

  build() {
    Column() {
      CircularReferenceStructReusable()
    }
  }
}

@Reusable
@Component
struct CircularReferenceStructReusable {
  aboutToAppear(): void {
    console.info(JSON.stringify(this))
  }

  build() {
    Column() {
      CircularReferenceStructV2()
    }
  }
}

@ComponentV2
struct CircularReferenceStructV2 {
  arr: number[] = [1, 2, 3]
  @Local classA: CircularReferenceClassV2 =
    AppStorageV2.connect(CircularReferenceClassV2, 'classA', () => new CircularReferenceClassV2('Hello'))!!
  @Local classB: CircularReferenceClassV2 =
    PersistenceV2.connect(CircularReferenceClassV2, 'classB', () => new CircularReferenceClassV2('Hello'))!!
  @Local classC: Array<CircularReferenceClassV2> = PersistenceV2.globalConnect({
    key: 'classC',
    type: Array<CircularReferenceClassV2>,
    defaultCreator: () => new Array<CircularReferenceClassV2>(new CircularReferenceClassV2('Hello'),
      new CircularReferenceClassV2('Hello')),
    defaultSubCreator: () => new CircularReferenceClassV2('Hello')

  })!;
  mkObserved: CircularReferenceClass = UIUtils.makeObserved(new CircularReferenceClass('Hello'))
  targetClass: CircularReferenceClassV2 = UIUtils.getTarget(new CircularReferenceClassV2('Hello'))

  aboutToAppear(): void {
    console.info(JSON.stringify(this))
    console.info(JSON.stringify(this.classA))
    console.info(JSON.stringify(this.classB))
    console.info(JSON.stringify(this.classC))
    console.info(JSON.stringify(this.mkObserved))
    console.info(JSON.stringify(this.targetClass))
  }

  build() {
    Column() {
      Column() {
        List() {
          Repeat<number>(this.arr)
            .each((ri: RepeatItem<number>) => {
              ListItem() {
                CircularReferenceStructReusableV201()
              }
            })
            .templateId((item: number, index: number) => {
              return 'add'
            })
            .template('add', (ri) => {
              ListItem() {
                CircularReferenceStructReusableV201({ count: ri.item })
              }
            }, { cachedCount: 3 })
        }
      }
    }
  }
}

@ReusableV2
@ComponentV2
struct CircularReferenceStructReusableV2 {
  @Param count: number = 0

  aboutToAppear(): void {
    console.info(JSON.stringify(this))
  }

  build() {
    Text(`ArkUI${this.count}`)
  }
}

@ComponentV2
struct CircularReferenceStructReusableV201 {
  @Param count: number = 0

  aboutToAppear(): void {
    console.info(JSON.stringify(this))
  }

  build() {
    Column() {
      CircularReferenceStructReusableV2({ count: this.count })
    }
  }
}

