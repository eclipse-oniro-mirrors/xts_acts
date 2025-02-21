/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import hilog from '@ohos.hilog';
import featureAbility from '@ohos.ability.featureAbility';
import bundle from '@ohos.bundle';
import commonEvent from '@ohos.commonEvent';

const Event_FA_DisplayOrientation_1000 = 'Event_FA_DisplayOrientation_1000';

function publishEvent(event, value) {
  commonEvent.publish(event,
    {
      parameters: {
        data: value
      }
    }, (err, data) => {
      hilog.info(0x0000, 'testTag', '%{public}s', `publish event: ${event}`);
    })
}

export default {
  onCreate() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Application onCreate');
  },
  onDestroy() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Application onDestroy');
  },
  onActive() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Application onActive - sec_ability');
    featureAbility.getWant((error, want) => {
      hilog.info(0x0000, 'testTag', '%{public}s', `get want: ${JSON.stringify(want)}`);
      featureAbility.getContext().getDisplayOrientation((err, orientation) => {
        if (bundle.DisplayOrientation.UNSPECIFIED == orientation) {
          featureAbility.getContext().setDisplayOrientation(bundle.DisplayOrientation.UNSPECIFIED, (error, data) => {
            featureAbility.getContext().getDisplayOrientation().then(value => {
              hilog.info(0x0000, 'testTag', '%{public}s', `getDisplayOrientation main-2 data: ${value},
                            orientation: ${bundle.DisplayOrientation.UNSPECIFIED}`);
              if (bundle.DisplayOrientation.UNSPECIFIED == value) {
                publishEvent(Event_FA_DisplayOrientation_1000, true);
              } else {
                publishEvent(Event_FA_DisplayOrientation_1000, false);
              }
              featureAbility.terminateSelf();
            })
          })
        }
      })
    })
  }
}