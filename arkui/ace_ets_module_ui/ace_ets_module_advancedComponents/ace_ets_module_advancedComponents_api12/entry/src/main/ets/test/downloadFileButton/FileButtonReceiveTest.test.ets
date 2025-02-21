import { describe, beforeEach, afterEach, it, expect } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';


export default function FileButtonReceiveTest() {

  describe('FileButtonReceiveTest', () => {
    beforeEach(async (done: function) => {
      console.info('FileButtonReceiveTest beforeEach start');
      try {
        router.clear();
        let pages = router.getState();
        if (!("FileButtonReceive" == pages.name)) {
          await router.push({
            url: 'MainAbility/pages/downloadFileButton/FileButtonReceive',
          });
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push FileButtonReceive page error: ' + err);
      }
      console.info('FileButtonReceiveTest beforeEach end');
      done();
    });

    afterEach(async () => {
      console.info('FileButtonReceiveTest after each called');
    })

    /**
     * @tc.number FileButtonReceiveTest
     * @tc.name FileButtonReceiveTest_0100
     * @tc.desc Test FileButtonReceiveTest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('FileButtonReceiveTest_0100', 0, async (done: function) => {
      console.info('[FileButtonReceiveTest] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      let title = await driver.findComponent(ON.text('接收'));
      expect(title !== null).assertTrue();
      await driver.delayMs(1000);
      console.info('[FileButtonReceiveTest] END');
      done();
    });
  })

}