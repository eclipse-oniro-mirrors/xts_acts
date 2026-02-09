/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import {
  ComponentInit,
  ComponentAppear,
  ComponentBuilt,
  ComponentDisappear,
  ComponentReuse,
  ComponentRecycle,
  CustomComponentLifecycle,
  UIUtils,
  CustomComponentLifecycleState
} from '@kit.ArkUI';

@Entry
@Component
struct LifeCycle0310 {
  @State switch: boolean = true;

  build() {
    Column() {
      Button('change flag')
        .id('LifeCycle0310_01')
        .height('5%')
        .onClick(() => {
          this.switch = !this.switch;
        })
      if (this.switch) {
        Child1({ message: 'www' })
          .reuseId('Child')
        Child2({ message: 'ccc' })
      }
    }
    .height('90%')
    .width('90%')
  }
}

@Reusable
@Component
struct Child1 {
  @State message: string = 'ww';

  @ComponentInit
  myInit() {
    let leftStyle: CustomComponentLifecycle = UIUtils.getLifecycle(this);
    AppStorage.setOrCreate<CustomComponentLifecycleState>('Child1ComponentInit', leftStyle.getCurrentState())
  }

  @ComponentAppear
  myAppear() {
    let leftStyle: CustomComponentLifecycle = UIUtils.getLifecycle(this);
    AppStorage.setOrCreate<CustomComponentLifecycleState>('Child1ComponentAppear', leftStyle.getCurrentState())
  }

  @ComponentBuilt
  myBuilt() {
    let leftStyle: CustomComponentLifecycle = UIUtils.getLifecycle(this);
    AppStorage.setOrCreate<CustomComponentLifecycleState>('Child1ComponentBuilt', leftStyle.getCurrentState())
  }

  @ComponentRecycle
  myRecycle() {
    let leftStyle: CustomComponentLifecycle = UIUtils.getLifecycle(this);
    AppStorage.setOrCreate<CustomComponentLifecycleState>('Child1ComponentRecycle', leftStyle.getCurrentState())
  }

  @ComponentDisappear
  myDisappear() {
    let leftStyle: CustomComponentLifecycle = UIUtils.getLifecycle(this);
    AppStorage.setOrCreate<CustomComponentLifecycleState>('Child1ComponentDisappear', leftStyle.getCurrentState())
  }

  @ComponentReuse
  myReuse() {
    let leftStyle: CustomComponentLifecycle = UIUtils.getLifecycle(this);
    AppStorage.setOrCreate<CustomComponentLifecycleState>('Child1ComponentReuse', leftStyle.getCurrentState())
  }

  build() {
    Column() {
      Text(this.message)
        .height('5%')
    }
  }
}

@Component
struct Child2 {
  @State message: string = 'ww';

  @ComponentAppear
  myAppear() {
    let leftStyle: CustomComponentLifecycle = UIUtils.getLifecycle(this);
    AppStorage.setOrCreate<CustomComponentLifecycleState>('Child2ComponentAppear', leftStyle.getCurrentState())
  }

  @ComponentBuilt
  myBuilt() {
    let leftStyle: CustomComponentLifecycle = UIUtils.getLifecycle(this);
    AppStorage.setOrCreate<CustomComponentLifecycleState>('Child2ComponentBuilt', leftStyle.getCurrentState())
  }

  @ComponentRecycle
  myRecycle() {
    let leftStyle: CustomComponentLifecycle = UIUtils.getLifecycle(this);
    AppStorage.setOrCreate<CustomComponentLifecycleState>('Child2ComponentRecycle', leftStyle.getCurrentState())
  }

  @ComponentDisappear
  myDisappear() {
    let leftStyle: CustomComponentLifecycle = UIUtils.getLifecycle(this);
    AppStorage.setOrCreate<CustomComponentLifecycleState>('Child2ComponentDisappear', leftStyle.getCurrentState())
  }

  @ComponentReuse
  myReuse() {
    let leftStyle: CustomComponentLifecycle = UIUtils.getLifecycle(this);
    AppStorage.setOrCreate<CustomComponentLifecycleState>('Child2ComponentReuse', leftStyle.getCurrentState())
  }

  build() {
    Column() {
      Text(this.message)
        .height('5%')
    }
  }
}