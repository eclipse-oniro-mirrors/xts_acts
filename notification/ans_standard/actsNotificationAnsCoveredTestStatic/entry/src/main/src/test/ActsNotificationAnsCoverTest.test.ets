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
import Utils from './Util.test';
import hilog from '@ohos.hilog'
import common from '@ohos.app.ability.common';
import emitter from '@ohos.events.emitter'
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError, Callback } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import notificationManager from '@ohos.notificationManager';
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level,
  Size,
  TestType
} from '../../../hypium/index'
import { Driver, ON } from '@ohos.UiTest'
import { AppStorage } from '@ohos.arkui.stateManagement'
import commonEventManager from '@ohos.commonEventManager'
import router from '@ohos.router'
import { Router } from '@ohos.arkui.UIContext';
import { UIContext } from '@ohos.arkui.UIContext'
import image from '@ohos.multimedia.image';
import { BusinessError, RecordData } from '@ohos.base';
import hilog from '@ohos.hilog';
import WantAgent from '@ohos.app.ability.wantAgent';
import wantagent from '@ohos.app.ability.wantAgent';
import Want from '@ohos.app.ability.Want';
import bundleManager from '@ohos.bundle.bundleManager'

const TAG = 'NotificationActs';
const TEST_SUITE_NAME = 'Notification';
let DOMAIN_NUMBER: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let bundleName: string = "com.example.actsnotificationanscoveredtest.static"
let testAbilityContext: common.UIAbilityContext;
let subscriber: commonEventManager.CommonEventSubscriber; //用于保存创建成功的订阅者对象，后续使用其完成订阅及退订的动作
let innerEvent: emitter.InnerEvent = {
  eventId: 1,
  priority: undefined
}
let count: int = 0
let globalscribe: commonEventManager.CommonEventSubscriber;
let CommonEventSubscriber: commonEventManager.CommonEventSubscriber;


class Sample {
  constructor() {
    this.count = 100;
  }

  printCount() {
    console.info('Print count : ' + this.count);
  }

  count: number;
}

