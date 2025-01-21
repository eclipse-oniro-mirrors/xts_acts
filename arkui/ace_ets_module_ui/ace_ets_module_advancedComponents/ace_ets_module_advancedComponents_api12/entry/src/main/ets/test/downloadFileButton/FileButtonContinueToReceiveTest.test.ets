import { describe,  beforeEach, afterEach, it, expect } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';

export default function FileButtonContinueToReceiveTest() {

  describe('FileButtonContinueToReceiveTest', () => {
    beforeEach(async (done: function) => {
      try {
        router.clear();
        let pages = router.getState();
        if (!("FileButtonContinueToReceive" == pages.name)) {
          await router.push({
            url: 'MainAbility/pages/downloadFileButton/FileButtonContinueToReceive',
          });
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push FileButtonContinueToReceive page error: ' + err);
      }
      console.info('FileButtonContinueToReceiveTest beforeEach end');
      done();
    });

    afterEach(async () => {
      console.info('FileButtonContinueToReceiveTest after each called');
    })

    /**
     * @tc.number FileButtonContinueToReceiveTest
     * @tc.name   FileButtonContinueToReceiveTest_0100
     * @tc.desc   Test FileButtonContinueToReceiveTest
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('FileButtonContinueToReceiveTest_0100', 0, async (done: function) => {
      console.info('[FileButtonContinueToReceiveTest] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      let title = await driver.findComponent(ON.text('继续接收'));
      expect(title !== null).assertTrue();
      await driver.delayMs(1000);
      console.info('[FileButtonContinueToReceiveTest] END');
      done();
    });
  })

}