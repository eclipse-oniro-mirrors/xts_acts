/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import Ability from '@ohos.app.ability.UIAbility'
import commonEvent from '@ohos.commonEvent';
import fileUri from '@ohos.file.fileuri';
import fs from '@ohos.file.fs'
import wantConstant from '@ohos.ability.wantConstant';

let caseNumber = 0;
export default class Hap2MainAbility1 extends Ability {
  onCreate(want, launchParam) {
    console.log('[Demo] Hap2MainAbility1 onCreate')
    globalThis.abilityWant1 = want;
    globalThis.hap2MainAbility1Context = this.context;
  }

  onDestroy() {
    console.log('[Demo] Hap2MainAbility1 onDestroy')
  }

  onWindowStageCreate(windowStage) {
    console.log('[Demo] Hap2MainAbility1 onWindowStageCreate')
    windowStage.setUIContent(this.context, 'pages/Hap2MainAbility1_pages', null)
  }

  onWindowStageDestroy() {
    console.log('[Demo] Hap2MainAbility1 onWindowStageDestroy')
  }

  onNewWant(want, launchParams) {
    console.log('[Demo] Hap2MainAbility1 onNewWant')
    globalThis.abilityWant1 = want;
    switch (globalThis.abilityWant1.parameters['number']) {
      case 18: {
        console.log('[Demo] Hap2MainAbility1 case 18 call.');
        let uri : string = globalThis.abilityWant1.uri;
        if (uri == null) {
          console.log('[Demo] Hap2MainAbility1 uri is invalid');
          return;
        }
        let eventName10_1 : string = 'Temp_UriPermissionTest_0600_Read_Successfully';
        let eventName10_2 : string = 'Temp_UriPermissionTest_0600_Read_Failed';
        fs.open(uri, fs.OpenMode.READ_ONLY).then((file) => {
          console.info('file fd: ' + file.fd);
          commonEvent.publish(eventName10_1, (err) => {
            console.log('Hap2MainAbility1 ' + eventName10_1);
          });
        }).catch((err) => {
          console.info('open file failed with error message: ' + err.message + ', error code: ' + err.code);
          commonEvent.publish(eventName10_2, (err) => {
            console.log('Hap2MainAbility1 ' + eventName10_2);
          });
        });

        let eventName10_3 : string = 'Temp_UriPermissionTest_0600_Write_Successfully';
        let eventName10_4 : string = 'Temp_UriPermissionTest_0600_Write_Failed';
        fs.open(uri, fs.OpenMode.READ_WRITE).then((file) => {
          console.info('file fd: ' + file.fd);
          commonEvent.publish(eventName10_3, (err) => {
            console.log('Hap2MainAbility1 ' + eventName10_3);
          });
        }).catch((err) => {
          console.info('open file failed with error message: ' + err.message + ', error code: ' + err.code);
          commonEvent.publish(eventName10_4, (err) => {
            console.log('Hap2MainAbility1 ' + eventName10_4);
          });
        });
        this.context.terminateSelf();
        break;
      }

      default:
        console.log('[Demo] Hap2MainAbility1 onNewWant case default')
        break;
    }
  }

