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

@ComponentV2
struct Child02Global001 {
  @Consumer() provide: number = 10;

  aboutToAppear() {
    console.info('Child02Global001 aboutToAppear');
  }
  aboutToReuse() {
    console.info('Child02Global001 aboutToReuse');
    this.provide = 150;
  }
  aboutToRecycle() {
    console.info('Child02Global001 aboutToRecycle');
  }
  aboutToDisappear() {
    console.info('Child02Global001 aboutToDisappear');
  }

  build() {
    Column({ space: 20 }) {
      Text(`Child02Global001 @Consumer: ${this.provide}`)
        .fontSize(20)
        .fontColor(Color.Green)
      SubChildGlobal001()
    }
  }
}
@ReusableV2
@ComponentV2
struct SubChildGlobal001 {
  @Consumer() provide: number = 10;

  aboutToAppear() {
    console.info('SubChildGlobal001 aboutToAppear');
  }
  aboutToReuse() {
    AppStorage.setOrCreate('GlobalReuse002', true)
    console.info('SubChildGlobal001 aboutToReuse');
  }
  aboutToRecycle() {
    console.info('SubChildGlobal001 aboutToRecycle');
  }
  aboutToDisappear() {
    console.info('SubChildGlobal001 aboutToDisappear');
  }

  build() {
    Text(`SubChildGlobal001 @Consumer: ${this.provide}`)
      .height('5%')
  }
}

@Entry
@ComponentV2({ reusePool: 'perInstance', poolAccepts: ['SubChildGlobal001'], freezeWhenInactive: false })
struct GlobalReuse002 {
  @Provider() provide: number = 100;
  @Local boolVal: boolean = false;
  @Local boolVal2: boolean = false;

  build() {
    Column({ space: 10 }) {
      Button('切换组件')
        .height('5%')
        .id('GlobalReuse002Change')
        .onClick(() => {
          this.boolVal = !this.boolVal;
        })
      Text(`父组件 Provider: ${this.provide}`)
        .height('5%')
      Button('增加 +10')
        .height('5%')
        .onClick(() => {
          this.provide += 10;
        })

      if (this.boolVal) {
        Text('ChildGlobal001组件')
          .height('5%')
        ChildGlobal001()
      }else  {
        Text('Child02Global001可复用组件')
          .height('5%')
        Child02Global001()
      }
    }
  }
}
@ComponentV2
struct ChildGlobal001 {
  @Consumer() provide: number = 10;

  aboutToAppear() {
    console.info('ChildGlobal001 aboutToAppear');
  }
  aboutToDisappear() {
    console.info('ChildGlobal001 aboutToDisappear');
  }

  build() {
    Column({ space: 20 }) {
      Text(`ChildGlobal001 @Consumer: ${this.provide}`)
        .height('5%')
      SubChildGlobal001()
    }
  }
}