/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../hypium/index";
import notificationExtensionSubscription from '@ohos.notificationExtensionSubscription';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog'
import abilityAccessCtrl, {
  Context, PermissionRequestResult, Permissions
} from '@ohos.abilityAccessCtrl';
import { AppStorage } from '@ohos.arkui.stateManagement';
import Utils from './Util.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let commonTag: string = "UnSubscribe"
let domain: int = 0x0000;
let tag: string = 'testTag';
let bundle: string = 'com.example.actsNotificationThreePartyWatchTest.static';

export default function actsNotificationAnsThreePartyUnSubscribeTest() {
  describe('actsNotificationAnsThreePartyUnSubscribeTest', () => {
    let uiAbilityContext: common.UIAbilityContext | undefined =
      AppStorage.get<common.UIAbilityContext>('uiAbilityContext');

    beforeAll(async (done: () => void): Promise<void> => {
      let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      abilityDelegator.startAbility({
        abilityName: "MainAbility", bundleName: bundle
      }).then(async (): Promise<void> => {
        hilog.info(domain, tag, 'startAbility success');
        await Utils.msSleep(1000);
        uiAbilityContext = AppStorage.get<common.UIAbilityContext>("uiAbilityContext") as common.UIAbilityContext;
        hilog.info(domain, tag, `beforeAll uiAbilityContext:${uiAbilityContext}`);
        try {
          let atManager = abilityAccessCtrl.createAtManager();
          let arr: Array<Permissions> = new Array<Permissions>();
          arr.push('ohos.permission.ACCESS_BLUETOOTH')
          atManager.requestPermissionsFromUser(uiAbilityContext as Context, arr)
            .then((data: PermissionRequestResult) => {
              hilog.info(domain, tag, "request success permissions" + JSON.stringify(data));
            })
            .catch((err: Error) => {
              hilog.info(domain, tag, "getPermissionRequestResult err" + JSON.stringify(err));
            });
        } catch (err) {
          hilog.error(domain, tag, '%{public}s', 'get failed, err: ' + err);
        }
        await Utils.msSleep(2000);
        await Utils.clickRequestPermission('允许');
        hilog.info(domain, tag, '%{public}s', 'beforeAll end');
        done();
      }).catch(() => {
        hilog.info(domain, tag, 'startAbility fail');
      })
    })

    /**
      * @tc.number   Sub_Notification_Ans_ThreePartyWatch_Static_1015
      * @tc.name     Sub_Notification_Ans_ThreePartyWatch_Static_1015
      * @tc.desc     【unsubscribe】参数正确，三方应用取消订阅成功
      * @tc.size     LargeTest
      * @tc.type     Function
      * @tc.level    Level 0
    */
    it('Sub_Notification_Ans_ThreePartyWatch_Static_1015', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let TAG = commonTag + "Sub_Notification_Ans_ThreePartyWatch_Static_1015 ";
      let infos: notificationExtensionSubscription.NotificationExtensionSubscriptionInfo[] = [
        {
          addr: '01:23:45:67:89:AB', // 使用动态获取的蓝牙地址
          type: notificationExtensionSubscription.SubscribeType.BLUETOOTH
        }
      ];
      // 1、调用subscribe(info: NotificationExtensionSubscriptionInfo[]): Promise<void>接口订阅成功，其中addr按照备注方法获取，type填写BLUETOOTH
      await notificationExtensionSubscription.subscribe(infos).then(() => {
        console.info(TAG+"subscribe success1111");
      }).catch((e: Error) => {
        let err = e as BusinessError;
        console.error(TAG+`subscribe fail: ${JSON.stringify(err)}`);
         if(err.code == 201){
          expect(err.code).assertEqual(201);
          done();
        } else {
          expect().assertFail();
          done();
        }
      });
      // 2、调用接口getSubscribeInfo(): Promise<NotificationExtensionSubscriptionInfo[]>查询订阅信息
      await notificationExtensionSubscription.getSubscribeInfo().then((data) => {
        console.info(TAG +`getSubscribeInfo successfully. Data: ${JSON.stringify(data)}`);
        expect(data.length).assertEqual(1)
      }).catch((e: Error) => {
        let err = e as BusinessError;
        console.error(TAG+`getSubscribeInfo fail: ${err.code}: ${err.message}`);
         if(err.code == 201){
          expect(err.code).assertEqual(201);
          done();
        } else {
          expect().assertFail();
          done();
        }
      });
      // 3、调用接口unsubscribe(): Promise<void>
      await notificationExtensionSubscription.unsubscribe().then(() => {
        console.info(TAG+"unsubscribe success1111");
        done();
      }).catch((e: Error) => {
        let err = e as BusinessError;
        console.error(TAG+`unubscribe fail11111111: ${JSON.stringify(err)}`);
        if(err.code == 201){
          expect(err.code).assertEqual(201);
          done();
        } else {
          expect().assertFail();
          done();
        }
      });
      // 4、调用接口getSubscribeInfo(): Promise<NotificationExtensionSubscriptionInfo[]>查询订阅信息
      notificationExtensionSubscription.getSubscribeInfo().then((
        data: notificationExtensionSubscription.NotificationExtensionSubscriptionInfo[]) => {
          console.info(TAG +`getSubscribeInfo successfully1111111. Data: ${JSON.stringify(data)}`);
          expect(data.length).assertEqual(0);
          done();
      }).catch((e: Error) => {
        let err = e as BusinessError;
        console.error(TAG+`getSubscribeInfo fail: ${err.code}: ${err.message}`);
         if(err.code == 201){
          expect(err.code).assertEqual(201);
          done()
        } else {
          expect().assertFail();
          done();
        }
      });
    })
    /**
      * @tc.number    Sub_Notification_Ans_ThreePartyWatch_Static_1014
      * @tc.name      Sub_Notification_Ans_ThreePartyWatch_Static_1014
      * @tc.desc      【unsubscribe】多次调用取消订阅接口
      * @tc.size      LargeTest
      * @tc.type      Function
      * @tc.level     Level 1
     */
    it('Sub_Notification_Ans_ThreePartyWatch_Static_1014', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let TAG = commonTag + "Sub_Notification_Ans_ThreePartyWatch_Static_1014 ";
      let count : number = 0
      let infos: notificationExtensionSubscription.NotificationExtensionSubscriptionInfo[] = [
        {
          addr: '01:23:45:67:89:AB', // 使用动态获取的蓝牙地址
          type: notificationExtensionSubscription.SubscribeType.BLUETOOTH
        }
      ];
      // 1、调用subscribe(info: NotificationExtensionSubscriptionInfo[]): Promise<void>接口订阅成功，其中addr按照备注方法获取，type填写BLUETOOTH
      await notificationExtensionSubscription.subscribe(infos).then(() => {
        console.info(TAG+"subscribe success1111");
      }).catch((e: Error) => {
        let err = e as BusinessError;
        console.error(TAG+`subscribe fail: ${JSON.stringify(err)}`);
         if(err.code == 201) {
          expect(err.code).assertEqual(201);
          done();
        } else {
          expect().assertFail();
          done();
        }
      });
      // 2、调用接口getSubscribeInfo(): Promise<NotificationExtensionSubscriptionInfo[]>查询订阅信息
      notificationExtensionSubscription.getSubscribeInfo().then((
        data: notificationExtensionSubscription.NotificationExtensionSubscriptionInfo[]) => {
          console.info(TAG +`getSubscribeInfo successfully. Data: ${JSON.stringify(data)}`);
          expect(data.length).assertEqual(1);
      }).catch((e: Error) => {
        let err = e as BusinessError;
        console.error(TAG+`getSubscribeInfo fail: ${err.code}: ${err.message}`);
         if(err.code == 201){
          expect(err.code).assertEqual(201);
          done();
        } else {
          expect().assertFail();
          done();
        }
      });
      // 3、调用接口unsubscribe(): Promise<void>
      await notificationExtensionSubscription.unsubscribe().then(() => {
        console.info(TAG+"unsubscribe success1111");
      }).catch((e: Error) => {
        let err = e as BusinessError;
        console.error(TAG+`unubscribe fail11111111: ${JSON.stringify(err)}`);
         if(err.code == 201){
          expect(err.code).assertEqual(201);
          done();
        } else {
          expect().assertFail();
          done();
        }
      });
      // 4、再次调用取消订阅接口unsubscribe(): Promise<void>
      await notificationExtensionSubscription.unsubscribe().then(() => {
        console.info(TAG+"unsubscribe successtttttttt1111");
        count++;
        expect(count).assertEqual(1)
        done();
      }).catch((e: Error) => {
        let err = e as BusinessError;
        console.error(TAG+`unubscribe fail11111111: ${JSON.stringify(err)}`);
         if(err.code == 201){
          expect(err.code).assertEqual(201);
          done()
        } else {
          expect().assertFail();
          done();
        }
      });
    })
  })
}

async function sleep(count:int) : Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0)
    }, count)
  })
}
