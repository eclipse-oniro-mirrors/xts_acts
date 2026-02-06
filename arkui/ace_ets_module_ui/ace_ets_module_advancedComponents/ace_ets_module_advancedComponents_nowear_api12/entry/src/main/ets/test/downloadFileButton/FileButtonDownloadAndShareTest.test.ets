import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';


export default function FileButtonDownloadAndShareTest() {
  describe('FileButtonDownloadAndShareTest', () => {
    beforeEach(async (done: Function) => {
      console.info('FileButtonDownloadAndShareTest beforeEach start');
      try {
        router.clear();
        let pages = router.getState();
        if (!("FileButtonDownloadAndShare" == pages.name)) {
          await router.push({
            url: 'MainAbility/pages/downloadFileButton/FileButtonDownloadAndShare',
          });
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push FileButtonDownloadAndShare page error: ' + err);
      }
      console.info('FileButtonDownloadAndShareTest beforeEach end');
      done();
    });
    afterEach(async () => {
      console.info('FileButtonDownloadAndShareTest after each called');
    })
    /**
     * @tc.number FileButtonDownloadAndShareTest
     * @tc.name FileButtonDownloadAndShareTest_0100
     * @tc.desc Test FileButtonDownloadAndShareTest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('FileButtonDownloadAndShareTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      console.info('[FileButtonDownloadAndShareTest] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      let title = await driver.findComponent(ON.text('下载分享'));
      expect(title !== null).assertTrue();
      await driver.delayMs(1000);
      console.info('[FileButtonDownloadAndShareTest] END');
      done();
    });
  })
}