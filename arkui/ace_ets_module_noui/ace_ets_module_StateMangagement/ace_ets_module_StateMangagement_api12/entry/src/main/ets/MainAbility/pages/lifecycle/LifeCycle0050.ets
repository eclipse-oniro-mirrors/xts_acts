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

@ComponentV2
struct SonLifeCycle0050 {
  @Local state: string = ''

  onDidBuild(): void {
    this.state = 'SonDidBuild'
  }

  build() {
    Column() {
      Text(this.state).id('tvLifeCycle0050Son')
    }
  }
}

@ComponentV2
struct SubLifeCycle0050 {
  @Param @Require isShow: boolean
  @Local state: string = ''

  onDidBuild(): void {
    this.state = 'SubDidBuild'
  }

  build() {
    Column() {
      Text(this.state).id('tvLifeCycle0050Sub')
      if (this.isShow) {
        SonLifeCycle0050()
      }
    }
  }
}

@Entry
@ComponentV2
struct LifeCycle0050 {
  @Local isShow: boolean = false
  @Local state: string = ''

  onDidBuild(): void {
    this.state = 'ParentDidBuild'
  }

  build() {
    Column({ space: 5 }) {
      Text(this.state).id('tvLifeCycle0050Parent')
      if (this.isShow) {
        SubLifeCycle0050({isShow: this.isShow})
      }
      Button('ChangeState')
        .id('btnLifeCycle0050Change')
        .onClick(()=>{
          this.isShow = !this.isShow
        })
    }
  }
}