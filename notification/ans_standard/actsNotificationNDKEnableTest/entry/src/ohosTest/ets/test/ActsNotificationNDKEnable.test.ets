import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, it, expect, Level } from '@ohos/hypium';
import { IsNotificationEnabled } from "libenable.so"
import common from '@ohos.app.ability.common';
import notificationManager from '@ohos.notificationManager';
import { Driver, ON } from '@ohos.UiTest';

function sleep(time: number) {
  return new Promise<void>((resolve: Function) => setTimeout(resolve, time));
}

let ctx = getContext(this) as common.UIAbilityContext;

export default function ActsNotificationNDKEnableTest() {
  describe('ActsNotificationNDKEnableTest', () => {

    /*
     * @tc.number    : ACTS_Notification_Ans_enableVerification_0010
     * @tc.name      : OH_Notification_IsNotificationEnabled Interface verification.
     * @tc.desc      : OH_Notification_IsNotificationEnabled Interface verification.
     * @tc.size      : Medium-sized Test
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it('ACTS_Notification_Ans_enableVerification_0010', Level.LEVEL2,async (done: Function) => {
      try {
        let result = IsNotificationEnabled();
        hilog.info(0x0000, 'testTag',`IsNotificationEnabled value is : ${result}`);
        expect(result).assertEqual(false)
        await sleep(500)

        notificationManager.requestEnableNotification(ctx).then(() => {
          hilog.info(0x0000, 'testTag',`requestEnableNotification succeeded`);
          let result1 = IsNotificationEnabled();
          hilog.info(0x0000, 'testTag',`IsNotificationEnabled value is : ${result1}`);
          expect(result1).assertEqual(true)
          done()
        }).catch((err: Error) => {
          hilog.info(0x0000, 'testTag',`requestEnableNotification err: JSON.stringify(err)`);
        });
        await sleep(1000)
        let driver = Driver.create();
        await sleep(1000)
        let button = await driver.findComponent(ON.text('允许'));
        hilog.info(0x0000, 'testTag', `button is ${JSON.stringify(button)}`);
        if (button !== null) {
          await sleep(1000);
          await button.click();
        } else {
          hilog.info(0x0000, 'testTag', 'null button');
        }
      } catch (err) {
        hilog.info(0x0000, 'testTag',"IsNotificationEnabled Execution Failed")
        expect(false).assertEqual(true)
        done()
      }
    })
  })
}