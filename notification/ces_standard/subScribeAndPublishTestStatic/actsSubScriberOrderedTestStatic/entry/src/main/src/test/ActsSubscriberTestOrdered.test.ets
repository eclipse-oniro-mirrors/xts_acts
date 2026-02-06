/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
import commonEventManager from '@ohos.commonEventManager'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from '../../../hypium/index'
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import Utils from './Util.test';
import { Component, Driver, ON } from '@ohos.UiTest'
let bundle_name:string = "com.example.actssubscribertestorder.static"
let domain: number = 0x0000;
let testAbilityContext:common.UIAbilityContext;
let TAG:string = 'SUB_NOTIFICATION_CES_SUBSCRIBER_ORDER_TEST ===>'

let publishCallback=(err:BusinessError) =>{
  console.info('===============>publishCallback');
}

let unsubscribeCallback=(err:BusinessError) =>{
  console.info('===============>unsubscribeCallback');
}

export default function ActsSubscriberTestOrder() {
  describe('SUB_NOTIFICATION_CES_SUBSCRIBER_ORDER_TEST',  () => {
    console.info(`${TAG} SUB_NOTIFICATION_CES_SUBSCRIBER_ORDER_TEST START`)
    beforeAll(() => {
      hilog.info(domain, TAG, '%{public}s', 'beforeAll start');
      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: "EntryAbility",
        moduleName:"entry",
        onAbilityCreate: (abilitys : UIAbility) : void => {
          testAbilityContext = abilitys.context
          hilog.info(domain, TAG, '%{public}s', 'onAbilityCreate end');

        },
      }, (err : BusinessError|null) : void => {
        if (err != null ) {
          hilog.info(domain, TAG, '%{public}s', '-----'+ err.code);
        }
        hilog.info(domain, TAG, '%{public}s', 'BusinessError  end');
      });
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b " + bundle_name )
      await Utils.msSleep(2000)
      hilog.info(domain, TAG, '%{public}s', 'beforeAll end');
    })


    /*
     * @tc.number: SUB_NOTIFICATION_CES_SUBSCRIBER_ORDER_TEST_Static_0600
     * @tc.name: SUB_NOTIFICATION_CES_SUBSCRIBER_ORDER_TEST_Static_0600
     * @tc.desc: createSubscriber
     */
    it('SUB_NOTIFICATION_CES_SUBSCRIBER_ORDER_TEST_Static_0600', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {
      let TAG:string = 'SUB_NOTIFICATION_CES_SUBSCRIBER_ORDER_TEST_Static_0600'
      hilog.info(domain,TAG,`SUB_NOTIFICATION_CES_SUBSCRIBER_ORDER_TEST_Static_0600 START`)

      let subscriber: commonEventManager.CommonEventSubscriber

      let subscribeInfo : commonEventManager.CommonEventSubscribeInfo= {
        events: new Array<string>('event06')
      }

      commonEventManager.createSubscriber(subscribeInfo).then((commonEventSubscriber:commonEventManager.CommonEventSubscriber) => {
        hilog.info(domain,TAG,`SUB_NOTIFICATION_CES_SUBSCRIBER_ORDER_TEST_Static_0600 success`)
        subscriber = commonEventSubscriber
        expect(true).assertTrue()
        done()
      }).catch((err:BusinessError):void => {
        hilog.info(domain,TAG,`SUB_NOTIFICATION_CES_SUBSCRIBER_ORDER_TEST_Static_0600 err `)
        expect(false).assertTrue()
        done()
      })
      hilog.info(domain,TAG,`SUB_NOTIFICATION_CES_SUBSCRIBER_ORDER_TEST_Static_0600 END`)
    })

    // /*
    //  * @tc.number: SUB_NOTIFICATION_CES_SUBSCRIBER_ORDER_TEST_Static_0700
    //  * @tc.name: SUB_NOTIFICATION_CES_SUBSCRIBER_ORDER_TEST_Static_0700
    //  * @tc.desc: createSubscriber
    //  */
    // //问题单号：DTS2025060627133
    // it('SUB_NOTIFICATION_CES_SUBSCRIBER_ORDER_TEST_Static_0700', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {
    //   let TAG:string = 'SUB_NOTIFICATION_CES_SUBSCRIBER_ORDER_TEST_Static_0700'
    //   console.info(`${TAG} SUB_NOTIFICATION_CES_SUBSCRIBER_ORDER_TEST_Static_0700 START`)
    //
    //   let subscriber:commonEventManager.CommonEventSubscriber
    //
    //   let subscribeInfo:commonEventManager.CommonEventSubscribeInfo = {
    //     events:new Array<string> ("event07")
    //   }
    //
    //   commonEventManager.createSubscriber(subscribeInfo, undefined).then((commonEventSubscriber:commonEventManager.CommonEventSubscriber) => {
    //     console.info(TAG+`SUB_NOTIFICATION_CES_SUBSCRIBER_ORDER_TEST_0700 success ${commonEventSubscriber}`)
    //     subscriber = commonEventSubscriber
    //     expect(true).assertTrue()
    //     done()
    //   }).catch((err:BusinessError):void => {
    //     console.info(TAG+
    //       `SUB_NOTIFICATION_CES_SUBSCRIBER_ORDER_TEST_0700 err, error code: ${err.code}, message: ${err.message}`)
    //     expect(false).assertTrue()
    //     done()
    //   })
    //
    //   console.info(`${TAG} SUB_NOTIFICATION_CES_SUBSCRIBER_ORDER_TEST_Static_0700 END`)
    //
    // })
    console.info(`${TAG} SUB_NOTIFICATION_CES_SUBSCRIBER_ORDER_TEST END`)
  })
}