export default function actsNotificationAnsCoveredTest() {
  const TEST_Project_NAME = 'actsNotificationAnsCoveredTest';
  describe('actsNotificationAnsCoveredTest', () => {

    beforeAll(async () => {
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'beforeAll start');

      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()

      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b " + bundleName)
      await Utils.msSleep(2000)
      testAbilityContext = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext
      hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'beforeAll end');

    })

    beforeEach(async () => {
      console.info(`${TAG} afterEach START`)
      notificationManager.removeAllSlots((e: Error | null) => {
        if (e) {
          let err:BusinessError=e as BusinessError
          console.info(`${TAG} removeAllSlots AsyncCallback err: ${err}, errMes: ${err.message}`)
        } else {
          console.info(`${TAG} removeAllSlots AsyncCallback success`)
        }
      })
      await Utils.msSleep(1000)
      console.info(`${TAG} afterEach END`)
    })


    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_Static_9000
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_Static_9000
     * @tc.desc   verify the addSlot function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_9000', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_9000 '
      let count: int = 0;
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_9000 START')
      try {
        notificationManager.addSlot(notificationManager.SlotType.LIVE_VIEW, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} addSlot_90 errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} addSlot_90 AsyncCallback success`)
            count++;
            expect(count).assertEqual(1);
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} addSlot_90 err: ${JSON.stringify(err)}`)
        expect(false).assertTrue()
        done()
      }
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_9000 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_Static_9100
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_Static_9100
     * @tc.desc   verify the addSlot function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_9100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_9100 '
      let count: int = 0;
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_9100 START')
      try {
        notificationManager.addSlot(notificationManager.SlotType.CUSTOMER_SERVICE, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} addSlot_91 errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} addSlot_91 AsyncCallback success`)
            count++;
            expect(count).assertEqual(1);
            done()
          }
        })
      } catch (err) {
        console.info(`${TAG} addSlot_91 err:${JSON.stringify(err)}`)
        expect(false).assertTrue()
        done()
      }
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_9100 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_Static_9200
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_Static_9200
     * @tc.desc   verify the addSlot function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_9200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_9200 '
      let count: int = 0;
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_9200 START')
      await notificationManager.addSlot(notificationManager.SlotType.LIVE_VIEW).then(() => {
        console.info(`${TAG} addSlot_92 Promise success`)
        count++;
        expect(count).assertEqual(1);
        done()
      }).catch((err:Error):void => {
        console.info(`${TAG} addSlot_92 Promise errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_9200 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_CreateSlot_Static_9300
     * @tc.number Sub_Notification_Ans_Slot_CreateSlot_Static_9300
     * @tc.desc   verify the addSlot function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_CreateSlot_Static_9300', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_CreateSlot_Static_9300 '
      let count: int = 0;
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_9300 START')
      await notificationManager.addSlot(notificationManager.SlotType.CUSTOMER_SERVICE).then(() => {
        console.info(`${TAG} addSlot_93 Promise success`)
        count++;
        expect(count).assertEqual(1);
        done()
      }).catch((err: Error):void => {
        console.info(`${TAG} addSlot_93 Promise errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_CreateSlot_Static_9300 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Cancel_Static_2000
     * @tc.number Sub_Notification_Ans_Cancel_Static_2000
     * @tc.desc   verify the cancel function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Cancel_Static_2000', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {
      let TAG :string ='Sub_Notification_Ans_Cancel_Static_2000'
      let id :int = 1
      let label:string = "label"

      try {
      notificationManager.cancel(id, '', (err: BusinessError | null) => {
        console.info(`${TAG} cancel1 AsyncCallback err: ${err}`)
        expect(false).assertTrue()
        done()
      })
      } catch (err) {
        err =  err as BusinessError;
        console.info(`${TAG} cancel1  errCode: ${err.code}, errMes: ${err.message}`)
        expect(err.code).assertEqual(401)
        done()
      }
      try {
      await notificationManager.cancel(id, '').then(() => {
        console.info(`${TAG} cancel2 Promise success`)
        expect(false).assertTrue()
        done()
      }).catch((err) => {
        let error : BusinessError = err as BusinessError
        console.info(`${TAG} cancel2 Promise error: ${error.code}, errMes: ${error.message}`)
        expect(error?.code).assertEqual(401)
        done()
      })
      } catch (err) {
        err =  err as BusinessError;
        console.info(`${TAG} cancel2  errCode: ${err.code}, errMes: ${err.message}`)
        expect(err.code).assertEqual(401)
        done()
      }
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_GetSlot_Static_4000
     * @tc.number Sub_Notification_Ans_Slot_GetSlot_Static_4000
     * @tc.desc   verify the getSlot function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_GetSlot_Static_4000', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_GetSlot_Static_4000 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_Static_4000 START')
      try {
        notificationManager.getSlot(notificationManager.SlotType.CUSTOMER_SERVICE, (err: BusinessError | null, data) => {
          if (err) {
            console.info(`${TAG} getSlot_40 AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} getSlot_40 AsyncCallback `)
            expect(data).assertEqual(null)
            done()
          }
        })
      } catch (err) {
        err =  err as BusinessError;
        console.info(`${TAG} getSlot_40 AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_Static_4000 END')
    })


    /**
     * @tc.name   Sub_Notification_Ans_Slot_GetSlot_Static_4100
     * @tc.number Sub_Notification_Ans_Slot_GetSlot_Static_4100
     * @tc.desc   verify the getSlot function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_GetSlot_Static_4100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_GetSlot_Static_4100 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_Static_4100 START')
      try {
        notificationManager.getSlot(notificationManager.SlotType.LIVE_VIEW, (err: BusinessError | null, data) => {
          if (err) {
            console.info(`${TAG} getSlot_41 AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} getSlot_41 AsyncCallback `)
            expect(data).assertEqual(null)
            done()
          }
        })
      } catch (err) {
        err =  err as BusinessError;
        console.info(`${TAG} getSlot_41 AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_Static_4100 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_GetSlot_Static_4200
     * @tc.number Sub_Notification_Ans_Slot_GetSlot_Static_4200
     * @tc.desc   verify the getSlot function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_GetSlot_Static_4200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_GetSlot_Static_4200 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_Static_4200 START')
      await notificationManager.getSlot(notificationManager.SlotType.CUSTOMER_SERVICE).then((data) => {
        console.info(`${TAG} getSlot_42 Promise `)
        expect(data).assertEqual(null)
        done()
      }).catch((err: Error):void => {
        console.info(`${TAG} getSlot_42 Promise errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()

      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_Static_4200 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_GetSlot_Static_4300
     * @tc.number Sub_Notification_Ans_Slot_GetSlot_Static_4300
     * @tc.desc   verify the getSlot function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_GetSlot_Static_4300', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_GetSlot_Static_4300 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_Static_4300 START')
      await notificationManager.getSlot(notificationManager.SlotType.LIVE_VIEW).then((data) => {
        console.info(`${TAG} getSlot_43 Promise `)
        expect(data).assertEqual(null)
        done()
      }).catch((err: Error):void => {
        console.info(`${TAG} getSlot_43 Promise errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()

      })
      console.info(TAG + 'Sub_Notification_Ans_Slot_GetSlot_Static_4300 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_DeleteSlot_Static_4000
     * @tc.number Sub_Notification_Ans_Slot_DeleteSlot_Static_4000
     * @tc.desc   verify the removeSlot function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_Static_4000', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_DeleteSlot_Static_4000 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_Static_4000 START')
      let count: int = 0;
      try {
        notificationManager.removeSlot(notificationManager.SlotType.CUSTOMER_SERVICE, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} removeSlot_40 errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} removeSlot_40 success`)
            count++;
            expect(count).assertEqual(1);
            done()
          }
        })
      } catch (err) {
        err =  err as BusinessError;
        console.info(`${TAG} removeSlot_40 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_Static_4000 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_DeleteSlot_Static_4100
     * @tc.number Sub_Notification_Ans_Slot_DeleteSlot_Static_4100
     * @tc.desc   verify the removeSlot function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_Static_4100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_DeleteSlot_Static_4100 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_Static_4100 START')
      let count: int = 0;
      try {
        notificationManager.removeSlot(notificationManager.SlotType.LIVE_VIEW, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} removeSlot_41 errCode: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          } else {
            console.info(`${TAG} removeSlot_41 success`)
            count++;
            expect(count).assertEqual(1);
            done()
          }
        })
      } catch (err) {
        err =  err as BusinessError;
        console.info(`${TAG} removeSlot_41 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_Static_4100 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Slot_DeleteSlot_Static_4200
     * @tc.number Sub_Notification_Ans_Slot_DeleteSlot_Static_4200
     * @tc.desc   verify the removeSlot function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_Static_4200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_DeleteSlot_Static_4200 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_Static_4200 START')
      let count: int = 0;
      try {
        await notificationManager.removeSlot(notificationManager.SlotType.LIVE_VIEW).then(() => {
          console.info(`${TAG} removeSlot_42 success`)
          count++;
          expect(count).assertEqual(1);
          done()
        }).catch((err: Error):void => {
          console.info(`${TAG} removeSlot_42 errCode: ${err.code}, errMes: ${err.message}`)
          expect(false).assertTrue()
          done()
        })
      } catch (err) {
        err =  err as BusinessError;
        console.info(`${TAG} removeSlot_42 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_Static_4200 END')
    })


    /**
     * @tc.name   Sub_Notification_Ans_Slot_DeleteSlot_Static_4300
     * @tc.number Sub_Notification_Ans_Slot_DeleteSlot_Static_4300
     * @tc.desc   verify the removeSlot function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Slot_DeleteSlot_Static_4300', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {
      let TAG:string = 'Sub_Notification_Ans_Slot_DeleteSlot_Static_4300 '
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_Static_4300 START')
      let count: int = 0;
      try {
        await notificationManager.removeSlot(notificationManager.SlotType.CUSTOMER_SERVICE).then(() => {
          console.info(`${TAG} removeSlot_43 success`)
          count++;
          expect(count).assertEqual(1);
          done()
        }).catch((err:Error):void => {
          console.info(`${TAG} removeSlot_43 errCode: ${err.code}, errMes: ${err.message}`)
          expect(false).assertTrue()
          done()
        })
      } catch (err) {
        err =  err as BusinessError;
        console.info(`${TAG} removeSlot_43 errCode: ${err.code}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
      console.info(TAG + 'Sub_Notification_Ans_Slot_DeleteSlot_Static_4300 END')
    })

    /**
     * @tc.name   Sub_Notification_Ans_Distributed_template_Static_0400_001
     * @tc.number Sub_Notification_Ans_Distributed_template_Static_0400_001
     * @tc.desc   verify the isSupportTemplate function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Distributed_template_Static_0400_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Distributed_template_Static_0400_001'
        console.info(`${TAG} Sub_Notification_Ans_Distributed_template_Static_0400_001 START`)
        await notificationManager.isSupportTemplate('').then((data: boolean) => {
          console.info(`${TAG} isSupportTemplate Promise success :${JSON.stringify(data)}`)
          expect(data).assertTrue()
          done()
        }).catch((err: Error): void => {
          console.info(`${TAG} isSupportTemplate Promise err: ${err.code}, errMes: ${err.message}`)
          expect(err.code).assertEqual(401)
          done()
        })
        console.info(`${TAG} Sub_Notification_Ans_Distributed_template_Static_0400_001 END`)
      })

    /**
     * @tc.name   Sub_Notification_Ans_Distributed_template_Static_0300_001
     * @tc.number Sub_Notification_Ans_Distributed_template_Static_0300_001
     * @tc.desc   verify the isSupportTemplate function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Distributed_template_Static_0300_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Distributed_template_Static_0300_001'
        console.info(`${TAG} Sub_Notification_Ans_Distributed_template_Static_0300_001 START`)
        let templateName: string = 'downloadTemplate'
        try {
          notificationManager.isSupportTemplate('', (err: BusinessError | null, data: boolean | undefined) => {
            if (err) {
              console.info(`${TAG} isSupportTemplate AsyncCallback err: ${err.code}, errMes: ${err.message}`)
              expect(err.code).assertEqual(401)
              done()
            } else {
              console.info(`${TAG} isSupportTemplate AsyncCallback success:${JSON.stringify(data)} `)
              expect(data).assertTrue()
              done()
            }
          })
        } catch (err) {
          err =  err as BusinessError;
          console.info(`${TAG} isSupportTemplate AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
          expect(err.code).assertEqual(401)
          done()
        }
        console.info(`${TAG} Sub_Notification_Ans_Distributed_template_Static_0300_001 END`)
      })

    /**
     * @tc.name   Sub_Notification_Ans_Publish_Cancel_Static_3100_001
     * @tc.number Sub_Notification_Ans_Publish_Cancel_Static_3100_001
     * @tc.desc   Cancel the notification of a specified group for this application
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Publish_Cancel_Static_3100_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Publish_Cancel_Static_3100'
        console.info(`${TAG} Sub_Notification_Ans_Publish_Cancel_Static_3100 START`)
        try {
          notificationManager.cancelGroup('', (err: BusinessError | null) => {
            if (err) {
              console.info(`${TAG} cancelGroup AsyncCallback err: ${err.code}, errMes: ${err.message}`)
              expect(false).assertTrue()
              done()
            } else {
              console.info(`${TAG} cancelGroup AsyncCallback success`)
              expect(false).assertTrue()
              done()
            }
          })
        } catch (err) {
          err =  err as BusinessError;
          console.info(`${TAG} cancelGroup AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
          expect(err.code).assertEqual(401)
          done()
        }
        console.info(`${TAG} Sub_Notification_Ans_Publish_Cancel_Static_3100 END`)
      })

    /**
     * @tc.name   Sub_Notification_Ans_Publish_Cancel_Static_3150_001
     * @tc.number Sub_Notification_Ans_Publish_Cancel_Static_3150_001
     * @tc.desc   Cancel the notification of a specified group for this application
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Publish_Cancel_Static_3150_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Publish_Cancel_Static_3150'
        console.info(`${TAG} Sub_Notification_Ans_Publish_Cancel_Static_3150 START`)
        try {
          await notificationManager.cancelGroup('').then(() => {
            console.info(`${TAG} cancelGroup Promise success`)
            expect(false).assertTrue()
            done()
          }).catch((err: Error): void => {
            console.info(`${TAG} cancelGroup Promise err: ${err.code}, errMes: ${err.message}`)
            expect(false).assertTrue()
            done()
          })
        } catch (err) {
          err =  err as BusinessError;
          console.info(`${TAG} cancelGroup AsyncCallback errCode: ${err.code}, errMes: ${err.message}`)
          expect(err.code).assertEqual(401)
          done()
        }
        console.info(`${TAG} Sub_Notification_Ans_Publish_Cancel_Static_3150 END`)
      })

    /**
     * @tc.name   SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_Static_1100_001
     * @tc.number SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_Static_1100_001
     * @tc.desc   verify the callback function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_Static_1100_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_Static_1100_001'
        console.info(`${TAG} SUB_NOTIFICATION_CES_SUBSCRIBE_MANAGER_TEST_Static_1100_001 START`)

        let options: commonEventManager.CommonEventPublishData = {
          code: 0,
          data: "initial data",
          isOrdered: true,
          isSticky: false,
        }

        let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["eventname"],
          priority: 100
        };

        let subscriber: commonEventManager.CommonEventSubscriber
        let tmpsubscriber = commonEventManager.createSubscriberSync(subscribeInfo)
        subscriber = tmpsubscriber as commonEventManager.CommonEventSubscriber
        commonEventManager.subscribe(subscriber,
          (err: BusinessError | null, data: commonEventManager.CommonEventData | undefined) => {
            if (err) {
              expect(false).assertTrue()
              done()
            } else {
              subscriber.isOrderedCommonEvent((err: BusinessError | null, isOrdered: boolean | undefined) => {
                if (err) {
                  console.info(TAG + `isOrderedCommonEvent_11 err ${err}`)
                  expect(false).assertTrue()
                  done()
                } else {
                  console.info(TAG + `isOrderedCommonEvent_11 success ${isOrdered}`)
                  if (isOrdered !== undefined) {
                    expect(isOrdered).assertTrue()
                  } else {
                    expect(false).assertTrue()
                    done()
                  }
                }
              })

              subscriber.isStickyCommonEvent((err: BusinessError | null, isSticky: boolean | undefined) => {
                if (err) {
                  console.info(TAG + `isStickyCommonEvent_9 err ${err}`)
                  expect(false).assertTrue()
                  done()
                } else {
                  console.info(TAG + `isStickyCommonEvent_9 success ${isSticky}`)
                  if (isSticky !== undefined) {
                    expect(isSticky).assertFalse()
                  } else {
                    expect(false).assertTrue()
                    done()
                  }
                }
              })

              subscriber.setCodeAndDataSync(2, "")
              let code3 = subscriber.getCodeSync()
              expect(code3).assertEqual(2);
              console.info(TAG + `getCodeSync after setCodeAndDataSync, code is ${code3}`)

              Utils.msSleep(1000).awaitSync()
              count = 0;
              // console.info(TAG+`getAbortCommonEventSync isaborted ${isaborted}`)
              subscriber.clearAbortCommonEventSync()
              subscriber.finishCommonEvent((err: BusinessError | null) => {
                if (err) {
                  console.info(TAG + `finishCommonEvent_11 err, error code: ${err.code}, message: ${err.message}`)
                  expect(false).assertTrue()
                  done()
                } else {
                  console.info(TAG + `finishCommonEvent_11 success `)
                  count++;
                  expect(count).assertEqual(1);
                  done()
                }
              })
            }
          })

        try {
          setTimeout(() => {
            commonEventManager.publish("eventname", options, (err: BusinessError | null) => {
              if (err) {
                console.error(TAG + `publish failed, code is ${err.code}, message is ${err.message}`)
                expect(false).assertTrue()
                done()
              } else {
                console.info(TAG + `publish success`)
              }
            });
          }, 1000);
        } catch (err) {
          err =  err as BusinessError;
          console.error(TAG + `publish failed, code is ${err.code}, message is ${err.message}`)
        }
      })

    /**
     * @tc.name   Sub_Notification_Ans_Subscriber_Subscribe_Static_1700_001
     * @tc.number Sub_Notification_Ans_Subscriber_Subscribe_Static_1700_001
     * @tc.desc   verify the callback function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Subscriber_Subscribe_Static_1700_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Subscriber_Subscribe_Static_1700_001'
        await Utils.msSleep(1000)
        console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_Static_1700_001 START`)
        let options: commonEventManager.CommonEventPublishData = {
          code: 0,
          data: "initial data",
          isOrdered: true,
          isSticky: false,
        }

        let subscriber: commonEventManager.CommonEventSubscriber

        let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["event07"]
        }
        try {
          commonEventManager.createSubscriber(subscribeInfo, (err: BusinessError | null, commonEventSubscriber) => {
            if (err) {
              console.info(TAG +
                `Sub_Notification_Ans_Subscriber_Subscribe_Static_1700 err, error code: ${err.code}, message: ${err.message}`)
              expect(false).assertTrue()
              done()
            } else {
              console.info(TAG + `Sub_Notification_Ans_Subscriber_Subscribe_Static_1700_001 success`)
                subscriber = commonEventSubscriber as commonEventManager.CommonEventSubscriber

              commonEventManager.subscribe(subscriber,
                (err: BusinessError | null, data: commonEventManager.CommonEventData | undefined) => {
                  if (err) {
                    expect(false).assertTrue()
                    done()
                  } else {
                    Utils.msSleep(500).awaitSync()
                    console.info(TAG + `666: ` + count)
                    subscriber.setCode(1, (err: BusinessError | null) => {
                      if (err) {
                        console.info(TAG + `setCode_1 err, error code: ${err.code}, message: ${err.message}`)
                        expect(false).assertTrue()
                        done()
                      } else {
                        console.info(TAG + `setCode_1 success: `)
                        subscriber.getCode((err: BusinessError | null, Code: int | undefined) => {
                          if (err) {
                            console.info(TAG + `getCode_1 err, error code: ${err.code}, message: ${err.message}`)
                            expect(false).assertTrue()
                            done()
                          } else {
                            console.info(TAG + `getCode_1 success ${Code}`)
                            expect(Code).assertEqual(1)
                          }
                        })
                      }
                    })
                    Utils.msSleep(1000).awaitSync()
                    subscriber.setData('data01', (err: BusinessError | null) => {
                      if (err) {
                        console.info(TAG + `setData_1 err, error code: ${err.code}, message: ${err.message}`)
                        expect(false).assertTrue()
                        done()
                      } else {
                        console.info(TAG + `setData_1 success `)
                        subscriber.getData((err: BusinessError | null, data: string | undefined) => {
                          if (err) {
                            console.info(TAG + `getData_1 err, error code: ${err.code}, message: ${err.message}`)
                            expect(false).assertTrue()
                            done()
                          } else {
                            console.info(TAG + `getData_1 success ${data}`)
                            expect(data).assertEqual('data01')
                          }
                        })
                      }
                    })
                    Utils.msSleep(500).awaitSync()
                    count = 0;
                    subscriber.setCodeAndData(1, '', (err: BusinessError | null) => {
                      if (err) {
                        console.info(TAG + `setCodeAndData_1 err, error code: ${err.code}, message: ${err.message}`)
                        expect(false).assertTrue()
                        done()
                      } else {
                        console.info(TAG + `setCodeAndData_1 success `)
                        count++;
                        expect(count).assertEqual(1);
                      }
                    })
                    Utils.msSleep(500).awaitSync()
                    count = 0;
                    subscriber.getSubscribeInfo((err: BusinessError | null, CommonEventSubscribeInfo) => {
                      if (err) {
                        console.info(TAG + `getSubscribeInfo_1 err, error code: ${err.code}, message: ${err.message}`)
                        expect(false).assertTrue()
                        done()
                      } else {
                        console.info(TAG + `getSubscribeInfo_1 success`)
                        count++;
                        expect(count).assertEqual(1);
                      }
                    })

                    Utils.msSleep(500).awaitSync()
                    count = 0;
                    subscriber.clearAbortCommonEvent((err: BusinessError | null) => {
                      if (err) {
                        console.info(TAG + `clearAbortCommonEvent_1 err ${err}`)
                        expect(false).assertTrue()
                        done()
                      } else {
                        console.info(TAG + `clearAbortCommonEvent_1 success`)
                        count++;
                        expect(count).assertEqual(1);
                      }
                    })
                    Utils.msSleep(500).awaitSync()
                    count = 0;
                    subscriber.finishCommonEvent((err: BusinessError | null) => {
                      if (err) {
                        console.info(TAG + `finishCommonEvent_1 err, error code: ${err.code}, message: ${err.message}`)
                        expect(false).assertTrue()
                        done()
                      } else {
                        console.info(TAG + `finishCommonEvent_1 success `)
                        count++;
                        expect(count).assertEqual(1);
                        Utils.msSleep(200).awaitSync()
                        done()
                      }
                    })
                  }
                })
            }
          })

          setTimeout(() => {
            commonEventManager.publish("event07", options, (err: BusinessError | null) => {
              if (err) {
                console.error(TAG + `publish failed, code is ${err.code}, message is ${err.message}`)
                expect(false).assertTrue()
                done()
              } else {
                console.info(TAG + `publish success`)
              }
            });
          }, 1000);

        } catch (err) {
          err =  err as BusinessError;
          console.info(TAG +
            `Sub_Notification_Ans_Subscriber_Subscribe_Static_1700_001 failed, catch error code: ${err.code}, message: ${err.message}`)
          expect(false).assertTrue()
          done()
        }
        console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_Static_1700_001 END`)

      })

    /**
     * @tc.name   Sub_Notification_Ans_Subscriber_Subscribe_Static_1800_001
     * @tc.number Sub_Notification_Ans_Subscriber_Subscribe_Static_1800_001
     * @tc.desc   verify the promise function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Subscriber_Subscribe_Static_1800_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Subscriber_Subscribe_Static_1800_001'
        await Utils.msSleep(3000)
        console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_Static_1800_001 START`)
        let options: commonEventManager.CommonEventPublishData = {
          code: 0,
          data: "initial data",
          isOrdered: true,
          isSticky: false,
        }

        let subscriber: commonEventManager.CommonEventSubscriber

        let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: ["event08"]
        }

        try {
          commonEventManager.createSubscriber(subscribeInfo, (err: BusinessError | null, commonEventSubscriber) => {
            if (err) {
              console.info(TAG +
                `Sub_Notification_Ans_Subscriber_Subscribe_Static_1800_001 err, error code: ${err.code}, message: ${err.message}`)
              expect(false).assertTrue()
              done()
            } else {
              console.info(TAG +
                `Sub_Notification_Ans_Subscriber_Subscribe_Static_1800_001 success ${commonEventSubscriber}`)
              subscriber = commonEventSubscriber as commonEventManager.CommonEventSubscriber
              count = 0;
              commonEventManager.subscribe(subscriber,
                (err: BusinessError | null, data: commonEventManager.CommonEventData | undefined) => {
                  (async () => {
                  if (err) {
                    expect(false).assertTrue()
                    done()
                  } else {
                    await subscriber.setCode(3).then(() => {
                      console.info(TAG + `setCode_2 success `)
                      count++;
                      expect(count).assertEqual(1);
                    }).catch((err: Error): void => {
                      console.info(TAG + `setCode_2 err, error code: ${err.code}, message: ${err.message}`)
                      expect(false).assertTrue()
                      done()
                    })

                    await subscriber.getCode().then((Code: int) => {
                      console.info(TAG + `getCode_2 success ${Code}`)
                      expect(Code).assertEqual(3)
                    }).catch((err: Error): void => {
                      console.info(TAG + `getCode_2 err, error code: ${err.code}, message: ${err.message}`)
                      expect(false).assertTrue()
                      done()
                    })
                    count = 0;

                    await subscriber.setData('data03').then(() => {
                      console.info(TAG + `setData_2 success `)
                      count++;
                      expect(count).assertEqual(1);
                      subscriber.getData().then((data: string) => {
                        console.info(TAG + `getData_2 success ${data}`)
                        expect(data).assertEqual('data03')
                      }).catch((err: Error): void => {
                        console.info(TAG + `getData_2 err, error code: ${err.code}, message: ${err.message}`)
                        expect(false).assertTrue()
                        done()
                      })
                    }).catch((err: Error): void => {
                      console.info(TAG + `setData_2 err, error code: ${err.code}, message: ${err.message}`)
                      expect(false).assertTrue()
                      done()
                    })
                    count = 0;

                    await subscriber.setCodeAndData(4, '').then(() => {
                      console.info(TAG + `setCodeAndData_2 success `)
                      count++;
                      expect(count).assertEqual(1);
                    }).catch((err: Error): void => {
                      console.info(TAG + `setCodeAndData_2 err, error code: ${err.code}, message: ${err.message}`)
                      expect(false).assertTrue()
                      done()
                    })
                    count = 0;

                    await subscriber.getSubscribeInfo().then((CommonEventSubscribeInfo) => {
                      console.info(TAG + `getSubscribeInfo_2 success `)
                      count++;
                      expect(count).assertEqual(1);
                    }).catch((err: Error): void => {
                      console.info(TAG + `getSubscribeInfo_2 err, error code: ${err.code}, message: ${err.message}`)
                      expect(false).assertTrue()
                      done()
                    })
                    count = 0;

                    await subscriber.finishCommonEvent().then(() => {
                      console.info(TAG + `finishCommonEvent_2 success `)
                      count++;
                      expect(count).assertEqual(1);
                      done()
                    }).catch((err: Error): void => {
                      console.info(TAG + `finishCommonEvent_2 err, error code: ${err.code}, message: ${err.message}`)
                      expect(false).assertTrue()
                      done()
                    })
                  }
                  })().awaitSync()
                })
            }
          })

          setTimeout(() => {
            commonEventManager.publish("event08", options, (err: BusinessError | null) => {
              if (err) {
                console.error(TAG + `publish failed, code is ${err.code}, message is ${err.message}`)
                expect(false).assertTrue()
                done()
              } else {
                console.info(TAG + `publish success`)
              }
            });
          }, 1000);
        } catch (err) {
          err =  err as BusinessError;
          console.info(TAG +
            `Sub_Notification_Ans_Subscriber_Subscribe_Static_1800_001 failed, catch error code: ${err.code}, message: ${err.message}`)
          expect(false).assertTrue()
          done()
        }
        console.info(`${TAG} Sub_Notification_Ans_Subscriber_Subscribe_Static_1800_001 END`)
      })


  })
}
