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
struct provideBrother23 {
  @Consume("reviewVotes") reviewVotes: number;

  build() {
    Column() {
      Text(`reviewVotes(${this.reviewVotes})`).height('5%')
      Button(`reviewVotes(${this.reviewVotes}), give +1`)
        .onClick(() => this.reviewVotes += 1)
        .id("provideBrother2")
        .height('5%')
    }
    .width('50%')
  }
}

@Component
struct provideBrother22 {
  @Provide({allowOverride : "reviewVotes"}) reviewVotes: number = 10;
  build() {
    Column() {
      Text(`reviewVotes(${this.reviewVotes})`).height('5%')
      Button(`reviewVotes(${this.reviewVotes}), give +1`)
        .onClick(() => this.reviewVotes += 1)
        .height('5%')
    }
    .width('50%')
  }
}

@Component
struct provideBrother21 {
  @Provide({allowOverride : "review"}) reviewVotes: number = 20;
  build() {
    Column(){
      provideBrother22()
      provideBrother23()
    }
  }
}

@Entry
@Component
struct provideBrother2 {
  @Provide("reviewVotes") reviewVotes: number = 40;

  build() {
    Column() {
      Button(`reviewVotes(${this.reviewVotes}), give +1`)
        .onClick(() => this.reviewVotes += 1)
        .height('5%')
      provideBrother21()
    }
  }
}