/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';

let TAG: string = 'testTag';
let UI_EXTENSION_LOAD_CONTENT_TEST0800_RET: string = 'UIExtension_LoadContent_Test0800_ret';

@Entry({ routeName: 'HapPageNoStorage' })
@Component
struct HapPageNoStorage {
  @State message: string = 'HapPageNoStorage';

  publishCb(err: BusinessError) {
    if (err) {
      hilog.info(0x0000, TAG, 'publish failed %{public}s', JSON.stringify(err));
    } else {
      hilog.info(0x0000, TAG, '%{public}s', 'publish success');
    }
  }

  aboutToAppear() {
    console.info('testTag' + 'UIExtAbilityPage aboutToAppear');
    let options: commonEventManager.CommonEventPublishData = {
      parameters: {
        'testCaseResultCode': true,
      }
    }
    commonEventManager.publish(UI_EXTENSION_LOAD_CONTENT_TEST0800_RET, options, this.publishCb);
  }

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}
