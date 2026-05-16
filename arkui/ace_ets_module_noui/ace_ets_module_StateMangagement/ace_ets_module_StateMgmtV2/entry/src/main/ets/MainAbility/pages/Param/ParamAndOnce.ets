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
class ParamInfo {
  @Trace name: string;

  constructor(name: string) {
    this.name = name;
  }
}

@ComponentV2
struct ParamAndOnceChild {
  @Param @Once onceParamNum: number = 0;
  @Param @Once @Require onceParamInfo: ParamInfo;

  build() {
    Column() {
      Text(`Child onceParamNum: ${this.onceParamNum}`).id('paramAndOnceText1')
      Text(`Child onceParamInfo: ${this.onceParamInfo.name}`).id('paramAndOnceText2')
      Button('changeOnceParamNum')
        .onClick(() => {
          this.onceParamNum++;
        })
        .id('paramAndOnceButton1')
      Button('changeParamInfo')
        .onClick(() => {
          this.onceParamInfo = new ParamInfo('Cindy');
        })
        .id('paramAndOnceButton2')
    }
  }
}

@Entry
@ComponentV2
struct ParamAndOnce {
  @Local localNum: number = 10;
  @Local localInfo: ParamInfo = new ParamInfo('Tom');

  build() {
    Column() {
      Text(`Parent localNum: ${this.localNum}`).id('paramAndOnceText3')
      Text(`Parent localInfo: ${this.localInfo.name}`).id('paramAndOnceText4')
      Button('changeLocalNum')
        .onClick(() => {
          this.localNum++;
        })
        .id('paramAndOnceButton3')
      Button('changeLocalInfo')
        .onClick(() => {
          this.localInfo = new ParamInfo('Cindy');
        })
        .id('paramAndOnceButton4')
      ParamAndOnceChild({
        onceParamNum: this.localNum,
        onceParamInfo: this.localInfo
      })
    }
  }
}