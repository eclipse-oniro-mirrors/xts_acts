/*
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
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import hilog from '@ohos.hilog';
import testsuite from '../../test/List.test'
import { Constants } from './Utils/Constants';

@Entry
@Component
struct WebComponent {
  aboutToAppear() {
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility index aboutToAppear');
    let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
    let abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments();
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
    hilog.info(0x0000, 'testTag', '%{public}s', 'start run testcase!!!');
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
  }


  readonly caseText: string = 'ArkUIHDS_Text_privacySensitive_'
  readonly caseImage: string = 'ArkUIHDS_Image_privacySensitive_'

  build() {
    Column() {
      Text("Text与Image组件测试卡片privacySensitive:true")
        .key(Constants.getCaseName(this.caseText, 1))
        .privacySensitive(true)
      Text("Text与Image组件测试卡片privacySensitive:false")
        .key(Constants.getCaseName(this.caseText, 2))
        .privacySensitive(false)
      Text("Text与Image组件测试卡片privacySensitive:null")
        .key(Constants.getCaseName(this.caseText, 3))
        .privacySensitive(null)
      Text("Text与Image组件测试卡片privacySensitive:false")
        .key(Constants.getCaseName(this.caseText, 4))
        .privacySensitive(undefined)
        Image($r("app.media.icon"))
        .borderWidth(1)
        .height("10%")
        .privacySensitive(true)
        .key(Constants.getCaseName(this.caseImage, 1))
      Image($r("app.media.icon"))
        .borderWidth(1)
        .height("10%")
        .privacySensitive(false)
        .key(Constants.getCaseName(this.caseImage, 2))
      Image($r("app.media.icon"))
        .borderWidth(1)
        .height("10%")
        .privacySensitive(null)
        .key(Constants.getCaseName(this.caseImage, 3))
      Image($r("app.media.icon"))
        .borderWidth(1)
        .height("10%")
        .privacySensitive(undefined)
        .key(Constants.getCaseName(this.caseImage, 4))
    }
  }
}

