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
import fs from '@ohos.file.fs'

function sleep(time) {
  return new Promise((resolve) => setTimeout(resolve, time))
}
export default class Hap2MainAbility4 extends Ability {
  onCreate(want, launchParam) {
    console.log('[Demo] Hap2MainAbility4 onCreate')
  }

  onDestroy() {
    console.log('[Demo] Hap2MainAbility4 onDestroy')
  }

  onWindowStageCreate(windowStage) {
    console.log('[Demo] Hap2MainAbility4 onWindowStageCreate')
    windowStage.setUIContent(this.context, 'pages/Hap2MainAbility4_pages', null)
  }

  onWindowStageDestroy() {
    console.log('[Demo] Hap2MainAbility4 onWindowStageDestroy')
  }

  onForeground() {
    console.log('[Demo] Hap2MainAbility4 onForeground')
    let uri : string = globalThis.abilityWant3.uri;
    if (uri == null) {
      console.log('[Demo] Hap2MainAbility1 uri is invalid');
      return;
    }
    let eventName1 : string = 'Temp_UriPermissionTest_0300_Read_Successfully';
    let eventName2 : string = 'Temp_UriPermissionTest_0300_Read_Failed';
    fs.open(uri, fs.OpenMode.READ_ONLY).then((file) => {
      console.info('file fd: ' + file.fd);
      commonEvent.publish(eventName1, (err) => {
        console.log('Hap2MainAbility4' + eventName1);
      });
    }).catch((err) => {
      console.info('open file failed with error message: ' + err.message + ', error code: ' + err.code);
      commonEvent.publish(eventName2, (err) => {
        console.log('Hap2MainAbility4' + eventName2);
      });
    });

    let eventName3 : string = 'Temp_UriPermissionTest_0300_Write_Successfully';
    let eventName4 : string = 'Temp_UriPermissionTest_0300_Write_Failed';
    fs.open(uri, fs.OpenMode.READ_WRITE).then((file) => {
      console.info('file fd: ' + file.fd);
      commonEvent.publish(eventName3, (err) => {
        console.log('Hap2MainAbility4' + eventName3);
      });
    }).catch((err) => {
      console.info('open file failed with error message: ' + err.message + ', error code: ' + err.code);
      commonEvent.publish(eventName4, (err) => {
        console.log('Hap2MainAbility4' + eventName4);
      });
    });

    let eventName5 : string = 'TerminateDone_Hap2MainAbility3';
    let subscribeInfo = {
      events: [eventName5]
    }

    let eventName6 : string = 'Temp_UriPermissionTest_0300_Read_Successfully_';
    let eventName7 : string = 'Temp_UriPermissionTest_0300_Read_Failed_';
    async function SubscribeCallBackContext(err, data) {
      console.log(' Subscribe CallBack data:' + JSON.stringify(data));
      if (data.event === eventName5) {
        await sleep(1000);
        fs.open(uri, fs.OpenMode.READ_ONLY).then((file) => {
          console.info('file fd: ' + file.fd);
          commonEvent.publish(eventName6, (err) => {
            console.log('Hap2MainAbility4' + eventName6);
          });
        }).catch((err) => {
          console.info('open file failed with error message: ' + err.message + ', error code: ' + err.code);
          commonEvent.publish(eventName7, (err) => {
            console.log('Hap2MainAbility4' + eventName7);
          });
        });
      }
    }

    let subscriber__1;
    commonEvent.createSubscriber(subscribeInfo).then(async (data) => {
      subscriber__1 = data;
      console.debug('====>Create Subscriber====>');
      await commonEvent.subscribe(subscriber__1, SubscribeCallBackContext);
    });

    let eventName : string = 'TerminateSelf_Hap2MainAbility3';
    commonEvent.publish(eventName, (err) => {
      console.log('Hap2MainAbility4' + eventName);
    });
  }

  onBackground() {
    console.log('[Demo] Hap2MainAbility4 onBackground')
  }
};
