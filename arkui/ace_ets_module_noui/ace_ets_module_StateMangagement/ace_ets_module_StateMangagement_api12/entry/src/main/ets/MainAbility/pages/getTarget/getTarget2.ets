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

@ObservedV2
class InfoV1Observedv2 {
  name: string = 'Tom';

  constructor(name: string) {
    this.name = name;
  }
}

@Observed
class InfoV1Observed {
  public a: InfoV1Observedv2;

  constructor(a: InfoV1Observedv2) {
    this.a = a;
  }
}

let g0: InfoV1Observedv2 = new InfoV1Observedv2('world');//无代理
@Entry
@Component
struct V1GetTarget2 {
  @State votes: InfoV1Observed = new InfoV1Observed(g0)

  build() {
    Column() {
      Text(`this.InfoV1Observed === g0 ${this.votes.a ===
      g0}`).id('useGetTarget2_1') // true
      Text(`UIUtils.getTarget(this.InfoV1Observed) === g0: ${UIUtils.getTarget(this.votes.a) ===
      g0}`).id('useGetTarget2_2') // true
    }
  }
}