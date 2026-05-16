import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import notificationManager from '@ohos.notificationManager';
import { common } from '@kit.AbilityKit';
import { Driver, ON } from '@kit.TestKit';
import image from '@ohos.multimedia.image';

let ctx = getContext(this) as common.UIAbilityContext;
let TAG: string = 'Notification';
function sleep(time: number) {
  return new Promise<void>((resolve: Function) => setTimeout(resolve, time));
}
export default function actsNotificationPriorityTest() {
  describe('actsNotificationPriorityTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async (done: Function) => {
      notificationManager.requestEnableNotification((err) => {
        if (err) {
          console.error(TAG+`requestEnableNotification failed, code is ${err.code}, message is ${err.message}`);
          expect(false).assertTrue();
          console.info(TAG + `test case end`);
          done();
        } else {
          console.info(TAG + "requestEnableNotification success");
        }
      });

      await sleep(1500);
      let driver = Driver.create();
      console.log(TAG + `driver is ${JSON.stringify(driver)}`);
      await driver.assertComponentExist(ON.text('允许'));
      let button = await driver.findComponent(ON.text('允许'));
      console.log(TAG + `button is ${JSON.stringify(button)}`);
      if (button !== null) {
        await button.click();
        await sleep(1500);
        done()
      } else {
        console.log(TAG + `button is null`)
        expect(false).assertTrue();
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
      const color = new ArrayBuffer(96);
      let opts: image.InitializationOptions = {
        editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: {
          height: 4, width: 6
        }
      };
      let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
      let notificationRequest: notificationManager.NotificationRequest = {
        id: 7,
        overlayIcon: pixelMap,
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