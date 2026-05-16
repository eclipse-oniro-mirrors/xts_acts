import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import notificationManager from '@ohos.notificationManager';
import { common } from '@kit.AbilityKit';
import { Driver, ON } from '@kit.TestKit';

let ctx = getContext(this) as common.UIAbilityContext;
let TAG: string = 'Notification';
function sleep(time: number) {
  return new Promise<void>((resolve: Function) => setTimeout(resolve, time));
}
export default function actsNotificationPriorityTest() {
  describe('actsNotificationPriorityTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async (done: Function) => {

      let driver = Driver.create();
      notificationManager.requestEnableNotification(ctx).then(() => {
        console.info(`${TAG} requestEnableNotification succeeded`);
      }).catch((err: Error) => {
        console.info(`${TAG} requestEnableNotification err: `+ JSON.stringify(err));
        expect(err).assertNull()
        done()
      });
      await sleep(1500)
      let button = await driver.findComponent(ON.text('允许'));
      console.info(`${TAG} button is ${JSON.stringify(button)}`);
      if (button !== null) {
        await sleep(1000);
        await button.click();
        await sleep(1000);
        done()
      } else {
        console.info('${TAG} null button');
        expect(button).assertContain('允许')
        done()
      }
    })
    
    /**
     * @tc.name   Sub_Notification_Ans_Priority_Notification_0100
     * @tc.number Sub_Notification_Ans_Priority_Notification_0100
     * @tc.desc   test priorityNotificationType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Priority_Notification_0100', Level.LEVEL2, async  (done : Function) => {
      let TAG = "Sub_Notification_Ans_Priority_Notification_0100"
      let notificationRequest: notificationManager.NotificationRequest = {
        id: 7,
        priorityNotificationType: 'OTHER' as notificationManager.PriorityNotificationType,
        content: {
          notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
          normal: {
            title: "test",
            text: "test",
          }
        },
        notificationSlotType: notificationManager.SlotType.SERVICE_INFORMATION
      };

      await notificationManager.publish(notificationRequest).then(() => {
        console.info(`${TAG} publish success`);
      }).catch((err: BusinessError):void => {
        console.error(`${TAG} publish failed, code is ${err.code}, message is ${err.message}`);
        expect(false).assertTrue()
        done()
      });
      await notificationManager.getActiveNotifications()
        .then((data: Array<notificationManager.NotificationRequest>) => {
          console.info(`${TAG} getActiveNotifications Promise success :${JSON.stringify(data)}`)
          expect(data[0].priorityNotificationType).assertEqual("OTHER")
          done()
        })
        .catch((err: BusinessError): void => {
          console.info(`${TAG} getActiveNotifications Promise err: ${err.code}`)
          expect(false).assertTrue()
          done()
        })
    })
  })
}