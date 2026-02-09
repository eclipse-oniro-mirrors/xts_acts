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
struct provideBrother13 {
  @Consume("reviewVotes") reviewVotes: number;

  build() {
    Column() {
      Text(`reviewVotes(${this.reviewVotes})`).height('5%')
      Button(`reviewVotes(${this.reviewVotes}), give +1`)
        .onClick(():void => {
          this.reviewVotes += 1
        })
        .id("provideBrother1")
        .height('5%')
    }
    .width('50%')
  }
}

@Component
struct provideBrother12 {
  @Provide({allowOverride :true}) reviewVotes: number = 10;
  build() {
    Column() {
      Text(`reviewVotes(${this.reviewVotes})`).height('5%')
      Button(`reviewVotes(${this.reviewVotes}), give +1`)
        .onClick(():void => {
          this.reviewVotes += 1
        })
        .height('5%')
    }
    .width('50%')
  }
}

@Component
struct provideBrother11 {
  @Provide({allowOverride : true}) reviewVotes: number = 20;
  build() {
    Column(){
      provideBrother12()
      provideBrother13()
    }
  }
}

@Entry
@Component
struct provideBrother1 {
  @Provide({alias:"reviewVotes"}) reviewVotes: number = 40;

  build() {
    Column() {
      Button(`reviewVotes(${this.reviewVotes}), give +1`)
        .onClick(():void => {
          this.reviewVotes += 1
        })
      provideBrother11()
    }
  }
}