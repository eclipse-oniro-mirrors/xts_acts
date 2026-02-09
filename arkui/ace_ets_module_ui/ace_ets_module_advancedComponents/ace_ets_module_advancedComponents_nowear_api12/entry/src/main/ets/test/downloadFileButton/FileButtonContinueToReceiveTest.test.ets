import { describe,  beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function FileButtonContinueToReceiveTest() {

  describe('FileButtonContinueToReceiveTest', () => {
    beforeEach(async (done: Function) => {
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
     * @tc.name   FileButtonContinueToReceiveTest_0100
     * @tc.number FileButtonContinueToReceiveTest
     * @tc.desc   Test FileButtonContinueToReceiveTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('FileButtonContinueToReceiveTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
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