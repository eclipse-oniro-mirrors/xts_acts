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

import { PersistenceV2, Type } from '@kit.ArkUI';

@ObservedV2
class SampleChildPersistenceV2TypeMismatch {
  @Trace public childId: number = 0;
  public groupId: number = 1;
  @Trace public set: Set<number> = new Set([5, 6]);
}

@ObservedV2
export class SamplePersistenceV2TypeMismatch {
  @Type(SampleChildPersistenceV2TypeMismatch)
  @Trace public father: SampleChildPersistenceV2TypeMismatch = new SampleChildPersistenceV2TypeMismatch();
}

@ObservedV2
class ClsPersistenceV2TypeMismatch {
  @Trace public n1: number = 0;
}

@Entry
@ComponentV2
struct PersistenceV2TypeMismatch {
  @Local p: SamplePersistenceV2TypeMismatch = PersistenceV2.globalConnect({
    type: SamplePersistenceV2TypeMismatch,
    key: 'SamplePersistenceV2TypeMismatch',
    defaultCreator: () => new SamplePersistenceV2TypeMismatch()
  })!;
  @Local resultText: string = '';

  build() {
    Column() {
      Button('change type')
        .id('btn_change_type')
        .height('5%')
        .onClick(() => {
          try {
            const obj = { 
              childId: 1, 
              groupId: 1, 
              set: new ClsPersistenceV2TypeMismatch() 
              } as ESObject as SampleChildPersistenceV2TypeMismatch;
            this.p.father = obj;
            this.resultText = 'SUCCESS: Type mismatch handled';
          } catch (err) {
            this.resultText = 'ERROR: ' + (err as Error).message;
          }
        })
      Text(`Father set: ${JSON.stringify(this.p.father.set)}`)
        .height('5%')
        .id('text_father_set')
      Text(`Result: ${this.resultText}`)
        .id('text_result')
        .height('5%')
      Text(`ChildId: ${this.p.father.childId}`)
        .id('text_childId')
        .height('5%')
    }
    .height('100%')
    .width('100%')
    .justifyContent(FlexAlign.Center)
  }
}