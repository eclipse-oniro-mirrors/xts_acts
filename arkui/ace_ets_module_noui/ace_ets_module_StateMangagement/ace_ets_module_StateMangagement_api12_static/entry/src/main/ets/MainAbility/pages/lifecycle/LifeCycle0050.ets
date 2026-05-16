'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import observer from '@ohos.arkui.observer';
import { UIObserver } from '@ohos.arkui.UIContext';
import router from '@ohos.router';
import {
  Entry,
  Column,
  Component,
  Button,
  ClickEvent,
  ForEach,
  Text,
  Row,
  List,
  ListItem,
  DataChangeListener,
  DataOperation,
  LazyForEach,
  IDataSource,
  DataOperationType,ComponentV2
} from '@ohos.arkui.component'
import {
  State,
  Watch,
  Link,
  StorageLink,Local, Param, Require
} from '@ohos.arkui.stateManagement'
@ComponentV2
struct SonLifeCycle0050 {
  state: string = ''
  @Local showState: string = ''

  onDidBuild(): void {
    this.state = 'SonDidBuild'
  }

  build() {
    Column() {
      Text(this.showState).id('tvLifeCycle0050Son')
      Button('showState3')
        .id('showState3')
        .onClick(()=>{
          this.showState = this.state
        })
    }
  }
}

@ComponentV2
struct SubLifeCycle0050 {
  @Param @Require isShow: boolean
  state: string = ''
  @Local showState: string = ''

  onDidBuild(): void {
    this.state = 'SubDidBuild'
  }

  build() {
    Column() {
      Text(this.showState).id('tvLifeCycle0050Sub')
      if (this.isShow) {
        SonLifeCycle0050()
      }
      Button('showState2')
        .id('showState2')
        .onClick(()=>{
          this.showState = this.state
        })
    }
  }
}

@Entry
@ComponentV2
struct LifeCycle0050 {
  @Local isShow: boolean = false
  state: string = ''
  @Local showState: string = ''

  onDidBuild(): void {
    this.state = 'ParentDidBuild'
  }

  build() {
    Column() {
      Text(this.showState).id('tvLifeCycle0050Parent')
      if (this.isShow) {
        SubLifeCycle0050({isShow: this.isShow})
      }
      Button('ChangeState')
        .id('btnLifeCycle0050Change')
        .onClick(()=>{
          this.isShow = !this.isShow
        })

      Button('showState')
        .id('showState')
        .onClick(()=>{
          this.showState = this.state
        })
    }
  }
}