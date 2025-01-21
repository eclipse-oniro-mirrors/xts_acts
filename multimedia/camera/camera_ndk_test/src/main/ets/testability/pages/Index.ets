/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';
import common from '@ohos.app.ability.common';
import { GlobalThis } from '../../test/Constants';

let TAG = 'CameraXts CameraModuleTest: ';
let mXComponentController: XComponentController = new XComponentController();
export let mContext = getContext(this) as common.Context;

@Entry
@Component
struct CameraIndex {
  aboutToAppear() {
    console.info(TAG + ' --------------aboutToAppear--------------');
  }

  build() {
    Flex() {
      XComponent({
        id: '',
        type: 'surface',
        libraryname: '',
        controller: mXComponentController
      })
        .onLoad(async () => {
          console.info(TAG + 'CameraModuleTest: OnLoad() is called!');
          mXComponentController.setXComponentSurfaceSize({ surfaceWidth: 1920, surfaceHeight: 1080 });
          let surfaceId = mXComponentController.getXComponentSurfaceId();
          GlobalThis.getInstance().setValue(surfaceId);
          mContext = getContext(this);
          let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
          let abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments();
          Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
        })
        .width('1920px')
        .height('1080px')
    }
  }
}