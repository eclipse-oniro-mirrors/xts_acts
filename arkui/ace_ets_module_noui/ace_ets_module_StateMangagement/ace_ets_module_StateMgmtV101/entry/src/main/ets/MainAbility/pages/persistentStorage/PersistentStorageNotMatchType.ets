/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

@Observed
export class SampleChild1 {
  @Track public childId: number = 0;
  public groupId: number = 1;
  @Track public set: Set<number> = new Set([5, 6]);

}

@Observed
export class Sample1 {
  @Track public father: SampleChild1 = new SampleChild1();
}

@Entry
@Component
struct Page1 {
  @StorageLink('Page1') pageSample: Sample1 = new Sample1()


  aboutToAppear() {
    PersistentStorage.persistProp('Page1', new Sample1())
  }

  build() {
    Column() {
      Button(JSON.stringify(this.pageSample.father.set))
        .id('button_set_array')
        .height('5%')
        .onClick(() => {
          const obj = { childId: 1, groupId: 1, set: [1, 2] } as ESObject as SampleChild1
          this.pageSample.father = obj
        })
      Button(JSON.stringify(this.pageSample.father.set))
        .id('button_set_custom_class')
        .height('5%')
        .onClick(() => {
          const obj = { childId: 1, groupId: 1, set: new Cls() } as ESObject as SampleChild1
          this.pageSample.father = obj
        })
    }
    .padding({top: '5%', left: '5%', right: '5%', bottom:'5%'})
  }
}

class Cls {
  public n1:number= 0
}