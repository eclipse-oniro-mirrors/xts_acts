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
import { BusinessError } from '@ohos.base';
const Event_FA_DisplayOrientation_0300 = 'Event_FA_DisplayOrientation_0300';
const Event_FA_DisplayOrientation_0300_LifeCircle = 'Event_FA_DisplayOrientation_0300_LifeCircle';
const Event_FA_DisplayOrientation_0400 = 'Event_FA_DisplayOrientation_0400';
const Event_FA_DisplayOrientation_0400_LifeCircle = 'Event_FA_DisplayOrientation_0400_LifeCircle';
const Event_FA_DisplayOrientation_0700 = 'Event_FA_DisplayOrientation_0700';
const Event_FA_DisplayOrientation_0800 = 'Event_FA_DisplayOrientation_0800';
const Event_FA_DisplayOrientation_0900 = 'Event_FA_DisplayOrientation_0900';
let lifeCircleData: string[] = [];

let publishEvent = (event: string, value: ESObject) => {
  commonEvent.publish(event,
    {
      parameters: {
        data: value
      }
    }, (err, data) => {
      hilog.info(0x0000, 'testTag', '%{public}s', `publish event: ${event}`);
    })
}

class FourthAbility {
  onCreate() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Application onCreate');
    lifeCircleData[0] = 'onCreate';
  }
  onDestroy() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Application onDestroy');
  }
  onActive() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Application onActive');
    lifeCircleData[1] = 'onActive';
    featureAbility.getWant((error, want) => {
      hilog.info(0x0000, 'testTag', '%{public}s', `get want: ${JSON.stringify(want)}`);
      let number = want.parameters?.number;
      switch (number) {
        case 1:
          hilog.info(0x0000, 'testTag', '%{public}s', 'case 1 ---->');
          featureAbility.getContext().getDisplayOrientation()
            .then(orientation => {
              if (bundle.DisplayOrientation.UNSPECIFIED == orientation) {
                featureAbility.getContext().setDisplayOrientation(bundle.DisplayOrientation.LANDSCAPE)
                  .then(() => {
                    featureAbility.getContext().getDisplayOrientation((err, data) => {
                      if (bundle.DisplayOrientation.LANDSCAPE == data) {
                        publishEvent(Event_FA_DisplayOrientation_0800, true);
                      } else {
                        publishEvent(Event_FA_DisplayOrientation_0800, false);
                      }
                      featureAbility.terminateSelf();
                    })
                  })
              }
            })
          break;
        case 2:
          hilog.info(0x0000, 'testTag', '%{public}s', 'case 2 ---->');
          featureAbility.getContext().getDisplayOrientation()
            .then(orientation => {
              if (bundle.DisplayOrientation.UNSPECIFIED == orientation) {
                featureAbility.getContext().setDisplayOrientation(bundle.DisplayOrientation.PORTRAIT)
                  .then(() => {
                    featureAbility.getContext().getDisplayOrientation((err, data) => {
                      if (bundle.DisplayOrientation.PORTRAIT == data) {
                        publishEvent(Event_FA_DisplayOrientation_0900, true);
                      } else {
                        publishEvent(Event_FA_DisplayOrientation_0900, false);
                      }
                      featureAbility.terminateSelf();
                    })
                  })
              }
            })
          break;
        case 3:
          featureAbility.getContext().getDisplayOrientation((err, data) => {
            hilog.info(0x0000, 'testTag', '%{public}s', `3-getDisplayOrientation data: ${data}`);
            if (bundle.DisplayOrientation.UNSPECIFIED == data) {
              featureAbility.getContext().setDisplayOrientation(bundle.DisplayOrientation.LANDSCAPE).then(() => {
                featureAbility.getContext().getDisplayOrientation((error, value) => {
                  hilog.info(0x0000, 'testTag', '%{public}s', `3-getDisplayOrientation2 data: ${value}`);
                  if (bundle.DisplayOrientation.LANDSCAPE == value) {
                    featureAbility.startAbility(
                      {
                        want: {
                          bundleName: 'com.ohos.actsfaabilitydisplayorientationhelper',
                          abilityName: 'com.ohos.actsfaabilitydisplayorientationhelper.MainAbility',
                          parameters: {
                            data: number
                          }
                        }
                      }
                    ).then(data => {
                      hilog.info(0x0000, 'testTag', '%{public}s', `fa startAbility data: ${data}`);
                      featureAbility.terminateSelf();
                    }).catch((err:BusinessError) => {
                      hilog.info(0x0000, 'testTag', '%{public}s', `fa startAbility err: ${JSON.stringify(err)}`);
                    })
                  }
                })
              })
            }
          })
          break;
        case 4:
          featureAbility.getContext().getDisplayOrientation((err, data) => {
            hilog.info(0x0000, 'testTag', '%{public}s', `4-getDisplayOrientation data: ${data}`);
            if (bundle.DisplayOrientation.UNSPECIFIED == data) {
              featureAbility.getContext().setDisplayOrientation(bundle.DisplayOrientation.PORTRAIT).then(() => {
                featureAbility.getContext().getDisplayOrientation((error, value) => {
                  hilog.info(0x0000, 'testTag', '%{public}s', `4-getDisplayOrientation2 data: ${value}`);
                  if (bundle.DisplayOrientation.PORTRAIT == value) {
                    featureAbility.startAbility(
                      {
                        want: {
                          bundleName: 'com.ohos.actsfaabilitydisplayorientationhelper',
                          abilityName: 'com.ohos.actsfaabilitydisplayorientationhelper.MainAbility',
                          parameters: {
                            data: number
                          }
                        }
                      }
                    ).then(data => {
                      hilog.info(0x0000, 'testTag', '%{public}s', `4-fa startAbility data: ${data}`);
                      featureAbility.terminateSelf();
                    }).catch((err:BusinessError) => {
                      hilog.info(0x0000, 'testTag', '%{public}s', `4-fa startAbility err: ${JSON.stringify(err)}`);
                    })
                  }
                })
              })
            }
          })
          break;
        case 5:
          featureAbility.getContext().getDisplayOrientation((err, data) => {
            hilog.info(0x0000, 'testTag', '%{public}s', `getDisplayOrientation data: ${data}`);
            if (bundle.DisplayOrientation.UNSPECIFIED == data) {
              featureAbility.getContext().setDisplayOrientation(bundle.DisplayOrientation.LANDSCAPE).then(() => {
                featureAbility.getContext().getDisplayOrientation((error, value) => {
                  hilog.info(0x0000, 'testTag', '%{public}s', `getDisplayOrientation2 data: ${value}`);
                  if (bundle.DisplayOrientation.LANDSCAPE == value) {
                    featureAbility.startAbility(
                      {
                        want: {
                          bundleName: 'com.ohos.actsfaabilitydisplayorientationhelper',
                          abilityName: 'com.ohos.feature1.MainAbility',
                          parameters: {
                            data: number
                          }
                        }
                      }
                    ).then(data => {
                      hilog.info(0x0000, 'testTag', '%{public}s', `fa startAbility data: ${data}`);
                      featureAbility.terminateSelf();
                    }).catch((err:BusinessError) => {
                      hilog.info(0x0000, 'testTag', '%{public}s', `fa startAbility err: ${JSON.stringify(err)}`);
                    })
                  }
                })
              })
            }
          })
          break;
        case 6:
          featureAbility.getContext().getDisplayOrientation((err, data) => {
            hilog.info(0x0000, 'testTag', '%{public}s', `6-getDisplayOrientation data: ${data}`);
            if (bundle.DisplayOrientation.UNSPECIFIED == data) {
              featureAbility.getContext().setDisplayOrientation(bundle.DisplayOrientation.PORTRAIT).then(() => {
                featureAbility.getContext().getDisplayOrientation((error, value) => {
                  hilog.info(0x0000, 'testTag', '%{public}s', `6-getDisplayOrientation2 data: ${value}`);
                  if (bundle.DisplayOrientation.PORTRAIT == value) {
                    featureAbility.startAbility(
                      {
                        want: {
                          bundleName: 'com.ohos.actsfaabilitydisplayorientationhelper',
                          abilityName: 'com.ohos.feature1.MainAbility',
                          parameters: {
                            data: number
                          }
                        }
                      }
                    ).then(data => {
                      hilog.info(0x0000, 'testTag', '%{public}s', `6-fa startAbility data: ${data}`);
                      featureAbility.terminateSelf();
                    }).catch((err:BusinessError) => {
                      hilog.info(0x0000, 'testTag', '%{public}s', `6-fa startAbility err: ${JSON.stringify(err)}`);
                    })
                  }
                })
              })
            }
          })
          break;

        case 7:
          hilog.info(0x0000, 'testTag', '%{public}s', `case 7 ----->`);
            featureAbility.getContext().getDisplayOrientation((error, data) => {
              hilog.info(0x0000, 'testTag', '%{public}s', `7-getDisplayOrientation main data: ${data}, err: ${JSON.stringify(error)}`);
              if (bundle.DisplayOrientation.UNSPECIFIED == data) {
                featureAbility.getContext().setDisplayOrientation(bundle.DisplayOrientation.FOLLOW_RECENT)
                  .then(() => {
                    hilog.info(0x0000, 'testTag', '%{public}s', '7-setDisplayOrientation main data');
                    featureAbility.getContext().getDisplayOrientation()
                      .then(data => {
                        hilog.info(0x0000, 'testTag', '%{public}s', `7-getDisplayOrientation main-2 data: ${data},
                            orientation: ${bundle.DisplayOrientation.LANDSCAPE}`);
                        if (bundle.DisplayOrientation.LANDSCAPE == data && lifeCircleData.length == 2) {
                          publishEvent(Event_FA_DisplayOrientation_0300, true);
                        } else {
                          publishEvent(Event_FA_DisplayOrientation_0300, false);
                        }
                        featureAbility.terminateSelf();
                      })
                  })
              }
            })

          break;
        case 8:
          hilog.info(0x0000, 'testTag', '%{public}s', `case 8 ----->`);
            featureAbility.getContext().getDisplayOrientation((error, data) => {
              hilog.info(0x0000, 'testTag', '%{public}s', `8-getDisplayOrientation main data: ${data}, err: ${JSON.stringify(error)}`);
              if (bundle.DisplayOrientation.UNSPECIFIED == data) {
                featureAbility.getContext().setDisplayOrientation(bundle.DisplayOrientation.FOLLOW_RECENT)
                  .then(() => {
                    hilog.info(0x0000, 'testTag', '%{public}s', '8-setDisplayOrientation main data');
                    featureAbility.getContext().getDisplayOrientation()
                      .then(data => {
                        hilog.info(0x0000, 'testTag', '%{public}s', `8-getDisplayOrientation main-2 data: ${data},
                            orientation: ${bundle.DisplayOrientation.PORTRAIT}`);
                        if (bundle.DisplayOrientation.PORTRAIT == data  && lifeCircleData.length == 2) {
                          publishEvent(Event_FA_DisplayOrientation_0400, true);
                        } else {
                          publishEvent(Event_FA_DisplayOrientation_0400, false);
                        }
                        featureAbility.terminateSelf();
                      })
                  })
              }
            })

          break;

        case 9:
          let result = false;
          if (bundle.DisplayOrientation.UNSPECIFIED == 0 && bundle.DisplayOrientation.LANDSCAPE == 1
          && bundle.DisplayOrientation.PORTRAIT == 2 && bundle.DisplayOrientation.FOLLOW_RECENT == 3) {
            result = true;
          }
          publishEvent(Event_FA_DisplayOrientation_0700, result);
          featureAbility.terminateSelf();
          break;

      }
    })
  }
}
export default new FourthAbility();