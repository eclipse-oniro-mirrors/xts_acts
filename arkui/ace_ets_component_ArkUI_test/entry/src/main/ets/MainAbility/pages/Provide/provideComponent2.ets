/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
@Component
struct provideComponent23 {
  @Consume reviewVotes1: number;

  build() {
    Column() {
      Text(`reviewVotes(${this.reviewVotes1})`)
      Button(`reviewVotes(${this.reviewVotes1}), give +1`)
        .onClick(() => this.reviewVotes1 += 1)
        .id("provideComponent2")
    }
    .width('50%')
  }
}

@Component
struct provideComponent22 {
  @Provide({allowOverride : "reviewVotes"}) reviewVotes: number = 10;
  @Provide({allowOverride : "reviewVotes"}) reviewVotes1: number = 5;
  @Provide({allowOverride : "reviewVotes"}) reviewVotes2: number = 1;
  build() {
    Row({ space: 5 }) {
      provideComponent23()
    }
  }
}

@Component
struct provideComponent21 {
  @Provide({allowOverride : "reviewVotes"}) reviewVotes1: number = 20;
  build() {
    provideComponent22()
  }
}

@Entry
@Component
struct provideComponent2 {
  @Provide("reviewVotes") reviewVotes1: number = 40;

  build() {
    Column() {
      Button(`reviewVotes(${this.reviewVotes1}), give +1`)
        .onClick(() => this.reviewVotes1 += 1)
      provideComponent21()
    }
  }
}