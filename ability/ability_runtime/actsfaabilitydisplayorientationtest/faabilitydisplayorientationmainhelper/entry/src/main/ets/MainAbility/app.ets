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

const Event_FA_DisplayOrientation_0500 = 'Event_FA_DisplayOrientation_0500';
const Event_FA_DisplayOrientation_0500_LifeCircle = 'Event_FA_DisplayOrientation_0500_LifeCircle';
const Event_FA_DisplayOrientation_0600 = 'Event_FA_DisplayOrientation_0600';
const Event_FA_DisplayOrientation_0600_LifeCircle = 'Event_FA_DisplayOrientation_0600_LifeCircle';
let lifeCircleData = [];

function publishEvent(event, parameter) {
  commonEvent.publish(event,
    {
      parameters: {
        data: parameter
      }
    }, (e, v) => {
      hilog.info(0x0000, 'testTag', '%{public}s', `publish  event : ${event} , e: ${JSON.stringify(e)}`);
    })
}

export default {
  onCreate() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Application onCreate');
    lifeCircleData[0] = 'onCreate';
  },
  onDestroy() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Application onDestroy');
  },
  onActive() {
    try {
      hilog.info(0x0000, 'testTag', '%{public}s', 'Application onActive');
      lifeCircleData[1] = 'onActive';

      featureAbility.getWant((err, want) => {
        hilog.info(0x0000, 'testTag', '%{public}s', `get want: ${JSON.stringify(want)}`);
        let number = want.parameters.data;
        switch (number) {
          case 3:
            hilog.info(0x0000, 'testTag', '%{public}s', `case 3 ----->`);
            featureAbility.getContext().getDisplayOrientation((error, data) => {
              hilog.info(0x0000, 'testTag', '%{public}s', `getDisplayOrientation main data: ${data}, err: ${JSON.stringify(error)}`);
              if (bundle.DisplayOrientation.UNSPECIFIED == data) {
                featureAbility.getContext().setDisplayOrientation(bundle.DisplayOrientation.FOLLOW_RECENT)
                  .then(() => {
                    hilog.info(0x0000, 'testTag', '%{public}s', 'setDisplayOrientation main data');
                    featureAbility.getContext().getDisplayOrientation()
                      .then(data => {
                        hilog.info(0x0000, 'testTag', '%{public}s', `getDisplayOrientation main-2 data: ${data},
                            orientation: ${bundle.DisplayOrientation.LANDSCAPE}`);
                        if (bundle.DisplayOrientation.LANDSCAPE == data && lifeCircleData.length == 2) {
                          publishEvent(Event_FA_DisplayOrientation_0500, true);
                        } else {
                          publishEvent(Event_FA_DisplayOrientation_0500, false);
                        }
                        featureAbility.terminateSelf();
                      })
                  })
              }
            })
            break;
          case 4:
            hilog.info(0x0000, 'testTag', '%{public}s', `case 4 ----->`);
            featureAbility.getContext().getDisplayOrientation((error, data) => {
              hilog.info(0x0000, 'testTag', '%{public}s', `getDisplayOrientation main data: ${data}, err: ${JSON.stringify(error)}`);
              if (bundle.DisplayOrientation.UNSPECIFIED == data) {
                featureAbility.getContext().setDisplayOrientation(bundle.DisplayOrientation.FOLLOW_RECENT)
                  .then(() => {
                    hilog.info(0x0000, 'testTag', '%{public}s', 'setDisplayOrientation main data');
                    featureAbility.getContext().getDisplayOrientation()
                      .then(data => {
                        hilog.info(0x0000, 'testTag', '%{public}s', `getDisplayOrientation main-2 data: ${data},
                            orientation: ${bundle.DisplayOrientation.PORTRAIT}`);
                        if (bundle.DisplayOrientation.PORTRAIT == data && lifeCircleData.length == 2) {
                          publishEvent(Event_FA_DisplayOrientation_0600, true);
                        } else {
                          publishEvent(Event_FA_DisplayOrientation_0600, false);
                        }
                        featureAbility.terminateSelf();
                      })
                  })
              }
            })
            break;
        }
      })
    } catch (err) {
      hilog.info(0x0000, 'testTag', '%{public}s', `err------> : ${JSON.stringify(err)}`);
    }
  }
}