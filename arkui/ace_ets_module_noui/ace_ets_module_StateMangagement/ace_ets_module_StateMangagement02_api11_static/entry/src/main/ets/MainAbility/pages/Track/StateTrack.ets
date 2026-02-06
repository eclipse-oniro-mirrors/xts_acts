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

import {
  Entry,
  Column,
  Component,
  Button,
  ClickEvent,
  ForEach,
  Text,
  Row,
  Color
} from '@ohos.arkui.component'
import {
  State,
  Watch,
  PropRef,
  ObjectLink,
  Link,
  LocalStoragePropRef,
  LocalStorageLink,
  Consume,
  Provide,
  StorageLink,
  Observed,
  Track,
  LocalStorage,
  SubscribedAbstractProperty,
  AbstractProperty
} from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';

@Observed
class Member1 {
  @Track memberA: number = 20
  @Track memberB: string = 'MemberB'
}

@Observed
class Member2 extends Member1 {
  @Track memberC: number = 30
}

@Component
struct propChild {
  @PropRef prop: Member2

  build() {
    Column() {
      Text('@PropRef').fontSize(9).height('5%')
      Text('memberA=' + `${this.prop.memberA}`).height('5%')
        .key('Track_prop')
        .fontSize(9)
      Text('memberC=' + `${this.prop.memberC}`).height('5%')
        .key('Track_prop1')
        .fontSize(9)
    }
    .height('10%')
  }
}

@Component
struct objectLinkChild {
  @ObjectLink objectlink: Member2

  build() {
    Column() {
      Text('@ObjectLink').fontSize(9).height('5%')
      Text('memberA=' + `${this.objectlink.memberA}`).height('5%')
        .key('Track_objectlink')
        .fontSize(9)
      Text('memberC=' + `${this.objectlink.memberC}`).height('5%')
        .key('Track_objectlink1')
        .fontSize(9)
    }
    .height('10%')
  }
}

@Component
struct linkChild {
  @Link link: Member2

  build() {
    Column() {
      Text('@Link').fontSize(9).height('5%')
      Text('memberA=' + `${this.link.memberA}`).height('5%')
        .key('Track_link')
        .fontSize(9)
      Text('memberC=' + `${this.link.memberC}`).height('5%')
        .key('Track_link1')
        .fontSize(9)
    }
    .height('10%')
  }
}

@Entry
@Component
struct stateTrack {
  @State me: Member2 = new Member2()

  build() {
    Column() {
      Button("Reset").key("StateTrack_reset").height('5%')
        .onClick((): void => {
          this.me.memberA = 20
          this.me.memberA = 30
        })
      Column() {
        Text('@State').fontSize(9).height('5%')
        Text('memberA=' + `${this.me.memberA}`).height('5%')
          .key('Track_state')
          .fontSize(9)
        Text('memberC=' + `${this.me.memberC}`).height('5%')
          .key('Track_state1')
          .fontSize(9)
      }
      .border({ width: 2, color: Color.Yellow })
      .height('10%')

      Column() {
        propChild({ prop: this.me })
      }
      .border({ width: 2, color: Color.Red })

      Column() {
        objectLinkChild({ objectlink: this.me })
      }
      .border({ width: 2, color: Color.Green })

      Column() {
        linkChild({ link: this.me })
      }
      .border({ width: 2, color: Color.Orange })

      Button('改变memberA').height('5%')
        .key('change_stateA')
        .onClick((): void => {
          this.me.memberA += 1
        })
      Button('改变memberC').height('5%')
        .key('change_stateB')
        .onClick((): void => {
          this.me.memberC += 1
        })
    }
    .width('100%')
    .height('100%')
  }
}