  onForeground() {
    console.log('[Demo] Hap2MainAbility1 onForeground ' + globalThis.abilityWant1.parameters['number'])
    switch (globalThis.abilityWant1.parameters['number']) {
      case 10: {
        console.log('[Demo] Hap2MainAbility1 case 10 call.');
        let uri : string = globalThis.abilityWant1.uri;
        if (uri == null) {
          console.log('[Demo] Hap2MainAbility1 uri is invalid');
          return;
        }
        let eventName10_1 : string = 'Temp_UriPermissionTest_0100_Read_Successfully';
        let eventName10_2 : string = 'Temp_UriPermissionTest_0100_Read_Failed';
        fs.open(uri, fs.OpenMode.READ_ONLY).then((file) => {
          console.info('file fd: ' + file.fd);
          commonEvent.publish(eventName10_1, (err) => {
            console.log('Hap2MainAbility1 ' + eventName10_1);
          });
        }).catch((err) => {
          console.info('open file failed with error message: ' + err.message + ', error code: ' + err.code);
          commonEvent.publish(eventName10_2, (err) => {
            console.log('Hap2MainAbility1 ' + eventName10_2);
          });
        });

        let eventName10_3 : string = 'Temp_UriPermissionTest_0100_Write_Successfully';
        let eventName10_4 : string = 'Temp_UriPermissionTest_0100_Write_Failed';
        fs.open(uri, fs.OpenMode.READ_WRITE).then((file) => {
          console.info('file fd: ' + file.fd);
          commonEvent.publish(eventName10_3, (err) => {
            console.log('Hap2MainAbility1 ' + eventName10_3);
          });
        }).catch((err) => {
          console.info('open file failed with error message: ' + err.message + ', error code: ' + err.code);
          commonEvent.publish(eventName10_4, (err) => {
            console.log('Hap2MainAbility1 ' + eventName10_4);
          });
        });
        break;
      }

      case 11: {
        console.log('[Demo] Hap2MainAbility1 case 11 call.');
        let uri : string = globalThis.abilityWant1.uri;
        if (uri == null) {
          console.log('[Demo] Hap2MainAbility1 uri is invalid');
          return;
        }
        let eventName11_1 : string = 'Temp_UriPermissionTest_0600_Read_Successfully_';
        let eventName11_2 : string = 'Temp_UriPermissionTest_0600_Read_Failed_';
        fs.open(uri, fs.OpenMode.READ_ONLY).then((file) => {
          console.info('file fd: ' + file.fd);
          commonEvent.publish(eventName11_1, (err) => {
            console.log('Hap2MainAbility1' + eventName11_1);
          });
        }).catch((err) => {
          console.info('open file failed with error message: ' + err.message + ', error code: ' + err.code);
          commonEvent.publish(eventName11_2, (err) => {
            console.log('Hap2MainAbility1' + eventName11_2);
          });
        });
        break;
      }

      case 12: {
        console.log('[Demo] Hap2MainAbility1 case 12 call.');
        let eventName : string = 'StartDone_Hap2MainAbility2';
        let subscribeInfo = {
          events: [eventName]
        }
        let subscriber12_1;
        function UnSubscribeInfoCallback12_1(err, data) {
          console.info("Hap2MainAbility1 ===UnSubscribeInfoCallback12_1===")
        }

        let eventName12_1 : string = 'Temp_UriPermissionTest_0700_Read_Successfully';
        let eventName12_2 : string = 'Temp_UriPermissionTest_0700_Read_Failed';
        let eventName12_3 : string = 'Temp_UriPermissionTest_0700_Write_Successfully';
        let eventName12_4 : string = 'Temp_UriPermissionTest_0700_Write_Failed';
        function SubscribeCallBackContext(err, data) {
          console.log(' Subscribe CallBack data:' + JSON.stringify(data));
          if (data.event === eventName) {
            let uri : string = globalThis.abilityWant2.uri;
            if (uri == null) {
              console.log('[Demo] Hap2MainAbility1 uri is invalid');
              return;
            }
            fs.open(uri, fs.OpenMode.READ_ONLY).then((file) => {
              console.info('file fd: ' + file.fd);
              commonEvent.publish(eventName12_1, (err) => {
                console.log('Hap2MainAbility1' + eventName12_1);
              });
            }).catch((err) => {
              console.info('open file failed with error message: ' + err.message + ', error code: ' + err.code);
              commonEvent.publish(eventName12_2, (err) => {
                console.log('Hap2MainAbility1' + eventName12_2);
              });
            });
    
            fs.open(uri, fs.OpenMode.READ_WRITE).then((file) => {
              console.info('file fd: ' + file.fd);
              commonEvent.publish(eventName12_3, (err) => {
                console.log('Hap2MainAbility1' + eventName12_3);
              });
            }).catch((err) => {
              console.info('open file failed with error message: ' + err.message + ', error code: ' + err.code);
              commonEvent.publish(eventName12_4, (err) => {
                console.log('Hap2MainAbility1' + eventName12_4);
              });
            });
          }
          commonEvent.unsubscribe(subscriber12_1, UnSubscribeInfoCallback12_1)
        }

        commonEvent.createSubscriber(subscribeInfo).then(async (data) => {
          subscriber12_1 = data;
          console.debug('====>Create Subscriber====>');
          await commonEvent.subscribe(subscriber12_1, SubscribeCallBackContext);
        });
        break;
      }

      case 13: {
        let uri : string = globalThis.abilityWant1.uri;
        if (uri == null) {
          console.log('[Demo] Hap2MainAbility1 uri is invalid');
          return;
        }
        let eventName13_1 : string = 'Temp_UriPermissionTest_0800_Read_Successfully';
        let eventName13_2 : string = 'Temp_UriPermissionTest_0800_Read_Failed';
        fs.open(uri, fs.OpenMode.READ_ONLY).then((file) => {
          console.info('file fd: ' + file.fd);
          commonEvent.publish(eventName13_1, (err) => {
            console.log('Hap2MainAbility1' + eventName13_1);
          });
        }).catch((err) => {
          console.info('open file failed with error message: ' + err.message + ', error code: ' + err.code);
          commonEvent.publish(eventName13_2, (err) => {
            console.log('Hap2MainAbility1' + eventName13_2);
          });
        });

        let eventName13_3 : string = 'Temp_UriPermissionTest_0800_Write_Successfully';
        let eventName13_4 : string = 'Temp_UriPermissionTest_0800_Write_Failed';
        fs.open(uri, fs.OpenMode.READ_WRITE).then((file) => {
          console.info('file fd: ' + file.fd);
          commonEvent.publish(eventName13_3, (err) => {
            console.log('Hap2MainAbility1' + eventName13_3);
          });
        }).catch((err) => {
          console.info('open file failed with error message: ' + err.message + ', error code: ' + err.code);
          commonEvent.publish(eventName13_4, (err) => {
            console.log('Hap2MainAbility1' + eventName13_4);
          });
        });
        

        let filePath : string = this.context.filesDir + '/test_ability1_1.txt';
        fs.open(filePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE, (err, file) => {
          if (err) {
            console.info('mkdir failed with error message: ' + err.message + ', error code: ' + err.code);
          } else {
            console.info('file created, fd: ' + file.fd);
          }
        });
        let uri_1 : string = fileUri.getUriFromPath(filePath);
        console.info('Hap2MainAbility1 case 13 uri : ' + JSON.stringify(uri_1));
        let want = {
          flags : wantConstant.Flags.FLAG_AUTH_WRITE_URI_PERMISSION,
          uri : uri_1
        }
        let abilityResult = {
          want,
          resultCode : 100
        }
        this.context.terminateSelfWithResult(abilityResult).then(() => {
          console.log('terminateSelfWithResult succeed');
        }).catch((error) => {
          console.log('terminateSelfWithResult failed, error.code: ' + JSON.stringify(error.code) +
            ' error.message: ' + JSON.stringify(error.message));
        });
        break;
      }

      case 14: {
        let uris : string[] = globalThis.abilityWant1.parameters['ability.params.stream'];
        if (uris == null) {
          console.log('[Demo] Hap2MainAbility1 uris is invalid');
          return;
        }
        if (uris[0] == null) {
          console.log('[Demo] Hap2MainAbility1 uri_0 is invalid');
          return;
        }
        if (uris[1] == null) {
          console.log('[Demo] Hap2MainAbility1 uri_1 is invalid');
          return;
        }
        let eventName14_1 : string = 'Temp_UriPermissionTest_1001_Write_Successfully';
        let eventName14_2 : string = 'Temp_UriPermissionTest_1001_Write_Failed';
        let eventName14_3 : string = 'Temp_UriPermissionTest_1002_Write_Successfully';
        let eventName14_4 : string = 'Temp_UriPermissionTest_1002_Write_Failed';
        fs.open(uris[0], fs.OpenMode.READ_WRITE).then((file) => {
            console.info('file fd: ' + file.fd);
            commonEvent.publish(eventName14_1, (err) => {
              console.log('Hap2MainAbility1' + eventName14_1);
            });
        }).catch((err) => {
            console.info('open file failed with error message: ' + err.message + ', error code: ' + err.code);
            commonEvent.publish(eventName14_2, (err) => {
              console.log('Hap2MainAbility1' + eventName14_2);
            });
        });

        fs.open(uris[1], fs.OpenMode.READ_WRITE).then((file) => {
            console.info('file fd: ' + file.fd);
            commonEvent.publish(eventName14_3, (err) => {
              console.log('Hap2MainAbility1' + eventName14_3);
            });
        }).catch((err) => {
            console.info('open file failed with error message: ' + err.message + ', error code: ' + err.code);
            commonEvent.publish(eventName14_4, (err) => {
              console.log('Hap2MainAbility1' + eventName14_4);
            });
        });
        break;
      }

      case 15: {
        console.log('[Demo] Hap2MainAbility1 case 15 call.');
        let uri : string = globalThis.abilityWant1.uri;
        if (uri == null) {
          console.log('[Demo] Hap2MainAbility1 uri is invalid');
          return;
        }
        let eventName15_1 : string = 'Temp_UriPermissionTest_1200_Write_Successfully';
        let eventName15_2 : string = 'Temp_UriPermissionTest_1200_Write_Failed';
        fs.open(uri, fs.OpenMode.READ_WRITE).then((file) => {
          console.info('file fd: ' + file.fd);
          commonEvent.publish(eventName15_1, (err) => {
            console.log('Hap2MainAbility1' + eventName15_1);
          });
        }).catch((err) => {
          console.info('open file failed with error message: ' + err.message + ', error code: ' + err.code);
          commonEvent.publish(eventName15_2, (err) => {
            console.log('Hap2MainAbility1' + eventName15_2);
          });
        });
        this.context.terminateSelf();
        break;
      }

      case 17: {
        console.log('[Demo] Hap2MainAbility1 case 17 call.');
        let uri : string = globalThis.abilityWant1.uri;
        if (uri == null) {
          console.log('[Demo] Hap2MainAbility1 uri is invalid');
          return;
        }
        let eventName17_1 : string = 'Temp_UriPermissionTest_1400_Read_Successfully';
        let eventName17_2 : string = 'Temp_UriPermissionTest_1400_Read_Failed';
        fs.open(uri, fs.OpenMode.READ_ONLY).then((file) => {
          console.info('file fd: ' + file.fd);
          commonEvent.publish(eventName17_1, (err) => {
            console.log('Hap2MainAbility1' + eventName17_1);
          });
        }).catch((err) => {
          console.info('open file failed with error message: ' + err.message + ', error code: ' + err.code);
          commonEvent.publish(eventName17_2, (err) => {
            console.log('Hap2MainAbility1' + eventName17_2);
          });
        });

        let eventName17_3 : string = 'Temp_UriPermissionTest_1400_Write_Successfully';
        let eventName17_4 : string = 'Temp_UriPermissionTest_1400_Write_Failed';
        fs.open(uri, fs.OpenMode.READ_WRITE).then((file) => {
            console.info('file fd: ' + file.fd);
            commonEvent.publish(eventName17_3, (err) => {
              console.log('Hap2MainAbility1' + eventName17_3);
            });
        }).catch((err) => {
          console.info('open file failed with error message: ' + err.message + ', error code: ' + err.code);
          commonEvent.publish(eventName17_4, (err) => {
            console.log('Hap2MainAbility1' + eventName17_4);
          });
        });
        this.context.terminateSelf();
        break;
      }

      case 19: {
        console.log('[Demo] Hap2MainAbility1 case 19 call.');
        let uri : string = globalThis.abilityWant1.uri;
        if (uri == null) {
          console.log('[Demo] Hap2MainAbility1 uri is invalid');
          return;
        }
        console.log('[Demo] Hap2MainAbility1 case 19 uri: ' + uri);
        let eventName19_1 : string = 'Temp_UriPermissionTest_1100_Read_Successfully';
        let eventName19_2 : string = 'Temp_UriPermissionTest_1100_Read_Failed';
        fs.open(uri, fs.OpenMode.READ_ONLY).then((file) => {
          console.info('file fd: ' + file.fd);
          commonEvent.publish(eventName19_1, (err) => {
            console.log('Hap2MainAbility1 ' + eventName19_1);
          });
        }).catch((err) => {
          console.info('read file failed with error message: ' + err.message + ', error code: ' + err.code);
          commonEvent.publish(eventName19_2, (err) => {
            console.log('Hap2MainAbility1 ' + eventName19_2);
          });
        });

        let eventName19_3 : string = 'Temp_UriPermissionTest_1100_Write_Successfully';
        let eventName19_4 : string = 'Temp_UriPermissionTest_1100_Write_Failed';
        fs.open(uri, fs.OpenMode.READ_WRITE).then((file) => {
          console.info('file fd: ' + file.fd);
          commonEvent.publish(eventName19_3, (err) => {
            console.log('Hap2MainAbility1 ' + eventName19_3);
          });
        }).catch((err) => {
          console.info('write file failed with error message: ' + err.message + ', error code: ' + err.code);
          commonEvent.publish(eventName19_4, (err) => {
            console.log('Hap2MainAbility1 ' + eventName19_4);
          });
        });
        this.context.terminateSelf();
        break;
      }

      case 101: {
        console.log('[Demo] Hap2MainAbility1 case 20 call.');
        let uri : string = globalThis.abilityWant1.uri;
        if (uri == null) {
          console.log('[Demo] Hap2MainAbility1 uri is invalid');
          return;
        }
        let eventName20_1 : string = 'Temp_UriPermissionTest_1500_Read_Successfully';
        let eventName20_2 : string = 'Temp_UriPermissionTest_1500_Read_Failed';
        fs.open(uri, fs.OpenMode.READ_ONLY).then((file) => {
          console.info('file fd: ' + file.fd);
          commonEvent.publish(eventName20_1, (err) => {
            console.log('Hap2MainAbility1 ' + eventName20_1);
          });
        }).catch((err) => {
          console.info('open file failed with error message: ' + err.message + ', error code: ' + err.code);
          commonEvent.publish(eventName20_2, (err) => {
            console.log('Hap2MainAbility1 ' + eventName20_2);
          });
        });

        let eventName20_3 : string = 'Temp_UriPermissionTest_1500_Write_Successfully';
        let eventName20_4 : string = 'Temp_UriPermissionTest_1500_Write_Failed';
        fs.open(uri, fs.OpenMode.READ_WRITE).then((file) => {
          console.info('file fd: ' + file.fd);
          commonEvent.publish(eventName20_3, (err) => {
            console.log('Hap2MainAbility1 ' + eventName20_3);
          });
        }).catch((err) => {
          console.info('open file failed with error message: ' + err.message + ', error code: ' + err.code);
          commonEvent.publish(eventName20_4, (err) => {
            console.log('Hap2MainAbility1 ' + eventName20_4);
          });
        });
        break;
      }

      case 102: {
        console.log('[Demo] Hap2MainAbility1 case 21 call.');
        let uri : string = globalThis.abilityWant1.uri;
        if (uri == null) {
          console.log('[Demo] Hap2MainAbility1 uri is invalid');
          return;
        }
        let eventName21_1 : string = 'Temp_UriPermissionTest_1500_Read_Successfully_';
        let eventName21_2 : string = 'Temp_UriPermissionTest_1500_Read_Failed_';
        fs.open(uri, fs.OpenMode.READ_ONLY).then((file) => {
          console.info('file fd: ' + file.fd);
          commonEvent.publish(eventName21_1, (err) => {
            console.log('Hap2MainAbility1' + eventName21_1);
          });
        }).catch((err) => {
          console.info('open file failed with error message: ' + err.message + ', error code: ' + err.code);
          commonEvent.publish(eventName21_2, (err) => {
            console.log('Hap2MainAbility1' + eventName21_2);
          });
        });
        break;
      }

      default:
        console.log('[Demo] Hap2MainAbility1 case default')
        break;
  }
  }

  onBackground() {
    console.log('[Demo] Hap2MainAbility1 onBackground')
  }
};
