import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import Base from '@ohos.base';
import { BusinessError } from '@kit.BasicServicesKit';
import NotificationManager from '@ohos.notificationManager';
import commonEvent from '@ohos.commonEvent';
import CommonEventManager from '@ohos.commonEventManager';
import Notification from '@ohos.notification';
import common from '@ohos.app.ability.common';
import { Driver, ON } from '@ohos.UiTest'

let subscriber: CommonEventManager.CommonEventSubscriber; // 用于保存创建成功的订阅者对象，后续使用其完成订阅及退订的动作
let Tag = actsNotificationAnsCovered
// 订阅者信息
let subscribeInfo: CommonEventManager.CommonEventSubscribeInfo = {
  events: ["event"]
};

async function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

let context = getContext(this) as common.UIAbilityContext;

export default function actsNotificationAnsCovered() {
  describe('actsNotificationAnsCovered', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async (done:Function) => {
      NotificationManager.requestEnableNotification((err) => {
        if (err) {
          console.error(Tag+`requestEnableNotification failed, code is ${err.code}, message is ${err.message}`);
          expect(false).assertTrue();
          console.info(`${Tag}` + `test case end`);
          done();
        } else {
          console.info(Tag + "requestEnableNotification success");
        }
      });

      await sleep(1500);
      let driver = Driver.create();
      console.log(Tag + `driver is ${JSON.stringify(driver)}`);
      await driver.assertComponentExist(ON.text('允许'));
      let button = await driver.findComponent(ON.text('允许'));
      console.log(Tag + `button is ${JSON.stringify(button)}`);
      if (button !== null) {

        await button.click();
        await sleep(1500);
        done()
      } else {
        console.log(Tag + `button is null`)
        expect(false).assertTrue();
        done()
      }
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(async () => {
      await sleep(1000)
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })


    /**
     * @tc.number  Sub_Notification_CES_CommonEvent_1101
     * @tc.name    Sub_Notification_CES_CommonEvent_1101
     * @tc.desc    test udnefined of commonEvent.publish
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('Sub_Notification_CES_CommonEvent_1101', Level.LEVEL2, async (done: Function) => {
      let TAG: string = "Sub_Notification_CES_CommonEvent_1101"
      try {
        //发布公共事件
        let publishCB = (err: Base.BusinessError) => {
          if (err.code) {
            console.error(TAG + `publish failed, code is ${err.code}`);
            expect(err.code).assertEqual(1);
            done()
          } else {
            console.info(TAG + "publish success");
            expect(false).assertTrue();
            done()
          }
        }
        CommonEventManager.publish(undefined, publishCB);
      } catch (error) {
        console.info(TAG + " fail");
        expect(error.code).assertEqual(401);
        done()
      }
    })

    /**
     * @tc.number  Sub_Notification_CES_CommonEvent_1103
     * @tc.name    Sub_Notification_CES_CommonEvent_1103
     * @tc.desc    test '' of commonEvent.publish
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('Sub_Notification_CES_CommonEvent_1103', Level.LEVEL2, async (done: Function) => {
      let TAG: string = "Sub_Notification_CES_CommonEvent_1103"
      try {
        //发布公共事件
        let publishCB = (err: Base.BusinessError) => {
          if (err.code) {
            console.error(TAG + `publish failed, code is ${err.code}`);
            expect(err.code).assertEqual(1);
            done()
          } else {
            console.info(TAG + "publish success");
            expect(false).assertTrue();
            done()
          }
        }
        CommonEventManager.publish('', undefined,publishCB);
      } catch (error) {
        console.info(TAG + " fail");
        expect(error.code).assertEqual(401);
        done()
      }
    })

    /**
     * @tc.number  Sub_Notification_CES_CommonEvent_1104
     * @tc.name    Sub_Notification_CES_CommonEvent_1104
     * @tc.desc    test undefined of commonEvent.publish
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('Sub_Notification_CES_CommonEvent_1104', Level.LEVEL2, async (done: Function) => {
      let TAG: string = "Sub_Notification_CES_CommonEvent_1104"
      try {
        //发布公共事件
        let publishCB = (err: Base.BusinessError) => {
          if (err.code) {
            console.error(TAG + `publish failed, code is ${err.code}`);
            expect(err.code).assertEqual(1);
            done()
          } else {
            console.info(TAG + "publish success");
            expect(false).assertTrue();
            done()
          }
        }
        CommonEventManager.publish(undefined, undefined,publishCB);
      } catch (error) {
        console.info(TAG + " fail");
        expect(error.code).assertEqual(401);
        done()
      }
    })

    /**
     * @tc.number  Sub_Notification_CES_CommonEvent_1105
     * @tc.name    Sub_Notification_CES_CommonEvent_1105
     * @tc.desc    test null of commonEvent.publish
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('Sub_Notification_CES_CommonEvent_1105', Level.LEVEL2, async (done: Function) => {
      let TAG: string = "Sub_Notification_CES_CommonEvent_1105"
      try {
        //发布公共事件
        let publishCB = (err: Base.BusinessError) => {
          if (err.code) {
            console.error(TAG + `publish failed, code is ${err.code}`);
            expect(err.code).assertEqual(1);
            done()
          } else {
            console.info(TAG + "publish success");
            expect(false).assertTrue();
            done()
          }
        }
        CommonEventManager.publish(null,null,publishCB);
      } catch (error) {
        console.info(TAG + " fail");
        expect(error.code).assertEqual(401);
        done()
      }
    })

    /**
     * @tc.number  Sub_Notification_CES_CommonEvent_1102
     * @tc.name    Sub_Notification_CES_CommonEvent_1102
     * @tc.desc    test null of commonEvent.publish
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('Sub_Notification_CES_CommonEvent_1102', Level.LEVEL2, async (done: Function) => {
      let TAG: string = "Sub_Notification_CES_CommonEvent_1102"
      try {
        //发布公共事件
        let publishCB = (err: Base.BusinessError) => {
          if (err.code) {
            console.error(TAG + `publish failed, code is ${err.code}`);
            expect(err.code).assertEqual(1);
            done()
          } else {
            console.info(TAG + "publish success");
            expect(false).assertTrue();
            done()
          }
        }
        CommonEventManager.publish(null, publishCB);
      } catch (error) {
        console.info(TAG + " fail");
        expect(error.code).assertEqual(401);
        done()
      }
    })

    /**
     * @tc.number  Sub_Notification_CES_CommonEvent_1001
     * @tc.name    Sub_Notification_CES_CommonEvent_1001
     * @tc.desc    test '' of commonEvent.publish
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('Sub_Notification_CES_CommonEvent_1001', Level.LEVEL2, async (done: Function) => {
      let TAG: string = "Sub_Notification_CES_CommonEvent_1000"
      try {
        //发布公共事件
        let publishCB = (err: Base.BusinessError) => {
          if (err.code) {
            console.error(TAG + `publish failed, code is ${err.code}`);
            expect(err.code).assertEqual(1);
            done()
          } else {
            console.info(TAG + "publish success");
            expect(false).assertTrue();
            done()
          }
        }
        commonEvent.publish('', publishCB);
      } catch (error) {
        console.info(TAG + " fail");
        expect(false).assertTrue();
        done()
      }
    })

    /**
     * @tc.number  Sub_Notification_CES_CommonEvent_1011
     * @tc.name    Sub_Notification_CES_CommonEvent_1011
     * @tc.desc    test '' of commonEvent.publish
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('Sub_Notification_CES_CommonEvent_1011', Level.LEVEL1, async (done: Function) => {
      let TAG: string = "Sub_Notification_CES_CommonEvent_1011"
      //公共事件相关信息
      let options: CommonEventManager.CommonEventPublishData = {
        code: 0, //公共事件的初始代码
        data: "initial data", //公共事件的初始数据
        isOrdered: true  //有序公共事件
      }
      //发布公共事件回调
      let publishCB = (err: Base.BusinessError) => {
        if (err.code) {
          console.error(TAG + `publish failed, code is ${err.code}`);
          expect(err.code).assertEqual(1);
          done()
        } else {
          console.info(TAG + "publish success");
          expect(false).assertTrue();
          done()
        }
      }
      try {
        //发布公共事件
        commonEvent.publish('', options, publishCB);
      } catch (err) {
        console.info(TAG + " fail");
        expect(err.code).assertEqual(401);
        done()
      }
    })

    /**
     * @tc.number  Sub_Notification_CES_CommonEvent_1004
     * @tc.name    Sub_Notification_CES_CommonEvent_1004
     * @tc.desc    test null of commonEvent.publish
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('Sub_Notification_CES_CommonEvent_1004', Level.LEVEL2, async (done: Function) => {
      let TAG: string = "Sub_Notification_CES_CommonEvent_1004"
      // publish回调
      let publishCallback = (err: Base.BusinessError) => {
        if (err) {
          console.error(TAG + `publish failed, code is ${err}`);
          expect(false).assertTrue()
          done()
        } else {
          console.info(TAG + "publish success");
          expect(false).assertTrue()
          done()
        }
      }
      // 通知Request对象
      let notificationRequest: NotificationManager.NotificationRequest = {
        id: 1,
        content: {
          contentType: Notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
          normal: {
            title: "test_title",
            text: "test_text",
            additionalText: "test_additionalText"
          }
        }
      };
      try {
        Notification.publish(null, publishCallback);
      } catch (err) {
        console.info(TAG + " fail");
        expect(err.code).assertEqual(401);
        done()
      }
    })

    /**
     * @tc.number  Sub_Notification_Ans_Notification_1005
     * @tc.name    Sub_Notification_Ans_Notification_1005
     * @tc.desc    test undefined of commonEvent.publish
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('Sub_Notification_Ans_Notification_1005', Level.LEVEL2, async (done: Function) => {
      let TAG: string = "Sub_Notification_Ans_Notification_1005"
      // publish回调
      let publishCallback = (err: Base.BusinessError) => {
        if (err) {
          console.error(TAG + `publish failed, code is ${err}`);
          expect(false).assertTrue()
          done()
        } else {
          console.info(TAG + "publish success");
          expect(false).assertTrue()
          done()
        }
      }
      // 通知Request对象
      let notificationRequest: NotificationManager.NotificationRequest = {
        id: 1,
        content: {
          contentType: Notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
          normal: {
            title: "test_title",
            text: "test_text",
            additionalText: "test_additionalText"
          }
        }
      };
      try {
        Notification.publish(undefined, publishCallback);
      } catch (err) {
        console.info(TAG + " fail");
        expect(err.code).assertEqual(401);
        done()
      }
    })

    /**
     * @tc.number  Sub_Notification_Ans_Notification_1004
     * @tc.name    Sub_Notification_Ans_Notification_1004
     * @tc.desc    test null of Notification.publish
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('Sub_Notification_Ans_Notification_1004', Level.LEVEL2, async (done: Function) => {
      let TAG: string = "Sub_Notification_Ans_Notification_1004"
      // publish回调
      let publishCallback = (err: Base.BusinessError) => {
        if (err) {
          console.error(TAG + `publish failed, code is ${err}`);
          expect(false).assertTrue()
          done()
        } else {
          console.info(TAG + "publish success");
          expect(false).assertTrue()
          done()
        }
      }
      // 通知Request对象
      let notificationRequest: NotificationManager.NotificationRequest = {
        id: 1,
        content: {
          contentType: Notification.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
          normal: {
            title: "test_title",
            text: "test_text",
            additionalText: "test_additionalText"
          }
        }
      };
      try {
        Notification.publish(null, publishCallback);
      } catch (err) {
        console.info(TAG + " fail");
        expect(err.code).assertEqual(401);
        done()
      }
    })

    /**
     * @tc.number  Sub_Notification_Ans_Notification_1006
     * @tc.name    Sub_Notification_Ans_Notification_1006
     * @tc.desc    test  of Notification.publish
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('Sub_Notification_Ans_Notification_1006', Level.LEVEL2, async (done: Function) => {
      let TAG: string = "Sub_Notification_Ans_Notification_1006"
      try {
        Notification.publish(null).then(() => {
          console.info(TAG + "publish success");
          expect(false).assertTrue()
          done()
        }).catch((err: Base.BusinessError) => {
          console.error(TAG + `publish failed, code is ${err}`);
          expect(err.code).assertEqual(401);
          done()
        });
      } catch (err) {
        console.info(TAG + " fail");
        expect(err.code).assertEqual(401);
        done()
      }
    })

    /**
     * @tc.number  Sub_Notification_Ans_Notification_1007
     * @tc.name    Sub_Notification_Ans_Notification_1007
     * @tc.desc    test undefined of Notification.publish
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('Sub_Notification_Ans_Notification_1007', Level.LEVEL2, async (done: Function) => {
      let TAG: string = "Sub_Notification_Ans_Notification_1007"
      try {
        Notification.publish(undefined).then(() => {
          console.info(TAG + "publish success");
          expect(false).assertTrue()
          done()
        }).catch((err: Base.BusinessError) => {
          console.error(TAG + `publish failed, code is ${err}`);
          expect(err.code).assertEqual(401);
          done()
        });
      } catch (err) {
        console.info(TAG + " fail");
        expect(err.code).assertEqual(401);
        done()
      }
    })

    /**
     * @tc.number  Sub_Notification_Ans_Notification_1008
     * @tc.name    Sub_Notification_Ans_Notification_1008
     * @tc.desc    test null of Notification.cancel
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('Sub_Notification_Ans_Notification_1008', Level.LEVEL2, async (done: Function) => {
      let TAG: string = "Sub_Notification_Ans_Notification_1008"
      // cancel回调
      let cancelCallback = (err: Base.BusinessError) => {
        if (err) {
          console.info(TAG + "cancel failed " + JSON.stringify(err));
          expect(err.code).assertEqual(401);
          done()
        } else {
          console.info(TAG + "cancel success");
          expect(false).assertTrue()
          done()
        }
      }

      try {
        Notification.cancel(null, cancelCallback);
      } catch (err) {
        console.info(TAG + " fail");
        expect(err.code).assertEqual(401);
        done()
      }
    })

    /**
     * @tc.number  Sub_Notification_Ans_Notification_1009
     * @tc.name    Sub_Notification_Ans_Notification_1009
     * @tc.desc    test undefiend of Notification.cancel
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('Sub_Notification_Ans_Notification_1009', Level.LEVEL2, async (done: Function) => {
      let TAG: string = "Sub_Notification_Ans_Notification_1009"
      // cancel回调
      let cancelCallback = (err: Base.BusinessError) => {
        if (err) {
          console.info(TAG + "cancel failed " + JSON.stringify(err));
          expect(err.code).assertEqual(401);
          done()
        } else {
          console.info(TAG + "cancel success");
          expect(false).assertTrue()
          done()
        }
      }

      try {
        Notification.cancel(undefined, cancelCallback);
      } catch (err) {
        console.info(TAG + " fail");
        expect(err.code).assertEqual(401);
        done()
      }
    })

    /**
     * @tc.number  Sub_Notification_Ans_Notification_1010
     * @tc.name    Sub_Notification_Ans_Notification_1010
     * @tc.desc    test undefined of Notification.cancel
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('Sub_Notification_Ans_Notification_1010', Level.LEVEL2, async (done: Function) => {
      let TAG: string = "Sub_Notification_Ans_Notification_1010"
      // cancel回调
      let cancelCallback = (err: Base.BusinessError) => {
        if (err) {
          console.info(TAG + "cancel failed " + JSON.stringify(err));
          expect(err.code).assertEqual(401);
          done()
        } else {
          console.info(TAG + "cancel success");
          expect(false).assertTrue()
          done()
        }
      }

      try {
        Notification.cancel(undefined, 'label', cancelCallback);
      } catch (err) {
        console.info(TAG + " fail");
        expect(err.code).assertEqual(401);
        done()
      }
    })

    /**
     * @tc.number  Sub_Notification_Ans_Notification_1011
     * @tc.name    Sub_Notification_Ans_Notification_1011
     * @tc.desc    test null of Notification.cancel
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('Sub_Notification_Ans_Notification_1011', Level.LEVEL2, async (done: Function) => {
      let TAG: string = "Sub_Notification_Ans_Notification_1011"
      // cancel回调
      let cancelCallback = (err: Base.BusinessError) => {
        if (err) {
          console.info(TAG + "cancel failed " + JSON.stringify(err));
          expect(err.code).assertEqual(401);
          done()
        } else {
          console.info(TAG + "cancel success");
          expect(false).assertTrue()
          done()
        }
      }

      try {
        Notification.cancel(null, 'label', cancelCallback);
      } catch (err) {
        console.info(TAG + " fail");
        expect(err.code).assertEqual(401);
        done()
      }
    })

    /**
     * @tc.number  Sub_Notification_Ans_Notification_1014
     * @tc.name    Sub_Notification_Ans_Notification_1014
     * @tc.desc    test null of Notification.cancel
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('Sub_Notification_Ans_Notification_1014', Level.LEVEL2, async (done: Function) => {
      let TAG: string = "Sub_Notification_Ans_Notification_1014"
      try {
        Notification.cancel(null, "label").then(() => {
          console.info(TAG + "cancel success");
          expect(false).assertTrue()
          done()
        }).catch((err: Base.BusinessError) => {
          console.error(TAG + `cancel failed, code is ${err}`);
          expect(err.code).assertEqual(401);
          done()
        });
      } catch (err) {
        console.info(TAG + " fail");
        expect(err.code).assertEqual(401);
        done()
      }
    })

    /**
     * @tc.number  Sub_Notification_Ans_Notification_1015
     * @tc.name    Sub_Notification_Ans_Notification_1015
     * @tc.desc    test undefined of Notification.cancel
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('Sub_Notification_Ans_Notification_1015', Level.LEVEL2, async (done: Function) => {
      let TAG: string = "Sub_Notification_Ans_Notification_1015"
      try {
        Notification.cancel(undefined, "label").then(() => {
          console.info(TAG + "cancel success");
          expect(false).assertTrue()
          done()
        }).catch((err: Base.BusinessError) => {
          console.error(TAG + `cancel failed, code is ${err}`);
          expect(err.code).assertEqual(401);
          done()
        });
      } catch (err) {
        console.info(TAG + " fail");
        expect(err.code).assertEqual(401);
        done()
      }
    })

    /**
     * @tc.number  Sub_Notification_Ans_Notification_1018
     * @tc.name    Sub_Notification_Ans_Notification_1018
     * @tc.desc    test undefined of Notification.cancelGroup
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('Sub_Notification_Ans_Notification_1018', Level.LEVEL2, async (done: Function) => {
      let TAG: string = "Sub_Notification_Ans_Notification_1018"
      let cancelGroupCallback = (err: Base.BusinessError) => {
        if (err) {
          console.info(TAG + "cancelGroup failed " + JSON.stringify(err));
          expect(false).assertTrue()
          done()
        } else {
          console.info(TAG + "cancelGroup success");
          expect(false).assertTrue()
          done()
        }
      }

      try {
        Notification.cancelGroup(undefined, cancelGroupCallback);
      } catch (err) {
        console.info(TAG + " fail");
        expect(err.code).assertEqual(401);
        done()
      }
    })

    /**
     * @tc.number  Sub_Notification_Ans_Notification_1020
     * @tc.name    Sub_Notification_Ans_Notification_1020
     * @tc.desc    test null of Notification.cancelGroup
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('Sub_Notification_Ans_Notification_1020', Level.LEVEL2, async (done: Function) => {
      let TAG: string = "Sub_Notification_Ans_Notification_1020"
      try {
        Notification.cancelGroup(null).then(() => {
          console.info(TAG + "cancelGroup success");
          expect(false).assertTrue()
          done()
        }).catch((err: Base.BusinessError) => {
          console.error(TAG + `cancelGroup failed, code is ${err}`);
          expect(false).assertTrue()
          done()
        });
      } catch (err) {
        console.info(TAG + " fail");
        expect(err.code).assertEqual(401);
        done()
      }
    })

    /**
     * @tc.number  Sub_Notification_Ans_Notification_1029
     * @tc.name    Sub_Notification_Ans_Notification_1029
     * @tc.desc    test undefined of Notification.cancelGroup
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('Sub_Notification_Ans_Notification_1029', Level.LEVEL2, async (done: Function) => {
      let TAG: string = "Sub_Notification_Ans_Notification_1029"
      try {
        Notification.cancelGroup(undefined).then(() => {
          console.info(TAG + "cancelGroup success");
          expect(false).assertTrue()
          done()
        }).catch((err: Base.BusinessError) => {
          console.error(TAG + `cancelGroup failed, code is ${err}`);
          expect(false).assertTrue()
          done()
        });
      } catch (err) {
        console.info(TAG + " fail");
        expect(err.code).assertEqual(401);
        done()
      }
    })

    /**
     * @tc.number  Sub_Notification_Ans_Notification_1023
     * @tc.name    Sub_Notification_Ans_Notification_1023
     * @tc.desc    test null of Notification.isSupportTemplate
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('Sub_Notification_Ans_Notification_1023', Level.LEVEL2, async (done: Function) => {
      let TAG: string = "Sub_Notification_Ans_Notification_1023"
      let isSupportTemplateCallback = (err: Base.BusinessError, data: boolean) => {
        if (err) {
          console.info(TAG + "isSupportTemplate failed " + JSON.stringify(err));
          expect(false).assertTrue()
          done()
        } else {
          console.info(TAG + "isSupportTemplate success");
          expect(false).assertTrue()
          done()
        }
      }
      try {
        Notification.isSupportTemplate(null, isSupportTemplateCallback);
      } catch (err) {
        console.info(TAG + " fail");
        expect(err.code).assertEqual(401);
        done()
      }
    })

    /**
     * @tc.number  Sub_Notification_Ans_Notification_1024
     * @tc.name    Sub_Notification_Ans_Notification_1024
     * @tc.desc    test undefined of Notification.isSupportTemplate
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('Sub_Notification_Ans_Notification_1024', Level.LEVEL2, async (done: Function) => {
      let TAG: string = "Sub_Notification_Ans_Notification_1024"
      let isSupportTemplateCallback = (err: Base.BusinessError, data: boolean) => {
        if (err) {
          console.info(TAG + "isSupportTemplate failed " + JSON.stringify(err));
          expect(false).assertTrue()
          done()
        } else {
          console.info(TAG + "isSupportTemplate success");
          expect(false).assertTrue()
          done()
        }
      }
      try {
        Notification.isSupportTemplate(undefined, isSupportTemplateCallback);
      } catch (err) {
        console.info(TAG + " fail");
        expect(err.code).assertEqual(401);
        done()
      }
    })

    /**
     * @tc.number  Sub_Notification_Ans_Notification_1026
     * @tc.name    Sub_Notification_Ans_Notification_1026
     * @tc.desc    test null of Notification.isSupportTemplate
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('Sub_Notification_Ans_Notification_1026', Level.LEVEL2, async (done: Function) => {
      let TAG: string = "Sub_Notification_Ans_Notification_1026"

      try {
        Notification.isSupportTemplate(null).then((data: boolean) => {
          console.info(TAG + "isSupportTemplate success, data: " + JSON.stringify(data));
          expect(false).assertTrue()
          done()
        }).catch((err: Base.BusinessError) => {
          console.error(TAG + `isSupportTemplate failed, code is ${err}`);
          expect(false).assertTrue()
          done()
        });
      } catch (err) {
        console.info(TAG + " fail");
        expect(err.code).assertEqual(401);
        done()
      }
    })

    /**
     * @tc.number  Sub_Notification_Ans_Notification_1027
     * @tc.name    Sub_Notification_Ans_Notification_1027
     * @tc.desc    test undefined of Notification.isSupportTemplate
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('Sub_Notification_Ans_Notification_1027', Level.LEVEL2, async (done: Function) => {
      let TAG: string = "Sub_Notification_Ans_Notification_1027"

      try {
        Notification.isSupportTemplate(undefined).then((data: boolean) => {
          console.info(TAG + "isSupportTemplate success, data: " + JSON.stringify(data));
          expect(false).assertTrue()
          done()
        }).catch((err: Base.BusinessError) => {
          console.error(TAG + `isSupportTemplate failed, code is ${err}`);
          expect(false).assertTrue()
          done()
        });
      } catch (err) {
        console.info(TAG + " fail");
        expect(err.code).assertEqual(401);
        done()
      }
    })

    /**
     * @tc.number  Sub_Notification_CES_CommonEvent_1007
     * @tc.name    Sub_Notification_CES_CommonEvent_1007
     * @tc.desc    test null of subscriber
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('Sub_Notification_CES_CommonEvent_1007', Level.LEVEL2, async (done: () => void) => {
      let TAG: string = "Sub_Notification_CES_CommonEvent_1007"
      // 定义订阅者，用于保存创建成功的订阅者对象，后续使用其完成订阅及退订的动作
      let subscriber: CommonEventManager.CommonEventSubscriber;
      // 订阅者信息
      let subscribeInfo: CommonEventManager.CommonEventSubscribeInfo = {
        events: ["event284"],
        publisherBundleName: 'com.example.myapplication'
      };

      CommonEventManager.createSubscriber(subscribeInfo, async (err, commonEventSubscriber) => {
        if (err) {
          console.info(`Sub_Notification_CES_CommonEvent_1007 err, error code: ${err.code}, message: ${err.message}`)
          expect(false).assertTrue()
          done()
        } else {
          console.info(`Sub_Notification_CES_CommonEvent_1007 success ${commonEventSubscriber}`)
          subscriber = commonEventSubscriber

          try {
            subscriber.getCode(undefined)
          } catch (err) {
            console.info(`${TAG} getCode err: ${err.code}, errMes: ${err.message}`)
            expect(err.code).assertEqual(401)
            done()
          }

          try {
            subscriber.setCode(undefined, (err) => {
              console.info(`${TAG} setCode id success`)
              expect(false).assertTrue()
              done()
            })
          } catch (err) {
            console.info(`${TAG} setCode err: ${err.code}, errMes: ${err.message}`)
            expect(err.code).assertEqual(401)
            done()
          }

          try {
            subscriber.getData(undefined)
          } catch (err) {
            console.info(`${TAG} getData err: ${err.code}, errMes: ${err.message}`)
            expect(err.code).assertEqual(401)
            done()
          }

          try {
            subscriber.setData(undefined, (err) => {
              console.info(`setData_1 err, error code: ${err.code}, message: ${err.message}`)
              expect(false).assertTrue()
              done()
            })
          } catch (err) {
            console.info(`${TAG} setData err: ${err.code}, errMes: ${err.message}`)
            expect(err.code).assertEqual(401)
            done()
          }

          try {
            subscriber.clearAbortCommonEvent(undefined)
          } catch (err) {
            console.info(`${TAG} clearAbortCommonEvent err: ${err.code}, errMes: ${err.message}`)
            expect(err.code).assertEqual(401)
            done()
          }
          try {
            subscriber.setCodeAndData(undefined, undefined, (err) => {
              console.info(`${TAG} setCodeAndData id success`)
              expect(false).assertTrue()
              done()
            })
          } catch (err) {
            console.info(`${TAG} setCodeAndData err: ${err.code}, errMes: ${err.message}`)
            expect(err.code).assertEqual(401)
            done()
          }
          try {
            subscriber.setCodeAndDataSync(null, null)
          } catch (err) {
            console.info(`${TAG} setCodeAndData err: ${err.code}, errMes: ${err.message}`)
            expect(err.code).assertEqual(undefined)
            done()
          }
          try {
            subscriber.setCodeAndDataSync(undefined, undefined)
          } catch (err) {
            console.info(`${TAG} setCodeAndData err: ${err.code}, errMes: ${err.message}`)
            expect(err.code).assertEqual(undefined)
            done()
          }
          try {
            subscriber.isOrderedCommonEvent(undefined)
          } catch (err) {
            console.info(`${TAG} isOrderedCommonEvent err: ${err.code}, errMes: ${err.message}`)
            expect(err.code).assertEqual(401)
            done()
          }

          try {
            subscriber.isStickyCommonEvent(undefined)
          } catch (err) {
            console.info(`${TAG} isStickyCommonEvent err: ${err.code}, errMes: ${err.message}`)
            expect(err.code).assertEqual(401)
            done()
          }

          try {
            subscriber.abortCommonEvent(undefined)
          } catch (err) {
            console.info(`${TAG} abortCommonEvent err: ${err.code}, errMes: ${err.message}`)
            expect(err.code).assertEqual(401)
            done()
          }

          try {
            subscriber.clearAbortCommonEvent(undefined)
          } catch (err) {
            console.info(`${TAG} clearAbortCommonEvent err: ${err.code}, errMes: ${err.message}`)
            expect(err.code).assertEqual(401)
            done()
          }

          try {
            subscriber.getAbortCommonEvent(undefined)
          } catch (err) {
            console.info(`${TAG} getAbortCommonEvent err: ${err.code}, errMes: ${err.message}`)
            expect(err.code).assertEqual(401)
            done()
          }

          try {
            subscriber.getSubscribeInfo(undefined)
          } catch (err) {
            console.info(`${TAG} getSubscribeInfo err: ${err.code}, errMes: ${err.message}`)
            expect(err.code).assertEqual(401)
            done()
          }

          try {
            subscriber.finishCommonEvent(undefined)
          } catch (err) {
            console.info(`${TAG} finishCommonEvent err: ${err.code}, errMes: ${err.message}`)
            expect(err.code).assertEqual(401)
            done()
          }

        }
      })
    })

    /**
     * @tc.number  Sub_Notification_CES_CommonEvent_1008
     * @tc.name    Sub_Notification_CES_CommonEvent_1008
     * @tc.desc    test null of subscriber
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('Sub_Notification_CES_CommonEvent_1008', Level.LEVEL2, async (done: () => void) => {
      let TAG: string = "Sub_Notification_CES_CommonEvent_1008"
      // 定义订阅者，用于保存创建成功的订阅者对象，后续使用其完成订阅及退订的动作
      let subscriber: CommonEventManager.CommonEventSubscriber;
      // 订阅者信息
      let subscribeInfo: CommonEventManager.CommonEventSubscribeInfo = {
        events: ["event284"],
        publisherBundleName: 'com.example.myapplication'
      };

      CommonEventManager.createSubscriber(subscribeInfo, async (err, commonEventSubscriber) => {
        if (err) {
          console.info(`Sub_Notification_CES_CommonEvent_1007 err, error code: ${err.code}, message: ${err.message}`)
          expect(false).assertTrue()
          done()
        } else {
          console.info(`Sub_Notification_CES_CommonEvent_1007 success ${commonEventSubscriber}`)
          subscriber = commonEventSubscriber

          try {
            subscriber.getCode(undefined)
          } catch (err) {
            console.info(`${TAG} getCode err: ${err.code}, errMes: ${err.message}`)
            expect(err.code).assertEqual(401)
            done()
          }
          await sleep(500)
          try {
            subscriber.setCode(null).then(() => {
              console.info(`Succeeded in setting code.`);
            }).catch((err: BusinessError) => {
              console.error(`Failed to set code. Code is ${err.code}, message is ${err.message}`);
              expect(err.code).assertEqual(undefined)
              done()
            });
          } catch (err) {
            console.info(`${TAG} setCode err: ${err.code}, errMes: ${err.message}`)
            expect(err.code).assertEqual(401)
            done()
          }
          await sleep(500)
          try {
            subscriber.setCode(undefined).then(() => {
              console.info(`Succeeded in setting code.`);
            }).catch((err: BusinessError) => {
              console.error(`Failed to set code. Code is ${err.code}, message is ${err.message}`);
              expect(err.code).assertEqual(undefined)
              done()
            });
          } catch (err) {
            console.info(`${TAG} setCode err: ${err.code}, errMes: ${err.message}`)
            expect(err.code).assertEqual(401)
            done()
          }
          await sleep(500)
          try {
            subscriber.setCodeSync(null)
            done()
          } catch (err) {
            console.info(`${TAG} setCode err: ${err.code}, errMes: ${err.message}`)
            expect(err.code).assertEqual(undefined)
            done()
          }
          await sleep(500)
          try {
            subscriber.setCodeSync(undefined)
            done()
          } catch (err) {
            console.info(`${TAG} setCode err: ${err.code}, errMes: ${err.message}`)
            expect(err.code).assertEqual(undefined)
            done()
          }
          await sleep(500)
          try {
            subscriber.getData(undefined)
          } catch (err) {
            console.info(`${TAG} getData err: ${err.code}, errMes: ${err.message}`)
            expect(err.code).assertEqual(401)
            done()
          }
          await sleep(500)
          try {
            subscriber.setData(null).then(() => {
              console.info(TAG + `Succeeded in setting data.`);
            }).catch((err: BusinessError) => {
              console.error(TAG + `Failed to set data. Code is ${err.code}, message is ${err.message}`);
              expect(err.code).assertEqual(401)
              done()
            });
          } catch (err) {
            console.info(`${TAG} getData err: ${err.code}, errMes: ${err.message}`)
            expect(err.code).assertEqual(401)
            done()
          }
          await sleep(500)
          try {
            subscriber.setData(undefined).then(() => {
              console.info(`Succeeded in setting data.`);
            }).catch((err: BusinessError) => {
              console.error(`Failed to set data. Code is ${err.code}, message is ${err.message}`);
              expect(err.code).assertEqual(401)
              done()
            });
          } catch (err) {
            console.info(`${TAG} getData err: ${err.code}, errMes: ${err.message}`)
            expect(err.code).assertEqual(401)
            done()
          }
          await sleep(500)
          try {
            subscriber.setCodeAndData(null, null).then(() => {
              console.info(`Succeeded in setting code and data.`);
            }).catch((err: BusinessError) => {
              console.error(`Failed to set code and data. Code is ${err.code}, message is ${err.message}`);
            });
          } catch (err) {
            console.info(`${TAG} setCodeAndData err: ${err.code}, errMes: ${err.message}`)
            expect(err.code).assertEqual(401)
            done()
          }
          await sleep(500)
          try {
            subscriber.setCodeAndData(undefined, undefined).then(() => {
              console.info(`Succeeded in setting code and data.`);
            }).catch((err: BusinessError) => {
              console.error(`Failed to set code and data. Code is ${err.code}, message is ${err.message}`);
            });
          } catch (err) {
            console.info(`${TAG} setCodeAndData err: ${err.code}, errMes: ${err.message}`)
            expect(err.code).assertEqual(401)
            done()
          }
        }
      })
    })

    /**
     * @tc.number  Sub_Notification_CES_CommonEvent_1017
     * @tc.name    Sub_Notification_CES_CommonEvent_1017
     * @tc.desc    test null of subscriber
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('Sub_Notification_CES_CommonEvent_1017', Level.LEVEL2, async (done: () => void) => {
      let TAG: string = "Sub_Notification_CES_CommonEvent_1017"
      // 定义订阅者，用于保存创建成功的订阅者对象，后续使用其完成订阅及退订的动作
      let subscriber: CommonEventManager.CommonEventSubscriber;
      // 订阅者信息
      let subscribeInfo: CommonEventManager.CommonEventSubscribeInfo = {
        events: ["event284"],
        publisherBundleName: 'com.example.myapplication'
      };

      CommonEventManager.createSubscriber(subscribeInfo, async (err, commonEventSubscriber) => {
        if (err) {
          console.info(`Sub_Notification_CES_CommonEvent_1007 err, error code: ${err.code}, message: ${err.message}`)
          expect(false).assertTrue()
          done()
        } else {
          console.info(`Sub_Notification_CES_CommonEvent_1007 success ${commonEventSubscriber}`)
          subscriber = commonEventSubscriber
          await sleep(500)
          try {
            subscriber.setDataSync('');
          } catch (err) {
            console.info(`${TAG} setCodeAndData err: ${err.code}, errMes: ${err.message}`)
            expect(err.code).assertEqual(undefined)
            done()
          }
          await sleep(500)
          try {
            subscriber.setDataSync(null);
          } catch (err) {
            console.info(`${TAG} setCodeAndData err: ${err.code}, errMes: ${err.message}`)
            expect(err.code).assertEqual(undefined)
            done()
          }
          await sleep(500)
          try {
            subscriber.setDataSync(undefined);
          } catch (err) {
            console.info(`${TAG} setCodeAndData err: ${err.code}, errMes: ${err.message}`)
            expect(err.code).assertEqual(undefined)
            done()
          }
          await sleep(500)
          let count = 0
          try {
            subscriber.setCodeAndData(1, '', (err) => {
              count++
              expect(count).assertEqual(1)
              console.info(`${TAG} setCodeAndData id success`)
            })
          } catch (err) {
            console.info(`${TAG} setCodeAndData err: ${err.code}, errMes: ${err.message}`)
            expect(err.code).assertEqual(401)
            done()
          }
          await sleep(500)
          try {
            subscriber.setCodeAndData(2, '').then(() => {
              count++
              expect(count).assertEqual(2)
              console.info(`Succeeded in setting code and data.`);
            }).catch((err: BusinessError) => {
              console.error(`Failed to set code and data. Code is ${err.code}, message is ${err.message}`);
              done()
            });
          } catch (err) {
            console.info(`${TAG} setCodeAndData err: ${err.code}, errMes: ${err.message}`)
            expect(err.code).assertEqual(401)
            done()
          }
          await sleep(500)
          try {
            subscriber.setCodeAndDataSync(3, '')
            done()
          } catch (err) {
            console.info(`${TAG} setCodeAndData err: ${err.code}, errMes: ${err.message}`)
            expect(err.code).assertEqual(undefined)
            done()
          }
        }
      })
    })

    /**
     * @tc.number  Sub_Notification_CES_CommonEvent_1013
     * @tc.name    Sub_Notification_CES_CommonEvent_1013
     * @tc.desc    test string 1 of publish
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('Sub_Notification_CES_CommonEvent_1013', Level.LEVEL2, async (done: Function) => {
      let TAG: string = "Sub_Notification_CES_CommonEvent_1013"
      let count = 0
      try {
        //发布公共事件
        let publishCB = (err: Base.BusinessError) => {
          if (err.code) {
            console.error(TAG + `publish failed, code is ${err.code}`);
            expect(err.code).assertEqual(1);
            done()
          } else {
            console.info(TAG + "publish success");
            count++
            expect(count).assertEqual(1);
            done()
          }
        }
        commonEvent.publish('E', publishCB);
      } catch (error) {
        console.info(TAG + " fail");
        expect(false).assertTrue();
        done()
      }
    })

    /**
     * @tc.number  Sub_Notification_CES_CommonEvent_1014
     * @tc.name    Sub_Notification_CES_CommonEvent_1014
     * @tc.desc    test string 256 of publish
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('Sub_Notification_CES_CommonEvent_1014', Level.LEVEL2, async (done: Function) => {
      let TAG: string = "Sub_Notification_CES_CommonEvent_1014"
      let count = 0
      try {
        //发布公共事件
        let publishCB = (err: Base.BusinessError) => {
          if (err.code) {
            console.error(TAG + `publish failed, code is ${err.code}`);
            expect(err.code).assertEqual(1);
            done()
          } else {
            console.info(TAG + "publish success");
            count++
            expect(count).assertEqual(1);
            done()
          }
        }
        commonEvent.publish('abc123def456ghi789jkl012mno345pqr678stu901vwx234yzA567BCD890EFG123HIJ456KLM789NOP012QRS345TUV678WXY901Z!@#$%^&*()_+=-[]{};\':",.<>/?\\|',
          publishCB);
      } catch (error) {
        console.info(TAG + " fail");
        expect(false).assertTrue();
        done()
      }
    })

    /**
     * @tc.number  Sub_Notification_CES_CommonEvent_1015
     * @tc.name    Sub_Notification_CES_CommonEvent_1015
     * @tc.desc    test string 256 +1 of publish
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('Sub_Notification_CES_CommonEvent_1015', Level.LEVEL2, async (done: Function) => {
      let TAG: string = "Sub_Notification_CES_CommonEvent_1015"
      let count = 0
      try {
        //发布公共事件
        let publishCB = (err: Base.BusinessError) => {
          if (err.code) {
            console.error(TAG + `publish failed, code is ${err.code}`);
            expect(err.code).assertEqual(1);
            done()
          } else {
            console.info(TAG + "publish success");
            count++
            expect(count).assertEqual(1);
            done()
          }
        }
        commonEvent.publish('abc123def456ghi789jkl012mno345pqr678stu901vwx234yzA567BCD890EFG123HIJ456KLM789NOP012QRS345TUV678WXY901Z!@#$%^&*()_+=-[]{};\':",.<>/?\\|a',
          publishCB);
      } catch (error) {
        console.info(TAG + " fail");
        expect(false).assertTrue();
        done()
      }
    })

    /**
     * @tc.number  Sub_Notification_Ans_Notification_1030
     * @tc.name    Sub_Notification_Ans_Notification_1030
     * @tc.desc    test null of NotificationManager.publish
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('Sub_Notification_Ans_Notification_1030', Level.LEVEL2, async (done: Function) => {
      let TAG: string = "Sub_Notification_Ans_Notification_1030"
      let publishCallback = (err: BusinessError): void => {
        if (err) {
          console.error(TAG + `Failed to publish notification. Code is ${err.code}, message is ${err.message}`);
          expect(false).assertTrue();
          done()
        } else {
          console.info(TAG + `Succeeded in publishing notification.`);
          expect(false).assertTrue();
          done()
        }
      }

      try {
        NotificationManager.publish(null, publishCallback);
      } catch (err) {
        console.info(TAG + " fail");
        expect(err.code).assertEqual(401);
        done()
      }
    })

    /**
     * @tc.number  Sub_Notification_Ans_Notification_1031
     * @tc.name    Sub_Notification_Ans_Notification_1031
     * @tc.desc    test undefined of NotificationManager.publish
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('Sub_Notification_Ans_Notification_1031', Level.LEVEL2, async (done: Function) => {
      let TAG: string = "Sub_Notification_Ans_Notification_1031"
      let publishCallback = (err: BusinessError): void => {
        if (err) {
          console.error(TAG + `Failed to publish notification. Code is ${err.code}, message is ${err.message}`);
          expect(false).assertTrue();
          done()
        } else {
          console.info(TAG + `Succeeded in publishing notification.`);
          expect(false).assertTrue();
          done()
        }
      }

      try {
        NotificationManager.publish(undefined, publishCallback);
      } catch (err) {
        console.info(TAG + " fail");
        expect(err.code).assertEqual(401);
        done()
      }
    })

    /**
     * @tc.number  Sub_Notification_Ans_Notification_1032
     * @tc.name    Sub_Notification_Ans_Notification_1032
     * @tc.desc    test null of NotificationManager.publish
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('Sub_Notification_Ans_Notification_1032', Level.LEVEL2, async (done: Function) => {
      let TAG: string = "Sub_Notification_Ans_Notification_1032"

      try {
        await NotificationManager.publish(null).then(() => {
          console.info(TAG + `Succeeded in publishing notification.`);
          expect(false).assertTrue();
          done()
        }).catch((err: BusinessError) => {
          console.error(TAG + `Failed to publish notification. Code is ${err.code}, message is ${err.message}`);
          expect(false).assertTrue();
          done()
        });
      } catch (err) {
        console.info(TAG + " fail");
        expect(err.code).assertEqual(401);
        done()
      }
    })

    /**
     * @tc.number  Sub_Notification_Ans_Notification_1033
     * @tc.name    Sub_Notification_Ans_Notification_1033
     * @tc.desc    test undefined of NotificationManager.publish
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('Sub_Notification_Ans_Notification_1033', Level.LEVEL2, async (done: Function) => {
      let TAG: string = "Sub_Notification_Ans_Notification_1033"

      try {
        await NotificationManager.publish(undefined).then(() => {
          console.info(TAG + `Succeeded in publishing notification.`);
          expect(false).assertTrue();
          done()
        }).catch((err: BusinessError) => {
          console.error(TAG + `Failed to publish notification. Code is ${err.code}, message is ${err.message}`);
          expect(false).assertTrue();
          done()
        });
      } catch (err) {
        console.info(TAG + " fail");
        expect(err.code).assertEqual(401);
        done()
      }
    })

    /**
     * @tc.number  Sub_Notification_Ans_Notification_1034
     * @tc.name    Sub_Notification_Ans_Notification_1034
     * @tc.desc    test null of NotificationManager.cancel
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('Sub_Notification_Ans_Notification_1034', Level.LEVEL2, async (done: Function) => {
      let TAG: string = "Sub_Notification_Ans_Notification_1034"
      // cancel回调
      let cancelCallback = (err: BusinessError): void => {
        if (err) {
          console.error(TAG + `Failed to cancel notification. Code is ${err.code}, message is ${err.message}`);
          expect(false).assertTrue();
          done()
        } else {
          console.info(TAG + `Succeeded in canceling notification.`);
          expect(false).assertTrue();
          done()
        }
      }
      try {
        NotificationManager.cancel(null, cancelCallback);
      } catch (err) {
        console.info(TAG + " fail");
        expect(err.code).assertEqual(401);
        done()
      }
    })

    /**
     * @tc.number  Sub_Notification_Ans_Notification_1035
     * @tc.name    Sub_Notification_Ans_Notification_1035
     * @tc.desc    test undefined of NotificationManager.cancel
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('Sub_Notification_Ans_Notification_1035', Level.LEVEL2, async (done: Function) => {
      let TAG: string = "Sub_Notification_Ans_Notification_1035"
      // cancel回调
      let cancelCallback = (err: BusinessError): void => {
        if (err) {
          console.error(TAG + `Failed to cancel notification. Code is ${err.code}, message is ${err.message}`);
          expect(false).assertTrue();
          done()
        } else {
          console.info(TAG + `Succeeded in canceling notification.`);
          expect(false).assertTrue();
          done()
        }
      }
      try {
        NotificationManager.cancel(undefined, cancelCallback);
      } catch (err) {
        console.info(TAG + " fail");
        expect(err.code).assertEqual(401);
        done()
      }
    })

    /**
     * @tc.number  Sub_Notification_Ans_Notification_1036
     * @tc.name    Sub_Notification_Ans_Notification_1036
     * @tc.desc    test null of NotificationManager.cancel
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('Sub_Notification_Ans_Notification_1036', Level.LEVEL2, async (done: Function) => {
      let TAG: string = "Sub_Notification_Ans_Notification_1036"
      // cancel回调
      try {
        await NotificationManager.cancel(null, 'label').then(() => {
          console.info(TAG + `Succeeded in canceling notification.`);
          expect(false).assertTrue();
          done()
        }).catch((err: BusinessError) => {
          console.error(TAG + `Failed to cancel notification. Code is ${err.code}, message is ${err.message}`);
          expect(false).assertTrue();
          done()
        });
      } catch (err) {
        console.info(TAG + " fail");
        expect(err.code).assertEqual(401);
        done()
      }
    })

    /**
     * @tc.number  Sub_Notification_Ans_Notification_1037
     * @tc.name    Sub_Notification_Ans_Notification_1037
     * @tc.desc    test undefined '' of NotificationManager.cancel
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('Sub_Notification_Ans_Notification_1037', Level.LEVEL2, async (done: Function) => {
      let TAG: string = "Sub_Notification_Ans_Notification_1037"
      // cancel回调
      try {
        await NotificationManager.cancel(undefined, '').then(() => {
          console.info(TAG + `Succeeded in canceling notification.`);
          expect(false).assertTrue();
          done()
        }).catch((err: BusinessError) => {
          console.error(TAG + `Failed to cancel notification. Code is ${err.code}, message is ${err.message}`);
          expect(false).assertTrue();
          done()
        });
      } catch (err) {
        console.info(TAG + " fail");
        expect(err.code).assertEqual(401);
        done()
      }
    })

    /**
     * @tc.number  Sub_Notification_Ans_Notification_1038
     * @tc.name    Sub_Notification_Ans_Notification_1038
     * @tc.desc    test undefined '' of NotificationManager.cancel
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('Sub_Notification_Ans_Notification_1038', Level.LEVEL2, async (done: Function) => {
      let TAG: string = "Sub_Notification_Ans_Notification_1038"
      // cancel回调
      let cancelCallback = (err: BusinessError): void => {
        if (err) {
          console.error(TAG + `Failed to cancel notification. Code is ${err.code}, message is ${err.message}`);
          expect(false).assertTrue();
          done()
        } else {
          console.info(TAG + `Succeeded in canceling notification.`);
          expect(false).assertTrue();
          done()
        }
      }
      try {
        NotificationManager.cancel(undefined, '', cancelCallback);
      } catch (err) {
        console.info(TAG + " fail");
        expect(err.code).assertEqual(401);
        done()
      }
    })

    /**
     * @tc.number  Sub_Notification_Ans_Notification_1039
     * @tc.name    Sub_Notification_Ans_Notification_1039
     * @tc.desc    test null 'label' of NotificationManager.cancel
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('Sub_Notification_Ans_Notification_1039', Level.LEVEL2, async (done: Function) => {
      let TAG: string = "Sub_Notification_Ans_Notification_1039"
      // cancel回调
      let cancelCallback = (err: BusinessError): void => {
        if (err) {
          console.error(TAG + `Failed to cancel notification. Code is ${err.code}, message is ${err.message}`);
          expect(false).assertTrue();
          done()
        } else {
          console.info(TAG + `Succeeded in canceling notification.`);
          expect(false).assertTrue();
          done()
        }
      }
      try {
        NotificationManager.cancel(null, 'label', cancelCallback);
      } catch (err) {
        console.info(TAG + " fail");
        expect(err.code).assertEqual(401);
        done()
      }
    })

    /**
     * @tc.number  Sub_Notification_Ans_Notification_1040
     * @tc.name    Sub_Notification_Ans_Notification_1040
     * @tc.desc    test LIVE_VIEW of NotificationSlot
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('Sub_Notification_Ans_Notification_1040', Level.LEVEL2, async (done: Function) => {
      let TAG: string = "Sub_Notification_Ans_Notification_1040"
      console.info('Sub_Notification_Ans_Notification_1040 START');

      let count = 0
      NotificationManager.addSlot(NotificationManager.SlotType.LIVE_VIEW, (err) => {
        if (err) {
          console.info(TAG + `addSlot SOCIAL_COMMUNICATION err: + ${err.code}`);
          expect(false).assertTrue();
          done();
        } else {
          console.info(TAG + `addSlot SOCIAL_COMMUNICATION success`);
          count++
          expect(count).assertEqual(1)
          NotificationManager.getSlot(NotificationManager.SlotType.LIVE_VIEW, (err, NotificationSlot) => {
            if (err) {
              console.info(`${TAG} getSlot AsyncCallback err: ${err.code}`);
              expect(false).assertTrue();
              done();
            } else {
              console.info(`${TAG} getSlot AsyncCallback success`);
              expect(NotificationSlot.notificationType).assertEqual(4)
              console.info(TAG + 'Acts_NotificationSlot_0100 END');
              done();
            }
          })
        }
      })
    })

    /**
     * @tc.number  Sub_Notification_Ans_Notification_1041
     * @tc.name    Sub_Notification_Ans_Notification_1041
     * @tc.desc    test CUSTOMER_SERVICE of NotificationSlot
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('Sub_Notification_Ans_Notification_1041', Level.LEVEL2, async (done: Function) => {
      let TAG: string = "Sub_Notification_Ans_Notification_1041"
      console.info('Sub_Notification_Ans_Notification_1040 START');

      let count = 0
      NotificationManager.addSlot(NotificationManager.SlotType.CUSTOMER_SERVICE, (err) => {
        if (err) {
          console.info(TAG + `addSlot SOCIAL_COMMUNICATION err: + ${err.code}`);
          expect(false).assertTrue();
          done();
        } else {
          console.info(TAG + `addSlot SOCIAL_COMMUNICATION success`);
          count++
          expect(count).assertEqual(1)
          NotificationManager.getSlot(NotificationManager.SlotType.CUSTOMER_SERVICE, (err, NotificationSlot) => {
            if (err) {
              console.info(`${TAG} getSlot AsyncCallback err: ${err.code}`);
              expect(false).assertTrue();
              done();
            } else {
              console.info(`${TAG} getSlot AsyncCallback success`);
              expect(NotificationSlot.notificationType).assertEqual(5)
              console.info(TAG + ' END');
              done();
            }
          })
        }
      })
    })

    /**
     * @tc.number  Sub_Notification_Ans_Notification_1042
     * @tc.name    Sub_Notification_Ans_Notification_1042
     * @tc.desc    test CUSTOMER_SERVICE of NotificationSlot removeSlot
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('Sub_Notification_Ans_Notification_1042', Level.LEVEL2, async (done: Function) => {
      let TAG: string = "Sub_Notification_Ans_Notification_1042"
      console.info('Sub_Notification_Ans_Notification_1040 START');

      let count = 0
      // removeSlot回调
      let removeSlotCallback = (err: BusinessError): void => {
        if (err) {
          console.error(TAG + `Failed to remove slot. Code is ${err.code}, message is ${err.message}`);
          expect(false).assertTrue();
          done();
        } else {
          console.info(TAG + `Succeeded in removing slot.`);
          count++
          expect(count).assertEqual(1)
          done()
        }
      }
      let slotType = NotificationManager.SlotType.CUSTOMER_SERVICE;
      NotificationManager.removeSlot(slotType, removeSlotCallback);
    })

    /**
     * @tc.number  Sub_Notification_Ans_Notification_1043
     * @tc.name    Sub_Notification_Ans_Notification_1043
     * @tc.desc    test LIVE_VIEW of NotificationSlot removeSlot
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('Sub_Notification_Ans_Notification_1043', Level.LEVEL2, async (done: Function) => {
      let TAG: string = "Sub_Notification_Ans_Notification_1043"
      console.info('Sub_Notification_Ans_Notification_1040 START');

      let count = 0
      // removeSlot回调
      let removeSlotCallback = (err: BusinessError): void => {
        if (err) {
          console.error(TAG + `Failed to remove slot. Code is ${err.code}, message is ${err.message}`);
          expect(false).assertTrue();
          done();
        } else {
          console.info(TAG + `Succeeded in removing slot.`);
          count++
          expect(count).assertEqual(1)
          done()
        }
      }
      let slotType = NotificationManager.SlotType.LIVE_VIEW;
      NotificationManager.removeSlot(slotType, removeSlotCallback);
    })

    /**
     * @tc.number  Sub_Notification_Ans_Notification_1044
     * @tc.name    Sub_Notification_Ans_Notification_1044
     * @tc.desc    test LIVE_VIEW of NotificationSlot
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('Sub_Notification_Ans_Notification_1044', Level.LEVEL2, async (done: Function) => {
      let TAG: string = "Sub_Notification_Ans_Notification_1044"
      let count = 0
      await NotificationManager.addSlot(NotificationManager.SlotType.LIVE_VIEW).then(() => {
        console.info(`${TAG} addSlot_21 success`)
        count++
        expect(count).assertEqual(1)
      }).catch((err: Base.BusinessError) => {
        console.info(`${TAG} addSlot_21 err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      try {
        await NotificationManager.getSlot(NotificationManager.SlotType.LIVE_VIEW).then((NotificationSlot) => {
          console.info(`${TAG} getSlot_50 Promise success`)
          expect(NotificationSlot.notificationType).assertEqual(4)
          done()
        }).catch((err: Base.BusinessError) => {
          console.info(`${TAG} getSlot_50 Promise errCode: ${err.code}, errMes: ${err.message}`)
          expect(false).assertTrue()
          done()
        })
      } catch (err) {
        console.info(`${TAG} getSlot_21 errCode: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
    })

    /**
     * @tc.number  Sub_Notification_Ans_Notification_1045
     * @tc.name    Sub_Notification_Ans_Notification_1045
     * @tc.desc    test CUSTOMER_SERVICE of NotificationSlot
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('Sub_Notification_Ans_Notification_1045', Level.LEVEL2, async (done: Function) => {
      let TAG: string = "Sub_Notification_Ans_Notification_1045"
      let count = 0
      await NotificationManager.addSlot(NotificationManager.SlotType.CUSTOMER_SERVICE).then(() => {
        console.info(`${TAG} addSlot_21 success`)
        count++
        expect(count).assertEqual(1)
      }).catch((err: Base.BusinessError) => {
        console.info(`${TAG} addSlot_21 err: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      })

      try {
        await NotificationManager.getSlot(NotificationManager.SlotType.CUSTOMER_SERVICE).then((NotificationSlot) => {
          console.info(`${TAG} getSlot_50 Promise success`)
          expect(NotificationSlot.notificationType).assertEqual(5)
          done()
        }).catch((err: Base.BusinessError) => {
          console.info(`${TAG} getSlot_50 Promise errCode: ${err.code}, errMes: ${err.message}`)
          expect(false).assertTrue()
          done()
        })
      } catch (err) {
        console.info(`${TAG} getSlot_21 errCode: ${err}, errMes: ${err.message}`)
        expect(false).assertTrue()
        done()
      }
    })

    /**
     * @tc.number  Sub_Notification_Ans_Notification_1046
     * @tc.name    Sub_Notification_Ans_Notification_1046
     * @tc.desc    test CUSTOMER_SERVICE of NotificationSlot removeSlot
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('Sub_Notification_Ans_Notification_1046', Level.LEVEL2, async (done: Function) => {
      let TAG: string = "Sub_Notification_Ans_Notification_1046"
      let count = 0
      let slotType: NotificationManager.SlotType = NotificationManager.SlotType.CUSTOMER_SERVICE;
      await NotificationManager.removeSlot(slotType).then(() => {
        count++
        expect(count).assertEqual(1)
        console.info(TAG + `Succeeded in removing slot.`);
        done()
      }).catch((err: BusinessError) => {
        console.error(TAG + `Failed to remove slot. Code is ${err.code}, message is ${err.message}`);
        expect(false).assertTrue()
        done()
      });
    })

    /**
     * @tc.number  Sub_Notification_Ans_Notification_1047
     * @tc.name    Sub_Notification_Ans_Notification_1047
     * @tc.desc    test LIVE_VIEW of NotificationSlot removeSlot
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('Sub_Notification_Ans_Notification_1047', Level.LEVEL2, async (done: Function) => {
      let TAG: string = "Sub_Notification_Ans_Notification_1047"
      let count = 0
      let slotType: NotificationManager.SlotType = NotificationManager.SlotType.LIVE_VIEW;
      await NotificationManager.removeSlot(slotType).then(() => {
        count++
        expect(count).assertEqual(1)
        console.info(TAG + `Succeeded in removing slot.`);
        done()
      }).catch((err: BusinessError) => {
        console.error(TAG + `Failed to remove slot. Code is ${err.code}, message is ${err.message}`);
        expect(false).assertTrue()
        done()
      });
    })

    /**
     * @tc.number  Sub_Notification_Ans_Notification_1048
     * @tc.name    Sub_Notification_Ans_Notification_1048
     * @tc.desc    test '' of  cancelGroup
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('Sub_Notification_Ans_Notification_1048', Level.LEVEL2, async (done: Function) => {
      let TAG: string = "Sub_Notification_Ans_Notification_1048"
      let cancelGroupCallback = (err: BusinessError): void => {
        if (err) {
          console.error(TAG + `Failed to cancel group. Code is ${err.code}, message is ${err.message}`);
          expect(err.code).assertEqual(401)
          done()
        } else {
          console.info(TAG + `Succeeded in canceling group.`);
          expect(false).assertTrue()
          done()
        }
      }
      try {
        NotificationManager.cancelGroup('', cancelGroupCallback);
      } catch (err) {
        console.error(TAG + `Failed to remove slot. Code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(401)
        done()
      }
    })

    /**
     * @tc.number  Sub_Notification_Ans_Notification_1049
     * @tc.name    Sub_Notification_Ans_Notification_1049
     * @tc.desc    test null of  cancelGroup
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('Sub_Notification_Ans_Notification_1049', Level.LEVEL2, async (done: Function) => {
      let TAG: string = "Sub_Notification_Ans_Notification_1049"
      let cancelGroupCallback = (err: BusinessError): void => {
        if (err) {
          console.error(TAG + `Failed to cancel group. Code is ${err.code}, message is ${err.message}`);
          expect(err.code).assertEqual(401)
          done()
        } else {
          console.info(TAG + `Succeeded in canceling group.`);
          expect(false).assertTrue()
          done()
        }
      }
      try {
        NotificationManager.cancelGroup(null, cancelGroupCallback);
      } catch (err) {
        console.error(TAG + `Failed to remove slot. Code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(401)
        done()
      }
    })

    /**
     * @tc.number  Sub_Notification_Ans_Notification_1050
     * @tc.name    Sub_Notification_Ans_Notification_1050
     * @tc.desc    test undefiend of  cancelGroup
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('Sub_Notification_Ans_Notification_1050', Level.LEVEL2, async (done: Function) => {
      let TAG: string = "Sub_Notification_Ans_Notification_1050"
      let cancelGroupCallback = (err: BusinessError): void => {
        if (err) {
          console.error(TAG + `Failed to cancel group. Code is ${err.code}, message is ${err.message}`);
          expect(err.code).assertEqual(401)
          done()
        } else {
          console.info(TAG + `Succeeded in canceling group.`);
          expect(false).assertTrue()
          done()
        }
      }
      try {
        NotificationManager.cancelGroup(undefined, cancelGroupCallback);
      } catch (err) {
        console.error(TAG + `Failed to remove slot. Code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(401)
        done()
      }
    })

    /**
     * @tc.number  Sub_Notification_Ans_Notification_1051
     * @tc.name    Sub_Notification_Ans_Notification_1051
     * @tc.desc    test '' of  cancelGroup
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('Sub_Notification_Ans_Notification_1051', Level.LEVEL2, async (done: Function) => {
      let TAG: string = "Sub_Notification_Ans_Notification_1051"

      try {
        await NotificationManager.cancelGroup('').then(() => {
          console.info(TAG + `Succeeded in canceling group.`);
          expect(false).assertTrue()
          done()
        }).catch((err: BusinessError) => {
          console.error(TAG + `Failed to cancel group. Code is ${err.code}, message is ${err.message}`);
          expect(err.code).assertEqual(401)
          done()
        });
      } catch (err) {
        console.error(TAG + `Failed to remove slot. Code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(401)
        done()
      }
    })

    /**
     * @tc.number  Sub_Notification_Ans_Notification_1052
     * @tc.name    Sub_Notification_Ans_Notification_1052
     * @tc.desc    test null of  cancelGroup
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('Sub_Notification_Ans_Notification_1052', Level.LEVEL2, async (done: Function) => {
      let TAG: string = "Sub_Notification_Ans_Notification_1052"

      try {
        await NotificationManager.cancelGroup(null).then(() => {
          console.info(TAG + `Succeeded in canceling group.`);
          expect(false).assertTrue()
          done()
        }).catch((err: BusinessError) => {
          console.error(TAG + `Failed to cancel group. Code is ${err.code}, message is ${err.message}`);
          expect(err.code).assertEqual(401)
          done()
        });
      } catch (err) {
        console.error(TAG + `Failed to remove slot. Code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(401)
        done()
      }
    })

    /**
     * @tc.number  Sub_Notification_Ans_Notification_1053
     * @tc.name    Sub_Notification_Ans_Notification_1053
     * @tc.desc    test undefined of  cancelGroup
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('Sub_Notification_Ans_Notification_1053', Level.LEVEL2, async (done: Function) => {
      let TAG: string = "Sub_Notification_Ans_Notification_1053"
      try {
        await NotificationManager.cancelGroup(undefined).then(() => {
          console.info(TAG + `Succeeded in canceling group.`);
          expect(false).assertTrue()
          done()
        }).catch((err: BusinessError) => {
          console.error(TAG + `Failed to cancel group. Code is ${err.code}, message is ${err.message}`);
          expect(err.code).assertEqual(401)
          done()
        });
      } catch (err) {
        console.error(TAG + `Failed to remove slot. Code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(401)
        done()
      }
    })

    /**
     * @tc.number  Sub_Notification_Ans_Notification_1054
     * @tc.name    Sub_Notification_Ans_Notification_1054
     * @tc.desc    test null of  setBadgeNumber
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('Sub_Notification_Ans_Notification_1054', Level.LEVEL2, async (done: Function) => {
      let TAG: string = "Sub_Notification_Ans_Notification_1054"

      let setBadgeNumberCallback = (err: BusinessError): void => {
        if (err) {
          console.error(TAG + `Failed to set badge number. Code is ${err.code}, message is ${err.message}`);
          if(err.code == 801){
            expect(err.code).assertEqual(801)
            done()
          }else{
            expect(err.code).assertEqual(401)
            done()
          }
        } else {
          console.info(TAG + `Succeeded in setting badge number.`);
          expect(false).assertTrue()
          done()
        }
      }
      try {
        NotificationManager.setBadgeNumber(null, setBadgeNumberCallback);
      } catch (err) {
        console.error(TAG + `Failed to remove slot. Code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(401)
        done()
      }
    })

    /**
     * @tc.number  Sub_Notification_Ans_Notification_1055
     * @tc.name    Sub_Notification_Ans_Notification_1055
     * @tc.desc    test undefined of  setBadgeNumber
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('Sub_Notification_Ans_Notification_1055', Level.LEVEL2, async (done: Function) => {
      let TAG: string = "Sub_Notification_Ans_Notification_1055"

      let setBadgeNumberCallback = (err: BusinessError): void => {
        if (err) {
          console.error(TAG + `Failed to set badge number. Code is ${err.code}, message is ${err.message}`);
          if(err.code == 801){
            expect(err.code).assertEqual(801)
            done()
          }else{
            expect(err.code).assertEqual(401)
            done()
          }
        } else {
          console.info(TAG + `Succeeded in setting badge number.`);
          expect(false).assertTrue()
          done()
        }
      }
      try {
        NotificationManager.setBadgeNumber(undefined, setBadgeNumberCallback);
      } catch (err) {
        console.error(TAG + `Failed to remove slot. Code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(401)
        done()
      }
    })

    /**
     * @tc.number  Sub_Notification_Ans_Notification_1056
     * @tc.name    Sub_Notification_Ans_Notification_1056
     * @tc.desc    test null of  setBadgeNumber
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('Sub_Notification_Ans_Notification_1056', Level.LEVEL2, async (done: Function) => {
      let TAG: string = "Sub_Notification_Ans_Notification_1056"

      try {
        await NotificationManager.setBadgeNumber(null).then(() => {
          console.info(TAG + `Succeeded in setting badge number.`);
          expect(false).assertTrue()
          done()
        }).catch((err: BusinessError) => {
          console.error(TAG + `Failed to set badge number. Code is ${err.code}, message is ${err.message}`);
          if(err.code == 801){
            expect(err.code).assertEqual(801)
            done()
          }else{
            expect(err.code).assertEqual(401)
            done()
          }
        });
      } catch (err) {
        console.error(TAG + `Failed to remove slot. Code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(401)
        done()
      }
    })

    /**
     * @tc.number  Sub_Notification_Ans_Notification_1057
     * @tc.name    Sub_Notification_Ans_Notification_1057
     * @tc.desc    test undefined of  setBadgeNumber
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('Sub_Notification_Ans_Notification_1057', Level.LEVEL2, async (done: Function) => {
      let TAG: string = "Sub_Notification_Ans_Notification_1057"

      try {
        await NotificationManager.setBadgeNumber(undefined).then(() => {
          console.info(TAG + `Succeeded in setting badge number.`);
          expect(false).assertTrue()
          done()
        }).catch((err: BusinessError) => {
          console.error(TAG + `Failed to set badge number. Code is ${err.code}, message is ${err.message}`);
          if(err.code == 801){
            expect(err.code).assertEqual(801)
            done()
          }else{
            expect(err.code).assertEqual(401)
            done()
          }
        });
      } catch (err) {
        console.error(TAG + `Failed to remove slot. Code is ${err.code}, message is ${err.message}`);
        expect(err.code).assertEqual(401)
        done()
      }
    })

    /**
     * @tc.number  Sub_Notification_Ans_Notification_1058
     * @tc.name    Sub_Notification_Ans_Notification_1058
     * @tc.desc    test null of  openNotificationSettings
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('Sub_Notification_Ans_Notification_1058', Level.LEVEL2, async (done: () => void) => {
      let TAG = 'Sub_Notification_Ans_Notification_1058'
      await NotificationManager.openNotificationSettings(null).then(() => {
        console.info(TAG + `openNotificationSettings succeeded`);
        done()
      }).catch((err: BusinessError) => {
        console.info(TAG + `openNotificationSettings err: JSON.stringify(err)`);
        if (err.code == 801) {
          expect(err.code).assertEqual(801)
          done();
        } else {
          expect().assertFail();
          done();
        }
      })

    });

    /**
     * @tc.number  Sub_Notification_Ans_Notification_1059
     * @tc.name    Sub_Notification_Ans_Notification_1059
     * @tc.desc    test undefined of  openNotificationSettings
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('Sub_Notification_Ans_Notification_1059', Level.LEVEL2, async (done: () => void) => {
      let TAG = 'Sub_Notification_Ans_Notification_1059'
      await NotificationManager.openNotificationSettings(undefined).then(() => {
        console.info(TAG + `openNotificationSettings succeeded`);
        done()
      }).catch((err: BusinessError) => {
        console.info(TAG + `openNotificationSettings err: JSON.stringify(err)`);
        if (err.code == 801) {
          expect(err.code).assertEqual(801)
          done();
        } else {
          expect().assertFail();
          done();
        }
      })
    });

    /**
     * @tc.number  SUB_Notification_CES_CommonEvent_0100
     * @tc.name    SUB_Notification_CES_CommonEvent_0100
     * @tc.desc    test string 256 of publish
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('SUB_Notification_CES_CommonEvent_0100', Level.LEVEL2, async (done: Function) => {
      let TAG: string = "SUB_Notification_CES_CommonEvent_0100"
      let count = 0
      let event = 'T'.repeat(256)
      try {
        //发布公共事件
        let publishCB = (err: BusinessError) => {
          if (err) {
            console.error(TAG + `publish failed, code is ${err.code}`);
            expect(err).assertEqual(null);
            done()
          } else {
            console.info(TAG + "publish success");
            count++
            expect(count).assertEqual(1);
            done()
          }
        }
        CommonEventManager.publish(event,
          publishCB);
      } catch (error) {
        console.info(TAG + " fail");
        expect(false).assertTrue();
        done()
      }
    })

    /**
     * @tc.number  SUB_Notification_CES_CommonEvent_0200
     * @tc.name    SUB_Notification_CES_CommonEvent_0200
     * @tc.desc    test string 1 of publish
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('SUB_Notification_CES_CommonEvent_0200', Level.LEVEL2, async (done: Function) => {
      let TAG: string = "SUB_Notification_CES_CommonEvent_0200"
      let count = 0
      try {
        //发布公共事件
        let publishCB = (err: BusinessError) => {
          if (err) {
            console.error(TAG + `publish failed, code is ${err.code}`);
            expect(err.code).assertEqual(1);
            done()
          } else {
            console.info(TAG + "publish success");
            count++
            expect(count).assertEqual(1);
            done()
          }
        }
        CommonEventManager.publish('a',publishCB);
      } catch (error) {
        console.info(TAG + " fail");
        expect(false).assertTrue();
        done()
      }
    })

    /**
     * @tc.number  SUB_Notification_CES_CommonEvent_0300
     * @tc.name    SUB_Notification_CES_CommonEvent_0300
     * @tc.desc    test string 256 +1 of publish
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('SUB_Notification_CES_CommonEvent_0300', Level.LEVEL2, async (done: Function) => {
      let TAG: string = "SUB_Notification_CES_CommonEvent_0300"
      let count = 0
      let event = 'T'.repeat(257)
      try {
        //发布公共事件
        let publishCB = (err: BusinessError) => {
          if (err) {
            console.error(TAG + `publish failed, code is ${err.code}`);
            expect(err.code).assertEqual(1);
            done()
          } else {
            console.info(TAG + "publish success");
            count++
            expect(count).assertEqual(1);
            done()
          }
        }
        CommonEventManager.publish(event,
          publishCB);
      } catch (error) {
        console.info(TAG + " fail");
        expect(false).assertTrue();
        done()
      }
    })

  })
}
