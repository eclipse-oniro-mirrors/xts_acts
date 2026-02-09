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
import { UIUtils } from '@ohos.arkui.StateManagement'

@Observed
class InfoV1Observed {
  name: string = 'Tom';

  constructor(name: string) {
    this.name = name;
  }
}

@ObservedV2
class InfoV1Observedv2 {
  public a: InfoV1Observed;

  constructor(a: InfoV1Observed) {
    this.a = a;
  }
}

let g0: InfoV1Observed = new InfoV1Observed('world');//有代理
@Entry
@ComponentV2
struct V2GetTarget2 {
  @Local votes: InfoV1Observedv2 = new InfoV1Observedv2(g0)//不加代理

  build() {
    Column() {
      Text(`this.InfoV1Observed === g0 ${this.votes.a ===
      g0}`).id('useGetTarget4_1') // false
      Text(`UIUtils.getTarget(this.InfoV1Observed) === g0: ${UIUtils.getTarget(this.votes.a) ===
      g0}`).id('useGetTarget4_2') // true
    }
  }
}