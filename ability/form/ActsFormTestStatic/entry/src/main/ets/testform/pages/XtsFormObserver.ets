/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
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

import { Entry, Text, Column, Component, Button, ClickEvent } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog';
import formInfo from '@ohos.app.form.formInfo';
import formObserver from '@ohos.app.form.formObserver';
import { BusinessError } from '@ohos.base';

const DOMAIN: int = 0x0000;
const TAG: string = 'testTag formAgentTest';

@Entry
@Component
struct XtsFormObserver {
  aboutToAppear() {
    hilog.info(DOMAIN, TAG, 'XtsFormObserver enter');
  }
  @State formId: string = '0';
  @State deviceId: string = '0';

  build() {
    Column(undefined) {

      Button('getRunningFormInfoById cb').onClick((event: ClickEvent) => {
        hilog.info(DOMAIN, TAG, 'onClick formObserverStaticTest001');
        try {
          formObserver.getRunningFormInfos().then((data: formInfo.RunningFormInfo[]) => {
            console.log(`formObserver getRunningFormInfos, data: ${JSON.stringify(data)}`);
            if (data.length === 0) {
              hilog.info(DOMAIN, TAG, 'formObserverStaticTest001 getRunningFormInfos no data');
            } else {
              try {
                formObserver.getRunningFormInfoById(data[0].formId, (error: BusinessError<void> | null, 
                  data: formInfo.RunningFormInfo | undefined) => {
                  if (error?.code !== 0) {
                    hilog.info(DOMAIN, TAG, `formObserverStaticTest001 callback error, code:${error?.code}`);
                  } else {
                    hilog.info(DOMAIN, TAG, `formObserverStaticTest001 callback success`);
                  }
                });
              } catch (error) {
                hilog.error(DOMAIN, TAG, 'formObserverStaticTest001 catch error');
              }
            }
          }).catch((error: Error) => {
            let code = (error as BusinessError).code;
            let message = (error as BusinessError).message;
            console.error(`getRunningFormInfos error, code: ${code}, message: ${message}`);
          });
        } catch (err: Error) {
          hilog.info(DOMAIN, TAG, `getRunningFormInfos error, code: ${err?.code}, error message: ${err?.message}`);
        }
      })

      Button('getRunningFormInfoById proimse').onClick((event: ClickEvent) => {
        try {
          formObserver.getRunningFormInfos((error: BusinessError<void> | null, 
            data: formInfo.RunningFormInfo[] | undefined) => {
            if (error?.code !== 0) {
              hilog.info(DOMAIN, TAG,
                `formObserverStaticTest002 getRunningFormInfos callback error, code:${error?.code}`);
            } else {
              console.log(`formObserver getRunningFormInfos callback, data: ${JSON.stringify(data)}`);
              if (data === undefined || data.length === 0) {
                hilog.info(DOMAIN, TAG, 'formObserverStaticTest002 getRunningFormInfos callback no data');
              } else {
                try {
                  formObserver.getRunningFormInfoById(data[0].formId).then((data) => {
                    hilog.info(DOMAIN, TAG, `formObserverStaticTest002 promise success`);
                  }).catch((error: Error) => {
                    let code = (error as BusinessError).code;
                    let message = (error as BusinessError).message;
                    hilog.error(DOMAIN, TAG, `formObserverStaticTest002 promise error, code: ${code}`);
                  });
                  hilog.info(DOMAIN, TAG, 'formObserverStaticTest002 getRunningFormInfoById success');
                } catch (error) {
                  hilog.error(DOMAIN, TAG, 'formObserverStaticTest002 catch error');
                }
              }
            }
          });
        } catch (err: Error) {
          hilog.info(DOMAIN, TAG, `getRunningFormInfos error code: ${err?.code}, error message: ${err?.message}`);
        }
      })

      Button('getRunningFormInfoById_isUnusedIncluded proimse').onClick((event: ClickEvent) => {
        try {
          formObserver.getRunningFormInfos(true).then((data: formInfo.RunningFormInfo[]) => {
            console.log(`formObserver getRunningFormInfos, data: ${JSON.stringify(data)}`);
            if (data.length === 0) {
              hilog.info(DOMAIN, TAG, 'formObserverStaticTest003 getRunningFormInfos no data');
            } else {
              try {
                formObserver.getRunningFormInfoById(data[0].formId, true).then((data) => {
                  hilog.info(DOMAIN, TAG, `formObserverStaticTest003 promise success`);
                }).catch((error: Error) => {
                  let code = (error as BusinessError).code;
                  let message = (error as BusinessError).message;
                  hilog.error(DOMAIN, TAG, `formObserverStaticTest003 promise error, code: ${code}`);
                });
                hilog.info(DOMAIN, TAG, 'formObserverStaticTest003 getRunningFormInfoById success');
              } catch (error) {
                hilog.error(DOMAIN, TAG, 'formObserverStaticTest003 catch error');
              }
            }
          }).catch((error: Error) => {
            let code = (error as BusinessError).code;
            let message = (error as BusinessError).message;
            console.error(`getRunningFormInfos error, code: ${code}, message: ${message}`);
          });
        } catch (err: Error) {
          hilog.info(DOMAIN, TAG, `getRunningFormInfos error，code: ${err?.code}, error message: ${err?.message}`);
        }
      });

      Button('getRunningFormInfoById_isUnusedIncluded cb').onClick((event: ClickEvent) => {
        hilog.info(DOMAIN, TAG, 'onClick formObserverStaticTest004');
        try {
          formObserver.getRunningFormInfos((error: BusinessError<void> | null, 
            data: formInfo.RunningFormInfo[] | undefined) => {
            if (error?.code !== 0) {
              hilog.info(DOMAIN, TAG,
                `formObserverStaticTest004 getRunningFormInfos callback error, code:${error?.code}`);
            } else {
              console.log(`formObserver getRunningFormInfos callback, data: ${JSON.stringify(data)}`);
              if (data === undefined || data.length === 0) {
                hilog.info(DOMAIN, TAG, 'formObserverStaticTest004 getRunningFormInfos callback no data');
              } else {
                try {
                  formObserver.getRunningFormInfoById(data[0].formId, true,
                    (error: BusinessError<void> | null, data: formInfo.RunningFormInfo | undefined) => {
                      if (error?.code !== 0) {
                        hilog.info(DOMAIN, TAG,
                          `formObserverStaticTest004 getRunningFormInfoById callback error, code:${error?.code}`);
                      } else {
                        hilog.info(DOMAIN, TAG, `formObserverStaticTest004 getRunningFormInfoById callback success`);
                      }
                    });
                } catch (error) {
                  hilog.error(DOMAIN, TAG, 'formObserverStaticTest004 getRunningFormInfoById catch error');
                }
              }
            }
          }, true);
        } catch (err: Error) {
          hilog.info(DOMAIN, TAG, `getRunningFormInfos error code: ${err?.code}, error message: ${err?.message}`);
        }
      })

      Button('getRunningFormInfosByFilter pp').backgroundColor('#ff35e288')
        .onClick((event: ClickEvent) => {
          hilog.info(DOMAIN, TAG, 'onClick getRunningFormInfosByFilter');
          try {
            let formProviderFilter: formInfo.FormProviderFilter = {
              bundleName: 'com.example.actsformtest.static',
              formName: 'widget'
            };
            formObserver.getRunningFormInfosByFilter(formProviderFilter)
            .then((data: Array<formInfo.RunningFormInfo> | undefined ) => {
              hilog.info(DOMAIN, TAG, `formObserverStaticTest009 promise success`);
            }).catch((error: Error) => {
              let code = (error as BusinessError).code;
              let message = (error as BusinessError).message;
              hilog.error(DOMAIN, TAG, `formObserverStaticTest009 promise error, code: ${code}`);
            });
          } catch (error) {
            hilog.error(DOMAIN, TAG, 'formObserverStaticTest009 catch error');
          }
          hilog.info(DOMAIN, TAG, 'formObserverStaticTest009 end');
        })

      Button('getRunningFormInfosByFilter cb').backgroundColor('#ff35e288').onClick((event: ClickEvent) => {
        hilog.info(DOMAIN, TAG, 'formObserverStaticTest010 start');
        try {
          let formProviderFilter: formInfo.FormProviderFilter = {
            bundleName: 'com.example.actsformtest.static',
            formName: 'widget'
          };
          formObserver.getRunningFormInfosByFilter(formProviderFilter, (error: BusinessError<void> | null, 
            data: Array<formInfo.RunningFormInfo> | undefined) => {
            if (error?.code !== 0) {
              hilog.info(DOMAIN, TAG, `formObserverStaticTest010 callback error, code:${error?.code}`);
            } else {
              hilog.info(DOMAIN, TAG, `formObserverStaticTest010 callback success`);
            }
          });
        } catch (error) {
          hilog.error(DOMAIN, TAG, 'formObserverStaticTest010 catch error');
        }
        hilog.info(DOMAIN, TAG, 'formObserverStaticTest010 end');
      })

      Button('on and off  call').backgroundColor('#ff35e288')
        .onClick((event: ClickEvent) => {
          hilog.info(DOMAIN, TAG, 'onClick on and off');
          try {
            let hostBundleName: string = 'com.example.actsformtest.static';
            let observerCallback = (data: formInfo.RunningFormInfo | undefined) => {
              hilog.info(DOMAIN, TAG, `formObserverStaticTest011 observerCallback success`);
            };
            formObserver.onCall(observerCallback);
            hilog.info(DOMAIN, TAG, 'formObserverStaticTest011 formObserver on success');
            formObserver.offCall(hostBundleName, observerCallback);
            hilog.info(DOMAIN, TAG, 'formObserverStaticTest011 formObserver off success');
          } catch (error) {
            hilog.error(DOMAIN, TAG, `formObserverStaticTest011 catch error, code:${error.code}`);
          }
        })

      Button('on and off with hostBundleName call').backgroundColor('#ff35e288').onClick((event: ClickEvent) => {
        hilog.info(DOMAIN, TAG, 'onClick on and off with hostBundleName');
        try {
          let hostBundleName: string = 'com.example.actsformtest.static';
          let observerCallback = (data: formInfo.RunningFormInfo | undefined) => {
            hilog.info(DOMAIN, TAG, `formObserverStaticTest012 observerCallback success`);
          };
          formObserver.onCall(hostBundleName, observerCallback);
          hilog.info(DOMAIN, TAG, 'formObserverStaticTest012 formObserver on success');
          formObserver.offCall(hostBundleName, observerCallback);
          hilog.info(DOMAIN, TAG, 'formObserverStaticTest012 formObserver off success');
        } catch (error) {
          hilog.error(DOMAIN, TAG, `formObserverStaticTest012 catch error, code:${error.code}`);
        }
      })

      //on and off  message
      Button('on and off  message').backgroundColor('#ff35e288')
        .onClick((event: ClickEvent) => {
          hilog.info(DOMAIN, TAG, 'onClick on and off message');
          try {
            let hostBundleName: string = 'com.example.actsformtest.static';
            let observerCallback = (data: formInfo.RunningFormInfo | undefined) => {
              hilog.info(DOMAIN, TAG, `formObserverStaticTest013 observerCallback success`);
            };
            formObserver.onMessage(observerCallback);
            hilog.info(DOMAIN, TAG, 'formObserverStaticTest013 formObserver on success');
            formObserver.offMessage(hostBundleName, observerCallback);
            hilog.info(DOMAIN, TAG, 'formObserverStaticTest013 formObserver off success');
          } catch (error) {
            let code = (error as BusinessError).code;
            let message = (error as BusinessError).message;
            hilog.error(DOMAIN, TAG, `formObserverStaticTest013 catch error, code: ${code}, message: ${message})`);
          }
          hilog.info(DOMAIN, TAG, 'formObserverStaticTest013 end');
        })

      //on and off with hostBundleName message
      Button('on and off with hostBundleName message').backgroundColor('#ff35e288').onClick((event: ClickEvent) => {
        hilog.info(DOMAIN, TAG, 'onClick on and off with hostBundleName message');
        try {
          let hostBundleName: string = 'com.example.actsformtest.static';
          let observerCallback = (data: formInfo.RunningFormInfo | undefined) => {
            hilog.info(DOMAIN, TAG, `formObserverStaticTest014 observerCallback success`);
          };
          formObserver.onMessage(hostBundleName, observerCallback);
          hilog.info(DOMAIN, TAG, 'formObserverStaticTest014 formObserver on success');
          formObserver.offMessage(hostBundleName, observerCallback);
          hilog.info(DOMAIN, TAG, 'formObserverStaticTest014 formObserver off success');
        } catch (error) {
          let code = (error as BusinessError).code;
          let message = (error as BusinessError).message;
          hilog.error(DOMAIN, TAG, `formObserverStaticTest014 catch error, code: ${code}, message: ${message})`);
        }
        hilog.info(DOMAIN, TAG, 'formObserverStaticTest014 end');
      })

      //on and off  router
      Button('on and off  router').onClick((event: ClickEvent) => {
        hilog.info(DOMAIN, TAG, 'formObserverStaticTest015 start');
        try {
          let hostBundleName: string = 'com.example.actsformtest.static';
          let observerCallback = (data: formInfo.RunningFormInfo | undefined) => {
            hilog.info(DOMAIN, TAG, `formObserverStaticTest015 observerCallback success`);
          };
          formObserver.onRouter(observerCallback);
          hilog.info(DOMAIN, TAG, 'formObserverStaticTest015 formObserver on success');
          formObserver.offRouter(hostBundleName, observerCallback);
          hilog.info(DOMAIN, TAG, 'formObserverStaticTest015 formObserver off success');
        } catch (error) {
          let code = (error as BusinessError).code;
          let message = (error as BusinessError).message;
          hilog.error(DOMAIN, TAG, `formObserverStaticTest015 catch error, code: ${code}, message: ${message})`);
        }
        hilog.info(DOMAIN, TAG, 'formObserverStaticTest015 end');
      })

      //on and off with hostBundleName router
      Button('on and off with hostBundleName router').onClick((event: ClickEvent) => {
        hilog.info(DOMAIN, TAG, 'formObserverStaticTest016 start');
        try {
          let hostBundleName: string = 'com.example.actsformtest.static';
          let observerCallback = (data: formInfo.RunningFormInfo | undefined) => {
            hilog.info(DOMAIN, TAG, `formObserverStaticTest016 observerCallback success`);
          };
          formObserver.onRouter(hostBundleName, observerCallback);
          hilog.info(DOMAIN, TAG, 'formObserverStaticTest016 formObserver on success');
          formObserver.offRouter(hostBundleName, observerCallback);
          hilog.info(DOMAIN, TAG, 'formObserverStaticTest016 formObserver off success');
        } catch (error) {
          let code = (error as BusinessError).code;
          let message = (error as BusinessError).message;
          hilog.error(DOMAIN, TAG, `formObserverStaticTest016 catch error, code: ${code}, message: ${message})`);
        }
        hilog.info(DOMAIN, TAG, 'formObserverStaticTest016 end');
      })

      // on and off  formRemove
      Button('on and off  formRemove').backgroundColor('#ff35e288').onClick((event: ClickEvent) => {
        hilog.info(DOMAIN, TAG, 'formObserverStaticTest017 start');
        try {
          let hostBundleName: string = 'com.example.actsformtest.static';
          let observerCallback = (data: formInfo.RunningFormInfo | undefined) => {
            hilog.info(DOMAIN, TAG, `formObserverStaticTest017 observerCallback success`);
          };
          formObserver.onFormRemove(observerCallback);
          hilog.info(DOMAIN, TAG, 'formObserverStaticTest017 formObserver on success');
          formObserver.offFormRemove(hostBundleName, observerCallback);
          hilog.info(DOMAIN, TAG, 'formObserverStaticTest017 formObserver off success');
        } catch (error) {
          let code = (error as BusinessError).code;
          let message = (error as BusinessError).message;
          hilog.error(DOMAIN, TAG, `formObserverStaticTest017 catch error, code: ${code}, message: ${message})`);
        }
        hilog.info(DOMAIN, TAG, 'formObserverStaticTest017 end');
      })

      // on and off with hostBundleName formRemove
      Button('on and off with hostBundleName formRemove').backgroundColor('#ff35e288')
      .onClick((event: ClickEvent) => {
        hilog.info(DOMAIN, TAG, 'formObserverStaticTest018 start');
        try {
          let hostBundleName: string = 'com.example.actsformtest.static';
          let observerCallback = (data: formInfo.RunningFormInfo | undefined) => {
            hilog.info(DOMAIN, TAG, `formObserverStaticTest018 observerCallback success`);
          };
          formObserver.onFormRemove(hostBundleName, observerCallback);
          hilog.info(DOMAIN, TAG, 'formObserverStaticTest018 formObserver on success');
          formObserver.offFormRemove(hostBundleName, observerCallback);
          hilog.info(DOMAIN, TAG, 'formObserverStaticTest018 formObserver off success');
        } catch (error) {
          let code = (error as BusinessError).code;
          let message = (error as BusinessError).message;
          hilog.error(DOMAIN, TAG, `formObserverStaticTest018 catch error, code: ${code}, message: ${message})`);
        }
        hilog.info(DOMAIN, TAG, 'formObserverStaticTest018 end');
      })

      //on and off  formAdd
      Button('on and off  formAdd').onClick((event: ClickEvent) => {
        hilog.info(DOMAIN, TAG, 'formObserverStaticTest019 start');
        try {
          let hostBundleName: string = 'com.example.actsformtest.static';
          let observerCallback = (data: formInfo.RunningFormInfo | undefined) => {
            hilog.info(DOMAIN, TAG, `formObserverStaticTest019 observerCallback success`);
          };
          formObserver.onFormAdd( observerCallback);
          hilog.info(DOMAIN, TAG, 'formObserverStaticTest019 formObserver on success');
          formObserver.offFormAdd(hostBundleName, observerCallback);
          hilog.info(DOMAIN, TAG, 'formObserverStaticTest019 formObserver off success');
        } catch (error) {
          let code = (error as BusinessError).code;
          let message = (error as BusinessError).message;
          hilog.error(DOMAIN, TAG, `formObserverStaticTest019 catch error, code: ${code}, message: ${message})`);
        }
        hilog.info(DOMAIN, TAG, 'formObserverStaticTest019 end');
      })

      //on and off with hostBundleName formAdd
      Button('on and off with hostBundleName formAdd').onClick((event: ClickEvent) => {
        hilog.info(DOMAIN, TAG, 'formObserverStaticTest020 start');
        try {
          let hostBundleName: string = 'com.example.actsformtest.static';
          let observerCallback = (data: formInfo.RunningFormInfo | undefined) => {
            hilog.info(DOMAIN, TAG, `formObserverStaticTest020 observerCallback success`);
          };
          formObserver.onFormAdd(hostBundleName, observerCallback);
          hilog.info(DOMAIN, TAG, 'formObserverStaticTest020 formObserver on success');
          formObserver.offFormAdd(hostBundleName, observerCallback);
          hilog.info(DOMAIN, TAG, 'formObserverStaticTest020 formObserver off success');
        } catch (error) {
          let code = (error as BusinessError).code;
          let message = (error as BusinessError).message;
          hilog.error(DOMAIN, TAG, `formObserverStaticTest020 catch error, code: ${code}, message: ${message})`);
        }
        hilog.info(DOMAIN, TAG, 'formObserverStaticTest020 end');
      })

      //on and off  notifyVisible
      Button('on and off  notifyVisible').backgroundColor('#ff35e288').onClick((event: ClickEvent) => {
        hilog.info(DOMAIN, TAG, 'formObserverStaticTest021 start');
        try {
          let hostBundleName: string = 'com.example.actsformtest.static';
          let observerCallback = (data: Array<formInfo.RunningFormInfo>) => {
            hilog.info(DOMAIN, TAG, `formObserverStaticTest021 observerCallback success`);
          };
          formObserver.onNotifyVisible(hostBundleName, observerCallback);
          hilog.info(DOMAIN, TAG, 'formObserverStaticTest021 formObserver on success');
          formObserver.offNotifyVisible(hostBundleName, observerCallback);
          hilog.info(DOMAIN, TAG, 'formObserverStaticTest021 formObserver off success');
        } catch (error) {
          let code = (error as BusinessError).code;
          let message = (error as BusinessError).message;
          hilog.error(DOMAIN, TAG, `formObserverStaticTest021 catch error, code: ${code}, message: ${message})`);
        }
        hilog.info(DOMAIN, TAG, 'formObserverStaticTest021 end');
      })

      //on and off with hostBundleName notifyVisible
      Button('on and off with hostBundleName notifyVisible').backgroundColor('#ff35e288')
      .onClick((event: ClickEvent) => {
        hilog.info(DOMAIN, TAG, 'formObserverStaticTest022 start');
        try {
          let observerCallback = (data: Array<formInfo.RunningFormInfo>) => {
            hilog.info(DOMAIN, TAG, `formObserverStaticTest022 observerCallback success`);
          };
          formObserver.onNotifyVisible(observerCallback);
          hilog.info(DOMAIN, TAG, 'formObserverStaticTest022 formObserver on success');
          formObserver.offNotifyVisible(undefined, observerCallback);
          hilog.info(DOMAIN, TAG, 'formObserverStaticTest022 formObserver off success');
        } catch (error) {
          let code = (error as BusinessError).code;
          let message = (error as BusinessError).message;
          hilog.error(DOMAIN, TAG, `formObserverStaticTest022 catch error, code: ${code}, message: ${message})`);
        }
        hilog.info(DOMAIN, TAG, 'formObserverStaticTest022 end');
      })

      //on and off  notifyInvisible
      Button('on and off notifyInvisible').onClick((event: ClickEvent) => {
        hilog.info(DOMAIN, TAG, 'formObserverStaticTest023 start');
        try {
          let hostBundleName: string = 'com.example.actsformtest.static';
          let observerCallback = (data: Array<formInfo.RunningFormInfo>) => {
            hilog.info(DOMAIN, TAG, `formObserverStaticTest023 observerCallback success`);
          };
          formObserver.onNotifyInvisible(observerCallback);
          hilog.info(DOMAIN, TAG, 'formObserverStaticTest023 formObserver on success');
          formObserver.offNotifyInvisible(undefined, observerCallback);
          hilog.info(DOMAIN, TAG, 'formObserverStaticTest023 formObserver off success');
        } catch (error) {
          let code = (error as BusinessError).code;
          let message = (error as BusinessError).message;
          hilog.error(DOMAIN, TAG, `formObserverStaticTest023 catch error, code: ${code}, message: ${message})`);
        }
        hilog.info(DOMAIN, TAG, 'formObserverStaticTest023 end');
      })

      //on and off with hostBundleName notifyInvisible
      Button('on and off with hostBundleName notifyInvisible').onClick((event: ClickEvent) => {
        hilog.info(DOMAIN, TAG, 'formObserverStaticTest024 start');
        try {
          let hostBundleName: string = 'com.example.actsformtest.static';
          let observerCallback = (data: Array<formInfo.RunningFormInfo>) => {
            hilog.info(DOMAIN, TAG, `formObserverStaticTest024 observerCallback success`);
          };
          formObserver.onNotifyInvisible(hostBundleName, observerCallback);
          hilog.info(DOMAIN, TAG, 'formObserverStaticTest024 formObserver on success');
          formObserver.offNotifyInvisible(hostBundleName, observerCallback);
          hilog.info(DOMAIN, TAG, 'formObserverStaticTest024 formObserver off success');
        } catch (error) {
          let code = (error as BusinessError).code;
          let message = (error as BusinessError).message;
          hilog.error(DOMAIN, TAG, `formObserverStaticTest024 catch error, code: ${code}, message: ${message})`);
        }
        hilog.info(DOMAIN, TAG, 'formObserverStaticTest024 end');
      });
    }
  }
}