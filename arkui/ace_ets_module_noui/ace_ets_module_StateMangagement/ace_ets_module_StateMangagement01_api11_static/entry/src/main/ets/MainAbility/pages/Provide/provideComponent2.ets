'use static';
/*
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

import CommonFunc from '../../../MainAbility/common/Common';
import {
  Entry,
  Column,
  Component,
  Button,
  ClickEvent,
  Text,
  Row,
  Scroll,
  ButtonType,
  Flex,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Alignment,
  TextAlign,
  TextOverflow,
  FontWeight,
  Profiler,
  setAppBgColor,
  FlexWrap,$r,Resource
} from '@ohos.arkui.component'
import {
  State,
  Link,
  PropRef,Provide,Consume
} from '@ohos.arkui.stateManagement'
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
import CommonFunc from '../../../MainAbility/common/Common';
import common from '@ohos.app.ability.common';
import resourceManager from '@ohos.resourceManager';

@Component
struct provideComponent23 {
  @Consume reviewVotes1: number;

  build() {
    Column() {
      Text(`reviewVotes(${this.reviewVotes1})`).height('5%')
      Button(`reviewVotes(${this.reviewVotes1}), give +1`)
        .onClick(():void => {
          this.reviewVotes1 += 1
        })
        .id("provideComponent2")
        .height('5%')
    }
    .width('50%')
  }
}

@Component
struct provideComponent22 {
  @Provide({allowOverride : true }) reviewVotes: number = 10;
  @Provide({allowOverride : true }) reviewVotes1: number = 5;
  @Provide({allowOverride : true }) reviewVotes2: number = 1;
  build() {
    Row() {
      provideComponent23()
    }
  }
}

@Component
struct provideComponent21 {
  @Provide({allowOverride : true }) reviewVotes1: number = 20;
  build() {
    provideComponent22()
  }
}

@Entry
@Component
struct provideComponent2 {
  @Provide reviewVotes1: number = 40;

  build() {
    Column() {
      Button(`reviewVotes(${this.reviewVotes1}), give +1`)
        .onClick(():void => {
          this.reviewVotes1 += 1
        })
        .height('5%')
      provideComponent21()
    }
  }
}